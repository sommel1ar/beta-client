.class public Lorg/mozilla/javascript/v8dtoa/DoubleHelper;
.super Ljava/lang/Object;
.source "DoubleHelper.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final kDenormalExponent:I = -0x432

.field private static final kExponentBias:I = 0x433

.field static final kExponentMask:J = 0x7ff0000000000000L

.field static final kHiddenBit:J = 0x10000000000000L

.field static final kSignMask:J = -0x8000000000000000L

.field static final kSignificandMask:J = 0xfffffffffffffL

.field private static final kSignificandSize:I = 0x34


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static asDiyFp(J)Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .locals 4
    .param p0, "d64"    # J

    .prologue
    .line 42
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->isSpecial(J)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 43
    :cond_0
    new-instance v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->significand(J)J

    move-result-wide v2

    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->exponent(J)I

    move-result v1

    invoke-direct {v0, v2, v3, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    return-object v0
.end method

.method static asNormalizedDiyFp(J)Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .locals 8
    .param p0, "d64"    # J

    .prologue
    const-wide/16 v6, 0x0

    .line 48
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->significand(J)J

    move-result-wide v2

    .line 49
    .local v2, "f":J
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->exponent(J)I

    move-result v0

    .line 51
    .local v0, "e":I
    sget-boolean v1, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    cmp-long v1, v2, v6

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 54
    :cond_0
    :goto_0
    const-wide/high16 v4, 0x10000000000000L

    and-long/2addr v4, v2

    cmp-long v1, v4, v6

    if-nez v1, :cond_1

    .line 55
    const/4 v1, 0x1

    shl-long/2addr v2, v1

    .line 56
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 59
    :cond_1
    const/16 v1, 0xb

    shl-long/2addr v2, v1

    .line 60
    add-int/lit8 v0, v0, -0xb

    .line 61
    new-instance v1, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-direct {v1, v2, v3, v0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    return-object v1
.end method

.method static exponent(J)I
    .locals 6
    .param p0, "d64"    # J

    .prologue
    .line 65
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->isDenormal(J)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, -0x432

    .line 68
    :goto_0
    return v1

    .line 67
    :cond_0
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long/2addr v2, p0

    const/16 v1, 0x34

    ushr-long/2addr v2, v1

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v0, v2

    .line 68
    .local v0, "biased_e":I
    add-int/lit16 v1, v0, -0x433

    goto :goto_0
.end method

.method static isDenormal(J)Z
    .locals 4
    .param p0, "d64"    # J

    .prologue
    .line 82
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isInfinite(J)Z
    .locals 4
    .param p0, "d64"    # J

    .prologue
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 98
    and-long v0, p0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-wide v0, 0xfffffffffffffL

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isNan(J)Z
    .locals 4
    .param p0, "d64"    # J

    .prologue
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 92
    and-long v0, p0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-wide v0, 0xfffffffffffffL

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isSpecial(J)Z
    .locals 4
    .param p0, "d64"    # J

    .prologue
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 88
    and-long v0, p0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static normalizedBoundaries(JLorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)V
    .locals 10
    .param p0, "d64"    # J
    .param p2, "m_minus"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p3, "m_plus"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;

    .prologue
    const-wide/16 v8, 0x1

    const/4 v2, 0x1

    .line 112
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->asDiyFp(J)Lorg/mozilla/javascript/v8dtoa/DiyFp;

    move-result-object v1

    .line 113
    .local v1, "v":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    const-wide/high16 v6, 0x10000000000000L

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    move v0, v2

    .line 114
    .local v0, "significand_is_zero":Z
    :goto_0
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    shl-long/2addr v4, v2

    add-long/2addr v4, v8

    invoke-virtual {p3, v4, v5}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 115
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p3, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 116
    invoke-virtual {p3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->normalize()V

    .line 117
    if-eqz v0, :cond_1

    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v3

    const/16 v4, -0x432

    if-eq v3, v4, :cond_1

    .line 124
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    const/4 v4, 0x2

    shl-long/2addr v2, v4

    sub-long/2addr v2, v8

    invoke-virtual {p2, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 125
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-virtual {p2, v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 130
    :goto_1
    invoke-virtual {p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    invoke-virtual {p2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v4

    invoke-virtual {p3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v5

    sub-int/2addr v4, v5

    shl-long/2addr v2, v4

    invoke-virtual {p2, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 131
    invoke-virtual {p3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    invoke-virtual {p2, v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    .line 132
    return-void

    .line 113
    .end local v0    # "significand_is_zero":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 127
    .restart local v0    # "significand_is_zero":Z
    :cond_1
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    shl-long v2, v4, v2

    sub-long/2addr v2, v8

    invoke-virtual {p2, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setF(J)V

    .line 128
    invoke-virtual {v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p2, v2}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->setE(I)V

    goto :goto_1
.end method

.method static sign(J)I
    .locals 4
    .param p0, "d64"    # J

    .prologue
    .line 104
    const-wide/high16 v0, -0x8000000000000000L

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method static significand(J)J
    .locals 4
    .param p0, "d64"    # J

    .prologue
    .line 72
    const-wide v2, 0xfffffffffffffL

    and-long v0, p0, v2

    .line 73
    .local v0, "significand":J
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleHelper;->isDenormal(J)Z

    move-result v2

    if-nez v2, :cond_0

    .line 74
    const-wide/high16 v2, 0x10000000000000L

    add-long/2addr v0, v2

    .line 76
    .end local v0    # "significand":J
    :cond_0
    return-wide v0
.end method
