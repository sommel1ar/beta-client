.class Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;
.super Ljava/lang/Object;
.source "XboxLoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

.field final synthetic val$dialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$1"    # Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    .prologue
    .line 94
    iput-object p1, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iput-object p2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 97
    sget-object v2, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Lio/mrarm/mcpelauncher/MSAHelper;->getMSA(Landroid/content/Context;)Lio/mrarm/msa/MSA;

    move-result-object v0

    .line 98
    .local v0, "msa":Lio/mrarm/msa/MSA;
    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->properties:Ljava/util/HashMap;

    const-string v3, "Username"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v5, Lio/mrarm/msa/LegacyToken;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->properties:Ljava/util/HashMap;

    const-string v4, "DAToken"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v4, v4, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v4, v4, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->properties:Ljava/util/HashMap;

    const-string v6, "DASessionKey"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v5, v3, v4}, Lio/mrarm/msa/LegacyToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v5}, Lio/mrarm/msa/MSA;->addAccount(Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V

    .line 99
    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->properties:Ljava/util/HashMap;

    const-string v3, "Username"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Lio/mrarm/msa/MSA;->getAccountByEmail(Ljava/lang/String;)Lio/mrarm/msa/UserAccount;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Lio/mrarm/msa/SecurityScope;

    const/4 v4, 0x0

    new-instance v5, Lio/mrarm/msa/SecurityScope;

    const-string v6, "http://Passport.NET/tb"

    invoke-direct {v5, v6}, Lio/mrarm/msa/SecurityScope;-><init>(Ljava/lang/String;)V

    aput-object v5, v3, v4

    new-instance v4, Lio/mrarm/msa/SecurityScope;

    const-string v5, "user.auth.xboxlive.com"

    const-string v6, "mbi_ssl"

    invoke-direct {v4, v5, v6}, Lio/mrarm/msa/SecurityScope;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v4, v3, v7

    invoke-virtual {v2, v0, v3}, Lio/mrarm/msa/UserAccount;->requestTokens(Lio/mrarm/msa/MSA;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;

    move-result-object v1

    .line 100
    .local v1, "tokens":[Lio/mrarm/msa/Token;
    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-wide v4, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->userPtr:J

    aget-object v2, v1, v7

    check-cast v2, Lio/mrarm/msa/CompactToken;

    invoke-virtual {v2}, Lio/mrarm/msa/CompactToken;->getStringToken()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    iget-object v6, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v6, v6, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-wide v6, v6, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->userPtr:J

    invoke-direct {v3, v6, v7}, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;-><init>(J)V

    invoke-static {v4, v5, v2, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->InvokeXBLogin(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;)V

    .line 101
    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v3, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->ctx:Landroid/app/Activity;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->properties:Ljava/util/HashMap;

    const-string v4, "Username"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v3, v2}, Lio/mrarm/mcpelauncher/MSAHelper;->setLastAccount(Landroid/content/Context;Ljava/lang/String;)V

    .line 102
    iget-object v2, p0, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;->this$1:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1;->this$0:Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;

    iget-object v2, v2, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface;->ctx:Landroid/app/Activity;

    new-instance v3, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;

    invoke-direct {v3, p0}, Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1$1;-><init>(Lio/mrarm/mcpelauncher/XboxLoginActivity$ExternalInterface$1$1;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 110
    return-void
.end method
