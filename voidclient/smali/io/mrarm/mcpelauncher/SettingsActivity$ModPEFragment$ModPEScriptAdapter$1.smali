.class Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;I)V
    .locals 0
    .param p1, "this$1"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    .prologue
    .line 546
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iput p2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 549
    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->val$position:I

    invoke-virtual {v1, v2}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 550
    .local v0, "f":Ljava/io/File;
    if-eqz p2, :cond_1

    .line 551
    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->access$300(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 552
    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->access$300(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 556
    :cond_0
    :goto_0
    return-void

    .line 554
    :cond_1
    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->access$300(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method
