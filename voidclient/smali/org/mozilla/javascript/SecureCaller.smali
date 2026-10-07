.class public abstract Lorg/mozilla/javascript/SecureCaller;
.super Ljava/lang/Object;
.source "SecureCaller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/SecureCaller$SecureClassLoaderImpl;
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
            "Lorg/mozilla/javascript/SecureCaller;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static final secureCallerImplBytecode:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    invoke-static {}, Lorg/mozilla/javascript/SecureCaller;->loadBytecode()[B

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/SecureCaller;->secureCallerImplBytecode:[B

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/SecureCaller;->callers:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    return-void
.end method

.method static synthetic access$000()[B
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lorg/mozilla/javascript/SecureCaller;->secureCallerImplBytecode:[B

    return-object v0
.end method

.method static synthetic access$100()[B
    .locals 1

    .prologue
    .line 25
    invoke-static {}, Lorg/mozilla/javascript/SecureCaller;->loadBytecodePrivileged()[B

    move-result-object v0

    return-object v0
.end method

.method static callSecurely(Ljava/security/CodeSource;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "codeSource"    # Ljava/security/CodeSource;
    .param p1, "callable"    # Lorg/mozilla/javascript/Callable;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    .line 50
    .local v11, "thread":Ljava/lang/Thread;
    new-instance v2, Lorg/mozilla/javascript/SecureCaller$1;

    invoke-direct {v2, v11}, Lorg/mozilla/javascript/SecureCaller$1;-><init>(Ljava/lang/Thread;)V

    invoke-static {v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/ClassLoader;

    .line 57
    .local v7, "classLoader":Ljava/lang/ClassLoader;
    sget-object v3, Lorg/mozilla/javascript/SecureCaller;->callers:Ljava/util/Map;

    monitor-enter v3

    .line 59
    :try_start_0
    sget-object v2, Lorg/mozilla/javascript/SecureCaller;->callers:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 60
    .local v8, "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;>;"
    if-nez v8, :cond_0

    .line 62
    new-instance v8, Ljava/util/WeakHashMap;

    .end local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;>;"
    invoke-direct {v8}, Ljava/util/WeakHashMap;-><init>()V

    .line 63
    .restart local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;>;"
    sget-object v2, Lorg/mozilla/javascript/SecureCaller;->callers:Ljava/util/Map;

    invoke-interface {v2, p0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    monitor-enter v8

    .line 69
    :try_start_1
    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/ref/SoftReference;

    .line 70
    .local v10, "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;"
    if-eqz v10, :cond_2

    .line 71
    invoke-virtual {v10}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/SecureCaller;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    .local v1, "caller":Lorg/mozilla/javascript/SecureCaller;
    :goto_0
    if-nez v1, :cond_1

    .line 80
    :try_start_2
    new-instance v2, Lorg/mozilla/javascript/SecureCaller$2;

    invoke-direct {v2, v7, p0}, Lorg/mozilla/javascript/SecureCaller$2;-><init>(Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V

    invoke-static {v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lorg/mozilla/javascript/SecureCaller;

    move-object v1, v0

    .line 100
    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v8, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/security/PrivilegedActionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 107
    :cond_1
    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    .line 108
    invoke-virtual/range {v1 .. v6}, Lorg/mozilla/javascript/SecureCaller;->call(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 65
    .end local v1    # "caller":Lorg/mozilla/javascript/SecureCaller;
    .end local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;>;"
    .end local v10    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;"
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 73
    .restart local v8    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;>;"
    .restart local v10    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;"
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "caller":Lorg/mozilla/javascript/SecureCaller;
    goto :goto_0

    .line 102
    :catch_0
    move-exception v9

    .line 104
    .local v9, "ex":Ljava/security/PrivilegedActionException;
    :try_start_5
    new-instance v2, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-virtual {v9}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 107
    .end local v1    # "caller":Lorg/mozilla/javascript/SecureCaller;
    .end local v9    # "ex":Ljava/security/PrivilegedActionException;
    .end local v10    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lorg/mozilla/javascript/SecureCaller;>;"
    :catchall_1
    move-exception v2

    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2
.end method

.method private static loadBytecode()[B
    .locals 1

    .prologue
    .line 128
    new-instance v0, Lorg/mozilla/javascript/SecureCaller$3;

    invoke-direct {v0}, Lorg/mozilla/javascript/SecureCaller$3;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method private static loadBytecodePrivileged()[B
    .locals 7

    .prologue
    .line 139
    const-class v5, Lorg/mozilla/javascript/SecureCaller;

    const-string v6, "SecureCallerImpl.clazz"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    .line 142
    .local v4, "url":Ljava/net/URL;
    :try_start_0
    invoke-virtual {v4}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 145
    .local v2, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 148
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 149
    .local v3, "r":I
    const/4 v5, -0x1

    if-ne v3, v5, :cond_0

    .line 151
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 158
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v5

    .line 153
    :cond_0
    :try_start_3
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 158
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "r":I
    :catchall_0
    move-exception v5

    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v5
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 161
    .end local v2    # "in":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 163
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v5, v1}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method


# virtual methods
.method public abstract call(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
.end method
