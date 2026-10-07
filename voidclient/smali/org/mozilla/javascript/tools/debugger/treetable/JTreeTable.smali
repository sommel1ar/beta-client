.class public Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;
.super Ljavax/swing/JTable;
.source "JTreeTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;,
        Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;,
        Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1d32d04d52dcaadbL


# instance fields
.field protected tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;)V
    .locals 4
    .param p1, "treeTableModel"    # Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    .prologue
    const/4 v3, 0x0

    .line 68
    invoke-direct {p0}, Ljavax/swing/JTable;-><init>()V

    .line 71
    new-instance v1, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v1, p0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;Ljavax/swing/tree/TreeModel;)V

    iput-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    .line 74
    new-instance v1, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v1, p1, v2}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V

    invoke-super {p0, v1}, Ljavax/swing/JTable;->setModel(Ljavax/swing/table/TableModel;)V

    .line 77
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V

    .line 79
    .local v0, "selectionWrapper":Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setSelectionModel(Ljavax/swing/tree/TreeSelectionModel;)V

    .line 80
    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->getListSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setSelectionModel(Ljavax/swing/ListSelectionModel;)V

    .line 83
    const-class v1, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {p0, v1, v2}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setDefaultRenderer(Ljava/lang/Class;Ljavax/swing/table/TableCellRenderer;)V

    .line 84
    const-class v1, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    new-instance v2, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;

    invoke-direct {v2, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V

    invoke-virtual {p0, v1, v2}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setDefaultEditor(Ljava/lang/Class;Ljavax/swing/table/TableCellEditor;)V

    .line 87
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setShowGrid(Z)V

    .line 90
    new-instance v1, Ljava/awt/Dimension;

    invoke-direct {v1, v3, v3}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setIntercellSpacing(Ljava/awt/Dimension;)V

    .line 94
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    .line 96
    const/16 v1, 0x12

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setRowHeight(I)V

    .line 98
    :cond_0
    return-void
.end method


# virtual methods
.method public getEditingRow()I
    .locals 2

    .prologue
    .line 125
    iget v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->editingColumn:I

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->editingRow:I

    goto :goto_0
.end method

.method public getTree()Ljavax/swing/JTree;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v0
.end method

.method public setRowHeight(I)V
    .locals 2
    .param p1, "rowHeight"    # I

    .prologue
    .line 134
    invoke-super {p0, p1}, Ljavax/swing/JTable;->setRowHeight(I)V

    .line 135
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 136
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getRowHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setRowHeight(I)V

    .line 138
    :cond_0
    return-void
.end method

.method public updateUI()V
    .locals 3

    .prologue
    .line 107
    invoke-super {p0}, Ljavax/swing/JTable;->updateUI()V

    .line 108
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->updateUI()V

    .line 113
    :cond_0
    const-string v0, "Tree.background"

    const-string v1, "Tree.foreground"

    const-string v2, "Tree.font"

    invoke-static {p0, v0, v1, v2}, Ljavax/swing/LookAndFeel;->installColorsAndFont(Ljavax/swing/JComponent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    return-void
.end method
