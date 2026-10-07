.class public Lio/mrarm/mcpelauncher/prepatch/PrepatchUtils;
.super Ljava/lang/Object;
.source "PrepatchUtils.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "mobilesubstrate"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    const-string v0, "mcpelauncher-prepatch-utils"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native patchSoname(Ljava/lang/String;Ljava/lang/String;)Z
.end method
