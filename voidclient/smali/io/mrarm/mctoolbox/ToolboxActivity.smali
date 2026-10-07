.class public Lio/mrarm/mctoolbox/ToolboxActivity;
.super Lio/mrarm/mcpelauncher/MainActivity;
.source "ToolboxActivity.java"


# static fields
.field public static final BLOCKLAUNCHER_PERMISSION:Ljava/lang/String; = "net.zhuoweizhang.mcpelauncher.ADDON"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MainActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkPermissions()Z
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 22
    const/4 v1, 0x0

    .line 24
    .local v1, "needsBLPerm":Z
    :try_start_0
    invoke-virtual {p0}, Lio/mrarm/mctoolbox/ToolboxActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const-string v6, "net.zhuoweizhang.mcpelauncher"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    if-eqz v5, :cond_0

    .line 25
    const/4 v1, 0x1

    .line 30
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lio/mrarm/mctoolbox/ToolboxActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const-string v6, "net.zhuoweizhang.mcpelauncher.pro"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    if-eqz v5, :cond_1

    .line 31
    const/4 v1, 0x1

    .line 36
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 37
    :try_start_2
    invoke-virtual {p0}, Lio/mrarm/mctoolbox/ToolboxActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const-string v6, "net.zhuoweizhang.mcpelauncher.ADDON"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPermissionInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionInfo;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v5

    if-eqz v5, :cond_4

    move v1, v3

    .line 41
    :cond_2
    :goto_2
    if-eqz v1, :cond_3

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v6, "skipped_perm_blocklauncher"

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 42
    :cond_3
    invoke-super {p0}, Lio/mrarm/mcpelauncher/MainActivity;->checkPermissions()Z

    move-result v4

    .line 57
    :goto_3
    return v4

    :cond_4
    move v1, v4

    .line 37
    goto :goto_2

    .line 38
    :catch_0
    move-exception v2

    .line 39
    .local v2, "t":Ljava/lang/Throwable;
    const/4 v1, 0x0

    goto :goto_2

    .line 43
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_5
    const-string v5, "net.zhuoweizhang.mcpelauncher.ADDON"

    invoke-static {p0, v5}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_6

    .line 44
    new-instance v0, Landroid/content/Intent;

    const-class v5, Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {v0, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    .local v0, "i":Landroid/content/Intent;
    const-string v5, "error_title"

    const v6, 0x7f090032

    invoke-virtual {p0, v6}, Lio/mrarm/mctoolbox/ToolboxActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    const-string v5, "error_desc"

    const v6, 0x7f090033

    invoke-virtual {p0, v6}, Lio/mrarm/mctoolbox/ToolboxActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const-string v5, "action"

    const-string v6, "request_permission"

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string v5, "skippable"

    invoke-virtual {v0, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 49
    const-string v3, "skippable_id"

    const-string v5, "perm_blocklauncher"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    const-string v3, "permission"

    const-string v5, "net.zhuoweizhang.mcpelauncher.ADDON"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    const-string v3, "permission_name"

    const v5, 0x7f090021

    invoke-virtual {p0, v5}, Lio/mrarm/mctoolbox/ToolboxActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    const-string v3, "return_class"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    invoke-virtual {p0, v0}, Lio/mrarm/mctoolbox/ToolboxActivity;->startActivity(Landroid/content/Intent;)V

    .line 54
    invoke-virtual {p0}, Lio/mrarm/mctoolbox/ToolboxActivity;->finish()V

    goto :goto_3

    .line 57
    .end local v0    # "i":Landroid/content/Intent;
    :cond_6
    invoke-super {p0}, Lio/mrarm/mcpelauncher/MainActivity;->checkPermissions()Z

    move-result v4

    goto :goto_3

    .line 32
    :catch_1
    move-exception v5

    goto/16 :goto_1

    .line 26
    :catch_2
    move-exception v5

    goto/16 :goto_0
.end method

.method protected getLaunchActivityClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 62
    const-class v0, Lio/mrarm/mctoolbox/MinecraftActivity;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 17
    invoke-super {p0, p1}, Lio/mrarm/mcpelauncher/MainActivity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    return-void
.end method
