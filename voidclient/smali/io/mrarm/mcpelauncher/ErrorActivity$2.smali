.class Lio/mrarm/mcpelauncher/ErrorActivity$2;
.super Ljava/lang/Object;
.source "ErrorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/ErrorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/ErrorActivity;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/ErrorActivity;

    .prologue
    .line 85
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$2;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 88
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$2;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 89
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$2;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$2;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v2}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 90
    .local v0, "i":Landroid/content/Intent;
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$2;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v1, v0}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 92
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$2;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V

    .line 93
    return-void
.end method
