.class Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;
.super Ljava/lang/Object;
.source "XboxLoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;)V
    .locals 0
    .param p1, "this$2"    # Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;

    .prologue
    .line 102
    iput-object p1, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;->this$2:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 105
    iget-object v0, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;->this$2:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->hide()V

    .line 106
    iget-object v0, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;->this$2:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->hasSucceeded:Z

    .line 107
    iget-object v0, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;->this$2:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->ctx:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 108
    return-void
.end method
