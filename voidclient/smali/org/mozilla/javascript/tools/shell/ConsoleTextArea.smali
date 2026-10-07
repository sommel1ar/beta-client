.class public Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;
.super Ljavax/swing/JTextArea;
.source "ConsoleTextArea.java"

# interfaces
.implements Ljava/awt/event/KeyListener;
.implements Ljavax/swing/event/DocumentListener;


# static fields
.field static final serialVersionUID:J = 0x76c0dddfb1975581L


# instance fields
.field private console1:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

.field private console2:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

.field private err:Ljava/io/PrintStream;

.field private history:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private historyIndex:I

.field private in:Ljava/io/PipedInputStream;

.field private inPipe:Ljava/io/PrintWriter;

.field private out:Ljava/io/PrintStream;

.field private outputMark:I


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .locals 6
    .param p1, "argv"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 97
    invoke-direct {p0}, Ljavax/swing/JTextArea;-><init>()V

    .line 87
    const/4 v2, -0x1

    iput v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 88
    iput v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    .line 98
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    .line 99
    new-instance v2, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    invoke-direct {v2, p0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;-><init>(Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;)V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->console1:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    .line 100
    new-instance v2, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    invoke-direct {v2, p0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;-><init>(Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;)V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->console2:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    .line 101
    new-instance v2, Ljava/io/PrintStream;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->console1:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    invoke-direct {v2, v3, v4}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->out:Ljava/io/PrintStream;

    .line 102
    new-instance v2, Ljava/io/PrintStream;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->console2:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    invoke-direct {v2, v3, v4}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->err:Ljava/io/PrintStream;

    .line 103
    new-instance v1, Ljava/io/PipedOutputStream;

    invoke-direct {v1}, Ljava/io/PipedOutputStream;-><init>()V

    .line 104
    .local v1, "outPipe":Ljava/io/PipedOutputStream;
    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    .line 105
    new-instance v2, Ljava/io/PipedInputStream;

    invoke-direct {v2}, Ljava/io/PipedInputStream;-><init>()V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->in:Ljava/io/PipedInputStream;

    .line 107
    :try_start_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->in:Ljava/io/PipedInputStream;

    invoke-virtual {v1, v2}, Ljava/io/PipedOutputStream;->connect(Ljava/io/PipedInputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :goto_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v2

    invoke-interface {v2, p0}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 112
    invoke-virtual {p0, p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 113
    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setLineWrap(Z)V

    .line 114
    new-instance v2, Ljava/awt/Font;

    const-string v3, "Monospaced"

    const/16 v4, 0xc

    invoke-direct {v2, v3, v5, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setFont(Ljava/awt/Font;)V

    .line 115
    return-void

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "exc":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized changedUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    .prologue
    .line 257
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public eval(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 142
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 143
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->console1:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->flush()V

    .line 144
    return-void
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->err:Ljava/io/PrintStream;

    return-object v0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->in:Ljava/io/PipedInputStream;

    return-object v0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->out:Ljava/io/PrintStream;

    return-object v0
.end method

.method public declared-synchronized insertUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 3
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    .prologue
    .line 230
    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getLength()I

    move-result v0

    .line 231
    .local v0, "len":I
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getOffset()I

    move-result v1

    .line 232
    .local v1, "off":I
    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    if-le v2, v1, :cond_0

    .line 233
    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    :cond_0
    monitor-exit p0

    return-void

    .line 230
    .end local v0    # "len":I
    .end local v1    # "off":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 6
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 147
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v1

    .line 148
    .local v1, "code":I
    const/16 v4, 0x8

    if-eq v1, v4, :cond_0

    const/16 v4, 0x25

    if-ne v1, v4, :cond_2

    .line 149
    :cond_0
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 150
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 206
    :cond_1
    :goto_0
    return-void

    .line 152
    :cond_2
    const/16 v4, 0x24

    if-ne v1, v4, :cond_5

    .line 153
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v0

    .line 154
    .local v0, "caretPos":I
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    if-ne v0, v4, :cond_3

    .line 155
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_0

    .line 156
    :cond_3
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    if-le v0, v4, :cond_1

    .line 157
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->isControlDown()Z

    move-result v4

    if-nez v4, :cond_1

    .line 158
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->isShiftDown()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 159
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->moveCaretPosition(I)V

    .line 163
    :goto_1
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_0

    .line 161
    :cond_4
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setCaretPosition(I)V

    goto :goto_1

    .line 166
    .end local v0    # "caretPos":I
    :cond_5
    const/16 v4, 0xa

    if-ne v1, v4, :cond_6

    .line 167
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->returnPressed()V

    .line 168
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_0

    .line 169
    :cond_6
    const/16 v4, 0x26

    if-ne v1, v4, :cond_a

    .line 170
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 171
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    if-ltz v4, :cond_9

    .line 172
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    iget-object v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v4, v5, :cond_7

    .line 173
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 175
    :cond_7
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    if-ltz v4, :cond_8

    .line 176
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    iget v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 177
    .local v3, "str":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v4

    invoke-interface {v4}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 178
    .local v2, "len":I
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v3, v4, v2}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 179
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int v0, v4, v5

    .line 180
    .restart local v0    # "caretPos":I
    invoke-virtual {p0, v0, v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->select(II)V

    .line 187
    .end local v0    # "caretPos":I
    .end local v2    # "len":I
    .end local v3    # "str":Ljava/lang/String;
    :goto_2
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto/16 :goto_0

    .line 182
    :cond_8
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    goto :goto_2

    .line 185
    :cond_9
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    goto :goto_2

    .line 188
    :cond_a
    const/16 v4, 0x28

    if-ne v1, v4, :cond_1

    .line 189
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    .line 190
    .restart local v0    # "caretPos":I
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_c

    .line 191
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 192
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    if-gez v4, :cond_b

    const/4 v4, 0x0

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 193
    :cond_b
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v4

    invoke-interface {v4}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 194
    .restart local v2    # "len":I
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    iget-object v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_d

    .line 195
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    iget v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 196
    .restart local v3    # "str":Ljava/lang/String;
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v3, v4, v2}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 197
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int v0, v4, v5

    .line 203
    .end local v2    # "len":I
    .end local v3    # "str":Ljava/lang/String;
    :cond_c
    :goto_3
    invoke-virtual {p0, v0, v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->select(II)V

    .line 204
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto/16 :goto_0

    .line 199
    .restart local v2    # "len":I
    :cond_d
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 200
    const-string v4, ""

    iget v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v4, v5, v2}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->replaceRange(Ljava/lang/String;II)V

    goto :goto_3
.end method

.method public declared-synchronized keyReleased(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 220
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public keyTyped(Ljava/awt/event/KeyEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 209
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyChar()C

    move-result v0

    .line 210
    .local v0, "keyChar":I
    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 211
    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 212
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 217
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v1

    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    if-ge v1, v2, :cond_0

    .line 215
    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setCaretPosition(I)V

    goto :goto_0
.end method

.method public declared-synchronized postUpdateUI()V
    .locals 2

    .prologue
    .line 251
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->requestFocus()V

    .line 252
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setCaret(Ljavax/swing/text/Caret;)V

    .line 253
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->select(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    monitor-exit p0

    return-void

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 4
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    .prologue
    .line 238
    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getLength()I

    move-result v0

    .line 239
    .local v0, "len":I
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getOffset()I

    move-result v1

    .line 240
    .local v1, "off":I
    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    if-le v2, v1, :cond_0

    .line 241
    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    add-int v3, v1, v0

    if-lt v2, v3, :cond_1

    .line 242
    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    sub-int/2addr v2, v0

    iput v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 244
    :cond_1
    :try_start_1
    iput v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 238
    .end local v0    # "len":I
    .end local v1    # "off":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized returnPressed()V
    .locals 8

    .prologue
    .line 119
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v0

    .line 120
    .local v0, "doc":Ljavax/swing/text/Document;
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 121
    .local v2, "len":I
    new-instance v3, Ljavax/swing/text/Segment;

    invoke-direct {v3}, Ljavax/swing/text/Segment;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    .local v3, "segment":Ljavax/swing/text/Segment;
    :try_start_1
    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    iget v5, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    sub-int v5, v2, v5

    invoke-interface {v0, v4, v5, v3}, Ljavax/swing/text/Document;->getText(IILjavax/swing/text/Segment;)V
    :try_end_1
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    :goto_0
    :try_start_2
    iget v4, v3, Ljavax/swing/text/Segment;->count:I

    if-lez v4, :cond_0

    .line 128
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-virtual {v3}, Ljavax/swing/text/Segment;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 131
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    iget-object v5, v3, Ljavax/swing/text/Segment;->array:[C

    iget v6, v3, Ljavax/swing/text/Segment;->offset:I

    iget v7, v3, Ljavax/swing/text/Segment;->count:I

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/PrintWriter;->write([CII)V

    .line 132
    const-string v4, "\n"

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->append(Ljava/lang/String;)V

    .line 133
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v4

    iput v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    .line 134
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 135
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    invoke-virtual {v4}, Ljava/io/PrintWriter;->flush()V

    .line 136
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->console1:Lorg/mozilla/javascript/tools/shell/ConsoleWriter;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 137
    monitor-exit p0

    return-void

    .line 124
    :catch_0
    move-exception v1

    .line 125
    .local v1, "ignored":Ljavax/swing/text/BadLocationException;
    :try_start_3
    invoke-virtual {v1}, Ljavax/swing/text/BadLocationException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 119
    .end local v0    # "doc":Ljavax/swing/text/Document;
    .end local v1    # "ignored":Ljavax/swing/text/BadLocationException;
    .end local v2    # "len":I
    .end local v3    # "segment":Ljavax/swing/text/Segment;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public select(II)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 92
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->requestFocus()V

    .line 93
    invoke-super {p0, p1, p2}, Ljavax/swing/JTextArea;->select(II)V

    .line 94
    return-void
.end method

.method public declared-synchronized write(Ljava/lang/String;)V
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 223
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, p1, v1}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->insert(Ljava/lang/String;I)V

    .line 224
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 225
    .local v0, "len":I
    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    .line 226
    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v1, v2}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->select(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    monitor-exit p0

    return-void

    .line 223
    .end local v0    # "len":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
