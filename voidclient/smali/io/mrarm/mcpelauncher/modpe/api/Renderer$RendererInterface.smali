.class public Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;
.super Ljava/lang/Object;
.source "Renderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/modpe/api/Renderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RendererInterface"
.end annotation


# instance fields
.field public final model:Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;

.field protected name:Ljava/lang/String;

.field public final renderType:I


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->name:Ljava/lang/String;

    .line 122
    iput p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->renderType:I

    .line 123
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byId:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;

    invoke-direct {v0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;-><init>(I)V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->model:Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;

    .line 125
    return-void
.end method


# virtual methods
.method public getModel()Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->model:Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRendererType()I
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->renderType:I

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 140
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 141
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byName:Ljava/util/HashMap;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_0
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byName:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 143
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The specified name already exists"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_1
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;->name:Ljava/lang/String;

    .line 145
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byName:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    return-void
.end method
