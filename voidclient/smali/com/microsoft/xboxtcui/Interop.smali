.class public Lcom/microsoft/xboxtcui/Interop;
.super Ljava/lang/Object;
.source "Interop.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ShowFriendFinder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "ctx"    # Landroid/app/Activity;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "str2"    # Ljava/lang/String;

    .prologue
    .line 32
    new-instance v0, Lcom/microsoft/xboxtcui/Interop$3;

    invoke-direct {v0, p0}, Lcom/microsoft/xboxtcui/Interop$3;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 38
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/microsoft/xboxtcui/Interop;->tcui_completed_callback(I)V

    .line 39
    return-void
.end method

.method public static ShowUserProfile(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 12
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v1, Lcom/microsoft/xboxtcui/Interop$1;

    invoke-direct {v1, p0}, Lcom/microsoft/xboxtcui/Interop$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 18
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/microsoft/xboxtcui/Interop;->tcui_completed_callback(I)V

    .line 19
    return-void
.end method

.method public static ShowUserSettings(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 22
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v1, Lcom/microsoft/xboxtcui/Interop$2;

    invoke-direct {v1, p0}, Lcom/microsoft/xboxtcui/Interop$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 28
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/microsoft/xboxtcui/Interop;->tcui_completed_callback(I)V

    .line 29
    return-void
.end method

.method private static native tcui_completed_callback(I)V
.end method
