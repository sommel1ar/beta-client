.class Lorg/mozilla/javascript/tools/debugger/RunProxy;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field static final ENTER_INTERRUPT:I = 0x4

.field static final LOAD_FILE:I = 0x2

.field static final OPEN_FILE:I = 0x1

.field static final UPDATE_SOURCE_TEXT:I = 0x3


# instance fields
.field alertMessage:Ljava/lang/String;

.field private debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field fileName:Ljava/lang/String;

.field lastFrame:Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;

.field sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

.field text:Ljava/lang/String;

.field threadTitle:Ljava/lang/String;

.field private type:I


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;I)V
    .locals 0
    .param p1, "debugGui"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;
    .param p2, "type"    # I

    .prologue
    .line 3500
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3501
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 3502
    iput p2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->type:I

    .line 3503
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 3509
    iget v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->type:I

    packed-switch v2, :pswitch_data_0

    .line 3545
    new-instance v2, Ljava/lang/IllegalArgumentException;

    iget v3, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->type:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 3512
    :pswitch_0
    :try_start_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v2, v2, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->text:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/mozilla/javascript/tools/debugger/Dim;->compileScript(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3548
    :cond_0
    :goto_0
    return-void

    .line 3513
    :catch_0
    move-exception v0

    .line 3514
    .local v0, "ex":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error Compiling "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v6}, Lorg/mozilla/javascript/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 3522
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    :pswitch_1
    :try_start_1
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v2, v2, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->text:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/mozilla/javascript/tools/debugger/Dim;->evalScript(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 3523
    :catch_1
    move-exception v0

    .line 3524
    .restart local v0    # "ex":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Run error for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v6}, Lorg/mozilla/javascript/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 3532
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    :pswitch_2
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v1

    .line 3533
    .local v1, "fileName":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->updateFileWindow(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "<stdin>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3535
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->createFileWindow(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;I)V

    goto :goto_0

    .line 3541
    .end local v1    # "fileName":Ljava/lang/String;
    :pswitch_3
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->lastFrame:Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->threadTitle:Ljava/lang/String;

    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->alertMessage:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->enterInterruptImpl(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3509
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
