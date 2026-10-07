.class Lcom/mojang/minecraftpe/MainActivity$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mojang/minecraftpe/MainActivity;->showKeyboard(Ljava/lang/String;IZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mojang/minecraftpe/MainActivity;

.field final synthetic val$limitInput:Z

.field final synthetic val$maxLen:I

.field final synthetic val$onlyNumbers:Z

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mojang/minecraftpe/MainActivity;Ljava/lang/String;ZIZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/mojang/minecraftpe/MainActivity;

    .prologue
    .line 337
    iput-object p1, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iput-object p2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$text:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$limitInput:Z

    iput p4, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$maxLen:I

    iput-boolean p5, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$onlyNumbers:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, -0x1

    const/4 v7, -0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 340
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    if-nez v2, :cond_0

    .line 341
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    new-instance v3, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    iget-object v4, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    invoke-direct {v3, v4}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;-><init>(Lcom/mojang/minecraftpe/MainActivity;)V

    iput-object v3, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    .line 343
    :cond_0
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    iget-object v3, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setText(Ljava/lang/CharSequence;)V

    .line 344
    iget-boolean v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$limitInput:Z

    if-eqz v2, :cond_1

    .line 345
    new-array v0, v6, [Landroid/text/InputFilter;

    .line 346
    .local v0, "filterArray":[Landroid/text/InputFilter;
    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    iget v3, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$maxLen:I

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v0, v5

    .line 347
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2, v0}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setFilters([Landroid/text/InputFilter;)V

    .line 349
    .end local v0    # "filterArray":[Landroid/text/InputFilter;
    :cond_1
    iget-boolean v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->val$onlyNumbers:Z

    if-eqz v2, :cond_2

    .line 350
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2, v9}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setInputType(I)V

    .line 352
    :cond_2
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2, v6}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setSingleLine(Z)V

    .line 353
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    const v3, 0x12000005

    invoke-virtual {v2, v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setImeOptions(I)V

    .line 354
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2, v5}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setWidth(I)V

    .line 355
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2, v5}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setHeight(I)V

    .line 356
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    if-eqz v2, :cond_3

    .line 357
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->requestFocus()Z

    .line 358
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    iget-object v3, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v3, v3, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setSelection(I)V

    .line 392
    :goto_0
    return-void

    .line 362
    :cond_3
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    new-instance v3, Lcom/mojang/minecraftpe/MainActivity$5$1;

    invoke-direct {v3, p0}, Lcom/mojang/minecraftpe/MainActivity$5$1;-><init>(Lcom/mojang/minecraftpe/MainActivity$5;)V

    invoke-virtual {v2, v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 379
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    new-instance v3, Landroid/widget/PopupWindow;

    iget-object v4, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v4, v4, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-direct {v3, v4, v8, v8}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    iput-object v3, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    .line 380
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v2, v7, v7}, Landroid/widget/PopupWindow;->setWindowLayoutMode(II)V

    .line 381
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v2, v6}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 382
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v2, v5}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 383
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v2, v6}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 384
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 385
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardWindow:Landroid/widget/PopupWindow;

    iget-object v3, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    invoke-virtual {v3}, Lcom/mojang/minecraftpe/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x11

    invoke-virtual {v2, v3, v4, v5, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 387
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v2}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->requestFocus()Z

    .line 388
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v2, v2, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    iget-object v3, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v3, v3, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->setSelection(I)V

    .line 390
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Lcom/mojang/minecraftpe/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 391
    .local v1, "mgr":Landroid/view/inputmethod/InputMethodManager;
    iget-object v2, p0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    invoke-virtual {v2}, Lcom/mojang/minecraftpe/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2, v9}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto/16 :goto_0
.end method
