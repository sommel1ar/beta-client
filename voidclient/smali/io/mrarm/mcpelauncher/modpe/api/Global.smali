.class public Lio/mrarm/mcpelauncher/modpe/api/Global;
.super Lorg/mozilla/javascript/ImporterTopLevel;
.source "Global.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>()V

    return-void
.end method

.method public static native nativeClientMessage(Ljava/lang/String;)V
.end method

.method public static native nativePreventDefault()V
.end method


# virtual methods
.method public addItemInventory(III)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "count"    # I
    .param p3, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 27
    invoke-static {p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Player;->addItemInventory(III)V

    .line 28
    return-void
.end method

.method public bl_setMobSkin(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "skin"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 77
    invoke-static {p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setMobSkin(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public bl_spawnMob(DDDILjava/lang/Object;)J
    .locals 3
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .param p7, "type"    # I
    .param p8, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 72
    invoke-static/range {p1 .. p8}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnMob(DDDILjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public clientMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "str"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 52
    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/api/Global;->nativeClientMessage(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public explode(DDDDZ)V
    .locals 1
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .param p7, "radius"    # D
    .param p9, "fire"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 57
    invoke-static/range {p1 .. p9}, Lio/mrarm/mcpelauncher/modpe/api/Level;->explode(DDDDZ)V

    .line 58
    return-void
.end method

.method public getCarriedItem()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 152
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getCarriedItem()I

    move-result v0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    const-string v0, "Global"

    return-object v0
.end method

.method public getPitch(Ljava/lang/Object;)D
    .locals 2
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 82
    if-eqz p1, :cond_0

    instance-of v0, p1, Lorg/mozilla/javascript/Undefined;

    if-eqz v0, :cond_1

    .line 83
    :cond_0
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getEntity()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getPitch(Ljava/lang/Object;)D

    move-result-wide v0

    .line 84
    :goto_0
    return-wide v0

    :cond_1
    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getPitch(Ljava/lang/Object;)D

    move-result-wide v0

    goto :goto_0
.end method

.method public getPlayerEnt()J
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 32
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getEntity()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPlayerX()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getX()D

    move-result-wide v0

    return-wide v0
.end method

.method public getPlayerY()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 42
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getY()D

    move-result-wide v0

    return-wide v0
.end method

.method public getPlayerZ()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 47
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getZ()D

    move-result-wide v0

    return-wide v0
.end method

.method public getTile(III)I
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 62
    invoke-static {p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Level;->getTile(III)I

    move-result v0

    return v0
.end method

.method public getYaw(Ljava/lang/Object;)D
    .locals 2
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 89
    if-eqz p1, :cond_0

    instance-of v0, p1, Lorg/mozilla/javascript/Undefined;

    if-eqz v0, :cond_1

    .line 90
    :cond_0
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->getEntity()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getYaw(Ljava/lang/Object;)D

    move-result-wide v0

    .line 91
    :goto_0
    return-wide v0

    :cond_1
    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getYaw(Ljava/lang/Object;)D

    move-result-wide v0

    goto :goto_0
.end method

.method public preventDefault()V
    .locals 0
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 22
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Global;->nativePreventDefault()V

    .line 23
    return-void
.end method

.method public print(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 157
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    if-eqz v1, :cond_0

    sget-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->name:Ljava/lang/String;

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "str":Ljava/lang/String;
    const-string v1, "ModPE/Print"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v2, Lio/mrarm/mcpelauncher/modpe/api/Global$1;

    invoke-direct {v2, p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Global$1;-><init>(Lio/mrarm/mcpelauncher/modpe/api/Global;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 165
    return-void

    .line 157
    .end local v0    # "str":Ljava/lang/String;
    :cond_0
    const-string v1, "null"

    goto :goto_0
.end method

.method public rideAnimal(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "rider"    # Ljava/lang/Object;
    .param p2, "mount"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 96
    invoke-static {p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->rideAnimal(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    return-void
.end method

.method public setNightMode(Z)V
    .locals 0
    .param p1, "nightMode"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 147
    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/api/Level;->setNightMode(Z)V

    .line 148
    return-void
.end method

.method public setPosition(Ljava/lang/Object;DDD)V
    .locals 0
    .param p1, "eid"    # Ljava/lang/Object;
    .param p2, "x"    # D
    .param p4, "y"    # D
    .param p6, "z"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 101
    invoke-static/range {p1 .. p7}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setPosition(Ljava/lang/Object;DDD)V

    .line 102
    return-void
.end method

.method public setPositionRelative(Ljava/lang/Object;DDD)V
    .locals 0
    .param p1, "eid"    # Ljava/lang/Object;
    .param p2, "x"    # D
    .param p4, "y"    # D
    .param p6, "z"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 106
    invoke-static/range {p1 .. p7}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setPositionRelative(Ljava/lang/Object;DDD)V

    .line 107
    return-void
.end method

.method public setRot(Ljava/lang/Object;DD)V
    .locals 0
    .param p1, "eid"    # Ljava/lang/Object;
    .param p2, "yaw"    # D
    .param p4, "pitch"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 110
    invoke-static {p1, p2, p3, p4, p5}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setRot(Ljava/lang/Object;DD)V

    .line 111
    return-void
.end method

.method public setTile(IIIII)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "z"    # I
    .param p4, "id"    # I
    .param p5, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 67
    invoke-static {p1, p2, p3, p4, p5}, Lio/mrarm/mcpelauncher/modpe/api/Level;->setTile(IIIII)V

    .line 68
    return-void
.end method

.method public setVelX(Ljava/lang/Object;D)V
    .locals 0
    .param p1, "eid"    # Ljava/lang/Object;
    .param p2, "vel"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 115
    invoke-static {p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setVelX(Ljava/lang/Object;D)V

    .line 116
    return-void
.end method

.method public setVelY(Ljava/lang/Object;D)V
    .locals 0
    .param p1, "eid"    # Ljava/lang/Object;
    .param p2, "vel"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 120
    invoke-static {p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setVelY(Ljava/lang/Object;D)V

    .line 121
    return-void
.end method

.method public setVelZ(Ljava/lang/Object;D)V
    .locals 0
    .param p1, "eid"    # Ljava/lang/Object;
    .param p2, "vel"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 125
    invoke-static {p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setVelZ(Ljava/lang/Object;D)V

    .line 126
    return-void
.end method

.method public spawnChicken(DDDLjava/lang/Object;)J
    .locals 3
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .param p7, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 130
    invoke-static/range {p1 .. p7}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnChicken(DDDLjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public spawnCow(DDDLjava/lang/Object;)J
    .locals 3
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .param p7, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 135
    invoke-static/range {p1 .. p7}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnCow(DDDLjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public spawnPigZombie(DDDILjava/lang/Object;)J
    .locals 13
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .param p7, "heldItem"    # I
    .param p8, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSFunction;
    .end annotation

    .prologue
    .line 140
    const/16 v8, 0x24

    move-wide v2, p1

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    move-object/from16 v9, p8

    invoke-static/range {v2 .. v9}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnMob(DDDILjava/lang/Object;)J

    move-result-wide v10

    .line 141
    .local v10, "eid":J
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    move/from16 v0, p7

    invoke-static {v2, v0, v3, v4}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->setCarriedItem(Ljava/lang/Object;III)V

    .line 142
    return-wide v10
.end method
