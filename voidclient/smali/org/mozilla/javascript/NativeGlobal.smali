.class public Lorg/mozilla/javascript/NativeGlobal;
.super Ljava/lang/Object;
.source "NativeGlobal.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lorg/mozilla/javascript/IdFunctionCall;


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final INVALID_UTF8:I = 0x7fffffff

.field private static final Id_decodeURI:I = 0x1

.field private static final Id_decodeURIComponent:I = 0x2

.field private static final Id_encodeURI:I = 0x3

.field private static final Id_encodeURIComponent:I = 0x4

.field private static final Id_escape:I = 0x5

.field private static final Id_eval:I = 0x6

.field private static final Id_isFinite:I = 0x7

.field private static final Id_isNaN:I = 0x8

.field private static final Id_isXMLName:I = 0x9

.field private static final Id_new_CommonError:I = 0xe

.field private static final Id_parseFloat:I = 0xa

.field private static final Id_parseInt:I = 0xb

.field private static final Id_unescape:I = 0xc

.field private static final Id_uneval:I = 0xd

.field private static final LAST_SCOPE_FUNCTION_ID:I = 0xd

.field private static final URI_DECODE_RESERVED:Ljava/lang/String; = ";/?:@&=+$,#"

.field static final serialVersionUID:J = 0x546211ef26c230caL


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 753
    const-string v0, "Global"

    sput-object v0, Lorg/mozilla/javascript/NativeGlobal;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static constructError(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/EcmaError;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 507
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static constructError(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;IILjava/lang/String;)Lorg/mozilla/javascript/EcmaError;
    .locals 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "sourceName"    # Ljava/lang/String;
    .param p5, "lineNumber"    # I
    .param p6, "columnNumber"    # I
    .param p7, "lineSource"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 525
    move-object v0, p1

    move-object v1, p2

    move-object v2, p4

    move v3, p5

    move-object v4, p7

    move v5, p6

    invoke-static/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method private static decode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 19
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "fullUri"    # Z

    .prologue
    .line 610
    const/4 v6, 0x0

    .line 611
    .local v6, "buf":[C
    const/4 v7, 0x0

    .line 613
    .local v7, "bufTop":I
    const/4 v10, 0x0

    .local v10, "k":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v11

    .local v11, "length":I
    move v8, v7

    .end local v7    # "bufTop":I
    .local v8, "bufTop":I
    :goto_0
    if-eq v10, v11, :cond_18

    .line 614
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 615
    .local v4, "C":C
    const/16 v17, 0x25

    move/from16 v0, v17

    if-eq v4, v0, :cond_0

    .line 616
    if-eqz v6, :cond_1a

    .line 617
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    aput-char v4, v6, v8

    .line 619
    :goto_1
    add-int/lit8 v10, v10, 0x1

    :goto_2
    move v8, v7

    .line 700
    .end local v7    # "bufTop":I
    .restart local v8    # "bufTop":I
    goto :goto_0

    .line 621
    :cond_0
    if-nez v6, :cond_1

    .line 624
    new-array v6, v11, [C

    .line 625
    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v10, v6, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 626
    move v7, v10

    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    move v8, v7

    .line 628
    .end local v7    # "bufTop":I
    .restart local v8    # "bufTop":I
    :cond_1
    move v13, v10

    .line 629
    .local v13, "start":I
    add-int/lit8 v17, v10, 0x3

    move/from16 v0, v17

    if-le v0, v11, :cond_2

    .line 630
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 631
    :cond_2
    add-int/lit8 v17, v10, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v17

    add-int/lit8 v18, v10, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v18

    invoke-static/range {v17 .. v18}, Lorg/mozilla/javascript/NativeGlobal;->unHex(CC)I

    move-result v3

    .line 632
    .local v3, "B":I
    if-gez v3, :cond_3

    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 633
    :cond_3
    add-int/lit8 v10, v10, 0x3

    .line 634
    and-int/lit16 v0, v3, 0x80

    move/from16 v17, v0

    if-nez v17, :cond_4

    .line 635
    int-to-char v4, v3

    .line 692
    :goto_3
    if-eqz p1, :cond_17

    const-string v17, ";/?:@&=+$,#"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v17

    if-ltz v17, :cond_17

    .line 693
    move/from16 v16, v13

    .local v16, "x":I
    :goto_4
    move/from16 v0, v16

    if-eq v0, v10, :cond_16

    .line 694
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v17

    aput-char v17, v6, v8

    .line 693
    add-int/lit8 v16, v16, 0x1

    move v8, v7

    .end local v7    # "bufTop":I
    .restart local v8    # "bufTop":I
    goto :goto_4

    .line 640
    .end local v16    # "x":I
    :cond_4
    and-int/lit16 v0, v3, 0xc0

    move/from16 v17, v0

    const/16 v18, 0x80

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_5

    .line 642
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 643
    :cond_5
    and-int/lit8 v17, v3, 0x20

    if-nez v17, :cond_6

    .line 644
    const/4 v15, 0x1

    .local v15, "utf8Tail":I
    and-int/lit8 v14, v3, 0x1f

    .line 645
    .local v14, "ucs4Char":I
    const/16 v12, 0x80

    .line 662
    .local v12, "minUcs4Char":I
    :goto_5
    mul-int/lit8 v17, v15, 0x3

    add-int v17, v17, v10

    move/from16 v0, v17

    if-le v0, v11, :cond_b

    .line 663
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 646
    .end local v12    # "minUcs4Char":I
    .end local v14    # "ucs4Char":I
    .end local v15    # "utf8Tail":I
    :cond_6
    and-int/lit8 v17, v3, 0x10

    if-nez v17, :cond_7

    .line 647
    const/4 v15, 0x2

    .restart local v15    # "utf8Tail":I
    and-int/lit8 v14, v3, 0xf

    .line 648
    .restart local v14    # "ucs4Char":I
    const/16 v12, 0x800

    .restart local v12    # "minUcs4Char":I
    goto :goto_5

    .line 649
    .end local v12    # "minUcs4Char":I
    .end local v14    # "ucs4Char":I
    .end local v15    # "utf8Tail":I
    :cond_7
    and-int/lit8 v17, v3, 0x8

    if-nez v17, :cond_8

    .line 650
    const/4 v15, 0x3

    .restart local v15    # "utf8Tail":I
    and-int/lit8 v14, v3, 0x7

    .line 651
    .restart local v14    # "ucs4Char":I
    const/high16 v12, 0x10000

    .restart local v12    # "minUcs4Char":I
    goto :goto_5

    .line 652
    .end local v12    # "minUcs4Char":I
    .end local v14    # "ucs4Char":I
    .end local v15    # "utf8Tail":I
    :cond_8
    and-int/lit8 v17, v3, 0x4

    if-nez v17, :cond_9

    .line 653
    const/4 v15, 0x4

    .restart local v15    # "utf8Tail":I
    and-int/lit8 v14, v3, 0x3

    .line 654
    .restart local v14    # "ucs4Char":I
    const/high16 v12, 0x200000

    .restart local v12    # "minUcs4Char":I
    goto :goto_5

    .line 655
    .end local v12    # "minUcs4Char":I
    .end local v14    # "ucs4Char":I
    .end local v15    # "utf8Tail":I
    :cond_9
    and-int/lit8 v17, v3, 0x2

    if-nez v17, :cond_a

    .line 656
    const/4 v15, 0x5

    .restart local v15    # "utf8Tail":I
    and-int/lit8 v14, v3, 0x1

    .line 657
    .restart local v14    # "ucs4Char":I
    const/high16 v12, 0x4000000

    .restart local v12    # "minUcs4Char":I
    goto :goto_5

    .line 660
    .end local v12    # "minUcs4Char":I
    .end local v14    # "ucs4Char":I
    .end local v15    # "utf8Tail":I
    :cond_a
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 664
    .restart local v12    # "minUcs4Char":I
    .restart local v14    # "ucs4Char":I
    .restart local v15    # "utf8Tail":I
    :cond_b
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_6
    if-eq v9, v15, :cond_f

    .line 665
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x25

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_c

    .line 666
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 667
    :cond_c
    add-int/lit8 v17, v10, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v17

    add-int/lit8 v18, v10, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v18

    invoke-static/range {v17 .. v18}, Lorg/mozilla/javascript/NativeGlobal;->unHex(CC)I

    move-result v3

    .line 668
    if-ltz v3, :cond_d

    and-int/lit16 v0, v3, 0xc0

    move/from16 v17, v0

    const/16 v18, 0x80

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_e

    .line 669
    :cond_d
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 670
    :cond_e
    shl-int/lit8 v17, v14, 0x6

    and-int/lit8 v18, v3, 0x3f

    or-int v14, v17, v18

    .line 671
    add-int/lit8 v10, v10, 0x3

    .line 664
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 674
    :cond_f
    if-lt v14, v12, :cond_10

    const v17, 0xd800

    move/from16 v0, v17

    if-lt v14, v0, :cond_12

    const v17, 0xdfff

    move/from16 v0, v17

    if-gt v14, v0, :cond_12

    .line 676
    :cond_10
    const v14, 0x7fffffff

    .line 680
    :cond_11
    :goto_7
    const/high16 v17, 0x10000

    move/from16 v0, v17

    if-lt v14, v0, :cond_15

    .line 681
    const/high16 v17, 0x10000

    sub-int v14, v14, v17

    .line 682
    const v17, 0xfffff

    move/from16 v0, v17

    if-le v14, v0, :cond_14

    .line 683
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v17

    throw v17

    .line 677
    :cond_12
    const v17, 0xfffe

    move/from16 v0, v17

    if-eq v14, v0, :cond_13

    const v17, 0xffff

    move/from16 v0, v17

    if-ne v14, v0, :cond_11

    .line 678
    :cond_13
    const v14, 0xfffd

    goto :goto_7

    .line 685
    :cond_14
    ushr-int/lit8 v17, v14, 0xa

    const v18, 0xd800

    add-int v17, v17, v18

    move/from16 v0, v17

    int-to-char v5, v0

    .line 686
    .local v5, "H":C
    and-int/lit16 v0, v14, 0x3ff

    move/from16 v17, v0

    const v18, 0xdc00

    add-int v17, v17, v18

    move/from16 v0, v17

    int-to-char v4, v0

    .line 687
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    aput-char v5, v6, v8

    move v8, v7

    .line 688
    .end local v7    # "bufTop":I
    .restart local v8    # "bufTop":I
    goto/16 :goto_3

    .line 689
    .end local v5    # "H":C
    :cond_15
    int-to-char v4, v14

    goto/16 :goto_3

    .end local v9    # "j":I
    .end local v12    # "minUcs4Char":I
    .end local v14    # "ucs4Char":I
    .end local v15    # "utf8Tail":I
    .restart local v16    # "x":I
    :cond_16
    move v7, v8

    .line 693
    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    goto/16 :goto_2

    .line 697
    .end local v7    # "bufTop":I
    .end local v16    # "x":I
    .restart local v8    # "bufTop":I
    :cond_17
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    aput-char v4, v6, v8

    goto/16 :goto_2

    .line 701
    .end local v3    # "B":I
    .end local v4    # "C":C
    .end local v7    # "bufTop":I
    .end local v13    # "start":I
    .restart local v8    # "bufTop":I
    :cond_18
    if-nez v6, :cond_19

    .end local p0    # "str":Ljava/lang/String;
    :goto_8
    return-object p0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_19
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v6, v1, v8}, Ljava/lang/String;-><init>([CII)V

    goto :goto_8

    .restart local v4    # "C":C
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1a
    move v7, v8

    .end local v8    # "bufTop":I
    .restart local v7    # "bufTop":I
    goto/16 :goto_1
.end method

.method private static encode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 12
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "fullUri"    # Z

    .prologue
    .line 538
    const/4 v9, 0x0

    .line 539
    .local v9, "utf8buf":[B
    const/4 v8, 0x0

    .line 541
    .local v8, "sb":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .local v6, "k":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    .local v7, "length":I
    :goto_0
    if-eq v6, v7, :cond_9

    .line 542
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 543
    .local v0, "C":C
    invoke-static {v0, p1}, Lorg/mozilla/javascript/NativeGlobal;->encodeUnescaped(CZ)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 544
    if-eqz v8, :cond_0

    .line 545
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 541
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 548
    :cond_1
    if-nez v8, :cond_2

    .line 549
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "sb":Ljava/lang/StringBuilder;
    add-int/lit8 v10, v7, 0x3

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 550
    .restart local v8    # "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 552
    const/4 v10, 0x6

    new-array v9, v10, [B

    .line 554
    :cond_2
    const v10, 0xdc00

    if-gt v10, v0, :cond_3

    const v10, 0xdfff

    if-gt v0, v10, :cond_3

    .line 555
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v10

    throw v10

    .line 558
    :cond_3
    const v10, 0xd800

    if-lt v0, v10, :cond_4

    const v10, 0xdbff

    if-ge v10, v0, :cond_5

    .line 559
    :cond_4
    move v3, v0

    .line 571
    .local v3, "V":I
    :goto_1
    invoke-static {v9, v3}, Lorg/mozilla/javascript/NativeGlobal;->oneUcs4ToUtf8Char([BI)I

    move-result v2

    .line 572
    .local v2, "L":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    if-ge v5, v2, :cond_0

    .line 573
    aget-byte v10, v9, v5

    and-int/lit16 v4, v10, 0xff

    .line 574
    .local v4, "d":I
    const/16 v10, 0x25

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 575
    ushr-int/lit8 v10, v4, 0x4

    invoke-static {v10}, Lorg/mozilla/javascript/NativeGlobal;->toHexChar(I)C

    move-result v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 576
    and-int/lit8 v10, v4, 0xf

    invoke-static {v10}, Lorg/mozilla/javascript/NativeGlobal;->toHexChar(I)C

    move-result v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 572
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 561
    .end local v2    # "L":I
    .end local v3    # "V":I
    .end local v4    # "d":I
    .end local v5    # "j":I
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 562
    if-ne v6, v7, :cond_6

    .line 563
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v10

    throw v10

    .line 565
    :cond_6
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 566
    .local v1, "C2":C
    const v10, 0xdc00

    if-gt v10, v1, :cond_7

    const v10, 0xdfff

    if-le v1, v10, :cond_8

    .line 567
    :cond_7
    invoke-static {}, Lorg/mozilla/javascript/NativeGlobal;->uriError()Lorg/mozilla/javascript/EcmaError;

    move-result-object v10

    throw v10

    .line 569
    :cond_8
    const v10, 0xd800

    sub-int v10, v0, v10

    shl-int/lit8 v10, v10, 0xa

    const v11, 0xdc00

    sub-int v11, v1, v11

    add-int/2addr v10, v11

    const/high16 v11, 0x10000

    add-int v3, v10, v11

    .restart local v3    # "V":I
    goto :goto_1

    .line 580
    .end local v0    # "C":C
    .end local v1    # "C2":C
    .end local v3    # "V":I
    :cond_9
    if-nez v8, :cond_a

    .end local p0    # "str":Ljava/lang/String;
    :goto_3
    return-object p0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_a
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method private static encodeUnescaped(CZ)Z
    .locals 3
    .param p0, "c"    # C
    .param p1, "fullUri"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 705
    const/16 v2, 0x41

    if-gt v2, p0, :cond_0

    const/16 v2, 0x5a

    if-le p0, v2, :cond_2

    :cond_0
    const/16 v2, 0x61

    if-gt v2, p0, :cond_1

    const/16 v2, 0x7a

    if-le p0, v2, :cond_2

    :cond_1
    const/16 v2, 0x30

    if-gt v2, p0, :cond_3

    const/16 v2, 0x39

    if-gt p0, v2, :cond_3

    .line 715
    :cond_2
    :goto_0
    return v0

    .line 709
    :cond_3
    const-string v2, "-_.!~*\'()"

    invoke-virtual {v2, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_2

    .line 712
    if-eqz p1, :cond_4

    .line 713
    const-string v2, ";/?:@&=+$,#"

    invoke-virtual {v2, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_4
    move v0, v1

    .line 715
    goto :goto_0
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 20
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    .line 30
    new-instance v3, Lorg/mozilla/javascript/NativeGlobal;

    invoke-direct {v3}, Lorg/mozilla/javascript/NativeGlobal;-><init>()V

    .line 32
    .local v3, "obj":Lorg/mozilla/javascript/NativeGlobal;
    const/4 v5, 0x1

    .local v5, "id":I
    :goto_0
    const/16 v4, 0xd

    if-gt v5, v4, :cond_1

    .line 34
    const/4 v7, 0x1

    .line 35
    .local v7, "arity":I
    packed-switch v5, :pswitch_data_0

    .line 77
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 37
    :pswitch_0
    const-string v6, "decodeURI"

    .line 79
    .local v6, "name":Ljava/lang/String;
    :goto_1
    new-instance v2, Lorg/mozilla/javascript/IdFunctionObject;

    sget-object v4, Lorg/mozilla/javascript/NativeGlobal;->FTAG:Ljava/lang/Object;

    move-object/from16 v8, p1

    invoke-direct/range {v2 .. v8}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)V

    .line 81
    .local v2, "f":Lorg/mozilla/javascript/IdFunctionObject;
    if-eqz p2, :cond_0

    .line 82
    invoke-virtual {v2}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 84
    :cond_0
    invoke-virtual {v2}, Lorg/mozilla/javascript/IdFunctionObject;->exportAsScopeProperty()V

    .line 32
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 40
    .end local v2    # "f":Lorg/mozilla/javascript/IdFunctionObject;
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_1
    const-string v6, "decodeURIComponent"

    .line 41
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 43
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_2
    const-string v6, "encodeURI"

    .line 44
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 46
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_3
    const-string v6, "encodeURIComponent"

    .line 47
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 49
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_4
    const-string v6, "escape"

    .line 50
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 52
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_5
    const-string v6, "eval"

    .line 53
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 55
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_6
    const-string v6, "isFinite"

    .line 56
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 58
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_7
    const-string v6, "isNaN"

    .line 59
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 61
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_8
    const-string v6, "isXMLName"

    .line 62
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 64
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_9
    const-string v6, "parseFloat"

    .line 65
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 67
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_a
    const-string v6, "parseInt"

    .line 68
    .restart local v6    # "name":Ljava/lang/String;
    const/4 v7, 0x2

    .line 69
    goto :goto_1

    .line 71
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_b
    const-string v6, "unescape"

    .line 72
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 74
    .end local v6    # "name":Ljava/lang/String;
    :pswitch_c
    const-string v6, "uneval"

    .line 75
    .restart local v6    # "name":Ljava/lang/String;
    goto :goto_1

    .line 87
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "arity":I
    :cond_1
    const-string v4, "NaN"

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    const/4 v10, 0x7

    move-object/from16 v0, p1

    invoke-static {v0, v4, v9, v10}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 90
    const-string v4, "Infinity"

    const-wide/high16 v10, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v10, v11}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v9

    const/4 v10, 0x7

    move-object/from16 v0, p1

    invoke-static {v0, v4, v9, v10}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 94
    const-string v4, "undefined"

    sget-object v9, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    const/4 v10, 0x7

    move-object/from16 v0, p1

    invoke-static {v0, v4, v9, v10}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 102
    invoke-static {}, Lorg/mozilla/javascript/TopLevel$NativeErrors;->values()[Lorg/mozilla/javascript/TopLevel$NativeErrors;

    move-result-object v15

    .local v15, "arr$":[Lorg/mozilla/javascript/TopLevel$NativeErrors;
    array-length v0, v15

    move/from16 v19, v0

    .local v19, "len$":I
    const/16 v18, 0x0

    .local v18, "i$":I
    :goto_2
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_4

    aget-object v16, v15, v18

    .line 103
    .local v16, "error":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    sget-object v4, Lorg/mozilla/javascript/TopLevel$NativeErrors;->Error:Lorg/mozilla/javascript/TopLevel$NativeErrors;

    move-object/from16 v0, v16

    if-ne v0, v4, :cond_2

    .line 102
    :goto_3
    add-int/lit8 v18, v18, 0x1

    goto :goto_2

    .line 107
    :cond_2
    invoke-virtual/range {v16 .. v16}, Lorg/mozilla/javascript/TopLevel$NativeErrors;->name()Ljava/lang/String;

    move-result-object v6

    .line 108
    .restart local v6    # "name":Ljava/lang/String;
    sget-object v4, Lorg/mozilla/javascript/TopLevel$Builtins;->Error:Lorg/mozilla/javascript/TopLevel$Builtins;

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4, v9}, Lorg/mozilla/javascript/ScriptRuntime;->newBuiltinObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v17

    check-cast v17, Lorg/mozilla/javascript/ScriptableObject;

    .line 112
    .local v17, "errorProto":Lorg/mozilla/javascript/ScriptableObject;
    const-string v4, "name"

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-virtual {v0, v4, v1, v6}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 113
    const-string v4, "message"

    const-string v9, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-virtual {v0, v4, v1, v9}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 114
    new-instance v8, Lorg/mozilla/javascript/IdFunctionObject;

    sget-object v10, Lorg/mozilla/javascript/NativeGlobal;->FTAG:Ljava/lang/Object;

    const/16 v11, 0xe

    const/4 v13, 0x1

    move-object v9, v3

    move-object v12, v6

    move-object/from16 v14, p1

    invoke-direct/range {v8 .. v14}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)V

    .line 117
    .local v8, "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lorg/mozilla/javascript/IdFunctionObject;->markAsConstructor(Lorg/mozilla/javascript/Scriptable;)V

    .line 118
    const-string v4, "constructor"

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-virtual {v0, v4, v1, v8}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 119
    const-string v4, "constructor"

    const/4 v9, 0x2

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v9}, Lorg/mozilla/javascript/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 120
    if-eqz p2, :cond_3

    .line 121
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptableObject;->sealObject()V

    .line 122
    invoke-virtual {v8}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 124
    :cond_3
    invoke-virtual {v8}, Lorg/mozilla/javascript/IdFunctionObject;->exportAsScopeProperty()V

    goto :goto_3

    .line 126
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    .end local v16    # "error":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    .end local v17    # "errorProto":Lorg/mozilla/javascript/ScriptableObject;
    :cond_4
    return-void

    .line 35
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
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method static isEvalFunction(Ljava/lang/Object;)Z
    .locals 3
    .param p0, "functionObj"    # Ljava/lang/Object;

    .prologue
    .line 488
    instance-of v1, p0, Lorg/mozilla/javascript/IdFunctionObject;

    if-eqz v1, :cond_0

    move-object v0, p0

    .line 489
    check-cast v0, Lorg/mozilla/javascript/IdFunctionObject;

    .line 490
    .local v0, "function":Lorg/mozilla/javascript/IdFunctionObject;
    sget-object v1, Lorg/mozilla/javascript/NativeGlobal;->FTAG:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    .line 491
    const/4 v1, 0x1

    .line 494
    .end local v0    # "function":Lorg/mozilla/javascript/IdFunctionObject;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private js_escape([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 372
    const/4 v4, 0x1

    .line 373
    .local v4, "URL_XALPHAS":I
    const/4 v5, 0x2

    .line 374
    .local v5, "URL_XPALPHAS":I
    const/4 v3, 0x4

    .line 376
    .local v3, "URL_PATH":I
    const/16 v17, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v14

    .line 378
    .local v14, "s":Ljava/lang/String;
    const/4 v13, 0x7

    .line 379
    .local v13, "mask":I
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_1

    .line 380
    const/16 v17, 0x1

    aget-object v17, p1, v17

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v8

    .line 381
    .local v8, "d":D
    cmpl-double v17, v8, v8

    if-nez v17, :cond_0

    double-to-int v13, v8

    int-to-double v0, v13

    move-wide/from16 v18, v0

    cmpl-double v17, v18, v8

    if-nez v17, :cond_0

    and-int/lit8 v17, v13, -0x8

    if-eqz v17, :cond_1

    .line 384
    :cond_0
    const-string v17, "msg.bad.esc.mask"

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v17

    throw v17

    .line 388
    .end local v8    # "d":D
    :cond_1
    const/4 v15, 0x0

    .line 389
    .local v15, "sb":Ljava/lang/StringBuilder;
    const/4 v12, 0x0

    .local v12, "k":I
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "L":I
    :goto_0
    if-eq v12, v2, :cond_c

    .line 390
    invoke-virtual {v14, v12}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 391
    .local v6, "c":I
    if-eqz v13, :cond_7

    const/16 v17, 0x30

    move/from16 v0, v17

    if-lt v6, v0, :cond_2

    const/16 v17, 0x39

    move/from16 v0, v17

    if-le v6, v0, :cond_5

    :cond_2
    const/16 v17, 0x41

    move/from16 v0, v17

    if-lt v6, v0, :cond_3

    const/16 v17, 0x5a

    move/from16 v0, v17

    if-le v6, v0, :cond_5

    :cond_3
    const/16 v17, 0x61

    move/from16 v0, v17

    if-lt v6, v0, :cond_4

    const/16 v17, 0x7a

    move/from16 v0, v17

    if-le v6, v0, :cond_5

    :cond_4
    const/16 v17, 0x40

    move/from16 v0, v17

    if-eq v6, v0, :cond_5

    const/16 v17, 0x2a

    move/from16 v0, v17

    if-eq v6, v0, :cond_5

    const/16 v17, 0x5f

    move/from16 v0, v17

    if-eq v6, v0, :cond_5

    const/16 v17, 0x2d

    move/from16 v0, v17

    if-eq v6, v0, :cond_5

    const/16 v17, 0x2e

    move/from16 v0, v17

    if-eq v6, v0, :cond_5

    and-int/lit8 v17, v13, 0x4

    if-eqz v17, :cond_7

    const/16 v17, 0x2f

    move/from16 v0, v17

    if-eq v6, v0, :cond_5

    const/16 v17, 0x2b

    move/from16 v0, v17

    if-ne v6, v0, :cond_7

    .line 397
    :cond_5
    if-eqz v15, :cond_6

    .line 398
    int-to-char v0, v6

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 389
    :cond_6
    :goto_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 401
    :cond_7
    if-nez v15, :cond_8

    .line 402
    new-instance v15, Ljava/lang/StringBuilder;

    .end local v15    # "sb":Ljava/lang/StringBuilder;
    add-int/lit8 v17, v2, 0x3

    move/from16 v0, v17

    invoke-direct {v15, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 403
    .restart local v15    # "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 408
    :cond_8
    const/16 v17, 0x100

    move/from16 v0, v17

    if-ge v6, v0, :cond_a

    .line 409
    const/16 v17, 0x20

    move/from16 v0, v17

    if-ne v6, v0, :cond_9

    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v13, v0, :cond_9

    .line 410
    const/16 v17, 0x2b

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 413
    :cond_9
    const/16 v17, 0x25

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 414
    const/4 v11, 0x2

    .line 422
    .local v11, "hexSize":I
    :goto_2
    add-int/lit8 v17, v11, -0x1

    mul-int/lit8 v16, v17, 0x4

    .local v16, "shift":I
    :goto_3
    if-ltz v16, :cond_6

    .line 423
    shr-int v17, v6, v16

    and-int/lit8 v7, v17, 0xf

    .line 424
    .local v7, "digit":I
    const/16 v17, 0xa

    move/from16 v0, v17

    if-ge v7, v0, :cond_b

    add-int/lit8 v10, v7, 0x30

    .line 425
    .local v10, "hc":I
    :goto_4
    int-to-char v0, v10

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 422
    add-int/lit8 v16, v16, -0x4

    goto :goto_3

    .line 416
    .end local v7    # "digit":I
    .end local v10    # "hc":I
    .end local v11    # "hexSize":I
    .end local v16    # "shift":I
    :cond_a
    const/16 v17, 0x25

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 417
    const/16 v17, 0x75

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 418
    const/4 v11, 0x4

    .restart local v11    # "hexSize":I
    goto :goto_2

    .line 424
    .restart local v7    # "digit":I
    .restart local v16    # "shift":I
    :cond_b
    add-int/lit8 v10, v7, 0x37

    goto :goto_4

    .line 430
    .end local v6    # "c":I
    .end local v7    # "digit":I
    .end local v11    # "hexSize":I
    .end local v16    # "shift":I
    :cond_c
    if-nez v15, :cond_d

    .end local v14    # "s":Ljava/lang/String;
    :goto_5
    return-object v14

    .restart local v14    # "s":Ljava/lang/String;
    :cond_d
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    goto :goto_5
.end method

.method private js_eval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 482
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 483
    .local v1, "global":Lorg/mozilla/javascript/Scriptable;
    const-string v4, "eval code"

    const/4 v5, 0x1

    move-object v0, p1

    move-object v2, v1

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptRuntime;->evalSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p0, "args"    # [Ljava/lang/Object;

    .prologue
    .line 263
    array-length v11, p0

    const/4 v12, 0x1

    if-ge v11, v12, :cond_0

    .line 264
    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    .line 358
    :goto_0
    return-object v11

    .line 266
    :cond_0
    const/4 v11, 0x0

    aget-object v11, p0, v11

    invoke-static {v11}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 267
    .local v9, "s":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v8

    .line 268
    .local v8, "len":I
    const/4 v10, 0x0

    .line 272
    .local v10, "start":I
    :goto_1
    if-ne v10, v8, :cond_1

    .line 273
    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto :goto_0

    .line 275
    :cond_1
    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 276
    .local v0, "c":C
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v11

    if-nez v11, :cond_3

    .line 282
    move v7, v10

    .line 283
    .local v7, "i":I
    const/16 v11, 0x2b

    if-eq v0, v11, :cond_2

    const/16 v11, 0x2d

    if-ne v0, v11, :cond_5

    .line 284
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 285
    if-ne v7, v8, :cond_4

    .line 286
    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto :goto_0

    .line 279
    .end local v7    # "i":I
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 288
    .restart local v7    # "i":I
    :cond_4
    invoke-virtual {v9, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 291
    :cond_5
    const/16 v11, 0x49

    if-ne v0, v11, :cond_8

    .line 293
    add-int/lit8 v11, v7, 0x8

    if-gt v11, v8, :cond_7

    const-string v11, "Infinity"

    const/4 v12, 0x0

    const/16 v13, 0x8

    invoke-virtual {v9, v7, v11, v12, v13}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 295
    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2d

    if-ne v11, v12, :cond_6

    .line 296
    const-wide/high16 v2, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 300
    .local v2, "d":D
    :goto_2
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v11

    goto :goto_0

    .line 298
    .end local v2    # "d":D
    :cond_6
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .restart local v2    # "d":D
    goto :goto_2

    .line 302
    .end local v2    # "d":D
    :cond_7
    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto :goto_0

    .line 306
    :cond_8
    const/4 v1, -0x1

    .line 307
    .local v1, "decimal":I
    const/4 v5, -0x1

    .line 308
    .local v5, "exponent":I
    const/4 v6, 0x0

    .line 309
    .local v6, "exponentValid":Z
    :goto_3
    if-ge v7, v8, :cond_9

    .line 310
    invoke-virtual {v9, v7}, Ljava/lang/String;->charAt(I)C

    move-result v11

    sparse-switch v11, :sswitch_data_0

    .line 350
    :cond_9
    :goto_4
    const/4 v11, -0x1

    if-eq v5, v11, :cond_a

    if-nez v6, :cond_a

    .line 351
    move v7, v5

    .line 353
    :cond_a
    invoke-virtual {v9, v10, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 355
    :try_start_0
    invoke-static {v9}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    goto :goto_0

    .line 312
    :sswitch_0
    const/4 v11, -0x1

    if-ne v1, v11, :cond_9

    .line 314
    move v1, v7

    .line 309
    :cond_b
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 319
    :sswitch_1
    const/4 v11, -0x1

    if-ne v5, v11, :cond_9

    .line 321
    add-int/lit8 v11, v8, -0x1

    if-eq v7, v11, :cond_9

    .line 324
    move v5, v7

    .line 325
    goto :goto_5

    .line 330
    :sswitch_2
    add-int/lit8 v11, v7, -0x1

    if-ne v5, v11, :cond_9

    .line 332
    add-int/lit8 v11, v8, -0x1

    if-ne v7, v11, :cond_b

    .line 333
    add-int/lit8 v7, v7, -0x1

    .line 334
    goto :goto_4

    .line 340
    :sswitch_3
    const/4 v11, -0x1

    if-eq v5, v11, :cond_b

    .line 341
    const/4 v6, 0x1

    goto :goto_5

    .line 357
    :catch_0
    move-exception v4

    .line 358
    .local v4, "ex":Ljava/lang/NumberFormatException;
    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto/16 :goto_0

    .line 310
    nop

    :sswitch_data_0
    .sparse-switch
        0x2b -> :sswitch_2
        0x2d -> :sswitch_2
        0x2e -> :sswitch_0
        0x30 -> :sswitch_3
        0x31 -> :sswitch_3
        0x32 -> :sswitch_3
        0x33 -> :sswitch_3
        0x34 -> :sswitch_3
        0x35 -> :sswitch_3
        0x36 -> :sswitch_3
        0x37 -> :sswitch_3
        0x38 -> :sswitch_3
        0x39 -> :sswitch_3
        0x45 -> :sswitch_1
        0x65 -> :sswitch_1
    .end sparse-switch
.end method

.method static js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 15
    .param p0, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v14, 0x78

    const/16 v13, 0x58

    const/4 v10, 0x0

    const/16 v12, 0x30

    const/4 v9, 0x1

    .line 207
    invoke-static {p0, v10}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v7

    .line 208
    .local v7, "s":Ljava/lang/String;
    invoke-static {p0, v9}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v6

    .line 210
    .local v6, "radix":I
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    .line 211
    .local v4, "len":I
    if-nez v4, :cond_0

    .line 212
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    .line 253
    :goto_0
    return-object v9

    .line 214
    :cond_0
    const/4 v5, 0x0

    .line 215
    .local v5, "negative":Z
    const/4 v8, 0x0

    .line 218
    .local v8, "start":I
    :cond_1
    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 219
    .local v1, "c":C
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v11

    if-nez v11, :cond_8

    .line 224
    :goto_1
    const/16 v11, 0x2b

    if-eq v1, v11, :cond_2

    const/16 v11, 0x2d

    if-ne v1, v11, :cond_9

    move v5, v9

    :goto_2
    if-eqz v5, :cond_3

    .line 225
    :cond_2
    add-int/lit8 v8, v8, 0x1

    .line 227
    :cond_3
    const/4 v0, -0x1

    .line 228
    .local v0, "NO_RADIX":I
    if-nez v6, :cond_a

    .line 229
    const/4 v6, -0x1

    .line 238
    :cond_4
    :goto_3
    const/4 v10, -0x1

    if-ne v6, v10, :cond_6

    .line 239
    const/16 v6, 0xa

    .line 240
    sub-int v10, v4, v8

    if-le v10, v9, :cond_6

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v12, :cond_6

    .line 241
    add-int/lit8 v9, v8, 0x1

    invoke-virtual {v7, v9}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 242
    if-eq v1, v14, :cond_5

    if-ne v1, v13, :cond_e

    .line 243
    :cond_5
    const/16 v6, 0x10

    .line 244
    add-int/lit8 v8, v8, 0x2

    .line 252
    :cond_6
    :goto_4
    invoke-static {v7, v8, v6}, Lorg/mozilla/javascript/ScriptRuntime;->stringToNumber(Ljava/lang/String;II)D

    move-result-wide v2

    .line 253
    .local v2, "d":D
    if-eqz v5, :cond_7

    neg-double v2, v2

    .end local v2    # "d":D
    :cond_7
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v9

    goto :goto_0

    .line 221
    .end local v0    # "NO_RADIX":I
    :cond_8
    add-int/lit8 v8, v8, 0x1

    .line 222
    if-lt v8, v4, :cond_1

    goto :goto_1

    :cond_9
    move v5, v10

    .line 224
    goto :goto_2

    .line 230
    .restart local v0    # "NO_RADIX":I
    :cond_a
    const/4 v10, 0x2

    if-lt v6, v10, :cond_b

    const/16 v10, 0x24

    if-le v6, v10, :cond_c

    .line 231
    :cond_b
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto :goto_0

    .line 232
    :cond_c
    const/16 v10, 0x10

    if-ne v6, v10, :cond_4

    sub-int v10, v4, v8

    if-le v10, v9, :cond_4

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v10, v12, :cond_4

    .line 233
    add-int/lit8 v10, v8, 0x1

    invoke-virtual {v7, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 234
    if-eq v1, v14, :cond_d

    if-ne v1, v13, :cond_4

    .line 235
    :cond_d
    add-int/lit8 v8, v8, 0x2

    goto :goto_3

    .line 245
    :cond_e
    if-gt v12, v1, :cond_6

    const/16 v9, 0x39

    if-gt v1, v9, :cond_6

    .line 246
    const/16 v6, 0x8

    .line 247
    add-int/lit8 v8, v8, 0x1

    goto :goto_4
.end method

.method private js_unescape([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 439
    const/4 v11, 0x0

    invoke-static {p1, v11}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v8

    .line 440
    .local v8, "s":Ljava/lang/String;
    const/16 v11, 0x25

    invoke-virtual {v8, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 441
    .local v5, "firstEscapePos":I
    if-ltz v5, :cond_4

    .line 442
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    .line 443
    .local v0, "L":I
    invoke-virtual {v8}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 444
    .local v1, "buf":[C
    move v3, v5

    .line 445
    .local v3, "destination":I
    move v7, v5

    .local v7, "k":I
    :goto_0
    if-eq v7, v0, :cond_3

    .line 446
    aget-char v2, v1, v7

    .line 447
    .local v2, "c":C
    add-int/lit8 v7, v7, 0x1

    .line 448
    const/16 v11, 0x25

    if-ne v2, v11, :cond_2

    if-eq v7, v0, :cond_2

    .line 450
    aget-char v11, v1, v7

    const/16 v12, 0x75

    if-ne v11, v12, :cond_0

    .line 451
    add-int/lit8 v9, v7, 0x1

    .line 452
    .local v9, "start":I
    add-int/lit8 v4, v7, 0x5

    .line 457
    .local v4, "end":I
    :goto_1
    if-gt v4, v0, :cond_2

    .line 458
    const/4 v10, 0x0

    .line 459
    .local v10, "x":I
    move v6, v9

    .local v6, "i":I
    :goto_2
    if-eq v6, v4, :cond_1

    .line 460
    aget-char v11, v1, v6

    invoke-static {v11, v10}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v10

    .line 459
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 454
    .end local v4    # "end":I
    .end local v6    # "i":I
    .end local v9    # "start":I
    .end local v10    # "x":I
    :cond_0
    move v9, v7

    .line 455
    .restart local v9    # "start":I
    add-int/lit8 v4, v7, 0x2

    .restart local v4    # "end":I
    goto :goto_1

    .line 462
    .restart local v6    # "i":I
    .restart local v10    # "x":I
    :cond_1
    if-ltz v10, :cond_2

    .line 463
    int-to-char v2, v10

    .line 464
    move v7, v4

    .line 468
    .end local v4    # "end":I
    .end local v6    # "i":I
    .end local v9    # "start":I
    .end local v10    # "x":I
    :cond_2
    aput-char v2, v1, v3

    .line 469
    add-int/lit8 v3, v3, 0x1

    .line 470
    goto :goto_0

    .line 471
    .end local v2    # "c":C
    :cond_3
    new-instance v8, Ljava/lang/String;

    .end local v8    # "s":Ljava/lang/String;
    const/4 v11, 0x0

    invoke-direct {v8, v1, v11, v3}, Ljava/lang/String;-><init>([CII)V

    .line 473
    .end local v0    # "L":I
    .end local v1    # "buf":[C
    .end local v3    # "destination":I
    .end local v7    # "k":I
    .restart local v8    # "s":Ljava/lang/String;
    :cond_4
    return-object v8
.end method

.method private static oneUcs4ToUtf8Char([BI)I
    .locals 6
    .param p0, "utf8Buffer"    # [B
    .param p1, "ucs4Char"    # I

    .prologue
    const/4 v5, 0x0

    .line 730
    const/4 v2, 0x1

    .line 733
    .local v2, "utf8Length":I
    and-int/lit8 v3, p1, -0x80

    if-nez v3, :cond_0

    .line 734
    int-to-byte v3, p1

    aput-byte v3, p0, v5

    .line 750
    :goto_0
    return v2

    .line 737
    :cond_0
    ushr-int/lit8 v0, p1, 0xb

    .line 738
    .local v0, "a":I
    const/4 v2, 0x2

    .line 739
    :goto_1
    if-eqz v0, :cond_1

    .line 740
    ushr-int/lit8 v0, v0, 0x5

    .line 741
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 743
    :cond_1
    move v1, v2

    .line 744
    .local v1, "i":I
    :goto_2
    add-int/lit8 v1, v1, -0x1

    if-lez v1, :cond_2

    .line 745
    and-int/lit8 v3, p1, 0x3f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, p0, v1

    .line 746
    ushr-int/lit8 p1, p1, 0x6

    goto :goto_2

    .line 748
    :cond_2
    const/4 v3, 0x1

    rsub-int/lit8 v4, v2, 0x8

    shl-int/2addr v3, v4

    rsub-int v3, v3, 0x100

    add-int/2addr v3, p1

    int-to-byte v3, v3

    aput-byte v3, p0, v5

    goto :goto_0
.end method

.method private static toHexChar(I)C
    .locals 1
    .param p0, "i"    # I

    .prologue
    .line 584
    shr-int/lit8 v0, p0, 0x4

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 585
    :cond_0
    const/16 v0, 0xa

    if-ge p0, v0, :cond_1

    add-int/lit8 v0, p0, 0x30

    :goto_0
    int-to-char v0, v0

    return v0

    :cond_1
    add-int/lit8 v0, p0, -0xa

    add-int/lit8 v0, v0, 0x41

    goto :goto_0
.end method

.method private static unHex(C)I
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 589
    const/16 v0, 0x41

    if-gt v0, p0, :cond_0

    const/16 v0, 0x46

    if-gt p0, v0, :cond_0

    .line 590
    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    .line 596
    :goto_0
    return v0

    .line 591
    :cond_0
    const/16 v0, 0x61

    if-gt v0, p0, :cond_1

    const/16 v0, 0x66

    if-gt p0, v0, :cond_1

    .line 592
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 593
    :cond_1
    const/16 v0, 0x30

    if-gt v0, p0, :cond_2

    const/16 v0, 0x39

    if-gt p0, v0, :cond_2

    .line 594
    add-int/lit8 v0, p0, -0x30

    goto :goto_0

    .line 596
    :cond_2
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private static unHex(CC)I
    .locals 3
    .param p0, "c1"    # C
    .param p1, "c2"    # C

    .prologue
    .line 601
    invoke-static {p0}, Lorg/mozilla/javascript/NativeGlobal;->unHex(C)I

    move-result v0

    .line 602
    .local v0, "i1":I
    invoke-static {p1}, Lorg/mozilla/javascript/NativeGlobal;->unHex(C)I

    move-result v1

    .line 603
    .local v1, "i2":I
    if-ltz v0, :cond_0

    if-ltz v1, :cond_0

    .line 604
    shl-int/lit8 v2, v0, 0x4

    or-int/2addr v2, v1

    .line 606
    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private static uriError()Lorg/mozilla/javascript/EcmaError;
    .locals 2

    .prologue
    .line 719
    const-string v0, "URIError"

    const-string v1, "msg.bad.uri"

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
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
    .line 131
    sget-object v8, Lorg/mozilla/javascript/NativeGlobal;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v8}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 132
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v2

    .line 133
    .local v2, "methodId":I
    packed-switch v2, :pswitch_data_0

    .line 200
    .end local v2    # "methodId":I
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 136
    .restart local v2    # "methodId":I
    :pswitch_0
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v5

    .line 137
    .local v5, "str":Ljava/lang/String;
    const/4 v8, 0x1

    if-ne v2, v8, :cond_1

    const/4 v8, 0x1

    :goto_0
    invoke-static {v5, v8}, Lorg/mozilla/javascript/NativeGlobal;->decode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 197
    .end local v5    # "str":Ljava/lang/String;
    :goto_1
    return-object v8

    .line 137
    .restart local v5    # "str":Ljava/lang/String;
    :cond_1
    const/4 v8, 0x0

    goto :goto_0

    .line 142
    .end local v5    # "str":Ljava/lang/String;
    :pswitch_1
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v5

    .line 143
    .restart local v5    # "str":Ljava/lang/String;
    const/4 v8, 0x3

    if-ne v2, v8, :cond_2

    const/4 v8, 0x1

    :goto_2
    invoke-static {v5, v8}, Lorg/mozilla/javascript/NativeGlobal;->encode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_2
    const/4 v8, 0x0

    goto :goto_2

    .line 147
    .end local v5    # "str":Ljava/lang/String;
    :pswitch_2
    invoke-direct {p0, p5}, Lorg/mozilla/javascript/NativeGlobal;->js_escape([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    .line 150
    :pswitch_3
    invoke-direct {p0, p2, p3, p5}, Lorg/mozilla/javascript/NativeGlobal;->js_eval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    .line 153
    :pswitch_4
    array-length v8, p5

    const/4 v9, 0x1

    if-ge v8, v9, :cond_3

    .line 154
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1

    .line 156
    :cond_3
    const/4 v8, 0x0

    aget-object v8, p5, v8

    invoke-static {v8}, Lorg/mozilla/javascript/NativeNumber;->isFinite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    .line 162
    :pswitch_5
    array-length v8, p5

    const/4 v9, 0x1

    if-ge v8, v9, :cond_4

    .line 163
    const/4 v4, 0x1

    .line 168
    .local v4, "result":Z
    :goto_3
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v8

    goto :goto_1

    .line 165
    .end local v4    # "result":Z
    :cond_4
    const/4 v8, 0x0

    aget-object v8, p5, v8

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 166
    .local v0, "d":D
    cmpl-double v8, v0, v0

    if-eqz v8, :cond_5

    const/4 v4, 0x1

    .restart local v4    # "result":Z
    :goto_4
    goto :goto_3

    .end local v4    # "result":Z
    :cond_5
    const/4 v4, 0x0

    goto :goto_4

    .line 172
    .end local v0    # "d":D
    :pswitch_6
    array-length v8, p5

    if-nez v8, :cond_6

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 174
    .local v3, "name":Ljava/lang/Object;
    :goto_5
    invoke-static {p3}, Lorg/mozilla/javascript/xml/XMLLib;->extractFromScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v7

    .line 175
    .local v7, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    invoke-virtual {v7, p2, v3}, Lorg/mozilla/javascript/xml/XMLLib;->isXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v8

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v8

    goto :goto_1

    .line 172
    .end local v3    # "name":Ljava/lang/Object;
    .end local v7    # "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    :cond_6
    const/4 v8, 0x0

    aget-object v3, p5, v8

    goto :goto_5

    .line 180
    :pswitch_7
    invoke-static {p5}, Lorg/mozilla/javascript/NativeGlobal;->js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    .line 183
    :pswitch_8
    invoke-static {p5}, Lorg/mozilla/javascript/NativeGlobal;->js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    .line 186
    :pswitch_9
    invoke-direct {p0, p5}, Lorg/mozilla/javascript/NativeGlobal;->js_unescape([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    .line 189
    :pswitch_a
    array-length v8, p5

    if-eqz v8, :cond_7

    const/4 v8, 0x0

    aget-object v6, p5, v8

    .line 191
    .local v6, "value":Ljava/lang/Object;
    :goto_6
    invoke-static {p2, p3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->uneval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 189
    .end local v6    # "value":Ljava/lang/Object;
    :cond_7
    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_6

    .line 197
    :pswitch_b
    invoke-static {p2, p3, p1, p5}, Lorg/mozilla/javascript/NativeError;->make(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;[Ljava/lang/Object;)Lorg/mozilla/javascript/NativeError;

    move-result-object v8

    goto :goto_1

    .line 133
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method
