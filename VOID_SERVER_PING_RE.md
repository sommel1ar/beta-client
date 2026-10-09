# VOID_SERVER_PING_RE — status de servidores (MOTD/players/online) MCPE 0.15.10

RE confirmado por disassembly (subagente 2026-10-06). file-VA; chamável = `(g_slide+VA)|1`; tudo na thread do jogo.

O pinger é `RakNetServerLocator` (impl de `ServerLocator`). Resultado por servidor = struct `PingedCompatibleServer` (0x40 bytes) num `std::vector` DENTRO do locator. NÃO existe `ServerListPinger`/`PingResult` na 0.15.

## Pegar o locator a partir de g_mc
- `game = *(void**)(g_mc + 0x50)` (MinecraftClient::getServer @0x6c1c90; checar != NULL, existe no menu)
- `nh = *(void**)(game + 0x4c)` (Minecraft::getNetworkHandler)
- `loc = *(void**)(nh + 0x8)` (NetworkHandler::getServerLocator)
- OU direto: `Minecraft::getServerLocator @0xda277c` (r0=game -> RakNetServerLocator*)

## Funções (VA / ABI)
- `findServers(loc, int port) @0xab824c` — liga a busca: `isFinding(loc+0x18)=1` + `activate()` (cria RakPeerInterface em loc+0x8) + broadcast LAN. Chamar 1x ao abrir a tela. port=19132.
- `addCustomServer(loc, std::string const* addr, int port) @0xab85e4` — **PING dirigido de servidor externo** (r1=&addr gnustl, r2=port u16). Manda 1 ping só. **Re-chamar por servidor a cada ~1-2s** p/ atualizar (update() só re-broadcasta LAN, não os custom).
- `update(loc) @0xab736c` — drena pongs -> `handleUnconnectedPong` parseia -> preenche/atualiza o vetor; prune de 5s (remove entrada com `GetTimeMS()-entry[0x28] >= 5001`). Chamar por frame (seguro mesmo que o engine tbm ticke — mesmo vetor, cada pong consumido 1x).
- `stopFindingServers(loc) @0xab8604` — isFinding=0, derruba peer. Chamar ao fechar a tela.
- `clearServerList(loc) @0xab865c` — zera o vetor.
- `GetTimeMS @0x5ba858` (ms), `SystemAddress::ToString(entry+0x14, writePort=true, sep=':') @0x5a76dc` (buffer 0x7c -> "ip:port").

## Vetor de resultados (dentro do locator)
- `loc+0x08` RakPeerInterface* (mPeer)
- `loc+0x0c` PingedCompatibleServer* start   <- iterar start..finish, stride **0x40**
- `loc+0x10` PingedCompatibleServer* finish
- `loc+0x14` end_cap
- `loc+0x18` u8 isFinding
- `loc+0x1c` u16 broadcastPort

## PingedCompatibleServer (0x40 bytes)
- `+0x00` gnustl std::string **MOTD/descrição** (token[1] do pong)
- `+0x04` int protocol (atoi token[2])
- `+0x08` gnustl std::string **version** (token[3], ex "0.15.10")
- `+0x0c` int **players online** (atoi token[4])
- `+0x10` int **max players** (atoi token[5]; -1 se ausente)
- `+0x14` RakNet::SystemAddress (POD) — IP+porta resolvido (chave de match)
- `+0x28` int timestamp ms do último pong (staleness; NÃO é RTT)
- `+0x2c..` resto POD (SystemAddress/GUID). SÓ 2 strings por elem (+0x00, +0x08).

Pong MCPE = `MCPE;motd;protocol;version;players;max;serverId;...` (split por `;`).

