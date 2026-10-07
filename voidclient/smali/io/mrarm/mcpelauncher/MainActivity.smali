.class public Lio/mrarm/mcpelauncher/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field public static final MINECRAFT_PACKAGE:Ljava/lang/String; = "com.mojang.minecraftpe"

.field public static currentVersionHasWarning:Z

.field public static hasCrashed:Z


# instance fields
.field mcpeLib:Ljava/io/File;

.field minecraftVersion:Lio/mrarm/mcpelauncher/MinecraftVersion;

.field packageInfo:Landroid/content/pm/PackageInfo;

.field version:Lio/mrarm/mcpelauncher/Version;

.field versionMD5:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 28
    sput-boolean v0, Lio/mrarm/mcpelauncher/MainActivity;->currentVersionHasWarning:Z

    .line 29
    sput-boolean v0, Lio/mrarm/mcpelauncher/MainActivity;->hasCrashed:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private startNormally()V
    .locals 2

    .prologue
    .line 216
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MainActivity;->getLaunchActivityClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 217
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 218
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    .line 219
    return-void
.end method

.method private startUsingBackup()V
    .locals 3

    .prologue
    .line 222
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MainActivity;->getLaunchActivityClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 223
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "run_backup"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 224
    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 225
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    .line 226
    return-void
.end method


