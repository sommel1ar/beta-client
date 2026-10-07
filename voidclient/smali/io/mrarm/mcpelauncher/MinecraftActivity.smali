.class public Lio/mrarm/mcpelauncher/MinecraftActivity;
.super Lcom/mojang/minecraftpe/MainActivity;
.source "MinecraftActivity.java"


# static fields
.field public static instance:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lio/mrarm/mcpelauncher/MinecraftActivity;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field backupAssets:Lio/mrarm/mcpelauncher/ZipAssets;

.field backupFile:Ljava/util/zip/ZipFile;

.field blockAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

.field crashLock:Ljava/io/File;

.field fallbackAssets:Lio/mrarm/mcpelauncher/ZipAssets;

.field forceDisableLivePatching:Z

.field isVRMode:Z

.field itemsAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

.field livePatchingPossible:Z

.field mcpeLib:Ljava/io/File;

.field mcpeLibDependencies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field mcpeLibrariesDir:Ljava/io/File;

.field mcpeVersion:Lio/mrarm/mcpelauncher/Version;

.field minecraftContext:Landroid/content/Context;

.field modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

.field protected nativeModLibs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field packageInfo:Landroid/content/pm/PackageInfo;

.field proxyClassLoader:Ljava/lang/ClassLoader;

.field proxyPackageManager:Lio/mrarm/mcpelauncher/ProxyPackageManager;

.field runFromBackup:Z

.field texturePacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/mcpelauncher/MinecraftAssets;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0}, Lcom/mojang/minecraftpe/MainActivity;-><init>()V

    .line 59
    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->forceDisableLivePatching:Z

    .line 60
    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->livePatchingPossible:Z

    .line 61
    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->runFromBackup:Z

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->texturePacks:Ljava/util/ArrayList;

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->isVRMode:Z

    return-void
.end method

.method public static getMCPEPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    const-string v0, "com.mojang.minecraftpe"

    return-object v0
.end method

.method private getTexturePackPaths()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 407
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 408
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getZipTexturePackPaths()Ljava/util/Set;

    move-result-object v1

    .line 409
    .local v1, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v3, "texture_packs_enabled"

    const/4 v4, 0x0

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    .line 410
    .local v2, "set2":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    .line 411
    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 412
    :cond_0
    return-object v1
.end method

