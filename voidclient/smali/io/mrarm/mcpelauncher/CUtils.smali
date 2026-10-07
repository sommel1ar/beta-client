.class public Lio/mrarm/mcpelauncher/CUtils;
.super Ljava/lang/Object;
.source "CUtils.java"


# static fields
.field static PROTECTION_EXEC_ADD_WRITE:I

.field static PROTECTION_EXEC_RESTORE:I

.field static PROTECTION_EXEC_TO_WRITE:I

.field static PROTECTION_READ_ADD_WRITE:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const/4 v0, 0x0

    sput v0, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_EXEC_TO_WRITE:I

    .line 9
    const/4 v0, 0x1

    sput v0, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_EXEC_RESTORE:I

    .line 10
    const/4 v0, 0x2

    sput v0, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_EXEC_ADD_WRITE:I

    .line 11
    const/4 v0, 0x3

    sput v0, Lio/mrarm/mcpelauncher/CUtils;->PROTECTION_READ_ADD_WRITE:I

    .line 37
    const-string v0, "mobilesubstrate"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 38
    const-string v0, "mcpelauncher-utils"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native addLibToPatchList(Ljava/lang/String;)Z
.end method

.method public static native addMenuOptionsButtonCallback()V
.end method

.method public static launchOptions()V
    .locals 3

    .prologue
    .line 30
    const-string v1, "CUtils"

    const-string v2, "Launch options"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    const-class v2, Lio/mrarm/mcpelauncher/SettingsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 32
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "can_restart"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 33
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-virtual {v1, v0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->startActivity(Landroid/content/Intent;)V

    .line 34
    return-void
.end method

.method public static native patchAssetManager()V
.end method

.method public static native patchVersionNumber(Ljava/lang/String;Z)V
.end method

.method public static native setLibProtectionMode(Ljava/lang/String;I)Z
.end method

.method public static native setPixelScale(F)V
.end method

.method public static native setVRMode()V
.end method

.method public static native setWin10GUIs(Z)V
.end method