# virtual methods
.method protected checkPermissions()Z
    .locals 3

    .prologue
    .line 229
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 231
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "error_title"

    sget v2, Lio/mrarm/mcpelauncher/R$string;->error_no_storage_access:I

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 232
    const-string v1, "error_desc"

    sget v2, Lio/mrarm/mcpelauncher/R$string;->error_no_storage_access_desc:I

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 233
    const-string v1, "action"

    const-string v2, "request_permission"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 234
    const-string v1, "permission"

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 235
    const-string v1, "permission_name"

    sget v2, Lio/mrarm/mcpelauncher/R$string;->write_storage_permission_text:I

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 236
    const-string v1, "return_class"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 237
    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 238
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    .line 239
    const/4 v1, 0x0

    .line 241
    .end local v0    # "i":Landroid/content/Intent;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
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
    .line 245
    const-class v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 23
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super/range {p0 .. p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    new-instance v5, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v17

    const-string v18, "crash_lock"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v5, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 42
    .local v5, "crashLock":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v17

    sput-boolean v17, Lio/mrarm/mcpelauncher/MainActivity;->hasCrashed:Z

    .line 43
    sget-boolean v17, Lio/mrarm/mcpelauncher/MainActivity;->hasCrashed:Z

    if-eqz v17, :cond_0

    .line 44
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 47
    :cond_0
    const/16 v17, 0x0

    sput-boolean v17, Lio/mrarm/mcpelauncher/MainActivity;->currentVersionHasWarning:Z

    .line 50
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v17

    const-string v18, "com.mojang.minecraftpe"

    const/16 v19, 0x0

    invoke-virtual/range {v17 .. v19}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    .line 52
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    move-object/from16 v18, v0

    const-string v19, "/libminecraftpe.so"

    invoke-direct/range {v17 .. v19}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/mrarm/mcpelauncher/MainActivity;->mcpeLib:Ljava/io/File;

    .line 54
    const-string v17, "MainActivity/Loader"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Minecraft is installed (version: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ")"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const-string v17, "MainActivity/Loader"

    const-string v18, "Calculating MCPE .so MD5 sum"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    const-string v17, "MD5"

    invoke-static/range {v17 .. v17}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v12

    .line 58
    .local v12, "md":Ljava/security/MessageDigest;
    new-instance v6, Ljava/security/DigestInputStream;

    new-instance v17, Ljava/io/FileInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->mcpeLib:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v17

    invoke-direct {v6, v0, v12}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .local v6, "dIn":Ljava/security/DigestInputStream;
    const/high16 v17, 0x80000

    :try_start_1
    move/from16 v0, v17

    new-array v4, v0, [B

    .line 62
    .local v4, "buf":[B
    :cond_1
    invoke-virtual {v6, v4}, Ljava/security/DigestInputStream;->read([B)I
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result v17

    if-gtz v17, :cond_1

    .line 68
    .end local v4    # "buf":[B
    :goto_0
    :try_start_2
    invoke-virtual {v12}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    .line 69
    .local v7, "digest":[B
    new-instance v16, Ljava/lang/StringBuilder;

    array-length v0, v7

    move/from16 v17, v0

    mul-int/lit8 v17, v17, 0x2

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 70
    .local v16, "versionHex":Ljava/lang/StringBuilder;
    array-length v0, v7

    move/from16 v18, v0

    const/16 v17, 0x0

    :goto_1
    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_2

    aget-byte v3, v7, v17

    .line 71
    .local v3, "b":B
    const-string v19, "%02x"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    and-int/lit16 v0, v3, 0xff

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 72
    .end local v3    # "b":B
    :cond_2
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/mrarm/mcpelauncher/MainActivity;->versionMD5:Ljava/lang/String;

    .line 73
    const-string v17, "MainActivity/Loader"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Version checksum is: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->versionMD5:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    new-instance v17, Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Lio/mrarm/mcpelauncher/Version;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/mrarm/mcpelauncher/MainActivity;->version:Lio/mrarm/mcpelauncher/Version;

    .line 75
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->versionMD5:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lio/mrarm/mcpelauncher/MinecraftVersion;->getVersionForMD5Sum(Ljava/lang/String;)Lio/mrarm/mcpelauncher/MinecraftVersion;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/mrarm/mcpelauncher/MainActivity;->minecraftVersion:Lio/mrarm/mcpelauncher/MinecraftVersion;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->minecraftVersion:Lio/mrarm/mcpelauncher/MinecraftVersion;

    move-object/from16 v17, v0

    if-eqz v17, :cond_4

    .line 91
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->minecraftVersion:Lio/mrarm/mcpelauncher/MinecraftVersion;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MinecraftVersion;->variant:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    move-object/from16 v17, v0

    sget-object v18, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_4

    sget-object v17, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    const-string v18, "x86"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 92
    new-instance v10, Landroid/content/Intent;

    const-class v17, Lio/mrarm/mcpelauncher/ErrorActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v10, "i":Landroid/content/Intent;
    const-string v17, "error_title"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_unsupported_arm_on_intel:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    const-string v17, "error_desc"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_unsupported_arm_on_intel_desc:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 95
    const-string v17, "action"

    const-string v18, "open_store"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 96
    const-string v17, "package_name"

    const-string v18, "com.mojang.minecraftpe"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 97
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 98
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    .line 203
    .end local v6    # "dIn":Ljava/security/DigestInputStream;
    .end local v7    # "digest":[B
    .end local v10    # "i":Landroid/content/Intent;
    .end local v12    # "md":Ljava/security/MessageDigest;
    .end local v16    # "versionHex":Ljava/lang/StringBuilder;
    :cond_3
    :goto_2
    return-void

    .line 76
    :catch_0
    move-exception v8

    .line 77
    .local v8, "e":Ljava/lang/Throwable;
    invoke-virtual {v8}, Ljava/lang/Throwable;->printStackTrace()V

    .line 78
    new-instance v10, Landroid/content/Intent;

    const-class v17, Lio/mrarm/mcpelauncher/ErrorActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .restart local v10    # "i":Landroid/content/Intent;
    const-string v17, "error_title"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_not_installed:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    const-string v17, "error_desc"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_not_installed_desc:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    const-string v17, "action"

    const-string v18, "open_store"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    const-string v17, "package_name"

    const-string v18, "com.mojang.minecraftpe"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 83
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 84
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    .line 85
    invoke-static/range {p0 .. p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 86
    invoke-static/range {p0 .. p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionHashFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 103
    .end local v8    # "e":Ljava/lang/Throwable;
    .end local v10    # "i":Landroid/content/Intent;
    .restart local v6    # "dIn":Ljava/security/DigestInputStream;
    .restart local v7    # "digest":[B
    .restart local v12    # "md":Ljava/security/MessageDigest;
    .restart local v16    # "versionHex":Ljava/lang/StringBuilder;
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->checkPermissions()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 106
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v13

    .line 108
    .local v13, "sharedPref":Landroid/content/SharedPreferences;
    new-instance v17, Ljava/io/File;

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v18

    const-string v19, "minecraftpe.apk"

    invoke-direct/range {v17 .. v19}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v9

    .line 109
    .local v9, "hasApk":Z
    if-eqz v9, :cond_7

    .line 111
    :try_start_3
    new-instance v11, Ljava/io/DataInputStream;

    new-instance v17, Ljava/io/FileInputStream;

    new-instance v18, Ljava/io/File;

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    const-string v20, "minecraftpe.apk.version"

    invoke-direct/range {v18 .. v20}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct/range {v17 .. v18}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v17

    invoke-direct {v11, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 112
    .local v11, "input":Ljava/io/DataInputStream;
    invoke-virtual {v11}, Ljava/io/DataInputStream;->readInt()I

    move-result v10

    .line 113
    .local v10, "i":I
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->willStartWithBackup()Z

    move-result v17

    if-nez v17, :cond_6

    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v10, v0, :cond_5

    sget-boolean v17, Lio/mrarm/mcpelauncher/MainActivity;->hasCrashed:Z

    if-eqz v17, :cond_6

    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-eq v10, v0, :cond_6

    .line 114
    const/4 v9, 0x0

    .line 115
    :cond_6
    invoke-virtual {v11}, Ljava/io/DataInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    .line 120
    .end local v10    # "i":I
    .end local v11    # "input":Ljava/io/DataInputStream;
    :cond_7
    :goto_3
    if-nez v9, :cond_8

    .line 122
    :try_start_4
    const-string v17, "com.mojang.minecraftpe"

    const/16 v18, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lio/mrarm/mcpelauncher/MainActivity;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v17

    const-string v18, "images/items-opaque.tga"

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    .line 150
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->minecraftVersion:Lio/mrarm/mcpelauncher/MinecraftVersion;

    move-object/from16 v17, v0

    if-nez v17, :cond_c

    .line 151
    const-string v17, "MainActivity/Loader"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unsupported Minecraft version detected ("

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->version:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/Version;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ")"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    const-string v17, "MainActivity/Loader"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Oldest supported version: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Lio/mrarm/mcpelauncher/MinecraftVersion;->oldestMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/Version;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    const-string v17, "MainActivity/Loader"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Newest supported version: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Lio/mrarm/mcpelauncher/MinecraftVersion;->lastMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/Version;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    sget-object v17, Lio/mrarm/mcpelauncher/MinecraftVersion;->lastMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v0, v17

    iget v0, v0, Lio/mrarm/mcpelauncher/Version;->major:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->version:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lio/mrarm/mcpelauncher/Version;->major:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_9

    sget-object v17, Lio/mrarm/mcpelauncher/MinecraftVersion;->lastMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v0, v17

    iget v0, v0, Lio/mrarm/mcpelauncher/Version;->minor:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->version:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lio/mrarm/mcpelauncher/Version;->minor:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_a

    .line 162
    :cond_9
    new-instance v10, Landroid/content/Intent;

    const-class v17, Lio/mrarm/mcpelauncher/ErrorActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 163
    .local v10, "i":Landroid/content/Intent;
    const-string v17, "error_title"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_major_update:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 164
    const-string v17, "error_desc"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_major_update_desc:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 165
    const-string v17, "action"

    const-string v18, "open_store"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 166
    const-string v17, "package_name"

    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 168
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    goto/16 :goto_2

    .line 116
    .end local v10    # "i":Landroid/content/Intent;
    :catch_1
    move-exception v14

    .line 117
    .local v14, "t":Ljava/lang/Throwable;
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 123
    .end local v14    # "t":Ljava/lang/Throwable;
    :catch_2
    move-exception v14

    .line 125
    .restart local v14    # "t":Ljava/lang/Throwable;
    :try_start_5
    const-string v17, "com.mojang.minecraftpe"

    const/16 v18, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lio/mrarm/mcpelauncher/MainActivity;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v17

    const-string v18, "resourcepacks/vanilla/images/items-opaque.png"

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_4

    .line 126
    :catch_3
    move-exception v15

    .line 127
    .local v15, "t2":Ljava/lang/Throwable;
    new-instance v10, Landroid/content/Intent;

    const-class v17, Lio/mrarm/mcpelauncher/ErrorActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 128
    .restart local v10    # "i":Landroid/content/Intent;
    const-string v17, "error_title"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_assets_unavailable:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const-string v17, "error_desc"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_assets_unavailable_desc:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    const-string v17, "action"

    const-string v18, "pick_default_assets"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 131
    const-string v17, "return_class"

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 133
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    goto/16 :goto_2

    .line 170
    .end local v10    # "i":Landroid/content/Intent;
    .end local v14    # "t":Ljava/lang/Throwable;
    .end local v15    # "t2":Ljava/lang/Throwable;
    :cond_a
    sget-object v17, Lio/mrarm/mcpelauncher/MinecraftVersion;->oldestMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->version:Lio/mrarm/mcpelauncher/Version;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lio/mrarm/mcpelauncher/Version;->isNewerThan(Lio/mrarm/mcpelauncher/Version;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 176
    new-instance v10, Landroid/content/Intent;

    const-class v17, Lio/mrarm/mcpelauncher/ErrorActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 177
    .restart local v10    # "i":Landroid/content/Intent;
    const-string v17, "error_title"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_outdated:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 178
    const-string v17, "error_desc"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_outdated_desc:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 179
    const-string v17, "action"

    const-string v18, "open_store"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    const-string v17, "package_name"

    const-string v18, "com.mojang.minecraftpe"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 182
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    goto/16 :goto_2

    .line 185
    .end local v10    # "i":Landroid/content/Intent;
    :cond_b
    const/16 v17, 0x1

    sput-boolean v17, Lio/mrarm/mcpelauncher/MainActivity;->currentVersionHasWarning:Z

    goto/16 :goto_5

    .line 186
    const-string v17, "disable_startup_warnings"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-interface {v13, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_c

    .line 187
    new-instance v10, Landroid/content/Intent;

    const-class v17, Lio/mrarm/mcpelauncher/ErrorActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 188
    .restart local v10    # "i":Landroid/content/Intent;
    const-string v17, "error_title"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_unsupported:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 189
    const-string v17, "error_desc"

    sget v18, Lio/mrarm/mcpelauncher/R$string;->error_minecraft_unsupported_desc:I

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " - "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->packageInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/MainActivity;->versionMD5:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    const-string v17, "action"

    const-string v18, "continue"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 191
    const-string v17, "return_class"

    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->getLaunchActivityClass()Ljava/lang/Class;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 192
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 193
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->finish()V

    goto/16 :goto_2

    .line 199
    .end local v10    # "i":Landroid/content/Intent;
    :cond_c
    :goto_5
    sget-boolean v17, Lio/mrarm/mcpelauncher/MainActivity;->currentVersionHasWarning:Z

    if-nez v17, :cond_d

    const-string v17, "disable_startup_warnings"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-interface {v13, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v17

    if-eqz v17, :cond_d

    .line 200
    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    const-string v18, "disable_startup_warnings"

    invoke-interface/range {v17 .. v18}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 202
    :cond_d
    invoke-direct/range {p0 .. p0}, Lio/mrarm/mcpelauncher/MainActivity;->startNormally()V

    goto/16 :goto_2

    .line 65
    .end local v7    # "digest":[B
    .end local v9    # "hasApk":Z
    .end local v13    # "sharedPref":Landroid/content/SharedPreferences;
    .end local v16    # "versionHex":Ljava/lang/StringBuilder;
    :catch_4
    move-exception v17

    goto/16 :goto_0
.end method

.method protected willStartWithBackup()Z
    .locals 1

    .prologue
    .line 212
    const/4 v0, 0x0

    return v0
.end method
