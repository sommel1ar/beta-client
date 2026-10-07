.class Lorg/mozilla/javascript/tools/debugger/EvalWindow;
.super Ljavax/swing/JInternalFrame;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = -0x27b2d7ab9161a0b0L


# instance fields
.field private evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/mozilla/javascript/tools/debugger/SwingGui;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "debugGui"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .prologue
    const/4 v2, 0x1

    .line 1228
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Ljavax/swing/JInternalFrame;-><init>(Ljava/lang/String;ZZZZ)V

    .line 1229
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-direct {v0, p2}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    .line 1230
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->setRows(I)V

    .line 1231
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->setColumns(I)V

    .line 1232
    new-instance v6, Ljavax/swing/JScrollPane;

    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-direct {v6, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1233
    .local v6, "scroller":Ljavax/swing/JScrollPane;
    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->setContentPane(Ljava/awt/Container;)V

    .line 1235
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->pack()V

    .line 1236
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->setVisible(Z)V

    .line 1237
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 1254
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1255
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cut"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1256
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->cut()V

    .line 1262
    :cond_0
    :goto_0
    return-void

    .line 1257
    :cond_1
    const-string v1, "Copy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1258
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->copy()V

    goto :goto_0

    .line 1259
    :cond_2
    const-string v1, "Paste"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1260
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->paste()V

    goto :goto_0
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1244
    invoke-super {p0, p1}, Ljavax/swing/JInternalFrame;->setEnabled(Z)V

    .line 1245
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/EvalWindow;->evalTextArea:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->setEnabled(Z)V

    .line 1246
    return-void
.end method
