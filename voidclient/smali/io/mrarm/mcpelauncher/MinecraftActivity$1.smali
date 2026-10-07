.class Lio/mrarm/mcpelauncher/MinecraftActivity$1;
.super Ljava/lang/Object;
.source "MinecraftActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/MinecraftActivity;->verifyBackup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/MinecraftActivity;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/MinecraftActivity;

    .prologue
    .line 486
    iput-object p1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 489
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibDependencies:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    new-array v1, v3, [Ljava/io/File;

    .line 490
    .local v1, "files":[Ljava/io/File;
    const/4 v3, 0x0

    iget-object v4, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    iget-object v4, v4, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLib:Ljava/io/File;

    aput-object v4, v1, v3

    .line 491
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibDependencies:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 492
    add-int/lit8 v4, v2, 0x1

    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibDependencies:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    aput-object v3, v1, v4

    .line 491
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 500
    :cond_0
    :try_start_0
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    iget-object v4, p0, Lio/mrarm/mcpelauncher/MinecraftActivity$1;->this$0:Lio/mrarm/mcpelauncher/MinecraftActivity;

    iget-object v4, v4, Lio/mrarm/mcpelauncher/MinecraftActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    iget v4, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    const/4 v5, 0x0

    invoke-static {v3, v4, v5, v1}, Lio/mrarm/mcpelauncher/BackupVersionManager;->createBackupVersion(Landroid/content/Context;ILandroid/content/res/AssetManager;[Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    :goto_1
    return-void

    .line 501
    :catch_0
    move-exception v0

    .line 502
    .local v0, "e2":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 503
    const-string v3, "MinecraftActivity"

    const-string v4, "Backup failed!"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
