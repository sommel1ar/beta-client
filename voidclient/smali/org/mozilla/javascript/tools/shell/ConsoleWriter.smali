.class Lorg/mozilla/javascript/tools/shell/ConsoleWriter;
.super Ljava/io/OutputStream;
.source "ConsoleTextArea.java"


# instance fields
.field private buffer:Ljava/lang/StringBuffer;

.field private textArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;)V
    .locals 1
    .param p1, "textArea"    # Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->textArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    .line 36
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    .line 37
    return-void
.end method

.method private flushBuffer()V
    .locals 3

    .prologue
    .line 69
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 71
    new-instance v1, Lorg/mozilla/javascript/tools/shell/ConsoleWrite;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->textArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-direct {v1, v2, v0}, Lorg/mozilla/javascript/tools/shell/ConsoleWrite;-><init>(Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;Ljava/lang/String;)V

    invoke-static {v1}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 72
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->flush()V

    .line 66
    return-void
.end method

.method public declared-synchronized flush()V
    .locals 1

    .prologue
    .line 58
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 59
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->flushBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    :cond_0
    monitor-exit p0

    return-void

    .line 58
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write(I)V
    .locals 2
    .param p1, "ch"    # I

    .prologue
    .line 41
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    int-to-char v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 42
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 43
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->flushBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :cond_0
    monitor-exit p0

    return-void

    .line 41
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write([CII)V
    .locals 3
    .param p1, "data"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 48
    monitor-enter p0

    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 49
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    aget-char v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 50
    aget-char v1, p1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 51
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ConsoleWriter;->flushBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 54
    :cond_1
    monitor-exit p0

    return-void

    .line 48
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
