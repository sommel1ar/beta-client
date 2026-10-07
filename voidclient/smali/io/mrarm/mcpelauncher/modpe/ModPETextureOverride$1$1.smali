.class Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;
.super Ljava/lang/Object;
.source "ModPETextureOverride.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;

.field final synthetic val$errText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;

    .prologue
    .line 94
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;->this$1:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;

    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;->val$errText:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 97
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to download ModPE texture ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;->this$1:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;->val$errText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 98
    return-void
.end method
