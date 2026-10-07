.class public Lorg/mozilla/javascript/commonjs/module/RequireBuilder;
.super Ljava/lang/Object;
.source "RequireBuilder.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private moduleScriptProvider:Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

.field private postExec:Lorg/mozilla/javascript/Script;

.field private preExec:Lorg/mozilla/javascript/Script;

.field private sandboxed:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->sandboxed:Z

    return-void
.end method


# virtual methods
.method public createRequire(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/commonjs/module/Require;
    .locals 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "globalScope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 91
    new-instance v0, Lorg/mozilla/javascript/commonjs/module/Require;

    iget-object v3, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->moduleScriptProvider:Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    iget-object v4, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->preExec:Lorg/mozilla/javascript/Script;

    iget-object v5, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->postExec:Lorg/mozilla/javascript/Script;

    iget-boolean v6, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->sandboxed:Z

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/commonjs/module/Require;-><init>(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;Lorg/mozilla/javascript/Script;Lorg/mozilla/javascript/Script;Z)V

    return-object v0
.end method

.method public setModuleScriptProvider(Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;)Lorg/mozilla/javascript/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "moduleScriptProvider"    # Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->moduleScriptProvider:Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    .line 43
    return-object p0
.end method

.method public setPostExec(Lorg/mozilla/javascript/Script;)Lorg/mozilla/javascript/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "postExec"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->postExec:Lorg/mozilla/javascript/Script;

    .line 54
    return-object p0
.end method

.method public setPreExec(Lorg/mozilla/javascript/Script;)Lorg/mozilla/javascript/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "preExec"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->preExec:Lorg/mozilla/javascript/Script;

    .line 65
    return-object p0
.end method

.method public setSandboxed(Z)Lorg/mozilla/javascript/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "sandboxed"    # Z

    .prologue
    .line 77
    iput-boolean p1, p0, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->sandboxed:Z

    .line 78
    return-object p0
.end method
