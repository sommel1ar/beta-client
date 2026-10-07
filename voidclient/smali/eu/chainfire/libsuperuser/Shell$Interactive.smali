.class public Leu/chainfire/libsuperuser/Shell$Interactive;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Leu/chainfire/libsuperuser/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Interactive"
.end annotation


# instance fields
.field private STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

.field private STDIN:Ljava/io/DataOutputStream;

.field private STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

.field private final autoHandler:Z

.field private volatile buffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final callbackSync:Ljava/lang/Object;

.field private volatile callbacks:I

.field private volatile closed:Z

.field private volatile command:Leu/chainfire/libsuperuser/Shell$Command;

.field private final commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Leu/chainfire/libsuperuser/Shell$Command;",
            ">;"
        }
    .end annotation
.end field

.field private final environment:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;

.field private volatile idle:Z

.field private final idleSync:Ljava/lang/Object;

.field private volatile lastExitCode:I

.field private volatile lastMarkerSTDERR:Ljava/lang/String;

.field private volatile lastMarkerSTDOUT:Ljava/lang/String;

.field private final onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

.field private final onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

.field private process:Ljava/lang/Process;

.field private volatile running:Z

.field private final shell:Ljava/lang/String;

.field private final wantSTDERR:Z

.field private watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private volatile watchdogCount:I

.field private watchdogTimeout:I


