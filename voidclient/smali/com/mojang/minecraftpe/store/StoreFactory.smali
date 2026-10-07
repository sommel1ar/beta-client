.class public Lcom/mojang/minecraftpe/store/StoreFactory;
.super Ljava/lang/Object;
.source "StoreFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createAmazonAppStore(Lcom/mojang/minecraftpe/store/StoreListener;)Lcom/mojang/minecraftpe/store/Store;
    .locals 1
    .param p0, "storeListener"    # Lcom/mojang/minecraftpe/store/StoreListener;

    .prologue
    .line 7
    new-instance v0, Lcom/mojang/minecraftpe/store/TestStore;

    invoke-direct {v0, p0}, Lcom/mojang/minecraftpe/store/TestStore;-><init>(Lcom/mojang/minecraftpe/store/StoreListener;)V

    return-object v0
.end method

.method static createGooglePlayStore(Ljava/lang/String;Lcom/mojang/minecraftpe/store/StoreListener;)Lcom/mojang/minecraftpe/store/Store;
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "storeListener"    # Lcom/mojang/minecraftpe/store/StoreListener;

    .prologue
    .line 12
    new-instance v0, Lcom/mojang/minecraftpe/store/TestStore;

    invoke-direct {v0, p1}, Lcom/mojang/minecraftpe/store/TestStore;-><init>(Lcom/mojang/minecraftpe/store/StoreListener;)V

    return-object v0
.end method

.method static createSamsungAppStore(Lcom/mojang/minecraftpe/store/StoreListener;)Lcom/mojang/minecraftpe/store/Store;
    .locals 1
    .param p0, "storeListener"    # Lcom/mojang/minecraftpe/store/StoreListener;

    .prologue
    .line 17
    new-instance v0, Lcom/mojang/minecraftpe/store/TestStore;

    invoke-direct {v0, p0}, Lcom/mojang/minecraftpe/store/TestStore;-><init>(Lcom/mojang/minecraftpe/store/StoreListener;)V

    return-object v0
.end method
