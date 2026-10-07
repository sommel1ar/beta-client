.class public Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;
.super Landroid/preference/PreferenceFragment;
.source "SettingsActivity.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TexturePacksFragment"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;
    }
.end annotation


# static fields
.field public static ACTION_IMPORT:I


# instance fields
.field private available:Lio/mrarm/mcpelauncher/DragDropListView;

.field private availableAdapter:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

.field private availableList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/mcpelauncher/TexturePackInfo;",
            ">;"
        }
    .end annotation
.end field

.field private container:Landroid/widget/RelativeLayout;

.field private group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

.field private inUse:Lio/mrarm/mcpelauncher/DragDropListView;

.field private inUseAdapter:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

.field private inUseList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/mcpelauncher/TexturePackInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x1

    sput v0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->ACTION_IMPORT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 239
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method private addEnabledVanillaTexturePack()V
    .locals 4

    .prologue
    .line 365
    new-instance v0, Lio/mrarm/mcpelauncher/TexturePackInfo;

    sget v1, Lio/mrarm/mcpelauncher/R$string;->texture_pack_name_default:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lio/mrarm/mcpelauncher/R$string;->texture_pack_desc_default:I

    .line 366
    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->tryGetDefaultImage()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lio/mrarm/mcpelauncher/TexturePackInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 367
    .local v0, "defaultTP":Lio/mrarm/mcpelauncher/TexturePackInfo;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    .line 368
    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 369
    return-void
.end method

.method private loadTexturePacks()V
    .locals 12

    .prologue
    .line 372
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseList:Ljava/util/ArrayList;

    .line 373
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 375
    .local v4, "prefs":Landroid/content/SharedPreferences;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableList:Ljava/util/ArrayList;

    .line 376
    new-instance v5, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    const-string v8, "games/com.mojang/resource_packs"

    invoke-direct {v5, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 377
    .local v5, "resourcePacksDir":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 378
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    array-length v9, v8

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v9, :cond_0

    aget-object v1, v8, v7

    .line 380
    .local v1, "f":Ljava/io/File;
    :try_start_0
    iget-object v10, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableList:Ljava/util/ArrayList;

    new-instance v11, Lio/mrarm/mcpelauncher/TexturePackInfo;

    invoke-direct {v11, v1}, Lio/mrarm/mcpelauncher/TexturePackInfo;-><init>(Ljava/io/File;)V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 378
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 381
    :catch_0
    move-exception v6

    .line 382
    .local v6, "t":Ljava/lang/Throwable;
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 387
    .end local v1    # "f":Ljava/io/File;
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    new-instance v8, Ljava/io/File;

    .line 388
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v9

    const-string v10, "games/com.mojang/minecraftpe/resource_packs.txt"

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v7, v8}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 390
    .local v0, "enabledResourcePacks":Ljava/io/BufferedReader;
    :cond_1
    :goto_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 391
    const-string v7, "Minecraft"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 392
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->addEnabledVanillaTexturePack()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 403
    .end local v0    # "enabledResourcePacks":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 404
    .restart local v6    # "t":Ljava/lang/Throwable;
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 405
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->addEnabledVanillaTexturePack()V

    .line 407
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_2
    new-instance v7, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

    iget-object v8, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUse:Lio/mrarm/mcpelauncher/DragDropListView;

    iget-object v9, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseList:Ljava/util/ArrayList;

    invoke-direct {v7, p0, v8, v9}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;Lio/mrarm/mcpelauncher/DragDropListView;Ljava/util/ArrayList;)V

    iput-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseAdapter:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

    .line 408
    iget-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUse:Lio/mrarm/mcpelauncher/DragDropListView;

    iget-object v8, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseAdapter:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

    invoke-virtual {v7, v8}, Lio/mrarm/mcpelauncher/DragDropListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 409
    new-instance v7, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

    iget-object v8, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->available:Lio/mrarm/mcpelauncher/DragDropListView;

    iget-object v9, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableList:Ljava/util/ArrayList;

    invoke-direct {v7, p0, v8, v9}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;Lio/mrarm/mcpelauncher/DragDropListView;Ljava/util/ArrayList;)V

    iput-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableAdapter:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

    .line 410
    iget-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->available:Lio/mrarm/mcpelauncher/DragDropListView;

    iget-object v8, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableAdapter:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;

    invoke-virtual {v7, v8}, Lio/mrarm/mcpelauncher/DragDropListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 411
    return-void

    .line 395
    .restart local v0    # "enabledResourcePacks":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_3
    :try_start_2
    iget-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/mrarm/mcpelauncher/TexturePackInfo;

    .line 396
    .local v2, "i":Lio/mrarm/mcpelauncher/TexturePackInfo;
    iget-object v8, v2, Lio/mrarm/mcpelauncher/TexturePackInfo;->id:Ljava/lang/String;

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 397
    iget-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 398
    iget-object v7, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->availableList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2