# direct methods
.method private constructor <init>(Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .locals 6
    .param p1, "builder"    # Leu/chainfire/libsuperuser/Shell$Builder;
    .param p2, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    .prologue
    const/4 v0, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1025
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 998
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 999
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    .line 1000
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 1001
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 1002
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1004
    iput-boolean v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1005
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1006
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    .line 1007
    iput v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    .line 1010
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    .line 1011
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    .line 1013
    iput v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    .line 1014
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    .line 1015
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    .line 1016
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1017
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1026
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$100(Leu/chainfire/libsuperuser/Shell$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->autoHandler:Z

    .line 1027
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$200(Leu/chainfire/libsuperuser/Shell$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    .line 1028
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$300(Leu/chainfire/libsuperuser/Shell$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->wantSTDERR:Z

    .line 1029
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$400(Leu/chainfire/libsuperuser/Shell$Builder;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    .line 1030
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$500(Leu/chainfire/libsuperuser/Shell$Builder;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->environment:Ljava/util/Map;

    .line 1031
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$600(Leu/chainfire/libsuperuser/Shell$Builder;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .line 1032
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$700(Leu/chainfire/libsuperuser/Shell$Builder;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .line 1033
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$800(Leu/chainfire/libsuperuser/Shell$Builder;)I

    move-result v0

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    .line 1039
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$900(Leu/chainfire/libsuperuser/Shell$Builder;)Landroid/os/Handler;

    move-result-object v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->autoHandler:Z

    if-eqz v0, :cond_2

    .line 1040
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    .line 1045
    :goto_0
    if-eqz p2, :cond_0

    .line 1048
    const/16 v0, 0x3c

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    .line 1049
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Command;

    sget-object v2, Leu/chainfire/libsuperuser/Shell;->availableTestCommands:[Ljava/lang/String;

    new-instance v3, Leu/chainfire/libsuperuser/Shell$Interactive$1;

    invoke-direct {v3, p0, p1, p2}, Leu/chainfire/libsuperuser/Shell$Interactive$1;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    invoke-direct {v1, v2, v5, v3, v4}, Leu/chainfire/libsuperuser/Shell$Command;-><init>([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    invoke-interface {v0, v5, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1062
    :cond_0
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->open()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_1

    .line 1063
    const/4 v0, -0x3

    invoke-interface {p2, v5, v0, v4}, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;->onCommandResult(IILjava/util/List;)V

    .line 1066
    :cond_1
    return-void

    .line 1042
    :cond_2
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$900(Leu/chainfire/libsuperuser/Shell$Builder;)Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    goto :goto_0
.end method

.method synthetic constructor <init>(Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$1;)V
    .locals 0
    .param p1, "x0"    # Leu/chainfire/libsuperuser/Shell$Builder;
    .param p2, "x1"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    .param p3, "x2"    # Leu/chainfire/libsuperuser/Shell$1;

    .prologue
    .line 987
    invoke-direct {p0, p1, p2}, Leu/chainfire/libsuperuser/Shell$Interactive;-><init>(Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    return-void
.end method

.method static synthetic access$1000(Leu/chainfire/libsuperuser/Shell$Interactive;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1102(Leu/chainfire/libsuperuser/Shell$Interactive;I)I
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # I

    .prologue
    .line 987
    iput p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    return p1
.end method

.method static synthetic access$1200(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->handleWatchdog()V

    return-void
.end method

.method static synthetic access$1600(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->endCallback()V

    return-void
.end method

.method static synthetic access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;
    .locals 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    return-object v0
.end method

.method static synthetic access$2000(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 987
    invoke-direct {p0, p1}, Leu/chainfire/libsuperuser/Shell$Interactive;->addBuffer(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2100(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    .locals 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    return-object v0
.end method

.method static synthetic access$2200(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .prologue
    .line 987
    invoke-direct {p0, p1, p2}, Leu/chainfire/libsuperuser/Shell$Interactive;->processLine(Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    return-void
.end method

.method static synthetic access$2302(Leu/chainfire/libsuperuser/Shell$Interactive;I)I
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # I

    .prologue
    .line 987
    iput p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    return p1
.end method

.method static synthetic access$2402(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 987
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2500(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->processMarker()V

    return-void
.end method

.method static synthetic access$2600(Leu/chainfire/libsuperuser/Shell$Interactive;)Z
    .locals 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->wantSTDERR:Z

    return v0
.end method

.method static synthetic access$2700(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    .locals 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 987
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    return-object v0
.end method

.method static synthetic access$2802(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 987
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    return-object p1
.end method

.method private declared-synchronized addBuffer(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 1409
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 1410
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1412
    :cond_0
    monitor-exit p0

    return-void

    .line 1409
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private endCallback()V
    .locals 2

    .prologue
    .line 1462
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    monitor-enter v1

    .line 1463
    :try_start_0
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    .line 1464
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    if-nez v0, :cond_0

    .line 1465
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1467
    :cond_0
    monitor-exit v1

    .line 1468
    return-void

    .line 1467
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private declared-synchronized handleWatchdog()V
    .locals 6

    .prologue
    .line 1243
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    .line 1268
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1245
    :cond_1
    :try_start_1
    iget v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    if-eqz v1, :cond_0

    .line 1248
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1249
    const/4 v0, -0x2

    .line 1250
    .local v0, "exitCode":I
    const-string v1, "[%s%%] SHELL_DIED"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1258
    :goto_1
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    invoke-direct {p0, v1, v0, v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    .line 1261
    const/4 v1, 0x0

    iput-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1262
    const/4 v1, 0x0

    iput-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1263
    const/4 v1, 0x1

    iput-boolean v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1265
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdown()V

    .line 1266
    const/4 v1, 0x0

    iput-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1267
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->kill()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1243
    .end local v0    # "exitCode":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1251
    :cond_2
    :try_start_2
    iget v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogCount:I

    iget v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    if-lt v1, v2, :cond_0

    .line 1254
    const/4 v0, -0x1

    .line 1255
    .restart local v0    # "exitCode":I
    const-string v1, "[%s%%] WATCHDOG_EXIT"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method private declared-synchronized open()Z
    .locals 12

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1477
    monitor-enter p0

    :try_start_0
    const-string v5, "[%s%%] START"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v11, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v10, v11}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1482
    :try_start_1
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->environment:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 1483
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    iget-object v8, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 1497
    :goto_0
    new-instance v5, Ljava/io/DataOutputStream;

    iget-object v8, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v8}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    .line 1498
    new-instance v5, Leu/chainfire/libsuperuser/StreamGobbler;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 1499
    invoke-virtual {v9}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    new-instance v10, Leu/chainfire/libsuperuser/Shell$Interactive$5;

    invoke-direct {v10, p0}, Leu/chainfire/libsuperuser/Shell$Interactive$5;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    invoke-direct {v5, v8, v9, v10}, Leu/chainfire/libsuperuser/StreamGobbler;-><init>(Ljava/lang/String;Ljava/io/InputStream;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 1539
    new-instance v5, Leu/chainfire/libsuperuser/StreamGobbler;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 1540
    invoke-virtual {v9}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v9

    new-instance v10, Leu/chainfire/libsuperuser/Shell$Interactive$6;

    invoke-direct {v10, p0}, Leu/chainfire/libsuperuser/Shell$Interactive$6;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    invoke-direct {v5, v8, v9, v10}, Leu/chainfire/libsuperuser/StreamGobbler;-><init>(Ljava/lang/String;Ljava/io/InputStream;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 1572
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v5}, Leu/chainfire/libsuperuser/StreamGobbler;->start()V

    .line 1573
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v5}, Leu/chainfire/libsuperuser/StreamGobbler;->start()V

    .line 1575
    const/4 v5, 0x1

    iput-boolean v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1576
    const/4 v5, 0x0

    iput-boolean v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    .line 1578
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v5, v6

    .line 1583
    :goto_1
    monitor-exit p0

    return v5

    .line 1485
    :cond_0
    :try_start_2
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1486
    .local v4, "newEnvironment":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Ljava/lang/System;->getenv()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1487
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->environment:Ljava/util/Map;

    invoke-interface {v4, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1488
    const/4 v3, 0x0

    .line 1489
    .local v3, "i":I
    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v5

    new-array v2, v5, [Ljava/lang/String;

    .line 1490
    .local v2, "env":[Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1491
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "="

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 1492
    add-int/lit8 v3, v3, 0x1

    .line 1493
    goto :goto_2

    .line 1494
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    iget-object v8, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    invoke-virtual {v5, v8, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 1581
    .end local v2    # "env":[Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "newEnvironment":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move v5, v7

    .line 1583
    goto :goto_1

    .line 1477
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V
    .locals 2
    .param p1, "fCommand"    # Leu/chainfire/libsuperuser/Shell$Command;
    .param p2, "fExitCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Leu/chainfire/libsuperuser/Shell$Command;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1428
    .local p3, "fOutput":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1455
    :cond_0
    :goto_0
    return-void

    .line 1431
    :cond_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-nez v0, :cond_3

    .line 1432
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1433
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    invoke-interface {v0, v1, p2, p3}, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;->onCommandResult(IILjava/util/List;)V

    .line 1435
    :cond_2
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1436
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    invoke-interface {v0, v1, p2}, Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;->onCommandResult(II)V

    goto :goto_0

    .line 1439
    :cond_3
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->startCallback()V

    .line 1440
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Interactive$4;

    invoke-direct {v1, p0, p1, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive$4;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private declared-synchronized processLine(Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V
    .locals 4
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "listener"    # Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .prologue
    .line 1381
    monitor-enter p0

    if-eqz p2, :cond_0

    .line 1382
    :try_start_0
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v2, :cond_1

    .line 1383
    move-object v0, p1

    .line 1384
    .local v0, "fLine":Ljava/lang/String;
    move-object v1, p2

    .line 1386
    .local v1, "fListener":Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->startCallback()V

    .line 1387
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    new-instance v3, Leu/chainfire/libsuperuser/Shell$Interactive$3;

    invoke-direct {v3, p0, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive$3;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1401
    .end local v0    # "fLine":Ljava/lang/String;
    .end local v1    # "fListener":Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1398
    :cond_1
    :try_start_1
    invoke-interface {p2, p1}, Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;->onLine(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1381
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized processMarker()V
    .locals 3

    .prologue
    .line 1363
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1364
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1365
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    iget v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    invoke-direct {p0, v0, v1, v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    .line 1366
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->stopWatchdog()V

    .line 1367
    const/4 v0, 0x0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1368
    const/4 v0, 0x0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1369
    const/4 v0, 0x1

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1370
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1372
    :cond_0
    monitor-exit p0

    return-void

    .line 1363
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private runNextCommand()V
    .locals 1

    .prologue
    .line 1233
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand(Z)V

    .line 1234
    return-void
.end method

.method private runNextCommand(Z)V
    .locals 11
    .param p1, "notifyIdle"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v4, 0x0

    .line 1305
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v1

    .line 1306
    .local v1, "running":Z
    if-nez v1, :cond_0

    .line 1307
    iput-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1309
    :cond_0
    if-eqz v1, :cond_6

    iget-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    if-eqz v3, :cond_6

    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_6

    .line 1310
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$Command;

    .line 1311
    .local v0, "command":Leu/chainfire/libsuperuser/Shell$Command;
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1313
    iput-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1314
    iput v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    .line 1315
    iput-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    .line 1316
    iput-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    .line 1318
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1300(Leu/chainfire/libsuperuser/Shell$Command;)[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_5

    .line 1320
    :try_start_0
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1325
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v3}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1328
    :cond_1
    const/4 v3, 0x0

    iput-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1329
    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1330
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->startWatchdog()V

    .line 1331
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1300(Leu/chainfire/libsuperuser/Shell$Command;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    move v3, v4

    :goto_0
    if-ge v3, v6, :cond_2

    aget-object v2, v5, v3

    .line 1332
    .local v2, "write":Ljava/lang/String;
    const-string v4, "[%s+] %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 1333
    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object v2, v7, v8

    .line 1332
    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Leu/chainfire/libsuperuser/Debug;->logCommand(Ljava/lang/String;)V

    .line 1334
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/io/DataOutputStream;->write([B)V

    .line 1331
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1336
    .end local v2    # "write":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "echo "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " $?\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->write([B)V

    .line 1337
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "echo "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " >&2\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->write([B)V

    .line 1338
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1352
    .end local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :cond_3
    :goto_1
    iget-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    if-eqz v3, :cond_4

    if-eqz p1, :cond_4

    .line 1353
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v4

    .line 1354
    :try_start_1
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 1355
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1357
    :cond_4
    return-void

    .line 1343
    .restart local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :cond_5
    invoke-direct {p0, v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand(Z)V

    goto :goto_1

    .line 1345
    .end local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :cond_6
    if-nez v1, :cond_3

    .line 1347
    :goto_2
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 1348
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leu/chainfire/libsuperuser/Shell$Command;

    const/4 v5, -0x2

    invoke-direct {p0, v3, v5, v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    goto :goto_2

    .line 1355
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 1339
    .restart local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private startCallback()V
    .locals 2

    .prologue
    .line 1418
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    monitor-enter v1

    .line 1419
    :try_start_0
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    .line 1420
    monitor-exit v1

    .line 1421
    return-void

    .line 1420
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private startWatchdog()V
    .locals 7

    .prologue
    const-wide/16 v2, 0x1

    .line 1274
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    if-nez v0, :cond_0

    .line 1285
    :goto_0
    return-void

    .line 1277
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogCount:I

    .line 1278
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1279
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Interactive$2;

    invoke-direct {v1, p0}, Leu/chainfire/libsuperuser/Shell$Interactive$2;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v4, v2

    invoke-virtual/range {v0 .. v6}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    goto :goto_0
.end method

.method private stopWatchdog()V
    .locals 1

    .prologue
    .line 1291
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    if-eqz v0, :cond_0

    .line 1292
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    .line 1293
    const/4 v0, 0x0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1295
    :cond_0
    return-void
.end method


# virtual methods
.method public addCommand(Ljava/lang/String;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 1084
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    invoke-virtual {p0, p1, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand(Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1085
    return-void
.end method

.method public addCommand(Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandLineListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    .prologue
    .line 1123
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    .line 1126
    return-void
.end method

.method public addCommand(Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    .prologue
    .line 1102
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1105
    return-void
.end method

.method public addCommand(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1134
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    invoke-virtual {p0, p1, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand(Ljava/util/List;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1135
    return-void
.end method

.method public addCommand(Ljava/util/List;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V
    .locals 1
    .param p2, "code"    # I
    .param p3, "onCommandLineListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1174
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    .line 1175
    return-void
.end method

.method public addCommand(Ljava/util/List;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .locals 1
    .param p2, "code"    # I
    .param p3, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1154
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1155
    return-void
.end method

.method public addCommand([Ljava/lang/String;)V
    .locals 2
    .param p1, "commands"    # [Ljava/lang/String;

    .prologue
    .line 1183
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    invoke-virtual {p0, p1, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1184
    return-void
.end method

.method public declared-synchronized addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V
    .locals 3
    .param p1, "commands"    # [Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandLineListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    .prologue
    .line 1224
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Command;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2, p3}, Leu/chainfire/libsuperuser/Shell$Command;-><init>([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1225
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1226
    monitor-exit p0

    return-void

    .line 1224
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .locals 3
    .param p1, "commands"    # [Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    .prologue
    .line 1203
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Command;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, p3, v2}, Leu/chainfire/libsuperuser/Shell$Command;-><init>([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1204
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1205
    monitor-exit p0

    return-void

    .line 1203
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .locals 7

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1595
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isIdle()Z

    move-result v0

    .line 1597
    .local v0, "_idle":Z
    monitor-enter p0

    .line 1598
    :try_start_0
    iget-boolean v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    if-nez v2, :cond_0

    .line 1599
    monitor-exit p0

    .line 1653
    :goto_0
    return-void

    .line 1600
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1601
    const/4 v2, 0x1

    iput-boolean v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    .line 1602
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1607
    if-nez v0, :cond_1

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->onMainThread()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1608
    const-string v2, "Application attempted to wait for a non-idle shell to close on the main thread"

    invoke-static {v2}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1609
    new-instance v2, Leu/chainfire/libsuperuser/ShellOnMainThreadException;

    const-string v3, "Application attempted to wait for a non-idle shell to close on the main thread"

    invoke-direct {v2, v3}, Leu/chainfire/libsuperuser/ShellOnMainThreadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1602
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 1612
    :cond_1
    if-nez v0, :cond_2

    .line 1613
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->waitForIdle()Z

    .line 1617
    :cond_2
    :try_start_2
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    const-string v3, "exit\n"

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 1618
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1630
    :cond_3
    :try_start_3
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    .line 1638
    :try_start_4
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2

    .line 1642
    :goto_1
    :try_start_5
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v2}, Leu/chainfire/libsuperuser/StreamGobbler;->join()V

    .line 1643
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v2}, Leu/chainfire/libsuperuser/StreamGobbler;->join()V

    .line 1644
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->stopWatchdog()V

    .line 1645
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2

    .line 1652
    :goto_2
    const-string v2, "[%s%%] END"

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1619
    :catch_0
    move-exception v1

    .line 1620
    .local v1, "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "EPIPE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 1624
    throw v1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_2

    .line 1646
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    goto :goto_2

    .line 1648
    :catch_2
    move-exception v2

    goto :goto_2

    .line 1639
    :catch_3
    move-exception v2

    goto :goto_1
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1070
    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    if-nez v0, :cond_0

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1072
    const-string v0, "Application did not close() interactive shell"

    invoke-static {v0}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1073
    new-instance v0, Leu/chainfire/libsuperuser/ShellNotClosedException;

    invoke-direct {v0}, Leu/chainfire/libsuperuser/ShellNotClosedException;-><init>()V

    throw v0

    .line 1075
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 1076
    return-void
.end method

.method public hasHandler()Z
    .locals 1

    .prologue
    .line 1794
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized isIdle()Z
    .locals 2

    .prologue
    .line 1705
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1706
    const/4 v0, 0x1

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1707
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1708
    :try_start_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1709
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1711
    :cond_0
    :try_start_2
    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return v0

    .line 1709
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1705
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isRunning()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1687
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    if-nez v1, :cond_0

    .line 1696
    :goto_0
    return v0

    .line 1691
    :cond_0
    :try_start_0
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v1}, Ljava/lang/Process;->exitValue()I
    :try_end_0
    .catch Ljava/lang/IllegalThreadStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1693
    :catch_0
    move-exception v0

    .line 1696
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public declared-synchronized kill()V
    .locals 2

    .prologue
    .line 1661
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1662
    const/4 v0, 0x1

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1665
    :try_start_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1670
    :goto_0
    :try_start_2
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1675
    :goto_1
    const/4 v0, 0x1

    :try_start_3
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1676
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1677
    :try_start_4
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1678
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1679
    monitor-exit p0

    return-void

    .line 1678
    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 1661
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1671
    :catch_0
    move-exception v0

    goto :goto_1

    .line 1666
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public waitForIdle()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 1747
    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->onMainThread()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1748
    const-string v1, "Application attempted to wait for a shell to become idle on the main thread"

    invoke-static {v1}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1749
    new-instance v1, Leu/chainfire/libsuperuser/ShellOnMainThreadException;

    const-string v2, "Application attempted to wait for a shell to become idle on the main thread"

    invoke-direct {v1, v2}, Leu/chainfire/libsuperuser/ShellOnMainThreadException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1752
    :cond_0
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1753
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v2

    .line 1754
    :goto_0
    :try_start_0
    iget-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v3, :cond_1

    .line 1756
    :try_start_1
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 1757
    :catch_0
    move-exception v0

    .line 1758
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    monitor-exit v2

    .line 1785
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_1
    return v1

    .line 1761
    :cond_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1763
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v2, :cond_3

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    .line 1764
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    .line 1765
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    if-eq v2, v3, :cond_3

    .line 1773
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    monitor-enter v2

    .line 1774
    :goto_2
    :try_start_3
    iget v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-lez v3, :cond_2

    .line 1776
    :try_start_4
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 1777
    :catch_1
    move-exception v0

    .line 1778
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :try_start_5
    monitor-exit v2

    goto :goto_1

    .line 1781
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v1

    .line 1761
    :catchall_1
    move-exception v1

    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1

    .line 1781
    :cond_2
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1785
    :cond_3
    const/4 v1, 0x1

    goto :goto_1
.end method
