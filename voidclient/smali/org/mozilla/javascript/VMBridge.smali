.class public abstract Lorg/mozilla/javascript/VMBridge;
.super Ljava/lang/Object;
.source "VMBridge.java"


# static fields
.field static final instance:Lorg/mozilla/javascript/VMBridge;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    invoke-static {}, Lorg/mozilla/javascript/VMBridge;->makeInstance()Lorg/mozilla/javascript/VMBridge;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/VMBridge;->instance:Lorg/mozilla/javascript/VMBridge;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static makeInstance()Lorg/mozilla/javascript/VMBridge;
    .locals 7

    .prologue
    .line 22
    const/4 v5, 0x4

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "org.mozilla.javascript.VMBridge_custom"

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const-string v6, "org.mozilla.javascript.jdk15.VMBridge_jdk15"

    aput-object v6, v3, v5

    const/4 v5, 0x2

    const-string v6, "org.mozilla.javascript.jdk13.VMBridge_jdk13"

    aput-object v6, v3, v5

    const/4 v5, 0x3

    const-string v6, "org.mozilla.javascript.jdk11.VMBridge_jdk11"

    aput-object v6, v3, v5

    .line 28
    .local v3, "classNames":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v3

    if-eq v4, v5, :cond_1

    .line 29
    aget-object v2, v3, v4

    .line 30
    .local v2, "className":Ljava/lang/String;
    invoke-static {v2}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 31
    .local v1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_0

    .line 32
    invoke-static {v1}, Lorg/mozilla/javascript/Kit;->newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/VMBridge;

    .line 33
    .local v0, "bridge":Lorg/mozilla/javascript/VMBridge;
    if-eqz v0, :cond_0

    .line 34
    return-object v0

    .line 28
    .end local v0    # "bridge":Lorg/mozilla/javascript/VMBridge;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 38
    .end local v1    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "className":Ljava/lang/String;
    :cond_1
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Failed to create VMBridge instance"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method protected abstract getContext(Ljava/lang/Object;)Lorg/mozilla/javascript/Context;
.end method

.method protected abstract getCurrentThreadClassLoader()Ljava/lang/ClassLoader;
.end method

.method protected getInterfaceProxyHelper(Lorg/mozilla/javascript/ContextFactory;[Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
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
    .line 102
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v0, "VMBridge.getInterfaceProxyHelper is not supported"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0
.end method

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
    .line 140
    instance-of v2, p3, Lorg/mozilla/javascript/Wrapper;

    if-eqz v2, :cond_1

    .line 141
    check-cast p3, Lorg/mozilla/javascript/Wrapper;

    .end local p3    # "obj":Ljava/lang/Object;
    invoke-interface {p3}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 142
    .local v1, "unwrapped":Ljava/lang/Object;
    const/4 v0, 0x0

    .line 143
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    instance-of v2, v1, Ljava/util/Iterator;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 144
    check-cast v0, Ljava/util/Iterator;

    .line 147
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v1    # "unwrapped":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v0

    .restart local p3    # "obj":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract getThreadContextHelper()Ljava/lang/Object;
.end method

.method protected abstract isVarArgs(Ljava/lang/reflect/Member;)Z
.end method

.method protected newInterfaceProxy(Ljava/lang/Object;Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/InterfaceAdapter;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "proxyHelper"    # Ljava/lang/Object;
    .param p2, "cf"    # Lorg/mozilla/javascript/ContextFactory;
    .param p3, "adapter"    # Lorg/mozilla/javascript/InterfaceAdapter;
    .param p4, "target"    # Ljava/lang/Object;
    .param p5, "topScope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 122
    const-string v0, "VMBridge.newInterfaceProxy is not supported"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method protected abstract setContext(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)V
.end method

.method protected abstract tryToMakeAccessible(Ljava/lang/Object;)Z
.end method
