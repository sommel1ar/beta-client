.class Leu/chainfire/libsuperuser/Shell$Interactive$5;
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
    .line 1499
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLine(Ljava/lang/String;)V
    .locals 8
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 1502
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    monitor-enter v5

    .line 1503
    :try_start_0
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v4

    if-nez v4, :cond_0

    .line 1504
    monitor-exit v5

    .line 1537
    :goto_0
    return-void

    .line 1507
    :cond_0
    move-object v0, p1

    .line 1508
    .local v0, "contentPart":Ljava/lang/String;
    const/4 v3, 0x0

    .line 1510
    .local v3, "markerPart":Ljava/lang/String;
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v4

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 1511
    .local v2, "markerIndex":I
    if-nez v2, :cond_4

    .line 1512
    const/4 v0, 0x0

    .line 1513
    move-object v3, p1

    .line 1519
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 1520
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v4, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2000(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)V

    .line 1521
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2100(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v6

    invoke-static {v4, v0, v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2200(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    .line 1522
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v6

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v6

    invoke-static {v4, v0, v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2200(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1525
    :cond_2
    if-eqz v3, :cond_3

    .line 1527
    :try_start_1
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    .line 1528
    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v6

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0xa

    .line 1527
    invoke-static {v6, v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v4, v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2302(Leu/chainfire/libsuperuser/Shell$Interactive;I)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1533
    :goto_2
    :try_start_2
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v6

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2402(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;

    .line 1534
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$5;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2500(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    .line 1536
    :cond_3
    monitor-exit v5

    goto :goto_0

    .end local v0    # "contentPart":Ljava/lang/String;
    .end local v2    # "markerIndex":I
    .end local v3    # "markerPart":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 1514
    .restart local v0    # "contentPart":Ljava/lang/String;
    .restart local v2    # "markerIndex":I
    .restart local v3    # "markerPart":Ljava/lang/String;
    :cond_4
    if-lez v2, :cond_1

    .line 1515
    const/4 v4, 0x0

    :try_start_3
    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1516
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 1529
    :catch_0
    move-exception v1

    .line 1531
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2
.end method
