.class public Lio/mrarm/mcpelauncher/modpe/api/Player;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Player.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static addExp(I)V
    .locals 0
    .param p0, "exp"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 137
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeAddExp(I)V

    .line 138
    return-void
.end method

.method public static addItemCreativeInv(III)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "count"    # I
    .param p2, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 67
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeAddItemCreativeInv(III)V

    .line 68
    return-void
.end method

.method public static addItemInventory(III)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "count"    # I
    .param p2, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 62
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeAddItemInventory(III)V

    .line 63
    return-void
.end method

.method public static canFly()Z
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 172
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeCanFly()Z

    move-result v0

    return v0
.end method

.method public static clearInventorySlot(I)V
    .locals 0
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 242
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeClearInventorySlot(I)V

    .line 243
    return-void
.end method

.method public static enchant(III)V
    .locals 0
    .param p0, "slot"    # I
    .param p1, "enchant"    # I
    .param p2, "level"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 267
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeEnchant(III)V

    .line 268
    return-void
.end method

.method public static getArmorSlot(I)I
    .locals 1
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 122
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetArmorSlot(I)I

    move-result v0

    return v0
.end method

.method public static getArmorSlotDamage(I)I
    .locals 1
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 127
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetArmorSlotDamage(I)I

    move-result v0

    return v0
.end method

.method public static getCarriedItem()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 47
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetCarriedItem()I

    move-result v0

    return v0
.end method

.method public static getCarriedItemCount()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 52
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetCarriedItemCount()I

    move-result v0

    return v0
.end method

.method public static getCarriedItemData()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 57
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetCarriedItemData()I

    move-result v0

    return v0
.end method

.method public static getDimension()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 217
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetDimension()I

    move-result v0

    return v0
.end method

