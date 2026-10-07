.class Lio/mrarm/mcpelauncher/ErrorActivity$4;
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
    .line 118
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$4;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 121
    iget-object v0, p0, Lio/mrarm/mcpelauncher/ErrorActivity$4;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$200(Lio/mrarm/mcpelauncher/ErrorActivity;)V

    .line 122
    return-void
.end method
