.class public Lio/mrarm/mcpelauncher/modpe/api/Item;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Item.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static addCraftRecipe(IIILjava/lang/Object;)V
    .locals 9
    .param p0, "id"    # I
    .param p1, "count"    # I
    .param p2, "data"    # I
    .param p3, "arr"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    const/4 v8, 0x3

    .line 33
    const/4 v1, 0x0

    .line 34
    .local v1, "items":[I
    instance-of v6, p3, Lorg/mozilla/javascript/NativeArray;

    if-eqz v6, :cond_5

    move-object v2, p3

    .line 35
    check-cast v2, Lorg/mozilla/javascript/NativeArray;

    .line 36
    .local v2, "narr":Lorg/mozilla/javascript/NativeArray;
    const/4 v5, 0x1

    .line 37
    .local v5, "w":I
    invoke-virtual {v2}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v6

    const/16 v7, 0x1b

    if-le v6, v7, :cond_0

    .line 38
    new-instance v6, Ljava/security/InvalidParameterException;

    const-string v7, "Too many items"

    invoke-direct {v6, v7}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 39
    :cond_0
    invoke-virtual {v2}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v6

    const/16 v7, 0xc

    if-le v6, v7, :cond_3

    .line 40
    const/4 v5, 0x3

    .line 43
    :cond_1
    :goto_0
    mul-int v6, v5, v5

    mul-int/lit8 v6, v6, 0x3

    new-array v1, v6, [I

    .line 44
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v6

    if-ge v0, v6, :cond_4

    .line 45
    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 46
    .local v3, "obj":Ljava/lang/Object;
    instance-of v6, v3, Ljava/lang/Number;

    if-eqz v6, :cond_2

    .line 47
    check-cast v3, Ljava/lang/Number;

    .end local v3    # "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v6

    aput v6, v1, v0

    .line 44
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 41
    .end local v0    # "i":I
    :cond_3
    invoke-virtual {v2}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v6

    if-le v6, v8, :cond_1

    .line 42
    const/4 v5, 0x2

    goto :goto_0

    .line 49
    .restart local v0    # "i":I
    :cond_4
    new-array v4, v8, [I

    .line 50
    .local v4, "result":[I
    const/4 v6, 0x0

    aput p0, v4, v6

    .line 51
    const/4 v6, 0x1

    aput p1, v4, v6

    .line 52
    const/4 v6, 0x2

    aput p2, v4, v6

    .line 53
    invoke-static {v5, v5, v1, v4}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeAddDirectShapedRecipe(II[I[I)V

    .line 57
    return-void

    .line 55
    .end local v0    # "i":I
    .end local v2    # "narr":Lorg/mozilla/javascript/NativeArray;
    .end local v4    # "result":[I
    .end local v5    # "w":I
    :cond_5
    new-instance v6, Ljava/security/InvalidParameterException;

    const-string v7, "Invalid object"

    invoke-direct {v6, v7}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public static addFurnaceRecipe(III)V
    .locals 0
    .param p0, "input"    # I
    .param p1, "output"    # I
    .param p2, "outputData"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 100
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeAddFurnaceRecipe(III)V

    .line 101
    return-void
.end method

.method public static addShapedRecipe(IIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .locals 14
    .param p0, "id"    # I
    .param p1, "count"    # I
    .param p2, "data"    # I
    .param p3, "names"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "defs"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 61
    move-object/from16 v0, p3

    instance-of v1, v0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v1, :cond_0

    move-object/from16 v0, p4

    instance-of v1, v0, Lorg/mozilla/javascript/NativeArray;

    if-nez v1, :cond_1

    .line 62
    :cond_0
    new-instance v1, Ljava/security/InvalidParameterException;

    const-string v2, "Invalid object"

    invoke-direct {v1, v2}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :cond_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .local v10, "namesStr":Ljava/lang/StringBuilder;
    const/4 v5, 0x1

    .local v5, "mW":I
    move-object/from16 v8, p3

    .line 65
    check-cast v8, Lorg/mozilla/javascript/NativeArray;

    .line 66
    .local v8, "arrNames":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v8}, Lorg/mozilla/javascript/NativeArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 67
    .local v11, "o":Ljava/lang/Object;
    instance-of v2, v11, Ljava/lang/String;

    if-eqz v2, :cond_2

    move-object v13, v11

    .line 68
    check-cast v13, Ljava/lang/String;

    .line 69
    .local v13, "s":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_0

    .line 72
    .end local v11    # "o":Ljava/lang/Object;
    .end local v13    # "s":Ljava/lang/String;
    :cond_3
    invoke-virtual {v8}, Lorg/mozilla/javascript/NativeArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 73
    .restart local v11    # "o":Ljava/lang/Object;
    instance-of v2, v11, Ljava/lang/String;

    if-eqz v2, :cond_4

    move-object v13, v11

    .line 74
    check-cast v13, Ljava/lang/String;

    .line 75
    .restart local v13    # "s":Ljava/lang/String;
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v9

    .local v9, "i":I
    :goto_1
    if-ge v9, v5, :cond_4

    .line 77
    const/16 v2, 0x20

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .end local v9    # "i":I
    .end local v11    # "o":Ljava/lang/Object;
    .end local v13    # "s":Ljava/lang/String;
    :cond_5
    move-object/from16 v7, p4

    .line 80
    check-cast v7, Lorg/mozilla/javascript/NativeArray;

    .line 81
    .local v7, "arrDefs":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v7}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v1

    new-array v6, v1, [I

    .line 82
    .local v6, "items":[I
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_2
    invoke-virtual {v7}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v1

    if-ge v9, v1, :cond_a

    .line 83
    invoke-virtual {v7, v9}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 84
    .local v12, "obj":Ljava/lang/Object;
    instance-of v1, v12, Ljava/lang/Number;

    if-eqz v1, :cond_9

    .line 85
    check-cast v12, Ljava/lang/Number;

    .end local v12    # "obj":Ljava/lang/Object;
    invoke-virtual {v12}, Ljava/lang/Number;->intValue()I

    move-result v1

    aput v1, v6, v9

    .line 88
    :cond_6
    :goto_3
    add-int/lit8 v1, v9, 0x1

    invoke-virtual {v7, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 89
    .restart local v12    # "obj":Ljava/lang/Object;
    instance-of v1, v12, Ljava/lang/Number;

    if-eqz v1, :cond_7

    .line 90
    add-int/lit8 v1, v9, 0x1

    check-cast v12, Ljava/lang/Number;

    .end local v12    # "obj":Ljava/lang/Object;
    invoke-virtual {v12}, Ljava/lang/Number;->intValue()I

    move-result v2

    aput v2, v6, v1

    .line 91
    :cond_7
    add-int/lit8 v1, v9, 0x2

    invoke-virtual {v7, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 92
    .restart local v12    # "obj":Ljava/lang/Object;
    instance-of v1, v12, Ljava/lang/Number;

    if-eqz v1, :cond_8

    .line 93
    add-int/lit8 v1, v9, 0x2

    check-cast v12, Ljava/lang/Number;

    .end local v12    # "obj":Ljava/lang/Object;
    invoke-virtual {v12}, Ljava/lang/Number;->intValue()I

    move-result v2

    aput v2, v6, v1

    .line 82
    :cond_8
    add-int/lit8 v9, v9, 0x3

    goto :goto_2

    .line 86
    .restart local v12    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v1, v12, Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 87
    check-cast v12, Ljava/lang/String;

    .end local v12    # "obj":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {v12, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    aput v1, v6, v9

    goto :goto_3

    .line 95
    :cond_a
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move v1, p0

    move v2, p1

    move/from16 v3, p2

    invoke-static/range {v1 .. v6}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeAddShapedRecipe(IIILjava/lang/String;I[I)V

    .line 96
    return-void
.end method

.method public static defineArmor(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;III)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "iconName"    # Ljava/lang/String;
    .param p2, "iconIndex"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "texture"    # Ljava/lang/String;
    .param p5, "damageReduce"    # I
    .param p6, "maxDamage"    # I
    .param p7, "type"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 28
    invoke-static/range {p0 .. p7}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeDefineArmor(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;III)V

    .line 29
    return-void
.end method

.method public static defineThrowable(ILjava/lang/String;ILjava/lang/String;I)V
    .locals 6
    .param p0, "id"    # I
    .param p1, "iconName"    # Ljava/lang/String;
    .param p2, "iconIndex"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "stackSize"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 23
    if-nez p4, :cond_0

    const/16 v4, 0x40

    :goto_0
    const/4 v5, 0x1

    move v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetItem(ILjava/lang/String;ILjava/lang/String;IZ)V

    .line 24
    return-void

    :cond_0
    move v4, p4

    .line 23
    goto :goto_0
.end method

.method public static getMaxDamage(I)I
    .locals 1
    .param p0, "id"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 125
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeGetMaxDamage(I)I

    move-result v0

    return v0
.end method

.method public static getMaxStackSize(I)I
    .locals 1
    .param p0, "id"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 130
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeGetMaxStackSize(I)I

    move-result v0

    return v0
.end method

.method public static getName(IIZ)Ljava/lang/String;
    .locals 1
    .param p0, "id"    # I
    .param p1, "data"    # I
    .param p2, "raw"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 173
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeGetName(IIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTextureCoords(II)[I
    .locals 9
    .param p0, "id"    # I
    .param p1, "data"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x5

    const/4 v5, 0x4

    .line 188
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeGetTextureCoords(II)[F

    move-result-object v0

    .line 189
    .local v0, "ret":[F
    if-nez v0, :cond_0

    .line 190
    const/4 v1, 0x0

    .line 191
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

.method public static getUseAnimation(I)I
    .locals 1
    .param p0, "id"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 145
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeGetUseAnimation(I)I

    move-result v0

    return v0
.end method

.method public static internalNameToId(Ljava/lang/String;)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 178
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeInternalNameToId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static isValidItem(I)Z
    .locals 1
    .param p0, "id"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 150
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeIsValidItem(I)Z

    move-result v0

    return v0
.end method

.method private static native nativeAddDirectShapedRecipe(II[I[I)V
.end method

.method private static native nativeAddFurnaceRecipe(III)V
.end method

.method private static native nativeAddShapedRecipe(IIILjava/lang/String;I[I)V
.end method

.method private static native nativeDefineArmor(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;III)V
.end method

.method private static native nativeGetMaxDamage(I)I
.end method

.method private static native nativeGetMaxStackSize(I)I
.end method

.method private static native nativeGetName(IIZ)Ljava/lang/String;
.end method

.method private static native nativeGetTextureCoords(II)[F
.end method

.method private static native nativeGetUseAnimation(I)I
.end method

.method private static native nativeInternalNameToId(Ljava/lang/String;)I
.end method

.method private static native nativeIsValidItem(I)Z
.end method

.method private static native nativeSetCategory(II)V
.end method

.method private static native nativeSetEnchantType(III)V
.end method

.method private static native nativeSetGlint(IZ)V
.end method

.method private static native nativeSetHandEquipped(IZ)V
.end method

.method private static native nativeSetItem(ILjava/lang/String;ILjava/lang/String;IZ)V
.end method

.method private static native nativeSetMaxDamage(II)V
.end method

.method private static native nativeSetProperties(ILjava/lang/String;)V
.end method

.method private static native nativeSetStackedByData(IZ)V
.end method

.method private static native nativeSetUseAnimation(II)V
.end method

.method private static native nativeTranslatedNameToId(Ljava/lang/String;)I
.end method

.method public static setCategory(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "category"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 105
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetCategory(II)V

    .line 106
    return-void
.end method

.method public static setEnchantType(III)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "slot"    # I
    .param p2, "value"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 168
    invoke-static {p0, p1, p2}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetEnchantType(III)V

    .line 169
    return-void
.end method

.method public static setGlint(IZ)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "glint"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 115
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetGlint(IZ)V

    .line 116
    return-void
.end method

.method public static setHandEquipped(IZ)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "handEquipped"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 110
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetHandEquipped(IZ)V

    .line 111
    return-void
.end method

.method public static setItem(ILjava/lang/String;ILjava/lang/String;I)V
    .locals 6
    .param p0, "id"    # I
    .param p1, "iconName"    # Ljava/lang/String;
    .param p2, "iconIndex"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "stackSize"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 18
    if-nez p4, :cond_0

    const/16 v4, 0x40

    :goto_0
    const/4 v5, 0x0

    move v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetItem(ILjava/lang/String;ILjava/lang/String;IZ)V

    .line 19
    return-void

    :cond_0
    move v4, p4

    .line 18
    goto :goto_0
.end method

.method public static setMaxDamage(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "dmg"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 120
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetMaxDamage(II)V

    .line 121
    return-void
.end method

.method public static setProperties(ILjava/lang/Object;)V
    .locals 5
    .param p0, "id"    # I
    .param p1, "properties"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 155
    const/4 v1, 0x0

    .line 156
    .local v1, "text":Ljava/lang/String;
    instance-of v2, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 157
    check-cast v0, Lorg/mozilla/javascript/Scriptable;

    .line 158
    .local v0, "scriptable":Lorg/mozilla/javascript/Scriptable;
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    invoke-static {v2, v3, p1, v4, v4}, Lorg/mozilla/javascript/NativeJSON;->stringify(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 162
    .end local v0    # "scriptable":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 163
    invoke-static {p0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetProperties(ILjava/lang/String;)V

    .line 164
    :cond_0
    return-void

    .line 160
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static setStackedByData(IZ)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "stackedByData"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 135
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetStackedByData(IZ)V

    .line 136
    return-void
.end method

.method public static setUseAnimation(II)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "useAnimation"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 140
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeSetUseAnimation(II)V

    .line 141
    return-void
.end method

.method public static translatedNameToId(Ljava/lang/String;)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 183
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->nativeTranslatedNameToId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    const-string v0, "Item"

    return-object v0
.end method
