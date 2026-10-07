.class public Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;
.super Lorg/mozilla/javascript/tools/shell/SecurityProxy;
.source "JavaPolicySecurity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;,
        Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 107
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/SecurityProxy;-><init>()V

    .line 109
    new-instance v2, Ljava/security/CodeSource;

    move-object v0, v1

    check-cast v0, [Ljava/security/cert/Certificate;

    invoke-direct {v2, v1, v0}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    .line 110
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;Ljava/lang/String;)Ljava/net/URL;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;->getUrlObj(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;Ljava/net/URL;)Ljava/security/ProtectionDomain;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;
    .param p1, "x1"    # Ljava/net/URL;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;->getUrlDomain(Ljava/net/URL;)Ljava/security/ProtectionDomain;

    move-result-object v0

    return-object v0
.end method

.method private getDynamicDomain(Ljava/security/ProtectionDomain;)Ljava/security/ProtectionDomain;
    .locals 3
    .param p1, "staticDomain"    # Ljava/security/ProtectionDomain;

    .prologue
    .line 185
    new-instance v1, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;

    invoke-direct {v1, p1}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;-><init>(Ljava/security/ProtectionDomain;)V

    .line 186
    .local v1, "p":Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;
    new-instance v0, Ljava/security/ProtectionDomain;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Ljava/security/ProtectionDomain;-><init>(Ljava/security/CodeSource;Ljava/security/PermissionCollection;)V

    .line 187
    .local v0, "contextDomain":Ljava/security/ProtectionDomain;
    return-object v0
.end method

.method private getUrlDomain(Ljava/net/URL;)Ljava/security/ProtectionDomain;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 160
    new-instance v0, Ljava/security/CodeSource;

    const/4 v2, 0x0

    check-cast v2, [Ljava/security/cert/Certificate;

    invoke-direct {v0, p1, v2}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    .line 161
    .local v0, "cs":Ljava/security/CodeSource;
    invoke-static {}, Ljava/security/Policy;->getPolicy()Ljava/security/Policy;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/security/Policy;->getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;

    move-result-object v1

    .line 162
    .local v1, "pc":Ljava/security/PermissionCollection;
    new-instance v2, Ljava/security/ProtectionDomain;

    invoke-direct {v2, v0, v1}, Ljava/security/ProtectionDomain;-><init>(Ljava/security/CodeSource;Ljava/security/PermissionCollection;)V

    return-object v2
.end method

.method private getUrlObj(Ljava/lang/String;)Ljava/net/URL;
    .locals 8
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x2f

    .line 136
    :try_start_0
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .local v4, "urlObj":Ljava/net/URL;
    :goto_0
    return-object v4

    .line 137
    .end local v4    # "urlObj":Ljava/net/URL;
    :catch_0
    move-exception v2

    .line 140
    .local v2, "ex":Ljava/net/MalformedURLException;
    const-string v5, "user.dir"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "curDir":Ljava/lang/String;
    const/16 v5, 0x5c

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 142
    const-string v5, "/"

    invoke-virtual {v0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 143
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 146
    :cond_0
    :try_start_1
    new-instance v1, Ljava/net/URL;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 147
    .local v1, "curDirURL":Ljava/net/URL;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v1, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    .restart local v4    # "urlObj":Ljava/net/URL;
    goto :goto_0

    .line 148
    .end local v1    # "curDirURL":Ljava/net/URL;
    .end local v4    # "urlObj":Ljava/net/URL;
    :catch_1
    move-exception v3

    .line 149
    .local v3, "ex2":Ljava/net/MalformedURLException;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can not construct file URL for \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\':"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method protected callProcessFileSecure(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "filename"    # Ljava/lang/String;

    .prologue
    .line 117
    new-instance v0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$1;

    invoke-direct {v0, p0, p3, p1, p2}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$1;-><init>(Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    .line 130
    return-void
.end method

.method public callWithDomain(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1, "securityDomain"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "callable"    # Lorg/mozilla/javascript/Callable;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 198
    move-object v9, p1

    check-cast v9, Ljava/security/ProtectionDomain;

    .line 214
    .local v9, "staticDomain":Ljava/security/ProtectionDomain;
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;->getDynamicDomain(Ljava/security/ProtectionDomain;)Ljava/security/ProtectionDomain;

    move-result-object v7

    .line 215
    .local v7, "dynamicDomain":Ljava/security/ProtectionDomain;
    const/4 v1, 0x1

    new-array v10, v1, [Ljava/security/ProtectionDomain;

    const/4 v1, 0x0

    aput-object v7, v10, v1

    .line 216
    .local v10, "tmp":[Ljava/security/ProtectionDomain;
    new-instance v8, Ljava/security/AccessControlContext;

    invoke-direct {v8, v10}, Ljava/security/AccessControlContext;-><init>([Ljava/security/ProtectionDomain;)V

    .line 218
    .local v8, "restricted":Ljava/security/AccessControlContext;
    new-instance v0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$3;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p2

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$3;-><init>(Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)V

    .line 224
    .local v0, "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/Object;>;"
    invoke-static {v0, v8}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;Ljava/security/AccessControlContext;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lorg/mozilla/javascript/GeneratedClassLoader;
    .locals 2
    .param p1, "parentLoader"    # Ljava/lang/ClassLoader;
    .param p2, "securityDomain"    # Ljava/lang/Object;

    .prologue
    .line 169
    move-object v0, p2

    check-cast v0, Ljava/security/ProtectionDomain;

    .line 170
    .local v0, "domain":Ljava/security/ProtectionDomain;
    new-instance v1, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$2;

    invoke-direct {v1, p0, p1, v0}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$2;-><init>(Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/GeneratedClassLoader;

    return-object v1
.end method

.method public getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "securityDomain"    # Ljava/lang/Object;

    .prologue
    .line 180
    move-object v0, p1

    check-cast v0, Ljava/security/ProtectionDomain;

    .line 181
    .local v0, "staticDomain":Ljava/security/ProtectionDomain;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;->getDynamicDomain(Ljava/security/ProtectionDomain;)Ljava/security/ProtectionDomain;

    move-result-object v1

    return-object v1
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
    .line 22
    const-class v0, Ljava/security/ProtectionDomain;

    return-object v0
.end method
