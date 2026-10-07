.class public Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;
.super Ljava/lang/Object;
.source "FastDtoaBuilder.java"


# static fields
.field static final digits:[C


# instance fields
.field final chars:[C

.field end:I

.field formatted:Z

.field point:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 108
    const/16 v0, 0xa

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->digits:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/16 v0, 0x19

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    .line 15
    iput v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    .line 17
    iput-boolean v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->formatted:Z

    return-void
.end method

.method private toExponentialFormat(II)V
    .locals 10
    .param p1, "firstDigit"    # I
    .param p2, "decPoint"    # I

    .prologue
    .line 80
    iget v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int/2addr v6, p1

    const/4 v7, 0x1

    if-le v6, v7, :cond_0

    .line 82
    add-int/lit8 v2, p1, 0x1

    .line 83
    .local v2, "dot":I
    iget-object v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget-object v7, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    add-int/lit8 v8, v2, 0x1

    iget v9, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int/2addr v9, v2

    invoke-static {v6, v2, v7, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    iget-object v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    const/16 v7, 0x2e

    aput-char v7, v6, v2

    .line 85
    iget v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    .line 87
    .end local v2    # "dot":I
    :cond_0
    iget-object v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v7, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    const/16 v8, 0x65

    aput-char v8, v6, v7

    .line 88
    const/16 v5, 0x2b

    .line 89
    .local v5, "sign":C
    add-int/lit8 v3, p2, -0x1

    .line 90
    .local v3, "exp":I
    if-gez v3, :cond_1

    .line 91
    const/16 v5, 0x2d

    .line 92
    neg-int v3, v3

    .line 94
    :cond_1
    iget-object v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v7, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    aput-char v5, v6, v7

    .line 96
    const/16 v6, 0x63

    if-le v3, v6, :cond_2

    iget v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v0, v6, 0x2

    .line 97
    .local v0, "charPos":I
    :goto_0
    add-int/lit8 v6, v0, 0x1

    iput v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    .line 101
    :goto_1
    rem-int/lit8 v4, v3, 0xa

    .line 102
    .local v4, "r":I
    iget-object v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    add-int/lit8 v1, v0, -0x1

    .end local v0    # "charPos":I
    .local v1, "charPos":I
    sget-object v7, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->digits:[C

    aget-char v7, v7, v4

    aput-char v7, v6, v0

    .line 103
    div-int/lit8 v3, v3, 0xa

    .line 104
    if-nez v3, :cond_4

    .line 106
    return-void

    .line 96
    .end local v1    # "charPos":I
    .end local v4    # "r":I
    :cond_2
    const/16 v6, 0x9

    if-le v3, v6, :cond_3

    iget v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v0, v6, 0x1

    goto :goto_0

    :cond_3
    iget v0, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    goto :goto_0

    .restart local v1    # "charPos":I
    .restart local v4    # "r":I
    :cond_4
    move v0, v1

    .line 105
    .end local v1    # "charPos":I
    .restart local v0    # "charPos":I
    goto :goto_1
.end method

.method private toFixedFormat(II)V
    .locals 8
    .param p1, "firstDigit"    # I
    .param p2, "decPoint"    # I

    .prologue
    const/16 v7, 0x2e

    const/16 v4, 0x30

    .line 54
    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    iget v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    if-ge v1, v2, :cond_3

    .line 56
    if-lez p2, :cond_1

    .line 58
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    iget-object v3, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v4, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    add-int/lit8 v4, v4, 0x1

    iget v5, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    iget v6, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    sub-int/2addr v5, v6

    invoke-static {v1, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    aput-char v7, v1, v2

    .line 60
    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 63
    :cond_1
    add-int/lit8 v1, p1, 0x2

    sub-int v0, v1, p2

    .line 64
    .local v0, "target":I
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget-object v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v3, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int/2addr v3, p1

    invoke-static {v1, p1, v2, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    aput-char v4, v1, p1

    .line 66
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    add-int/lit8 v2, p1, 0x1

    aput-char v7, v1, v2

    .line 67
    if-gez p2, :cond_2

    .line 68
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    add-int/lit8 v2, p1, 0x2

    invoke-static {v1, v2, v0, v4}, Ljava/util/Arrays;->fill([CIIC)V

    .line 70
    :cond_2
    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    rsub-int/lit8 v2, p2, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    goto :goto_0

    .line 72
    .end local v0    # "target":I
    :cond_3
    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    iget v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    if-le v1, v2, :cond_0

    .line 74
    iget-object v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    iget v3, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->fill([CIIC)V

    .line 75
    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    iget v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    iget v3, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    sub-int/2addr v2, v3

    add-int/2addr v1, v2

    iput v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    goto :goto_0
.end method


# virtual methods
.method append(C)V
    .locals 3
    .param p1, "c"    # C

    .prologue
    .line 20
    iget-object v0, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    aput-char p1, v0, v1

    .line 21
    return-void
.end method

.method decreaseLast()V
    .locals 3

    .prologue
    .line 24
    iget-object v0, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    add-int/lit8 v1, v1, -0x1

    aget-char v2, v0, v1

    add-int/lit8 v2, v2, -0x1

    int-to-char v2, v2

    aput-char v2, v0, v1

    .line 25
    return-void
.end method

.method public format()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 38
    iget-boolean v4, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->formatted:Z

    if-nez v4, :cond_1

    .line 40
    iget-object v4, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    aget-char v4, v4, v3

    const/16 v5, 0x2d

    if-ne v4, v5, :cond_2

    move v1, v2

    .line 41
    .local v1, "firstDigit":I
    :goto_0
    iget v4, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    sub-int v0, v4, v1

    .line 42
    .local v0, "decPoint":I
    const/4 v4, -0x5

    if-lt v0, v4, :cond_0

    const/16 v4, 0x15

    if-le v0, v4, :cond_3

    .line 43
    :cond_0
    invoke-direct {p0, v1, v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->toExponentialFormat(II)V

    .line 47
    :goto_1
    iput-boolean v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->formatted:Z

    .line 49
    .end local v0    # "decPoint":I
    .end local v1    # "firstDigit":I
    :cond_1
    new-instance v2, Ljava/lang/String;

    iget-object v4, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    iget v5, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    invoke-direct {v2, v4, v3, v5}, Ljava/lang/String;-><init>([CII)V

    return-object v2

    :cond_2
    move v1, v3

    .line 40
    goto :goto_0

    .line 45
    .restart local v0    # "decPoint":I
    .restart local v1    # "firstDigit":I
    :cond_3
    invoke-direct {p0, v1, v0}, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->toFixedFormat(II)V

    goto :goto_1
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    .line 29
    iput-boolean v0, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->formatted:Z

    .line 30
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[chars:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->chars:[C

    const/4 v3, 0x0

    iget v4, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->end:I

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", point:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/FastDtoaBuilder;->point:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
