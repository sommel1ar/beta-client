.class Lio/mrarm/mcpelauncher/DragDropListView$2;
.super Ljava/lang/Object;
.source "DragDropListView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/DragDropListView;->init(Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/DragDropListView;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/DragDropListView;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/DragDropListView;

    .prologue
    .line 67
    iput-object p1, p0, Lio/mrarm/mcpelauncher/DragDropListView$2;->this$0:Lio/mrarm/mcpelauncher/DragDropListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 76
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 70
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$2;->this$0:Lio/mrarm/mcpelauncher/DragDropListView;

    invoke-static {v0}, Lio/mrarm/mcpelauncher/DragDropListView;->access$000(Lio/mrarm/mcpelauncher/DragDropListView;)V

    .line 71
    return-void
.end method
