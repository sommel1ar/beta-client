.class public Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;
.super Ljava/lang/Object;
.source "ProtobufMetaStore.java"

# interfaces
.implements Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;


# static fields
.field public static instance:Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;


# instance fields
.field entities:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/modpe/EntityMeta;",
            ">;"
        }
    .end annotation
.end field

.field hasUnsavedChanges:Z

.field storeFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->instance:Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->storeFile:Ljava/io/File;

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 68
    const-string v0, "ProtobufMetaStore"

    const-string v1, "Close"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->save()V

    .line 70
    return-void
.end method

.method public get(JLjava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "eid"    # J
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 80
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->modpeData:Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 82
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMetaForEntity(JZ)Lio/mrarm/mcpelauncher/modpe/EntityMeta;
    .locals 3
    .param p1, "eid"    # J
    .param p3, "create"    # Z

    .prologue
    .line 101
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    .line 107
    :goto_0
    return-object v1

    .line 103
    :cond_0
    if-nez p3, :cond_1

    .line 104
    const/4 v1, 0x0

    goto :goto_0

    .line 105
    :cond_1
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;-><init>()V

    .line 106
    .local v0, "instance":Lio/mrarm/mcpelauncher/modpe/EntityMeta;
    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 107
    goto :goto_0
.end method

.method public notifyMetaChanged(Lio/mrarm/mcpelauncher/modpe/EntityMeta;)V
    .locals 1
    .param p1, "meta"    # Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    .prologue
    .line 112
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    .line 113
    return-void
.end method

.method public open(Ljava/io/File;)V
    .locals 7
    .param p1, "world"    # Ljava/io/File;

    .prologue
    .line 24
    new-instance v4, Ljava/io/File;

    const-string v5, "modpe-entity-meta.bin"

    invoke-direct {v4, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v4, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->storeFile:Ljava/io/File;

    .line 25
    const-string v4, "ProtobufMetaStore"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Open: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->storeFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    iget-object v4, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 27
    const/4 v4, 0x0

    iput-boolean v4, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    .line 29
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    iget-object v5, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->storeFile:Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v4}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->parseFrom(Ljava/io/InputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v3

    .line 30
    .local v3, "worldData":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    invoke-virtual {v3}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->getMeta()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 31
    .local v2, "meta":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    new-instance v1, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    invoke-direct {v1}, Lio/mrarm/mcpelauncher/modpe/EntityMeta;-><init>()V

    .line 32
    .local v1, "instance":Lio/mrarm/mcpelauncher/modpe/EntityMeta;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    invoke-virtual {v4}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getSkin()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->skin:Ljava/lang/String;

    .line 33
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    invoke-virtual {v4}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getRenderType()I

    move-result v4

    iput v4, v1, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->renderType:I

    .line 34
    iget-object v6, v1, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->modpeData:Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    invoke-virtual {v4}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getModpeData()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 35
    iget-object v4, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 37
    .end local v1    # "instance":Lio/mrarm/mcpelauncher/modpe/EntityMeta;
    .end local v2    # "meta":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    .end local v3    # "worldData":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    :catch_0
    move-exception v0

    .line 38
    .local v0, "ex":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 40
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_0
    return-void
.end method

.method public remove(JLjava/lang/String;)V
    .locals 3
    .param p1, "eid"    # J
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 87
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget-object v0, v0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->modpeData:Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    .line 89
    :cond_0
    return-void
.end method

.method public removeAll(J)V
    .locals 3
    .param p1, "eid"    # J

    .prologue
    .line 93
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    .line 97
    :cond_0
    return-void
.end method

.method public save()V
    .locals 8

    .prologue
    .line 44
    iget-boolean v5, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    if-nez v5, :cond_0

    .line 64
    :goto_0
    return-void

    .line 46
    :cond_0
    const-string v5, "ProtobufMetaStore"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Saving: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->storeFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :try_start_0
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->newBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    .line 49
    .local v0, "builder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->getMutableMeta()Ljava/util/Map;

    move-result-object v4

    .line 50
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    iget-object v5, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->entities:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 51
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/modpe/EntityMeta;>;"
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->newBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v2

    .line 52
    .local v2, "entryBuilder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->modpeData:Ljava/util/HashMap;

    invoke-virtual {v2, v5}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->putAllModpeData(Ljava/util/Map;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 53
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->skin:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 54
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->skin:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->setSkin(Ljava/lang/String;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 55
    :cond_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget v5, v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->renderType:I

    if-eqz v5, :cond_2

    .line 56
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    iget v5, v5, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->renderType:I

    invoke-virtual {v2, v5}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->setRenderType(I)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 57
    :cond_2
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v7

    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 61
    .end local v0    # "builder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/modpe/EntityMeta;>;"
    .end local v2    # "entryBuilder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    :catch_0
    move-exception v3

    .line 62
    .local v3, "ex":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 59
    .end local v3    # "ex":Ljava/io/IOException;
    .restart local v0    # "builder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .restart local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    :cond_3
    :try_start_1
    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v5

    new-instance v6, Ljava/io/FileOutputStream;

    iget-object v7, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->storeFile:Ljava/io/File;

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v5, v6}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->writeTo(Ljava/io/OutputStream;)V

    .line 60
    const/4 v5, 0x0

    iput-boolean v5, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public set(JLjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "eid"    # J
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 74
    invoke-virtual {p0, p1, p2, v1}, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->getMetaForEntity(JZ)Lio/mrarm/mcpelauncher/modpe/EntityMeta;

    move-result-object v0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->modpeData:Ljava/util/HashMap;

    invoke-virtual {v0, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    iput-boolean v1, p0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->hasUnsavedChanges:Z

    .line 76
    return-void
.end method
