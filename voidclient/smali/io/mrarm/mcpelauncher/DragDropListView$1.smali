.class Lio/mrarm/mcpelauncher/DragDropListView$1;
.super Ljava/lang/Object;
.source "DragDropListView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


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
    .line 60
    iput-object p1, p0, Lio/mrarm/mcpelauncher/DragDropListView$1;->this$0:Lio/mrarm/mcpelauncher/DragDropListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView$1;->this$0:Lio/mrarm/mcpelauncher/DragDropListView;

    invoke-virtual {v0, p3}, Lio/mrarm/mcpelauncher/DragDropListView;->startDrag(I)V

    .line 64
    const/4 v0, 0x0

    return v0
.end method
