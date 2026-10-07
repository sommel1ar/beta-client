.class public Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;
.super Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TexturePacksAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter",
        "<",
        "Lio/mrarm/mcpelauncher/TexturePackInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;


# direct methods
.method public constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;Lio/mrarm/mcpelauncher/DragDropListView;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;
    .param p2, "listView"    # Lio/mrarm/mcpelauncher/DragDropListView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/mrarm/mcpelauncher/DragDropListView;",
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/mcpelauncher/TexturePackInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 250
    .local p3, "values":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lio/mrarm/mcpelauncher/TexturePackInfo;>;"
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    .line 251
    invoke-direct {p0, p2, p3}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;-><init>(Lio/mrarm/mcpelauncher/DragDropListView;Ljava/util/ArrayList;)V

    .line 252
    return-void
.end method


# virtual methods
.method public addItemAt(ILio/mrarm/mcpelauncher/TexturePackInfo;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "obj"    # Lio/mrarm/mcpelauncher/TexturePackInfo;

    .prologue
    .line 269
    invoke-super {p0, p1, p2}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->addItemAt(ILjava/lang/Object;)V

    .line 270
    const/4 v0, 0x1

    sput-boolean v0, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z

    .line 271
    return-void
.end method

.method public bridge synthetic addItemAt(ILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 248
    check-cast p2, Lio/mrarm/mcpelauncher/TexturePackInfo;

    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->addItemAt(ILio/mrarm/mcpelauncher/TexturePackInfo;)V

    return-void
.end method

.method public canDrag(I)Z
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 256
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/TexturePackInfo;

    iget-boolean v0, v0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public destroyItem(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 275
    iget-object v1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/TexturePackInfo;

    .line 276
    .local v0, "info":Lio/mrarm/mcpelauncher/TexturePackInfo;
    iget-object v1, v0, Lio/mrarm/mcpelauncher/TexturePackInfo;->file:Ljava/io/File;

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity;->access$200(Ljava/io/File;)V

    .line 277
    const/4 v1, 0x1

    sput-boolean v1, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z

    .line 278
    invoke-super {p0, p1}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->destroyItem(I)V

    .line 279
    return-void
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v6, 0x0

    .line 283
    if-nez p2, :cond_0

    .line 284
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v7, "layout_inflater"

    .line 285
    invoke-virtual {v5, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 286
    .local v3, "inflater":Landroid/view/LayoutInflater;
    sget v5, Lio/mrarm/mcpelauncher/R$layout;->texture_pack:I

    invoke-virtual {v3, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 288
    .end local v3    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    sget v5, Lio/mrarm/mcpelauncher/R$id;->packName:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 289
    .local v4, "name":Landroid/widget/TextView;
    sget v5, Lio/mrarm/mcpelauncher/R$id;->packDesc:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 290
    .local v0, "desc":Landroid/widget/TextView;
    sget v5, Lio/mrarm/mcpelauncher/R$id;->packIcon:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 291
    .local v2, "icon":Landroid/widget/ImageView;
    iget-object v5, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/TexturePackInfo;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/TexturePackInfo;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v5, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/TexturePackInfo;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/TexturePackInfo;->desc:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 293
    iget-object v5, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/TexturePackInfo;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/TexturePackInfo;->icon:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 294
    sget v5, Lio/mrarm/mcpelauncher/R$id;->dragHandle:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 295
    .local v1, "dragHandle":Landroid/widget/ImageView;
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->canDrag(I)Z

    move-result v5

    if-eqz v5, :cond_1

    move v5, v6

    :goto_0
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 297
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->setVisibility(ILandroid/view/View;)V

    .line 298
    return-object p2

    .line 295
    :cond_1
    const/4 v5, 0x4

    goto :goto_0
.end method

.method public transformDropIndex(I)I
    .locals 2
    .param p1, "pos"    # I

    .prologue
    .line 261
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment$TexturePacksAdapter;->values:Ljava/util/ArrayList;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/TexturePackInfo;

    iget-boolean v0, v0, Lio/mrarm/mcpelauncher/TexturePackInfo;->isDefault:Z

    if-eqz v0, :cond_0

    .line 262
    add-int/lit8 p1, p1, -0x1

    .line 264
    .end local p1    # "pos":I
    :cond_0
    return p1
.end method
