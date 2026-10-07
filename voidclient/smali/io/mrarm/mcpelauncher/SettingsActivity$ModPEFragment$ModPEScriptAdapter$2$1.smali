.class Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;)V
    .locals 0
    .param p1, "this$2"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    .prologue
    .line 562
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 565
    if-nez p2, :cond_1

    .line 566
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->access$300(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->access$400(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget v2, v2, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->val$position:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 567
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->access$300(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->access$400(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget v2, v2, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->val$position:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 568
    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->access$400(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->val$position:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 569
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->access$400(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->val$position:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 570
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;->this$2:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->access$500(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->notifyDataSetChanged()V

    .line 572
    :cond_1
    return-void
.end method
