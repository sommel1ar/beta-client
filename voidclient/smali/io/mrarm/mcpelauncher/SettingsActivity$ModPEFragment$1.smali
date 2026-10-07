.class Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    .prologue
    .line 644
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$1;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 647
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$1;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$1;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    sget v2, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->ACTION_IMPORT:I

    invoke-virtual {v0, v1, v2}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 648
    return-void
.end method
