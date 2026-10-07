.class Lcom/microsoft/xbox/idp/interop/Interop$2$1;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/microsoft/xbox/idp/interop/Interop$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

.field final synthetic val$fseq:[Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lcom/microsoft/xbox/idp/interop/Interop$2;[Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "this$0"    # Lcom/microsoft/xbox/idp/interop/Interop$2;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iput-object p2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->val$fseq:[Ljava/lang/CharSequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 91
    if-nez p2, :cond_0

    .line 92
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    const-class v3, Lio/mrarm/mcpelauncher/XboxLoginActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "NativeUserPtr"

    iget-object v3, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-wide v4, v3, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$userPtr:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 94
    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-object v2, v2, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 107
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 96
    :cond_0
    iget-object v2, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$1;->val$fseq:[Ljava/lang/CharSequence;

    aget-object v2, v2, p2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "email":Ljava/lang/String;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;

    invoke-direct {v3, p0, v0}, Lcom/microsoft/xbox/idp/interop/Interop$2$1$1;-><init>(Lcom/microsoft/xbox/idp/interop/Interop$2$1;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 105
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method
