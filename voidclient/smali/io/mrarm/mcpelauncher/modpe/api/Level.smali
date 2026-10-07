.class public Lio/mrarm/mcpelauncher/modpe/api/Level;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Level.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static addParticle(IDDDDDDI)V
    .locals 11
    .param p0, "type"    # I
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .param p7, "xVel"    # D
    .param p9, "yVel"    # D
    .param p11, "zVel"    # D
    .param p13, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 80
    double-to-float v3, p1

    double-to-float v4, p3

    move-wide/from16 v0, p5

    double-to-float v5, v0

    move-wide/from16 v0, p7

    double-to-float v6, v0

    move-wide/from16 v0, p9

    double-to-float v7, v0

    move-wide/from16 v0, p11

    double-to-float v8, v0

    move v2, p0

    move/from16 v9, p13

    invoke-static/range {v2 .. v9}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeAddParticle(IFFFFFFI)V

    .line 81
    return-void
.end method

.method public static canSeeSky(III)Z
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 105
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeCanSeeSky(III)Z

    move-result v0

    return v0
.end method

.method public static destroyBlock(IIIZ)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "shouldDrop"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 40
    invoke-static {p0, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeDestroyBlock(IIIZ)V

    .line 41
    return-void
.end method

.method public static dropItem(DDDDIII)J
    .locals 8
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "range"    # D
    .param p8, "id"    # I
    .param p9, "count"    # I
    .param p10, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 243
    double-to-float v0, p0

    double-to-float v1, p2

    double-to-float v2, p4

    double-to-float v3, p6

    move/from16 v4, p8

    move/from16 v5, p9

    move/from16 v6, p10

    invoke-static/range {v0 .. v6}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeDropItem(FFFFIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public static explode(DDDDZ)V
    .locals 4
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "radius"    # D
    .param p8, "fire"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 45
    double-to-float v0, p0

    double-to-float v1, p2

    double-to-float v2, p4

    double-to-float v3, p6

    invoke-static {v0, v1, v2, v3, p8}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeExplode(FFFFZ)V

    .line 46
    return-void
.end method

.method public static getBiome(II)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 120
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetBiome(II)I

    move-result v0

    return v0
.end method

.method public static getBiomeName(II)Ljava/lang/String;
    .locals 1
    .param p0, "x"    # I
    .param p1, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 125
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetBiomeName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getBrightness(III)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 35
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetBrightness(III)I

    move-result v0

    return v0
.end method

.method public static getChestSlot(IIII)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 154
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetChestSlot(IIIII)I

    move-result v0

    return v0
.end method

.method public static getChestSlotCount(IIII)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 159
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetChestSlot(IIIII)I

    move-result v0

    return v0
.end method

.method public static getChestSlotCustomName(IIII)Ljava/lang/String;
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 169
    invoke-static {p0, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetChestSlotCustomName(IIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getChestSlotData(IIII)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 164
    const/4 v0, 0x2

    invoke-static {p0, p1, p2, p3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetChestSlot(IIIII)I

    move-result v0

    return v0
.end method

.method public static getData(III)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 25
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetData(III)I

    move-result v0

    return v0
.end method

.method public static getDifficulty()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 60
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetDifficulty()I

    move-result v0

    return v0
.end method

.method public static getFurnaceSlot(IIII)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 174
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetFurnaceSlot(IIIII)I

    move-result v0

    return v0
.end method

.method public static getFurnaceSlotCount(IIII)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 179
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetFurnaceSlot(IIIII)I

    move-result v0

    return v0
.end method

.method public static getFurnaceSlotData(IIII)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 184
    const/4 v0, 0x2

    invoke-static {p0, p1, p2, p3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetFurnaceSlot(IIIII)I

    move-result v0

    return v0
.end method

.method public static getGameMode()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 70
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetGameMode()I

    move-result v0

    return v0
.end method

.method public static getGrassColor(II)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 130
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetGrassColor(II)I

    move-result v0

    return v0
.end method

.method public static getLightningLevel()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 95
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetLightningLevel()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getRainLevel()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 85
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetRainLevel()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getSignText(IIII)Ljava/lang/String;
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "line"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 189
    invoke-static {p0, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetSignText(IIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSpawnerEntityType(III)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 194
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetSpawnerEntityType(III)I

    move-result v0

    return v0
.end method

.method public static getTile(III)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 20
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetTile(III)I

    move-result v0

    return v0
.end method

.method public static getTime()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 50
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetTime()I

    move-result v0

    return v0
.end method

.method public static getWorldDir()Ljava/lang/String;
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 10
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetWorldDir()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getWorldName()Ljava/lang/String;
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 15
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeGetWorldName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isRemote()Z
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 248
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeIsRemote()Z

    move-result v0

    return v0
.end method

.method private static native nativeAddParticle(IFFFFFFI)V
.end method

.method private static native nativeCanSeeSky(III)Z
.end method

.method private static native nativeDestroyBlock(IIIZ)V
.end method

.method private static native nativeDropItem(FFFFIII)J
.end method

.method private static native nativeExplode(FFFFZ)V
.end method

.method private static native nativeGetBiome(II)I
.end method

.method private static native nativeGetBiomeName(II)Ljava/lang/String;
.end method

.method private static native nativeGetBrightness(III)I
.end method

.method private static native nativeGetChestSlot(IIIII)I
.end method

.method private static native nativeGetChestSlotCustomName(IIII)Ljava/lang/String;
.end method

.method private static native nativeGetData(III)I
.end method

.method private static native nativeGetDifficulty()I
.end method

.method private static native nativeGetFurnaceSlot(IIIII)I
.end method

.method private static native nativeGetGameMode()I
.end method

.method private static native nativeGetGrassColor(II)I
.end method

.method private static native nativeGetLightningLevel()F
.end method

.method private static native nativeGetRainLevel()F
.end method

.method private static native nativeGetSignText(IIII)Ljava/lang/String;
.end method

.method private static native nativeGetSpawnerEntityType(III)I
.end method

.method private static native nativeGetTile(III)I
.end method

.method private static native nativeGetTime()I
.end method

.method private static native nativeGetWorldDir()Ljava/lang/String;
.end method

.method private static native nativeGetWorldName()Ljava/lang/String;
.end method

.method private static native nativeIsRemote()Z
.end method

.method private static native nativePlaySound(FFFLjava/lang/String;FF)V
.end method

.method private static native nativePlaySoundEnt(JLjava/lang/String;FF)V
.end method

.method private static native nativeSetChestSlot(IIIIIII)V
.end method

.method private static native nativeSetChestSlotCustomName(IIIILjava/lang/String;)V
.end method

.method private static native nativeSetDifficulty(I)V
.end method

.method private static native nativeSetFurnaceSlot(IIIIIII)V
.end method

.method private static native nativeSetGameMode(I)V
.end method

.method private static native nativeSetGrassColor(III)V
.end method

.method private static native nativeSetLightningLevel(F)V
.end method

.method private static native nativeSetNightMode(Z)V
.end method

.method private static native nativeSetRainLevel(F)V
.end method

.method private static native nativeSetSignText(IIIILjava/lang/String;)V
.end method

.method private static native nativeSetSpawn(III)V
.end method

.method private static native nativeSetSpawnerEntityType(IIII)V
.end method

.method private static native nativeSetTile(IIIII)V
.end method

.method private static native nativeSetTime(I)V
.end method

.method private static native nativeSpawnMob(FFFILjava/lang/String;)J
.end method

.method public static playSound(DDDLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "sound"    # Ljava/lang/String;
    .param p7, "volume"    # Ljava/lang/Object;
    .param p8, "pitch"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    .line 140
    if-eqz p7, :cond_1

    instance-of v0, p7, Ljava/lang/Number;

    if-eqz v0, :cond_1

    check-cast p7, Ljava/lang/Number;

    .end local p7    # "volume":Ljava/lang/Object;
    invoke-virtual {p7}, Ljava/lang/Number;->floatValue()F

    move-result v4

    .line 141
    .local v4, "vol":F
    :goto_0
    if-eqz p8, :cond_0

    instance-of v0, p8, Ljava/lang/Number;

    if-eqz v0, :cond_0

    check-cast p8, Ljava/lang/Number;

    .end local p8    # "pitch":Ljava/lang/Object;
    invoke-virtual {p8}, Ljava/lang/Number;->floatValue()F

    move-result v5

    .line 142
    .local v5, "pit":F
    :cond_0
    double-to-float v0, p0

    double-to-float v1, p2

    double-to-float v2, p4

    move-object v3, p6

    invoke-static/range {v0 .. v5}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativePlaySound(FFFLjava/lang/String;FF)V

    .line 143
    return-void

    .end local v4    # "vol":F
    .end local v5    # "pit":F
    .restart local p7    # "volume":Ljava/lang/Object;
    .restart local p8    # "pitch":Ljava/lang/Object;
    :cond_1
    move v4, v5

    .line 140
    goto :goto_0
.end method

.method public static playSoundEnt(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p0, "ent"    # Ljava/lang/Object;
    .param p1, "sound"    # Ljava/lang/String;
    .param p2, "volume"    # Ljava/lang/Object;
    .param p3, "pitch"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 147
    if-eqz p2, :cond_1

    instance-of v2, p2, Ljava/lang/Number;

    if-eqz v2, :cond_1

    check-cast p2, Ljava/lang/Number;

    .end local p2    # "volume":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v1

    .line 148
    .local v1, "vol":F
    :goto_0
    if-eqz p3, :cond_0

    instance-of v2, p3, Ljava/lang/Number;

    if-eqz v2, :cond_0

    check-cast p3, Ljava/lang/Number;

    .end local p3    # "pitch":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 149
    .local v0, "pit":F
    :cond_0
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    invoke-static {v2, v3, p1, v1, v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativePlaySoundEnt(JLjava/lang/String;FF)V

    .line 150
    return-void

    .end local v0    # "pit":F
    .end local v1    # "vol":F
    .restart local p2    # "volume":Ljava/lang/Object;
    .restart local p3    # "pitch":Ljava/lang/Object;
    :cond_1
    move v1, v0

    .line 147
    goto :goto_0
.end method

.method public static setChestSlot(IIIIIII)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .param p4, "id"    # I
    .param p5, "data"    # I
    .param p6, "count"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 199
    invoke-static/range {p0 .. p6}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetChestSlot(IIIIIII)V

    .line 200
    return-void
.end method

.method public static setChestSlotCustomName(IIIILjava/lang/String;)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .param p4, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 204
    invoke-static {p0, p1, p2, p3, p4}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetChestSlotCustomName(IIIILjava/lang/String;)V

    .line 205
    return-void
.end method

.method public static setDifficulty(I)V
    .locals 0
    .param p0, "difficulty"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 65
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetDifficulty(I)V

    .line 66
    return-void
.end method

.method public static setFurnaceSlot(IIIIIII)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "slot"    # I
    .param p4, "id"    # I
    .param p5, "data"    # I
    .param p6, "count"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 209
    invoke-static/range {p0 .. p6}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetFurnaceSlot(IIIIIII)V

    .line 210
    return-void
.end method

.method public static setGameMode(I)V
    .locals 0
    .param p0, "gameMode"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 75
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetGameMode(I)V

    .line 76
    return-void
.end method

.method public static setGrassColor(III)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "z"    # I
    .param p2, "color"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 135
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetGrassColor(III)V

    .line 136
    return-void
.end method

.method public static setLightningLevel(D)V
    .locals 2
    .param p0, "level"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 100
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetLightningLevel(F)V

    .line 101
    return-void
.end method

.method public static setNightMode(Z)V
    .locals 0
    .param p0, "nightMode"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 110
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetNightMode(Z)V

    .line 111
    return-void
.end method

.method public static setRainLevel(D)V
    .locals 2
    .param p0, "level"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 90
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetRainLevel(F)V

    .line 91
    return-void
.end method

.method public static setSignText(IIIILjava/lang/String;)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "line"    # I
    .param p4, "text"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 214
    invoke-static {p0, p1, p2, p3, p4}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetSignText(IIIILjava/lang/String;)V

    .line 215
    return-void
.end method

.method public static setSpawn(III)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 115
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetSpawn(III)V

    .line 116
    return-void
.end method

.method public static setSpawnerEntityType(IIII)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "type"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 219
    invoke-static {p0, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetSpawnerEntityType(IIII)V

    .line 220
    return-void
.end method

.method public static setTile(IIIII)V
    .locals 0
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I
    .param p3, "id"    # I
    .param p4, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 30
    invoke-static {p0, p1, p2, p3, p4}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetTile(IIIII)V

    .line 31
    return-void
.end method

.method public static setTime(I)V
    .locals 0
    .param p0, "time"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 55
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSetTime(I)V

    .line 56
    return-void
.end method

.method public static spawnChicken(DDDLjava/lang/Object;)J
    .locals 8
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 233
    const/16 v6, 0xa

    move-wide v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-object v7, p6

    invoke-static/range {v0 .. v7}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnMob(DDDILjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static spawnCow(DDDLjava/lang/Object;)J
    .locals 8
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 238
    const/16 v6, 0xb

    move-wide v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-object v7, p6

    invoke-static/range {v0 .. v7}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnMob(DDDILjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static spawnMob(DDDILjava/lang/Object;)J
    .locals 6
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "type"    # I
    .param p7, "texture"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 224
    double-to-float v3, p0

    double-to-float v4, p2

    double-to-float v5, p4

    instance-of v2, p7, Ljava/lang/String;

    if-eqz v2, :cond_1

    move-object v2, p7

    check-cast v2, Ljava/lang/String;

    :goto_0
    invoke-static {v3, v4, v5, p6, v2}, Lio/mrarm/mcpelauncher/modpe/api/Level;->nativeSpawnMob(FFFILjava/lang/String;)J

    move-result-wide v0

    .line 226
    .local v0, "ret":J
    if-eqz p7, :cond_0

    instance-of v2, p7, Ljava/lang/String;

    if-eqz v2, :cond_0

    move-object v2, p7

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 227
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    check-cast p7, Ljava/lang/String;

    .end local p7    # "texture":Ljava/lang/Object;
    invoke-static {v2, p7}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->saveMobSkin(Ljava/lang/Object;Ljava/lang/String;)V

    .line 228
    :cond_0
    return-wide v0

    .line 224
    .end local v0    # "ret":J
    .restart local p7    # "texture":Ljava/lang/Object;
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 253
    const-string v0, "Level"

    return-object v0
.end method
