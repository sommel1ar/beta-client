.class public Lio/mrarm/mcpelauncher/modpe/api/Entity;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Entity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static addEffect(Ljava/lang/Object;IIIZZ)V
    .locals 7
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "id"    # I
    .param p2, "duration"    # I
    .param p3, "amplifier"    # I
    .param p4, "ambient"    # Z
    .param p5, "particles"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 247
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeAddEffect(JIIIZZ)V

    .line 248
    return-void
.end method

.method public static getAll()[J
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 32
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetAll()[J

    move-result-object v0

    return-object v0
.end method

.method public static getAnimalAge(Ljava/lang/Object;)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 177
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetAnimalAge(J)I

    move-result v0

    return v0
.end method

.method public static getArmor(Ljava/lang/Object;I)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 132
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetArmor(JI)I

    move-result v0

    return v0
.end method

.method public static getArmorCustomName(Ljava/lang/Object;I)Ljava/lang/String;
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 142
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetArmorCustomName(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getArmorDamage(Ljava/lang/Object;I)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "slot"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 137
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetArmorDamage(JI)I

    move-result v0

    return v0
.end method

.method public static getEntityId(Ljava/lang/Object;)J
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 15
    instance-of v0, p0, Lorg/mozilla/javascript/NativeJavaObject;

    if-eqz v0, :cond_0

    .line 16
    check-cast p0, Lorg/mozilla/javascript/NativeJavaObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaObject;->unwrap()Ljava/lang/Object;

    move-result-object p0

    .line 18
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 19
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 21
    :goto_0
    return-wide v0

    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public static getEntityTypeId(Ljava/lang/Object;)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 157
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetEntityTypeId(J)I

    move-result v0

    return v0
.end method

.method public static getExtraData(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 305
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    invoke-interface {v0, v2, v3, p1}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->get(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getHealth(Ljava/lang/Object;)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 42
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetHealth(J)I

    move-result v0

    return v0
.end method

.method public static getItemEntityCount(Ljava/lang/Object;)I
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 172
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetItemEntityData(JI)I

    move-result v0

    return v0
.end method

.method public static getItemEntityData(Ljava/lang/Object;)I
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 167
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetItemEntityData(JI)I

    move-result v0

    return v0
.end method

.method public static getItemEntityId(Ljava/lang/Object;)I
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 162
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetItemEntityData(JI)I

    move-result v0

    return v0
.end method

.method public static getMaxHealth(Ljava/lang/Object;)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 47
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetMaxHealth(J)I

    move-result v0

    return v0
.end method

.method public static getMobSkin(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 272
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetMobSkin(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getNameTag(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 187
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetNameTag(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPitch(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 82
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getRenderType(Ljava/lang/Object;)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 288
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetRenderType(J)I

    move-result v0

    return v0
.end method

.method public static getRider(Ljava/lang/Object;)J
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 202
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetRider(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getRiding(Ljava/lang/Object;)J
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 207
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetRiding(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getTarget(Ljava/lang/Object;)J
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 212
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetTarget(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getUniqueId(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 27
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVelX(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 87
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x5

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getVelY(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 92
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x6

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getVelZ(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 97
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x7

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getX(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 62
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getY(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 67
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getYaw(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 77
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getZ(Ljava/lang/Object;)D
    .locals 3
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 72
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeGetPos(JI)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static isSneaking(Ljava/lang/Object;)Z
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 232
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeIsSneaking(J)Z

    move-result v0

    return v0
.end method

.method private static native nativeAddEffect(JIIIZZ)V
.end method

.method private static native nativeGetAll()[J
.end method

.method private static native nativeGetAnimalAge(J)I
.end method

.method private static native nativeGetArmor(JI)I
.end method

.method private static native nativeGetArmorCustomName(JI)Ljava/lang/String;
.end method

.method private static native nativeGetArmorDamage(JI)I
.end method

.method private static native nativeGetEntityTypeId(J)I
.end method

.method private static native nativeGetHealth(J)I
.end method

.method private static native nativeGetItemEntityData(JI)I
.end method

.method private static native nativeGetMaxHealth(J)I
.end method

.method private static native nativeGetMobSkin(J)Ljava/lang/String;
.end method

.method private static native nativeGetNameTag(J)Ljava/lang/String;
.end method

.method private static native nativeGetPos(JI)F
.end method

.method private static native nativeGetRenderType(J)I
.end method

.method private static native nativeGetRider(J)J
.end method

.method private static native nativeGetRiding(J)J
.end method

.method private static native nativeGetTarget(J)J
.end method

.method private static native nativeIsSneaking(J)Z
.end method

.method private static native nativeRemove(J)V
.end method

.method private static native nativeRemoveAllEffects(J)V
.end method

.method private static native nativeRemoveEffect(JI)V
.end method

.method private static native nativeRideAnimal(JJ)V
.end method

.method private static native nativeSetAnimalAge(JI)J
.end method

.method private static native nativeSetArmor(JIII)I
.end method

.method private static native nativeSetArmorCustomName(JILjava/lang/String;)I
.end method

.method private static native nativeSetCarriedItem(JIII)V
.end method

.method private static native nativeSetCollisionSize(JFF)V
.end method

.method private static native nativeSetFireTicks(JI)V
.end method

.method private static native nativeSetHealth(JI)V
.end method

.method private static native nativeSetImmobile(JZ)V
.end method

.method private static native nativeSetMaxHealth(JI)V
.end method

.method private static native nativeSetMobSkin(JLjava/lang/String;)V
.end method

.method private static native nativeSetNameTag(JLjava/lang/String;)V
.end method

.method private static native nativeSetPosition(JFFFZ)F
.end method

.method private static native nativeSetRenderType(JI)V
.end method

.method private static native nativeSetRot(JFF)F
.end method

.method private static native nativeSetSneaking(JZ)V
.end method

.method private static native nativeSetTarget(JJ)J
.end method

.method private static native nativeSetVel(JIF)F
.end method

.method public static remove(Ljava/lang/Object;)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 37
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeRemove(J)V

    .line 38
    return-void
.end method

.method public static removeAllEffects(Ljava/lang/Object;)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 257
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeRemoveAllEffects(J)V

    .line 258
    return-void
.end method

.method public static removeEffect(Ljava/lang/Object;I)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "id"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 252
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeRemoveEffect(JI)V

    .line 253
    return-void
.end method

.method public static rideAnimal(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p0, "rider"    # Ljava/lang/Object;
    .param p1, "mount"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 197
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeRideAnimal(JJ)V

    .line 198
    return-void
.end method

.method public static saveMobSkin(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 4
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "skin"    # Ljava/lang/String;

    .prologue
    .line 282
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    const/4 v1, 0x1

    invoke-interface {v0, v2, v3, v1}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->getMetaForEntity(JZ)Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    move-result-object v0

    sget-object v1, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 283
    invoke-virtual {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->setSkin(Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;Ljava/lang/String;)V

    .line 284
    return-void
.end method

.method public static setAnimalAge(Ljava/lang/Object;I)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "age"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 182
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetAnimalAge(JI)J

    .line 183
    return-void
.end method

.method public static setArmor(Ljava/lang/Object;III)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "slot"    # I
    .param p2, "id"    # I
    .param p3, "damage"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 147
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetArmor(JIII)I

    move-result v0

    return v0
.end method

.method public static setArmorCustomName(Ljava/lang/Object;ILjava/lang/String;)I
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "slot"    # I
    .param p2, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 152
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetArmorCustomName(JILjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static setCape(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 311
    return-void
.end method

.method public static setCarriedItem(Ljava/lang/Object;III)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "id"    # I
    .param p2, "count"    # I
    .param p3, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 262
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetCarriedItem(JIII)V

    .line 263
    return-void
.end method

.method public static setCollisionSize(Ljava/lang/Object;DD)V
    .locals 5
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "x"    # D
    .param p3, "z"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 242
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    double-to-float v2, p1

    double-to-float v3, p3

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetCollisionSize(JFF)V

    .line 243
    return-void
.end method

.method public static setExtraData(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 300
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    invoke-interface {v0, v2, v3, p1, p2}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->set(JLjava/lang/String;Ljava/lang/String;)V

    .line 301
    return-void
.end method

.method public static setFireTicks(Ljava/lang/Object;I)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "ticks"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 222
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetFireTicks(JI)V

    .line 223
    return-void
.end method

.method public static setHealth(Ljava/lang/Object;I)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "hp"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 52
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetHealth(JI)V

    .line 53
    return-void
.end method

.method public static setImmobile(Ljava/lang/Object;Z)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "immobile"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 227
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetImmobile(JZ)V

    .line 228
    return-void
.end method

.method public static setMaxHealth(Ljava/lang/Object;I)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "hp"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 57
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetMaxHealth(JI)V

    .line 58
    return-void
.end method

.method public static setMobSkin(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "skin"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 277
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetMobSkin(JLjava/lang/String;)V

    .line 278
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->saveMobSkin(Ljava/lang/Object;Ljava/lang/String;)V

    .line 279
    return-void
.end method

.method public static setNameTag(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "str"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 192
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetNameTag(JLjava/lang/String;)V

    .line 193
    return-void
.end method

.method public static setPosition(Ljava/lang/Object;DDD)V
    .locals 7
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 102
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    double-to-float v2, p1

    double-to-float v3, p3

    double-to-float v4, p5

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetPosition(JFFFZ)F

    .line 103
    return-void
.end method

.method public static setPositionRelative(Ljava/lang/Object;DDD)V
    .locals 7
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 107
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    double-to-float v2, p1

    double-to-float v3, p3

    double-to-float v4, p5

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetPosition(JFFFZ)F

    .line 108
    return-void
.end method

.method public static setRenderType(Ljava/lang/Object;I)V
    .locals 4
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "renderType"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 293
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetRenderType(JI)V

    .line 294
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    const/4 v1, 0x1

    invoke-interface {v0, v2, v3, v1}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->getMetaForEntity(JZ)Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    move-result-object v0

    sget-object v1, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 295
    invoke-virtual {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->setRenderType(Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;I)V

    .line 296
    return-void
.end method

.method public static setRot(Ljava/lang/Object;DD)V
    .locals 5
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "yaw"    # D
    .param p3, "pitch"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 112
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    double-to-float v2, p1

    double-to-float v3, p3

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetRot(JFF)F

    .line 113
    return-void
.end method

.method public static setSneaking(Ljava/lang/Object;Z)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "sneaking"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 237
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetSneaking(JZ)V

    .line 238
    return-void
.end method

.method public static setTarget(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "target"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 217
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetTarget(JJ)J

    .line 218
    return-void
.end method

.method public static setVelX(Ljava/lang/Object;D)V
    .locals 5
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "vel"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 117
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x0

    double-to-float v3, p1

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetVel(JIF)F

    .line 118
    return-void
.end method

.method public static setVelY(Ljava/lang/Object;D)V
    .locals 5
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "vel"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 122
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x1

    double-to-float v3, p1

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetVel(JIF)F

    .line 123
    return-void
.end method

.method public static setVelZ(Ljava/lang/Object;D)V
    .locals 5
    .param p0, "eid"    # Ljava/lang/Object;
    .param p1, "vel"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 127
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x2

    double-to-float v3, p1

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->nativeSetVel(JIF)F

    .line 128
    return-void
.end method

.method public static spawnMob(DDDILjava/lang/String;)J
    .locals 2
    .param p0, "x"    # D
    .param p2, "y"    # D
    .param p4, "z"    # D
    .param p6, "type"    # I
    .param p7, "texture"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 267
    invoke-static/range {p0 .. p7}, Lio/mrarm/mcpelauncher/modpe/api/Level;->spawnMob(DDDILjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 315
    const-string v0, "Entity"

    return-object v0
.end method
