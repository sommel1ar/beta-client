.class final Lorg/mozilla/javascript/NativeMath;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeMath.java"


# static fields
.field private static final Id_E:I = 0x1e

.field private static final Id_LN10:I = 0x20

.field private static final Id_LN2:I = 0x21

.field private static final Id_LOG10E:I = 0x23

.field private static final Id_LOG2E:I = 0x22

.field private static final Id_PI:I = 0x1f

.field private static final Id_SQRT1_2:I = 0x24

.field private static final Id_SQRT2:I = 0x25

.field private static final Id_abs:I = 0x2

.field private static final Id_acos:I = 0x3

.field private static final Id_asin:I = 0x4

.field private static final Id_atan:I = 0x5

.field private static final Id_atan2:I = 0x6

.field private static final Id_cbrt:I = 0x14

.field private static final Id_ceil:I = 0x7

.field private static final Id_cos:I = 0x8

.field private static final Id_cosh:I = 0x15

.field private static final Id_exp:I = 0x9

.field private static final Id_expm1:I = 0x16

.field private static final Id_floor:I = 0xa

.field private static final Id_hypot:I = 0x17

.field private static final Id_imul:I = 0x1c

.field private static final Id_log:I = 0xb

.field private static final Id_log10:I = 0x19

.field private static final Id_log1p:I = 0x18

.field private static final Id_max:I = 0xc

.field private static final Id_min:I = 0xd

.field private static final Id_pow:I = 0xe

.field private static final Id_random:I = 0xf

.field private static final Id_round:I = 0x10

.field private static final Id_sin:I = 0x11

.field private static final Id_sinh:I = 0x1a

.field private static final Id_sqrt:I = 0x12

.field private static final Id_tan:I = 0x13

.field private static final Id_tanh:I = 0x1b

.field private static final Id_toSource:I = 0x1

.field private static final Id_trunc:I = 0x1d

.field private static final LAST_METHOD_ID:I = 0x1d

.field private static final MATH_TAG:Ljava/lang/Object;

.field private static final MAX_ID:I = 0x25

