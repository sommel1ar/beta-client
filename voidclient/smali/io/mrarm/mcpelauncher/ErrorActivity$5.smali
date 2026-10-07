.class Lio/mrarm/mcpelauncher/ErrorActivity$5;
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
    .line 129
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$5;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 132
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$5;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    const-class v2, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 133
    .local v0, "i":Landroid/content/Intent;
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$5;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v1, v0}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 134
    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$5;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V

    .line 135
    return-void
.end method
