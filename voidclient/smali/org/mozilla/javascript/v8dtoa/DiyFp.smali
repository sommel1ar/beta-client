.class Lorg/mozilla/javascript/v8dtoa/DiyFp;
.super Ljava/lang/Object;
.source "DiyFp.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final kSignificandSize:I = 0x40

.field static final kUint64MSB:J = -0x8000000000000000L


# instance fields
.field private e:I

.field private f:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    .line 50
    return-void
.end method

.method constructor <init>(JI)V
    .locals 1
    .param p1, "f"    # J
    .param p3, "e"    # I

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-wide p1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    .line 54
    iput p3, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    .line 55
    return-void
.end method

.method static minus(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .locals 4
    .param p0, "a"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p1, "b"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;

    .prologue
    .line 76
    new-instance v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    iget-wide v2, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    invoke-direct {v0, v2, v3, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 77
    .local v0, "result":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->subtract(Lorg/mozilla/javascript/v8dtoa/DiyFp;)V

    .line 78
    return-object v0
.end method

.method static normalize(Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .locals 4
    .param p0, "a"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;

    .prologue
    .line 134
    new-instance v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    iget-wide v2, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    invoke-direct {v0, v2, v3, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 135
    .local v0, "result":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual {v0}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->normalize()V

    .line 136
    return-object v0
.end method

.method static times(Lorg/mozilla/javascript/v8dtoa/DiyFp;Lorg/mozilla/javascript/v8dtoa/DiyFp;)Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .locals 4
    .param p0, "a"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;
    .param p1, "b"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;

    .prologue
    .line 108
    new-instance v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;

    iget-wide v2, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    invoke-direct {v0, v2, v3, v1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;-><init>(JI)V

    .line 109
    .local v0, "result":Lorg/mozilla/javascript/v8dtoa/DiyFp;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->multiply(Lorg/mozilla/javascript/v8dtoa/DiyFp;)V

    .line 110
    return-object v0
.end method

.method private static uint64_gte(JJ)Z
    .locals 6
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 59
    cmp-long v2, p0, p2

    if-eqz v2, :cond_0

    cmp-long v2, p0, p2

    if-lez v2, :cond_2

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


# virtual methods
.method e()I
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    return v0
.end method

.method f()J
    .locals 2

    .prologue
    .line 139
    iget-wide v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    return-wide v0
.end method

.method multiply(Lorg/mozilla/javascript/v8dtoa/DiyFp;)V
    .locals 30
    .param p1, "other"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;

    .prologue
    .line 88
    const-wide v20, 0xffffffffL

    .line 89
    .local v20, "kM32":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    move-wide/from16 v26, v0

    const/16 v28, 0x20

    ushr-long v4, v26, v28

    .line 90
    .local v4, "a":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v10, v26, v28

    .line 91
    .local v10, "b":J
    move-object/from16 v0, p1

    iget-wide v0, v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    move-wide/from16 v26, v0

    const/16 v28, 0x20

    ushr-long v16, v26, v28

    .line 92
    .local v16, "c":J
    move-object/from16 v0, p1

    iget-wide v0, v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    move-wide/from16 v26, v0

    const-wide v28, 0xffffffffL

    and-long v18, v26, v28

    .line 93
    .local v18, "d":J
    mul-long v6, v4, v16

    .line 94
    .local v6, "ac":J
    mul-long v12, v10, v16

    .line 95
    .local v12, "bc":J
    mul-long v8, v4, v18

    .line 96
    .local v8, "ad":J
    mul-long v14, v10, v18

    .line 97
    .local v14, "bd":J
    const/16 v26, 0x20

    ushr-long v26, v14, v26

    const-wide v28, 0xffffffffL

    and-long v28, v28, v8

    add-long v26, v26, v28

    const-wide v28, 0xffffffffL

    and-long v28, v28, v12

    add-long v24, v26, v28

    .line 100
    .local v24, "tmp":J
    const-wide v26, 0x80000000L

    add-long v24, v24, v26

    .line 101
    const/16 v26, 0x20

    ushr-long v26, v8, v26

    add-long v26, v26, v6

    const/16 v28, 0x20

    ushr-long v28, v12, v28

    add-long v26, v26, v28

    const/16 v28, 0x20

    ushr-long v28, v24, v28

    add-long v22, v26, v28

    .line 102
    .local v22, "result_f":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    move/from16 v26, v0

    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x40

    add-int v26, v26, v27

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    .line 103
    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    .line 104
    return-void
.end method

.method normalize()V
    .locals 10

    .prologue
    const-wide/16 v8, 0x0

    .line 114
    sget-boolean v1, Lorg/mozilla/javascript/v8dtoa/DiyFp;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-wide v6, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    cmp-long v1, v6, v8

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 115
    :cond_0
    iget-wide v2, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    .line 116
    .local v2, "f":J
    iget v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    .line 120
    .local v0, "e":I
    const-wide/high16 v4, -0x40000000000000L

    .line 121
    .local v4, "k10MSBits":J
    :goto_0
    const-wide/high16 v6, -0x40000000000000L

    and-long/2addr v6, v2

    cmp-long v1, v6, v8

    if-nez v1, :cond_1

    .line 122
    const/16 v1, 0xa

    shl-long/2addr v2, v1

    .line 123
    add-int/lit8 v0, v0, -0xa

    goto :goto_0

    .line 125
    :cond_1
    :goto_1
    const-wide/high16 v6, -0x8000000000000000L

    and-long/2addr v6, v2

    cmp-long v1, v6, v8

    if-nez v1, :cond_2

    .line 126
    const/4 v1, 0x1

    shl-long/2addr v2, v1

    .line 127
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 129
    :cond_2
    iput-wide v2, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    .line 130
    iput v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    .line 131
    return-void
.end method

.method setE(I)V
    .locals 0
    .param p1, "new_value"    # I

    .prologue
    .line 143
    iput p1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    return-void
.end method

.method setF(J)V
    .locals 1
    .param p1, "new_value"    # J

    .prologue
    .line 142
    iput-wide p1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    return-void
.end method

.method subtract(Lorg/mozilla/javascript/v8dtoa/DiyFp;)V
    .locals 4
    .param p1, "other"    # Lorg/mozilla/javascript/v8dtoa/DiyFp;

    .prologue
    .line 67
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    iget v1, p1, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 68
    :cond_0
    sget-boolean v0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    iget-wide v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    iget-wide v2, p1, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/v8dtoa/DiyFp;->uint64_gte(JJ)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 69
    :cond_1
    iget-wide v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    iget-wide v2, p1, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    .line 70
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[DiyFp f:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->f:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", e:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/mozilla/javascript/v8dtoa/DiyFp;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
