.class Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader;
.super Ljava/lang/ClassLoader;
.source "JavaPolicySecurity.java"

# interfaces
.implements Lorg/mozilla/javascript/GeneratedClassLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Loader"
.end annotation


# instance fields
.field private domain:Ljava/security/ProtectionDomain;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)V
    .locals 0
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "domain"    # Ljava/security/ProtectionDomain;

    .prologue
    .line 31
    if-eqz p1, :cond_0

    .end local p1    # "parent":Ljava/lang/ClassLoader;
    :goto_0
    invoke-direct {p0, p1}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 32
    iput-object p2, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader;->domain:Ljava/security/ProtectionDomain;

    .line 33
    return-void

    .line 31
    .restart local p1    # "parent":Ljava/lang/ClassLoader;
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    goto :goto_0
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
    .line 36
    const/4 v3, 0x0

    array-length v4, p2

    iget-object v5, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader;->domain:Ljava/security/ProtectionDomain;

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
    .line 40
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader;->resolveClass(Ljava/lang/Class;)V

    .line 41
    return-void
.end method
