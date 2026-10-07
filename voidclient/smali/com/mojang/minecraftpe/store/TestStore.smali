.class public Lcom/mojang/minecraftpe/store/TestStore;
.super Ljava/lang/Object;
.source "TestStore.java"

# interfaces
.implements Lcom/mojang/minecraftpe/store/Store;


# instance fields
.field listener:Lcom/mojang/minecraftpe/store/StoreListener;

.field products:[Lcom/mojang/minecraftpe/store/Product;


# direct methods
.method constructor <init>(Lcom/mojang/minecraftpe/store/StoreListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/mojang/minecraftpe/store/StoreListener;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/mojang/minecraftpe/store/TestStore;->listener:Lcom/mojang/minecraftpe/store/StoreListener;

    .line 12
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/mojang/minecraftpe/store/StoreListener;->onStoreInitialized(Z)V

    .line 13
    return-void
.end method


# virtual methods
.method public acknowledgePurchase(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "paramString"    # Ljava/lang/String;
    .param p2, "paramString2"    # Ljava/lang/String;

    .prologue
    .line 46
    const-string v0, "TestStore"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "acknowledgePurchase: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method public destructor()V
    .locals 0

    .prologue
    .line 17
    return-void
.end method

.method public getStoreId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    const-string v0, "android.googleplay"

    return-object v0
.end method

.method public purchase(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 3
    .param p1, "product"    # Ljava/lang/String;
    .param p2, "paramBool"    # Z
    .param p3, "paramString2"    # Ljava/lang/String;

    .prologue
    .line 24
    const-string v0, "TestStore"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "purchase: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    iget-object v0, p0, Lcom/mojang/minecraftpe/store/TestStore;->listener:Lcom/mojang/minecraftpe/store/StoreListener;

    invoke-interface {v0, p1}, Lcom/mojang/minecraftpe/store/StoreListener;->onPurchaseFailed(Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method public queryProducts([Ljava/lang/String;)V
    .locals 5
    .param p1, "products"    # [Ljava/lang/String;

    .prologue
    .line 29
    const-string v2, "TestStore"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "queryProducts: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    array-length v2, p1

    new-array v1, v2, [Lcom/mojang/minecraftpe/store/Product;

    .line 31
    .local v1, "ret":[Lcom/mojang/minecraftpe/store/Product;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 32
    new-instance v2, Lcom/mojang/minecraftpe/store/Product;

    invoke-direct {v2}, Lcom/mojang/minecraftpe/store/Product;-><init>()V

    aput-object v2, v1, v0

    .line 33
    aget-object v2, v1, v0

    aget-object v3, p1, v0

    iput-object v3, v2, Lcom/mojang/minecraftpe/store/Product;->mId:Ljava/lang/String;

    .line 34
    aget-object v2, v1, v0

    const-string v3, "PRICELESS"

    iput-object v3, v2, Lcom/mojang/minecraftpe/store/Product;->mPrice:Ljava/lang/String;

    .line 31
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 36
    :cond_0
    iput-object v1, p0, Lcom/mojang/minecraftpe/store/TestStore;->products:[Lcom/mojang/minecraftpe/store/Product;

    .line 37
    iget-object v2, p0, Lcom/mojang/minecraftpe/store/TestStore;->listener:Lcom/mojang/minecraftpe/store/StoreListener;

    invoke-interface {v2, v1}, Lcom/mojang/minecraftpe/store/StoreListener;->onQueryProductsSuccess([Lcom/mojang/minecraftpe/store/Product;)V

    .line 38
    return-void
.end method

.method public queryPurchases()V
    .locals 2

    .prologue
    .line 41
    const-string v0, "TestStore"

    const-string v1, "queryPurchases"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    iget-object v0, p0, Lcom/mojang/minecraftpe/store/TestStore;->listener:Lcom/mojang/minecraftpe/store/StoreListener;

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/mojang/minecraftpe/store/Purchase;

    invoke-interface {v0, v1}, Lcom/mojang/minecraftpe/store/StoreListener;->onQueryPurchasesSuccess([Lcom/mojang/minecraftpe/store/Purchase;)V

    .line 43
    return-void
.end method
