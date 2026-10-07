.class public Lorg/mozilla/javascript/DefiningClassLoader;
.super Ljava/lang/ClassLoader;
.source "DefiningClassLoader.java"

# interfaces
.implements Lorg/mozilla/javascript/GeneratedClassLoader;


# instance fields
.field private final parentLoader:Ljava/lang/ClassLoader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "parentLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/mozilla/javascript/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    .line 21
    return-void
.end method


# virtual methods
.method public defineClass(Ljava/lang/String;[B)Ljava/lang/Class;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 27
    const/4 v3, 0x0

    array-length v4, p2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/SecurityUtilities;->getProtectionDomain(Ljava/lang/Class;)Ljava/security/ProtectionDomain;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-super/range {v0 .. v5}, Ljava/lang/ClassLoader;->defineClass(Ljava/lang/String;[BIILjava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public linkClass(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/DefiningClassLoader;->resolveClass(Ljava/lang/Class;)V

    .line 33
    return-void
.end method

.method public loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "resolve"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/DefiningClassLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 40
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_0

    .line 41
    iget-object v1, p0, Lorg/mozilla/javascript/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_2

    .line 42
    iget-object v1, p0, Lorg/mozilla/javascript/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 47
    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    .line 48
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/DefiningClassLoader;->resolveClass(Ljava/lang/Class;)V

    .line 50
    :cond_1
    return-object v0

    .line 44
    :cond_2
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/DefiningClassLoader;->findSystemClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method