.end method

.method private tryGetDefaultImage()Landroid/graphics/Bitmap;
    .locals 4

    .prologue
    .line 507
    :try_start_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "com.mojang.minecraftpe"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 508
    .local v0, "minecraftContext":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "images/gui/default_world.png"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 512
    .end local v0    # "minecraftContext":Landroid/content/Context;
    :goto_0
    return-object v1

    .line 509
    :catch_0
    move-exception v1

    .line 512
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 20
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 445
    sget v1, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->ACTION_IMPORT:I

    move/from16 v0, p1

    if-ne v0, v1, :cond_c

    .line 446
    if-eqz p3, :cond_0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_1

    .line 503
    :cond_0
    :goto_0
    return-void

    .line 448
    :cond_1
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v10

    .line 449
    .local v10, "filename":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 450
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 451
    const-string v1, "_display_name"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 452
    :cond_2
    const/16 v1, 0x2f

    invoke-virtual {v10, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 453
    const/16 v1, 0x2f

    invoke-virtual {v10, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {v10, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 454
    :cond_3
    const-string v1, ".zip"

    invoke-virtual {v10, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 455
    const/4 v1, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    invoke-virtual {v10, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 456
    :cond_4
    new-instance v16, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "games/com.mojang/resource_packs"

    move-object/from16 v0, v16

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 457
    .local v16, "targetDir":Ljava/io/File;
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, v16

    invoke-direct {v14, v0, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 458
    .local v14, "newFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->mkdirs()Z

    .line 460
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v11

    .line 463
    .local v11, "fin":Ljava/io/InputStream;
    new-instance v18, Ljava/util/zip/ZipInputStream;

    move-object/from16 v0, v18

    invoke-direct {v0, v11}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 465
    .local v18, "zin":Ljava/util/zip/ZipInputStream;
    const-string v19, ""

    .line 466
    .local v19, "zipBasePath":Ljava/lang/String;
    :cond_5
    :goto_1
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v9

    .local v9, "entry":Ljava/util/zip/ZipEntry;
    if-eqz v9, :cond_7

    .line 467
    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "resources.json"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/resources.json"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 468
    :cond_6
    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "resources.json"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    .line 469
    new-instance v1, Ljava/io/InputStreamReader;

    move-object/from16 v0, v18

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v1}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v17

    .line 470
    .local v17, "value":Ljava/lang/Object;
    const-string v1, "TexturePacksFragment"

    check-cast v17, Lorg/json/simple/JSONObject;

    .end local v17    # "value":Ljava/lang/Object;
    const-string v2, "pack_id"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 496
    .end local v9    # "entry":Ljava/util/zip/ZipEntry;
    .end local v11    # "fin":Ljava/io/InputStream;
    .end local v18    # "zin":Ljava/util/zip/ZipInputStream;
    .end local v19    # "zipBasePath":Ljava/lang/String;
    :catch_0
    move-exception v15

    .line 497
    .local v15, "t":Ljava/lang/Throwable;
    invoke-virtual {v15}, Ljava/lang/Throwable;->printStackTrace()V

    .line 498
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    sget v2, Lio/mrarm/mcpelauncher/R$string;->texture_pack_invalid:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 473
    .end local v15    # "t":Ljava/lang/Throwable;
    .restart local v9    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v11    # "fin":Ljava/io/InputStream;
    .restart local v18    # "zin":Ljava/util/zip/ZipInputStream;
    .restart local v19    # "zipBasePath":Ljava/lang/String;
    :cond_7
    :try_start_1
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/ZipInputStream;->close()V

    .line 476
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v11

    .line 477
    new-instance v18, Ljava/util/zip/ZipInputStream;

    .end local v18    # "zin":Ljava/util/zip/ZipInputStream;
    move-object/from16 v0, v18

    invoke-direct {v0, v11}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 478
    .restart local v18    # "zin":Ljava/util/zip/ZipInputStream;
    :cond_8
    :goto_2
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v9

    if-eqz v9, :cond_b

    .line 479
    const-string v1, "TexturePacksFragment"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unpacking: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 481
    new-instance v1, Ljava/io/File;

    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v14, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    goto :goto_2

    .line 484
    :cond_9
    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, v19

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 485
    new-instance v12, Ljava/io/FileOutputStream;

    new-instance v1, Ljava/io/File;

    invoke-virtual {v9}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v14, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v12, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 486
    .local v12, "fout":Ljava/io/OutputStream;
    const/16 v1, 0x400

    new-array v7, v1, [B

    .line 488
    .local v7, "buf":[B
    :goto_3
    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v13

    .local v13, "len":I
    if-lez v13, :cond_a

    .line 489
    const/4 v1, 0x0

    invoke-virtual {v12, v7, v1, v13}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_3

    .line 491
    :cond_a
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V

    goto :goto_2

    .line 494
    .end local v7    # "buf":[B
    .end local v12    # "fout":Ljava/io/OutputStream;
    .end local v13    # "len":I
    :cond_b
    invoke-direct/range {p0 .. p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->loadTexturePacks()V

    .line 495
    const/4 v1, 0x1

    sput-boolean v1, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 502
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "entry":Ljava/util/zip/ZipEntry;
    .end local v10    # "filename":Ljava/lang/String;
    .end local v11    # "fin":Ljava/io/InputStream;
    .end local v14    # "newFile":Ljava/io/File;
    .end local v16    # "targetDir":Ljava/io/File;
    .end local v18    # "zin":Ljava/util/zip/ZipInputStream;
    .end local v19    # "zipBasePath":Ljava/lang/String;
    :cond_c
    invoke-super/range {p0 .. p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto/16 :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 305
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 306
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->setHasOptionsMenu(Z)V

    .line 307
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 415
    sget v2, Lio/mrarm/mcpelauncher/R$layout;->texture_packs_manager:I

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 416
    .local v1, "view":Landroid/view/View;
    sget v2, Lio/mrarm/mcpelauncher/R$id;->texturePacksContainer:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->container:Landroid/widget/RelativeLayout;

    .line 417
    new-instance v2, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    invoke-direct {v2}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;-><init>()V

    iput-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    .line 418
    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    sget v3, Lio/mrarm/mcpelauncher/R$id;->deleteTexturePack:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, v2, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    .line 419
    sget v2, Lio/mrarm/mcpelauncher/R$id;->enabledTexturePacks:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lio/mrarm/mcpelauncher/DragDropListView;

    iput-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUse:Lio/mrarm/mcpelauncher/DragDropListView;

    .line 420
    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUse:Lio/mrarm/mcpelauncher/DragDropListView;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    invoke-virtual {v2, v3}, Lio/mrarm/mcpelauncher/DragDropListView;->init(Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;)V

    .line 421
    sget v2, Lio/mrarm/mcpelauncher/R$id;->availableTexturePacks:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lio/mrarm/mcpelauncher/DragDropListView;

    iput-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->available:Lio/mrarm/mcpelauncher/DragDropListView;

    .line 422
    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->available:Lio/mrarm/mcpelauncher/DragDropListView;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    invoke-virtual {v2, v3}, Lio/mrarm/mcpelauncher/DragDropListView;->init(Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;)V

    .line 423
    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->available:Lio/mrarm/mcpelauncher/DragDropListView;

    new-instance v3, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$1;

    invoke-direct {v3, p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$1;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;)V

    invoke-virtual {v2, v3}, Lio/mrarm/mcpelauncher/DragDropListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 429
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    sget v2, Lio/mrarm/mcpelauncher/R$id;->draggedTexturePack:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, v3, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    .line 431
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->loadTexturePacks()V

    .line 433
    sget v2, Lio/mrarm/mcpelauncher/R$id;->importButton:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 434
    .local v0, "importBtn":Landroid/widget/Button;
    new-instance v2, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$2;

    invoke-direct {v2, p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$2;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    return-object v1
.end method

.method public onStop()V
    .locals 7

    .prologue
    .line 346
    :try_start_0
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/FileWriter;

    new-instance v4, Ljava/io/File;

    .line 347
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    const-string v6, "games/com.mojang/minecraftpe/resource_packs.txt"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 348
    .local v2, "w":Ljava/io/BufferedWriter;
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;->inUseList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/TexturePackInfo;

    .line 349
    .local v0, "i":Lio/mrarm/mcpelauncher/TexturePackInfo;
    iget-boolean v4, v0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    if-eqz v4, :cond_0

    .line 350
    const-string v4, "Minecraft\n"

    invoke-virtual {v2, v4}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 358
    .end local v0    # "i":Lio/mrarm/mcpelauncher/TexturePackInfo;
    .end local v2    # "w":Ljava/io/BufferedWriter;
    :catch_0
    move-exception v1

    .line 359
    .local v1, "t":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 361
    .end local v1    # "t":Ljava/lang/Throwable;
    :goto_1
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onStop()V

    .line 362
    return-void

    .line 352
    .restart local v0    # "i":Lio/mrarm/mcpelauncher/TexturePackInfo;
    .restart local v2    # "w":Ljava/io/BufferedWriter;
    :cond_0
    :try_start_1
    iget-object v4, v0, Lio/mrarm/mcpelauncher/TexturePackInfo;->id:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 353
    const/16 v4, 0xa

    invoke-virtual {v2, v4}, Ljava/io/BufferedWriter;->append(C)Ljava/io/Writer;

    goto :goto_0

    .line 356
    .end local v0    # "i":Lio/mrarm/mcpelauncher/TexturePackInfo;
    :cond_1
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->flush()V

    .line 357
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
