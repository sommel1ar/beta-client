.class public Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;
.super Ljava/lang/Object;
.source "Renderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/modpe/api/Renderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field public final id:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;->id:I

    .line 104
    return-void
.end method


# virtual methods
.method public getPart(Ljava/lang/String;)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 107
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 108
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid model part name!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_0
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 110
    .local v0, "part":I
    new-instance v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;

    iget v2, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;->id:I

    invoke-direct {v1, v2, v0}, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;-><init>(II)V

    return-object v1
.end method
