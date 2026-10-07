.class final Lorg/mozilla/javascript/NativeString;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeString.java"


# static fields
.field private static final ConstructorId_charAt:I = -0x5

.field private static final ConstructorId_charCodeAt:I = -0x6

.field private static final ConstructorId_concat:I = -0xe

.field private static final ConstructorId_equalsIgnoreCase:I = -0x1e

.field private static final ConstructorId_fromCharCode:I = -0x1

.field private static final ConstructorId_indexOf:I = -0x7

.field private static final ConstructorId_lastIndexOf:I = -0x8

.field private static final ConstructorId_localeCompare:I = -0x22

.field private static final ConstructorId_match:I = -0x1f

.field private static final ConstructorId_replace:I = -0x21

.field private static final ConstructorId_search:I = -0x20

.field private static final ConstructorId_slice:I = -0xf

.field private static final ConstructorId_split:I = -0x9

.field private static final ConstructorId_substr:I = -0xd

.field private static final ConstructorId_substring:I = -0xa

.field private static final ConstructorId_toLocaleLowerCase:I = -0x23

.field private static final ConstructorId_toLowerCase:I = -0xb

.field private static final ConstructorId_toUpperCase:I = -0xc

.field private static final Id_anchor:I = 0x1c

.field private static final Id_big:I = 0x15

.field private static final Id_blink:I = 0x16

.field private static final Id_bold:I = 0x10

.field private static final Id_charAt:I = 0x5

.field private static final Id_charCodeAt:I = 0x6

.field private static final Id_codePointAt:I = 0x2d

.field private static final Id_concat:I = 0xe

.field private static final Id_constructor:I = 0x1

.field private static final Id_endsWith:I = 0x2a

.field private static final Id_equals:I = 0x1d

.field private static final Id_equalsIgnoreCase:I = 0x1e

.field private static final Id_fixed:I = 0x12

.field private static final Id_fontcolor:I = 0x1a

.field private static final Id_fontsize:I = 0x19

.field private static final Id_includes:I = 0x28

.field private static final Id_indexOf:I = 0x7

.field private static final Id_italics:I = 0x11

.field private static final Id_lastIndexOf:I = 0x8

.field private static final Id_length:I = 0x1

.field private static final Id_link:I = 0x1b

.field private static final Id_localeCompare:I = 0x22

.field private static final Id_match:I = 0x1f

.field private static final Id_normalize:I = 0x2b

.field private static final Id_repeat:I = 0x2c

.field private static final Id_replace:I = 0x21

.field private static final Id_search:I = 0x20

.field private static final Id_slice:I = 0xf

.field private static final Id_small:I = 0x14

.field private static final Id_split:I = 0x9

.field private static final Id_startsWith:I = 0x29

.field private static final Id_strike:I = 0x13

.field private static final Id_sub:I = 0x18

.field private static final Id_substr:I = 0xd

.field private static final Id_substring:I = 0xa

.field private static final Id_sup:I = 0x17

.field private static final Id_toLocaleLowerCase:I = 0x23

.field private static final Id_toLocaleUpperCase:I = 0x24

.field private static final Id_toLowerCase:I = 0xb

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_toUpperCase:I = 0xc

.field private static final Id_trim:I = 0x25

.field private static final Id_trimLeft:I = 0x26

.field private static final Id_trimRight:I = 0x27

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x2d

.field private static final STRING_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = 0xcc57334977d230fL


# instance fields
.field private string:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "String"

    sput-object v0, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    .line 43
    return-void
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 37
    new-instance v0, Lorg/mozilla/javascript/NativeString;

    const-string v1, ""

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeString;-><init>(Ljava/lang/CharSequence;)V

    .line 38
    .local v0, "obj":Lorg/mozilla/javascript/NativeString;
    const/16 v1, 0x2d

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeString;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 39
    return-void
.end method

