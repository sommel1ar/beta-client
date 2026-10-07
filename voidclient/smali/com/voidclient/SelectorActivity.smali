.class public Lcom/voidclient/SelectorActivity;
.super Landroid/app/Activity;
.source "SelectorActivity.java"

.implements Landroid/view/View$OnClickListener;


.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string v1, "Void Client"

    invoke-virtual {p0, v1}, Lcom/voidclient/SelectorActivity;->setTitle(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "Launch Minecraft 0.15.10"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v0}, Lcom/voidclient/SelectorActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method


.method public onClick(Landroid/view/View;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "io.mrarm.mctoolbox"

    const-string v2, "com.voidclient.LoaderActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/voidclient/SelectorActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
