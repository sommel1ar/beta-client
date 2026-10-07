.class Lorg/mozilla/javascript/ResolvedOverload;
.super Ljava/lang/Object;
.source "NativeJavaMethod.java"


# instance fields
.field final index:I

.field final types:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Ljava/lang/Object;I)V
    .locals 5
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    .line 567
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 568
    iput p2, p0, Lorg/mozilla/javascript/ResolvedOverload;->index:I

    .line 569
    array-length v3, p1

    new-array v3, v3, [Ljava/lang/Class;

    iput-object v3, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    .line 570
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, p1

    .local v2, "l":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 571
    aget-object v0, p1, v1

    .line 572
    .local v0, "arg":Ljava/lang/Object;
    instance-of v3, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v3, :cond_0

    .line 573
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 574
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    if-nez v0, :cond_1

    const/4 v3, 0x0

    :goto_1
    aput-object v3, v4, v1

    .line 570
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 574
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    goto :goto_1

    .line 576
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_2
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 597
    instance-of v2, p1, Lorg/mozilla/javascript/ResolvedOverload;

    if-nez v2, :cond_1

    .line 601
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 600
    check-cast v0, Lorg/mozilla/javascript/ResolvedOverload;

    .line 601
    .local v0, "ovl":Lorg/mozilla/javascript/ResolvedOverload;
    iget-object v2, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    iget-object v3, v0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lorg/mozilla/javascript/ResolvedOverload;->index:I

    iget v3, v0, Lorg/mozilla/javascript/ResolvedOverload;->index:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 606
    iget-object v0, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method matches([Ljava/lang/Object;)Z
    .locals 6
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 579
    array-length v4, p1

    iget-object v5, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    array-length v5, v5

    if-eq v4, v5, :cond_1

    .line 592
    :cond_0
    :goto_0
    return v3

    .line 582
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, p1

    .local v2, "l":I
    :goto_1
    if-ge v1, v2, :cond_5

    .line 583
    aget-object v0, p1, v1

    .line 584
    .local v0, "arg":Ljava/lang/Object;
    instance-of v4, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v4, :cond_2

    .line 585
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 586
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_2
    if-nez v0, :cond_4

    .line 587
    iget-object v4, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    aget-object v4, v4, v1

    if-nez v4, :cond_0

    .line 582
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 588
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iget-object v5, p0, Lorg/mozilla/javascript/ResolvedOverload;->types:[Ljava/lang/Class;

    aget-object v5, v5, v1

    if-eq v4, v5, :cond_3

    goto :goto_0

    .line 592
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_5
    const/4 v3, 0x1

    goto :goto_0
.end method
