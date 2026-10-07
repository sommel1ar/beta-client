.class Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;
.super Ljava/lang/Object;
.source "ShellConsole.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field private completeMethod:Ljava/lang/reflect/Method;

.field private global:Lorg/mozilla/javascript/Scriptable;


# direct methods
.method constructor <init>(Ljava/lang/Class;Lorg/mozilla/javascript/Scriptable;)V
    .locals 4
    .param p2, "global"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/mozilla/javascript/Scriptable;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 422
    .local p1, "completorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 423
    iput-object p2, p0, Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;->global:Lorg/mozilla/javascript/Scriptable;

    .line 424
    const-string v0, "complete"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-class v3, Ljava/util/List;

    aput-object v3, v1, v2

    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;->completeMethod:Ljava/lang/reflect/Method;

    .line 426
    return-void
.end method


# virtual methods
.method public complete(Ljava/lang/String;ILjava/util/List;)I
    .locals 12
    .param p1, "buffer"    # Ljava/lang/String;
    .param p2, "cursor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 445
    .local p3, "candidates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    add-int/lit8 v5, p2, -0x1

    .line 446
    .local v5, "m":I
    :goto_0
    if-ltz v5, :cond_0

    .line 447
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 448
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v10

    if-nez v10, :cond_1

    const/16 v10, 0x2e

    if-eq v0, v10, :cond_1

    .line 452
    .end local v0    # "c":C
    :cond_0
    add-int/lit8 v10, v5, 0x1

    invoke-virtual {p1, v10, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 453
    .local v7, "namesAndDots":Ljava/lang/String;
    const-string v10, "\\."

    const/4 v11, -0x1

    invoke-virtual {v7, v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    .line 454
    .local v6, "names":[Ljava/lang/String;
    iget-object v8, p0, Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;->global:Lorg/mozilla/javascript/Scriptable;

    .line 455
    .local v8, "obj":Lorg/mozilla/javascript/Scriptable;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v10, v6

    add-int/lit8 v10, v10, -0x1

    if-ge v1, v10, :cond_3

    .line 456
    aget-object v10, v6, v1

    iget-object v11, p0, Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;->global:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v8, v10, v11}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v9

    .line 457
    .local v9, "val":Ljava/lang/Object;
    instance-of v10, v9, Lorg/mozilla/javascript/Scriptable;

    if-eqz v10, :cond_2

    move-object v8, v9

    .line 458
    check-cast v8, Lorg/mozilla/javascript/Scriptable;

    .line 455
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 450
    .end local v1    # "i":I
    .end local v6    # "names":[Ljava/lang/String;
    .end local v7    # "namesAndDots":Ljava/lang/String;
    .end local v8    # "obj":Lorg/mozilla/javascript/Scriptable;
    .end local v9    # "val":Ljava/lang/Object;
    .restart local v0    # "c":C
    :cond_1
    add-int/lit8 v5, v5, -0x1

    .line 451
    goto :goto_0

    .line 460
    .end local v0    # "c":C
    .restart local v1    # "i":I
    .restart local v6    # "names":[Ljava/lang/String;
    .restart local v7    # "namesAndDots":Ljava/lang/String;
    .restart local v8    # "obj":Lorg/mozilla/javascript/Scriptable;
    .restart local v9    # "val":Ljava/lang/Object;
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    .line 477
    .end local v9    # "val":Ljava/lang/Object;
    :goto_2
    return v10

    .line 463
    :cond_3
    instance-of v10, v8, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v10, :cond_5

    move-object v10, v8

    check-cast v10, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v10}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v3

    .line 466
    .local v3, "ids":[Ljava/lang/Object;
    :goto_3
    array-length v10, v6

    add-int/lit8 v10, v10, -0x1

    aget-object v4, v6, v10

    .line 467
    .local v4, "lastPart":Ljava/lang/String;
    const/4 v1, 0x0

    :goto_4
    array-length v10, v3

    if-ge v1, v10, :cond_8

    .line 468
    aget-object v10, v3, v1

    instance-of v10, v10, Ljava/lang/String;

    if-nez v10, :cond_6

    .line 467
    :cond_4
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 463
    .end local v3    # "ids":[Ljava/lang/Object;
    .end local v4    # "lastPart":Ljava/lang/String;
    :cond_5
    invoke-interface {v8}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v3

    goto :goto_3

    .line 470
    .restart local v3    # "ids":[Ljava/lang/Object;
    .restart local v4    # "lastPart":Ljava/lang/String;
    :cond_6
    aget-object v2, v3, v1

    check-cast v2, Ljava/lang/String;

    .line 471
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 472
    invoke-interface {v8, v2, v8}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v10

    instance-of v10, v10, Lorg/mozilla/javascript/Function;

    if-eqz v10, :cond_7

    .line 473
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 474
    :cond_7
    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 477
    .end local v2    # "id":Ljava/lang/String;
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v11

    sub-int/2addr v10, v11

    goto :goto_2
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 430
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;->completeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v1}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 431
    const/4 v1, 0x0

    aget-object v1, p3, v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x1

    aget-object v2, p3, v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v2, 0x2

    aget-object v2, p3, v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {p0, v1, v3, v2}, Lorg/mozilla/javascript/tools/shell/FlexibleCompletor;->complete(Ljava/lang/String;ILjava/util/List;)I

    move-result v0

    .line 433
    .local v0, "result":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 435
    .end local v0    # "result":I
    :cond_0
    new-instance v1, Ljava/lang/NoSuchMethodError;

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v1
.end method
