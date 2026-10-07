.class public Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
.super Ljava/lang/Object;
.source "Renderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/modpe/api/Renderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ModelPart"
.end annotation


# static fields
.field public static modelPartIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final id:I

.field public final partId:I

.field private texH:F

.field private texTransparent:Z

.field private texW:F

.field private texX:I

.field private texY:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    .line 86
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "head"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "hat"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "headwear"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "body"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "rightArm"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "leftArm"

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "rightLeg"

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->modelPartIds:Ljava/util/HashMap;

    const-string v1, "leftLeg"

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "partId"    # I

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texX:I

    .line 39
    iput v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texY:I

    .line 40
    const/high16 v0, 0x42800000    # 64.0f

    iput v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texW:F

    .line 41
    const/high16 v0, 0x42000000    # 32.0f

    iput v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texH:F

    .line 45
    iput p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->id:I

    .line 46
    iput p2, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->partId:I

    .line 47
    return-void
.end method


# virtual methods
.method public addBox(FFFIII)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 8
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "d"    # I

    .prologue
    .line 55
    const/high16 v7, 0x3f800000    # 1.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->addBox(FFFIIIF)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;

    move-result-object v0

    return-object v0
.end method

.method public addBox(FFFIIIF)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 14
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "d"    # I
    .param p7, "scale"    # F

    .prologue
    .line 50
    iget v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->id:I

    iget v1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->partId:I

    iget v9, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texX:I

    iget v10, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texY:I

    iget v11, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texW:F

    iget v12, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texH:F

    iget-boolean v13, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texTransparent:Z

    move v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-static/range {v0 .. v13}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->access$000(IIFFFIIIFIIFFZ)I

    .line 51
    return-object p0
.end method

.method public clear()Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 2

    .prologue
    .line 59
    iget v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->id:I

    iget v1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->partId:I

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->access$100(II)I

    .line 60
    return-object p0
.end method

.method public setRotationPoint(FFF)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 2
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F

    .prologue
    .line 64
    iget v0, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->id:I

    iget v1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->partId:I

    invoke-static {v0, v1, p1, p2, p3}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->access$200(IIFFF)I

    .line 65
    return-object p0
.end method

.method public setTextureOffset(II)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->setTextureOffset(IIZ)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;

    move-result-object v0

    return-object v0
.end method

.method public setTextureOffset(IIZ)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "transparent"    # Z

    .prologue
    .line 69
    iput p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texX:I

    .line 70
    iput p2, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texY:I

    .line 71
    iput-boolean p3, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texTransparent:Z

    .line 72
    return-object p0
.end method

.method public setTextureSize(FF)Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    .locals 0
    .param p1, "w"    # F
    .param p2, "h"    # F

    .prologue
    .line 80
    iput p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texW:F

    .line 81
    iput p2, p0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;->texH:F

    .line 82
    return-object p0
.end method
