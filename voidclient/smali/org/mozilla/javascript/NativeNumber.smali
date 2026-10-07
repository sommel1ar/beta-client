.class final Lorg/mozilla/javascript/NativeNumber;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeNumber.java"


# static fields
.field private static final ConstructorId_isFinite:I = -0x1

.field private static final ConstructorId_isInteger:I = -0x3

.field private static final ConstructorId_isNaN:I = -0x2

.field private static final ConstructorId_isSafeInteger:I = -0x4

.field private static final ConstructorId_parseFloat:I = -0x5

.field private static final ConstructorId_parseInt:I = -0x6

.field private static final Id_constructor:I = 0x1

.field private static final Id_toExponential:I = 0x7

.field private static final Id_toFixed:I = 0x6

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toPrecision:I = 0x8

.field private static final Id_toSource:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x5

.field private static final MAX_PRECISION:I = 0x64

.field private static final MAX_PROTOTYPE_ID:I = 0x8

.field private static final MAX_SAFE_INTEGER:D

.field private static final MIN_SAFE_INTEGER:D

.field private static final NUMBER_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = 0x30a28b6f31d79da5L


# instance fields
.field private doubleValue:D


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 20
    const-string v0, "Number"

    sput-object v0, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    .line 23
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    const-wide v2, 0x404a800000000000L    # 53.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, v2

    sput-wide v0, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    .line 24
    sget-wide v0, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    neg-double v0, v0

    sput-wide v0, Lorg/mozilla/javascript/NativeNumber;->MIN_SAFE_INTEGER:D

    return-void
.end method

.method constructor <init>(D)V
    .locals 1
    .param p1, "number"    # D

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 34
    iput-wide p1, p0, Lorg/mozilla/javascript/NativeNumber;->doubleValue:D

    .line 35
    return-void
.end method

.method private doubleVal(Ljava/lang/Number;)Ljava/lang/Double;
    .locals 3
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 317
    instance-of v2, p1, Ljava/lang/Double;

    if-eqz v2, :cond_0

    .line 318
    check-cast p1, Ljava/lang/Double;

    .line 321
    .end local p1    # "val":Ljava/lang/Number;
    :goto_0
    return-object p1

    .line 320
    .restart local p1    # "val":Ljava/lang/Number;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 321
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    goto :goto_0
.end method

