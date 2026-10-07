.class Leu/chainfire/libsuperuser/Shell$Interactive$4;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

.field final synthetic val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

.field final synthetic val$fExitCode:I

.field final synthetic val$fOutput:Ljava/util/List;


# direct methods
.method constructor <init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 1440
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iput-object p2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    iput p3, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fExitCode:I

    iput-object p4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fOutput:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1444
    :try_start_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1445
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    iget v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fExitCode:I

    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fOutput:Ljava/util/List;

    invoke-interface {v0, v1, v2, v3}, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;->onCommandResult(IILjava/util/List;)V

    .line 1447
    :cond_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1448
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1449
    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    iget v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fExitCode:I

    invoke-interface {v0, v1, v2}, Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;->onCommandResult(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1451
    :cond_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1600(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    .line 1453
    return-void

    .line 1451
    :catchall_0
    move-exception v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1600(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    throw v0
.end method
