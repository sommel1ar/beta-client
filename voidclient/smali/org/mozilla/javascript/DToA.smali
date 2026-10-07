.class Lorg/mozilla/javascript/DToA;
.super Ljava/lang/Object;
.source "DToA.java"


# static fields
.field private static final Bias:I = 0x3ff

.field private static final Bletch:I = 0x10

.field private static final Bndry_mask:I = 0xfffff

.field static final DTOSTR_EXPONENTIAL:I = 0x3

.field static final DTOSTR_FIXED:I = 0x2

.field static final DTOSTR_PRECISION:I = 0x4

.field static final DTOSTR_STANDARD:I = 0x0

.field static final DTOSTR_STANDARD_EXPONENTIAL:I = 0x1

.field private static final Exp_11:I = 0x3ff00000

.field private static final Exp_mask:I = 0x7ff00000

.field private static final Exp_mask_shifted:I = 0x7ff

.field private static final Exp_msk1:I = 0x100000

.field private static final Exp_msk1L:J = 0x10000000000000L

.field private static final Exp_shift:I = 0x14

.field private static final Exp_shift1:I = 0x14

.field private static final Exp_shiftL:I = 0x34

.field private static final Frac_mask:I = 0xfffff

.field private static final Frac_mask1:I = 0xfffff

.field private static final Frac_maskL:J = 0xfffffffffffffL

.field private static final Int_max:I = 0xe

.field private static final Log2P:I = 0x1

.field private static final P:I = 0x35

.field private static final Quick_max:I = 0xe

.field private static final Sign_bit:I = -0x80000000

.field private static final Ten_pmax:I = 0x16

