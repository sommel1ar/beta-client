.class Leu/chainfire/libsuperuser/Shell$Interactive$6;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Leu/chainfire/libsuperuser/Shell$Interactive;->open()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Leu/chainfire/libsuperuser/Shell$Interactive;


# direct methods
.method constructor <init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .locals 0
    .param p1, "this$0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 1540
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLine(Ljava/lang/String;)V
    .locals 5
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 1543
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    monitor-enter v3

    .line 1544
    :try_start_0
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v2

    if-nez v2, :cond_0

    .line 1545
    monitor-exit v3

    .line 1568
    :goto_0
    return-void

    .line 1548
    :cond_0
    move-object v0, p1

    .line 1550
    .local v0, "contentPart":Ljava/lang/String;
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v2

    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 1551
    .local v1, "markerIndex":I
    if-nez v1, :cond_5

    .line 1552
    const/4 v0, 0x0

    .line 1557
    :cond_1
    :goto_1
    if-eqz v0, :cond_3

    .line 1558
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2600(Leu/chainfire/libsuperuser/Shell$Interactive;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1559
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v2, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2000(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)V

    .line 1560
    :cond_2
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2700(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v4

    invoke-static {v2, v0, v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2200(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    .line 1563
    :cond_3
    if-ltz v1, :cond_4

    .line 1564
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v4

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2802(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;

    .line 1565
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2500(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    .line 1567
    :cond_4
    monitor-exit v3

    goto :goto_0

    .end local v0    # "contentPart":Ljava/lang/String;
    .end local v1    # "markerIndex":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 1553
    .restart local v0    # "contentPart":Ljava/lang/String;
    .restart local v1    # "markerIndex":I
    :cond_5
    if-lez v1, :cond_1

    .line 1554
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_1
.end method