.field static final serialVersionUID:J = -0x7aa9e4af6da33631L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "Math"

    sput-object v0, Lorg/mozilla/javascript/NativeMath;->MATH_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 36
    return-void
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 25
    new-instance v0, Lorg/mozilla/javascript/NativeMath;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeMath;-><init>()V

    .line 26
    .local v0, "obj":Lorg/mozilla/javascript/NativeMath;
    const/16 v1, 0x25

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeMath;->activatePrototypeMap(I)V

    .line 27
    invoke-static {p0}, Lorg/mozilla/javascript/NativeMath;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeMath;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 28
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeMath;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 29
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeMath;->sealObject()V

    .line 30
    :cond_0
    const-string v1, "Math"

    const/4 v2, 0x2

    invoke-static {p0, v1, v0, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 32
    return-void
.end method

.method private js_hypot([Ljava/lang/Object;)D
    .locals 12
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 343
    if-nez p1, :cond_1

    .line 344
    const-wide/16 v2, 0x0

    .line 358
    :cond_0
    :goto_0
    return-wide v2

    .line 346
    :cond_1
    const-wide/16 v6, 0x0

    .line 348
    .local v6, "y":D
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v4, :cond_4

    aget-object v5, v0, v1

    .line 349
    .local v5, "o":Ljava/lang/Object;
    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 350
    .local v2, "d":D
    sget-wide v10, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    cmpl-double v10, v2, v10

    if-eqz v10, :cond_0

    .line 353
    cmpl-double v10, v2, v8

    if-eqz v10, :cond_2

    const-wide/high16 v10, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v10, v2, v10

    if-nez v10, :cond_3

    :cond_2
    move-wide v2, v8

    .line 354
    goto :goto_0

    .line 356
    :cond_3
    mul-double v10, v2, v2

    add-double/2addr v6, v10

    .line 348
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 358
    .end local v2    # "d":D
    .end local v5    # "o":Ljava/lang/Object;
    :cond_4
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    goto :goto_0
.end method

.method private js_imul([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide v10, 0x100000000L

    .line 369
    if-eqz p1, :cond_0

    array-length v8, p1

    const/4 v9, 0x2

    if-ge v8, v9, :cond_1

    .line 370
    :cond_0
    sget-wide v8, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    invoke-static {v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    .line 377
    :goto_0
    return-object v8

    .line 373
    :cond_1
    const/4 v8, 0x0

    aget-object v8, p1, v8

    invoke-static {v8}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint32(Ljava/lang/Object;)J

    move-result-wide v4

    .line 374
    .local v4, "x":J
    const/4 v8, 0x1

    aget-object v8, p1, v8

    invoke-static {v8}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint32(Ljava/lang/Object;)J

    move-result-wide v6

    .line 375
    .local v6, "y":J
    mul-long v8, v4, v6

    rem-long v0, v8, v10

    .line 376
    .local v0, "product":J
    const-wide v8, 0x80000000L

    cmp-long v8, v0, v8

    if-ltz v8, :cond_2

    sub-long v2, v0, v10

    .line 377
    .local v2, "result":J
    :goto_1
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    goto :goto_0

    .end local v2    # "result":J
    :cond_2
    move-wide v2, v0

    .line 376
    goto :goto_1
.end method

.method private js_pow(DD)D
    .locals 9
    .param p1, "x"    # D
    .param p3, "y"    # D

    .prologue
    .line 288
    cmpl-double v4, p3, p3

    if-eqz v4, :cond_1

    .line 290
    move-wide v0, p3

    .line 337
    .local v0, "result":D
    :cond_0
    :goto_0
    return-wide v0

    .line 291
    .end local v0    # "result":D
    :cond_1
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-nez v4, :cond_2

    .line 293
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .restart local v0    # "result":D
    goto :goto_0

    .line 294
    .end local v0    # "result":D
    :cond_2
    const-wide/16 v4, 0x0

    cmpl-double v4, p1, v4

    if-nez v4, :cond_8

    .line 296
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    div-double/2addr v4, p1

    const-wide/16 v6, 0x0

    cmpl-double v4, v4, v6

    if-lez v4, :cond_4

    .line 297
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_3

    const-wide/16 v0, 0x0

    .restart local v0    # "result":D
    :goto_1
    goto :goto_0

    .end local v0    # "result":D
    :cond_3
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_1

    .line 300
    :cond_4
    double-to-long v2, p3

    .line 301
    .local v2, "y_long":J
    long-to-double v4, v2

    cmpl-double v4, v4, p3

    if-nez v4, :cond_6

    const-wide/16 v4, 0x1

    and-long/2addr v4, v2

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_6

    .line 302
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_5

    const-wide/high16 v0, -0x8000000000000000L

    .restart local v0    # "result":D
    :goto_2
    goto :goto_0

    .end local v0    # "result":D
    :cond_5
    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    goto :goto_2

    .line 304
    :cond_6
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_7

    const-wide/16 v0, 0x0

    .restart local v0    # "result":D
    :goto_3
    goto :goto_0

    .end local v0    # "result":D
    :cond_7
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_3

    .line 308
    .end local v2    # "y_long":J
    :cond_8
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 309
    .restart local v0    # "result":D
    cmpl-double v4, v0, v0

    if-eqz v4, :cond_0

    .line 312
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, p3, v4

    if-nez v4, :cond_b

    .line 313
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, p1, v4

    if-ltz v4, :cond_9

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_a

    .line 314
    :cond_9
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_0

    .line 315
    :cond_a
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, p1, v4

    if-gez v4, :cond_0

    .line 316
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 318
    :cond_b
    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v4, p3, v4

    if-nez v4, :cond_e

    .line 319
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, p1, v4

    if-ltz v4, :cond_c

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_d

    .line 320
    :cond_c
    const-wide/16 v0, 0x0

    goto/16 :goto_0

    .line 321
    :cond_d
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, p1, v4

    if-gez v4, :cond_0

    .line 322
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto/16 :goto_0

    .line 324
    :cond_e
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, p1, v4

    if-nez v4, :cond_10

    .line 325
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_f

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    :goto_4
    goto/16 :goto_0

    :cond_f
    const-wide/16 v0, 0x0

    goto :goto_4

    .line 326
    :cond_10
    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v4, p1, v4

    if-nez v4, :cond_0

    .line 327
    double-to-long v2, p3

    .line 328
    .restart local v2    # "y_long":J
    long-to-double v4, v2

    cmpl-double v4, v4, p3

    if-nez v4, :cond_12

    const-wide/16 v4, 0x1

    and-long/2addr v4, v2

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_12

    .line 330
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_11

    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    :goto_5
    goto/16 :goto_0

    :cond_11
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_5

    .line 332
    :cond_12
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_13

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    :goto_6
    goto/16 :goto_0

    :cond_13
    const-wide/16 v0, 0x0

    goto :goto_6
.end method

.method private js_trunc(D)D
    .locals 3
    .param p1, "d"    # D

    .prologue
    .line 363
    const-wide/16 v0, 0x0

    cmpg-double v0, p1, v0

    if-gez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    goto :goto_0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 103
    sget-object v8, Lorg/mozilla/javascript/NativeMath;->MATH_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v8}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 104
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 282
    :goto_0
    return-object v8

    .line 107
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v3

    .line 108
    .local v3, "methodId":I
    packed-switch v3, :pswitch_data_0

    .line 280
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 110
    :pswitch_0
    const-string v8, "Math"

    goto :goto_0

    .line 113
    :pswitch_1
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 115
    .local v6, "x":D
    const-wide/16 v8, 0x0

    cmpl-double v8, v6, v8

    if-nez v8, :cond_2

    const-wide/16 v6, 0x0

    .line 282
    :cond_1
    :goto_1
    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    goto :goto_0

    .line 115
    :cond_2
    const-wide/16 v8, 0x0

    cmpg-double v8, v6, v8

    if-gez v8, :cond_1

    neg-double v6, v6

    goto :goto_1

    .line 120
    .end local v6    # "x":D
    :pswitch_2
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 121
    .restart local v6    # "x":D
    cmpl-double v8, v6, v6

    if-nez v8, :cond_4

    const-wide/high16 v8, -0x4010000000000000L    # -1.0

    cmpg-double v8, v8, v6

    if-gtz v8, :cond_4

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    cmpg-double v8, v6, v8

    if-gtz v8, :cond_4

    .line 122
    const/4 v8, 0x3

    if-ne v3, v8, :cond_3

    invoke-static {v6, v7}, Ljava/lang/Math;->acos(D)D

    move-result-wide v6

    :goto_2
    goto :goto_1

    :cond_3
    invoke-static {v6, v7}, Ljava/lang/Math;->asin(D)D

    move-result-wide v6

    goto :goto_2

    .line 124
    :cond_4
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 126
    goto :goto_1

    .line 129
    .end local v6    # "x":D
    :pswitch_3
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 130
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->atan(D)D

    move-result-wide v6

    .line 131
    goto :goto_1

    .line 134
    .end local v6    # "x":D
    :pswitch_4
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 135
    .restart local v6    # "x":D
    const/4 v8, 0x1

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v6

    .line 136
    goto :goto_1

    .line 139
    .end local v6    # "x":D
    :pswitch_5
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 140
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v6

    .line 141
    goto :goto_1

    .line 144
    .end local v6    # "x":D
    :pswitch_6
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 145
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    .line 146
    goto :goto_1

    .line 149
    .end local v6    # "x":D
    :pswitch_7
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 150
    .restart local v6    # "x":D
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_5

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_6

    :cond_5
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 153
    :goto_3
    goto :goto_1

    .line 150
    :cond_6
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    goto :goto_3

    .line 156
    .end local v6    # "x":D
    :pswitch_8
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 157
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->cosh(D)D

    move-result-wide v6

    .line 158
    goto/16 :goto_1

    .line 161
    .end local v6    # "x":D
    :pswitch_9
    invoke-direct {p0, p5}, Lorg/mozilla/javascript/NativeMath;->js_hypot([Ljava/lang/Object;)D

    move-result-wide v6

    .line 162
    .restart local v6    # "x":D
    goto/16 :goto_1

    .line 165
    .end local v6    # "x":D
    :pswitch_a
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 166
    .restart local v6    # "x":D
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_7

    .line 169
    :goto_4
    goto/16 :goto_1

    .line 166
    :cond_7
    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_8

    const-wide/16 v6, 0x0

    goto :goto_4

    :cond_8
    invoke-static {v6, v7}, Ljava/lang/Math;->exp(D)D

    move-result-wide v6

    goto :goto_4

    .line 172
    .end local v6    # "x":D
    :pswitch_b
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 173
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->expm1(D)D

    move-result-wide v6

    .line 174
    goto/16 :goto_1

    .line 177
    .end local v6    # "x":D
    :pswitch_c
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 178
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    .line 179
    goto/16 :goto_1

    .line 182
    .end local v6    # "x":D
    :pswitch_d
    invoke-direct {p0, p5}, Lorg/mozilla/javascript/NativeMath;->js_imul([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto/16 :goto_0

    .line 185
    :pswitch_e
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 187
    .restart local v6    # "x":D
    const-wide/16 v8, 0x0

    cmpg-double v8, v6, v8

    if-gez v8, :cond_9

    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 188
    :goto_5
    goto/16 :goto_1

    .line 187
    :cond_9
    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v6

    goto :goto_5

    .line 191
    .end local v6    # "x":D
    :pswitch_f
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 192
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->log1p(D)D

    move-result-wide v6

    .line 193
    goto/16 :goto_1

    .line 196
    .end local v6    # "x":D
    :pswitch_10
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 197
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->log10(D)D

    move-result-wide v6

    .line 198
    goto/16 :goto_1

    .line 202
    .end local v6    # "x":D
    :pswitch_11
    const/16 v8, 0xc

    if-ne v3, v8, :cond_a

    const-wide/high16 v6, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 204
    .restart local v6    # "x":D
    :goto_6
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    array-length v8, p5

    if-eq v2, v8, :cond_1

    .line 205
    aget-object v8, p5, v2

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 206
    .local v0, "d":D
    cmpl-double v8, v0, v0

    if-eqz v8, :cond_b

    .line 207
    move-wide v6, v0

    .line 208
    goto/16 :goto_1

    .line 202
    .end local v0    # "d":D
    .end local v2    # "i":I
    .end local v6    # "x":D
    :cond_a
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_6

    .line 210
    .restart local v0    # "d":D
    .restart local v2    # "i":I
    .restart local v6    # "x":D
    :cond_b
    const/16 v8, 0xc

    if-ne v3, v8, :cond_c

    .line 212
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    .line 204
    :goto_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 214
    :cond_c
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    goto :goto_8

    .line 220
    .end local v0    # "d":D
    .end local v2    # "i":I
    .end local v6    # "x":D
    :pswitch_12
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 221
    .restart local v6    # "x":D
    const/4 v8, 0x1

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v8

    invoke-direct {p0, v6, v7, v8, v9}, Lorg/mozilla/javascript/NativeMath;->js_pow(DD)D

    move-result-wide v6

    .line 222
    goto/16 :goto_1

    .line 225
    .end local v6    # "x":D
    :pswitch_13
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    .line 226
    .restart local v6    # "x":D
    goto/16 :goto_1

    .line 229
    .end local v6    # "x":D
    :pswitch_14
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 230
    .restart local v6    # "x":D
    cmpl-double v8, v6, v6

    if-nez v8, :cond_1

    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_1

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_1

    .line 234
    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    .line 235
    .local v4, "l":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-eqz v8, :cond_d

    .line 236
    long-to-double v6, v4

    goto/16 :goto_1

    .line 239
    :cond_d
    const-wide/16 v8, 0x0

    cmpg-double v8, v6, v8

    if-gez v8, :cond_e

    .line 240
    sget-wide v6, Lorg/mozilla/javascript/ScriptRuntime;->negativeZero:D

    goto/16 :goto_1

    .line 241
    :cond_e
    const-wide/16 v8, 0x0

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_1

    .line 242
    const-wide/16 v6, 0x0

    goto/16 :goto_1

    .line 249
    .end local v4    # "l":J
    .end local v6    # "x":D
    :pswitch_15
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 250
    .restart local v6    # "x":D
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_f

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_10

    :cond_f
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 253
    :goto_9
    goto/16 :goto_1

    .line 250
    :cond_10
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    goto :goto_9

    .line 256
    .end local v6    # "x":D
    :pswitch_16
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 257
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v6

    .line 258
    goto/16 :goto_1

    .line 261
    .end local v6    # "x":D
    :pswitch_17
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 262
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    .line 263
    goto/16 :goto_1

    .line 266
    .end local v6    # "x":D
    :pswitch_18
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 267
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    move-result-wide v6

    .line 268
    goto/16 :goto_1

    .line 271
    .end local v6    # "x":D
    :pswitch_19
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 272
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->tanh(D)D

    move-result-wide v6

    .line 273
    goto/16 :goto_1

    .line 276
    .end local v6    # "x":D
    :pswitch_1a
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 277
    .restart local v6    # "x":D
    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/NativeMath;->js_trunc(D)D

    move-result-wide v6

    .line 278
    goto/16 :goto_1

    .line 108
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_7
        :pswitch_a
        :pswitch_c
        :pswitch_e
        :pswitch_11
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_17
        :pswitch_18
        :pswitch_5
        :pswitch_8
        :pswitch_b
        :pswitch_9
        :pswitch_f
        :pswitch_10
        :pswitch_16
        :pswitch_19
        :pswitch_d
        :pswitch_1a
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x6f

    const/16 v7, 0x6e

    const/4 v6, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    .line 387
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 388
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 439
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 443
    :cond_1
    :goto_1
    return v2

    .line 389
    :pswitch_0
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x45

    if-ne v3, v4, :cond_0

    const/16 v2, 0x1e

    goto :goto_1

    .line 390
    :pswitch_1
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x50

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x49

    if-ne v3, v4, :cond_0

    const/16 v2, 0x1f

    goto :goto_1

    .line 391
    :pswitch_2
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 392
    :sswitch_0
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x32

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_0

    const/16 v2, 0x21

    goto :goto_1

    .line 393
    :sswitch_1
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x73

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x62

    if-ne v3, v4, :cond_0

    const/4 v2, 0x2

    goto :goto_1

    .line 394
    :sswitch_2
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x73

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_0

    const/16 v2, 0x8

    goto :goto_1

    .line 395
    :sswitch_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x70

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x78

    if-ne v3, v4, :cond_0

    const/16 v2, 0x9

    goto :goto_1

    .line 396
    :sswitch_4
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x67

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_0

    const/16 v2, 0xb

    goto :goto_1

    .line 397
    :sswitch_5
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 398
    .local v1, "c":I
    if-ne v1, v7, :cond_2

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_0

    const/16 v2, 0xd

    goto/16 :goto_1

    .line 399
    :cond_2
    const/16 v3, 0x78

    if-ne v1, v3, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_0

    const/16 v2, 0xc

    goto/16 :goto_1

    .line 401
    .end local v1    # "c":I
    :sswitch_6
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x77

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_0

    const/16 v2, 0xe

    goto/16 :goto_1

    .line 402
    :sswitch_7
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_0

    const/16 v2, 0x11

    goto/16 :goto_1

    .line 403
    :sswitch_8
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_0

    const/16 v2, 0x13

    goto/16 :goto_1

    .line 405
    :pswitch_3
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1

    goto/16 :goto_0

    .line 406
    :sswitch_9
    const-string v0, "LN10"

    const/16 v2, 0x20

    goto/16 :goto_0

    .line 407
    :sswitch_a
    const-string v0, "tanh"

    const/16 v2, 0x1b

    goto/16 :goto_0

    .line 408
    :sswitch_b
    const-string v0, "cbrt"

    const/16 v2, 0x14

    goto/16 :goto_0

    .line 409
    :sswitch_c
    const-string v0, "acos"

    const/4 v2, 0x3

    goto/16 :goto_0

    .line 410
    :sswitch_d
    const-string v0, "ceil"

    const/4 v2, 0x7

    goto/16 :goto_0

    .line 411
    :sswitch_e
    const-string v0, "sinh"

    const/16 v2, 0x1a

    goto/16 :goto_0

    .line 412
    :sswitch_f
    const-string v0, "imul"

    const/16 v2, 0x1c

    goto/16 :goto_0

    .line 413
    :sswitch_10
    const-string v0, "cosh"

    const/16 v2, 0x15

    goto/16 :goto_0

    .line 414
    :sswitch_11
    const-string v0, "sqrt"

    const/16 v2, 0x12

    goto/16 :goto_0

    .line 415
    :sswitch_12
    const-string v0, "asin"

    const/4 v2, 0x4

    goto/16 :goto_0

    .line 416
    :sswitch_13
    const-string v0, "atan"

    const/4 v2, 0x5

    goto/16 :goto_0

    .line 418
    :pswitch_4
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_2

    goto/16 :goto_0

    .line 419
    :sswitch_14
    const-string v0, "LOG2E"

    const/16 v2, 0x22

    goto/16 :goto_0

    .line 420
    :sswitch_15
    const-string v0, "SQRT2"

    const/16 v2, 0x25

    goto/16 :goto_0

    .line 421
    :sswitch_16
    const-string v0, "atan2"

    const/4 v2, 0x6

    goto/16 :goto_0

    .line 422
    :sswitch_17
    const-string v0, "expm1"

    const/16 v2, 0x16

    goto/16 :goto_0

    .line 423
    :sswitch_18
    const-string v0, "floor"

    const/16 v2, 0xa

    goto/16 :goto_0

    .line 424
    :sswitch_19
    const-string v0, "hypot"

    const/16 v2, 0x17

    goto/16 :goto_0

    .line 425
    :sswitch_1a
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 426
    .restart local v1    # "c":I
    const/16 v3, 0x30

    if-ne v1, v3, :cond_3

    const-string v0, "log10"

    const/16 v2, 0x19

    goto/16 :goto_0

    .line 427
    :cond_3
    const/16 v3, 0x70

    if-ne v1, v3, :cond_0

    const-string v0, "log1p"

    const/16 v2, 0x18

    goto/16 :goto_0

    .line 429
    .end local v1    # "c":I
    :sswitch_1b
    const-string v0, "round"

    const/16 v2, 0x10

    goto/16 :goto_0

    .line 430
    :sswitch_1c
    const-string v0, "trunc"

    const/16 v2, 0x1d

    goto/16 :goto_0

    .line 432
    :pswitch_5
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 433
    .restart local v1    # "c":I
    const/16 v3, 0x4c

    if-ne v1, v3, :cond_4

    const-string v0, "LOG10E"

    const/16 v2, 0x23

    goto/16 :goto_0

    .line 434
    :cond_4
    const/16 v3, 0x72

    if-ne v1, v3, :cond_0

    const-string v0, "random"

    const/16 v2, 0xf

    goto/16 :goto_0

    .line 436
    .end local v1    # "c":I
    :pswitch_6
    const-string v0, "SQRT1_2"

    const/16 v2, 0x24

    goto/16 :goto_0

    .line 437
    :pswitch_7
    const-string v0, "toSource"

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 388
    nop

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

    .line 391
    :sswitch_data_0
    .sparse-switch
        0x4c -> :sswitch_0
        0x61 -> :sswitch_1
        0x63 -> :sswitch_2
        0x65 -> :sswitch_3
        0x6c -> :sswitch_4
        0x6d -> :sswitch_5
        0x70 -> :sswitch_6
        0x73 -> :sswitch_7
        0x74 -> :sswitch_8
    .end sparse-switch

    .line 405
    :sswitch_data_1
    .sparse-switch
        0x4e -> :sswitch_9
        0x61 -> :sswitch_a
        0x62 -> :sswitch_b
        0x63 -> :sswitch_c
        0x65 -> :sswitch_d
        0x69 -> :sswitch_e
        0x6d -> :sswitch_f
        0x6f -> :sswitch_10
        0x71 -> :sswitch_11
        0x73 -> :sswitch_12
        0x74 -> :sswitch_13
    .end sparse-switch

    .line 418
    :sswitch_data_2
    .sparse-switch
        0x4c -> :sswitch_14
        0x53 -> :sswitch_15
        0x61 -> :sswitch_16
        0x65 -> :sswitch_17
        0x66 -> :sswitch_18
        0x68 -> :sswitch_19
        0x6c -> :sswitch_1a
        0x72 -> :sswitch_1b
        0x74 -> :sswitch_1c
    .end sparse-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    const-string v0, "Math"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 6
    .param p1, "id"    # I

    .prologue
    .line 44
    const/16 v4, 0x1d

    if-gt p1, v4, :cond_0

    .line 47
    packed-switch p1, :pswitch_data_0

    .line 77
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 48
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "toSource"

    .line 79
    .local v1, "name":Ljava/lang/String;
    :goto_0
    sget-object v4, Lorg/mozilla/javascript/NativeMath;->MATH_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v4, p1, v1, v0}, Lorg/mozilla/javascript/NativeMath;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 97
    .end local v0    # "arity":I
    :goto_1
    return-void

    .line 49
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "abs"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 50
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "acos"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 51
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "asin"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 52
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "atan"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 53
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "atan2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 54
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cbrt"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 55
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "ceil"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 56
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cos"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 57
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cosh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 58
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "exp"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "expm1"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 60
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "floor"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 61
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "hypot"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "imul"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 63
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 64
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log1p"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 65
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log10"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 66
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "max"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 67
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "min"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 68
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "pow"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 69
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "random"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 70
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "round"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 71
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sin"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 72
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sinh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 73
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_19
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sqrt"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 74
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "tan"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 75
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "tanh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 76
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "trunc"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 83
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    packed-switch p1, :pswitch_data_1

    .line 92
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 84
    :pswitch_1d
    const-wide v2, 0x4005bf0a8b145769L    # Math.E

    .local v2, "x":D
    const-string v1, "E"

    .line 94
    .restart local v1    # "name":Ljava/lang/String;
    :goto_2
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    const/4 v5, 0x7

    invoke-virtual {p0, p1, v1, v4, v5}, Lorg/mozilla/javascript/NativeMath;->initPrototypeValue(ILjava/lang/String;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 85
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_1e
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .restart local v2    # "x":D
    const-string v1, "PI"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 86
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_1f
    const-wide v2, 0x40026bb1bbb55516L    # 2.302585092994046

    .restart local v2    # "x":D
    const-string v1, "LN10"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 87
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_20
    const-wide v2, 0x3fe62e42fefa39efL    # 0.6931471805599453

    .restart local v2    # "x":D
    const-string v1, "LN2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 88
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_21
    const-wide v2, 0x3ff71547652b82feL    # 1.4426950408889634

    .restart local v2    # "x":D
    const-string v1, "LOG2E"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 89
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_22
    const-wide v2, 0x3fdbcb7b1526e50eL    # 0.4342944819032518

    .restart local v2    # "x":D
    const-string v1, "LOG10E"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 90
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_23
    const-wide v2, 0x3fe6a09e667f3bcdL    # 0.7071067811865476

    .restart local v2    # "x":D
    const-string v1, "SQRT1_2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 91
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_24
    const-wide v2, 0x3ff6a09e667f3bcdL    # 1.4142135623730951

    .restart local v2    # "x":D
    const-string v1, "SQRT2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 47
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_8
        :pswitch_a
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_19
        :pswitch_1a
        :pswitch_6
        :pswitch_9
        :pswitch_b
        :pswitch_d
        :pswitch_10
        :pswitch_11
        :pswitch_18
        :pswitch_1b
        :pswitch_e
        :pswitch_1c
    .end packed-switch

    .line 83
    :pswitch_data_1
    .packed-switch 0x1e
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
    .end packed-switch
.end method
