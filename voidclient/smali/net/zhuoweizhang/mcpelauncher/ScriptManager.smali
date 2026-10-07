.class public Lnet/zhuoweizhang/mcpelauncher/ScriptManager;
.super Ljava/lang/Object;
.source "ScriptManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs callScriptMethod(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 8
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->callVoidCallbacks(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    return-void
.end method
