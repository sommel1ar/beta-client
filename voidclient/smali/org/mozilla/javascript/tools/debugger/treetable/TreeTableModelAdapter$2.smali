.class Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;
.super Ljava/lang/Object;
.source "TreeTableModelAdapter.java"

# interfaces
.implements Ljavax/swing/event/TreeModelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;)V
    .locals 0

    .prologue
    .line 80
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public treeNodesChanged(Ljavax/swing/event/TreeModelEvent;)V
    .locals 1
    .param p1, "e"    # Ljavax/swing/event/TreeModelEvent;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->delayedFireTableDataChanged()V

    .line 83
    return-void
.end method

.method public treeNodesInserted(Ljavax/swing/event/TreeModelEvent;)V
    .locals 1
    .param p1, "e"    # Ljavax/swing/event/TreeModelEvent;

    .prologue
    .line 86
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->delayedFireTableDataChanged()V

    .line 87
    return-void
.end method

.method public treeNodesRemoved(Ljavax/swing/event/TreeModelEvent;)V
    .locals 1
    .param p1, "e"    # Ljavax/swing/event/TreeModelEvent;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->delayedFireTableDataChanged()V

    .line 91
    return-void
.end method

.method public treeStructureChanged(Ljavax/swing/event/TreeModelEvent;)V
    .locals 1
    .param p1, "e"    # Ljavax/swing/event/TreeModelEvent;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->delayedFireTableDataChanged()V

    .line 95
    return-void
.end method
