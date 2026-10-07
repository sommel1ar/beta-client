.class Lcom/mojang/minecraftpe/MainActivity$5$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mojang/minecraftpe/MainActivity$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mojang/minecraftpe/MainActivity$5;


# direct methods
.method constructor <init>(Lcom/mojang/minecraftpe/MainActivity$5;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mojang/minecraftpe/MainActivity$5;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/mojang/minecraftpe/MainActivity$5$1;->this$1:Lcom/mojang/minecraftpe/MainActivity$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 376
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 366
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 370
    iget-object v0, p0, Lcom/mojang/minecraftpe/MainActivity$5$1;->this$1:Lcom/mojang/minecraftpe/MainActivity$5;

    iget-object v0, v0, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v1, p0, Lcom/mojang/minecraftpe/MainActivity$5$1;->this$1:Lcom/mojang/minecraftpe/MainActivity$5;

    iget-object v1, v1, Lcom/mojang/minecraftpe/MainActivity$5;->this$0:Lcom/mojang/minecraftpe/MainActivity;

    iget-object v1, v1, Lcom/mojang/minecraftpe/MainActivity;->keyboardInput:Lcom/mojang/minecraftpe/MainActivity$CustomEditText;

    invoke-virtual {v1}, Lcom/mojang/minecraftpe/MainActivity$CustomEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mojang/minecraftpe/MainActivity;->nativeSetTextboxText(Ljava/lang/String;)V

    .line 371
    return-void
.end method
