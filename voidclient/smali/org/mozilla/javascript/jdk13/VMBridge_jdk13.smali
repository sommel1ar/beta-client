.class public Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;
.super Lorg/mozilla/javascript/VMBridge;
.source "VMBridge_jdk13.java"


# instance fields
.field private contextLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/mozilla/javascript/VMBridge;-><init>()V

    .line 21
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;->contextLocal:Ljava/lang/ThreadLocal;

    return-void
.end method


# virtual methods
.method protected getContext(Ljava/lang/Object;)Lorg/mozilla/javascript/Context;
    .locals 2
    .param p1, "contextHelper"    # Ljava/lang/Object;

    .prologue
    .line 46
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "contextHelper":Ljava/lang/Object;
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    .line 47
    .local v0, "storage":[Ljava/lang/Object;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    check-cast v1, Lorg/mozilla/javascript/Context;

    return-object v1
.end method

.method protected getCurrentThreadClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 60
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method protected getInterfaceProxyHelper(Lorg/mozilla/javascript/ContextFactory;[Ljava/lang/Class;)Ljava/lang/Object;
    .locals 7
    .param p1, "cf"    # Lorg/mozilla/javascript/ContextFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/ContextFactory;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 86
    aget-object v4, p2, v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 87
    .local v3, "loader":Ljava/lang/ClassLoader;
    invoke-static {v3, p2}, Ljava/lang/reflect/Proxy;->getProxyClass(Ljava/lang/ClassLoader;[Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    .line 90
    .local v1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x1

    :try_start_0
    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/reflect/InvocationHandler;

    aput-object v6, v4, v5

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 95
    .local v0, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    return-object v0

    .line 91
    .end local v0    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_0
    move-exception v2

    .line 93
    .local v2, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v4, v2}, Lorg/mozilla/javascript/Kit;->initCause(Ljava/lang/RuntimeException;Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method protected getThreadContextHelper()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 35
    iget-object v1, p0, Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;->contextLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 36
    .local v0, "storage":[Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 37
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    .line 38
    iget-object v1, p0, Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;->contextLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 40
    :cond_0
    return-object v0
.end method

.method protected isVarArgs(Ljava/lang/reflect/Member;)Z
    .locals 1
    .param p1, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 152
    const/4 v0, 0x0

    return v0
.end method

.method protected newInterfaceProxy(Ljava/lang/Object;Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/InterfaceAdapter;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 9
    .param p1, "proxyHelper"    # Ljava/lang/Object;
    .param p2, "cf"    # Lorg/mozilla/javascript/ContextFactory;
    .param p3, "adapter"    # Lorg/mozilla/javascript/InterfaceAdapter;
    .param p4, "target"    # Ljava/lang/Object;
    .param p5, "topScope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 105
    move-object v6, p1

    check-cast v6, Ljava/lang/reflect/Constructor;

    .line 107
    .local v6, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-instance v0, Lorg/mozilla/javascript/jdk13/VMBridge_jdk13$1;

    move-object v1, p0

    move-object v2, p4

    move-object v3, p3

    move-object v4, p2

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/jdk13/VMBridge_jdk13$1;-><init>(Lorg/mozilla/javascript/jdk13/VMBridge_jdk13;Ljava/lang/Object;Lorg/mozilla/javascript/InterfaceAdapter;Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Scriptable;)V

    .line 137
    .local v0, "handler":Ljava/lang/reflect/InvocationHandler;
    const/4 v1, 0x1

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-virtual {v6, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v8

    .line 147
    .local v8, "proxy":Ljava/lang/Object;
    return-object v8

    .line 138
    .end local v8    # "proxy":Ljava/lang/Object;
    :catch_0
    move-exception v7

    .line 139
    .local v7, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v7}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 140
    .end local v7    # "ex":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v7

    .line 142
    .local v7, "ex":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v7}, Lorg/mozilla/javascript/Kit;->initCause(Ljava/lang/RuntimeException;Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 143
    .end local v7    # "ex":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v7

    .line 145
    .local v7, "ex":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v7}, Lorg/mozilla/javascript/Kit;->initCause(Ljava/lang/RuntimeException;Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method protected setContext(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)V
    .locals 2
    .param p1, "contextHelper"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 53
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "contextHelper":Ljava/lang/Object;
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    .line 54
    .local v0, "storage":[Ljava/lang/Object;
    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 55
    return-void
.end method

.method protected tryToMakeAccessible(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "accessibleObject"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 66
    instance-of v2, p1, Ljava/lang/reflect/AccessibleObject;

    if-nez v2, :cond_1

    .line 67
    const/4 v1, 0x0

    .line 77
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 69
    check-cast v0, Ljava/lang/reflect/AccessibleObject;

    .line 70
    .local v0, "accessible":Ljava/lang/reflect/AccessibleObject;
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v2

    if-nez v2, :cond_0

    .line 74
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :goto_1
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v1

    goto :goto_0

    .line 75
    :catch_0
    move-exception v1

    goto :goto_1
.end method
