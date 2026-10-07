.class final Lorg/mozilla/javascript/SecureCaller$2;
.super Ljava/lang/Object;
.source "SecureCaller.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/SecureCaller;->callSecurely(Ljava/security/CodeSource;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedExceptionAction",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$classLoader:Ljava/lang/ClassLoader;

.field final synthetic val$codeSource:Ljava/security/CodeSource;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lorg/mozilla/javascript/SecureCaller$2;->val$classLoader:Ljava/lang/ClassLoader;

    iput-object p2, p0, Lorg/mozilla/javascript/SecureCaller$2;->val$codeSource:Ljava/security/CodeSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 87
    .local v3, "thisClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v4, p0, Lorg/mozilla/javascript/SecureCaller$2;->val$classLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    if-eq v4, v3, :cond_0

    .line 88
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 92
    .local v1, "effectiveClassLoader":Ljava/lang/ClassLoader;
    :goto_0
    new-instance v2, Lorg/mozilla/javascript/SecureCaller$SecureClassLoaderImpl;

    invoke-direct {v2, v1}, Lorg/mozilla/javascript/SecureCaller$SecureClassLoaderImpl;-><init>(Ljava/lang/ClassLoader;)V

    .line 94
    .local v2, "secCl":Lorg/mozilla/javascript/SecureCaller$SecureClassLoaderImpl;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-class v5, Lorg/mozilla/javascript/SecureCaller;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Impl"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lorg/mozilla/javascript/SecureCaller;->access$000()[B

    move-result-object v5

    iget-object v6, p0, Lorg/mozilla/javascript/SecureCaller$2;->val$codeSource:Ljava/security/CodeSource;

    invoke-virtual {v2, v4, v5, v6}, Lorg/mozilla/javascript/SecureCaller$SecureClassLoaderImpl;->defineAndLinkClass(Ljava/lang/String;[BLjava/security/CodeSource;)Ljava/lang/Class;

    move-result-object v0

    .line 97
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 90
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "effectiveClassLoader":Ljava/lang/ClassLoader;
    .end local v2    # "secCl":Lorg/mozilla/javascript/SecureCaller$SecureClassLoaderImpl;
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/SecureCaller$2;->val$classLoader:Ljava/lang/ClassLoader;

    .restart local v1    # "effectiveClassLoader":Ljava/lang/ClassLoader;
    goto :goto_0
.end method