## Como usar (overlay, thread do jogo)
1. Abrir tela servidores: `findServers(loc,19132)` 1x; depois `addCustomServer(loc, &es.addr@+0x28, es.port@+0xc)` por ExternalServer (iterar hashtable file+0x8).
2. Por frame: `update(loc)` + reler o vetor (loc+0xc..loc+0x10, stride 0x40): motd=str_data(e+0x00), players=*(int*)(e+0x0c), max=*(int*)(e+0x10), version=str_data(e+0x08). **online** = entrada existe E fresca (`GetTimeMS()-*(int*)(e+0x28) < 5000`); sem entrada = offline/pendente.
3. Re-ping a cada 1-2s (re-chamar addCustomServer por servidor) senão pisca offline (prune 5s).
4. Fechar tela: `stopFindingServers(loc)`.
5. Match externo<->ping: `SystemAddress::ToString(e+0x14)` -> "ip:port" vs host:port do ExternalServer. Se o ExternalServer for hostname (não IP), serializar (clearServerList -> addCustomServer 1 -> ler a única entrada).

## PING/latência = ADIÇÃO NOSSA (não nativo)
Allan confirmou: vanilla NÃO mostra ping. `+0x28` é timestamp absoluto, não RTT. Pra mostrar ping: gravar `t0=GetTimeMS()` ao chamar addCustomServer, `ping=GetTimeMS()-t0` quando a entrada correspondente aparecer. Deixar CLARO na UI que é extra do Void Client.

## Símbolos extra
- `NetworkWorldInfo ctor(PingedCompatibleServer&) @0x83e8f4` (como a vanilla lê os campos)
- `PlayScreenModel::areExternalAndRemoteServerSame @0x8431d4` (match vanilla)
- `PlayScreenModel::_populateNetworkWorlds @0x8407f0` (cola vanilla: lê getServerList + casa externos)
- `RakPeer::Ping(char*,u16,bool,u32) @0x11c3b28`
- `ExternalServer::getIP @ _ZNK14ExternalServer5getIPEv` (throw se não resolvido — evitar), `getPort` impl @0x6bcb58, `resolve @0x6bc65c`

## RTT REAL via timestamp ecoado (RE 2026-10-06, confiança alta)
Minha medição por-tick dá ruído (49-250ms p/ servidor de 5ms) porque inclui agendamento das threads RakNet. O RTT verdadeiro vem do timestamp que o RakNet ecoa no ping/pong.
- `RakNetServerLocator::handleUnconnectedPong @0xab7574` (ABI: r0=this, r1=`std::string const&` MOTD, r2=`RakNet::Packet const*`, r3=bool). Chamado por `update` via PLT `0x5ba990`→GOT `0x168e290`.
- **Packet**: `data = *(uint8_t**)(pkt+0x30)`, `length = *(uint32_t*)(pkt+0x28)`.
- **Pong layout**: `[0]=0x1c | [1..8]=sendPingTime ecoado (RakNet::Time 64-bit ms, LE) | [9..16]=GUID | [17..32]=magic | RakString MOTD`. Enviado em `RakPeer::Ping@0x11c3b28` (9 bytes: 1 ID + 8 tempo).
- **O jogo DESCARTA** o sendPingTime; `PingedCompatibleServer+0x28` = `GetTimeMS()` do processamento (prune 5s, `update@0xab74a4` compara com 0x1389=5001ms). NÃO reusar +0x28 pra RTT.
- **`RakNet::GetTimeMS` REAL = `0x11be3f8`** (retorna u32 ms em r0). O `0x5ba858` é stub PLT→GOT `0x168e228`→`0x11be3f8`. (`GetTime`64-bit@0x11be2ec, `GetTimeUS`@0x11be378.)
- **RECEITA**: hook em `0xab7574`; na entrada `rtt_ms = RakNet::GetTimeMS()(0x11be3f8) - *(uint32_t*)(data+1)`. Unidades batem (ms). Como pingo serializado (1 servidor por vez), atribuir o rtt ao `g_pingCur` — sem casar SystemAddress. Guardar num global lido no `vc_ping_tick`. Validar 1x que fica plausível (5-50ms).
