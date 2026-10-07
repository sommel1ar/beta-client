.class public Lorg/mozilla/javascript/v8dtoa/FastDtoa;
.super Ljava/lang/Object;
.source "FastDtoa.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final kFastDtoaMaximalLength:I = 0x11

.field static final kTen4:I = 0x2710

.field static final kTen5:I = 0x186a0

.field static final kTen6:I = 0xf4240

.field static final kTen7:I = 0x989680

.field static final kTen8:I = 0x5f5e100

.field static final kTen9:I = 0x3b9aca00

.field static final maximal_target_exponent:I = -0x20

.field static final minimal_target_exponent:I = -0x3c


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static biggestPowerTen(II)J
    .locals 8
    .param p0, "number"    # I
    .param p1, "number_bits"    # I

    .prologue
    .line 183
    packed-switch p1, :pswitch_data_0

    .line 272
    const/4 v1, 0x0

    .line 273
    .local v1, "power":I
    const/4 v0, 0x0

    .line 276
    .local v0, "exponent":I
    :goto_0
    int-to-long v2, v1

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    int-to-long v6, v0

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2

    .line 187
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :pswitch_0
    const v2, 0x3b9aca00

    if-gt v2, p0, :cond_0

    .line 188
    const v1, 0x3b9aca00

    .line 189
    .restart local v1    # "power":I
    const/16 v0, 0x9

    .line 190
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 195
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_0
    :pswitch_1
    const v2, 0x5f5e100

    if-gt v2, p0, :cond_1

    .line 196
    const v1, 0x5f5e100

    .line 197
    .restart local v1    # "power":I
    const/16 v0, 0x8

    .line 198
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 203
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_1
    :pswitch_2
    const v2, 0x989680

    if-gt v2, p0, :cond_2

    .line 204
    const v1, 0x989680

    .line 205
    .restart local v1    # "power":I
    const/4 v0, 0x7

    .line 206
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 212
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_2
    :pswitch_3
    const v2, 0xf4240

    if-gt v2, p0, :cond_3

    .line 213
    const v1, 0xf4240

    .line 214
    .restart local v1    # "power":I
    const/4 v0, 0x6

    .line 215
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 220
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_3
    :pswitch_4
    const v2, 0x186a0

    if-gt v2, p0, :cond_4

    .line 221
    const v1, 0x186a0

    .line 222
    .restart local v1    # "power":I
    const/4 v0, 0x5

    .line 223
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 228
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_4
    :pswitch_5
    const/16 v2, 0x2710

    if-gt v2, p0, :cond_5

    .line 229
    const/16 v1, 0x2710

    .line 230
    .restart local v1    # "power":I
    const/4 v0, 0x4

    .line 231
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 237
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_5
    :pswitch_6
    const/16 v2, 0x3e8

    if-gt v2, p0, :cond_6

    .line 238
    const/16 v1, 0x3e8

    .line 239
    .restart local v1    # "power":I
    const/4 v0, 0x3

    .line 240
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 245
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_6
    :pswitch_7
    const/16 v2, 0x64

    if-gt v2, p0, :cond_7

    .line 246
    const/16 v1, 0x64

    .line 247
    .restart local v1    # "power":I
    const/4 v0, 0x2

    .line 248
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 253
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_7
    :pswitch_8
    const/16 v2, 0xa

    if-gt v2, p0, :cond_8

    .line 254
    const/16 v1, 0xa

    .line 255
    .restart local v1    # "power":I
    const/4 v0, 0x1

    .line 256
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 261
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_8
    :pswitch_9
    const/4 v2, 0x1

    if-gt v2, p0, :cond_9

    .line 262
    const/4 v1, 0x1

    .line 263
    .restart local v1    # "power":I
    const/4 v0, 0x0

    .line 264
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 267
    .end local v0    # "exponent":I
    .end local v1    # "power":I
    :cond_9
    :pswitch_a
    const/4 v1, 0x0

    .line 268
    .restart local v1    # "power":I
    const/4 v0, -0x1

    .line 269
    .restart local v0    # "exponent":I
    goto :goto_0

    .line 183
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static digitGen(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;I)Z
    .locals 35
    .param p0, "low"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p1, "w"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p2, "high"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p3, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
    .param p4, "mk"    # I

    .prologue
    .line 331
    sget-boolean v3, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v3, :cond_1

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    if-eq v3, v4, :cond_1

    :cond_0
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 332
    :cond_1
    sget-boolean v3, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v3, :cond_2

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v6

    const-wide/16 v10, 0x1

    sub-long/2addr v6, v10

    invoke-static {v4, v5, v6, v7}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->uint64_lte(JJ)Z

    move-result v3

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 333
    :cond_2
    sget-boolean v3, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v3, :cond_4

    const/16 v3, -0x3c

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    if-gt v3, v4, :cond_3

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    const/16 v4, -0x20

    if-le v3, v4, :cond_4

    :cond_3
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 345
    :cond_4
    const-wide/16 v12, 0x1

    .line 346
    .local v12, "unit":J
    new-instance v33, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    sub-long/2addr v4, v12

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    move-object/from16 v0, v33

    invoke-direct {v0, v4, v5, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 347
    .local v33, "too_low":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v32, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    add-long/2addr v4, v12

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    move-object/from16 v0, v32

    invoke-direct {v0, v4, v5, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 350
    .local v32, "too_high":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static/range {v32 .. v33}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v34

    .line 358
    .local v34, "unsafe_interval":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v29, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    const-wide/16 v4, 0x1

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    shl-long/2addr v4, v3

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    move-object/from16 v0, v29

    invoke-direct {v0, v4, v5, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 360
    .local v29, "one":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    ushr-long/2addr v4, v3

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    long-to-int v0, v4

    move/from16 v27, v0

    .line 362
    .local v27, "integrals":I
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v6

    const-wide/16 v10, 0x1

    sub-long/2addr v6, v10

    and-long v20, v4, v6

    .line 363
    .local v20, "fractionals":J
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    rsub-int/lit8 v3, v3, 0x40

    move/from16 v0, v27

    invoke-static {v0, v3}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->biggestPowerTen(II)J

    move-result-wide v30

    .line 364
    .local v30, "result":J
    const/16 v3, 0x20

    ushr-long v4, v30, v3

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    long-to-int v14, v4

    .line 365
    .local v14, "divider":I
    const-wide v4, 0xffffffffL

    and-long v4, v4, v30

    long-to-int v0, v4

    move/from16 v26, v0

    .line 366
    .local v26, "divider_exponent":I
    add-int/lit8 v28, v26, 0x1

    .line 371
    .local v28, "kappa":I
    :goto_0
    if-lez v28, :cond_6

    .line 372
    div-int v2, v27, v14

    .line 373
    .local v2, "digit":I
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 374
    rem-int v27, v27, v14

    .line 375
    add-int/lit8 v28, v28, -0x1

    .line 378
    move/from16 v0, v27

    int-to-long v4, v0

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    shl-long/2addr v4, v3

    add-long v8, v4, v20

    .line 382
    .local v8, "rest":J
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    cmp-long v3, v8, v4

    if-gez v3, :cond_5

    .line 385
    move-object/from16 v0, p3

    iget v3, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int v3, v3, p4

    add-int v3, v3, v28

    move-object/from16 v0, p3

    iput v3, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    .line 386
    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v6

    int-to-long v10, v14

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    shl-long/2addr v10, v3

    move-object/from16 v3, p3

    invoke-static/range {v3 .. v13}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->roundWeed(Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;JJJJJ)Z

    move-result v3

    .line 421
    .end local v8    # "rest":J
    :goto_1
    return v3

    .line 390
    .restart local v8    # "rest":J
    :cond_5
    div-int/lit8 v14, v14, 0xa

    .line 391
    goto :goto_0

    .line 408
    .end local v2    # "digit":I
    .end local v8    # "rest":J
    :cond_6
    const-wide/16 v4, 0x5

    mul-long v20, v20, v4

    .line 409
    const-wide/16 v4, 0x5

    mul-long/2addr v12, v4

    .line 410
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const-wide/16 v6, 0x5

    mul-long/2addr v4, v6

    move-object/from16 v0, v34

    invoke-virtual {v0, v4, v5}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 411
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 412
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const/4 v3, 0x1

    ushr-long/2addr v4, v3

    move-object/from16 v0, v29

    invoke-virtual {v0, v4, v5}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 413
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 415
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    ushr-long v4, v20, v3

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    long-to-int v2, v4

    .line 416
    .restart local v2    # "digit":I
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 417
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    and-long v20, v20, v4

    .line 418
    add-int/lit8 v28, v28, -0x1

    .line 419
    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    cmp-long v3, v20, v4

    if-gez v3, :cond_6

    .line 420
    move-object/from16 v0, p3

    iget v3, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int v3, v3, p4

    add-int v3, v3, v28

    move-object/from16 v0, p3

    iput v3, v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    .line 421
    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    mul-long v16, v4, v12

    invoke-virtual/range {v34 .. v34}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v18

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v22

    move-object/from16 v15, p3

    move-wide/from16 v24, v12

    invoke-static/range {v15 .. v25}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->roundWeed(Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;JJJJJ)Z

    move-result v3

    goto/16 :goto_1
.end method

.method public static dtoa(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z
    .locals 2
    .param p0, "v"    # D
    .param p2, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    .prologue
    .line 488
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    cmpl-double v0, p0, v0

    if-gtz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 489
    :cond_0
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 490
    :cond_1
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 492
    :cond_2
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->grisu3(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z

    move-result v0

    return v0
.end method

.method static grisu3(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z
    .locals 16
    .param p0, "v"    # D
    .param p2, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    .prologue
    .line 440
    invoke-static/range {p0 .. p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 441
    .local v2, "bits":J
    invoke-static {v2, v3}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->asNormalizedDiyFp(J)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v11

    .line 446
    .local v11, "w":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v4, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v4}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>()V

    .local v4, "boundary_minus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    new-instance v5, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v5}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>()V

    .line 447
    .local v5, "boundary_plus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static {v2, v3, v4, v5}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->normalizedBoundaries(JLorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)V

    .line 448
    sget-boolean v12, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v12, :cond_0

    invoke-virtual {v5}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v12

    invoke-virtual {v11}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v13

    if-eq v12, v13, :cond_0

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 449
    :cond_0
    new-instance v10, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>()V

    .line 450
    .local v10, "ten_mk":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual {v11}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v12

    add-int/lit8 v12, v12, 0x40

    const/16 v13, -0x3c

    const/16 v14, -0x20

    invoke-static {v12, v13, v14, v10}, Lorg/mozilla/javascript/v8dtoa/CachedPowers;->getCachedPower(IIILorg/mozilla/javascript/v8dtoa/DiyFp;)I

    move-result v6

    .line 452
    .local v6, "mk":I
    sget-boolean v12, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v12, :cond_2

    const/16 v12, -0x3c

    invoke-virtual {v11}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v13

    invoke-virtual {v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v14

    add-int/2addr v13, v14

    add-int/lit8 v13, v13, 0x40

    if-gt v12, v13, :cond_1

    const/16 v12, -0x20

    invoke-virtual {v11}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v13

    invoke-virtual {v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v14

    add-int/2addr v13, v14

    add-int/lit8 v13, v13, 0x40

    if-ge v12, v13, :cond_2

    :cond_1
    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 465
    :cond_2
    invoke-static {v11, v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v9

    .line 466
    .local v9, "scaled_w":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    sget-boolean v12, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->$assertionsDisabled:Z

    if-nez v12, :cond_3

    invoke-virtual {v9}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v12

    invoke-virtual {v5}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v13

    invoke-virtual {v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v14

    add-int/2addr v13, v14

    add-int/lit8 v13, v13, 0x40

    if-eq v12, v13, :cond_3

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 473
    :cond_3
    invoke-static {v4, v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v7

    .line 474
    .local v7, "scaled_boundary_minus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-static {v5, v10}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v8

    .line 482
    .local v8, "scaled_boundary_plus":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    move-object/from16 v0, p2

    invoke-static {v7, v9, v8, v0, v6}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->digitGen(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;I)Z

    move-result v12

    return v12
.end method

.method public static numberToString(D)Ljava/lang/String;
    .locals 2
    .param p0, "v"    # D

    .prologue
    .line 496
    new-instance v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    invoke-direct {v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;-><init>()V

    .line 497
    .local v0, "buffer":Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->numberToString(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->format()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static numberToString(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z
    .locals 2
    .param p0, "v"    # D
    .param p2, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;

    .prologue
    .line 501
    invoke-virtual {p2}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->reset()V

    .line 502
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    .line 503
    const/16 v0, 0x2d

    invoke-virtual {p2, v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 504
    neg-double p0, p0

    .line 506
    :cond_0
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->dtoa(DLorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;)Z

    move-result v0

    return v0
.end method

.method static roundWeed(Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;JJJJJ)Z
    .locals 9
    .param p0, "buffer"    # Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
    .param p1, "distance_too_high_w"    # J
    .param p3, "unsafe_interval"    # J
    .param p5, "rest"    # J
    .param p7, "ten_kappa"    # J
    .param p9, "unit"    # J

    .prologue
    .line 69
    sub-long v2, p1, p9

    .line 70
    .local v2, "small_distance":J
    add-long v0, p1, p9

    .line 141
    .local v0, "big_distance":J
    :goto_0
    cmp-long v4, p5, v2

    if-gez v4, :cond_1

    sub-long v4, p3, p5

    cmp-long v4, v4, p7

    if-ltz v4, :cond_1

    add-long v4, p5, p7

    cmp-long v4, v4, v2

    if-ltz v4, :cond_0

    sub-long v4, v2, p5

    add-long v6, p5, p7

    sub-long/2addr v6, v2

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1

    .line 144
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->decreaseLast()V

    .line 145
    add-long p5, p5, p7

    goto :goto_0

    .line 151
    :cond_1
    cmp-long v4, p5, v0

    if-gez v4, :cond_3

    sub-long v4, p3, p5

    cmp-long v4, v4, p7

    if-ltz v4, :cond_3

    add-long v4, p5, p7

    cmp-long v4, v4, v0

    if-ltz v4, :cond_2

    sub-long v4, v0, p5

    add-long v6, p5, p7

    sub-long/2addr v6, v0

    cmp-long v4, v4, v6

    if-lez v4, :cond_3

    .line 155
    :cond_2
    const/4 v4, 0x0

    .line 163
    :goto_1
    return v4

    :cond_3
    const-wide/16 v4, 0x2

    mul-long v4, v4, p9

    cmp-long v4, v4, p5

    if-gtz v4, :cond_4

    const-wide/16 v4, 0x4

    mul-long v4, v4, p9

    sub-long v4, p3, v4

    cmp-long v4, p5, v4

    if-gtz v4, :cond_4

    const/4 v4, 0x1

    goto :goto_1

    :cond_4
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private static uint64_lte(JJ)Z
    .locals 6
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 281
    cmp-long v2, p0, p2

    if-eqz v2, :cond_0

    cmp-long v2, p0, p2

    if-gez v2, :cond_2

    move v3, v1

    :goto_0
    cmp-long v2, p0, v4

    if-gez v2, :cond_3

    move v2, v1

    :goto_1
    xor-int/2addr v3, v2

    cmp-long v2, p2, v4

    if-gez v2, :cond_4

    move v2, v1

    :goto_2
    xor-int/2addr v2, v3

    if-eqz v2, :cond_1

    :cond_0
    move v0, v1

    :cond_1
    return v0

    :cond_2
    move v3, v0

    goto :goto_0

    :cond_3
    move v2, v0

    goto :goto_1

    :cond_4
    move v2, v0

    goto :goto_2
.end method
