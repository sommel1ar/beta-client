.class public Lorg/mozilla/javascript/jdk15/VMBridge_jdk15;
.super Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;
.source "VMBridge_jdk15.java"


# direct methods
.method public constructor <init>()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;-><init>()V

    .line 22
    :try_start_0
    const-class v2, Ljava/lang/reflect/Method;

    const-string v3, "isVarArgs"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return-void

    .line 23
    :catch_0
    move-exception v0

    .line 26
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/InstantiationException;

    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getJavaIterator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/util/Iterator;
    .locals 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Iterator",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 47
    instance-of v2, p3, Lorg/mozilla/javascript/Wrapper;

    if-eqz v2, :cond_2

    .line 48
    check-cast p3, Lorg/mozilla/javascript/Wrapper;

    .end local p3    # "obj":Ljava/lang/Object;
    invoke-interface {p3}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 49
    .local v1, "unwrapped":Ljava/lang/Object;
    const/4 v0, 0x0

    .line 50
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    instance-of v2, v1, Ljava/util/Iterator;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 51
    check-cast v0, Ljava/util/Iterator;

    .line 52
    :cond_0
    instance-of v2, v1, Ljava/lang/Iterable;

    if-eqz v2, :cond_1

    .line 53
    check-cast v1, Ljava/lang/Iterable;

    .end local v1    # "unwrapped":Ljava/lang/Object;
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 56
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    :goto_0
    return-object v0

    .restart local p3    # "obj":Ljava/lang/Object;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isVarArgs(Ljava/lang/reflect/Member;)Z
    .locals 1
    .param p1, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 32
    instance-of v0, p1, Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 33
    check-cast p1, Ljava/lang/reflect/Method;

    .end local p1    # "member":Ljava/lang/reflect/Member;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->isVarArgs()Z

    move-result v0

    .line 37
    :goto_0
    return v0

    .line 34
    .restart local p1    # "member":Ljava/lang/reflect/Member;
    :cond_0
    instance-of v0, p1, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_1

    .line 35
    check-cast p1, Ljava/lang/reflect/Constructor;

    .end local p1    # "member":Ljava/lang/reflect/Member;
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->isVarArgs()Z

    move-result v0

    goto :goto_0

    .line 37
    .restart local p1    # "member":Ljava/lang/reflect/Member;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
