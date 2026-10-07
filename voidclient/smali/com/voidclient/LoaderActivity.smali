.class public Lcom/voidclient/LoaderActivity;
.super Lio/mrarm/mcpelauncher/MinecraftActivity;
.source "LoaderActivity.java"


.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;-><init>()V

    return-void
.end method


.method protected loadNativeModLibraries()V
    .locals 1

    invoke-super {p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->loadNativeModLibraries()V

    const-string v0, "modclient"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method
