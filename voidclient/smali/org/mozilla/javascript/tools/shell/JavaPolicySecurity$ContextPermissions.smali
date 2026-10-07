.class Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;
.super Ljava/security/PermissionCollection;
.source "JavaPolicySecurity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ContextPermissions"
.end annotation


# static fields
.field static final serialVersionUID:J = -0x17e3fa1f9ffd0481L


# instance fields
.field _context:Ljava/security/AccessControlContext;

.field _statisPermissions:Ljava/security/PermissionCollection;


# direct methods
.method constructor <init>(Ljava/security/ProtectionDomain;)V
    .locals 1
    .param p1, "staticDomain"    # Ljava/security/ProtectionDomain;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/security/PermissionCollection;-><init>()V

    .line 52
    invoke-static {}, Ljava/security/AccessController;->getContext()Ljava/security/AccessControlContext;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_context:Ljava/security/AccessControlContext;

    .line 53
    if-eqz p1, :cond_0

    .line 54
    invoke-virtual {p1}, Ljava/security/ProtectionDomain;->getPermissions()Ljava/security/PermissionCollection;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    .line 56
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->setReadOnly()V

    .line 57
    return-void
.end method


# virtual methods
.method public add(Ljava/security/Permission;)V
    .locals 2
    .param p1, "permission"    # Ljava/security/Permission;

    .prologue
    .line 61
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "NOT IMPLEMENTED"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public elements()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<",
            "Ljava/security/Permission;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    new-instance v0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions$1;-><init>(Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;)V

    return-object v0
.end method

.method public implies(Ljava/security/Permission;)Z
    .locals 3
    .param p1, "permission"    # Ljava/security/Permission;

    .prologue
    const/4 v1, 0x0

    .line 66
    iget-object v2, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    if-eqz v2, :cond_0

    .line 67
    iget-object v2, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    invoke-virtual {v2, p1}, Ljava/security/PermissionCollection;->implies(Ljava/security/Permission;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 75
    :goto_0
    return v1

    .line 72
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_context:Ljava/security/AccessControlContext;

    invoke-virtual {v2, p1}, Ljava/security/AccessControlContext;->checkPermission(Ljava/security/Permission;)V
    :try_end_0
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    const/4 v1, 0x1

    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "ex":Ljava/security/AccessControlException;
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    const-string v1, " (context="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_context:Ljava/security/AccessControlContext;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, ", static_permitions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 98
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
