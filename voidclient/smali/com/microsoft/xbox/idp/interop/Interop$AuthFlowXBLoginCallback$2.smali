.class Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$2;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;->onError(IILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;


# direct methods
.method constructor <init>(Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;)V
    .locals 0
    .param p1, "this$0"    # Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$2;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 284
    iget-object v0, p0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$2;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    iget-wide v0, v0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;->myUserPtr:J

    const/4 v2, 0x3

    const-string v3, "Error while logging in to XBox"

    invoke-static {v0, v1, v2, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->auth_flow_callback(JILjava/lang/String;)V

    .line 285
    return-void
.end method
