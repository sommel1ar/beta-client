.class Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;
.super Ljava/lang/Object;
.source "ErrorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/ErrorActivity$8$1;)V
    .locals 0
    .param p1, "this$2"    # Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    .prologue
    .line 181
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 184
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 185
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v2}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 186
    .local v0, "i":Landroid/content/Intent;
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v1, v0}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 188
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V

    .line 189
    return-void
.end method
