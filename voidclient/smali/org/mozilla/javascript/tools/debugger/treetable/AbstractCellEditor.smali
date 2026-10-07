.class public Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;
.super Ljava/lang/Object;
.source "AbstractCellEditor.java"

# interfaces
.implements Ljavax/swing/CellEditor;


# instance fields
.field protected listenerList:Ljavax/swing/event/EventListenerList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljavax/swing/event/EventListenerList;

    invoke-direct {v0}, Ljavax/swing/event/EventListenerList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    return-void
.end method


# virtual methods
.method public addCellEditorListener(Ljavax/swing/event/CellEditorListener;)V
    .locals 2
    .param p1, "l"    # Ljavax/swing/event/CellEditorListener;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    const-class v1, Ljavax/swing/event/CellEditorListener;

    invoke-virtual {v0, v1, p1}, Ljavax/swing/event/EventListenerList;->add(Ljava/lang/Class;Ljava/util/EventListener;)V

    .line 50
    return-void
.end method

.method public cancelCellEditing()V
    .locals 0

    .prologue
    .line 46
    return-void
.end method

.method protected fireEditingCanceled()V
    .locals 4

    .prologue
    .line 80
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    invoke-virtual {v2}, Ljavax/swing/event/EventListenerList;->getListenerList()[Ljava/lang/Object;

    move-result-object v1

    .line 83
    .local v1, "listeners":[Ljava/lang/Object;
    array-length v2, v1

    add-int/lit8 v0, v2, -0x2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 84
    aget-object v2, v1, v0

    const-class v3, Ljavax/swing/event/CellEditorListener;

    if-ne v2, v3, :cond_0

    .line 85
    add-int/lit8 v2, v0, 0x1

    aget-object v2, v1, v2

    check-cast v2, Ljavax/swing/event/CellEditorListener;

    new-instance v3, Ljavax/swing/event/ChangeEvent;

    invoke-direct {v3, p0}, Ljavax/swing/event/ChangeEvent;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljavax/swing/event/CellEditorListener;->editingCanceled(Ljavax/swing/event/ChangeEvent;)V

    .line 83
    :cond_0
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 88
    :cond_1
    return-void
.end method

.method protected fireEditingStopped()V
    .locals 4

    .prologue
    .line 63
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    invoke-virtual {v2}, Ljavax/swing/event/EventListenerList;->getListenerList()[Ljava/lang/Object;

    move-result-object v1

    .line 66
    .local v1, "listeners":[Ljava/lang/Object;
    array-length v2, v1

    add-int/lit8 v0, v2, -0x2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 67
    aget-object v2, v1, v0

    const-class v3, Ljavax/swing/event/CellEditorListener;

    if-ne v2, v3, :cond_0

    .line 68
    add-int/lit8 v2, v0, 0x1

    aget-object v2, v1, v2

    check-cast v2, Ljavax/swing/event/CellEditorListener;

    new-instance v3, Ljavax/swing/event/ChangeEvent;

    invoke-direct {v3, p0}, Ljavax/swing/event/ChangeEvent;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljavax/swing/event/CellEditorListener;->editingStopped(Ljavax/swing/event/ChangeEvent;)V

    .line 66
    :cond_0
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 71
    :cond_1
    return-void
.end method

.method public getCellEditorValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public isCellEditable(Ljava/util/EventObject;)Z
    .locals 1
    .param p1, "e"    # Ljava/util/EventObject;

    .prologue
    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public removeCellEditorListener(Ljavax/swing/event/CellEditorListener;)V
    .locals 2
    .param p1, "l"    # Ljavax/swing/event/CellEditorListener;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    const-class v1, Ljavax/swing/event/CellEditorListener;

    invoke-virtual {v0, v1, p1}, Ljavax/swing/event/EventListenerList;->remove(Ljava/lang/Class;Ljava/util/EventListener;)V

    .line 54
    return-void
.end method

.method public shouldSelectCell(Ljava/util/EventObject;)Z
    .locals 1
    .param p1, "anEvent"    # Ljava/util/EventObject;

    .prologue
    .line 44
    const/4 v0, 0x0

    return v0
.end method

.method public stopCellEditing()Z
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x1

    return v0
.end method
