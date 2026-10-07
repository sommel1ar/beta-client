.class final Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;
.super Ljava/lang/Object;
.source "ModPEScriptLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->throwScriptError(Ljava/lang/Throwable;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$brokenScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

.field final synthetic val$ex:Ljava/lang/String;

.field final synthetic val$scriptName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$scriptName:Ljava/lang/String;

    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$ex:Ljava/lang/String;

    iput-object p3, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$brokenScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 207
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 208
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An error has occurred in script "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$scriptName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 209
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$ex:Ljava/lang/String;

    .line 210
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Continue"

    new-instance v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2$1;

    invoke-direct {v3, p0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2$1;-><init>(Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;)V

    .line 211
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 218
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;->val$brokenScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    if-eqz v1, :cond_0

    .line 219
    const-string v1, "Disable script temporarily"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 220
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 221
    return-void
.end method
