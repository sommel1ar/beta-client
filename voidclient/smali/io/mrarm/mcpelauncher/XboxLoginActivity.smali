.class public Lio/mrarm/mcpelauncher/XboxLoginActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "XboxLoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;
    }
.end annotation


# instance fields
.field private externalInterface:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 28
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    sget v2, Lio/mrarm/mcpelauncher/R$layout;->activity_xbox_login:I

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/XboxLoginActivity;->setContentView(I)V

    .line 30
    sget v2, Lio/mrarm/mcpelauncher/R$id;->webView:I

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/XboxLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    .line 31
    .local v1, "webView":Landroid/webkit/WebView;
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 32
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 33
    new-instance v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/XboxLoginActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "NativeUserPtr"

    const-wide/16 v6, -0x1

    invoke-virtual {v3, v4, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-direct {v2, p0, v4, v5}, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;-><init>(Landroid/app/Activity;J)V

    iput-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity;->externalInterface:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    .line 34
    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity;->externalInterface:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    const-string v3, "external"

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    const-string v2, "https://login.live.com/ppsecure/InlineConnect.srf?id=80604&platform=android2.1.0504.0524&client_id=android-app%3A%2F%2Fcom.mojang.minecraftpe.H62DKCBHJP6WXXIV7RBFOGOL4NAK4E6Y&cobrandid=90011&mkt=en-US&phone=&email="

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method protected onDestroy()V
    .locals 4

    .prologue
    .line 40
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onDestroy()V

    .line 41
    iget-object v0, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity;->externalInterface:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-boolean v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->hasSucceeded:Z

    if-nez v0, :cond_0

    .line 42
    iget-object v0, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity;->externalInterface:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-wide v0, v0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->userPtr:J

    const/4 v2, 0x2

    const-string v3, ""

    invoke-static {v0, v1, v2, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->auth_flow_callback(JILjava/lang/String;)V

    .line 43
    :cond_0
    return-void
.end method