.method public static getEnchantments(I)Lorg/mozilla/javascript/NativeArray;
    .locals 6
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 272
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetEnchantments(I)[I

    move-result-object v0

    .line 273
    .local v0, "enchantments":[I
    new-instance v2, Lorg/mozilla/javascript/NativeArray;

    array-length v4, v0

    div-int/lit8 v4, v4, 0x2

    int-to-long v4, v4

    invoke-direct {v2, v4, v5}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    .line 274
    .local v2, "nativeArr":Lorg/mozilla/javascript/NativeArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_0

    .line 275
    new-instance v3, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v3}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 276
    .local v3, "obj":Lorg/mozilla/javascript/NativeObject;
    const-string v4, "type"

    aget v5, v0, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v3, v5}, Lorg/mozilla/javascript/NativeObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 277
    const-string v4, "level"

    aget v5, v0, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v3, v5}, Lorg/mozilla/javascript/NativeObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 278
    invoke-virtual {v2, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 274
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 280
    .end local v3    # "obj":Lorg/mozilla/javascript/NativeObject;
    :cond_0
    return-object v2
.end method

.method public static getEntity()J
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 12
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetEntity()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getExhaustion()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 202
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetExhaustion()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getExp()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 147
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetExp()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getHunger()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 192
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetHunger()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getInventorySlot(I)I
    .locals 1
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 222
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetInventorySlot(II)I

    move-result v0

    return v0
.end method

.method public static getInventorySlotCount(I)I
    .locals 1
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 227
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetInventorySlot(II)I

    move-result v0

    return v0
.end method

.method public static getInventorySlotData(I)I
    .locals 1
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 232
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetInventorySlot(II)I

    move-result v0

    return v0
.end method

.method public static getItemCustomName(I)Ljava/lang/String;
    .locals 1
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 252
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetItemCustomName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLevel()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 157
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetLevel()I

    move-result v0

    return v0
.end method

.method public static getName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 22
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPointedBlockData()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 97
    const/4 v0, 0x5

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedBlock(I)I

    move-result v0

    return v0
.end method

.method public static getPointedBlockId()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 92
    const/4 v0, 0x4

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedBlock(I)I

    move-result v0

    return v0
.end method

.method public static getPointedBlockSide()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 87
    const/4 v0, 0x3

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedBlock(I)I

    move-result v0

    return v0
.end method

.method public static getPointedBlockX()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedBlock(I)I

    move-result v0

    return v0
.end method

.method public static getPointedBlockY()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 77
    const/4 v0, 0x1

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedBlock(I)I

    move-result v0

    return v0
.end method

.method public static getPointedBlockZ()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 82
    const/4 v0, 0x2

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedBlock(I)I

    move-result v0

    return v0
.end method

.method public static getPointedEntity()J
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 102
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedEntity()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getPointedVecX()F
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedVec(I)F

    move-result v0

    return v0
.end method

.method public static getPointedVecY()F
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 112
    const/4 v0, 0x1

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedVec(I)F

    move-result v0

    return v0
.end method

.method public static getPointedVecZ()F
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 117
    const/4 v0, 0x2

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetPointedVec(I)F

    move-result v0

    return v0
.end method

.method public static getSaturation()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 212
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetSaturation()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getScore()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 162
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetScore()I

    move-result v0

    return v0
.end method

.method public static getSelectedSlotId()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 257
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetSelectedSlotId()I

    move-result v0

    return v0
.end method

.method public static getX()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 27
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetX()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getY()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 32
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetY()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getZ()D
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeGetZ()F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static isFlying()Z
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 182
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeIsFlying()Z

    move-result v0

    return v0
.end method

.method public static isPlayer(Ljava/lang/Object;)Z
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 17
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeIsPlayer(J)Z

    move-result v0

    return v0
.end method

.method private static native nativeAddExp(I)V
.end method

.method private static native nativeAddItemCreativeInv(III)V
.end method

.method private static native nativeAddItemInventory(III)V
.end method

.method private static native nativeCanFly()Z
.end method

.method private static native nativeClearInventorySlot(I)V
.end method

.method private static native nativeEnchant(III)V
.end method

.method private static native nativeGetArmorSlot(I)I
.end method

.method private static native nativeGetArmorSlotDamage(I)I
.end method

.method private static native nativeGetCarriedItem()I
.end method

.method private static native nativeGetCarriedItemCount()I
.end method

.method private static native nativeGetCarriedItemData()I
.end method

.method private static native nativeGetDimension()I
.end method

.method private static native nativeGetEnchantments(I)[I
.end method

.method private static native nativeGetEntity()J
.end method

.method private static native nativeGetExhaustion()F
.end method

.method private static native nativeGetExp()F
.end method

.method private static native nativeGetHunger()F
.end method

.method private static native nativeGetInventorySlot(II)I
.end method

.method private static native nativeGetItemCustomName(I)Ljava/lang/String;
.end method

.method private static native nativeGetLevel()I
.end method

.method private static native nativeGetName(J)Ljava/lang/String;
.end method

.method private static native nativeGetPointedBlock(I)I
.end method

.method private static native nativeGetPointedEntity()J
.end method

.method private static native nativeGetPointedVec(I)F
.end method

.method private static native nativeGetSaturation()F
.end method

.method private static native nativeGetScore()I
.end method

.method private static native nativeGetSelectedSlotId()I
.end method

.method private static native nativeGetX()F
.end method

.method private static native nativeGetY()F
.end method

.method private static native nativeGetZ()F
.end method

.method private static native nativeIsFlying()Z
.end method

.method private static native nativeIsPlayer(J)Z
.end method

.method private static native nativeSetArmorSlot(III)V
.end method

.method private static native nativeSetCanFly(Z)V
.end method

.method private static native nativeSetExhaustion(F)V
.end method

.method private static native nativeSetExp(F)V
.end method

.method private static native nativeSetFlying(Z)V
.end method

.method private static native nativeSetHealth(I)V
.end method

.method private static native nativeSetHunger(F)V
.end method

.method private static native nativeSetInventorySlot(IIII)V
.end method

.method private static native nativeSetItemCustomName(ILjava/lang/String;)V
.end method

.method private static native nativeSetLevel(I)V
.end method

.method private static native nativeSetSaturation(F)V
.end method

.method private static native nativeSetSelectedSlotId(I)V
.end method

.method public static setArmorSlot(III)V
    .locals 0
    .param p0, "slot"    # I
    .param p1, "id"    # I
    .param p2, "dmg"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 132
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetArmorSlot(III)V

    .line 133
    return-void
.end method

.method public static setCanFly(Z)V
    .locals 0
    .param p0, "canFly"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 167
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetCanFly(Z)V

    .line 168
    return-void
.end method

.method public static setExhaustion(I)V
    .locals 1
    .param p0, "exhaustion"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 197
    int-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetExhaustion(F)V

    .line 198
    return-void
.end method

.method public static setExp(D)V
    .locals 2
    .param p0, "exp"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 142
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetExp(F)V

    .line 143
    return-void
.end method

.method public static setFlying(Z)V
    .locals 0
    .param p0, "flying"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 177
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetFlying(Z)V

    .line 178
    return-void
.end method

.method public static setHealth(I)V
    .locals 0
    .param p0, "hp"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 42
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetHealth(I)V

    .line 43
    return-void
.end method

.method public static setHunger(D)V
    .locals 2
    .param p0, "hunger"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 187
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetHunger(F)V

    .line 188
    return-void
.end method

.method public static setInventorySlot(IIII)V
    .locals 0
    .param p0, "slot"    # I
    .param p1, "id"    # I
    .param p2, "count"    # I
    .param p3, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 237
    invoke-static {p0, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetInventorySlot(IIII)V

    .line 238
    return-void
.end method

.method public static setItemCustomName(ILjava/lang/String;)V
    .locals 0
    .param p0, "slot"    # I
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 247
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetItemCustomName(ILjava/lang/String;)V

    .line 248
    return-void
.end method

.method public static setLevel(I)V
    .locals 0
    .param p0, "lvl"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 152
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetLevel(I)V

    .line 153
    return-void
.end method

.method public static setSaturation(D)V
    .locals 2
    .param p0, "saturation"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 207
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetSaturation(F)V

    .line 208
    return-void
.end method

.method public static setSelectedSlotId(I)V
    .locals 0
    .param p0, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 262
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Player;->nativeSetSelectedSlotId(I)V

    .line 263
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 285
    const-string v0, "Player"

    return-object v0
.end method
