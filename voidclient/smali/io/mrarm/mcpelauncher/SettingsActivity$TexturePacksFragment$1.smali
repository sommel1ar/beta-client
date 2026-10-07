.class Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
    .line 423
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$1;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 426
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$1;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    sget v1, Lio/mrarm/mcpelauncher/R$string;->tip_texture_packs_enable:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 427
    return-void
.end method
