.class Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;
.super Ljava/lang/Object;
.source "ModPETextureOverride.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CacheEntry"
.end annotation


# instance fields
.field public fileName:Ljava/lang/String;

.field public lastAccessed:J

.field public name:Ljava/lang/String;

.field public timeCreated:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 222
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->name:Ljava/lang/String;

    .line 225
    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->fileName:Ljava/lang/String;

    .line 226
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->timeCreated:J

    .line 227
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride$CacheEntry;->lastAccessed:J

    .line 228
    return-void
.end method
