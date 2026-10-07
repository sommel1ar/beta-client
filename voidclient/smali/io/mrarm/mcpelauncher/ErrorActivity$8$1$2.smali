.class Lio/mrarm/mcpelauncher/ErrorActivity$8$1$2;
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
    .line 194
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$2;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 197
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$2;->this$2:Lio/mrarm/mcpelauncher/ErrorActivity$8$1;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lio/mrarm/mcpelauncher/R$string;->extract_with_root_failed_title:I

    .line 198
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lio/mrarm/mcpelauncher/R$string;->extract_with_root_failed_desc:I

    .line 199
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lio/mrarm/mcpelauncher/R$string;->action_ok:I

    const/4 v2, 0x0

    .line 200
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 201
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 202
    return-void
.end method
