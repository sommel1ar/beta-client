.class public Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;
.super Ljavax/swing/table/AbstractTableModel;
.source "TreeTableModelAdapter.java"


# static fields
.field private static final serialVersionUID:J = 0xad29c9163d0edcL


# instance fields
.field tree:Ljavax/swing/JTree;

.field treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V
    .locals 1
    .param p1, "treeTableModel"    # Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;
    .param p2, "tree"    # Ljavax/swing/JTree;

    .prologue
    .line 61
    invoke-direct {p0}, Ljavax/swing/table/AbstractTableModel;-><init>()V

    .line 62
    iput-object p2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->tree:Ljavax/swing/JTree;

    .line 63
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    .line 65
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$1;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;)V

    invoke-virtual {p2, v0}, Ljavax/swing/JTree;->addTreeExpansionListener(Ljavax/swing/event/TreeExpansionListener;)V

    .line 80
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$2;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;)V

    invoke-interface {p1, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->addTreeModelListener(Ljavax/swing/event/TreeModelListener;)V

    .line 97
    return-void
.end method


# virtual methods
.method protected delayedFireTableDataChanged()V
    .locals 1

    .prologue
    .line 143
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$3;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter$3;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 148
    return-void
.end method

.method public getColumnClass(I)Ljava/lang/Class;
    .locals 1
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-interface {v0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getColumnCount()I
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-interface {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->getColumnCount()I

    move-result v0

    return v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1
    .param p1, "column"    # I

    .prologue
    .line 107
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-interface {v0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->getColumnName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRowCount()I
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->tree:Ljavax/swing/JTree;

    invoke-virtual {v0}, Ljavax/swing/JTree;->getRowCount()I

    move-result v0

    return v0
.end method

.method public getValueAt(II)Ljava/lang/Object;
    .locals 2
    .param p1, "row"    # I
    .param p2, "column"    # I

    .prologue
    .line 125
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->nodeForRow(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->getValueAt(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isCellEditable(II)Z
    .locals 2
    .param p1, "row"    # I
    .param p2, "column"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->nodeForRow(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->isCellEditable(Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method

.method protected nodeForRow(I)Ljava/lang/Object;
    .locals 2
    .param p1, "row"    # I

    .prologue
    .line 120
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->tree:Ljavax/swing/JTree;

    invoke-virtual {v1, p1}, Ljavax/swing/JTree;->getPathForRow(I)Ljavax/swing/tree/TreePath;

    move-result-object v0

    .line 121
    .local v0, "treePath":Ljavax/swing/tree/TreePath;
    invoke-virtual {v0}, Ljavax/swing/tree/TreePath;->getLastPathComponent()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public setValueAt(Ljava/lang/Object;II)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "row"    # I
    .param p3, "column"    # I

    .prologue
    .line 135
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->treeTableModel:Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;->nodeForRow(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, p1, v1, p3}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;->setValueAt(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 136
    return-void
.end method
