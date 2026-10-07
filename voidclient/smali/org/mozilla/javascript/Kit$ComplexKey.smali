.class final Lorg/mozilla/javascript/Kit$ComplexKey;
.super Ljava/lang/Object;
.source "Kit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/Kit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ComplexKey"
.end annotation


# instance fields
.field private hash:I

.field private key1:Ljava/lang/Object;

.field private key2:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "key1"    # Ljava/lang/Object;
    .param p2, "key2"    # Ljava/lang/Object;

    .prologue
    .line 332
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 333
    iput-object p1, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->key1:Ljava/lang/Object;

    .line 334
    iput-object p2, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->key2:Ljava/lang/Object;

    .line 335
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "anotherObj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 340
    instance-of v2, p1, Lorg/mozilla/javascript/Kit$ComplexKey;

    if-nez v2, :cond_1

    .line 343
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 342
    check-cast v0, Lorg/mozilla/javascript/Kit$ComplexKey;

    .line 343
    .local v0, "another":Lorg/mozilla/javascript/Kit$ComplexKey;
    iget-object v2, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->key1:Ljava/lang/Object;

    iget-object v3, v0, Lorg/mozilla/javascript/Kit$ComplexKey;->key1:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->key2:Ljava/lang/Object;

    iget-object v3, v0, Lorg/mozilla/javascript/Kit$ComplexKey;->key2:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 349
    iget v0, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->hash:I

    if-nez v0, :cond_0

    .line 350
    iget-object v0, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->key1:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->key2:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->hash:I

    .line 352
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/Kit$ComplexKey;->hash:I

    return v0
.end method
