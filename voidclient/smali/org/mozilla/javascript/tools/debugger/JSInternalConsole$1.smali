.class Lorg/mozilla/javascript/tools/debugger/JSInternalConsole$1;
.super Ljavax/swing/event/InternalFrameAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;-><init>(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;)V
    .locals 0

    .prologue
    .line 1286
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole$1;->this$0:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-direct {p0}, Ljavax/swing/event/InternalFrameAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public internalFrameActivated(Ljavax/swing/event/InternalFrameEvent;)V
    .locals 2
    .param p1, "e"    # Ljavax/swing/event/InternalFrameEvent;

    .prologue
    .line 1290
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole$1;->this$0:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1291
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole$1;->this$0:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljavax/swing/text/Caret;->setVisible(Z)V

    .line 1292
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole$1;->this$0:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljavax/swing/text/Caret;->setVisible(Z)V

    .line 1294
    :cond_0
    return-void
.end method
