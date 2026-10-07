.class Lio/mrarm/mctoolbox/MinecraftActivity$1;
.super Lcom/google/android/gms/ads/AdListener;
.source "MinecraftActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mctoolbox/MinecraftActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mctoolbox/MinecraftActivity;


# direct methods
.method constructor <init>(Lio/mrarm/mctoolbox/MinecraftActivity;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mctoolbox/MinecraftActivity;

    .prologue
    .line 32
    iput-object p1, p0, Lio/mrarm/mctoolbox/MinecraftActivity$1;->this$0:Lio/mrarm/mctoolbox/MinecraftActivity;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lio/mrarm/mctoolbox/MinecraftActivity$1;->this$0:Lio/mrarm/mctoolbox/MinecraftActivity;

    invoke-static {v0}, Lio/mrarm/mctoolbox/MinecraftActivity;->access$000(Lio/mrarm/mctoolbox/MinecraftActivity;)V

    .line 36
    return-void
.end method
