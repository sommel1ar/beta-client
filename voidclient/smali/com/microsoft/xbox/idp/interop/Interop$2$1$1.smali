.class Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/microsoft/xbox/idp/interop/Interop$2$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/microsoft/xbox/idp/interop/Interop$2$1;

.field final synthetic val$email:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/microsoft/xbox/idp/interop/Interop$2$1;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->this$1:Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    iput-object p2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->val$email:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 100
    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->this$1:Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    invoke-static {v2}, Lio/mrarm/mcpelauncher/MSAHelper;->getMSA(Landroid/content/Context;)Lio/mrarm/msa/MSA;

    move-result-object v0

    .line 101
    .local v0, "msa":Lio/mrarm/msa/MSA;
    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->val$email:Ljava/lang/String;

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

    .line 102
    .local v1, "tokens":[Lio/mrarm/msa/Token;
    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->this$1:Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-wide v4, v2, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$userPtr:J

    aget-object v2, v1, v7

    check-cast v2, Lio/mrarm/msa/CompactToken;

    invoke-virtual {v2}, Lio/mrarm/msa/CompactToken;->getStringToken()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    iget-object v6, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->this$1:Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    iget-object v6, v6, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-wide v6, v6, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$userPtr:J

    invoke-direct {v3, v6, v7}, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;-><init>(J)V

    invoke-static {v4, v5, v2, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->InvokeXBLogin(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;)V

    .line 103
    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->this$1:Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;->val$email:Ljava/lang/String;

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/MSAHelper;->setLastAccount(Landroid/content/Context;Ljava/lang/String;)V

    .line 104
    return-void
.end method
