.class final Lcom/microsoft/xbox/idp/interop/Interop$2;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/microsoft/xbox/idp/interop/Interop;->InvokeAuthFlow(JLandroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$userPtr:J


# direct methods
.method constructor <init>(Landroid/app/Activity;J)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    iput-wide p2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$userPtr:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 80
    iget-object v5, p0, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    invoke-static {v5}, Lio/mrarm/mcpelauncher/MSAHelper;->getMSA(Landroid/content/Context;)Lio/mrarm/msa/MSA;

    move-result-object v5

    invoke-virtual {v5}, Lio/mrarm/msa/MSA;->getAccounts()Ljava/util/ArrayList;

    move-result-object v0

    .line 81
    .local v0, "accounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lio/mrarm/msa/UserAccount;>;"
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    invoke-direct {v1, v5}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 82
    .local v1, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    const-string v5, "Select Microsoft account"

    invoke-virtual {v1, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 83
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    new-array v4, v5, [Ljava/lang/CharSequence;

    .line 84
    .local v4, "seq":[Ljava/lang/CharSequence;
    const/4 v5, 0x0

    const-string v6, "Add new account"

    aput-object v6, v4, v5

    .line 85
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 86
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/msa/UserAccount;

    invoke-virtual {v5}, Lio/mrarm/msa/UserAccount;->getEmail()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    .line 85
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 87
    :cond_0
    move-object v2, v4

    .line 88
    .local v2, "fseq":[Ljava/lang/CharSequence;
    new-instance v5, Lcom/microsoft/xbox/idp/interop/Interop$2$1;

    invoke-direct {v5, p0, v2}, Lcom/microsoft/xbox/idp/interop/Interop$2$1;-><init>(Lcom/microsoft/xbox/idp/interop/Interop$2;[Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v4, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 109
    new-instance v5, Lcom/microsoft/xbox/idp/interop/Interop$2$2;

    invoke-direct {v5, p0}, Lcom/microsoft/xbox/idp/interop/Interop$2$2;-><init>(Lcom/microsoft/xbox/idp/interop/Interop$2;)V

    invoke-virtual {v1, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 115
    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    .line 116
    return-void
.end method
