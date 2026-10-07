.class Lio/mrarm/mcpelauncher/ErrorActivity$8$1;
.super Ljava/lang/Object;
.source "ErrorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/ErrorActivity$8;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/ErrorActivity$8;)V
    .locals 0
    .param p1, "this$1"    # Lio/mrarm/mcpelauncher/ErrorActivity$8;

    .prologue
    .line 163
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 167
    :try_start_0
    iget-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v6, v6, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v6}, Lio/mrarm/mcpelauncher/ErrorActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const-string v7, "com.mojang.minecraftpe"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 168
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v6, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v6, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 169
    .local v4, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    iget-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v6, v6, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lio/mrarm/mcpelauncher/ErrorActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    const-string v7, "minecraftpe.apk"

    invoke-direct {v3, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 170
    .local v3, "outFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 171
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 172
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cp \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\" \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\"\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$SU;->run(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 173
    .local v5, "suResult":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    .line 174
    new-instance v2, Ljava/io/DataOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v8, v8, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lio/mrarm/mcpelauncher/ErrorActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    const-string v9, "minecraftpe.apk.version"

    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 175
    .local v2, "out2":Ljava/io/DataOutputStream;
    iget v6, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 176
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V

    .line 181
    iget-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v6, v6, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    new-instance v7, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;

    invoke-direct {v7, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$1;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity$8$1;)V

    invoke-virtual {v6, v7}, Lio/mrarm/mcpelauncher/ErrorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 205
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "out2":Ljava/io/DataOutputStream;
    .end local v3    # "outFile":Ljava/io/File;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "suResult":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 178
    .restart local v1    # "info":Landroid/content/pm/PackageInfo;
    .restart local v3    # "outFile":Ljava/io/File;
    .restart local v4    # "path":Ljava/lang/String;
    .restart local v5    # "suResult":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    new-instance v6, Ljava/lang/Exception;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "outFile":Ljava/io/File;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "suResult":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 194
    iget-object v6, p0, Lio/mrarm/mcpelauncher/ErrorActivity$8$1;->this$1:Lio/mrarm/mcpelauncher/ErrorActivity$8;

    iget-object v6, v6, Lio/mrarm/mcpelauncher/ErrorActivity$8;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    new-instance v7, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$2;

    invoke-direct {v7, p0}, Lio/mrarm/mcpelauncher/ErrorActivity$8$1$2;-><init>(Lio/mrarm/mcpelauncher/ErrorActivity$8$1;)V

    invoke-virtual {v6, v7}, Lio/mrarm/mcpelauncher/ErrorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
