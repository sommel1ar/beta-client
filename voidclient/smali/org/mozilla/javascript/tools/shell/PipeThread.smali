.class Lorg/mozilla/javascript/tools/shell/PipeThread;
.super Ljava/lang/Thread;
.source "Global.java"


# instance fields
.field private from:Ljava/io/InputStream;

.field private fromProcess:Z

.field private to:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "fromProcess"    # Z
    .param p2, "from"    # Ljava/io/InputStream;
    .param p3, "to"    # Ljava/io/OutputStream;

    .prologue
    .line 1259
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1260
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/shell/PipeThread;->setDaemon(Z)V

    .line 1261
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/shell/PipeThread;->fromProcess:Z

    .line 1262
    iput-object p2, p0, Lorg/mozilla/javascript/tools/shell/PipeThread;->from:Ljava/io/InputStream;

    .line 1263
    iput-object p3, p0, Lorg/mozilla/javascript/tools/shell/PipeThread;->to:Ljava/io/OutputStream;

    .line 1264
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1269
    :try_start_0
    iget-boolean v1, p0, Lorg/mozilla/javascript/tools/shell/PipeThread;->fromProcess:Z

    iget-object v2, p0, Lorg/mozilla/javascript/tools/shell/PipeThread;->from:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/PipeThread;->to:Ljava/io/OutputStream;

    invoke-static {v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/Global;->pipe(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1273
    return-void

    .line 1270
    :catch_0
    move-exception v0

    .line 1271
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method
