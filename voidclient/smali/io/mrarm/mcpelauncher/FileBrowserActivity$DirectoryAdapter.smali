.class public Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;
.super Landroid/widget/ArrayAdapter;
.source "FileBrowserActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/FileBrowserActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DirectoryAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field protected files:[Ljava/io/File;


# direct methods
.method public constructor <init>(Landroid/content/Context;[Ljava/io/File;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "files"    # [Ljava/io/File;

    .prologue
    .line 98
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 99
    iput-object p2, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;->files:[Ljava/io/File;

    .line 100
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 104
    if-nez p2, :cond_0

    .line 105
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "layout_inflater"

    .line 106
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 107
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lio/mrarm/mcpelauncher/R$layout;->file_browser_item:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 109
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    sget v2, Lio/mrarm/mcpelauncher/R$id;->fileText:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 110
    .local v1, "text":Landroid/widget/TextView;
    iget-object v2, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;->files:[Ljava/io/File;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v2, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;->files:[Ljava/io/File;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 112
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lio/mrarm/mcpelauncher/R$drawable;->ic_insert_drive_file_black_24dp:I

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 116
    :goto_0
    return-object p2

    .line 114
    :cond_1
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lio/mrarm/mcpelauncher/R$drawable;->ic_folder_black_24dp:I

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method
