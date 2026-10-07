.class public Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;
.super Ljava/lang/Object;
.source "ModPETextureOverride.java"

# interfaces
.implements Lio/mrarm/mcpelauncher/MinecraftAssets;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    }
.end annotation


# static fields
.field private static final MAX_CACHE_STORE:J = 0x9a7ec800L

.field public static instance:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;


# instance fields
.field private cacheFiles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field public nextFileId:I

.field public textures:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->instance:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->nextFileId:I

    .line 43
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->readCacheIndex()V

    .line 44
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cleanUpCache()V

    .line 45
    return-void
.end method

.method static synthetic access$000(Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    .prologue
    .line 32
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method public cleanUpCache()V
    .locals 10

    .prologue
    .line 197
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 198
    .local v4, "now":J
    iget-object v3, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 199
    const/4 v1, 0x0

    .line 200
    .local v1, "hasChanges":Z
    iget-object v3, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 201
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 202
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    iget-wide v6, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->lastAccessed:J

    sub-long v6, v4, v6

    const-wide v8, 0x9a7ec800L

    cmp-long v3, v6, v8

    if-lez v3, :cond_0

    .line 203
    const-string v6, "ModPE/TextureOverride"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Removing: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->name:Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " ("

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->fileName:Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ")"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getSaveDirectory()Ljava/io/File;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->fileName:Ljava/lang/String;

    invoke-direct {v6, v7, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 205
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 206
    const/4 v1, 0x1

    goto :goto_0

    .line 209
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;>;"
    :cond_1
    if-eqz v1, :cond_2

    .line 210
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->saveCacheIndex()V

    .line 211
    :cond_2
    return-void
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    return-void
.end method

.method public downloadTexture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 56
    const-string v1, ".."

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Texture override can not contain \'..\'"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :cond_0
    const-string v1, "ModPE/TextureOverride"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Mapping "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    const-string v1, "ModPE/TextureOverride"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Texture "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " already downloaded; skipping."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    :goto_0
    return-void

    .line 64
    :cond_1
    const-string v1, "ModPE/TextureOverride"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Download: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;

    invoke-direct {v1, p0, p2, p1}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$1;-><init>(Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 114
    .local v0, "th":Ljava/lang/Thread;
    const-string v1, "Script Texture Downloader"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 115
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public getCacheFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 192
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    .line 193
    .local v0, "entry":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getSaveDirectory()Ljava/io/File;

    move-result-object v2

    iget-object v3, v0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->fileName:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method public getFile(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getCacheFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v1
.end method

.method public getSaveDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public hasFile(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 125
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public list(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 136
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 137
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v1, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 139
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 140
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 142
    .end local v0    # "name":Ljava/lang/String;
    :cond_2
    return-object v1
.end method

.method public readCacheIndex()V
    .locals 14

    .prologue
    .line 146
    const-string v9, "ModPE/TextureOverride"

    const-string v10, "Reading cache index."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :try_start_0
    new-instance v6, Ljava/io/FileReader;

    new-instance v9, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getSaveDirectory()Ljava/io/File;

    move-result-object v10

    const-string v11, "index.json"

    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v6, v9}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 149
    .local v6, "reader":Ljava/io/FileReader;
    invoke-static {v6}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/simple/JSONObject;

    .line 150
    .local v5, "obj":Lorg/json/simple/JSONObject;
    invoke-virtual {v6}, Ljava/io/FileReader;->close()V

    .line 151
    const-string v9, "next_id"

    invoke-virtual {v5, v9}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->intValue()I

    move-result v9

    iput v9, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->nextFileId:I

    .line 152
    const-string v9, "files"

    invoke-virtual {v5, v9}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/simple/JSONArray;

    .line 153
    .local v2, "arr":Lorg/json/simple/JSONArray;
    invoke-virtual {v2}, Lorg/json/simple/JSONArray;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 154
    .local v8, "v":Ljava/lang/Object;
    move-object v0, v8

    check-cast v0, Lorg/json/simple/JSONObject;

    move-object v4, v0

    .line 155
    .local v4, "ent":Lorg/json/simple/JSONObject;
    new-instance v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    invoke-direct {v3}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;-><init>()V

    .line 156
    .local v3, "cacheEntry":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    const-string v9, "name"

    invoke-virtual {v4, v9}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iput-object v9, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->name:Ljava/lang/String;

    .line 157
    const-string v9, "file"

    invoke-virtual {v4, v9}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iput-object v9, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->fileName:Ljava/lang/String;

    .line 158
    const-string v9, "time_created"

    invoke-virtual {v4, v9}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    iput-wide v12, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->timeCreated:J

    .line 159
    const-string v9, "last_accessed"

    invoke-virtual {v4, v9}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    iput-wide v12, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->lastAccessed:J

    .line 160
    iget-object v9, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    iget-object v11, v3, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->name:Ljava/lang/String;

    invoke-virtual {v9, v11, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 162
    .end local v2    # "arr":Lorg/json/simple/JSONArray;
    .end local v3    # "cacheEntry":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    .end local v4    # "ent":Lorg/json/simple/JSONObject;
    .end local v5    # "obj":Lorg/json/simple/JSONObject;
    .end local v6    # "reader":Ljava/io/FileReader;
    .end local v8    # "v":Ljava/lang/Object;
    :catch_0
    move-exception v7

    .line 163
    .local v7, "t":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 165
    .end local v7    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->textures:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 53
    return-void
.end method

.method public saveCacheIndex()V
    .locals 10

    .prologue
    .line 168
    const-string v6, "ModPE/TextureOverride"

    const-string v7, "Saving cache index."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :try_start_0
    new-instance v2, Lorg/json/simple/JSONObject;

    invoke-direct {v2}, Lorg/json/simple/JSONObject;-><init>()V

    .line 171
    .local v2, "obj":Lorg/json/simple/JSONObject;
    new-instance v0, Lorg/json/simple/JSONArray;

    invoke-direct {v0}, Lorg/json/simple/JSONArray;-><init>()V

    .line 172
    .local v0, "arr":Lorg/json/simple/JSONArray;
    iget-object v6, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->cacheFiles:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;

    .line 173
    .local v4, "v":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    new-instance v1, Lorg/json/simple/JSONObject;

    invoke-direct {v1}, Lorg/json/simple/JSONObject;-><init>()V

    .line 174
    .local v1, "ent":Lorg/json/simple/JSONObject;
    const-string v7, "name"

    iget-object v8, v4, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->name:Ljava/lang/String;

    invoke-virtual {v1, v7, v8}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    const-string v7, "file"

    iget-object v8, v4, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->fileName:Ljava/lang/String;

    invoke-virtual {v1, v7, v8}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const-string v7, "time_created"

    iget-wide v8, v4, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->timeCreated:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    const-string v7, "last_accessed"

    iget-wide v8, v4, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->lastAccessed:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    invoke-virtual {v0, v1}, Lorg/json/simple/JSONArray;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 186
    .end local v0    # "arr":Lorg/json/simple/JSONArray;
    .end local v1    # "ent":Lorg/json/simple/JSONObject;
    .end local v2    # "obj":Lorg/json/simple/JSONObject;
    .end local v4    # "v":Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
    :catch_0
    move-exception v3

    .line 187
    .local v3, "t":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 189
    .end local v3    # "t":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 180
    .restart local v0    # "arr":Lorg/json/simple/JSONArray;
    .restart local v2    # "obj":Lorg/json/simple/JSONObject;
    :cond_0
    :try_start_1
    const-string v6, "files"

    invoke-virtual {v2, v6, v0}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    const-string v6, "next_id"

    iget v7, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->nextFileId:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    new-instance v5, Ljava/io/FileWriter;

    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->getSaveDirectory()Ljava/io/File;

    move-result-object v7

    const-string v8, "index.json"

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 183
    .local v5, "writer":Ljava/io/FileWriter;
    invoke-virtual {v2, v5}, Lorg/json/simple/JSONObject;->writeJSONString(Ljava/io/Writer;)V

    .line 184
    invoke-virtual {v5}, Ljava/io/FileWriter;->flush()V

    .line 185
    invoke-virtual {v5}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
