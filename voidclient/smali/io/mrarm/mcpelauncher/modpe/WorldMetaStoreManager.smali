.class public Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;
.super Ljava/lang/Object;
.source "WorldMetaStoreManager.java"


# static fields
.field public static current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const/4 v0, 0x0

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeCurrent()V
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    if-eqz v0, :cond_0

    .line 38
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-interface {v0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->close()V

    .line 39
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 40
    return-void
.end method

.method public static commit()V
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    if-eqz v0, :cond_0

    .line 47
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-interface {v0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->save()V

    .line 48
    :cond_0
    return-void
.end method

.method public static initWithWorld(Ljava/io/File;)Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;
    .locals 1
    .param p0, "worldDir"    # Ljava/io/File;

    .prologue
    .line 26
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    if-eqz v0, :cond_0

    .line 27
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-interface {v0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->close()V

    .line 28
    :cond_0
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->selectImpl(Ljava/io/File;)Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    move-result-object v0

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    .line 29
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    invoke-interface {v0, p0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->open(Ljava/io/File;)V

    .line 30
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/WorldMetaStoreManager;->current:Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;

    return-object v0
.end method

.method public static selectImpl(Ljava/io/File;)Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;
    .locals 1
    .param p0, "worldDir"    # Ljava/io/File;

    .prologue
    .line 16
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;->instance:Lio/mrarm/mcpelauncher/modpe/ProtobufMetaStore;

    return-object v0
.end method
