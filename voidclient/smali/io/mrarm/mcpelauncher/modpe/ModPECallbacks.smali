.class public Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;
.super Ljava/lang/Object;
.source "ModPECallbacks.java"


# static fields
.field public static screenshotName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, ""

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->screenshotName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 29
    invoke-static {}, Lorg/mozilla/javascript/Context;->enter()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 30
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    const/4 v4, -0x1

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/Context;->setOptimizationLevel(I)V

    .line 31
    sget-object v4, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;->instance:Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/Context;->setWrapFactory(Lorg/mozilla/javascript/WrapFactory;)V

    .line 32
    sget-object v4, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 33
    .local v3, "script":Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;
    iget-boolean v5, v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->isDisabled:Z

    if-nez v5, :cond_0

    .line 35
    sput-object v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 36
    iget-object v5, v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v6, v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v5, p0, v6}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 37
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_0

    instance-of v5, v2, Lorg/mozilla/javascript/Function;

    if-eqz v5, :cond_0

    .line 39
    :try_start_0
    check-cast v2, Lorg/mozilla/javascript/Function;

    .end local v2    # "obj":Ljava/lang/Object;
    iget-object v5, v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v6, v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2, v0, v5, v6, p1}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 40
    :catch_0
    move-exception v1

    .line 41
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->throwScriptError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 45
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v3    # "script":Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;
    :cond_1
    const/4 v4, 0x0

    sput-object v4, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 46
    return-void
.end method

.method public static loadScripts()V
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->initModPETextureAtlasNames()V

    .line 50
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScripts()V

    invoke-static {}, Lio/mrarm/mcpelauncher/FailsafeSeed;->loadRainbow()V

    .line 51
    return-void
.end method

.method public static onAddExp(JI)V
    .locals 4
    .param p0, "player"    # J
    .param p2, "exp"    # I

    .prologue
    .line 151
    const-string v0, "playerAddExpHook"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 152
    return-void
.end method

.method public static onAddExpLevel(JI)V
    .locals 4
    .param p0, "player"    # J
    .param p2, "levels"    # I

    .prologue
    .line 155
    const-string v0, "playerExpLevelChangeHook"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 156
    return-void
.end method

.method public static onAttack(JJ)V
    .locals 4
    .param p0, "attacker"    # J
    .param p2, "victim"    # J

    .prologue
    .line 66
    const-string v0, "attackHook"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 67
    return-void
.end method

.method public static onBlockEvent(IIIII)V
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "type"    # I
    .param p4, "data"    # I

    .prologue
    .line 139
    const-string v0, "blockEventHook"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 140
    return-void
.end method

.method public static onChat(Ljava/lang/String;)V
    .locals 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 70
    const-string v0, "chatHook"

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v3

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 71
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->isRemote()Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    const-string v0, "procCmd"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Global;->nativePreventDefault()V

    .line 74
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->updateTextboxText(Ljava/lang/String;)V

    .line 76
    :cond_0
    return-void
.end method

.method public static onContinueDestroyBlock(IIIIF)V
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "side"    # I
    .param p4, "progress"    # F

    .prologue
    .line 92
    const-string v0, "continueDestroyBlock"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public static onDestroyBlock(IIII)V
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "side"    # I

    .prologue
    .line 96
    const-string v0, "destroyBlock"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 97
    return-void
.end method

.method public static onEat(IF)V
    .locals 4
    .param p0, "hp"    # I
    .param p1, "saturataion"    # F

    .prologue
    .line 62
    const-string v0, "eatHook"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    return-void
.end method

