.class Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;
.super Ljava/lang/Object;
.source "ModPETextureOverride.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->downloadTexture(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    .prologue
    .line 65
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 68
    const/4 v8, 0x0

    .line 69
    .local v8, "input":Ljava/io/InputStream;
    const/4 v9, 0x0

    .line 70
    .local v9, "output":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 72
    .local v2, "connection":Ljava/net/HttpURLConnection;
    :try_start_0
    new-instance v11, Ljava/net/URL;

    iget-object v12, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$path:Ljava/lang/String;

    invoke-direct {v11, v12}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 73
    .local v11, "url":Ljava/net/URL;
    invoke-virtual {v11}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    .line 74
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->connect()V

    .line 75
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    const/16 v13, 0xc8

    if-eq v12, v13, :cond_3

    .line 76
    new-instance v12, Ljava/lang/RuntimeException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Bad response code: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .end local v11    # "url":Ljava/net/URL;
    :catch_0
    move-exception v5

    .line 93
    .local v5, "e":Ljava/lang/Throwable;
    :goto_0
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v6

    .line 94
    .local v6, "errText":Ljava/lang/String;
    sget-object v12, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v12}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v13, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;

    invoke-direct {v13, p0, v6}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1$1;-><init>(Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;Ljava/lang/String;)V

    invoke-virtual {v12, v13}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    if-eqz v2, :cond_0

    .line 103
    :try_start_2
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 104
    :cond_0
    if-eqz v9, :cond_1

    .line 105
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 106
    :cond_1
    if-eqz v8, :cond_2

    .line 107
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4

    .line 112
    .end local v5    # "e":Ljava/lang/Throwable;
    .end local v6    # "errText":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 78
    .restart local v11    # "url":Ljava/net/URL;
    :cond_3
    :try_start_3
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 79
    iget-object v12, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    iget v13, v12, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->nextFileId:I

    add-int/lit8 v14, v13, 0x1

    iput v14, v12, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->nextFileId:I

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    .line 80
    .local v7, "fileName":Ljava/lang/String;
    new-instance v10, Ljava/io/FileOutputStream;

    new-instance v12, Ljava/io/File;

    iget-object v13, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-virtual {v13}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getSaveDirectory()Ljava/io/File;

    move-result-object v13

    invoke-direct {v12, v13, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v10, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    .end local v9    # "output":Ljava/io/OutputStream;
    .local v10, "output":Ljava/io/OutputStream;
    const/16 v12, 0x1000

    :try_start_4
    new-array v4, v12, [B

    .line 84
    .local v4, "data":[B
    :goto_2
    invoke-virtual {v8, v4}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "count":I
    const/4 v12, -0x1

    if-eq v3, v12, :cond_4

    .line 85
    const/4 v12, 0x0

    invoke-virtual {v10, v4, v12, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2

    .line 92
    .end local v3    # "count":I
    .end local v4    # "data":[B
    :catch_1
    move-exception v5

    move-object v9, v10

    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    goto :goto_0

    .line 88
    .end local v9    # "output":Ljava/io/OutputStream;
    .restart local v3    # "count":I
    .restart local v4    # "data":[B
    .restart local v10    # "output":Ljava/io/OutputStream;
    :cond_4
    const-string v12, "ModPE/TextureOverride"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Downloaded: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$name:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " from "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$path:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    new-instance v1, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    iget-object v12, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$path:Ljava/lang/String;

    invoke-direct {v1, v12, v7}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .local v1, "cacheEntry":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    iget-object v12, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-static {v12}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->access$000(Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;)Ljava/util/HashMap;

    move-result-object v12

    iget-object v13, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->val$path:Ljava/lang/String;

    invoke-virtual {v12, v13, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v12, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;->this$0:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-virtual {v12}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->saveCacheIndex()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 102
    if-eqz v2, :cond_5

    .line 103
    :try_start_5
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 104
    :cond_5
    if-eqz v10, :cond_6

    .line 105
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    .line 106
    :cond_6
    if-eqz v8, :cond_7

    .line 107
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2

    :cond_7
    move-object v9, v10

    .line 109
    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    goto/16 :goto_1

    .line 108
    .end local v9    # "output":Ljava/io/OutputStream;
    .restart local v10    # "output":Ljava/io/OutputStream;
    :catch_2
    move-exception v12

    move-object v9, v10

    .line 110
    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    goto/16 :goto_1

    .line 101
    .end local v1    # "cacheEntry":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    .end local v3    # "count":I
    .end local v4    # "data":[B
    .end local v7    # "fileName":Ljava/lang/String;
    .end local v11    # "url":Ljava/net/URL;
    :catchall_0
    move-exception v12

    .line 102
    :goto_3
    if-eqz v2, :cond_8

    .line 103
    :try_start_6
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 104
    :cond_8
    if-eqz v9, :cond_9

    .line 105
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 106
    :cond_9
    if-eqz v8, :cond_a

    .line 107
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_3

    .line 109
    :cond_a
    :goto_4
    throw v12

    .line 108
    :catch_3
    move-exception v13

    goto :goto_4

    .line 101
    .end local v9    # "output":Ljava/io/OutputStream;
    .restart local v7    # "fileName":Ljava/lang/String;
    .restart local v10    # "output":Ljava/io/OutputStream;
    .restart local v11    # "url":Ljava/net/URL;
    :catchall_1
    move-exception v12

    move-object v9, v10

    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    goto :goto_3

    .line 108
    .end local v7    # "fileName":Ljava/lang/String;
    .end local v11    # "url":Ljava/net/URL;
    .restart local v5    # "e":Ljava/lang/Throwable;
    .restart local v6    # "errText":Ljava/lang/String;
    :catch_4
    move-exception v12

    goto/16 :goto_1
.end method
