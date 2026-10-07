.class public Lio/mrarm/mcpelauncher/modpe/api/Renderer;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Renderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;,
        Lio/mrarm/mcpelauncher/modpe/api/Renderer$Model;,
        Lio/mrarm/mcpelauncher/modpe/api/Renderer$ModelPart;
    }
.end annotation


# static fields
.field public static byId:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;",
            ">;"
        }
    .end annotation
.end field

.field public static byName:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byId:Ljava/util/HashMap;

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byName:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method static synthetic access$000(IIFFFIIIFIIFFZ)I
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # F
    .param p3, "x3"    # F
    .param p4, "x4"    # F
    .param p5, "x5"    # I
    .param p6, "x6"    # I
    .param p7, "x7"    # I
    .param p8, "x8"    # F
    .param p9, "x9"    # I
    .param p10, "x10"    # I
    .param p11, "x11"    # F
    .param p12, "x12"    # F
    .param p13, "x13"    # Z

    .prologue
    .line 8
    invoke-static/range {p0 .. p13}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->nativeAddBox(IIFFFIIIFIIFFZ)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(II)I
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # I

    .prologue
    .line 8
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->nativeClear(II)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(IIFFF)I
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # F
    .param p3, "x3"    # F
    .param p4, "x4"    # F

    .prologue
    .line 8
    invoke-static {p0, p1, p2, p3, p4}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->nativeSetRotationPoint(IIFFF)I

    move-result v0

    return v0
.end method

.method public static createHumanoidRenderer()Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;
    .locals 2
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 15
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->nativeCreateHumanoidRenderer()I

    move-result v1

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;-><init>(I)V

    return-object v0
.end method

.method public static get(Ljava/lang/String;)Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 21
    :try_start_0
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byId:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    :goto_0
    return-object v1

    .line 22
    :catch_0
    move-exception v0

    .line 23
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer;->byName:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/modpe/api/Renderer$RendererInterface;

    goto :goto_0
.end method

.method private static native nativeAddBox(IIFFFIIIFIIFFZ)I
.end method

.method private static native nativeClear(II)I
.end method

.method private static native nativeCreateHumanoidRenderer()I
.end method

.method private static native nativeSetRotationPoint(IIFFF)I
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    const-string v0, "Renderer"

    return-object v0
.end method
