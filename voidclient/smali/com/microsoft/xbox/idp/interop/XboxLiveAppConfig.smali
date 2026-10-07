.class public Lcom/microsoft/xbox/idp/interop/XboxLiveAppConfig;
.super Ljava/lang/Object;
.source "XboxLiveAppConfig.java"


# instance fields
.field private final id:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    invoke-static {}, Lcom/microsoft/xbox/idp/interop/XboxLiveAppConfig;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/microsoft/xbox/idp/interop/XboxLiveAppConfig;->id:J

    .line 9
    return-void
.end method

.method private static native create()J
.end method

.method private static native delete(J)V
.end method

.method private static native getEnvironment(J)Ljava/lang/String;
.end method

.method private static native getProxy(J)Ljava/lang/String;
.end method

.method private static native getSandbox(J)Ljava/lang/String;
.end method

.method private static native getScid(J)Ljava/lang/String;
.end method

.method private static native getTitleId(J)I
.end method

.method private static native setEnvironment(JLjava/lang/String;)V
.end method

.method private static native setProxy(JLjava/lang/String;)V
.end method

.method private static native setSandbox(JLjava/lang/String;)V
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
    .line 23
    iget-wide v0, p0, Lcom/microsoft/xbox/idp/interop/XboxLiveAppConfig;->id:J

    invoke-static {v0, v1}, Lcom/microsoft/xbox/idp/interop/XboxLiveAppConfig;->delete(J)V

    .line 24
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 25
    return-void
.end method
