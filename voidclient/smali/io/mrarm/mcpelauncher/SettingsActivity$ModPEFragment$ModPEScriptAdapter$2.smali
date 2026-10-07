.class Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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
    .line 558
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iput p2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    .line 561
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v1, v1, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 562
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    new-array v1, v5, [Ljava/lang/CharSequence;

    const/4 v2, 0x0

    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;->this$1:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    sget v4, Lio/mrarm/mcpelauncher/R$string;->action_delete:I

    invoke-virtual {v3, v4}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    new-instance v2, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;

    invoke-direct {v2, p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2$1;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 574
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 575
    return v5
.end method