.method private static js_concat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 8
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 665
    array-length v0, p1

    .line 666
    .local v0, "N":I
    if-nez v0, :cond_0

    .line 687
    .end local p0    # "target":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 667
    .restart local p0    # "target":Ljava/lang/String;
    :cond_0
    const/4 v7, 0x1

    if-ne v0, v7, :cond_1

    .line 668
    const/4 v7, 0x0

    aget-object v7, p1, v7

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 669
    .local v1, "arg":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 674
    .end local v1    # "arg":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 675
    .local v6, "size":I
    new-array v2, v0, [Ljava/lang/String;

    .line 676
    .local v2, "argsAsStrings":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-eq v3, v0, :cond_2

    .line 677
    aget-object v7, p1, v3

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 678
    .local v5, "s":Ljava/lang/String;
    aput-object v5, v2, v3

    .line 679
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    .line 676
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 682
    .end local v5    # "s":Ljava/lang/String;
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 683
    .local v4, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    const/4 v3, 0x0

    :goto_2
    if-eq v3, v0, :cond_3

    .line 685
    aget-object v7, v2, v3

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 687
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private static js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I
    .locals 11
    .param p0, "methodId"    # I
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v10, 0x29

    const/16 v9, 0x2a

    const/4 v8, 0x1

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 547
    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 548
    .local v2, "searchStr":Ljava/lang/String;
    invoke-static {p2, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v0

    .line 550
    .local v0, "position":D
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v6, v5

    cmpl-double v5, v0, v6

    if-lez v5, :cond_1

    if-eq p0, v10, :cond_1

    if-eq p0, v9, :cond_1

    move v3, v4

    .line 561
    :cond_0
    :goto_0
    return v3

    .line 553
    :cond_1
    const-wide/16 v6, 0x0

    cmpg-double v5, v0, v6

    if-gez v5, :cond_5

    const-wide/16 v0, 0x0

    .line 557
    :cond_2
    :goto_1
    if-ne v9, p0, :cond_8

    .line 558
    array-length v5, p2

    if-eqz v5, :cond_3

    array-length v5, p2

    if-eq v5, v8, :cond_3

    array-length v5, p2

    const/4 v6, 0x2

    if-ne v5, v6, :cond_4

    aget-object v5, p2, v8

    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v6, :cond_4

    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v0, v5

    .line 559
    :cond_4
    double-to-int v5, v0

    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    move v3, v4

    goto :goto_0

    .line 554
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v6, v5

    cmpl-double v5, v0, v6

    if-lez v5, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v0, v5

    goto :goto_1

    .line 555
    :cond_6
    if-ne p0, v9, :cond_2

    cmpl-double v5, v0, v0

    if-nez v5, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v6, v5

    cmpl-double v5, v0, v6

    if-lez v5, :cond_2

    :cond_7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v0, v5

    goto :goto_1

    .line 561
    :cond_8
    if-ne p0, v10, :cond_9

    double-to-int v5, v0

    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_0

    move v3, v4

    goto :goto_0

    :cond_9
    double-to-int v3, v0

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    goto :goto_0
.end method

.method private static js_lastIndexOf(Ljava/lang/String;[Ljava/lang/Object;)I
    .locals 6
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 573
    const/4 v3, 0x0

    invoke-static {p1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 574
    .local v2, "search":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-static {p1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v0

    .line 576
    .local v0, "end":D
    cmpl-double v3, v0, v0

    if-nez v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v4, v3

    cmpl-double v3, v0, v4

    if-lez v3, :cond_2

    .line 577
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v0, v3

    .line 581
    :cond_1
    :goto_0
    double-to-int v3, v0

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v3

    return v3

    .line 578
    :cond_2
    const-wide/16 v4, 0x0

    cmpg-double v3, v0, v4

    if-gez v3, :cond_1

    .line 579
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private static js_repeat(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 721
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 722
    .local v5, "str":Ljava/lang/String;
    const/4 v8, 0x0

    invoke-static {p3, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v0

    .line 724
    .local v0, "cnt":D
    const-wide/16 v8, 0x0

    cmpg-double v8, v0, v8

    if-ltz v8, :cond_0

    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v0, v8

    if-nez v8, :cond_1

    .line 725
    :cond_0
    const-string v8, "Invalid count value"

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->rangeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v8

    throw v8

    .line 728
    :cond_1
    const-wide/16 v8, 0x0

    cmpl-double v8, v0, v8

    if-eqz v8, :cond_2

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_3

    .line 729
    :cond_2
    const-string v8, ""

    .line 751
    :goto_0
    return-object v8

    .line 732
    :cond_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    int-to-long v8, v8

    double-to-long v10, v0

    mul-long v6, v8, v10

    .line 734
    .local v6, "size":J
    const-wide v8, 0x41dfffffffc00000L    # 2.147483647E9

    cmpl-double v8, v0, v8

    if-gtz v8, :cond_4

    const-wide/32 v8, 0x7fffffff

    cmp-long v8, v6, v8

    if-lez v8, :cond_5

    .line 735
    :cond_4
    const-string v8, "Invalid size or count value"

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->rangeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v8

    throw v8

    .line 738
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    long-to-int v8, v6

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 739
    .local v4, "retval":Ljava/lang/StringBuilder;
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 741
    const/4 v2, 0x1

    .line 742
    .local v2, "i":I
    double-to-int v3, v0

    .line 743
    .local v3, "icnt":I
    :goto_1
    div-int/lit8 v8, v3, 0x2

    if-gt v2, v8, :cond_6

    .line 744
    invoke-virtual {v4, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 745
    mul-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 747
    :cond_6
    if-ge v2, v3, :cond_7

    .line 748
    const/4 v8, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    sub-int v10, v3, v2

    mul-int/2addr v9, v10

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 751
    :cond_7
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method private static js_slice(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 11
    .param p0, "target"    # Ljava/lang/CharSequence;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v10, 0x1

    const-wide/16 v6, 0x0

    .line 691
    array-length v5, p1

    if-ge v5, v10, :cond_3

    move-wide v0, v6

    .line 693
    .local v0, "begin":D
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 694
    .local v4, "length":I
    cmpg-double v5, v0, v6

    if-gez v5, :cond_4

    .line 695
    int-to-double v8, v4

    add-double/2addr v0, v8

    .line 696
    cmpg-double v5, v0, v6

    if-gez v5, :cond_0

    .line 697
    const-wide/16 v0, 0x0

    .line 702
    :cond_0
    :goto_1
    array-length v5, p1

    const/4 v8, 0x2

    if-lt v5, v8, :cond_1

    aget-object v5, p1, v10

    sget-object v8, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v8, :cond_5

    .line 703
    :cond_1
    int-to-double v2, v4

    .line 716
    .local v2, "end":D
    :cond_2
    :goto_2
    double-to-int v5, v0

    double-to-int v6, v2

    invoke-interface {p0, v5, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    return-object v5

    .line 691
    .end local v0    # "begin":D
    .end local v2    # "end":D
    .end local v4    # "length":I
    :cond_3
    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    goto :goto_0

    .line 698
    .restart local v0    # "begin":D
    .restart local v4    # "length":I
    :cond_4
    int-to-double v8, v4

    cmpl-double v5, v0, v8

    if-lez v5, :cond_0

    .line 699
    int-to-double v0, v4

    goto :goto_1

    .line 705
    :cond_5
    aget-object v5, p1, v10

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v2

    .line 706
    .restart local v2    # "end":D
    cmpg-double v5, v2, v6

    if-gez v5, :cond_7

    .line 707
    int-to-double v8, v4

    add-double/2addr v2, v8

    .line 708
    cmpg-double v5, v2, v6

    if-gez v5, :cond_6

    .line 709
    const-wide/16 v2, 0x0

    .line 713
    :cond_6
    :goto_3
    cmpg-double v5, v2, v0

    if-gez v5, :cond_2

    .line 714
    move-wide v2, v0

    goto :goto_2

    .line 710
    :cond_7
    int-to-double v6, v4

    cmpl-double v5, v2, v6

    if-lez v5, :cond_6

    .line 711
    int-to-double v2, v4

    goto :goto_3
.end method

.method private static js_substr(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 11
    .param p0, "target"    # Ljava/lang/CharSequence;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v10, 0x1

    const-wide/16 v8, 0x0

    .line 632
    array-length v5, p1

    if-ge v5, v10, :cond_0

    .line 658
    .end local p0    # "target":Ljava/lang/CharSequence;
    :goto_0
    return-object p0

    .line 635
    .restart local p0    # "target":Ljava/lang/CharSequence;
    :cond_0
    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    .line 637
    .local v0, "begin":D
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 639
    .local v4, "length":I
    cmpg-double v5, v0, v8

    if-gez v5, :cond_3

    .line 640
    int-to-double v6, v4

    add-double/2addr v0, v6

    .line 641
    cmpg-double v5, v0, v8

    if-gez v5, :cond_1

    .line 642
    const-wide/16 v0, 0x0

    .line 647
    :cond_1
    :goto_1
    array-length v5, p1

    if-ne v5, v10, :cond_4

    .line 648
    int-to-double v2, v4

    .line 658
    .local v2, "end":D
    :cond_2
    :goto_2
    double-to-int v5, v0

    double-to-int v6, v2

    invoke-interface {p0, v5, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    goto :goto_0

    .line 643
    .end local v2    # "end":D
    :cond_3
    int-to-double v6, v4

    cmpl-double v5, v0, v6

    if-lez v5, :cond_1

    .line 644
    int-to-double v0, v4

    goto :goto_1

    .line 650
    :cond_4
    aget-object v5, p1, v10

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v2

    .line 651
    .restart local v2    # "end":D
    cmpg-double v5, v2, v8

    if-gez v5, :cond_5

    .line 652
    const-wide/16 v2, 0x0

    .line 653
    :cond_5
    add-double/2addr v2, v0

    .line 654
    int-to-double v6, v4

    cmpl-double v5, v2, v6

    if-lez v5, :cond_2

    .line 655
    int-to-double v2, v4

    goto :goto_2
.end method

.method private static js_substring(Lorg/mozilla/javascript/Context;Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Ljava/lang/CharSequence;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 591
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 592
    .local v2, "length":I
    const/4 v3, 0x0

    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v4

    .line 595
    .local v4, "start":D
    const-wide/16 v8, 0x0

    cmpg-double v3, v4, v8

    if-gez v3, :cond_3

    .line 596
    const-wide/16 v4, 0x0

    .line 600
    :cond_0
    :goto_0
    array-length v3, p2

    const/4 v8, 0x1

    if-le v3, v8, :cond_1

    const/4 v3, 0x1

    aget-object v3, p2, v3

    sget-object v8, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v3, v8, :cond_4

    .line 601
    :cond_1
    int-to-double v0, v2

    .line 621
    .local v0, "end":D
    :cond_2
    :goto_1
    double-to-int v3, v4

    double-to-int v8, v0

    invoke-interface {p1, v3, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    return-object v3

    .line 597
    .end local v0    # "end":D
    :cond_3
    int-to-double v8, v2

    cmpl-double v3, v4, v8

    if-lez v3, :cond_0

    .line 598
    int-to-double v4, v2

    goto :goto_0

    .line 603
    :cond_4
    const/4 v3, 0x1

    aget-object v3, p2, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    .line 604
    .restart local v0    # "end":D
    const-wide/16 v8, 0x0

    cmpg-double v3, v0, v8

    if-gez v3, :cond_6

    .line 605
    const-wide/16 v0, 0x0

    .line 610
    :cond_5
    :goto_2
    cmpg-double v3, v0, v4

    if-gez v3, :cond_2

    .line 611
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v3

    const/16 v8, 0x78

    if-eq v3, v8, :cond_7

    .line 612
    move-wide v6, v4

    .line 613
    .local v6, "temp":D
    move-wide v4, v0

    .line 614
    move-wide v0, v6

    .line 615
    goto :goto_1

    .line 606
    .end local v6    # "temp":D
    :cond_6
    int-to-double v8, v2

    cmpl-double v3, v0, v8

    if-lez v3, :cond_5

    .line 607
    int-to-double v0, v2

    goto :goto_2

    .line 617
    :cond_7
    move-wide v0, v4

    goto :goto_1
.end method

.method private static realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeString;
    .locals 1
    .param p0, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 483
    instance-of v0, p0, Lorg/mozilla/javascript/NativeString;

    if-nez v0, :cond_0

    .line 484
    invoke-static {p1}, Lorg/mozilla/javascript/NativeString;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 485
    :cond_0
    check-cast p0, Lorg/mozilla/javascript/NativeString;

    .end local p0    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p0
.end method

.method private static tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "thisObj"    # Ljava/lang/Object;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v3, 0x3e

    .line 494
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 495
    .local v1, "str":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 496
    .local v0, "result":Ljava/lang/StringBuilder;
    const/16 v2, 0x3c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 497
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    if-eqz p2, :cond_0

    .line 499
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 500
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    const-string v2, "=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    const/4 v2, 0x0

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    const/16 v2, 0x22

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 505
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 506
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    const-string v2, "</"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 510
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 33
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 187
    sget-object v4, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 188
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .line 472
    :cond_0
    :goto_0
    return-object v26

    .line 190
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v21

    .line 193
    .local v21, "id":I
    :goto_1
    packed-switch v21, :pswitch_data_0

    .line 477
    :pswitch_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "String.prototype has no method: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 211
    :pswitch_1
    move-object/from16 v0, p5

    array-length v4, v0

    if-lez v4, :cond_3

    .line 212
    const/4 v4, 0x0

    aget-object v4, p5, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v0, v1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p4

    .line 214
    move-object/from16 v0, p5

    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    new-array v0, v4, [Ljava/lang/Object;

    move-object/from16 v23, v0

    .line 215
    .local v23, "newArgs":[Ljava/lang/Object;
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_2
    move-object/from16 v0, v23

    array-length v4, v0

    move/from16 v0, v20

    if-ge v0, v4, :cond_2

    .line 216
    add-int/lit8 v4, v20, 0x1

    aget-object v4, p5, v4

    aput-object v4, v23, v20

    .line 215
    add-int/lit8 v20, v20, 0x1

    goto :goto_2

    .line 217
    :cond_2
    move-object/from16 p5, v23

    .line 222
    .end local v20    # "i":I
    .end local v23    # "newArgs":[Ljava/lang/Object;
    :goto_3
    move/from16 v0, v21

    neg-int v0, v0

    move/from16 v21, v0

    .line 223
    goto :goto_1

    .line 219
    :cond_3
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v0, v1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p4

    goto :goto_3

    .line 227
    :pswitch_2
    move-object/from16 v0, p5

    array-length v10, v0

    .line 228
    .local v10, "N":I
    const/4 v4, 0x1

    if-ge v10, v4, :cond_4

    .line 229
    const-string v26, ""

    goto :goto_0

    .line 230
    :cond_4
    new-instance v29, Ljava/lang/StringBuilder;

    move-object/from16 v0, v29

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 231
    .local v29, "sb":Ljava/lang/StringBuilder;
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_4
    move/from16 v0, v20

    if-eq v0, v10, :cond_5

    .line 232
    aget-object v4, p5, v20

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toUint16(Ljava/lang/Object;)C

    move-result v4

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    add-int/lit8 v20, v20, 0x1

    goto :goto_4

    .line 234
    :cond_5
    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 238
    .end local v10    # "N":I
    .end local v20    # "i":I
    .end local v29    # "sb":Ljava/lang/StringBuilder;
    :pswitch_3
    move-object/from16 v0, p5

    array-length v4, v0

    const/4 v5, 0x1

    if-lt v4, v5, :cond_6

    const/4 v4, 0x0

    aget-object v4, p5, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v26

    .line 240
    .local v26, "s":Ljava/lang/CharSequence;
    :goto_5
    if-nez p4, :cond_7

    .line 242
    new-instance v16, Lorg/mozilla/javascript/NativeString;

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeString;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v26, v16

    goto/16 :goto_0

    .line 238
    .end local v26    # "s":Ljava/lang/CharSequence;
    :cond_6
    const-string v26, ""

    goto :goto_5

    .line 245
    .restart local v26    # "s":Ljava/lang/CharSequence;
    :cond_7
    move-object/from16 v0, v26

    instance-of v4, v0, Ljava/lang/String;

    if-nez v4, :cond_0

    invoke-interface/range {v26 .. v26}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 251
    .end local v26    # "s":Ljava/lang/CharSequence;
    :pswitch_4
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeString;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeString;

    move-result-object v4

    iget-object v0, v4, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    move-object/from16 v16, v0

    .line 252
    .local v16, "cs":Ljava/lang/CharSequence;
    move-object/from16 v0, v16

    instance-of v4, v0, Ljava/lang/String;

    if-eqz v4, :cond_8

    .end local v16    # "cs":Ljava/lang/CharSequence;
    :goto_6
    move-object/from16 v26, v16

    goto/16 :goto_0

    .restart local v16    # "cs":Ljava/lang/CharSequence;
    :cond_8
    invoke-interface/range {v16 .. v16}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_6

    .line 255
    .end local v16    # "cs":Ljava/lang/CharSequence;
    :pswitch_5
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeString;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeString;

    move-result-object v4

    iget-object v0, v4, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    move-object/from16 v26, v0

    .line 256
    .restart local v26    # "s":Ljava/lang/CharSequence;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(new String(\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {v26 .. v26}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\"))"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 262
    .end local v26    # "s":Ljava/lang/CharSequence;
    :pswitch_6
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v32

    .line 263
    .local v32, "target":Ljava/lang/CharSequence;
    const/4 v4, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v24

    .line 264
    .local v24, "pos":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v24, v4

    if-ltz v4, :cond_9

    invoke-interface/range {v32 .. v32}, Ljava/lang/CharSequence;->length()I

    move-result v4

    int-to-double v4, v4

    cmpl-double v4, v24, v4

    if-ltz v4, :cond_b

    .line 265
    :cond_9
    const/4 v4, 0x5

    move/from16 v0, v21

    if-ne v0, v4, :cond_a

    const-string v26, ""

    goto/16 :goto_0

    .line 266
    :cond_a
    sget-object v26, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto/16 :goto_0

    .line 268
    :cond_b
    move-wide/from16 v0, v24

    double-to-int v4, v0

    move-object/from16 v0, v32

    invoke-interface {v0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v11

    .line 269
    .local v11, "c":C
    const/4 v4, 0x5

    move/from16 v0, v21

    if-ne v0, v4, :cond_c

    invoke-static {v11}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 270
    :cond_c
    invoke-static {v11}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v26

    goto/16 :goto_0

    .line 274
    .end local v11    # "c":C
    .end local v24    # "pos":D
    .end local v32    # "target":Ljava/lang/CharSequence;
    :pswitch_7
    const/4 v4, 0x7

    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p5

    invoke-static {v4, v5, v0}, Lorg/mozilla/javascript/NativeString;->js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v26

    goto/16 :goto_0

    .line 279
    :pswitch_8
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    .line 281
    .local v26, "s":Ljava/lang/String;
    move-object/from16 v0, p5

    array-length v4, v0

    if-lez v4, :cond_d

    const/4 v4, 0x0

    aget-object v4, p5, v4

    instance-of v4, v4, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-eqz v4, :cond_d

    .line 282
    const-string v4, "msg.first.arg.not.regexp"

    const-class v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v4

    throw v4

    .line 285
    :cond_d
    move/from16 v0, v21

    move-object/from16 v1, v26

    move-object/from16 v2, p5

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeString;->js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I

    move-result v22

    .line 287
    .local v22, "idx":I
    const/16 v4, 0x28

    move/from16 v0, v21

    if-ne v0, v4, :cond_f

    .line 288
    const/4 v4, -0x1

    move/from16 v0, v22

    if-eq v0, v4, :cond_e

    const/4 v4, 0x1

    :goto_7
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v26

    goto/16 :goto_0

    :cond_e
    const/4 v4, 0x0

    goto :goto_7

    .line 289
    :cond_f
    const/16 v4, 0x29

    move/from16 v0, v21

    if-ne v0, v4, :cond_11

    .line 290
    if-nez v22, :cond_10

    const/4 v4, 0x1

    :goto_8
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v26

    goto/16 :goto_0

    :cond_10
    const/4 v4, 0x0

    goto :goto_8

    .line 291
    :cond_11
    const/16 v4, 0x2a

    move/from16 v0, v21

    if-ne v0, v4, :cond_13

    .line 292
    const/4 v4, -0x1

    move/from16 v0, v22

    if-eq v0, v4, :cond_12

    const/4 v4, 0x1

    :goto_9
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v26

    goto/16 :goto_0

    :cond_12
    const/4 v4, 0x0

    goto :goto_9

    .line 296
    .end local v22    # "idx":I
    .end local v26    # "s":Ljava/lang/String;
    :cond_13
    :pswitch_9
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-static {v4, v0}, Lorg/mozilla/javascript/NativeString;->js_lastIndexOf(Ljava/lang/String;[Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v26

    goto/16 :goto_0

    .line 300
    :pswitch_a
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->checkRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v4

    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-interface {v4, v0, v1, v5, v2}, Lorg/mozilla/javascript/RegExpProxy;->js_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    goto/16 :goto_0

    .line 305
    :pswitch_b
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-static {v0, v4, v1}, Lorg/mozilla/javascript/NativeString;->js_substring(Lorg/mozilla/javascript/Context;Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v26

    goto/16 :goto_0

    .line 309
    :pswitch_c
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 314
    :pswitch_d
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 318
    :pswitch_e
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-static {v4, v0}, Lorg/mozilla/javascript/NativeString;->js_substr(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v26

    goto/16 :goto_0

    .line 321
    :pswitch_f
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-static {v4, v0}, Lorg/mozilla/javascript/NativeString;->js_concat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 324
    :pswitch_10
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-static {v4, v0}, Lorg/mozilla/javascript/NativeString;->js_slice(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v26

    goto/16 :goto_0

    .line 327
    :pswitch_11
    const-string v4, "b"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 330
    :pswitch_12
    const-string v4, "i"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 333
    :pswitch_13
    const-string v4, "tt"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 336
    :pswitch_14
    const-string v4, "strike"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 339
    :pswitch_15
    const-string v4, "small"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 342
    :pswitch_16
    const-string v4, "big"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 345
    :pswitch_17
    const-string v4, "blink"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 348
    :pswitch_18
    const-string v4, "sup"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 351
    :pswitch_19
    const-string v4, "sub"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v4, v5, v6}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 354
    :pswitch_1a
    const-string v4, "font"

    const-string v5, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v4, v5, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 357
    :pswitch_1b
    const-string v4, "font"

    const-string v5, "color"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v4, v5, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 360
    :pswitch_1c
    const-string v4, "a"

    const-string v5, "href"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v4, v5, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 363
    :pswitch_1d
    const-string v4, "a"

    const-string v5, "name"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v4, v5, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 367
    :pswitch_1e
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    .line 368
    .local v27, "s1":Ljava/lang/String;
    const/4 v4, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v28

    .line 369
    .local v28, "s2":Ljava/lang/String;
    const/16 v4, 0x1d

    move/from16 v0, v21

    if-ne v0, v4, :cond_14

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    :goto_a
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v26

    goto/16 :goto_0

    :cond_14
    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    goto :goto_a

    .line 378
    .end local v27    # "s1":Ljava/lang/String;
    .end local v28    # "s2":Ljava/lang/String;
    :pswitch_1f
    const/16 v4, 0x1f

    move/from16 v0, v21

    if-ne v0, v4, :cond_15

    .line 379
    const/4 v9, 0x1

    .line 385
    .local v9, "actionType":I
    :goto_b
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->checkRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v4

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    invoke-interface/range {v4 .. v9}, Lorg/mozilla/javascript/RegExpProxy;->action(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v26

    goto/16 :goto_0

    .line 380
    .end local v9    # "actionType":I
    :cond_15
    const/16 v4, 0x20

    move/from16 v0, v21

    if-ne v0, v4, :cond_16

    .line 381
    const/4 v9, 0x3

    .restart local v9    # "actionType":I
    goto :goto_b

    .line 383
    .end local v9    # "actionType":I
    :cond_16
    const/4 v9, 0x2

    .restart local v9    # "actionType":I
    goto :goto_b

    .line 394
    .end local v9    # "actionType":I
    :pswitch_20
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v13

    .line 395
    .local v13, "collator":Ljava/text/Collator;
    const/4 v4, 0x3

    invoke-virtual {v13, v4}, Ljava/text/Collator;->setStrength(I)V

    .line 396
    const/4 v4, 0x1

    invoke-virtual {v13, v4}, Ljava/text/Collator;->setDecomposition(I)V

    .line 397
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    int-to-double v4, v4

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v26

    goto/16 :goto_0

    .line 402
    .end local v13    # "collator":Ljava/text/Collator;
    :pswitch_21
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 406
    :pswitch_22
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 410
    :pswitch_23
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 411
    .local v31, "str":Ljava/lang/String;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->toCharArray()[C

    move-result-object v12

    .line 413
    .local v12, "chars":[C
    const/16 v30, 0x0

    .line 414
    .local v30, "start":I
    :goto_c
    array-length v4, v12

    move/from16 v0, v30

    if-ge v0, v4, :cond_17

    aget-char v4, v12, v30

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 415
    add-int/lit8 v30, v30, 0x1

    goto :goto_c

    .line 417
    :cond_17
    array-length v0, v12

    move/from16 v17, v0

    .line 418
    .local v17, "end":I
    :goto_d
    move/from16 v0, v17

    move/from16 v1, v30

    if-le v0, v1, :cond_18

    add-int/lit8 v4, v17, -0x1

    aget-char v4, v12, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 419
    add-int/lit8 v17, v17, -0x1

    goto :goto_d

    .line 422
    :cond_18
    move-object/from16 v0, v31

    move/from16 v1, v30

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 425
    .end local v12    # "chars":[C
    .end local v17    # "end":I
    .end local v30    # "start":I
    .end local v31    # "str":Ljava/lang/String;
    :pswitch_24
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 426
    .restart local v31    # "str":Ljava/lang/String;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->toCharArray()[C

    move-result-object v12

    .line 428
    .restart local v12    # "chars":[C
    const/16 v30, 0x0

    .line 429
    .restart local v30    # "start":I
    :goto_e
    array-length v4, v12

    move/from16 v0, v30

    if-ge v0, v4, :cond_19

    aget-char v4, v12, v30

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 430
    add-int/lit8 v30, v30, 0x1

    goto :goto_e

    .line 432
    :cond_19
    array-length v0, v12

    move/from16 v17, v0

    .line 434
    .restart local v17    # "end":I
    move-object/from16 v0, v31

    move/from16 v1, v30

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 438
    .end local v12    # "chars":[C
    .end local v17    # "end":I
    .end local v30    # "start":I
    .end local v31    # "str":Ljava/lang/String;
    :pswitch_25
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 439
    .restart local v31    # "str":Ljava/lang/String;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->toCharArray()[C

    move-result-object v12

    .line 441
    .restart local v12    # "chars":[C
    const/16 v30, 0x0

    .line 443
    .restart local v30    # "start":I
    array-length v0, v12

    move/from16 v17, v0

    .line 444
    .restart local v17    # "end":I
    :goto_f
    move/from16 v0, v17

    move/from16 v1, v30

    if-le v0, v1, :cond_1a

    add-int/lit8 v4, v17, -0x1

    aget-char v4, v12, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 445
    add-int/lit8 v17, v17, -0x1

    goto :goto_f

    .line 448
    :cond_1a
    move-object/from16 v0, v31

    move/from16 v1, v30

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 451
    .end local v12    # "chars":[C
    .end local v17    # "end":I
    .end local v30    # "start":I
    .end local v31    # "str":Ljava/lang/String;
    :pswitch_26
    const/4 v4, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v19

    .line 454
    .local v19, "formStr":Ljava/lang/String;
    sget-object v4, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    invoke-virtual {v4}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    sget-object v18, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    .line 460
    .local v18, "form":Ljava/text/Normalizer$Form;
    :goto_10
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-static {v4, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 455
    .end local v18    # "form":Ljava/text/Normalizer$Form;
    :cond_1b
    sget-object v4, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-virtual {v4}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    sget-object v18, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    .restart local v18    # "form":Ljava/text/Normalizer$Form;
    goto :goto_10

    .line 456
    .end local v18    # "form":Ljava/text/Normalizer$Form;
    :cond_1c
    sget-object v4, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    invoke-virtual {v4}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    sget-object v18, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    .restart local v18    # "form":Ljava/text/Normalizer$Form;
    goto :goto_10

    .line 457
    .end local v18    # "form":Ljava/text/Normalizer$Form;
    :cond_1d
    sget-object v4, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    invoke-virtual {v4}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1e

    move-object/from16 v0, p5

    array-length v4, v0

    if-nez v4, :cond_1f

    :cond_1e
    sget-object v18, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    .restart local v18    # "form":Ljava/text/Normalizer$Form;
    goto :goto_10

    .line 458
    .end local v18    # "form":Ljava/text/Normalizer$Form;
    :cond_1f
    const-string v4, "The normalization form should be one of NFC, NFD, NFKC, NFKD"

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->rangeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v4

    throw v4

    .line 465
    .end local v19    # "formStr":Ljava/lang/String;
    :pswitch_27
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move-object/from16 v2, p1

    move-object/from16 v3, p5

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeString;->js_repeat(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    goto/16 :goto_0

    .line 469
    :pswitch_28
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 470
    .restart local v31    # "str":Ljava/lang/String;
    const/4 v4, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v14

    .line 472
    .local v14, "cnt":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v14, v4

    if-ltz v4, :cond_20

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v4

    int-to-double v4, v4

    cmpl-double v4, v14, v4

    if-ltz v4, :cond_21

    :cond_20
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    :goto_11
    move-object/from16 v26, v4

    goto/16 :goto_0

    :cond_21
    double-to-int v4, v14

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_11

    .line 193
    :pswitch_data_0
    .packed-switch -0x23
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1e
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_26
        :pswitch_27
        :pswitch_28
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .locals 6
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 88
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "fromCharCode"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 90
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "charAt"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 92
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "charCodeAt"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 94
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x7

    const-string v4, "indexOf"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 96
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "lastIndexOf"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 98
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x9

    const-string v4, "split"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 100
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xa

    const-string v4, "substring"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 102
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xb

    const-string v4, "toLowerCase"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 104
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xc

    const-string v4, "toUpperCase"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 106
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xd

    const-string v4, "substr"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 108
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xe

    const-string v4, "concat"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 110
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xf

    const-string v4, "slice"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 112
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x1e

    const-string v4, "equalsIgnoreCase"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 114
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x1f

    const-string v4, "match"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 116
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x20

    const-string v4, "search"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 118
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x21

    const-string v4, "replace"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 120
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x22

    const-string v4, "localeCompare"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 122
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x23

    const-string v4, "toLocaleLowerCase"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 124
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 125
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 63
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    const/4 v0, 0x7

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeString;->instanceIdInfo(II)I

    move-result v0

    .line 66
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    const/16 v7, 0x62

    const/16 v6, 0x73

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 761
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 762
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 831
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 835
    :cond_1
    :goto_1
    return v2

    .line 763
    :pswitch_1
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 764
    .local v1, "c":I
    if-ne v1, v7, :cond_2

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x75

    if-ne v3, v4, :cond_0

    const/16 v2, 0x18

    goto :goto_1

    .line 765
    :cond_2
    const/16 v3, 0x67

    if-ne v1, v3, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_0

    const/16 v2, 0x15

    goto :goto_1

    .line 766
    :cond_3
    const/16 v3, 0x70

    if-ne v1, v3, :cond_0

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x75

    if-ne v3, v4, :cond_0

    const/16 v2, 0x17

    goto :goto_1

    .line 768
    .end local v1    # "c":I
    :pswitch_2
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 769
    .restart local v1    # "c":I
    if-ne v1, v7, :cond_4

    const-string v0, "bold"

    const/16 v2, 0x10

    goto :goto_0

    .line 770
    :cond_4
    const/16 v3, 0x6c

    if-ne v1, v3, :cond_5

    const-string v0, "link"

    const/16 v2, 0x1b

    goto :goto_0

    .line 771
    :cond_5
    const/16 v3, 0x74

    if-ne v1, v3, :cond_0

    const-string v0, "trim"

    const/16 v2, 0x25

    goto :goto_0

    .line 773
    .end local v1    # "c":I
    :pswitch_3
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 774
    :sswitch_0
    const-string v0, "fixed"

    const/16 v2, 0x12

    goto :goto_0

    .line 775
    :sswitch_1
    const-string v0, "slice"

    const/16 v2, 0xf

    goto :goto_0

    .line 776
    :sswitch_2
    const-string v0, "match"

    const/16 v2, 0x1f

    goto/16 :goto_0

    .line 777
    :sswitch_3
    const-string v0, "blink"

    const/16 v2, 0x16

    goto/16 :goto_0

    .line 778
    :sswitch_4
    const-string v0, "small"

    const/16 v2, 0x14

    goto/16 :goto_0

    .line 779
    :sswitch_5
    const-string v0, "split"

    const/16 v2, 0x9

    goto/16 :goto_0

    .line 781
    :pswitch_4
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1

    goto/16 :goto_0

    .line 782
    :sswitch_6
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 783
    .restart local v1    # "c":I
    const/16 v3, 0x72

    if-ne v1, v3, :cond_6

    const-string v0, "repeat"

    const/16 v2, 0x2c

    goto/16 :goto_0

    .line 784
    :cond_6
    if-ne v1, v6, :cond_0

    const-string v0, "search"

    const/16 v2, 0x20

    goto/16 :goto_0

    .line 786
    .end local v1    # "c":I
    :sswitch_7
    const-string v0, "charAt"

    const/4 v2, 0x5

    goto/16 :goto_0

    .line 787
    :sswitch_8
    const-string v0, "anchor"

    const/16 v2, 0x1c

    goto/16 :goto_0

    .line 788
    :sswitch_9
    const-string v0, "concat"

    const/16 v2, 0xe

    goto/16 :goto_0

    .line 789
    :sswitch_a
    const-string v0, "equals"

    const/16 v2, 0x1d

    goto/16 :goto_0

    .line 790
    :sswitch_b
    const-string v0, "strike"

    const/16 v2, 0x13

    goto/16 :goto_0

    .line 791
    :sswitch_c
    const-string v0, "substr"

    const/16 v2, 0xd

    goto/16 :goto_0

    .line 793
    :pswitch_5
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_2

    goto/16 :goto_0

    .line 794
    :sswitch_d
    const-string v0, "valueOf"

    const/4 v2, 0x4

    goto/16 :goto_0

    .line 795
    :sswitch_e
    const-string v0, "replace"

    const/16 v2, 0x21

    goto/16 :goto_0

    .line 796
    :sswitch_f
    const-string v0, "indexOf"

    const/4 v2, 0x7

    goto/16 :goto_0

    .line 797
    :sswitch_10
    const-string v0, "italics"

    const/16 v2, 0x11

    goto/16 :goto_0

    .line 799
    :pswitch_6
    const/4 v3, 0x6

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_3

    goto/16 :goto_0

    .line 800
    :sswitch_11
    const-string v0, "toSource"

    const/4 v2, 0x3

    goto/16 :goto_0

    .line 801
    :sswitch_12
    const-string v0, "includes"

    const/16 v2, 0x28

    goto/16 :goto_0

    .line 802
    :sswitch_13
    const-string v0, "trimLeft"

    const/16 v2, 0x26

    goto/16 :goto_0

    .line 803
    :sswitch_14
    const-string v0, "toString"

    const/4 v2, 0x2

    goto/16 :goto_0

    .line 804
    :sswitch_15
    const-string v0, "endsWith"

    const/16 v2, 0x2a

    goto/16 :goto_0

    .line 805
    :sswitch_16
    const-string v0, "fontsize"

    const/16 v2, 0x19

    goto/16 :goto_0

    .line 807
    :pswitch_7
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_4

    goto/16 :goto_0

    .line 808
    :sswitch_17
    const-string v0, "fontcolor"

    const/16 v2, 0x1a

    goto/16 :goto_0

    .line 809
    :sswitch_18
    const-string v0, "normalize"

    const/16 v2, 0x2b

    goto/16 :goto_0

    .line 810
    :sswitch_19
    const-string v0, "substring"

    const/16 v2, 0xa

    goto/16 :goto_0

    .line 811
    :sswitch_1a
    const-string v0, "trimRight"

    const/16 v2, 0x27

    goto/16 :goto_0

    .line 813
    :pswitch_8
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 814
    .restart local v1    # "c":I
    const/16 v3, 0x63

    if-ne v1, v3, :cond_7

    const-string v0, "charCodeAt"

    const/4 v2, 0x6

    goto/16 :goto_0

    .line 815
    :cond_7
    if-ne v1, v6, :cond_0

    const-string v0, "startsWith"

    const/16 v2, 0x29

    goto/16 :goto_0

    .line 817
    .end local v1    # "c":I
    :pswitch_9
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_5

    goto/16 :goto_0

    .line 818
    :sswitch_1b
    const-string v0, "toLowerCase"

    const/16 v2, 0xb

    goto/16 :goto_0

    .line 819
    :sswitch_1c
    const-string v0, "toUpperCase"

    const/16 v2, 0xc

    goto/16 :goto_0

    .line 820
    :sswitch_1d
    const-string v0, "codePointAt"

    const/16 v2, 0x2d

    goto/16 :goto_0

    .line 821
    :sswitch_1e
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 822
    :sswitch_1f
    const-string v0, "lastIndexOf"

    const/16 v2, 0x8

    goto/16 :goto_0

    .line 824
    :pswitch_a
    const-string v0, "localeCompare"

    const/16 v2, 0x22

    goto/16 :goto_0

    .line 825
    :pswitch_b
    const-string v0, "equalsIgnoreCase"

    const/16 v2, 0x1e

    goto/16 :goto_0

    .line 826
    :pswitch_c
    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 827
    .restart local v1    # "c":I
    const/16 v3, 0x4c

    if-ne v1, v3, :cond_8

    const-string v0, "toLocaleLowerCase"

    const/16 v2, 0x23

    goto/16 :goto_0

    .line 828
    :cond_8
    const/16 v3, 0x55

    if-ne v1, v3, :cond_0

    const-string v0, "toLocaleUpperCase"

    const/16 v2, 0x24

    goto/16 :goto_0

    .line 762
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_0
        :pswitch_a
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_c
    .end packed-switch

    .line 773
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0x65 -> :sswitch_1
        0x68 -> :sswitch_2
        0x6b -> :sswitch_3
        0x6c -> :sswitch_4
        0x74 -> :sswitch_5
    .end sparse-switch

    .line 781
    :sswitch_data_1
    .sparse-switch
        0x65 -> :sswitch_6
        0x68 -> :sswitch_7
        0x6e -> :sswitch_8
        0x6f -> :sswitch_9
        0x71 -> :sswitch_a
        0x74 -> :sswitch_b
        0x75 -> :sswitch_c
    .end sparse-switch

    .line 793
    :sswitch_data_2
    .sparse-switch
        0x61 -> :sswitch_d
        0x65 -> :sswitch_e
        0x6e -> :sswitch_f
        0x74 -> :sswitch_10
    .end sparse-switch

    .line 799
    :sswitch_data_3
    .sparse-switch
        0x63 -> :sswitch_11
        0x65 -> :sswitch_12
        0x66 -> :sswitch_13
        0x6e -> :sswitch_14
        0x74 -> :sswitch_15
        0x7a -> :sswitch_16
    .end sparse-switch

    .line 807
    :sswitch_data_4
    .sparse-switch
        0x66 -> :sswitch_17
        0x6e -> :sswitch_18
        0x73 -> :sswitch_19
        0x74 -> :sswitch_1a
    .end sparse-switch

    .line 817
    :sswitch_data_5
    .sparse-switch
        0x4c -> :sswitch_1b
        0x55 -> :sswitch_1c
        0x64 -> :sswitch_1d
        0x6e -> :sswitch_1e
        0x73 -> :sswitch_1f
    .end sparse-switch
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 527
    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 528
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    .line 530
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string v0, "String"

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 72
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "length"

    .line 73
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 79
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 80
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    .line 82
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method getLength()I
    .locals 1

    .prologue
    .line 625
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    return v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x1

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 132
    packed-switch p1, :pswitch_data_0

    .line 178
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 133
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 180
    .local v1, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeString;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 181
    return-void

    .line 134
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 135
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 136
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 137
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "charAt"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 138
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "charCodeAt"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 139
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "indexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 140
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "lastIndexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 141
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "split"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 142
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "substring"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 143
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLowerCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 144
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toUpperCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 145
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "substr"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 146
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "concat"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 147
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "slice"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 148
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "bold"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 149
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "italics"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 150
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "fixed"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 151
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "strike"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 152
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "small"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 153
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "big"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 154
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "blink"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 155
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "sup"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 156
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "sub"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 157
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "fontsize"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 158
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_19
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "fontcolor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 159
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "link"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 160
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "anchor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 161
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "equals"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 162
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "equalsIgnoreCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 163
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "match"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 164
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "search"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 165
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_20
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "replace"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 166
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_21
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "localeCompare"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 167
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleLowerCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 168
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_23
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleUpperCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 169
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_24
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "trim"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 170
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_25
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "trimLeft"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 171
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "trimRight"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 172
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_27
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "includes"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 173
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_28
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "startsWith"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 174
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_29
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "endsWith"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 175
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "normalize"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 176
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "repeat"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 177
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "codePointAt"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 132
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
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
    .end packed-switch
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 535
    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 539
    :goto_0
    return-void

    .line 538
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public toCharSequence()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 514
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
