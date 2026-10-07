.class public Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;
.super Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;
.source "JTreeTable.java"

# interfaces
.implements Ljavax/swing/table/TableCellEditor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TreeTableCellEditor"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V
    .locals 0

    .prologue
    .line 238
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    invoke-direct {p0}, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;-><init>()V

    return-void
.end method


# virtual methods
.method public getTableCellEditorComponent(Ljavax/swing/JTable;Ljava/lang/Object;ZII)Ljava/awt/Component;
    .locals 1
    .param p1, "table"    # Ljavax/swing/JTable;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "isSelected"    # Z
    .param p4, "r"    # I
    .param p5, "c"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v0
.end method

.method public isCellEditable(Ljava/util/EventObject;)Z
    .locals 13
    .param p1, "e"    # Ljava/util/EventObject;

    .prologue
    const/4 v12, 0x0

    .line 267
    instance-of v2, p1, Ljava/awt/event/MouseEvent;

    if-eqz v2, :cond_0

    .line 268
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getColumnCount()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "counter":I
    :goto_0
    if-ltz v0, :cond_0

    .line 270
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    if-ne v2, v3, :cond_1

    move-object v11, p1

    .line 271
    check-cast v11, Ljava/awt/event/MouseEvent;

    .line 272
    .local v11, "me":Ljava/awt/event/MouseEvent;
    new-instance v1, Ljava/awt/event/MouseEvent;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v2, v2, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getID()I

    move-result v3

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getWhen()J

    move-result-wide v4

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v6

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v7

    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    const/4 v9, 0x1

    invoke-virtual {v8, v12, v0, v9}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getCellRect(IIZ)Ljava/awt/Rectangle;

    move-result-object v8

    iget v8, v8, Ljava/awt/Rectangle;->x:I

    sub-int/2addr v7, v8

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v8

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v9

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v10

    invoke-direct/range {v1 .. v10}, Ljava/awt/event/MouseEvent;-><init>(Ljava/awt/Component;IJIIIIZ)V

    .line 277
    .local v1, "newME":Ljava/awt/event/MouseEvent;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v2, v2, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->dispatchEvent(Ljava/awt/AWTEvent;)V

    .line 282
    .end local v0    # "counter":I
    .end local v1    # "newME":Ljava/awt/event/MouseEvent;
    .end local v11    # "me":Ljava/awt/event/MouseEvent;
    :cond_0
    return v12

    .line 269
    .restart local v0    # "counter":I
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
