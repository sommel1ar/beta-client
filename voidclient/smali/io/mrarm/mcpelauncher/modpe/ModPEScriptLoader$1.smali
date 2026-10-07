.class final Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;
.super Ljava/lang/Object;
.source "ModPEScriptLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptViaThread(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$code:Ljava/lang/String;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;->val$name:Ljava/lang/String;

    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;->val$code:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 106
    :try_start_0
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;->val$name:Ljava/lang/String;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;->val$code:Ljava/lang/String;

    invoke-static {v1, v2}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScript(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_0
    return-void

    .line 107
    :catch_0
    move-exception v0

    .line 108
    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->access$002(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    goto :goto_0
.end method
