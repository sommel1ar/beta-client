.class public Lcom/microsoft/xbox/idp/interop/LocalConfig;
.super Ljava/lang/Object;
.source "LocalConfig.java"


# instance fields
.field private final id:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    invoke-static {}, Lcom/microsoft/xbox/idp/interop/LocalConfig;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/microsoft/xbox/idp/interop/LocalConfig;->id:J

    .line 9
    return-void
.end method

.method private static native create()J
.end method

.method private static native delete(J)V
.end method

.method private static native getCid(J)Ljava/lang/String;
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 16
    iget-wide v0, p0, Lcom/microsoft/xbox/idp/interop/LocalConfig;->id:J

    invoke-static {v0, v1}, Lcom/microsoft/xbox/idp/interop/LocalConfig;->delete(J)V

    .line 17
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 18
    return-void
.end method

.method public getCid()Ljava/lang/String;
    .locals 2

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/microsoft/xbox/idp/interop/LocalConfig;->id:J

    invoke-static {v0, v1}, Lcom/microsoft/xbox/idp/interop/LocalConfig;->getCid(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
