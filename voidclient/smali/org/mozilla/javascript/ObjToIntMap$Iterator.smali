.class public Lorg/mozilla/javascript/ObjToIntMap$Iterator;
.super Ljava/lang/Object;
.source "ObjToIntMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/ObjToIntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Iterator"
.end annotation


# instance fields
.field private cursor:I

.field private keys:[Ljava/lang/Object;

.field master:Lorg/mozilla/javascript/ObjToIntMap;

.field private remaining:I

.field private values:[I


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/ObjToIntMap;)V
    .locals 0
    .param p1, "master"    # Lorg/mozilla/javascript/ObjToIntMap;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->master:Lorg/mozilla/javascript/ObjToIntMap;

    .line 37
    return-void
.end method


# virtual methods
.method public done()Z
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getKey()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 72
    iget-object v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->keys:[Ljava/lang/Object;

    iget v2, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    aget-object v0, v1, v2

    .line 73
    .local v0, "key":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 74
    .end local v0    # "key":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method public getValue()I
    .locals 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->values:[I

    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    aget v0, v0, v1

    return v0
.end method

.method final init([Ljava/lang/Object;[II)V
    .locals 1
    .param p1, "keys"    # [Ljava/lang/Object;
    .param p2, "values"    # [I
    .param p3, "keyCount"    # I

    .prologue
    .line 40
    iput-object p1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->keys:[Ljava/lang/Object;

    .line 41
    iput-object p2, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->values:[I

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    .line 43
    iput p3, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    .line 44
    return-void
.end method

.method public next()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 56
    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    if-ne v1, v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 57
    :cond_0
    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    if-nez v1, :cond_1

    .line 58
    iput v2, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    .line 59
    iput v2, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    .line 69
    :goto_0
    return-void

    .line 61
    :cond_1
    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    .line 62
    :goto_1
    iget-object v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->keys:[Ljava/lang/Object;

    iget v2, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    aget-object v0, v1, v2

    .line 63
    .local v0, "key":Ljava/lang/Object;
    if-eqz v0, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/ObjToIntMap;->access$000()Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 64
    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->remaining:I

    goto :goto_0

    .line 61
    :cond_2
    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    goto :goto_1
.end method

.method public setValue(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->values:[I

    iget v1, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->cursor:I

    aput p1, v0, v1

    .line 83
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->master:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/ObjToIntMap;->initIterator(Lorg/mozilla/javascript/ObjToIntMap$Iterator;)V

    .line 48
    invoke-virtual {p0}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->next()V

    .line 49
    return-void
.end method
