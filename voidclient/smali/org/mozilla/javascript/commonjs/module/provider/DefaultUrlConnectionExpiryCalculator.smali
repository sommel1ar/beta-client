.class public Lorg/mozilla/javascript/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;
.super Ljava/lang/Object;
.source "DefaultUrlConnectionExpiryCalculator.java"

# interfaces
.implements Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final relativeExpiry:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    const-wide/32 v0, 0xea60

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;-><init>(J)V

    .line 30
    return-void
.end method

.method public constructor <init>(J)V
    .locals 3
    .param p1, "relativeExpiry"    # J

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "relativeExpiry < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    iput-wide p1, p0, Lorg/mozilla/javascript/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;->relativeExpiry:J

    .line 42
    return-void
.end method


# virtual methods
.method public calculateExpiry(Ljava/net/URLConnection;)J
    .locals 4
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .prologue
    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/mozilla/javascript/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;->relativeExpiry:J

    add-long/2addr v0, v2

    return-wide v0
.end method
