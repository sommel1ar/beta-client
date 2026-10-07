.class Lio/mrarm/mctoolbox/MinecraftActivity$2;
.super Ljava/lang/Object;
.source "MinecraftActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mctoolbox/MinecraftActivity;->showAd()V
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
    .line 43
    iput-object p1, p0, Lio/mrarm/mctoolbox/MinecraftActivity$2;->this$0:Lio/mrarm/mctoolbox/MinecraftActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lio/mrarm/mctoolbox/MinecraftActivity$2;->this$0:Lio/mrarm/mctoolbox/MinecraftActivity;

    iget-object v0, v0, Lio/mrarm/mctoolbox/MinecraftActivity;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lio/mrarm/mctoolbox/MinecraftActivity$2;->this$0:Lio/mrarm/mctoolbox/MinecraftActivity;

    iget-object v0, v0, Lio/mrarm/mctoolbox/MinecraftActivity;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    .line 49
    :cond_0
    return-void
.end method
