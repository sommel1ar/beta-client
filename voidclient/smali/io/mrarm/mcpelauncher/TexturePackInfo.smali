.class public Lio/mrarm/mcpelauncher/TexturePackInfo;
.super Ljava/lang/Object;
.source "TexturePackInfo.java"


# instance fields
.field public desc:Ljava/lang/String;

.field public file:Ljava/io/File;

.field public icon:Landroid/graphics/Bitmap;

.field public id:Ljava/lang/String;

.field public isDefault:Z

.field public name:Ljava/lang/String;

.field public zipBasePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 4
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    .line 74
    iput-object p1, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->file:Ljava/io/File;

    .line 75
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->name:Ljava/lang/String;

    .line 77
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    new-instance v2, Ljava/io/File;

    const-string v3, "resources.json"

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v1}, Lio/mrarm/mcpelauncher/TexturePackInfo;->tryParseResourcesJson(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    const-string v3, "pack_icon.png"

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->icon:Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 87
    :goto_0
    return-void

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 80
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to load resources.json"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 84
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 85
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/File;Ljava/util/zip/ZipFile;)V
    .locals 8
    .param p1, "file"    # Ljava/io/File;
    .param p2, "zipFile"    # Ljava/util/zip/ZipFile;

    .prologue
    const/4 v7, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean v7, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    .line 45
    iput-object p1, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->file:Ljava/io/File;

    .line 46
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->name:Ljava/lang/String;

    .line 47
    const-string v4, ""

    iput-object v4, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->zipBasePath:Ljava/lang/String;

    .line 48
    invoke-virtual {p2}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 49
    .local v1, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    const/4 v3, 0x0

    .line 50
    .local v3, "foundResourcesJson":Z
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 51
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 53
    .local v2, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "resources.json"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/resources.json"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 54
    :cond_1
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const-string v6, "resources.json"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->zipBasePath:Ljava/lang/String;

    .line 56
    :try_start_0
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {p2, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v4}, Lio/mrarm/mcpelauncher/TexturePackInfo;->tryParseResourcesJson(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    const/4 v3, 0x1

    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 61
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "pack_icon.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/pack_icon.png"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    :cond_3
    :try_start_1
    invoke-virtual {p2, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->icon:Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 64
    :catch_1
    move-exception v0

    .line 65
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 69
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v2    # "entry":Ljava/util/zip/ZipEntry;
    :cond_4
    if-nez v3, :cond_5

    .line 70
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "No resources.json file found"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 71
    :cond_5
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    .line 90
    iput-object p1, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->name:Ljava/lang/String;

    .line 91
    iput-object p2, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->desc:Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->icon:Landroid/graphics/Bitmap;

    .line 93
    return-void
.end method

.method private tryParseResourcesJson(Ljava/io/Reader;)V
    .locals 5
    .param p1, "r"    # Ljava/io/Reader;

    .prologue
    .line 31
    :try_start_0
    invoke-static {p1}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v2

    .line 32
    .local v2, "value":Ljava/lang/Object;
    instance-of v3, v2, Lorg/json/simple/JSONObject;

    if-eqz v3, :cond_1

    .line 33
    move-object v0, v2

    check-cast v0, Lorg/json/simple/JSONObject;

    move-object v3, v0

    const-string v4, "pack_id"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->id:Ljava/lang/String;

    .line 34
    move-object v0, v2

    check-cast v0, Lorg/json/simple/JSONObject;

    move-object v3, v0

    const-string v4, "name"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 35
    move-object v0, v2

    check-cast v0, Lorg/json/simple/JSONObject;

    move-object v3, v0

    const-string v4, "name"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->name:Ljava/lang/String;

    .line 36
    :cond_0
    move-object v0, v2

    check-cast v0, Lorg/json/simple/JSONObject;

    move-object v3, v0

    const-string v4, "description"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 37
    check-cast v2, Lorg/json/simple/JSONObject;

    .end local v2    # "value":Ljava/lang/Object;
    const-string v3, "description"

    invoke-virtual {v2, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lio/mrarm/mcpelauncher/TexturePackInfo;->desc:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    :cond_1
    :goto_0
    return-void

    .line 39
    :catch_0
    move-exception v1

    .line 40
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method
