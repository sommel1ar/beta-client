# VOID_JOIN_RE — entrar em servidor externo MCPE 0.15.10 (CONFIRMADO funcionando)

RE + validado no A71 2026-10-06. file-VA; chamável=`(g_slide+VA)|1`; thread do jogo.

## O PROBLEMA
Chamar `MinecraftClient::joinMultiplayer(std::string,int)@0x6cfc30` CRU (direto do nosso menu) crasha:
- Cria o client-instance em `mc+0x120` + `setupClientGame@0x6cfd88`, MAS deixa a sessao meio montada.
- Proximo frame: `MinecraftClient::tickBuildAction@0x6cd74c` le `mc+0x124` (sessao) = lixo nao-nulo -> deref vtable -> SIGSEGV.
- (`startFrame@0x6c9f00` chama tickBuildAction todo frame.)

## A CAUSA
O caminho vanilla de servidor externo NAO chama joinMultiplayer cru. Entra por
`PlayScreenModel::_startExternalNetworkWorld(int)@0x84240c`, que faz, ANTES do join, o setup que falta —
em especial empurrar a **NetworkProgressScreen**, que e a tela que o ClientInstance/NetworkHandler espera no stack
(e deixa `mc+0x124` valido).

## A RECEITA (o que o nosso `vc_connect_index` faz agora)
Com `host`/`port` do ExternalServer e `mc`=g_mc:
```c
if (!*(void**)(mc + 0x18c)) return;                      // estado-future da conexao precisa existir
void* chooser = getScreenChooser(mc);                    // 0x6cc6b4 (retorna ScreenChooser*)
pushNetworkProgressScreen(chooser, &std::string(name));  // 0x873f60  <-- PASSO QUE FALTAVA
joinMultiplayer(mc, &std::string(host), port);           // 0x6cfc30
```
Simbolos:
- `MinecraftClient::getScreenChooser()@0x6cc6b4` (r0=mc -> ScreenChooser*)
- `ScreenChooser::pushNetworkProgressScreen(std::string const&)@0x873f60` (r0=chooser, r1=&name)
- `MinecraftClient::joinMultiplayer(std::string,int)@0x6cfc30` (r0=mc, r1=&host gnustl, r2=port u16)

NAO precisa de `FromStringExplicitPort`/`isNetworkEnabled` no caso comum: joinMultiplayer grava host em `mc+0x90`,
porta em `mc+0x94` e resolve o DNS depois (setupClientGame/thread de conexao). Hostname (ex rivalsmc.xyz:19300) funciona.

## CUIDADOS
- Fechar o locator do ping (`stopFindingServers`) ANTES de conectar: o socket RakNet do ping conflita com a conexao.
- Sair da tela de servidores (g_screen=0) pra nao reabrir o ping durante o join.
- Caminho de MUNDO LOCAL (startLocalServer) nao usa nada disso; so o de SERVIDOR precisa da progress screen.
- `_startExternalNetworkWorld@0x84240c` (le ExternalServer de PSM+0x40, stride 0x60, ExternalServer@+0x1c; mc=PSM+0xc)
  seria a alternativa "chamar a funcao inteira", mas replicar os 2 passos acima e mais simples e ja basta.
