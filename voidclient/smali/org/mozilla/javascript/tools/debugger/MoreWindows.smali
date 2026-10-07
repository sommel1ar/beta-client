.class Lorg/mozilla/javascript/tools/debugger/MoreWindows;
.super Ljavax/swing/JDialog;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/debugger/MoreWindows$MouseHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x47d8a25e0afd370aL


# instance fields
.field private cancelButton:Ljavax/swing/JButton;

.field private list:Ljavax/swing/JList;

.field private setButton:Ljavax/swing/JButton;

.field private swingGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field private value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p1, "frame"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "labelText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/tools/debugger/SwingGui;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/tools/debugger/FileWindow;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1616
    .local p2, "fileWindows":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/tools/debugger/FileWindow;>;"
    const/4 v9, 0x1

    move-object/from16 v0, p3

    invoke-direct {p0, p1, v0, v9}, Ljavax/swing/JDialog;-><init>(Ljava/awt/Frame;Ljava/lang/String;Z)V

    .line 1617
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->swingGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 1619
    new-instance v9, Ljavax/swing/JButton;

    const-string v10, "Cancel"

    invoke-direct {v9, v10}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->cancelButton:Ljavax/swing/JButton;

    .line 1620
    new-instance v9, Ljavax/swing/JButton;

    const-string v10, "Select"

    invoke-direct {v9, v10}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    .line 1621
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v9, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1622
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v9, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1623
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->getRootPane()Ljavax/swing/JRootPane;

    move-result-object v9

    iget-object v10, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v9, v10}, Ljavax/swing/JRootPane;->setDefaultButton(Ljavax/swing/JButton;)V

    .line 1626
    new-instance v9, Ljavax/swing/JList;

    new-instance v10, Ljavax/swing/DefaultListModel;

    invoke-direct {v10}, Ljavax/swing/DefaultListModel;-><init>()V

    invoke-direct {v9, v10}, Ljavax/swing/JList;-><init>(Ljavax/swing/ListModel;)V

    iput-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    .line 1627
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-virtual {v9}, Ljavax/swing/JList;->getModel()Ljavax/swing/ListModel;

    move-result-object v8

    check-cast v8, Ljavax/swing/DefaultListModel;

    .line 1628
    .local v8, "model":Ljavax/swing/DefaultListModel;
    invoke-virtual {v8}, Ljavax/swing/DefaultListModel;->clear()V

    .line 1630
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1631
    .local v3, "data":Ljava/lang/String;
    invoke-virtual {v8, v3}, Ljavax/swing/DefaultListModel;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 1633
    .end local v3    # "data":Ljava/lang/String;
    :cond_0
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljavax/swing/JList;->setSelectedIndex(I)V

    .line 1635
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 1636
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljavax/swing/JList;->setSelectionMode(I)V

    .line 1637
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    new-instance v10, Lorg/mozilla/javascript/tools/debugger/MoreWindows$MouseHandler;

    const/4 v11, 0x0

    invoke-direct {v10, p0, v11}, Lorg/mozilla/javascript/tools/debugger/MoreWindows$MouseHandler;-><init>(Lorg/mozilla/javascript/tools/debugger/MoreWindows;Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;)V

    invoke-virtual {v9, v10}, Ljavax/swing/JList;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1638
    new-instance v7, Ljavax/swing/JScrollPane;

    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-direct {v7, v9}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1639
    .local v7, "listScroller":Ljavax/swing/JScrollPane;
    new-instance v9, Ljava/awt/Dimension;

    const/16 v10, 0x140

    const/16 v11, 0xf0

    invoke-direct {v9, v10, v11}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v7, v9}, Ljavax/swing/JScrollPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 1642
    new-instance v9, Ljava/awt/Dimension;

    const/16 v10, 0xfa

    const/16 v11, 0x50

    invoke-direct {v9, v10, v11}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v7, v9}, Ljavax/swing/JScrollPane;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 1643
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Ljavax/swing/JScrollPane;->setAlignmentX(F)V

    .line 1649
    new-instance v6, Ljavax/swing/JPanel;

    invoke-direct {v6}, Ljavax/swing/JPanel;-><init>()V

    .line 1650
    .local v6, "listPane":Ljavax/swing/JPanel;
    new-instance v9, Ljavax/swing/BoxLayout;

    const/4 v10, 0x1

    invoke-direct {v9, v6, v10}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v6, v9}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1651
    new-instance v5, Ljavax/swing/JLabel;

    move-object/from16 v0, p4

    invoke-direct {v5, v0}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 1652
    .local v5, "label":Ljavax/swing/JLabel;
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-virtual {v5, v9}, Ljavax/swing/JLabel;->setLabelFor(Ljava/awt/Component;)V

    .line 1653
    invoke-virtual {v6, v5}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1654
    new-instance v9, Ljava/awt/Dimension;

    const/4 v10, 0x0

    const/4 v11, 0x5

    invoke-direct {v9, v10, v11}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v9}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1655
    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1656
    const/16 v9, 0xa

    const/16 v10, 0xa

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-static {v9, v10, v11, v12}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1659
    new-instance v1, Ljavax/swing/JPanel;

    invoke-direct {v1}, Ljavax/swing/JPanel;-><init>()V

    .line 1660
    .local v1, "buttonPane":Ljavax/swing/JPanel;
    new-instance v9, Ljavax/swing/BoxLayout;

    const/4 v10, 0x0

    invoke-direct {v9, v1, v10}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v1, v9}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1661
    const/4 v9, 0x0

    const/16 v10, 0xa

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-static {v9, v10, v11, v12}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1662
    invoke-static {}, Ljavax/swing/Box;->createHorizontalGlue()Ljava/awt/Component;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1663
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v1, v9}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1664
    new-instance v9, Ljava/awt/Dimension;

    const/16 v10, 0xa

    const/4 v11, 0x0

    invoke-direct {v9, v10, v11}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v9}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1665
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v1, v9}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1668
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->getContentPane()Ljava/awt/Container;

    move-result-object v2

    .line 1669
    .local v2, "contentPane":Ljava/awt/Container;
    const-string v9, "Center"

    invoke-virtual {v2, v6, v9}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1670
    const-string v9, "South"

    invoke-virtual {v2, v1, v9}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1671
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->pack()V

    .line 1672
    new-instance v9, Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;

    invoke-direct {v9, p0}, Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;-><init>(Lorg/mozilla/javascript/tools/debugger/MoreWindows;)V

    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1683
    return-void
.end method

.method static synthetic access$102(Lorg/mozilla/javascript/tools/debugger/MoreWindows;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/MoreWindows;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 1579
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lorg/mozilla/javascript/tools/debugger/MoreWindows;)Ljavax/swing/JButton;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/MoreWindows;

    .prologue
    .line 1579
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    return-object v0
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    const/4 v2, 0x0

    .line 1701
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1702
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cancel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1703
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1704
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    .line 1710
    :cond_0
    :goto_0
    return-void

    .line 1705
    :cond_1
    const-string v1, "Select"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1706
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-virtual {v1}, Ljavax/swing/JList;->getSelectedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    .line 1707
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1708
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->swingGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public showDialog(Ljava/awt/Component;)Ljava/lang/String;
    .locals 1
    .param p1, "comp"    # Ljava/awt/Component;

    .prologue
    .line 1689
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    .line 1690
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 1691
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1692
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    return-object v0
.end method
