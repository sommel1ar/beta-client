.class Lio/mrarm/mcpelauncher/modpe/api/Global$1;
.super Ljava/lang/Object;
.source "Global.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/modpe/api/Global;->print(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/modpe/api/Global;

.field final synthetic val$str:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/modpe/api/Global;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/modpe/api/Global;

    .prologue
    .line 159
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Global$1;->this$0:Lio/mrarm/mcpelauncher/modpe/api/Global;

    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/api/Global$1;->val$str:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 162
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/api/Global$1;->val$str:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 163
    return-void
.end method
