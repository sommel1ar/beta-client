.class public Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;
.super Ljava/lang/Object;
.source "DragDropListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/DragDropListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DragDropGroup"
.end annotation


# instance fields
.field public deleterView:Landroid/view/View;

.field public draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

.field public draggedItemContainer:Landroid/widget/RelativeLayout;

.field public draggedItemId:I

.field public draggedView:Landroid/view/View;

.field public lists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/mcpelauncher/DragDropListView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 322
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->lists:Ljava/util/ArrayList;

    .line 323
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedView:Landroid/view/View;

    return-void
.end method
