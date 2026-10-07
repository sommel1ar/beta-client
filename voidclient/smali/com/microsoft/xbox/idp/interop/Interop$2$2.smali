.class Lcom/microsoft/xbox/idp/interop/Interop$2$2;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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


# direct methods
.method constructor <init>(Lcom/microsoft/xbox/idp/interop/Interop$2;)V
    .locals 0
    .param p1, "this$0"    # Lcom/microsoft/xbox/idp/interop/Interop$2;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$2;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/microsoft/xbox/idp/interop/Interop$2$2;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$2;

    iget-wide v0, v0, Lcom/microsoft/xbox/idp/interop/Interop$2;->val$userPtr:J

    const/4 v2, 0x2

    const-string v3, ""

    invoke-static {v0, v1, v2, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->auth_flow_callback(JILjava/lang/String;)V

    .line 113
    return-void
.end method