.method private execConstructorCall(I[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 193
    packed-switch p1, :pswitch_data_0

    .line 238
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :pswitch_0
    array-length v0, p2

    if-eqz v0, :cond_0

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_1

    .line 196
    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 235
    :goto_0
    return-object v0

    .line 198
    :cond_1
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 200
    aget-object v0, p2, v2

    invoke-static {v0}, Lorg/mozilla/javascript/NativeNumber;->isFinite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 202
    :cond_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 205
    :pswitch_1
    array-length v0, p2

    if-eqz v0, :cond_3

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_4

    .line 206
    :cond_3
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 208
    :cond_4
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_5

    .line 209
    aget-object v0, p2, v2

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isNaN(Ljava/lang/Number;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 211
    :cond_5
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 214
    :pswitch_2
    array-length v0, p2

    if-eqz v0, :cond_6

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_7

    .line 215
    :cond_6
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 217
    :cond_7
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_8

    .line 218
    aget-object v0, p2, v2

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isInteger(Ljava/lang/Number;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 220
    :cond_8
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 223
    :pswitch_3
    array-length v0, p2

    if-eqz v0, :cond_9

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_a

    .line 224
    :cond_9
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 226
    :cond_a
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_b

    .line 227
    aget-object v0, p2, v2

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isSafeInteger(Ljava/lang/Number;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 229
    :cond_b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 232
    :pswitch_4
    invoke-static {p2}, Lorg/mozilla/javascript/NativeGlobal;->js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_0

    .line 235
    :pswitch_5
    invoke-static {p2}, Lorg/mozilla/javascript/NativeGlobal;->js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_0

    .line 193
    :pswitch_data_0
    .packed-switch -0x6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/NativeNumber;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Lorg/mozilla/javascript/NativeNumber;-><init>(D)V

    .line 29
    .local v0, "obj":Lorg/mozilla/javascript/NativeNumber;
    const/16 v1, 0x8

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeNumber;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 30
    return-void
.end method

.method private isDoubleInteger(Ljava/lang/Double;)Z
    .locals 4
    .param p1, "d"    # Ljava/lang/Double;

    .prologue
    .line 298
    invoke-virtual {p1}, Ljava/lang/Double;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isDoubleNan(Ljava/lang/Double;)Z
    .locals 1
    .param p1, "d"    # Ljava/lang/Double;

    .prologue
    .line 287
    invoke-virtual {p1}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    return v0
.end method

.method private isDoubleSafeInteger(Ljava/lang/Double;)Z
    .locals 4
    .param p1, "d"    # Ljava/lang/Double;

    .prologue
    .line 310
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->isDoubleInteger(Ljava/lang/Double;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    sget-wide v2, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    sget-wide v2, Lorg/mozilla/javascript/NativeNumber;->MIN_SAFE_INTEGER:D

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isFinite(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 274
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 275
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 276
    .local v2, "nd":Ljava/lang/Double;
    invoke-virtual {v2}, Ljava/lang/Double;->isInfinite()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Ljava/lang/Double;->isNaN()Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    return-object v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private isInteger(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 292
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 293
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isDoubleInteger(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private isNaN(Ljava/lang/Number;)Ljava/lang/Object;
    .locals 2
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 281
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 282
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isDoubleNan(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method private isSafeInteger(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 304
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 305
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isDoubleSafeInteger(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private static num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;
    .locals 10
    .param p0, "val"    # D
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "zeroArgMode"    # I
    .param p4, "oneArgMode"    # I
    .param p5, "precisionMin"    # I
    .param p6, "precisionOffset"    # I

    .prologue
    const/4 v8, 0x0

    .line 253
    array-length v5, p2

    if-nez v5, :cond_0

    .line 254
    const/4 v1, 0x0

    .line 255
    .local v1, "precision":I
    move p4, p3

    .line 267
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 268
    .local v4, "sb":Ljava/lang/StringBuilder;
    add-int v5, v1, p6

    invoke-static {v4, p4, v5, p0, p1}, Lorg/mozilla/javascript/DToA;->JS_dtostr(Ljava/lang/StringBuilder;IID)V

    .line 269
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 259
    .end local v1    # "precision":I
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    aget-object v5, p2, v8

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v2

    .line 260
    .local v2, "p":D
    int-to-double v6, p5

    cmpg-double v5, v2, v6

    if-ltz v5, :cond_1

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    cmpl-double v5, v2, v6

    if-lez v5, :cond_2

    .line 261
    :cond_1
    const-string v5, "msg.bad.precision"

    aget-object v6, p2, v8

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "msg":Ljava/lang/String;
    const-string v5, "RangeError"

    invoke-static {v5, v0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v5

    throw v5

    .line 265
    .end local v0    # "msg":Ljava/lang/String;
    :cond_2
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(D)I

    move-result v1

    .restart local v1    # "precision":I
    goto :goto_0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 103
    sget-object v4, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 104
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 183
    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    return-object v4

    .line 106
    .restart local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v10

    .line 107
    .local v10, "id":I
    const/4 v4, 0x1

    if-ne v10, v4, :cond_3

    .line 108
    move-object/from16 v0, p5

    array-length v4, v0

    const/4 v5, 0x1

    if-lt v4, v5, :cond_1

    const/4 v4, 0x0

    aget-object v4, p5, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v12

    .line 110
    .local v12, "val":D
    :goto_1
    if-nez p4, :cond_2

    .line 112
    new-instance v4, Lorg/mozilla/javascript/NativeNumber;

    invoke-direct {v4, v12, v13}, Lorg/mozilla/javascript/NativeNumber;-><init>(D)V

    goto :goto_0

    .line 108
    .end local v12    # "val":D
    :cond_1
    const-wide/16 v12, 0x0

    goto :goto_1

    .line 115
    .restart local v12    # "val":D
    :cond_2
    invoke-static {v12, v13}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    goto :goto_0

    .line 117
    .end local v12    # "val":D
    :cond_3
    const/4 v4, 0x1

    if-ge v10, v4, :cond_4

    .line 118
    move-object/from16 v0, p5

    invoke-direct {p0, v10, v0}, Lorg/mozilla/javascript/NativeNumber;->execConstructorCall(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 123
    :cond_4
    move-object/from16 v0, p4

    instance-of v4, v0, Lorg/mozilla/javascript/NativeNumber;

    if-nez v4, :cond_5

    .line 124
    invoke-static {p1}, Lorg/mozilla/javascript/NativeNumber;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v4

    throw v4

    .line 125
    :cond_5
    check-cast p4, Lorg/mozilla/javascript/NativeNumber;

    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p4

    iget-wide v2, v0, Lorg/mozilla/javascript/NativeNumber;->doubleValue:D

    .line 127
    .local v2, "value":D
    packed-switch v10, :pswitch_data_0

    .line 187
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 133
    :pswitch_0
    move-object/from16 v0, p5

    array-length v4, v0

    if-eqz v4, :cond_6

    const/4 v4, 0x0

    aget-object v4, p5, v4

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v4, v5, :cond_7

    :cond_6
    const/16 v9, 0xa

    .line 135
    .local v9, "base":I
    :goto_2
    invoke-static {v2, v3, v9}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 133
    .end local v9    # "base":I
    :cond_7
    const/4 v4, 0x0

    aget-object v4, p5, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v9

    goto :goto_2

    .line 139
    :pswitch_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(new Number("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "))"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 142
    :pswitch_2
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    goto/16 :goto_0

    .line 145
    :pswitch_3
    const/4 v5, 0x2

    const/4 v6, 0x2

    const/16 v7, -0x14

    const/4 v8, 0x0

    move-object/from16 v4, p5

    invoke-static/range {v2 .. v8}, Lorg/mozilla/javascript/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 150
    :pswitch_4
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 151
    const-string v4, "NaN"

    goto/16 :goto_0

    .line 153
    :cond_8
    invoke-static {v2, v3}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 154
    const-wide/16 v4, 0x0

    cmpl-double v4, v2, v4

    if-ltz v4, :cond_9

    .line 155
    const-string v4, "Infinity"

    goto/16 :goto_0

    .line 158
    :cond_9
    const-string v4, "-Infinity"

    goto/16 :goto_0

    .line 162
    :cond_a
    const/4 v5, 0x1

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object/from16 v4, p5

    invoke-static/range {v2 .. v8}, Lorg/mozilla/javascript/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 168
    :pswitch_5
    move-object/from16 v0, p5

    array-length v4, v0

    if-eqz v4, :cond_b

    const/4 v4, 0x0

    aget-object v4, p5, v4

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v4, v5, :cond_c

    .line 169
    :cond_b
    const/16 v4, 0xa

    invoke-static {v2, v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 172
    :cond_c
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 173
    const-string v4, "NaN"

    goto/16 :goto_0

    .line 175
    :cond_d
    invoke-static {v2, v3}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 176
    const-wide/16 v4, 0x0

    cmpl-double v4, v2, v4

    if-ltz v4, :cond_e

    .line 177
    const-string v4, "Infinity"

    goto/16 :goto_0

    .line 180
    :cond_e
    const-string v4, "-Infinity"

    goto/16 :goto_0

    .line 183
    :cond_f
    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object/from16 v4, p5

    invoke-static/range {v2 .. v8}, Lorg/mozilla/javascript/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 127
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .locals 7
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x7

    .line 46
    const/4 v6, 0x7

    .line 50
    .local v6, "attr":I
    const-string v0, "NaN"

    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 51
    const-string v0, "POSITIVE_INFINITY"

    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 54
    const-string v0, "NEGATIVE_INFINITY"

    const-wide/high16 v2, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 57
    const-string v0, "MAX_VALUE"

    const-wide v2, 0x7fefffffffffffffL    # Double.MAX_VALUE

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 60
    const-string v0, "MIN_VALUE"

    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 63
    const-string v0, "MAX_SAFE_INTEGER"

    sget-wide v2, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 66
    const-string v0, "MIN_SAFE_INTEGER"

    sget-wide v2, Lorg/mozilla/javascript/NativeNumber;->MIN_SAFE_INTEGER:D

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 70
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "isFinite"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 71
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x2

    const-string v4, "isNaN"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 72
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x3

    const-string v4, "isInteger"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 73
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x4

    const-string v4, "isSafeInteger"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 74
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "parseFloat"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 75
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "parseInt"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 77
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 78
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x74

    .line 332
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 333
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 349
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 353
    :cond_1
    return v2

    .line 334
    :pswitch_1
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 335
    .local v1, "c":I
    if-ne v1, v4, :cond_2

    const-string v0, "toFixed"

    const/4 v2, 0x6

    goto :goto_0

    .line 336
    :cond_2
    const/16 v3, 0x76

    if-ne v1, v3, :cond_0

    const-string v0, "valueOf"

    const/4 v2, 0x5

    goto :goto_0

    .line 338
    .end local v1    # "c":I
    :pswitch_2
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 339
    .restart local v1    # "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_3

    const-string v0, "toSource"

    const/4 v2, 0x4

    goto :goto_0

    .line 340
    :cond_3
    if-ne v1, v4, :cond_0

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_0

    .line 342
    .end local v1    # "c":I
    :pswitch_3
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 343
    .restart local v1    # "c":I
    const/16 v3, 0x63

    if-ne v1, v3, :cond_4

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_0

    .line 344
    :cond_4
    if-ne v1, v4, :cond_0

    const-string v0, "toPrecision"

    const/16 v2, 0x8

    goto :goto_0

    .line 346
    .end local v1    # "c":I
    :pswitch_4
    const-string v0, "toExponential"

    const/4 v2, 0x7

    goto :goto_0

    .line 347
    :pswitch_5
    const-string v0, "toLocaleString"

    const/4 v2, 0x3

    goto :goto_0

    .line 333
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    const-string v0, "Number"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 85
    packed-switch p1, :pswitch_data_0

    .line 94
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 96
    .local v1, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeNumber;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 97
    return-void

    .line 87
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 88
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 89
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 90
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 91
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toFixed"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toExponential"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toPrecision"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 85
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 244
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeNumber;->doubleValue:D

    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
