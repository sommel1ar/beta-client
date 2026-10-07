.class Lorg/mozilla/javascript/tools/debugger/FileTextArea;
.super Ljavax/swing/JTextArea;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;
.implements Ljavax/swing/event/PopupMenuListener;
.implements Ljava/awt/event/KeyListener;
.implements Ljava/awt/event/MouseListener;


# static fields
.field private static final serialVersionUID:J = -0x58ee87e90e5408L


# instance fields
.field private popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

.field private w:Lorg/mozilla/javascript/tools/debugger/FileWindow;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/FileWindow;)V
    .locals 4
    .param p1, "w"    # Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .prologue
    .line 1409
    invoke-direct {p0}, Ljavax/swing/JTextArea;-><init>()V

    .line 1410
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->w:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .line 1411
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;-><init>(Lorg/mozilla/javascript/tools/debugger/FileTextArea;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    .line 1412
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->addPopupMenuListener(Ljavax/swing/event/PopupMenuListener;)V

    .line 1413
    invoke-virtual {p0, p0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1414
    invoke-virtual {p0, p0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1415
    new-instance v0, Ljava/awt/Font;

    const-string v1, "Monospaced"

    const/4 v2, 0x0

    const/16 v3, 0xc

    invoke-direct {v0, v1, v2, v3}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->setFont(Ljava/awt/Font;)V

    .line 1416
    return-void
.end method

.method private checkPopup(Ljava/awt/event/MouseEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 1460
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1461
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v1

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v2

    invoke-virtual {v0, p0, v1, v2}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->show(Ljavax/swing/JComponent;II)V

    .line 1463
    :cond_0
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 6
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 1528
    new-instance v3, Ljava/awt/Point;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    iget v4, v4, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->x:I

    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    iget v5, v5, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->y:I

    invoke-direct {v3, v4, v5}, Ljava/awt/Point;-><init>(II)V

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->viewToModel(Ljava/awt/Point;)I

    move-result v2

    .line 1529
    .local v2, "pos":I
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->popup:Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->setVisible(Z)V

    .line 1530
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1531
    .local v0, "cmd":Ljava/lang/String;
    const/4 v1, -0x1

    .line 1533
    .local v1, "line":I
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineOfOffset(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1536
    :goto_0
    const-string v3, "Set Breakpoint"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1537
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->w:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setBreakPoint(I)V

    .line 1543
    :cond_0
    :goto_1
    return-void

    .line 1538
    :cond_1
    const-string v3, "Clear Breakpoint"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1539
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->w:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->clearBreakPoint(I)V

    goto :goto_1

    .line 1540
    :cond_2
    const-string v3, "Run"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1541
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->w:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->load()V

    goto :goto_1

    .line 1534
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 1551
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 1559
    :goto_0
    return-void

    .line 1556
    :sswitch_0
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_0

    .line 1551
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_0
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0x7f -> :sswitch_0
    .end sparse-switch
.end method

.method public keyReleased(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 1572
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1573
    return-void
.end method

.method public keyTyped(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 1565
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1566
    return-void
.end method

.method public mouseClicked(Ljava/awt/event/MouseEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 1478
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->checkPopup(Ljava/awt/event/MouseEvent;)V

    .line 1479
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->requestFocus()V

    .line 1480
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljavax/swing/text/Caret;->setVisible(Z)V

    .line 1481
    return-void
.end method

.method public mouseEntered(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 1487
    return-void
.end method

.method public mouseExited(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 1493
    return-void
.end method

.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 1471
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->checkPopup(Ljava/awt/event/MouseEvent;)V

    .line 1472
    return-void
.end method

.method public mouseReleased(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 1499
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->checkPopup(Ljava/awt/event/MouseEvent;)V

    .line 1500
    return-void
.end method

.method public popupMenuCanceled(Ljavax/swing/event/PopupMenuEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/PopupMenuEvent;

    .prologue
    .line 1520
    return-void
.end method

.method public popupMenuWillBecomeInvisible(Ljavax/swing/event/PopupMenuEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/PopupMenuEvent;

    .prologue
    .line 1514
    return-void
.end method

.method public popupMenuWillBecomeVisible(Ljavax/swing/event/PopupMenuEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/PopupMenuEvent;

    .prologue
    .line 1508
    return-void
.end method

.method public select(I)V
    .locals 9
    .param p1, "pos"    # I

    .prologue
    .line 1422
    if-ltz p1, :cond_0

    .line 1424
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineOfOffset(I)I

    move-result v1

    .line 1425
    .local v1, "line":I
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->modelToView(I)Ljava/awt/Rectangle;

    move-result-object v3

    .line 1426
    .local v3, "rect":Ljava/awt/Rectangle;
    if-nez v3, :cond_1

    .line 1427
    invoke-virtual {p0, p1, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(II)V
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1454
    .end local v1    # "line":I
    .end local v3    # "rect":Ljava/awt/Rectangle;
    :cond_0
    :goto_0
    return-void

    .line 1430
    .restart local v1    # "line":I
    .restart local v3    # "rect":Ljava/awt/Rectangle;
    :cond_1
    add-int/lit8 v6, v1, 0x1

    :try_start_1
    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v6

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->modelToView(I)Ljava/awt/Rectangle;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 1432
    .local v2, "nrect":Ljava/awt/Rectangle;
    if-eqz v2, :cond_2

    .line 1433
    move-object v3, v2

    .line 1437
    .end local v2    # "nrect":Ljava/awt/Rectangle;
    :cond_2
    :goto_1
    :try_start_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getParent()Ljava/awt/Container;

    move-result-object v5

    check-cast v5, Ljavax/swing/JViewport;

    .line 1438
    .local v5, "vp":Ljavax/swing/JViewport;
    invoke-virtual {v5}, Ljavax/swing/JViewport;->getViewRect()Ljava/awt/Rectangle;

    move-result-object v4

    .line 1439
    .local v4, "viewRect":Ljava/awt/Rectangle;
    iget v6, v4, Ljava/awt/Rectangle;->y:I

    iget v7, v4, Ljava/awt/Rectangle;->height:I

    add-int/2addr v6, v7

    iget v7, v3, Ljava/awt/Rectangle;->y:I

    if-le v6, v7, :cond_3

    .line 1441
    invoke-virtual {p0, p1, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(II)V
    :try_end_2
    .catch Ljavax/swing/text/BadLocationException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1449
    .end local v1    # "line":I
    .end local v3    # "rect":Ljava/awt/Rectangle;
    .end local v4    # "viewRect":Ljava/awt/Rectangle;
    .end local v5    # "vp":Ljavax/swing/JViewport;
    :catch_0
    move-exception v0

    .line 1450
    .local v0, "exc":Ljavax/swing/text/BadLocationException;
    invoke-virtual {p0, p1, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(II)V

    goto :goto_0

    .line 1444
    .end local v0    # "exc":Ljavax/swing/text/BadLocationException;
    .restart local v1    # "line":I
    .restart local v3    # "rect":Ljava/awt/Rectangle;
    .restart local v4    # "viewRect":Ljava/awt/Rectangle;
    .restart local v5    # "vp":Ljavax/swing/JViewport;
    :cond_3
    :try_start_3
    iget v6, v3, Ljava/awt/Rectangle;->y:I

    iget v7, v4, Ljava/awt/Rectangle;->height:I

    iget v8, v3, Ljava/awt/Rectangle;->height:I

    sub-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    iput v6, v3, Ljava/awt/Rectangle;->y:I

    .line 1445
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->scrollRectToVisible(Ljava/awt/Rectangle;)V

    .line 1446
    invoke-virtual {p0, p1, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(II)V
    :try_end_3
    .catch Ljavax/swing/text/BadLocationException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 1435
    .end local v4    # "viewRect":Ljava/awt/Rectangle;
    .end local v5    # "vp":Ljavax/swing/JViewport;
    :catch_1
    move-exception v6

    goto :goto_1
.end method
