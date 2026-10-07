.class public Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;
.super Ljava/lang/Object;
.source "ModPEScriptInfo.java"


# instance fields
.field public isDisabled:Z

.field public name:Ljava/lang/String;

.field public scope:Lorg/mozilla/javascript/Scriptable;

.field public script:Lorg/mozilla/javascript/Script;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/Script;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)V
    .locals 1
    .param p1, "script"    # Lorg/mozilla/javascript/Script;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->isDisabled:Z

    .line 19
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->script:Lorg/mozilla/javascript/Script;

    .line 20
    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->name:Ljava/lang/String;

    .line 21
    iput-object p3, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 22
    return-void
.end method
