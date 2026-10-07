.class Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;
.super Ljava/lang/Object;
.source "XboxLoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->FinalNext()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    .prologue
    .line 85
    iput-object p1, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 88
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->ctx:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 89
    .local v0, "dialog":Landroid/app/ProgressDialog;
    const-string v2, "Signing you in to Xbox Live"

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 90
    const-string v2, "Please wait..."

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 91
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 92
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 93
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 94
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;

    invoke-direct {v2, p0, v0}, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;-><init>(Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;Landroid/app/ProgressDialog;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 113
    .local v1, "thread":Ljava/lang/Thread;
    const-string v2, "SignInThread"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 114
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 115
    return-void
.end method
