.class public Lcom/mojang/minecraftpe/MainActivity$CustomEditText;
.super Landroid/widget/EditText;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mojang/minecraftpe/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CustomEditText"
.end annotation


# instance fields
.field activity:Lcom/mojang/minecraftpe/MainActivity;


# direct methods
.method public constructor <init>(Lcom/mojang/minecraftpe/MainActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/mojang/minecraftpe/MainActivity;

    .prologue
    .line 401
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 402
    iput-object p1, p0, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->activity:Lcom/mojang/minecraftpe/MainActivity;

    .line 403
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 427
    return-void
.end method

.method public onEditorAction(I)V
    .locals 2
    .param p1, "actionCode"    # I

    .prologue
    .line 418
    and-int/lit16 v0, p1, 0xff

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    .line 419
    iget-object v0, p0, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->activity:Lcom/mojang/minecraftpe/MainActivity;

    invoke-virtual {v0}, Lcom/mojang/minecraftpe/MainActivity;->nativeReturnKeyPressed()V

    .line 421
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/EditText;->onEditorAction(I)V

    .line 422
    return-void
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 407
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 408
    iget-object v0, p0, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->activity:Lcom/mojang/minecraftpe/MainActivity;

    invoke-virtual {v0}, Lcom/mojang/minecraftpe/MainActivity;->hideKeyboard()V

    .line 409
    iget-object v0, p0, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->activity:Lcom/mojang/minecraftpe/MainActivity;

    invoke-virtual {v0}, Lcom/mojang/minecraftpe/MainActivity;->nativeBackPressed()V

    .line 410
    const/4 v0, 0x1

    .line 413
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
