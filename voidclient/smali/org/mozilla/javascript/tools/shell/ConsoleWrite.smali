.class Lorg/mozilla/javascript/tools/shell/ConsoleWrite;
.super Ljava/lang/Object;
.source "ConsoleTextArea.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private str:Ljava/lang/String;

.field private textArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;Ljava/lang/String;)V
    .locals 0
    .param p1, "textArea"    # Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWrite;->textArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    .line 21
    iput-object p2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWrite;->str:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 25
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWrite;->textArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWrite;->str:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->write(Ljava/lang/String;)V

    .line 26
    return-void
.end method
