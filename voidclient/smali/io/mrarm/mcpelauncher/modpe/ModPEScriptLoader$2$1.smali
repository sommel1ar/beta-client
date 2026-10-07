.class Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2$1;
.super Ljava/lang/Object;
.source "ModPEScriptLoader.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;

    .prologue
    .line 211
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 214
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$brokenScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$brokenScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->isDisabled:Z

    .line 216
    :cond_0
    return-void
.end method
