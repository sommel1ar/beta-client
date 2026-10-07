.class public Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/microsoft/xbox/idp/interop/Interop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AuthFlowXBLoginCallback"
.end annotation


# instance fields
.field public myUserPtr:J


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .param p1, "myUserPtr"    # J

    .prologue
    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 263
    iput-wide p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;->myUserPtr:J

    .line 264
    return-void
.end method


# virtual methods
.method public onError(IILjava/lang/String;)V
    .locals 2
    .param p1, "i"    # I
    .param p2, "i2"    # I
    .param p3, "str"    # Ljava/lang/String;

    .prologue
    .line 280
    const-string v0, "XBLoginCallback"

    const-string v1, "onError"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v1, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$2;

    invoke-direct {v1, p0}, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$2;-><init>(Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;)V

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 287
    return-void
.end method

.method public onLogin(JZ)V
    .locals 2
    .param p1, "l"    # J
    .param p3, "b"    # Z

    .prologue
    .line 268
    const-string v0, "XBLoginCallback"

    const-string v1, "onLogin"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v1, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$1;

    invoke-direct {v1, p0}, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$1;-><init>(Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;)V

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 276
    return-void
.end method
