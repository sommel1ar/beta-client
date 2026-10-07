.class public Lio/mrarm/mcpelauncher/modpe/api/Block;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Block.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static defineBlock(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 8
    .param p0, "id"    # I
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "texture"    # Ljava/lang/Object;
    .param p3, "material"    # Ljava/lang/Object;
    .param p4, "opaque"    # Ljava/lang/Object;
    .param p5, "renderType"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 55
    invoke-static {p2}, Lio/mrarm/mcpelauncher/modpe/api/Block;->toTextureDef(Ljava/lang/Object;)Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;

    move-result-object v7

    .line 56
    .local v7, "tex":Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;
    const/4 v5, 0x1

    .line 57
    .local v5, "isOpaque":Z
    if-eqz p4, :cond_0

    instance-of v0, p4, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 58
    check-cast p4, Ljava/lang/Boolean;

    .end local p4    # "opaque":Ljava/lang/Object;
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    .line 59
    :cond_0
    const/4 v4, 0x1

    .line 60
    .local v4, "materialId":I
    if-eqz p3, :cond_1

    instance-of v0, p3, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 61
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "material":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 62
    :cond_1
    const/4 v6, 0x0

    .line 63
    .local v6, "renderTypeId":I
    if-eqz p5, :cond_2

    instance-of v0, p5, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 64
    check-cast p5, Ljava/lang/Number;

    .end local p5    # "renderType":Ljava/lang/Object;
    invoke-virtual {p5}, Ljava/lang/Number;->intValue()I

    move-result v6

    .line 65
    :cond_2
    iget-object v2, v7, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;->textures:[Ljava/lang/String;

    iget-object v3, v7, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;->textureIds:[I

    move v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v6}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeDefineBlock(ILjava/lang/String;[Ljava/lang/String;[IIZI)V

    .line 66
    return-void
.end method

.method public static defineLiquidBlock(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p0, "id"    # I
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "texture"    # Ljava/lang/Object;
    .param p3, "material"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 70
    invoke-static {p2}, Lio/mrarm/mcpelauncher/modpe/api/Block;->toTextureDef(Ljava/lang/Object;)Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;

    move-result-object v1

    .line 71
    .local v1, "tex":Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;
    const/4 v0, 0x1

    .line 72
    .local v0, "materialId":I
    if-eqz p3, :cond_0

    instance-of v2, p3, Ljava/lang/Number;

    if-eqz v2, :cond_0

    .line 73
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "material":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 74
    :cond_0
    iget-object v2, v1, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;->textures:[Ljava/lang/String;

    iget-object v3, v1, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;->textureIds:[I

    invoke-static {p0, p1, v2, v3, v0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeDefineLiquidBlock(ILjava/lang/String;[Ljava/lang/String;[II)V

    .line 75
    return-void
.end method

.method public static getAllBlockIds()[I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 79
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeGetAllBlockIds()[I

    move-result-object v0

    return-object v0
.end method

.method public static getDestroyTime(II)D
    .locals 2
    .param p0, "id"    # I
    .param p1, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 94
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeGetDestroyTime(I)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getFriction(II)D
    .locals 2
    .param p0, "id"    # I
    .param p1, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 84
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeGetFriction(I)F

    move-result v0

    float-to-double v0, v0

    return-wide v0
.end method

.method public static getRenderType(I)I
    .locals 1
    .param p0, "id"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 114
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeGetRenderType(I)I

    move-result v0

    return v0
.end method

.method public static getTextureCoords(III)[I
    .locals 9
    .param p0, "id"    # I
    .param p1, "data"    # I
    .param p2, "side"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x5

    const/4 v5, 0x4

    .line 157
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeGetTextureCoords(III)[F

    move-result-object v0

    .line 158
    .local v0, "ret":[F
    if-nez v0, :cond_0

    .line 159
    const/4 v1, 0x0

    .line 160
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x6

    new-array v1, v1, [I

    aget v2, v0, v4

    aget v3, v0, v5

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    aput v2, v1, v4

    aget v2, v0, v7

    aget v3, v0, v6

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    aput v2, v1, v7

    aget v2, v0, v8

    aget v3, v0, v5

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    aput v2, v1, v8

    const/4 v2, 0x3

    const/4 v3, 0x3

    aget v3, v0, v3

    aget v4, v0, v6

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    aput v3, v1, v2

    aget v2, v0, v5

    float-to-int v2, v2

    aput v2, v1, v5

    aget v2, v0, v6

    float-to-int v2, v2

    aput v2, v1, v6

    goto :goto_0
.end method

.method private static native nativeDefineBlock(ILjava/lang/String;[Ljava/lang/String;[IIZI)V
.end method

.method private static native nativeDefineLiquidBlock(ILjava/lang/String;[Ljava/lang/String;[II)V
.end method

.method private static native nativeGetAllBlockIds()[I
.end method

.method private static native nativeGetDestroyTime(I)F
.end method

.method private static native nativeGetFriction(I)F
.end method

.method private static native nativeGetRenderType(I)I
.end method

.method private static native nativeGetTextureCoords(III)[F
.end method

.method private static native nativeSetColor(I[I)V
.end method

.method private static native nativeSetDestroyTime(IF)V
.end method

.method private static native nativeSetExplosionResistance(IF)V
.end method

.method private static native nativeSetFriction(IF)V
.end method

.method private static native nativeSetLightLevel(II)V
.end method

.method private static native nativeSetLightOpacity(II)V
.end method

.method private static native nativeSetRedstoneConsumer(IZ)V
.end method

.method private static native nativeSetRenderLayer(II)V
.end method

.method private static native nativeSetRenderType(II)V
.end method

.method private static native nativeSetShape(IFFFFFFI)V
.end method

.method public static setColor(ILorg/mozilla/javascript/Scriptable;)V
    .locals 7
    .param p0, "id"    # I
    .param p1, "arr"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 144
    instance-of v5, p1, Lorg/mozilla/javascript/NativeArray;

    if-nez v5, :cond_0

    .line 145
    new-instance v5, Ljava/security/InvalidParameterException;

    const-string v6, "Not an array"

    invoke-direct {v5, v6}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    move-object v3, p1

    .line 146
    check-cast v3, Lorg/mozilla/javascript/NativeArray;

    .line 147
    .local v3, "narr":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v3}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v5

    new-array v2, v5, [I

    .line 148
    .local v2, "iarr":[I
    const/4 v0, 0x0

    .line 149
    .local v0, "i":I
    invoke-virtual {v3}, Lorg/mozilla/javascript/NativeArray;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 150
    .local v4, "o":Ljava/lang/Object;
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    aput v5, v2, v0

    move v0, v1

    .line 151
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 152
    .end local v4    # "o":Ljava/lang/Object;
    :cond_1
    invoke-static {p0, v2}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetColor(I[I)V

    .line 153
    return-void
.end method

.method public static setDestroyTime(ID)V
    .locals 1
    .param p0, "id"    # I
    .param p1, "time"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 99
    double-to-float v0, p1

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetDestroyTime(IF)V

    .line 100
    return-void
.end method

.method public static setExplosionResistance(ID)V
    .locals 1
    .param p0, "id"    # I
    .param p1, "resistance"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 134
    double-to-float v0, p1

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetExplosionResistance(IF)V

    .line 135
    return-void
.end method

.method public static setFriction(ID)V
    .locals 1
    .param p0, "id"    # I
    .param p1, "friction"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 89
    double-to-float v0, p1

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetFriction(IF)V

    .line 90
    return-void
.end method

.method public static setLightLevel(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "level"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 104
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetLightLevel(II)V

    .line 105
    return-void
.end method

.method public static setLightOpacity(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "opacity"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 109
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetLightOpacity(II)V

    .line 110
    return-void
.end method

.method public static setRedstoneConsumer(IZ)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "consumer"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 129
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetRedstoneConsumer(IZ)V

    .line 130
    return-void
.end method

.method public static setRenderLayer(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "layer"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 124
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetRenderLayer(II)V

    .line 125
    return-void
.end method

.method public static setRenderType(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "type"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 119
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetRenderType(II)V

    .line 120
    return-void
.end method

.method public static setShape(IDDDDDDI)V
    .locals 11
    .param p0, "id"    # I
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "z1"    # D
    .param p7, "x2"    # D
    .param p9, "y2"    # D
    .param p11, "z2"    # D
    .param p13, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 139
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

    invoke-static/range {v2 .. v9}, Lio/mrarm/mcpelauncher/modpe/api/Block;->nativeSetShape(IFFFFFFI)V

    .line 140
    return-void
.end method

.method private static toTextureDef(Ljava/lang/Object;)Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;
    .locals 9
    .param p0, "texture"    # Ljava/lang/Object;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    .local v4, "textures":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 25
    .local v3, "textureIds":[I
    instance-of v5, p0, Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 26
    new-array v4, v8, [Ljava/lang/String;

    .line 27
    new-array v3, v8, [I

    .line 28
    check-cast p0, Ljava/lang/String;

    .end local p0    # "texture":Ljava/lang/Object;
    aput-object p0, v4, v7

    .line 29
    aput v7, v3, v7

    .line 50
    :cond_0
    new-instance v5, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;

    invoke-direct {v5, v4, v3}, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;-><init>([Ljava/lang/String;[I)V

    return-object v5

    .line 30
    .restart local p0    # "texture":Ljava/lang/Object;
    :cond_1
    instance-of v5, p0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v5, :cond_5

    move-object v1, p0

    .line 31
    check-cast v1, Lorg/mozilla/javascript/NativeArray;

    .line 32
    .local v1, "narr":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v5

    new-array v4, v5, [Ljava/lang/String;

    .line 33
    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v5

    new-array v3, v5, [I

    .line 34
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 35
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Lorg/mozilla/javascript/NativeArray;

    if-eqz v5, :cond_3

    .line 36
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/NativeArray;

    .line 37
    .local v2, "subArr":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v2, v7}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v4, v0

    .line 38
    invoke-virtual {v2}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_2

    .line 39
    invoke-virtual {v2, v8}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    aput v5, v3, v0

    .line 34
    .end local v2    # "subArr":Lorg/mozilla/javascript/NativeArray;
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 40
    :cond_3
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 41
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v4, v0

    .line 42
    aput v7, v3, v0

    goto :goto_1

    .line 44
    :cond_4
    new-instance v5, Ljava/security/InvalidParameterException;

    const-string v6, "defineBlock: texture in array is neither an array nor string"

    invoke-direct {v5, v6}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 48
    .end local v0    # "i":I
    .end local v1    # "narr":Lorg/mozilla/javascript/NativeArray;
    :cond_5
    new-instance v5, Ljava/security/InvalidParameterException;

    const-string v6, "defineBlock: texture is neither an array nor string"

    invoke-direct {v5, v6}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    const-string v0, "Block"

    return-object v0
.end method
