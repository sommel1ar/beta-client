.class Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$2;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    .prologue
    .line 434
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$2;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 437
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$2;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$2;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    sget v2, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->ACTION_IMPORT:I

    invoke-virtual {v0, v1, v2}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 438
    return-void
.end method
