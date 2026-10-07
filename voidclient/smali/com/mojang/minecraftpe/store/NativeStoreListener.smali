.class public Lcom/mojang/minecraftpe/store/NativeStoreListener;
.super Ljava/lang/Object;
.source "NativeStoreListener.java"

# interfaces
.implements Lcom/mojang/minecraftpe/store/StoreListener;


# instance fields
.field id:J


# direct methods
.method constructor <init>(J)V
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-wide p1, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    .line 9
    return-void
.end method


# virtual methods
.method public native onPurchaseCanceled(JLjava/lang/String;)V
.end method

.method public onPurchaseCanceled(Ljava/lang/String;)V
    .locals 2
    .param p1, "product"    # Ljava/lang/String;

    .prologue
    .line 14
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onPurchaseCanceled(JLjava/lang/String;)V

    .line 15
    return-void
.end method

.method public native onPurchaseFailed(JLjava/lang/String;)V
.end method

.method public onPurchaseFailed(Ljava/lang/String;)V
    .locals 2
    .param p1, "product"    # Ljava/lang/String;

    .prologue
    .line 20
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onPurchaseFailed(JLjava/lang/String;)V

    .line 21
    return-void
.end method

.method public native onPurchaseSuccessful(JLjava/lang/String;)V
.end method

.method public onPurchaseSuccessful(Ljava/lang/String;)V
    .locals 2
    .param p1, "product"    # Ljava/lang/String;

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onPurchaseSuccessful(JLjava/lang/String;)V

    .line 27
    return-void
.end method

.method public onQueryProductsFail()V
    .locals 2

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onQueryProductsFail(J)V

    .line 33
    return-void
.end method

.method public native onQueryProductsFail(J)V
.end method

.method public native onQueryProductsSuccess(J[Lcom/mojang/minecraftpe/store/Product;)V
.end method

.method public onQueryProductsSuccess([Lcom/mojang/minecraftpe/store/Product;)V
    .locals 2
    .param p1, "products"    # [Lcom/mojang/minecraftpe/store/Product;

    .prologue
    .line 38
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onQueryProductsSuccess(J[Lcom/mojang/minecraftpe/store/Product;)V

    .line 39
    return-void
.end method

.method public onQueryPurchasesFail()V
    .locals 2

    .prologue
    .line 44
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onQueryPurchasesFail(J)V

    .line 45
    return-void
.end method

.method public native onQueryPurchasesFail(J)V
.end method

.method public native onQueryPurchasesSuccess(J[Lcom/mojang/minecraftpe/store/Purchase;)V
.end method

.method public onQueryPurchasesSuccess([Lcom/mojang/minecraftpe/store/Purchase;)V
    .locals 2
    .param p1, "purchases"    # [Lcom/mojang/minecraftpe/store/Purchase;

    .prologue
    .line 50
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onQueryPurchasesSuccess(J[Lcom/mojang/minecraftpe/store/Purchase;)V

    .line 51
    return-void
.end method

.method public native onStoreInitialized(JZ)V
.end method

.method public onStoreInitialized(Z)V
    .locals 2
    .param p1, "available"    # Z

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/mojang/minecraftpe/store/NativeStoreListener;->id:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/mojang/minecraftpe/store/NativeStoreListener;->onStoreInitialized(JZ)V

    .line 57
    return-void
.end method