.field private static final bigtens:[D

.field private static final dtoaModes:[I

.field private static final n_bigtens:I = 0x5

.field private static final tens:[D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x5

    .line 72
    const/16 v0, 0x17

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    sput-object v0, Lorg/mozilla/javascript/DToA;->tens:[D

    .line 78
    new-array v0, v1, [D

    fill-array-data v0, :array_1

    sput-object v0, Lorg/mozilla/javascript/DToA;->bigtens:[D

    .line 1124
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lorg/mozilla/javascript/DToA;->dtoaModes:[I

    return-void

    .line 72
    nop

    :array_0
    .array-data 8
        0x3ff0000000000000L    # 1.0
        0x4024000000000000L    # 10.0
        0x4059000000000000L    # 100.0
        0x408f400000000000L    # 1000.0
        0x40c3880000000000L    # 10000.0
        0x40f86a0000000000L    # 100000.0
        0x412e848000000000L    # 1000000.0
        0x416312d000000000L    # 1.0E7
        0x4197d78400000000L    # 1.0E8
        0x41cdcd6500000000L    # 1.0E9
        0x4202a05f20000000L    # 1.0E10
        0x42374876e8000000L    # 1.0E11
        0x426d1a94a2000000L    # 1.0E12
        0x42a2309ce5400000L    # 1.0E13
        0x42d6bcc41e900000L    # 1.0E14
        0x430c6bf526340000L    # 1.0E15
        0x4341c37937e08000L    # 1.0E16
        0x4376345785d8a000L    # 1.0E17
        0x43abc16d674ec800L    # 1.0E18
        0x43e158e460913d00L    # 1.0E19
        0x4415af1d78b58c40L    # 1.0E20
        0x444b1ae4d6e2ef50L    # 1.0E21
        0x4480f0cf064dd592L    # 1.0E22
    .end array-data

    .line 78
    :array_1
    .array-data 8
        0x4341c37937e08000L    # 1.0E16
        0x4693b8b5b5056e17L    # 1.0E32
        0x4d384f03e93ff9f5L    # 1.0E64
        0x5a827748f9301d32L    # 1.0E128
        0x75154fdd7f73bf3cL    # 1.0E256
    .end array-data

    .line 1124
    :array_2
    .array-data 4
        0x0
        0x0
        0x3
        0x2
        0x2
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static BASEDIGIT(I)C
    .locals 1
    .param p0, "digit"    # I

    .prologue
    .line 34
    const/16 v0, 0xa

    if-lt p0, v0, :cond_0

    add-int/lit8 v0, p0, 0x57

    :goto_0
    int-to-char v0, v0

    return v0

    :cond_0
    add-int/lit8 v0, p0, 0x30

    goto :goto_0
.end method

.method static JS_dtoa(DIZI[ZLjava/lang/StringBuilder;)I
    .locals 56
    .param p0, "d"    # D
    .param p2, "mode"    # I
    .param p3, "biasUp"    # Z
    .param p4, "ndigits"    # I
    .param p5, "sign"    # [Z
    .param p6, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 487
    const/16 v50, 0x1

    move/from16 v0, v50

    new-array v14, v0, [I

    .line 488
    .local v14, "be":[I
    const/16 v50, 0x1

    move/from16 v0, v50

    new-array v13, v0, [I

    .line 492
    .local v13, "bbits":[I
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const/high16 v51, -0x80000000

    and-int v50, v50, v51

    if-eqz v50, :cond_0

    .line 494
    const/16 v50, 0x0

    const/16 v51, 0x1

    aput-boolean v51, p5, v50

    .line 496
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const v51, 0x7fffffff

    and-int v50, v50, v51

    move-wide/from16 v0, p0

    move/from16 v2, v50

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide p0

    .line 501
    :goto_0
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const/high16 v51, 0x7ff00000

    and-int v50, v50, v51

    const/high16 v51, 0x7ff00000

    move/from16 v0, v50

    move/from16 v1, v51

    if-ne v0, v1, :cond_2

    .line 503
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v50

    if-nez v50, :cond_1

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const v51, 0xfffff

    and-int v50, v50, v51

    if-nez v50, :cond_1

    const-string v50, "Infinity"

    :goto_1
    move-object/from16 v0, p6

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    const/16 v50, 0x270f

    .line 1108
    :goto_2
    return v50

    .line 499
    :cond_0
    const/16 v50, 0x0

    const/16 v51, 0x0

    aput-boolean v51, p5, v50

    goto :goto_0

    .line 503
    :cond_1
    const-string v50, "NaN"

    goto :goto_1

    .line 506
    :cond_2
    const-wide/16 v50, 0x0

    cmpl-double v50, p0, v50

    if-nez v50, :cond_3

    .line 508
    const/16 v50, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 509
    const/16 v50, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 510
    const/16 v50, 0x1

    goto :goto_2

    .line 513
    :cond_3
    move-wide/from16 v0, p0

    invoke-static {v0, v1, v14, v13}, Lorg/mozilla/javascript/DToA;->d2b(D[I[I)Ljava/math/BigInteger;

    move-result-object v9

    .line 514
    .local v9, "b":Ljava/math/BigInteger;
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    ushr-int/lit8 v50, v50, 0x14

    move/from16 v0, v50

    and-int/lit16 v0, v0, 0x7ff

    move/from16 v27, v0

    .local v27, "i":I
    if-eqz v27, :cond_d

    .line 515
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const v51, 0xfffff

    and-int v50, v50, v51

    const/high16 v51, 0x3ff00000    # 1.875f

    or-int v50, v50, v51

    move-wide/from16 v0, p0

    move/from16 v2, v50

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide v16

    .line 537
    .local v16, "d2":D
    move/from16 v0, v27

    add-int/lit16 v0, v0, -0x3ff

    move/from16 v27, v0

    .line 538
    const/16 v18, 0x0

    .line 553
    .local v18, "denorm":Z
    :goto_3
    const-wide/high16 v50, 0x3ff8000000000000L    # 1.5

    sub-double v50, v16, v50

    const-wide v52, 0x3fd287a7636f4361L    # 0.289529654602168

    mul-double v50, v50, v52

    const-wide v52, 0x3fc68a288b60c8b3L    # 0.1760912590558

    add-double v50, v50, v52

    move/from16 v0, v27

    int-to-double v0, v0

    move-wide/from16 v52, v0

    const-wide v54, 0x3fd34413509f79fbL    # 0.301029995663981

    mul-double v52, v52, v54

    add-double v22, v50, v52

    .line 554
    .local v22, "ds":D
    move-wide/from16 v0, v22

    double-to-int v0, v0

    move/from16 v35, v0

    .line 555
    .local v35, "k":I
    const-wide/16 v50, 0x0

    cmpg-double v50, v22, v50

    if-gez v50, :cond_4

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    cmpl-double v50, v22, v50

    if-eqz v50, :cond_4

    .line 556
    add-int/lit8 v35, v35, -0x1

    .line 557
    :cond_4
    const/16 v37, 0x1

    .line 558
    .local v37, "k_check":Z
    if-ltz v35, :cond_6

    const/16 v50, 0x16

    move/from16 v0, v35

    move/from16 v1, v50

    if-gt v0, v1, :cond_6

    .line 559
    sget-object v50, Lorg/mozilla/javascript/DToA;->tens:[D

    aget-wide v50, v50, v35

    cmpg-double v50, p0, v50

    if-gez v50, :cond_5

    .line 560
    add-int/lit8 v35, v35, -0x1

    .line 561
    :cond_5
    const/16 v37, 0x0

    .line 565
    :cond_6
    const/16 v50, 0x0

    aget v50, v13, v50

    sub-int v50, v50, v27

    add-int/lit8 v33, v50, -0x1

    .line 567
    .local v33, "j":I
    if-ltz v33, :cond_f

    .line 568
    const/4 v11, 0x0

    .line 569
    .local v11, "b2":I
    move/from16 v44, v33

    .line 575
    .local v44, "s2":I
    :goto_4
    if-ltz v35, :cond_10

    .line 576
    const/4 v12, 0x0

    .line 577
    .local v12, "b5":I
    move/from16 v45, v35

    .line 578
    .local v45, "s5":I
    add-int v44, v44, v35

    .line 587
    :goto_5
    if-ltz p2, :cond_7

    const/16 v50, 0x9

    move/from16 v0, p2

    move/from16 v1, v50

    if-le v0, v1, :cond_8

    .line 588
    :cond_7
    const/16 p2, 0x0

    .line 589
    :cond_8
    const/16 v47, 0x1

    .line 590
    .local v47, "try_quick":Z
    const/16 v50, 0x5

    move/from16 v0, p2

    move/from16 v1, v50

    if-le v0, v1, :cond_9

    .line 591
    add-int/lit8 p2, p2, -0x4

    .line 592
    const/16 v47, 0x0

    .line 594
    :cond_9
    const/16 v39, 0x1

    .line 595
    .local v39, "leftright":Z
    const/16 v32, 0x0

    .local v32, "ilim1":I
    move/from16 v30, v32

    .line 596
    .local v30, "ilim":I
    packed-switch p2, :pswitch_data_0

    .line 625
    :cond_a
    :goto_6
    const/16 v26, 0x0

    .line 626
    .local v26, "fast_failed":Z
    if-ltz v30, :cond_20

    const/16 v50, 0xe

    move/from16 v0, v30

    move/from16 v1, v50

    if-gt v0, v1, :cond_20

    if-eqz v47, :cond_20

    .line 630
    const/16 v27, 0x0

    .line 631
    move-wide/from16 v16, p0

    .line 632
    move/from16 v36, v35

    .line 633
    .local v36, "k0":I
    move/from16 v31, v30

    .line 634
    .local v31, "ilim0":I
    const/16 v29, 0x2

    .line 636
    .local v29, "ieps":I
    if-lez v35, :cond_15

    .line 637
    sget-object v50, Lorg/mozilla/javascript/DToA;->tens:[D

    and-int/lit8 v51, v35, 0xf

    aget-wide v22, v50, v51

    .line 638
    shr-int/lit8 v33, v35, 0x4

    .line 639
    and-int/lit8 v50, v33, 0x10

    if-eqz v50, :cond_b

    .line 641
    and-int/lit8 v33, v33, 0xf

    .line 642
    sget-object v50, Lorg/mozilla/javascript/DToA;->bigtens:[D

    const/16 v51, 0x4

    aget-wide v50, v50, v51

    div-double p0, p0, v50

    .line 643
    add-int/lit8 v29, v29, 0x1

    .line 645
    :cond_b
    :goto_7
    if-eqz v33, :cond_12

    .line 646
    and-int/lit8 v50, v33, 0x1

    if-eqz v50, :cond_c

    .line 647
    add-int/lit8 v29, v29, 0x1

    .line 648
    sget-object v50, Lorg/mozilla/javascript/DToA;->bigtens:[D

    aget-wide v50, v50, v27

    mul-double v22, v22, v50

    .line 645
    :cond_c
    shr-int/lit8 v33, v33, 0x1

    add-int/lit8 v27, v27, 0x1

    goto :goto_7

    .line 542
    .end local v11    # "b2":I
    .end local v12    # "b5":I
    .end local v16    # "d2":D
    .end local v18    # "denorm":Z
    .end local v22    # "ds":D
    .end local v26    # "fast_failed":Z
    .end local v29    # "ieps":I
    .end local v30    # "ilim":I
    .end local v31    # "ilim0":I
    .end local v32    # "ilim1":I
    .end local v33    # "j":I
    .end local v35    # "k":I
    .end local v36    # "k0":I
    .end local v37    # "k_check":Z
    .end local v39    # "leftright":Z
    .end local v44    # "s2":I
    .end local v45    # "s5":I
    .end local v47    # "try_quick":Z
    :cond_d
    const/16 v50, 0x0

    aget v50, v13, v50

    const/16 v51, 0x0

    aget v51, v14, v51

    add-int v50, v50, v51

    move/from16 v0, v50

    add-int/lit16 v0, v0, 0x432

    move/from16 v27, v0

    .line 543
    const/16 v50, 0x20

    move/from16 v0, v27

    move/from16 v1, v50

    if-le v0, v1, :cond_e

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    move/from16 v0, v50

    int-to-long v0, v0

    move-wide/from16 v50, v0

    rsub-int/lit8 v52, v27, 0x40

    shl-long v50, v50, v52

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v52

    add-int/lit8 v53, v27, -0x20

    ushr-int v52, v52, v53

    move/from16 v0, v52

    int-to-long v0, v0

    move-wide/from16 v52, v0

    or-long v48, v50, v52

    .line 548
    .local v48, "x":J
    :goto_8
    move-wide/from16 v0, v48

    long-to-double v0, v0

    move-wide/from16 v50, v0

    move-wide/from16 v0, v48

    long-to-double v0, v0

    move-wide/from16 v52, v0

    invoke-static/range {v52 .. v53}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v52

    const/high16 v53, 0x1f00000

    sub-int v52, v52, v53

    invoke-static/range {v50 .. v52}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide v16

    .line 549
    .restart local v16    # "d2":D
    move/from16 v0, v27

    add-int/lit16 v0, v0, -0x433

    move/from16 v27, v0

    .line 550
    const/16 v18, 0x1

    .restart local v18    # "denorm":Z
    goto/16 :goto_3

    .line 543
    .end local v16    # "d2":D
    .end local v18    # "denorm":Z
    .end local v48    # "x":J
    :cond_e
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v50

    move/from16 v0, v50

    int-to-long v0, v0

    move-wide/from16 v50, v0

    rsub-int/lit8 v52, v27, 0x20

    shl-long v48, v50, v52

    goto :goto_8

    .line 572
    .restart local v16    # "d2":D
    .restart local v18    # "denorm":Z
    .restart local v22    # "ds":D
    .restart local v33    # "j":I
    .restart local v35    # "k":I
    .restart local v37    # "k_check":Z
    :cond_f
    move/from16 v0, v33

    neg-int v11, v0

    .line 573
    .restart local v11    # "b2":I
    const/16 v44, 0x0

    .restart local v44    # "s2":I
    goto/16 :goto_4

    .line 581
    :cond_10
    sub-int v11, v11, v35

    .line 582
    move/from16 v0, v35

    neg-int v12, v0

    .line 583
    .restart local v12    # "b5":I
    const/16 v45, 0x0

    .restart local v45    # "s5":I
    goto/16 :goto_5

    .line 599
    .restart local v30    # "ilim":I
    .restart local v32    # "ilim1":I
    .restart local v39    # "leftright":Z
    .restart local v47    # "try_quick":Z
    :pswitch_0
    const/16 v32, -0x1

    move/from16 v30, v32

    .line 600
    const/16 v27, 0x12

    .line 601
    const/16 p4, 0x0

    .line 602
    goto/16 :goto_6

    .line 604
    :pswitch_1
    const/16 v39, 0x0

    .line 607
    :pswitch_2
    if-gtz p4, :cond_11

    .line 608
    const/16 p4, 0x1

    .line 609
    :cond_11
    move/from16 v27, p4

    move/from16 v32, p4

    move/from16 v30, p4

    .line 610
    goto/16 :goto_6

    .line 612
    :pswitch_3
    const/16 v39, 0x0

    .line 615
    :pswitch_4
    add-int v50, p4, v35

    add-int/lit8 v27, v50, 0x1

    .line 616
    move/from16 v30, v27

    .line 617
    add-int/lit8 v32, v27, -0x1

    .line 618
    if-gtz v27, :cond_a

    .line 619
    const/16 v27, 0x1

    goto/16 :goto_6

    .line 650
    .restart local v26    # "fast_failed":Z
    .restart local v29    # "ieps":I
    .restart local v31    # "ilim0":I
    .restart local v36    # "k0":I
    :cond_12
    div-double p0, p0, v22

    .line 661
    :cond_13
    if-eqz v37, :cond_14

    const-wide/high16 v50, 0x3ff0000000000000L    # 1.0

    cmpg-double v50, p0, v50

    if-gez v50, :cond_14

    if-lez v30, :cond_14

    .line 662
    if-gtz v32, :cond_17

    .line 663
    const/16 v26, 0x1

    .line 674
    :cond_14
    :goto_9
    move/from16 v0, v29

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, p0

    const-wide/high16 v52, 0x401c000000000000L    # 7.0

    add-double v24, v50, v52

    .line 675
    .local v24, "eps":D
    invoke-static/range {v24 .. v25}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const/high16 v51, 0x3400000

    sub-int v50, v50, v51

    move-wide/from16 v0, v24

    move/from16 v2, v50

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/DToA;->setWord0(DI)D

    move-result-wide v24

    .line 676
    if-nez v30, :cond_1a

    .line 677
    const/16 v42, 0x0

    .local v42, "mhi":Ljava/math/BigInteger;
    move-object/from16 v6, v42

    .line 678
    .local v6, "S":Ljava/lang/Object;
    const-wide/high16 v50, 0x4014000000000000L    # 5.0

    sub-double p0, p0, v50

    .line 679
    cmpl-double v50, p0, v24

    if-lez v50, :cond_18

    .line 680
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 681
    add-int/lit8 v35, v35, 0x1

    .line 682
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 652
    .end local v6    # "S":Ljava/lang/Object;
    .end local v24    # "eps":D
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_15
    move/from16 v0, v35

    neg-int v0, v0

    move/from16 v34, v0

    .local v34, "j1":I
    if-eqz v34, :cond_13

    .line 653
    sget-object v50, Lorg/mozilla/javascript/DToA;->tens:[D

    and-int/lit8 v51, v34, 0xf

    aget-wide v50, v50, v51

    mul-double p0, p0, v50

    .line 654
    shr-int/lit8 v33, v34, 0x4

    :goto_a
    if-eqz v33, :cond_13

    .line 655
    and-int/lit8 v50, v33, 0x1

    if-eqz v50, :cond_16

    .line 656
    add-int/lit8 v29, v29, 0x1

    .line 657
    sget-object v50, Lorg/mozilla/javascript/DToA;->bigtens:[D

    aget-wide v50, v50, v27

    mul-double p0, p0, v50

    .line 654
    :cond_16
    shr-int/lit8 v33, v33, 0x1

    add-int/lit8 v27, v27, 0x1

    goto :goto_a

    .line 665
    .end local v34    # "j1":I
    :cond_17
    move/from16 v30, v32

    .line 666
    add-int/lit8 v35, v35, -0x1

    .line 667
    const-wide/high16 v50, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v50

    .line 668
    add-int/lit8 v29, v29, 0x1

    goto :goto_9

    .line 684
    .restart local v6    # "S":Ljava/lang/Object;
    .restart local v24    # "eps":D
    .restart local v42    # "mhi":Ljava/math/BigInteger;
    :cond_18
    move-wide/from16 v0, v24

    neg-double v0, v0

    move-wide/from16 v50, v0

    cmpg-double v50, p0, v50

    if-gez v50, :cond_19

    .line 685
    const/16 v50, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 686
    const/16 v50, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 687
    const/16 v50, 0x1

    goto/16 :goto_2

    .line 689
    :cond_19
    const/16 v26, 0x1

    .line 691
    .end local v6    # "S":Ljava/lang/Object;
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_1a
    if-nez v26, :cond_1f

    .line 692
    const/16 v26, 0x1

    .line 693
    if-eqz v39, :cond_23

    .line 697
    const-wide/high16 v50, 0x3fe0000000000000L    # 0.5

    sget-object v52, Lorg/mozilla/javascript/DToA;->tens:[D

    add-int/lit8 v53, v30, -0x1

    aget-wide v52, v52, v53

    div-double v50, v50, v52

    sub-double v24, v50, v24

    .line 698
    const/16 v27, 0x0

    .line 699
    :goto_b
    move-wide/from16 v0, p0

    double-to-long v4, v0

    .line 700
    .local v4, "L":J
    long-to-double v0, v4

    move-wide/from16 v50, v0

    sub-double p0, p0, v50

    .line 701
    const-wide/16 v50, 0x30

    add-long v50, v50, v4

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 702
    cmpg-double v50, p0, v24

    if-gez v50, :cond_1b

    .line 703
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 705
    :cond_1b
    const-wide/high16 v50, 0x3ff0000000000000L    # 1.0

    sub-double v50, v50, p0

    cmpg-double v50, v50, v24

    if-gez v50, :cond_1e

    .line 709
    :cond_1c
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v38

    .line 710
    .local v38, "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 711
    const/16 v50, 0x39

    move/from16 v0, v38

    move/from16 v1, v50

    if-eq v0, v1, :cond_1d

    .line 718
    :goto_c
    add-int/lit8 v50, v38, 0x1

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 719
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 712
    :cond_1d
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    if-nez v50, :cond_1c

    .line 713
    add-int/lit8 v35, v35, 0x1

    .line 714
    const/16 v38, 0x30

    .line 715
    goto :goto_c

    .line 721
    .end local v38    # "lastCh":C
    :cond_1e
    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    move/from16 v1, v30

    if-lt v0, v1, :cond_22

    .line 763
    .end local v4    # "L":J
    :cond_1f
    if-eqz v26, :cond_20

    .line 764
    const/16 v50, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 765
    move-wide/from16 p0, v16

    .line 766
    move/from16 v35, v36

    .line 767
    move/from16 v30, v31

    .line 773
    .end local v24    # "eps":D
    .end local v29    # "ieps":I
    .end local v31    # "ilim0":I
    .end local v36    # "k0":I
    :cond_20
    const/16 v50, 0x0

    aget v50, v14, v50

    if-ltz v50, :cond_2e

    const/16 v50, 0xe

    move/from16 v0, v35

    move/from16 v1, v50

    if-gt v0, v1, :cond_2e

    .line 775
    sget-object v50, Lorg/mozilla/javascript/DToA;->tens:[D

    aget-wide v22, v50, v35

    .line 776
    if-gez p4, :cond_29

    if-gtz v30, :cond_29

    .line 777
    const/16 v42, 0x0

    .restart local v42    # "mhi":Ljava/math/BigInteger;
    move-object/from16 v6, v42

    .line 778
    .restart local v6    # "S":Ljava/lang/Object;
    if-ltz v30, :cond_21

    const-wide/high16 v50, 0x4014000000000000L    # 5.0

    mul-double v50, v50, v22

    cmpg-double v50, p0, v50

    if-ltz v50, :cond_21

    if-nez p3, :cond_28

    const-wide/high16 v50, 0x4014000000000000L    # 5.0

    mul-double v50, v50, v22

    cmpl-double v50, p0, v50

    if-nez v50, :cond_28

    .line 779
    :cond_21
    const/16 v50, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 780
    const/16 v50, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 781
    const/16 v50, 0x1

    goto/16 :goto_2

    .line 723
    .end local v6    # "S":Ljava/lang/Object;
    .end local v42    # "mhi":Ljava/math/BigInteger;
    .restart local v4    # "L":J
    .restart local v24    # "eps":D
    .restart local v29    # "ieps":I
    .restart local v31    # "ilim0":I
    .restart local v36    # "k0":I
    :cond_22
    const-wide/high16 v50, 0x4024000000000000L    # 10.0

    mul-double v24, v24, v50

    .line 724
    const-wide/high16 v50, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v50

    goto/16 :goto_b

    .line 729
    .end local v4    # "L":J
    :cond_23
    sget-object v50, Lorg/mozilla/javascript/DToA;->tens:[D

    add-int/lit8 v51, v30, -0x1

    aget-wide v50, v50, v51

    mul-double v24, v24, v50

    .line 730
    const/16 v27, 0x1

    .line 731
    :goto_d
    move-wide/from16 v0, p0

    double-to-long v4, v0

    .line 732
    .restart local v4    # "L":J
    long-to-double v0, v4

    move-wide/from16 v50, v0

    sub-double p0, p0, v50

    .line 733
    const-wide/16 v50, 0x30

    add-long v50, v50, v4

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 734
    move/from16 v0, v27

    move/from16 v1, v30

    if-ne v0, v1, :cond_27

    .line 735
    const-wide/high16 v50, 0x3fe0000000000000L    # 0.5

    add-double v50, v50, v24

    cmpl-double v50, p0, v50

    if-lez v50, :cond_26

    .line 739
    :cond_24
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v38

    .line 740
    .restart local v38    # "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 741
    const/16 v50, 0x39

    move/from16 v0, v38

    move/from16 v1, v50

    if-eq v0, v1, :cond_25

    .line 748
    :goto_e
    add-int/lit8 v50, v38, 0x1

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 749
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 742
    :cond_25
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    if-nez v50, :cond_24

    .line 743
    add-int/lit8 v35, v35, 0x1

    .line 744
    const/16 v38, 0x30

    .line 745
    goto :goto_e

    .line 752
    .end local v38    # "lastCh":C
    :cond_26
    const-wide/high16 v50, 0x3fe0000000000000L    # 0.5

    sub-double v50, v50, v24

    cmpg-double v50, p0, v50

    if-gez v50, :cond_1f

    .line 753
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->stripTrailingZeroes(Ljava/lang/StringBuilder;)V

    .line 756
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 730
    :cond_27
    add-int/lit8 v27, v27, 0x1

    const-wide/high16 v50, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v50

    goto :goto_d

    .line 783
    .end local v4    # "L":J
    .end local v24    # "eps":D
    .end local v29    # "ieps":I
    .end local v31    # "ilim0":I
    .end local v36    # "k0":I
    .restart local v6    # "S":Ljava/lang/Object;
    .restart local v42    # "mhi":Ljava/math/BigInteger;
    :cond_28
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 784
    add-int/lit8 v35, v35, 0x1

    .line 785
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 787
    .end local v6    # "S":Ljava/lang/Object;
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_29
    const/16 v27, 0x1

    .line 788
    :goto_f
    div-double v50, p0, v22

    move-wide/from16 v0, v50

    double-to-long v4, v0

    .line 789
    .restart local v4    # "L":J
    long-to-double v0, v4

    move-wide/from16 v50, v0

    mul-double v50, v50, v22

    sub-double p0, p0, v50

    .line 790
    const-wide/16 v50, 0x30

    add-long v50, v50, v4

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 791
    move/from16 v0, v27

    move/from16 v1, v30

    if-ne v0, v1, :cond_2d

    .line 792
    add-double p0, p0, p0

    .line 793
    cmpl-double v50, p0, v22

    if-gtz v50, :cond_2a

    cmpl-double v50, p0, v22

    if-nez v50, :cond_2b

    const-wide/16 v50, 0x1

    and-long v50, v50, v4

    const-wide/16 v52, 0x0

    cmp-long v50, v50, v52

    if-nez v50, :cond_2a

    if-eqz p3, :cond_2b

    .line 804
    :cond_2a
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v38

    .line 805
    .restart local v38    # "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 806
    const/16 v50, 0x39

    move/from16 v0, v38

    move/from16 v1, v50

    if-eq v0, v1, :cond_2c

    .line 813
    :goto_10
    add-int/lit8 v50, v38, 0x1

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 821
    .end local v38    # "lastCh":C
    :cond_2b
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 807
    .restart local v38    # "lastCh":C
    :cond_2c
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v50

    if-nez v50, :cond_2a

    .line 808
    add-int/lit8 v35, v35, 0x1

    .line 809
    const/16 v38, 0x30

    .line 810
    goto :goto_10

    .line 817
    .end local v38    # "lastCh":C
    :cond_2d
    const-wide/high16 v50, 0x4024000000000000L    # 10.0

    mul-double p0, p0, v50

    .line 818
    const-wide/16 v50, 0x0

    cmpl-double v50, p0, v50

    if-eqz v50, :cond_2b

    .line 787
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_f

    .line 824
    .end local v4    # "L":J
    :cond_2e
    move/from16 v40, v11

    .line 825
    .local v40, "m2":I
    move/from16 v41, v12

    .line 826
    .local v41, "m5":I
    const/16 v43, 0x0

    .local v43, "mlo":Ljava/math/BigInteger;
    move-object/from16 v42, v43

    .line 827
    .local v42, "mhi":Ljava/lang/Object;
    if-eqz v39, :cond_30

    .line 828
    const/16 v50, 0x2

    move/from16 v0, p2

    move/from16 v1, v50

    if-ge v0, v1, :cond_38

    .line 829
    if-eqz v18, :cond_37

    const/16 v50, 0x0

    aget v50, v14, v50

    move/from16 v0, v50

    add-int/lit16 v0, v0, 0x433

    move/from16 v27, v0

    .line 848
    :cond_2f
    :goto_11
    add-int v11, v11, v27

    .line 849
    add-int v44, v44, v27

    .line 850
    const-wide/16 v50, 0x1

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v42

    .line 856
    .end local v42    # "mhi":Ljava/lang/Object;
    :cond_30
    if-lez v40, :cond_31

    if-lez v44, :cond_31

    .line 857
    move/from16 v0, v40

    move/from16 v1, v44

    if-ge v0, v1, :cond_3a

    move/from16 v27, v40

    .line 858
    :goto_12
    sub-int v11, v11, v27

    .line 859
    sub-int v40, v40, v27

    .line 860
    sub-int v44, v44, v27

    .line 864
    :cond_31
    if-lez v12, :cond_33

    .line 865
    if-eqz v39, :cond_3b

    .line 866
    if-lez v41, :cond_32

    .line 867
    move-object/from16 v0, v42

    move/from16 v1, v41

    invoke-static {v0, v1}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v42

    .line 868
    .local v42, "mhi":Ljava/math/BigInteger;
    move-object/from16 v0, v42

    invoke-virtual {v0, v9}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v10

    .line 869
    .local v10, "b1":Ljava/math/BigInteger;
    move-object v9, v10

    .line 871
    .end local v10    # "b1":Ljava/math/BigInteger;
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_32
    sub-int v33, v12, v41

    if-eqz v33, :cond_33

    .line 872
    move/from16 v0, v33

    invoke-static {v9, v0}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v9

    .line 880
    :cond_33
    :goto_13
    const-wide/16 v50, 0x1

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v6

    .line 881
    .local v6, "S":Ljava/math/BigInteger;
    if-lez v45, :cond_34

    .line 882
    move/from16 v0, v45

    invoke-static {v6, v0}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v6

    .line 887
    :cond_34
    const/16 v46, 0x0

    .line 888
    .local v46, "spec_case":Z
    const/16 v50, 0x2

    move/from16 v0, p2

    move/from16 v1, v50

    if-ge v0, v1, :cond_35

    .line 889
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v50

    if-nez v50, :cond_35

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const v51, 0xfffff

    and-int v50, v50, v51

    if-nez v50, :cond_35

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v50

    const/high16 v51, 0x7fe00000

    and-int v50, v50, v51

    if-eqz v50, :cond_35

    .line 894
    add-int/lit8 v11, v11, 0x1

    .line 895
    add-int/lit8 v44, v44, 0x1

    .line 896
    const/16 v46, 0x1

    .line 907
    :cond_35
    invoke-virtual {v6}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v7

    .line 908
    .local v7, "S_bytes":[B
    const/4 v8, 0x0

    .line 909
    .local v8, "S_hiWord":I
    const/16 v28, 0x0

    .local v28, "idx":I
    :goto_14
    const/16 v50, 0x4

    move/from16 v0, v28

    move/from16 v1, v50

    if-ge v0, v1, :cond_3c

    .line 910
    shl-int/lit8 v8, v8, 0x8

    .line 911
    array-length v0, v7

    move/from16 v50, v0

    move/from16 v0, v28

    move/from16 v1, v50

    if-ge v0, v1, :cond_36

    .line 912
    aget-byte v50, v7, v28

    move/from16 v0, v50

    and-int/lit16 v0, v0, 0xff

    move/from16 v50, v0

    or-int v8, v8, v50

    .line 909
    :cond_36
    add-int/lit8 v28, v28, 0x1

    goto :goto_14

    .line 829
    .end local v6    # "S":Ljava/math/BigInteger;
    .end local v7    # "S_bytes":[B
    .end local v8    # "S_hiWord":I
    .end local v28    # "idx":I
    .end local v46    # "spec_case":Z
    .local v42, "mhi":Ljava/lang/Object;
    :cond_37
    const/16 v50, 0x0

    aget v50, v13, v50

    rsub-int/lit8 v27, v50, 0x36

    goto/16 :goto_11

    .line 834
    :cond_38
    add-int/lit8 v33, v30, -0x1

    .line 835
    move/from16 v0, v41

    move/from16 v1, v33

    if-lt v0, v1, :cond_39

    .line 836
    sub-int v41, v41, v33

    .line 842
    :goto_15
    move/from16 v27, v30

    if-gez v30, :cond_2f

    .line 843
    sub-int v40, v40, v27

    .line 844
    const/16 v27, 0x0

    goto/16 :goto_11

    .line 838
    :cond_39
    sub-int v33, v33, v41

    add-int v45, v45, v33

    .line 839
    add-int v12, v12, v33

    .line 840
    const/16 v41, 0x0

    goto :goto_15

    .end local v42    # "mhi":Ljava/lang/Object;
    :cond_3a
    move/from16 v27, v44

    .line 857
    goto/16 :goto_12

    .line 875
    :cond_3b
    invoke-static {v9, v12}, Lorg/mozilla/javascript/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v9

    goto/16 :goto_13

    .line 914
    .restart local v6    # "S":Ljava/math/BigInteger;
    .restart local v7    # "S_bytes":[B
    .restart local v8    # "S_hiWord":I
    .restart local v28    # "idx":I
    .restart local v46    # "spec_case":Z
    :cond_3c
    if-eqz v45, :cond_44

    invoke-static {v8}, Lorg/mozilla/javascript/DToA;->hi0bits(I)I

    move-result v50

    rsub-int/lit8 v50, v50, 0x20

    :goto_16
    add-int v50, v50, v44

    and-int/lit8 v27, v50, 0x1f

    if-eqz v27, :cond_3d

    .line 915
    rsub-int/lit8 v27, v27, 0x20

    .line 917
    :cond_3d
    const/16 v50, 0x4

    move/from16 v0, v27

    move/from16 v1, v50

    if-le v0, v1, :cond_45

    .line 918
    add-int/lit8 v27, v27, -0x4

    .line 919
    add-int v11, v11, v27

    .line 920
    add-int v40, v40, v27

    .line 921
    add-int v44, v44, v27

    .line 930
    :cond_3e
    :goto_17
    if-lez v11, :cond_3f

    .line 931
    invoke-virtual {v9, v11}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v9

    .line 932
    :cond_3f
    if-lez v44, :cond_40

    .line 933
    move/from16 v0, v44

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v6

    .line 936
    :cond_40
    if-eqz v37, :cond_42

    .line 937
    invoke-virtual {v9, v6}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v50

    if-gez v50, :cond_42

    .line 938
    add-int/lit8 v35, v35, -0x1

    .line 939
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v50

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    .line 940
    if-eqz v39, :cond_41

    .line 941
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v42

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v42

    .line 942
    :cond_41
    move/from16 v30, v32

    .line 947
    :cond_42
    if-gtz v30, :cond_47

    const/16 v50, 0x2

    move/from16 v0, p2

    move/from16 v1, v50

    if-le v0, v1, :cond_47

    .line 950
    if-ltz v30, :cond_43

    const-wide/16 v50, 0x5

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v27

    if-ltz v27, :cond_43

    if-nez v27, :cond_46

    if-nez p3, :cond_46

    .line 958
    :cond_43
    const/16 v50, 0x0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 959
    const/16 v50, 0x30

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 960
    const/16 v50, 0x1

    goto/16 :goto_2

    .line 914
    :cond_44
    const/16 v50, 0x1

    goto/16 :goto_16

    .line 923
    :cond_45
    const/16 v50, 0x4

    move/from16 v0, v27

    move/from16 v1, v50

    if-ge v0, v1, :cond_3e

    .line 924
    add-int/lit8 v27, v27, 0x1c

    .line 925
    add-int v11, v11, v27

    .line 926
    add-int v40, v40, v27

    .line 927
    add-int v44, v44, v27

    goto/16 :goto_17

    .line 964
    :cond_46
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 965
    add-int/lit8 v35, v35, 0x1

    .line 966
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 968
    :cond_47
    if-eqz v39, :cond_5c

    .line 969
    if-lez v40, :cond_48

    .line 970
    move-object/from16 v0, v42

    move/from16 v1, v40

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v42

    .line 976
    :cond_48
    move-object/from16 v43, v42

    .line 977
    if-eqz v46, :cond_49

    .line 978
    move-object/from16 v42, v43

    .line 979
    .local v42, "mhi":Ljava/math/BigInteger;
    const/16 v50, 0x1

    move-object/from16 v0, v42

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v42

    .line 984
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_49
    const/16 v27, 0x1

    .line 985
    :goto_18
    invoke-virtual {v9, v6}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v21

    .line 986
    .local v21, "divResult":[Ljava/math/BigInteger;
    const/16 v50, 0x1

    aget-object v9, v21, v50

    .line 987
    const/16 v50, 0x0

    aget-object v50, v21, v50

    invoke-virtual/range {v50 .. v50}, Ljava/math/BigInteger;->intValue()I

    move-result v50

    add-int/lit8 v50, v50, 0x30

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v19, v0

    .line 991
    .local v19, "dig":C
    move-object/from16 v0, v43

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v33

    .line 993
    move-object/from16 v0, v42

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v15

    .line 994
    .local v15, "delta":Ljava/math/BigInteger;
    invoke-virtual {v15}, Ljava/math/BigInteger;->signum()I

    move-result v50

    if-gtz v50, :cond_4b

    const/16 v34, 0x1

    .line 996
    .restart local v34    # "j1":I
    :goto_19
    if-nez v34, :cond_4e

    if-nez p2, :cond_4e

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v50

    and-int/lit8 v50, v50, 0x1

    if-nez v50, :cond_4e

    .line 997
    const/16 v50, 0x39

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_4c

    .line 998
    const/16 v50, 0x39

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 999
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v50

    if-eqz v50, :cond_4a

    .line 1000
    add-int/lit8 v35, v35, 0x1

    .line 1001
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1003
    :cond_4a
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 994
    .end local v34    # "j1":I
    :cond_4b
    invoke-virtual {v9, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v34

    goto :goto_19

    .line 1006
    .restart local v34    # "j1":I
    :cond_4c
    if-lez v33, :cond_4d

    .line 1007
    add-int/lit8 v50, v19, 0x1

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v19, v0

    .line 1008
    :cond_4d
    move-object/from16 v0, p6

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1009
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 1011
    :cond_4e
    if-ltz v33, :cond_4f

    if-nez v33, :cond_54

    if-nez p2, :cond_54

    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v50

    and-int/lit8 v50, v50, 0x1

    if-nez v50, :cond_54

    .line 1016
    :cond_4f
    if-lez v34, :cond_53

    .line 1019
    const/16 v50, 0x1

    move/from16 v0, v50

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v9

    .line 1020
    invoke-virtual {v9, v6}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v34

    .line 1021
    if-gtz v34, :cond_50

    if-nez v34, :cond_53

    and-int/lit8 v50, v19, 0x1

    const/16 v51, 0x1

    move/from16 v0, v50

    move/from16 v1, v51

    if-eq v0, v1, :cond_50

    if-eqz p3, :cond_53

    :cond_50
    add-int/lit8 v50, v19, 0x1

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v20, v0

    .end local v19    # "dig":C
    .local v20, "dig":C
    const/16 v50, 0x39

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_52

    .line 1023
    const/16 v50, 0x39

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1024
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v50

    if-eqz v50, :cond_51

    .line 1025
    add-int/lit8 v35, v35, 0x1

    .line 1026
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1028
    :cond_51
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    :cond_52
    move/from16 v19, v20

    .line 1032
    .end local v20    # "dig":C
    .restart local v19    # "dig":C
    :cond_53
    move-object/from16 v0, p6

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1033
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 1035
    :cond_54
    if-lez v34, :cond_57

    .line 1036
    const/16 v50, 0x39

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_56

    .line 1040
    const/16 v50, 0x39

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1041
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v50

    if-eqz v50, :cond_55

    .line 1042
    add-int/lit8 v35, v35, 0x1

    .line 1043
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1045
    :cond_55
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 1047
    :cond_56
    add-int/lit8 v50, v19, 0x1

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v50, v0

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1048
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 1050
    :cond_57
    move-object/from16 v0, p6

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1051
    move/from16 v0, v27

    move/from16 v1, v30

    if-ne v0, v1, :cond_5a

    .line 1076
    .end local v15    # "delta":Ljava/math/BigInteger;
    .end local v34    # "j1":I
    :cond_58
    const/16 v50, 0x1

    move/from16 v0, v50

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v9

    .line 1077
    invoke-virtual {v9, v6}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v33

    .line 1078
    if-gtz v33, :cond_59

    if-nez v33, :cond_5d

    and-int/lit8 v50, v19, 0x1

    const/16 v51, 0x1

    move/from16 v0, v50

    move/from16 v1, v51

    if-eq v0, v1, :cond_59

    if-eqz p3, :cond_5d

    .line 1087
    :cond_59
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v50

    if-eqz v50, :cond_5e

    .line 1088
    add-int/lit8 v35, v35, 0x1

    .line 1089
    const/16 v50, 0x31

    move-object/from16 v0, p6

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1090
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 1053
    .restart local v15    # "delta":Ljava/math/BigInteger;
    .restart local v34    # "j1":I
    :cond_5a
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v50

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    .line 1054
    move-object/from16 v0, v43

    move-object/from16 v1, v42

    if-ne v0, v1, :cond_5b

    .line 1055
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v42

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v42

    .restart local v42    # "mhi":Ljava/math/BigInteger;
    move-object/from16 v43, v42

    .line 984
    :goto_1a
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_18

    .line 1057
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_5b
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v43

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v43

    .line 1058
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v42

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v42

    .restart local v42    # "mhi":Ljava/math/BigInteger;
    goto :goto_1a

    .line 1063
    .end local v15    # "delta":Ljava/math/BigInteger;
    .end local v19    # "dig":C
    .end local v21    # "divResult":[Ljava/math/BigInteger;
    .end local v34    # "j1":I
    .end local v42    # "mhi":Ljava/math/BigInteger;
    :cond_5c
    const/16 v27, 0x1

    .line 1065
    :goto_1b
    invoke-virtual {v9, v6}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v21

    .line 1066
    .restart local v21    # "divResult":[Ljava/math/BigInteger;
    const/16 v50, 0x1

    aget-object v9, v21, v50

    .line 1067
    const/16 v50, 0x0

    aget-object v50, v21, v50

    invoke-virtual/range {v50 .. v50}, Ljava/math/BigInteger;->intValue()I

    move-result v50

    add-int/lit8 v50, v50, 0x30

    move/from16 v0, v50

    int-to-char v0, v0

    move/from16 v19, v0

    .line 1068
    .restart local v19    # "dig":C
    move-object/from16 v0, p6

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1069
    move/from16 v0, v27

    move/from16 v1, v30

    if-ge v0, v1, :cond_58

    .line 1071
    const-wide/16 v50, 0xa

    invoke-static/range {v50 .. v51}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v50

    move-object/from16 v0, v50

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    .line 1063
    add-int/lit8 v27, v27, 0x1

    goto :goto_1b

    .line 1094
    :cond_5d
    invoke-static/range {p6 .. p6}, Lorg/mozilla/javascript/DToA;->stripTrailingZeroes(Ljava/lang/StringBuilder;)V

    .line 1108
    :cond_5e
    add-int/lit8 v50, v35, 0x1

    goto/16 :goto_2

    .line 596
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method

.method static JS_dtobasestr(ID)Ljava/lang/String;
    .locals 43
    .param p0, "base"    # I
    .param p1, "d"    # D

    .prologue
    .line 208
    const/16 v37, 0x2

    move/from16 v0, v37

    move/from16 v1, p0

    if-gt v0, v1, :cond_0

    const/16 v37, 0x24

    move/from16 v0, p0

    move/from16 v1, v37

    if-le v0, v1, :cond_1

    .line 209
    :cond_0
    new-instance v37, Ljava/lang/IllegalArgumentException;

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "Bad base: "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-direct/range {v37 .. v38}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v37

    .line 212
    :cond_1
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v37

    if-eqz v37, :cond_2

    .line 213
    const-string v37, "NaN"

    .line 355
    :goto_0
    return-object v37

    .line 214
    :cond_2
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v37

    if-eqz v37, :cond_4

    .line 215
    const-wide/16 v38, 0x0

    cmpl-double v37, p1, v38

    if-lez v37, :cond_3

    const-string v37, "Infinity"

    goto :goto_0

    :cond_3
    const-string v37, "-Infinity"

    goto :goto_0

    .line 216
    :cond_4
    const-wide/16 v38, 0x0

    cmpl-double v37, p1, v38

    if-nez v37, :cond_5

    .line 218
    const-string v37, "0"

    goto :goto_0

    .line 222
    :cond_5
    const-wide/16 v38, 0x0

    cmpl-double v37, p1, v38

    if-ltz v37, :cond_7

    .line 223
    const/16 v31, 0x0

    .line 232
    .local v31, "negative":Z
    :goto_1
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    .line 233
    .local v14, "dfloor":D
    double-to-long v0, v14

    move-wide/from16 v26, v0

    .line 234
    .local v26, "lfloor":J
    move-wide/from16 v0, v26

    long-to-double v0, v0

    move-wide/from16 v38, v0

    cmpl-double v37, v38, v14

    if-nez v37, :cond_8

    .line 236
    if-eqz v31, :cond_6

    move-wide/from16 v0, v26

    neg-long v0, v0

    move-wide/from16 v26, v0

    .end local v26    # "lfloor":J
    :cond_6
    move-wide/from16 v0, v26

    move/from16 v2, p0

    invoke-static {v0, v1, v2}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v22

    .line 260
    .local v22, "intDigits":Ljava/lang/String;
    :goto_2
    cmpl-double v37, p1, v14

    if-nez v37, :cond_d

    move-object/from16 v37, v22

    .line 262
    goto :goto_0

    .line 225
    .end local v14    # "dfloor":D
    .end local v22    # "intDigits":Ljava/lang/String;
    .end local v31    # "negative":Z
    :cond_7
    const/16 v31, 0x1

    .line 226
    .restart local v31    # "negative":Z
    move-wide/from16 v0, p1

    neg-double v0, v0

    move-wide/from16 p1, v0

    goto :goto_1

    .line 239
    .restart local v14    # "dfloor":D
    .restart local v26    # "lfloor":J
    :cond_8
    invoke-static {v14, v15}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v20

    .line 240
    .local v20, "floorBits":J
    const/16 v37, 0x34

    shr-long v38, v20, v37

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v37, v0

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0x7ff

    move/from16 v19, v0

    .line 242
    .local v19, "exp":I
    if-nez v19, :cond_b

    .line 243
    const-wide v38, 0xfffffffffffffL

    and-long v38, v38, v20

    const/16 v37, 0x1

    shl-long v28, v38, v37

    .line 247
    .local v28, "mantissa":J
    :goto_3
    if-eqz v31, :cond_9

    .line 248
    move-wide/from16 v0, v28

    neg-long v0, v0

    move-wide/from16 v28, v0

    .line 250
    :cond_9
    move/from16 v0, v19

    add-int/lit16 v0, v0, -0x433

    move/from16 v19, v0

    .line 251
    invoke-static/range {v28 .. v29}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v36

    .line 252
    .local v36, "x":Ljava/math/BigInteger;
    if-lez v19, :cond_c

    .line 253
    move-object/from16 v0, v36

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v36

    .line 257
    :cond_a
    :goto_4
    move-object/from16 v0, v36

    move/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v22

    .restart local v22    # "intDigits":Ljava/lang/String;
    goto :goto_2

    .line 245
    .end local v22    # "intDigits":Ljava/lang/String;
    .end local v28    # "mantissa":J
    .end local v36    # "x":Ljava/math/BigInteger;
    :cond_b
    const-wide v38, 0xfffffffffffffL

    and-long v38, v38, v20

    const-wide/high16 v40, 0x10000000000000L

    or-long v28, v38, v40

    .restart local v28    # "mantissa":J
    goto :goto_3

    .line 254
    .restart local v36    # "x":Ljava/math/BigInteger;
    :cond_c
    if-gez v19, :cond_a

    .line 255
    move/from16 v0, v19

    neg-int v0, v0

    move/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v36

    goto :goto_4

    .line 271
    .end local v19    # "exp":I
    .end local v20    # "floorBits":J
    .end local v26    # "lfloor":J
    .end local v28    # "mantissa":J
    .end local v36    # "x":Ljava/math/BigInteger;
    .restart local v22    # "intDigits":Ljava/lang/String;
    :cond_d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v7, "buffer":Ljava/lang/StringBuilder;
    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x2e

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 273
    sub-double v12, p1, v14

    .line 275
    .local v12, "df":D
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v8

    .line 276
    .local v8, "dBits":J
    const/16 v37, 0x20

    shr-long v38, v8, v37

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move/from16 v34, v0

    .line 277
    .local v34, "word0":I
    long-to-int v0, v8

    move/from16 v35, v0

    .line 279
    .local v35, "word1":I
    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [I

    move-object/from16 v18, v0

    .line 280
    .local v18, "e":[I
    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v5, v0, [I

    .line 282
    .local v5, "bbits":[I
    move-object/from16 v0, v18

    invoke-static {v12, v13, v0, v5}, Lorg/mozilla/javascript/DToA;->d2b(D[I[I)Ljava/math/BigInteger;

    move-result-object v4

    .line 286
    .local v4, "b":Ljava/math/BigInteger;
    ushr-int/lit8 v37, v34, 0x14

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0x7ff

    move/from16 v37, v0

    move/from16 v0, v37

    neg-int v0, v0

    move/from16 v33, v0

    .line 287
    .local v33, "s2":I
    if-nez v33, :cond_e

    .line 288
    const/16 v33, -0x1

    .line 289
    :cond_e
    move/from16 v0, v33

    add-int/lit16 v0, v0, 0x434

    move/from16 v33, v0

    .line 292
    const-wide/16 v38, 0x1

    invoke-static/range {v38 .. v39}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v30

    .line 293
    .local v30, "mlo":Ljava/math/BigInteger;
    move-object/from16 v25, v30

    .line 294
    .local v25, "mhi":Ljava/math/BigInteger;
    if-nez v35, :cond_f

    const v37, 0xfffff

    and-int v37, v37, v34

    if-nez v37, :cond_f

    const/high16 v37, 0x7fe00000

    and-int v37, v37, v34

    if-eqz v37, :cond_f

    .line 298
    add-int/lit8 v33, v33, 0x1

    .line 299
    const-wide/16 v38, 0x2

    invoke-static/range {v38 .. v39}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v25

    .line 302
    :cond_f
    const/16 v37, 0x0

    aget v37, v18, v37

    add-int v37, v37, v33

    move/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v4

    .line 303
    const-wide/16 v38, 0x1

    invoke-static/range {v38 .. v39}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v32

    .line 304
    .local v32, "s":Ljava/math/BigInteger;
    invoke-virtual/range {v32 .. v33}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v32

    .line 310
    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v38, v0

    invoke-static/range {v38 .. v39}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v6

    .line 312
    .local v6, "bigBase":Ljava/math/BigInteger;
    const/16 v17, 0x0

    .line 314
    .local v17, "done":Z
    :cond_10
    invoke-virtual {v4, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 315
    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v16

    .line 316
    .local v16, "divResult":[Ljava/math/BigInteger;
    const/16 v37, 0x1

    aget-object v4, v16, v37

    .line 317
    const/16 v37, 0x0

    aget-object v37, v16, v37

    invoke-virtual/range {v37 .. v37}, Ljava/math/BigInteger;->intValue()I

    move-result v37

    move/from16 v0, v37

    int-to-char v11, v0

    .line 318
    .local v11, "digit":I
    move-object/from16 v0, v30

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_13

    .line 319
    move-object/from16 v0, v30

    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v25

    move-object/from16 v30, v25

    .line 326
    :goto_5
    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v23

    .line 328
    .local v23, "j":I
    move-object/from16 v0, v32

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v10

    .line 329
    .local v10, "delta":Ljava/math/BigInteger;
    invoke-virtual {v10}, Ljava/math/BigInteger;->signum()I

    move-result v37

    if-gtz v37, :cond_14

    const/16 v24, 0x1

    .line 331
    .local v24, "j1":I
    :goto_6
    if-nez v24, :cond_15

    and-int/lit8 v37, v35, 0x1

    if-nez v37, :cond_15

    .line 332
    if-lez v23, :cond_11

    .line 333
    add-int/lit8 v11, v11, 0x1

    .line 334
    :cond_11
    const/16 v17, 0x1

    .line 352
    :cond_12
    :goto_7
    invoke-static {v11}, Lorg/mozilla/javascript/DToA;->BASEDIGIT(I)C

    move-result v37

    move/from16 v0, v37

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    if-eqz v17, :cond_10

    .line 355
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    goto/16 :goto_0

    .line 321
    .end local v10    # "delta":Ljava/math/BigInteger;
    .end local v23    # "j":I
    .end local v24    # "j1":I
    :cond_13
    move-object/from16 v0, v30

    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v30

    .line 322
    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v25

    goto :goto_5

    .line 329
    .restart local v10    # "delta":Ljava/math/BigInteger;
    .restart local v23    # "j":I
    :cond_14
    invoke-virtual {v4, v10}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v24

    goto :goto_6

    .line 336
    .restart local v24    # "j1":I
    :cond_15
    if-ltz v23, :cond_16

    if-nez v23, :cond_18

    and-int/lit8 v37, v35, 0x1

    if-nez v37, :cond_18

    .line 337
    :cond_16
    if-lez v24, :cond_17

    .line 340
    const/16 v37, 0x1

    move/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v4

    .line 341
    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v24

    .line 342
    if-lez v24, :cond_17

    .line 344
    add-int/lit8 v11, v11, 0x1

    .line 346
    :cond_17
    const/16 v17, 0x1

    goto :goto_7

    .line 347
    :cond_18
    if-lez v24, :cond_12

    .line 348
    add-int/lit8 v11, v11, 0x1

    .line 349
    const/16 v17, 0x1

    goto :goto_7
.end method

.method static JS_dtostr(Ljava/lang/StringBuilder;IID)V
    .locals 13
    .param p0, "buffer"    # Ljava/lang/StringBuilder;
    .param p1, "mode"    # I
    .param p2, "precision"    # I
    .param p3, "d"    # D

    .prologue
    .line 1135
    const/4 v0, 0x1

    new-array v5, v0, [Z

    .line 1141
    .local v5, "sign":[Z
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    const-wide v0, 0x444b1ae4d6e2ef50L    # 1.0E21

    cmpl-double v0, p3, v0

    if-gez v0, :cond_0

    const-wide v0, -0x3bb4e51b291d10b0L    # -1.0E21

    cmpg-double v0, p3, v0

    if-gtz v0, :cond_1

    .line 1142
    :cond_0
    const/4 p1, 0x0

    .line 1144
    :cond_1
    sget-object v0, Lorg/mozilla/javascript/DToA;->dtoaModes:[I

    aget v2, v0, p1

    const/4 v0, 0x2

    if-lt p1, v0, :cond_b

    const/4 v3, 0x1

    :goto_0
    move-wide/from16 v0, p3

    move v4, p2

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lorg/mozilla/javascript/DToA;->JS_dtoa(DIZI[ZLjava/lang/StringBuilder;)I

    move-result v7

    .line 1145
    .local v7, "decPt":I
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    .line 1148
    .local v11, "nDigits":I
    const/16 v0, 0x270f

    if-eq v7, v0, :cond_7

    .line 1149
    const/4 v8, 0x0

    .line 1150
    .local v8, "exponentialNotation":Z
    const/4 v10, 0x0

    .line 1153
    .local v10, "minNDigits":I
    packed-switch p1, :pswitch_data_0

    .line 1185
    :cond_2
    :goto_1
    if-ge v11, v10, :cond_4

    .line 1186
    move v12, v10

    .line 1187
    .local v12, "p":I
    move v11, v10

    .line 1189
    :cond_3
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1190
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-ne v0, v12, :cond_3

    .line 1193
    .end local v12    # "p":I
    :cond_4
    if-eqz v8, :cond_10

    .line 1195
    const/4 v0, 0x1

    if-eq v11, v0, :cond_5

    .line 1196
    const/4 v0, 0x1

    const/16 v1, 0x2e

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1198
    :cond_5
    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1199
    add-int/lit8 v0, v7, -0x1

    if-ltz v0, :cond_6

    .line 1200
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1201
    :cond_6
    add-int/lit8 v0, v7, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1219
    .end local v8    # "exponentialNotation":Z
    .end local v10    # "minNDigits":I
    :cond_7
    :goto_2
    const/4 v0, 0x0

    aget-boolean v0, v5, v0

    if-eqz v0, :cond_a

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v0

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_8

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v0

    const/high16 v1, 0x7ff00000

    and-int/2addr v0, v1

    const/high16 v1, 0x7ff00000

    if-ne v0, v1, :cond_9

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word1(D)I

    move-result v0

    if-nez v0, :cond_a

    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/DToA;->word0(D)I

    move-result v0

    const v1, 0xfffff

    and-int/2addr v0, v1

    if-nez v0, :cond_a

    .line 1223
    :cond_9
    const/4 v0, 0x0

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1225
    :cond_a
    return-void

    .line 1144
    .end local v7    # "decPt":I
    .end local v11    # "nDigits":I
    :cond_b
    const/4 v3, 0x0

    goto :goto_0

    .line 1155
    .restart local v7    # "decPt":I
    .restart local v8    # "exponentialNotation":Z
    .restart local v10    # "minNDigits":I
    .restart local v11    # "nDigits":I
    :pswitch_0
    const/4 v0, -0x5

    if-lt v7, v0, :cond_c

    const/16 v0, 0x15

    if-le v7, v0, :cond_d

    .line 1156
    :cond_c
    const/4 v8, 0x1

    goto :goto_1

    .line 1158
    :cond_d
    move v10, v7

    .line 1159
    goto :goto_1

    .line 1162
    :pswitch_1
    if-ltz p2, :cond_e

    .line 1163
    add-int v10, v7, p2

    goto :goto_1

    .line 1165
    :cond_e
    move v10, v7

    .line 1166
    goto :goto_1

    .line 1170
    :pswitch_2
    move v10, p2

    .line 1173
    :pswitch_3
    const/4 v8, 0x1

    .line 1174
    goto :goto_1

    .line 1178
    :pswitch_4
    move v10, p2

    .line 1179
    const/4 v0, -0x5

    if-lt v7, v0, :cond_f

    if-le v7, p2, :cond_2

    .line 1180
    :cond_f
    const/4 v8, 0x1

    goto :goto_1

    .line 1203
    :cond_10
    if-eq v7, v11, :cond_7

    .line 1206
    if-lez v7, :cond_11

    .line 1208
    const/16 v0, 0x2e

    invoke-virtual {p0, v7, v0}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1211
    :cond_11
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3
    rsub-int/lit8 v0, v7, 0x1

    if-ge v9, v0, :cond_12

    .line 1212
    const/4 v0, 0x0

    const/16 v1, 0x30

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1211
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 1213
    :cond_12
    const/4 v0, 0x1

    const/16 v1, 0x2e

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1153
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method

.method private static d2b(D[I[I)Ljava/math/BigInteger;
    .locals 14
    .param p0, "d"    # D
    .param p2, "e"    # [I
    .param p3, "bits"    # [I

    .prologue
    .line 163
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 164
    .local v2, "dBits":J
    const/16 v10, 0x20

    ushr-long v10, v2, v10

    long-to-int v0, v10

    .line 165
    .local v0, "d0":I
    long-to-int v1, v2

    .line 167
    .local v1, "d1":I
    const v10, 0xfffff

    and-int v9, v0, v10

    .line 168
    .local v9, "z":I
    const v10, 0x7fffffff

    and-int/2addr v0, v10

    .line 170
    ushr-int/lit8 v5, v0, 0x14

    .local v5, "de":I
    if-eqz v5, :cond_0

    .line 171
    const/high16 v10, 0x100000

    or-int/2addr v9, v10

    .line 173
    :cond_0
    move v8, v1

    .local v8, "y":I
    if-eqz v1, :cond_3

    .line 174
    const/16 v10, 0x8

    new-array v4, v10, [B

    .line 175
    .local v4, "dbl_bits":[B
    invoke-static {v8}, Lorg/mozilla/javascript/DToA;->lo0bits(I)I

    move-result v7

    .line 176
    .local v7, "k":I
    ushr-int/2addr v8, v7

    .line 177
    if-eqz v7, :cond_1

    .line 178
    const/4 v10, 0x4

    rsub-int/lit8 v11, v7, 0x20

    shl-int v11, v9, v11

    or-int/2addr v11, v8

    invoke-static {v4, v10, v11}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    .line 179
    shr-int/2addr v9, v7

    .line 183
    :goto_0
    const/4 v10, 0x0

    invoke-static {v4, v10, v9}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    .line 184
    if-eqz v9, :cond_2

    const/4 v6, 0x2

    .line 195
    .local v6, "i":I
    :goto_1
    if-eqz v5, :cond_4

    .line 196
    const/4 v10, 0x0

    add-int/lit16 v11, v5, -0x3ff

    add-int/lit8 v11, v11, -0x34

    add-int/2addr v11, v7

    aput v11, p2, v10

    .line 197
    const/4 v10, 0x0

    rsub-int/lit8 v11, v7, 0x35

    aput v11, p3, v10

    .line 203
    :goto_2
    new-instance v10, Ljava/math/BigInteger;

    invoke-direct {v10, v4}, Ljava/math/BigInteger;-><init>([B)V

    return-object v10

    .line 182
    .end local v6    # "i":I
    :cond_1
    const/4 v10, 0x4

    invoke-static {v4, v10, v8}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    goto :goto_0

    .line 184
    :cond_2
    const/4 v6, 0x1

    goto :goto_1

    .line 188
    .end local v4    # "dbl_bits":[B
    .end local v7    # "k":I
    :cond_3
    const/4 v10, 0x4

    new-array v4, v10, [B

    .line 189
    .restart local v4    # "dbl_bits":[B
    invoke-static {v9}, Lorg/mozilla/javascript/DToA;->lo0bits(I)I

    move-result v7

    .line 190
    .restart local v7    # "k":I
    ushr-int/2addr v9, v7

    .line 191
    const/4 v10, 0x0

    invoke-static {v4, v10, v9}, Lorg/mozilla/javascript/DToA;->stuffBits([BII)V

    .line 192
    add-int/lit8 v7, v7, 0x20

    .line 193
    const/4 v6, 0x1

    .restart local v6    # "i":I
    goto :goto_1

    .line 200
    :cond_4
    const/4 v10, 0x0

    add-int/lit16 v11, v5, -0x3ff

    add-int/lit8 v11, v11, -0x34

    add-int/lit8 v11, v11, 0x1

    add-int/2addr v11, v7

    aput v11, p2, v10

    .line 201
    const/4 v10, 0x0

    mul-int/lit8 v11, v6, 0x20

    invoke-static {v9}, Lorg/mozilla/javascript/DToA;->hi0bits(I)I

    move-result v12

    sub-int/2addr v11, v12

    aput v11, p3, v10

    goto :goto_2
.end method

.method private static hi0bits(I)I
    .locals 2
    .param p0, "x"    # I

    .prologue
    .line 122
    const/4 v0, 0x0

    .line 124
    .local v0, "k":I
    const/high16 v1, -0x10000

    and-int/2addr v1, p0

    if-nez v1, :cond_0

    .line 125
    const/16 v0, 0x10

    .line 126
    shl-int/lit8 p0, p0, 0x10

    .line 128
    :cond_0
    const/high16 v1, -0x1000000

    and-int/2addr v1, p0

    if-nez v1, :cond_1

    .line 129
    add-int/lit8 v0, v0, 0x8

    .line 130
    shl-int/lit8 p0, p0, 0x8

    .line 132
    :cond_1
    const/high16 v1, -0x10000000

    and-int/2addr v1, p0

    if-nez v1, :cond_2

    .line 133
    add-int/lit8 v0, v0, 0x4

    .line 134
    shl-int/lit8 p0, p0, 0x4

    .line 136
    :cond_2
    const/high16 v1, -0x40000000    # -2.0f

    and-int/2addr v1, p0

    if-nez v1, :cond_3

    .line 137
    add-int/lit8 v0, v0, 0x2

    .line 138
    shl-int/lit8 p0, p0, 0x2

    .line 140
    :cond_3
    const/high16 v1, -0x80000000

    and-int/2addr v1, p0

    if-nez v1, :cond_4

    .line 141
    add-int/lit8 v0, v0, 0x1

    .line 142
    const/high16 v1, 0x40000000    # 2.0f

    and-int/2addr v1, p0

    if-nez v1, :cond_4

    .line 143
    const/16 v1, 0x20

    .line 145
    :goto_0
    return v1

    :cond_4
    move v1, v0

    goto :goto_0
.end method

.method private static lo0bits(I)I
    .locals 3
    .param p0, "y"    # I

    .prologue
    .line 83
    move v1, p0

    .line 85
    .local v1, "x":I
    and-int/lit8 v2, v1, 0x7

    if-eqz v2, :cond_3

    .line 86
    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_1

    .line 87
    const/4 v0, 0x0

    .line 116
    :cond_0
    :goto_0
    return v0

    .line 88
    :cond_1
    and-int/lit8 v2, v1, 0x2

    if-eqz v2, :cond_2

    .line 89
    const/4 v0, 0x1

    goto :goto_0

    .line 91
    :cond_2
    const/4 v0, 0x2

    goto :goto_0

    .line 93
    :cond_3
    const/4 v0, 0x0

    .line 94
    .local v0, "k":I
    const v2, 0xffff

    and-int/2addr v2, v1

    if-nez v2, :cond_4

    .line 95
    const/16 v0, 0x10

    .line 96
    ushr-int/lit8 v1, v1, 0x10

    .line 98
    :cond_4
    and-int/lit16 v2, v1, 0xff

    if-nez v2, :cond_5

    .line 99
    add-int/lit8 v0, v0, 0x8

    .line 100
    ushr-int/lit8 v1, v1, 0x8

    .line 102
    :cond_5
    and-int/lit8 v2, v1, 0xf

    if-nez v2, :cond_6

    .line 103
    add-int/lit8 v0, v0, 0x4

    .line 104
    ushr-int/lit8 v1, v1, 0x4

    .line 106
    :cond_6
    and-int/lit8 v2, v1, 0x3

    if-nez v2, :cond_7

    .line 107
    add-int/lit8 v0, v0, 0x2

    .line 108
    ushr-int/lit8 v1, v1, 0x2

    .line 110
    :cond_7
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_0

    .line 111
    add-int/lit8 v0, v0, 0x1

    .line 112
    ushr-int/lit8 v1, v1, 0x1

    .line 113
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_0

    .line 114
    const/16 v0, 0x20

    goto :goto_0
.end method

.method static pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;
    .locals 2
    .param p0, "b"    # Ljava/math/BigInteger;
    .param p1, "k"    # I

    .prologue
    .line 417
    const-wide/16 v0, 0x5

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method static roundOff(Ljava/lang/StringBuilder;)Z
    .locals 4
    .param p0, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    const/4 v2, 0x0

    .line 422
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 423
    .local v1, "i":I
    :cond_0
    if-eqz v1, :cond_1

    .line 424
    add-int/lit8 v1, v1, -0x1

    .line 425
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    .line 426
    .local v0, "c":C
    const/16 v3, 0x39

    if-eq v0, v3, :cond_0

    .line 427
    add-int/lit8 v3, v0, 0x1

    int-to-char v3, v3

    invoke-virtual {p0, v1, v3}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 428
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 433
    .end local v0    # "c":C
    :goto_0
    return v2

    .line 432
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 433
    const/4 v2, 0x1

    goto :goto_0
.end method

.method static setWord0(DI)D
    .locals 6
    .param p0, "d"    # D
    .param p2, "i"    # I

    .prologue
    .line 402
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 403
    .local v0, "dBits":J
    int-to-long v2, p2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    and-long/2addr v4, v0

    or-long v0, v2, v4

    .line 404
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    return-wide v2
.end method

.method private static stripTrailingZeroes(Ljava/lang/StringBuilder;)V
    .locals 4
    .param p0, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 1116
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .local v0, "bl":I
    move v1, v0

    .line 1117
    .end local v0    # "bl":I
    .local v1, "bl":I
    :goto_0
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "bl":I
    .restart local v0    # "bl":I
    if-lez v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-ne v2, v3, :cond_0

    move v1, v0

    .end local v0    # "bl":I
    .restart local v1    # "bl":I
    goto :goto_0

    .line 1120
    .end local v1    # "bl":I
    .restart local v0    # "bl":I
    :cond_0
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1121
    return-void
.end method

.method private static stuffBits([BII)V
    .locals 2
    .param p0, "bits"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I

    .prologue
    .line 150
    shr-int/lit8 v0, p2, 0x18

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 151
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x10

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 152
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 153
    add-int/lit8 v0, p1, 0x3

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 154
    return-void
.end method

.method static word0(D)I
    .locals 4
    .param p0, "d"    # D

    .prologue
    .line 396
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 397
    .local v0, "dBits":J
    const/16 v2, 0x20

    shr-long v2, v0, v2

    long-to-int v2, v2

    return v2
.end method

.method static word1(D)I
    .locals 4
    .param p0, "d"    # D

    .prologue
    .line 409
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 410
    .local v0, "dBits":J
    long-to-int v2, v0

    return v2
.end method
