.class Lio/mrarm/mcpelauncher/ErrorActivity$9;
.super Ljava/lang/Object;
.source "ErrorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/ErrorActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V
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
    .line 243
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$9;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 246
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 247
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "package"

    iget-object v3, p0, Lio/mrarm/mcpelauncher/ErrorActivity$9;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v3}, Lio/mrarm/mcpelauncher/ErrorActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 248
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 249
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$9;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v2, v0}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 250
    return-void
.end method
