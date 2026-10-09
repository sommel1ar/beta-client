# VOID_CREATE_EDIT_WORLD_RE — criar/editar mundo + dificuldade MCPE 0.15.10

RE confirmado por disassembly (subagente 2026-10-06). file-VA; chamável=`(g_slide+VA)|1`; thread do jogo. std::string = gnustl (1 ptr).

## ACHADO: criar e editar = MESMA classe CreateWorldScreen
- ctor criar: `CreateWorldScreen(MinecraftClient&, CreateWorldScreenType) @0x7eba94`
- ctor EDITAR: `CreateWorldScreen(MinecraftClient&, LevelSummary const&) @0x7ec108` (modo edit = `[this+0x178]==3`)

## (1) DIFICULDADE — NAO existe no criar da 0.15; e Option GLOBAL
- NAO esta em LevelSettings nem LevelData. generateLocalGame/startLocalServer nao tocam dificuldade.
- Fica em `Options+0x88`. `getOptions()@0x6c1554` = `*(client+0x13c)`.
- `Options::setDifficulty(int)@0x928df4` (sem clamp) / `_setDifficulty@0x92943c` (clampa 0..3) / `getDifficulty@0x928dfc`.
- Enum: **0=Peaceful,1=Easy,2=Normal,3=Hard**.
- Mundo novo herda o Options global na construcao -> setar o global ANTES de startLocalServer.
- Mundo VIVO: `ServerLevel::setDifficulty(level,int)@0xb2a6bc` (setter real + broadcast; level=`Minecraft::getLevel()@0xda2274`). `Level::setDifficulty@0xd27a54` base e STUB (nao usar). `Level::getDifficulty@0xd28aec`=`[Level+0x18]`.

## (2) OPCOES do criar vanilla 0.15 (so estas; NAO tem difficulty/cheats/bonus/estruturas - nao existem na 0.15)
LevelSettings (0x34): +0x00 seed(u32), +0x04 gameType, +0x08 u8, +0x0c generator, +0x14 dimensionId, +0x28 spawn(3 ints).
- **Nome** -> name p/ createUniqueLevelID+startLocalServer (vazio="World")
- **Seed** -> LS+0x00 (vazio -> createRandomSeed@0xd22440)
- **Modo** -> LS+0x04 gameType: **0=Survival,1=Creative** (validateGameType@0xd796c8 clampa [0,1])
- **Tipo/gerador** -> LS+0x0c: **0=Old/Legacy(256x256),1=Infinite,2=Flat**
- (advanced "More World Options" = so estado de UI)
- Criar continua como ja temos: createUniqueLevelID@0xd22390 + LevelSettings ctor@0xd794ec + patches (gameType, generator, dimensionId=0, spawn=BlockPos::MIN@0x1708a58) + startLocalServer@0x6c985c.

## (3) EDITAR MUNDO
LevelStorageSource: `game=*(mc+0x50)` (getServer@0x6c1c90); `src=*(game+0x18)` (getLevelSource@0xda2758) = ExternalFileLevelStorageSource (vtable@0x16307cc).
- **LER:** `getLevelData @0xd98e7c` (vtable+0x10), ABI r0=sret LevelData, r1=src, r2=&levelId. levelId = pasta/hash do mundo (do PlayScreenModel/LevelSummary que ja enumero).
- **SALVAR:** `setLevelData @0xd99078` (vtable+0x14), r0=src, r1=&levelId, r2=&LevelData -> grava level.dat.
- Receita: LevelData ld; getLevelData(&ld,src,&levelId); aplica setters; setLevelData(src,&levelId,&ld); destruir ld (dtor NAO-trivial).
- LevelData getters: getLevelName@0xd9e280, getGameType@0xd9e2e4, getSeed@0xd9b748, getGenerator@0xd9e288, getSpawn@0xd9e230, getStopTime@0xd9e238.
- LevelData setters: setLevelName(&string)@0xd9e284, setGameType(int)@0xd9e220, setSeed(u32)@0xd9e240, setGenerator(int)@0xd9e28c, setSpawn(&BlockPos)@0xd9b6e8, setForceGameType(bool)@0xd9e2f0.
- **RENOMEAR** = setLevelName(novo) + setLevelData (a PASTA/levelId fica igual; id e hash, nao deriva do nome). `renameLevel@0xd98a80` (vtable, move a pasta) existe mas a tela vanilla NAO usa.
- Dificuldade NAO sai do LevelData (e global, secao 1).

## RESUMO p/ a UI
- Criar: Nome, Seed, Modo (Sobrevivencia/Criativo), Tipo (Infinito/Plano/Antigo). Dificuldade NAO e opcao da vanilla aqui (e global); posso oferecer setar o global no criar como conveniencia (deixar CLARO que e o global).
- Editar: abrir mundo da lista -> ler LevelData -> mudar nome/modo/gerador/seed -> salvar (setLevelData). Dificuldade = global.

## SAVE DA EDICAO (CONFIRMADO funcionando no A71, 2026-10-06)
Editar nome+modo de mundo LOCAL a partir do MENU (overlay proprio, SEM tela nativa):
- `src = *(*(mc+0x50)+0x18)` (getServer@0x6c1c90 -> getLevelSource@0xda2758 = ExternalFileLevelStorageSource, vptr runtime = file-VA **0x16307d4**). vt = *src.
- Elemento do mundo: `el = PSM::getLocalWorldAtIndex(model,i)@0x8404f8` = start+i*0x40. nome display@el+0x10, gameType@el+0x2c, **levelId std::string@el+0x20**.
- **COPIAR o levelId** (NAO usar a string viva do LocalWorldInfo): `vc_mkstr(&levelId, str_data(el+0x20))`. Usar `&levelId` em tudo.
- **RENOMEAR** (nao usa getLevelData, robusto): `renameLevel` = **vtable+0x28** (=0xd98a80): r0=src, r1=&levelId, r2=&newName(std::string). retorna bool. E o que `onLevelNameChanged@0x7f43d4` usa.
- **MODO**: buffer LevelData **GRANDE e ALINHADO**: `unsigned char ldbuf[0x100] __attribute__((aligned(8))); memset(ldbuf,0,0x100);` (um `char ld[0x94]` apertado/desalinhado CRASHA o default-ctor -> path-builder le _M_length lixo 0x80000000). Depois: getLevelData(**vtable+0x10**=0xd98e7c)(ldbuf, src, &levelId); `setGameType@0xd9e220`(ldbuf, mode 0=surv/1=criativo); setLevelData(**vtable+0x14**=0xd99078)(src, &levelId, ldbuf). Teardown: vector<string>@ldbuf+0x88 (free elems vc_delstr + `operator delete` dlsym _ZdlPv no buffer), `~CompoundTag`@ldbuf+0x3c via **0xa9a2b8** (real .text, NAO o PLT), string@ldbuf+0x0 via vc_delstr.
- **Lista NAO atualiza sozinha**: PlayScreenModel fica em CACHE; `vc_worlds_close()+vc_worlds_open()` depois de salvar p/ relistar com o nome novo.
- ABI getLevelData: r0=sret(ldbuf), r1=src, r2=&levelId. setLevelData: r0=src, r1=&levelId, r2=ldbuf.
- renameLevel renomeia o NOME DE EXIBICAO (nao a pasta); levelId fica estavel. Caminho vanilla observado em _editGameMode@0x7f3030 + onLevelNameChanged@0x7f43d4.
