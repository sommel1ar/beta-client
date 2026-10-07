.class public Lorg/mozilla/javascript/PolicySecurityController;
.super Lorg/mozilla/javascript/SecurityController;
.source "PolicySecurityController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;,
        Lorg/mozilla/javascript/PolicySecurityController$Loader;
    }
.end annotation


# static fields
.field private static final callers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/security/CodeSource;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static final secureCallerImplBytecode:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lorg/mozilla/javascript/PolicySecurityController;->loadBytecode()[B

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/PolicySecurityController;->secureCallerImplBytecode:[B

    .line 42
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/PolicySecurityController;->callers:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/mozilla/javascript/SecurityController;-><init>()V

    .line 154
    return-void
.end method

.method static synthetic access$000()[B
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lorg/mozilla/javascript/PolicySecurityController;->secureCallerImplBytecode:[B

    return-object v0
.end method

.method private static loadBytecode()[B
    .locals 10

    .prologue
    const/4 v9, 0x6

    const/4 v7, 0x1

    .line 163
    const-class v4, Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 164
    .local v3, "secureCallerClassName":Ljava/lang/String;
    new-instance v1, Lorg/mozilla/classfile/ClassFileWriter;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Impl"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "<generated>"

    invoke-direct {v1, v4, v3, v5}, Lorg/mozilla/classfile/ClassFileWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .local v1, "cfw":Lorg/mozilla/classfile/ClassFileWriter;
    const-string v4, "<init>"

    const-string v5, "()V"

    invoke-virtual {v1, v4, v5, v7}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 168
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 169
    const/16 v4, 0xb7

    const-string v5, "<init>"

    const-string v6, "()V"

    invoke-virtual {v1, v4, v3, v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const/16 v4, 0xb1

    invoke-virtual {v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 172
    invoke-virtual {v1, v7}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 173
    const-string v0, "Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    .line 179
    .local v0, "callableCallSig":Ljava/lang/String;
    const-string v4, "call"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "(Lorg/mozilla/javascript/Callable;"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x11

    invoke-virtual {v1, v4, v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 183
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v9, :cond_0

    .line 184
    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 183
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    :cond_0
    const/16 v4, 0xb9

    const-string v5, "org/mozilla/javascript/Callable"

    const-string v6, "call"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v4, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    const/16 v4, 0xb0

    invoke-virtual {v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 190
    invoke-virtual {v1, v9}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 191
    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public callWithDomain(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1, "securityDomain"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "callable"    # Lorg/mozilla/javascript/Callable;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 101
    new-instance v2, Lorg/mozilla/javascript/PolicySecurityController$2;

    invoke-direct {v2, p0, p2}, Lorg/mozilla/javascript/PolicySecurityController$2;-><init>(Lorg/mozilla/javascript/PolicySecurityController;Lorg/mozilla/javascript/Context;)V

    invoke-static {v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/ClassLoader;

    .local v7, "classLoader":Ljava/lang/ClassLoader;
    move-object v9, p1

    .line 107
    check-cast v9, Ljava/security/CodeSource;

    .line 109
    .local v9, "codeSource":Ljava/security/CodeSource;
    sget-object v3, Lorg/mozilla/javascript/PolicySecurityController;->callers:Ljava/util/Map;

    monitor-enter v3

    .line 110
    :try_start_0
    sget-object v2, Lorg/mozilla/javascript/PolicySecurityController;->callers:Ljava/util/Map;

    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 111
    .local v8, "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;>;"
    if-nez v8, :cond_0

    .line 112
    new-instance v8, Ljava/util/WeakHashMap;

    .end local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;>;"
    invoke-direct {v8}, Ljava/util/WeakHashMap;-><init>()V

    .line 113
    .restart local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;>;"
    sget-object v2, Lorg/mozilla/javascript/PolicySecurityController;->callers:Ljava/util/Map;

    invoke-interface {v2, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    monitor-enter v8

    .line 118
    :try_start_1
    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/ref/SoftReference;

    .line 119
    .local v11, "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;"
    if-eqz v11, :cond_2

    .line 120
    invoke-virtual {v11}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 124
    .local v1, "caller":Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;
    :goto_0
    if-nez v1, :cond_1

    .line 130
    :try_start_2
    new-instance v2, Lorg/mozilla/javascript/PolicySecurityController$3;

    invoke-direct {v2, p0, v7, v9}, Lorg/mozilla/javascript/PolicySecurityController$3;-><init>(Lorg/mozilla/javascript/PolicySecurityController;Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V

    invoke-static {v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;

    move-object v1, v0

    .line 143
    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v8, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/security/PrivilegedActionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 150
    :cond_1
    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v2, p3

    move-object v3, p2

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    .line 151
    invoke-virtual/range {v1 .. v6}, Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;->call(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 115
    .end local v1    # "caller":Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;
    .end local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;>;"
    .end local v11    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;"
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 122
    .restart local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;>;"
    .restart local v11    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;"
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "caller":Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;
    goto :goto_0

    .line 145
    :catch_0
    move-exception v10

    .line 147
    .local v10, "ex":Ljava/security/PrivilegedActionException;
    :try_start_5
    new-instance v2, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-virtual {v10}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 150
    .end local v1    # "caller":Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;
    .end local v10    # "ex":Ljava/security/PrivilegedActionException;
    .end local v11    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;>;"
    :catchall_1
    move-exception v2

    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2
.end method

.method public createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lorg/mozilla/javascript/GeneratedClassLoader;
    .locals 1
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "securityDomain"    # Ljava/lang/Object;

    .prologue
    .line 76
    new-instance v0, Lorg/mozilla/javascript/PolicySecurityController$1;

    invoke-direct {v0, p0, p1, p2}, Lorg/mozilla/javascript/PolicySecurityController$1;-><init>(Lorg/mozilla/javascript/PolicySecurityController;Ljava/lang/ClassLoader;Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/PolicySecurityController$Loader;

    return-object v0
.end method

.method public getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1, "securityDomain"    # Ljava/lang/Object;

    .prologue
    .line 91
    return-object p1
.end method

.method public getStaticSecurityDomainClassInternal()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 47
    const-class v0, Ljava/security/CodeSource;

    return-object v0
.end method
