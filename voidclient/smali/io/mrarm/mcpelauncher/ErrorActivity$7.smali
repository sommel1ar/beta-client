.class Lio/mrarm/mcpelauncher/ErrorActivity$7;
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
    .line 154
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$7;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 157
    iget-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity$7;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$7;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x99

    invoke-virtual {v0, v1, v2}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 158
    return-void
.end method