.method public static onEntityAdded(J)V
    .locals 6
    .param p0, "eid"    # J

    .prologue
    const/4 v5, 0x0

    .line 118
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 119
    .local v1, "store":Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;
    if-eqz v1, :cond_1

    .line 120
    invoke-interface {v1, p0, p1, v5}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->getMetaForEntity(JZ)Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    move-result-object v0

    .line 121
    .local v0, "meta":Lio/mrarm/mcpelauncher/modpe/EntityMeta;
    if-eqz v0, :cond_1

    .line 122
    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->getSkin()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->getSkin()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 123
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->getSkin()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setMobSkin(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    :cond_0
    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->getRenderType()I

    move-result v2

    if-eqz v2, :cond_1

    .line 125
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->getRenderType()I

    move-result v3

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setRenderType(Ljava/lang/Object;I)V

    .line 128
    .end local v0    # "meta":Lio/mrarm/mcpelauncher/modpe/EntityMeta;
    :cond_1
    const-string v2, "entityAddedHook"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 129
    return-void
.end method

.method public static onEntityDied(JJ)V
    .locals 4
    .param p0, "attacker"    # J
    .param p2, "victim"    # J

    .prologue
    .line 163
    const-string v0, "deathHook"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 164
    return-void
.end method

.method public static onEntityHurt(JJI)V
    .locals 4
    .param p0, "attacker"    # J
    .param p2, "victim"    # J
    .param p4, "hp"    # I

    .prologue
    .line 159
    const-string v0, "entityHurtHook"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    return-void
.end method

.method public static onEntityRemoved(J)V
    .locals 6
    .param p0, "eid"    # J

    .prologue
    .line 132
    const-string v1, "entityRemovedHook"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 134
    .local v0, "store":Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;
    if-eqz v0, :cond_0

    .line 135
    invoke-interface {v0, p0, p1}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->removeAll(J)V

    .line 136
    :cond_0
    return-void
.end method

.method public static onExplode(JFFFFZ)V
    .locals 4
    .param p0, "entity"    # J
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "z"    # F
    .param p5, "f"    # F
    .param p6, "fire"    # Z

    .prologue
    .line 147
    const-string v0, "explodeHook"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 148
    return-void
.end method

.method public static onLeaveGame()V
    .locals 2

    .prologue
    .line 113
    const-string v0, "leaveGame"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 114
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->closeCurrent()V

    .line 115
    return-void
.end method

.method public static onLevelEvent(IFFFI)V
    .locals 4
    .param p0, "type"    # I
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F
    .param p4, "data"    # I

    .prologue
    const/4 v3, 0x0

    .line 143
    const-string v0, "levelEventHook"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const/4 v2, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 144
    return-void
.end method

.method public static onNewLevel()V
    .locals 2

    .prologue
    .line 109
    const-string v0, "newLevel"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method public static onProjectileHitBlock(JIIII)V
    .locals 4
    .param p0, "projectile"    # J
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "z"    # I
    .param p5, "side"    # I

    .prologue
    .line 171
    const-string v0, "projectileHitBlockHook"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 172
    return-void
.end method

.method public static onProjectileHitEntity(JJ)V
    .locals 4
    .param p0, "projectile"    # J
    .param p2, "entity"    # J

    .prologue
    .line 167
    const-string v0, "projectileHitEntityHook"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 168
    return-void
.end method

.method public static onRedstoneUpdate(IIIIZII)V
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "i"    # I
    .param p4, "b"    # Z
    .param p5, "blockId"    # I
    .param p6, "blockData"    # I

    .prologue
    .line 100
    const-string v0, "redstoneUpdateHook"

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method public static onSelectLevel(Ljava/lang/String;)V
    .locals 4
    .param p0, "dir"    # Ljava/lang/String;

    .prologue
    .line 104
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "games/com.mojang/minecraftWorlds"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->initWithWorld(Ljava/io/File;)Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 105
    const-string v0, "selectLevelHook"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 106
    return-void
.end method

.method public static onStartDestroyBlock(IIII)V
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "side"    # I

    .prologue
    .line 88
    const-string v0, "startDestroyBlock"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method public static onTextPacket(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "type"    # I
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 79
    const-string v0, "textPacketReceiveHook"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    aput-object p1, v1, v3

    aput-object p2, v1, v5

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    if-ne p0, v3, :cond_1

    .line 81
    const-string v0, "chatReceiveHook"

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p2, v1, v4

    aput-object p1, v1, v3

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    if-nez p0, :cond_0

    .line 83
    const-string v0, "serverMessageReceiveHook"

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p2, v1, v4

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static onTick()V
    .locals 2

    .prologue
    .line 54
    const-string v0, "modTick"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method public static onUseItem(IIIIIIII)V
    .locals 4
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "itemId"    # I
    .param p4, "blockId"    # I
    .param p5, "side"    # I
    .param p6, "itemData"    # I
    .param p7, "blockData"    # I

    .prologue
    .line 58
    const-string v0, "useItem"

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public static saveScreenshot([III)V
    .locals 12
    .param p0, "buf"    # [I
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 175
    const-string v8, "I"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SS: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    sget-object v8, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v8}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 177
    .local v5, "pix":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    const-string v8, "MCPEToolbox"

    invoke-direct {v6, v5, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 178
    .local v6, "screenshots":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 179
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v8, "dd-MM-yyyy-HH-mm"

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 180
    .local v2, "df":Ljava/text/SimpleDateFormat;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, "date":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->screenshotName:Ljava/lang/String;

    const-string v10, "/"

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "\\"

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".png"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v6, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 184
    .local v4, "file":Ljava/io/File;
    :try_start_0
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p1, p2, v8}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 185
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 186
    .local v7, "stream":Ljava/io/FileOutputStream;
    sget-object v8, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x64

    invoke-virtual {v0, v8, v9, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 187
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v7    # "stream":Ljava/io/FileOutputStream;
    :goto_0
    const-string v8, ""

    sput-object v8, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->screenshotName:Ljava/lang/String;

    .line 192
    return-void

    .line 188
    :catch_0
    move-exception v3

    .line 189
    .local v3, "ex":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