.method public static getVRHeadQuaternion()[F
    .locals 2

    .prologue
    .line 582
    const/4 v1, 0x4

    new-array v0, v1, [F

    .line 585
    .local v0, "quaternion":[F
    return-object v0
.end method

.method private initPatching()V
    .locals 6

    .prologue
    .line 525
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->loadNativeModLibraries()V

    .line 526
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->nativeModLibs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 527
    .local v0, "f":Ljava/io/File;
    const-string v3, "MinecraftActivity/Patch"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Trying to patch lib: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    sget v4, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_READ_ADD_WRITE:I

    invoke-static {v3, v4}, Lio/mrarm/mcpelauncher/CUtils;->setLibProtectionMode(Ljava/lang/String;I)Z

    .line 529
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lio/mrarm/mcpelauncher/CUtils;->addLibToPatchList(Ljava/lang/String;)Z

    goto :goto_0

    .line 532
    .end local v0    # "f":Ljava/io/File;
    :cond_0
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLib:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/mrarm/mcpelauncher/CUtils;->addLibToPatchList(Ljava/lang/String;)Z

    .line 533
    const/4 v1, 0x1

    .line 534
    .local v1, "relroPatching":Z
    const-string v2, "libminecraftpe.so"

    sget v3, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_READ_ADD_WRITE:I

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/CUtils;->setLibProtectionMode(Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 535
    const/4 v1, 0x0

    .line 536
    const-string v2, "MinecraftActivity/Patch"

    const-string v3, "Failed to allow patching of read-only (no exec) sections, stuff are going to be broken."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    :cond_1
    iget-boolean v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->forceDisableLivePatching:Z

    if-nez v2, :cond_2

    const-string v2, "libminecraftpe.so"

    sget v3, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_EXEC_ADD_WRITE:I

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/CUtils;->setLibProtectionMode(Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_5

    .line 539
    :cond_2
    const/4 v2, 0x0

    iput-boolean v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->livePatchingPossible:Z

    .line 540
    const-string v2, "MinecraftActivity/Patch"

    const-string v3, "Failed to enable full patching (exec+write), some stuff may be broken"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    const-string v2, "libminecraftpe.so"

    sget v3, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_EXEC_TO_WRITE:I

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/CUtils;->setLibProtectionMode(Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_3

    .line 542
    const-string v2, "MinecraftActivity/Patch"

    const-string v3, "Failed to init patching, stuff are going to be most likely broken"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 543
    :cond_3
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->applyPatches()V

    .line 544
    const-string v2, "libminecraftpe.so"

    sget v3, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_EXEC_RESTORE:I

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/CUtils;->setLibProtectionMode(Ljava/lang/String;I)Z

    .line 546
    if-eqz v1, :cond_4

    .line 547
    const-string v2, "MinecraftActivity/Patch"

    const-string v3, "Initial patching done, further patching will be impossible"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    :cond_4
    :goto_1
    return-void

    .line 550
    :cond_5
    if-eqz v1, :cond_6

    .line 551
    const-string v2, "MinecraftActivity/Patch"

    const-string v3, "Patching initialized successfully (full mode)"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 553
    :cond_6
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->livePatchingPossible:Z

    .line 554
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->applyPatches()V

    goto :goto_1
.end method

.method private loadFromBackup()V
    .locals 4

    .prologue
    .line 381
    :try_start_0
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->openBackupFile(Landroid/content/Context;)Ljava/util/zip/ZipFile;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupFile:Ljava/util/zip/ZipFile;

    .line 382
    iget-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupFile:Ljava/util/zip/ZipFile;

    invoke-static {p0, v1}, Lio/mrarm/mcpelauncher/BackupVersionManager;->extractBackupLibraries(Landroid/content/Context;Ljava/util/zip/ZipFile;)V

    .line 383
    new-instance v1, Lio/mrarm/mcpelauncher/ZipAssets;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupFile:Ljava/util/zip/ZipFile;

    const-string v3, "assets/"

    invoke-direct {v1, v2, v3}, Lio/mrarm/mcpelauncher/ZipAssets;-><init>(Ljava/util/zip/ZipFile;Ljava/lang/String;)V

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupAssets:Lio/mrarm/mcpelauncher/ZipAssets;

    .line 385
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getTemporaryLibrariesDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    invoke-direct {p0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->setNativeLibrariesDir(Ljava/io/File;)V

    new-instance v1, Lio/mrarm/mcpelauncher/Version;

    const/4 v2, 0x0

    const/16 v3, 0xf

    const/16 v0, 0xa

    invoke-direct {v1, v2, v3, v0}, Lio/mrarm/mcpelauncher/Version;-><init>(III)V

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeVersion:Lio/mrarm/mcpelauncher/Version;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    :goto_0
    return-void

    .line 386
    :catch_0
    move-exception v0

    .line 387
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 388
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->finish()V

    goto :goto_0
.end method

.method private loadFromPackage()V
    .locals 4

    .prologue
    .line 394
    :try_start_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "com.mojang.minecraftpe"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    .line 395
    new-instance v1, Lio/mrarm/mcpelauncher/Version;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-direct {v1, v2}, Lio/mrarm/mcpelauncher/Version;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeVersion:Lio/mrarm/mcpelauncher/Version;

    .line 397
    const-string v1, "com.mojang.minecraftpe"

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Lio/mrarm/mcpelauncher/MinecraftActivity;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->minecraftContext:Landroid/content/Context;

    .line 399
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->setNativeLibrariesDir(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    :goto_0
    return-void

    .line 400
    :catch_0
    move-exception v0

    .line 401
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 402
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->finish()V

    goto :goto_0
.end method

.method private setNativeLibrariesDir(Ljava/io/File;)V
    .locals 5
    .param p1, "base"    # Ljava/io/File;

    .prologue
    .line 468
    iput-object p1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibrariesDir:Ljava/io/File;

    .line 469
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibDependencies:Ljava/util/ArrayList;

    .line 470
    new-instance v0, Ljava/io/File;

    const-string v2, "libminecraftpe.so"

    invoke-direct {v0, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 471
    .local v0, "orgMcpeLib":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "libminecraftpe.so"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 472
    .local v1, "targetMcpeLib":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "libgnustl_shared.so"

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 473
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/prepatch/PrepatchUtils;->patchSoname(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 474
    const-string v2, "MinecraftActivity"

    const-string v3, "Using a patched lib"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLib:Ljava/io/File;

    .line 480
    :goto_0
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibDependencies:Ljava/util/ArrayList;

    new-instance v3, Ljava/io/File;

    const-string v4, "libfmod.so"

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    return-void

    .line 477
    :cond_0
    iput-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLib:Ljava/io/File;

    goto :goto_0
.end method

.method private verifyBackup()V
    .locals 4

    .prologue
    .line 485
    :try_start_0
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {p0, v2}, Lio/mrarm/mcpelauncher/BackupVersionManager;->hasBackupVersion(Landroid/content/Context;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 486
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lio/mrarm/mcpelauncher/MinecraftActivity$1;

    invoke-direct {v2, p0}, Lio/mrarm/mcpelauncher/MinecraftActivity$1;-><init>(Lio/mrarm/mcpelauncher/MinecraftActivity;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 508
    .local v1, "thread":Ljava/lang/Thread;
    const-string v2, "Backup Thread"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 509
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 515
    .end local v1    # "thread":Ljava/lang/Thread;
    :cond_0
    :goto_0
    return-void

    .line 511
    :catch_0
    move-exception v0

    .line 512
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "MinecraftActivity"

    const-string v3, "Failed to create backup version"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected applyPatches()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 560
    invoke-static {}, Lio/mrarm/mcpelauncher/CUtils;->patchAssetManager()V

    .line 562
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeVersion:Lio/mrarm/mcpelauncher/Version;

    if-eqz v2, :cond_2

    .line 563
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeVersion:Lio/mrarm/mcpelauncher/Version;

    iget v2, v2, Lio/mrarm/mcpelauncher/Version;->major:I

    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeVersion:Lio/mrarm/mcpelauncher/Version;

    iget v3, v3, Lio/mrarm/mcpelauncher/Version;->minor:I

    iget-object v4, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeVersion:Lio/mrarm/mcpelauncher/Version;

    iget v4, v4, Lio/mrarm/mcpelauncher/Version;->build:I

    invoke-static {v2, v3, v4}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->nativeInit(III)V

    .line 567
    :goto_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 568
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "win10_guis"

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 571
    :cond_0
    const-string v2, "pixel_scale"

    const-string v3, "-1"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 572
    .local v1, "scale":I
    if-lez v1, :cond_1

    .line 573
    int-to-float v2, v1

    invoke-static {v2}, Lio/mrarm/mcpelauncher/CUtils;->setPixelScale(F)V

    .line 579
    :cond_1
    return-void

    .line 565
    .end local v0    # "prefs":Landroid/content/SharedPreferences;
    .end local v1    # "scale":I
    :cond_2
    invoke-static {v5, v5, v5}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->nativeInit(III)V

    goto :goto_0
.end method

.method public buildModPETextureAtlases()V
    .locals 5

    .prologue
    .line 446
    :try_start_0
    new-instance v2, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    const-string v3, "resourcepacks/vanilla/resources.json"

    invoke-virtual {p0, v3}, Lio/mrarm/mcpelauncher/MinecraftActivity;->openAssetFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    .line 447
    new-instance v2, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    const-string v3, "resourcepacks/vanilla/images/terrain_texture.json"

    invoke-virtual {p0, v3}, Lio/mrarm/mcpelauncher/MinecraftActivity;->openAssetFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->blockAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    .line 448
    new-instance v2, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    const-string v3, "resourcepacks/vanilla/images/item_texture.json"

    invoke-virtual {p0, v3}, Lio/mrarm/mcpelauncher/MinecraftActivity;->openAssetFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->itemsAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    .line 449
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->texturePacks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftAssets;

    .line 450
    .local v0, "assets":Lio/mrarm/mcpelauncher/MinecraftAssets;
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    const-string v4, "images/terrain-atlas/"

    invoke-interface {v0, v4}, Lio/mrarm/mcpelauncher/MinecraftAssets;->list(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->addTexture(Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/util/List;)V

    .line 451
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    const-string v4, "images/items-opaque/"

    invoke-interface {v0, v4}, Lio/mrarm/mcpelauncher/MinecraftAssets;->list(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->addTexture(Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/util/List;)V

    .line 452
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->blockAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    const-string v4, "images/terrain-atlas/"

    invoke-interface {v0, v4}, Lio/mrarm/mcpelauncher/MinecraftAssets;->list(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->addTexture(Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/util/List;)V

    .line 453
    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->itemsAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    const-string v4, "images/items-opaque/"

    invoke-interface {v0, v4}, Lio/mrarm/mcpelauncher/MinecraftAssets;->list(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->addTexture(Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 458
    .end local v0    # "assets":Lio/mrarm/mcpelauncher/MinecraftAssets;
    :catch_0
    move-exception v1

    .line 459
    .local v1, "exception":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 461
    .end local v1    # "exception":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 455
    :cond_0
    :try_start_1
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    invoke-virtual {v2}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->rebuildJSON()V

    .line 456
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->blockAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    invoke-virtual {v2}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->rebuildJSON()V

    .line 457
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->itemsAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    invoke-virtual {v2}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->rebuildJSON()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->proxyClassLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_0

    .line 302
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->proxyClassLoader:Ljava/lang/ClassLoader;

    .line 303
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/mojang/minecraftpe/MainActivity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_0
.end method

.method public getMinecraftContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->minecraftContext:Landroid/content/Context;

    return-object v0
.end method

.method public getPackageManager()Landroid/content/pm/PackageManager;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->proxyPackageManager:Lio/mrarm/mcpelauncher/ProxyPackageManager;

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->proxyPackageManager:Lio/mrarm/mcpelauncher/ProxyPackageManager;

    .line 296
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/mojang/minecraftpe/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    goto :goto_0
.end method

.method public initModPETextureAtlasNames()V
    .locals 0

    .prologue
    .line 465
    return-void
.end method

.method protected loadNativeModLibraries()V
    .locals 4

    .prologue
    .line 518
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->nativeModLibs:Ljava/util/ArrayList;

    .line 519
    const-string v0, "mobilesubstrate"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 520
    const-string v0, "mcpelauncher-utils"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 521
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->nativeModLibs:Ljava/util/ArrayList;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const-string v3, "libmcpelauncher-utils.so"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 522
    return-void
.end method

.method public loadTexturePacks()V
    .locals 3

    .prologue
    .line 416
    const-string v1, "TexturePack"

    const-string v2, "Loading Texture Packs"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    iget-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->texturePacks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 418
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getTexturePackPaths()Ljava/util/Set;

    move-result-object v0

    .line 442
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 88
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    .line 90
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "run_backup"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->runFromBackup:Z

    .line 92
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "crash_lock"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->crashLock:Ljava/io/File;

    .line 94
    :try_start_0
    new-instance v1, Lio/mrarm/mcpelauncher/ZipAssets;

    new-instance v2, Ljava/util/zip/ZipFile;

    new-instance v3, Ljava/io/File;

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    const-string v5, "minecraftpe.apk"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    const-string v3, "assets/"

    invoke-direct {v1, v2, v3}, Lio/mrarm/mcpelauncher/ZipAssets;-><init>(Ljava/util/zip/ZipFile;Ljava/lang/String;)V

    iput-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->fallbackAssets:Lio/mrarm/mcpelauncher/ZipAssets;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :goto_0
    iget-boolean v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->runFromBackup:Z

    if-eqz v1, :cond_0

    .line 100
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->loadFromBackup()V

    .line 104
    :goto_1
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->loadTexturePacks()V

    .line 106
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->tryToLoadXboxLive()V

    .line 108
    iget-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLibDependencies:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 109
    .local v0, "file":Ljava/io/File;
    const-string v2, "MinecraftActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Loading dependency: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->load(Ljava/lang/String;)V

    goto :goto_2

    .line 102
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->loadFromPackage()V

    goto :goto_1

    .line 112
    :cond_1
    const-string v1, "MinecraftActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Loading libminecraftpe.so: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLib:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->mcpeLib:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 115
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->initPatching()V

    .line 117
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->buildModPETextureAtlases()V

    .line 122
    invoke-super {p0, p1}, Lcom/mojang/minecraftpe/MainActivity;->onCreate(Landroid/os/Bundle;)V

    .line 124
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 126
    iget-boolean v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->runFromBackup:Z

    if-nez v1, :cond_2

    .line 128
    iget-object v1, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->minecraftContext:Landroid/content/Context;

    invoke-static {v1}, Lorg/fmod/FMOD;->init(Landroid/content/Context;)V

    .line 130
    :cond_2
    return-void

    .line 95
    :catch_0
    move-exception v1

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 265
    sput-object v6, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    .line 266
    iget-boolean v5, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->runFromBackup:Z

    if-eqz v5, :cond_0

    .line 267
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->deleteBackupLibraries(Landroid/content/Context;)V

    .line 269
    :try_start_0
    iget-object v5, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 273
    :goto_0
    iput-object v6, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupFile:Ljava/util/zip/ZipFile;

    .line 274
    iput-object v6, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupAssets:Lio/mrarm/mcpelauncher/ZipAssets;

    .line 277
    :cond_0
    :try_start_1
    new-instance v1, Ljava/io/File;

    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    const-string v6, "minecraftpe.apk.version"

    invoke-direct {v1, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 278
    .local v1, "f":Ljava/io/File;
    new-instance v3, Ljava/io/DataInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v5}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 279
    .local v3, "input":Ljava/io/DataInputStream;
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    .line 280
    .local v2, "i":I
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V

    .line 281
    const/4 v5, -0x1

    if-ne v2, v5, :cond_1

    .line 282
    new-instance v4, Ljava/io/DataOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 283
    .local v4, "output":Ljava/io/DataOutputStream;
    iget-object v5, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    iget v5, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v4, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 284
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 289
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "input":Ljava/io/DataInputStream;
    .end local v4    # "output":Ljava/io/DataOutputStream;
    :cond_1
    :goto_1
    invoke-super {p0}, Lcom/mojang/minecraftpe/MainActivity;->onDestroy()V

    .line 290
    return-void

    .line 270
    :catch_0
    move-exception v0

    .line 271
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 286
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 255
    invoke-super {p0}, Lcom/mojang/minecraftpe/MainActivity;->onPause()V

    .line 256
    iget-object v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->crashLock:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 260
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->commit()V

    .line 261
    return-void
.end method

.method protected onResume()V
    .locals 10

    .prologue
    .line 232
    sget-boolean v5, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z

    if-eqz v5, :cond_0

    .line 233
    new-instance v3, Landroid/content/Intent;

    const-class v5, Lio/mrarm/mcpelauncher/MainActivity;

    invoke-direct {v3, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 234
    .local v3, "mStartActivity":Landroid/content/Intent;
    const v2, 0x1e240

    .line 235
    .local v2, "mPendingIntentId":I
    const/high16 v5, 0x10000000

    invoke-static {p0, v2, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 237
    .local v1, "mPendingIntent":Landroid/app/PendingIntent;
    const-string v5, "alarm"

    invoke-virtual {p0, v5}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AlarmManager;

    .line 238
    .local v4, "mgr":Landroid/app/AlarmManager;
    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x64

    add-long/2addr v6, v8

    invoke-virtual {v4, v5, v6, v7, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 239
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    .line 242
    .end local v1    # "mPendingIntent":Landroid/app/PendingIntent;
    .end local v2    # "mPendingIntentId":I
    .end local v3    # "mStartActivity":Landroid/content/Intent;
    .end local v4    # "mgr":Landroid/app/AlarmManager;
    :cond_0
    invoke-super {p0}, Lcom/mojang/minecraftpe/MainActivity;->onResume()V

    .line 244
    :try_start_0
    iget-object v5, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->crashLock:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    :goto_0
    return-void

    .line 245
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public openAssetFile(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 308
    const-string v2, "resourcepacks/vanilla/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 309
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    if-eqz v2, :cond_0

    const-string v2, "resourcepacks/vanilla/images/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 310
    const-string v2, "resourcepacks/vanilla/"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "p":Ljava/lang/String;
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    invoke-virtual {v2, v0}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->hasTexture(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 313
    :try_start_0
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    invoke-virtual {v2, v0}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->getTexture(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 372
    .end local v0    # "p":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 314
    .restart local v0    # "p":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 318
    .end local v0    # "p":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    if-eqz v2, :cond_1

    const-string v2, "resourcepacks/vanilla/resources.json"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 320
    :try_start_1
    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->modpeResources:Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;

    invoke-virtual {v3}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->getBuiltJSON()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 321
    :catch_1
    move-exception v2

    .line 324
    :cond_1
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->blockAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    if-eqz v2, :cond_2

    const-string v2, "resourcepacks/vanilla/images/terrain_texture.json"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 326
    :try_start_2
    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->blockAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    invoke-virtual {v3}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->getBuiltJSON()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 327
    :catch_2
    move-exception v2

    .line 330
    :cond_2
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->itemsAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    if-eqz v2, :cond_3

    const-string v2, "resourcepacks/vanilla/images/item_texture.json"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 332
    :try_start_3
    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->itemsAtlas:Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;

    invoke-virtual {v3}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->getBuiltJSON()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 333
    :catch_3
    move-exception v2

    .line 338
    :cond_3
    :try_start_4
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "overrides/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4

    move-result-object v2

    goto :goto_0

    .line 339
    :catch_4
    move-exception v2

    .line 342
    sget-object v2, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->instance:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-virtual {v2, p1}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->hasFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 344
    :try_start_5
    sget-object v2, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->instance:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-virtual {v2, p1}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getFile(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_5

    move-result-object v2

    goto/16 :goto_0

    .line 345
    :catch_5
    move-exception v2

    .line 348
    :cond_4
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->texturePacks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/MinecraftAssets;

    .line 349
    .local v1, "texturePack":Lio/mrarm/mcpelauncher/MinecraftAssets;
    invoke-interface {v1, p1}, Lio/mrarm/mcpelauncher/MinecraftAssets;->hasFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 351
    :try_start_6
    invoke-interface {v1, p1}, Lio/mrarm/mcpelauncher/MinecraftAssets;->getFile(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_9

    move-result-object v2

    goto/16 :goto_0

    .line 357
    .end local v1    # "texturePack":Lio/mrarm/mcpelauncher/MinecraftAssets;
    :cond_6
    :try_start_7
    iget-boolean v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->runFromBackup:Z

    if-eqz v2, :cond_7

    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupAssets:Lio/mrarm/mcpelauncher/ZipAssets;

    if-eqz v2, :cond_7

    .line 358
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->backupAssets:Lio/mrarm/mcpelauncher/ZipAssets;

    invoke-virtual {v2, p1}, Lio/mrarm/mcpelauncher/ZipAssets;->getFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    goto/16 :goto_0

    .line 360
    :cond_7
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->minecraftContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    move-result-object v2

    goto/16 :goto_0

    .line 362
    :catch_6
    move-exception v2

    .line 365
    :try_start_8
    iget-object v2, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->fallbackAssets:Lio/mrarm/mcpelauncher/ZipAssets;

    invoke-virtual {v2, p1}, Lio/mrarm/mcpelauncher/ZipAssets;->getFile(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_7

    move-result-object v2

    goto/16 :goto_0

    .line 366
    :catch_7
    move-exception v2

    .line 369
    :try_start_9
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fallback/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_8

    move-result-object v2

    goto/16 :goto_0

    .line 370
    :catch_8
    move-exception v2

    .line 372
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 352
    .restart local v1    # "texturePack":Lio/mrarm/mcpelauncher/MinecraftAssets;
    :catch_9
    move-exception v3

    goto :goto_1
.end method

.method public startHeadTracking()V
    .locals 0

    .prologue
    .line 79
    return-void
.end method

.method public startVRMode()V
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/MinecraftActivity;->isVRMode:Z

    .line 83
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->startHeadTracking()V

    .line 84
    return-void
.end method

.method public tryToLoadXboxLive()V
    .locals 0

    .prologue
    .line 222
    return-void
.end method
