.class Lorg/mozilla/javascript/NativeArray$3;
.super Ljava/lang/Object;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/NativeArray;->listIterator(I)Ljava/util/ListIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field cursor:I

.field final synthetic this$0:Lorg/mozilla/javascript/NativeArray;

.field final synthetic val$len:I

.field final synthetic val$start:I


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/NativeArray;II)V
    .locals 1

    .prologue
    .line 1851
    iput-object p1, p0, Lorg/mozilla/javascript/NativeArray$3;->this$0:Lorg/mozilla/javascript/NativeArray;

    iput p2, p0, Lorg/mozilla/javascript/NativeArray$3;->val$start:I

    iput p3, p0, Lorg/mozilla/javascript/NativeArray$3;->val$len:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1853
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->val$start:I

    iput v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1890
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .locals 2

    .prologue
    .line 1856
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    iget v1, p0, Lorg/mozilla/javascript/NativeArray$3;->val$len:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasPrevious()Z
    .locals 1

    .prologue
    .line 1867
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 1860
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    iget v1, p0, Lorg/mozilla/javascript/NativeArray$3;->val$len:I

    if-ne v0, v1, :cond_0

    .line 1861
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 1863
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray$3;->this$0:Lorg/mozilla/javascript/NativeArray;

    iget v1, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public nextIndex()I
    .locals 1

    .prologue
    .line 1878
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 1871
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    if-nez v0, :cond_0

    .line 1872
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 1874
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray$3;->this$0:Lorg/mozilla/javascript/NativeArray;

    iget v1, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public previousIndex()I
    .locals 1

    .prologue
    .line 1882
    iget v0, p0, Lorg/mozilla/javascript/NativeArray$3;->cursor:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 1886
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1894
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
