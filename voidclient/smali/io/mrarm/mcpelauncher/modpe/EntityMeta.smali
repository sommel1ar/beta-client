.class public Lio/mrarm/mcpelauncher/modpe/EntityMeta;
.super Ljava/lang/Object;
.source "EntityMeta.java"


# instance fields
.field public modpeData:Ljava/util/HashMap;
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

.field public renderType:I

.field public skin:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->skin:Ljava/lang/String;

    .line 15
    const/4 v0, 0x0

    iput v0, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->renderType:I

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->modpeData:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public getRenderType()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->renderType:I

    return v0
.end method

.method public getSkin()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->skin:Ljava/lang/String;

    return-object v0
.end method

.method public setRenderType(Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;I)V
    .locals 0
    .param p1, "store"    # Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;
    .param p2, "renderType"    # I

    .prologue
    .line 38
    iput p2, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->renderType:I

    .line 39
    invoke-interface {p1, p0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->notifyMetaChanged(Lio/mrarm/mcpelauncher/modpe/EntityMeta;)V

    .line 40
    return-void
.end method

.method public setSkin(Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;Ljava/lang/String;)V
    .locals 0
    .param p1, "store"    # Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;
    .param p2, "skin"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/EntityMeta;->skin:Ljava/lang/String;

    .line 30
    invoke-interface {p1, p0}, Lio/mrarm/mcpelauncher/modpe/WorldMetaStore;->notifyMetaChanged(Lio/mrarm/mcpelauncher/modpe/EntityMeta;)V

    .line 31
    return-void
.end method
