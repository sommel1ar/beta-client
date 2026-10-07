.class public Lio/mrarm/mctoolbox/MinecraftActivity;
.super Lio/mrarm/mcpelauncher/MinecraftActivity;
.source "MinecraftActivity.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 84
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lio/mrarm/mctoolbox/MinecraftActivity;)V
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mctoolbox/MinecraftActivity;

    .prologue
    return-void
.end method

.method public static onLeaveGame()V
    .locals 0

    .prologue
    return-void
.end method


# virtual methods
.method protected applyPatches()V
    .locals 0

    .prologue
    .line 64
    invoke-super {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->applyPatches()V

    .line 66
    invoke-virtual {p0}, Lio/mrarm/mctoolbox/MinecraftActivity;->initMod()V

    .line 67
    return-void
.end method

.method native initMod()V
.end method

.method protected loadNativeModLibraries()V
    .locals 4

    .prologue
    .line 71
    invoke-super {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->loadNativeModLibraries()V

    .line 72
    const-string v0, "toolbox"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Lio/mrarm/mctoolbox/MinecraftActivity;->nativeModLibs:Ljava/util/ArrayList;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mctoolbox/MinecraftActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const-string v3, "libtoolbox.so"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    invoke-super {p0, p1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public showAd()V
    .locals 0

    .prologue
    return-void
.end method
