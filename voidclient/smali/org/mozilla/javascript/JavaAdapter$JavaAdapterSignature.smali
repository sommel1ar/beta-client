.class Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;
.super Ljava/lang/Object;
.source "JavaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/JavaAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JavaAdapterSignature"
.end annotation


# instance fields
.field interfaces:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field names:Lorg/mozilla/javascript/ObjToIntMap;

.field superClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Class;[Ljava/lang/Class;Lorg/mozilla/javascript/ObjToIntMap;)V
    .locals 0
    .param p3, "names"    # Lorg/mozilla/javascript/ObjToIntMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/mozilla/javascript/ObjToIntMap;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    .line 31
    iput-object p2, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    .line 32
    iput-object p3, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->names:Lorg/mozilla/javascript/ObjToIntMap;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 38
    instance-of v6, p1, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;

    if-nez v6, :cond_1

    .line 59
    :cond_0
    :goto_0
    return v5

    :cond_1
    move-object v4, p1

    .line 40
    check-cast v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;

    .line 41
    .local v4, "sig":Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;
    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    iget-object v7, v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    if-ne v6, v7, :cond_0

    .line 43
    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    iget-object v7, v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    if-eq v6, v7, :cond_2

    .line 44
    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    array-length v6, v6

    iget-object v7, v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    array-length v7, v7

    if-ne v6, v7, :cond_0

    .line 46
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    array-length v6, v6

    if-ge v1, v6, :cond_2

    .line 47
    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    aget-object v6, v6, v1

    iget-object v7, v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    aget-object v7, v7, v1

    if-ne v6, v7, :cond_0

    .line 46
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 50
    .end local v1    # "i":I
    :cond_2
    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->names:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ObjToIntMap;->size()I

    move-result v6

    iget-object v7, v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->names:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ObjToIntMap;->size()I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 52
    new-instance v2, Lorg/mozilla/javascript/ObjToIntMap$Iterator;

    iget-object v6, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->names:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v2, v6}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;-><init>(Lorg/mozilla/javascript/ObjToIntMap;)V

    .line 53
    .local v2, "iter":Lorg/mozilla/javascript/ObjToIntMap$Iterator;
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->start()V

    :goto_2
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->done()Z

    move-result v6

    if-nez v6, :cond_3

    .line 54
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 55
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->getValue()I

    move-result v0

    .line 56
    .local v0, "arity":I
    iget-object v6, v4, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->names:Lorg/mozilla/javascript/ObjToIntMap;

    add-int/lit8 v7, v0, 0x1

    invoke-virtual {v6, v3, v7}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v6

    if-ne v0, v6, :cond_0

    .line 53
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->next()V

    goto :goto_2

    .line 59
    .end local v0    # "arity":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_3
    const/4 v5, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;->names:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap;->size()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
