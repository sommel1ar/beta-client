.class public Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;
.super Landroid/widget/ArrayAdapter;
.source "DragDropListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/DragDropListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DragDropAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/widget/ArrayAdapter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final listView:Lio/mrarm/mcpelauncher/DragDropListView;

.field protected final values:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/mrarm/mcpelauncher/DragDropListView;Ljava/util/ArrayList;)V
    .locals 2
    .param p1, "listView"    # Lio/mrarm/mcpelauncher/DragDropListView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/mrarm/mcpelauncher/DragDropListView;",
            "Ljava/util/ArrayList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    .local p2, "values":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-virtual {p1}, Lio/mrarm/mcpelauncher/DragDropListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 335
    iput-object p1, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->listView:Lio/mrarm/mcpelauncher/DragDropListView;

    .line 336
    iput-object p2, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->values:Ljava/util/ArrayList;

    .line 337
    return-void
.end method


# virtual methods
.method public addItemAt(ILjava/lang/Object;)V
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 365
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    .local p2, "obj":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 366
    return-void
.end method

.method public canDrag(I)Z
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 340
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public destroyItem(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 361
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->removeItem(I)V

    .line 362
    return-void
.end method

.method public removeItem(I)V
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 356
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->values:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 357
    return-void
.end method

.method protected setVisibility(ILandroid/view/View;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 348
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->listView:Lio/mrarm/mcpelauncher/DragDropListView;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/DragDropListView;->getDragDropGroup()Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-result-object v0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    if-ne v0, p0, :cond_0

    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->listView:Lio/mrarm/mcpelauncher/DragDropListView;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/DragDropListView;->getDragDropGroup()Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-result-object v0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    if-ne v0, p1, :cond_0

    .line 349
    const/4 v0, 0x4

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 353
    :goto_0
    return-void

    .line 351
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public transformDropIndex(I)I
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 344
    .local p0, "this":Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;, "Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter<TT;>;"
    return p1
.end method
