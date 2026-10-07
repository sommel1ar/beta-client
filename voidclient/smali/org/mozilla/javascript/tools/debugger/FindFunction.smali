.class Lorg/mozilla/javascript/tools/debugger/FindFunction;
.super Ljavax/swing/JDialog;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/debugger/FindFunction$MouseHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7c3b61d31fa8114L


# instance fields
.field private cancelButton:Ljavax/swing/JButton;

.field private debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field private list:Ljavax/swing/JList;

.field private setButton:Ljavax/swing/JButton;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "debugGui"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "labelText"    # Ljava/lang/String;

    .prologue
    .line 1764
    const/4 v8, 0x1

    invoke-direct {p0, p1, p2, v8}, Ljavax/swing/JDialog;-><init>(Ljava/awt/Frame;Ljava/lang/String;Z)V

    .line 1765
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 1767
    new-instance v8, Ljavax/swing/JButton;

    const-string v9, "Cancel"

    invoke-direct {v8, v9}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->cancelButton:Ljavax/swing/JButton;

    .line 1768
    new-instance v8, Ljavax/swing/JButton;

    const-string v9, "Select"

    invoke-direct {v8, v9}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    .line 1769
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v8, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1770
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v8, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1771
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->getRootPane()Ljavax/swing/JRootPane;

    move-result-object v8

    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v8, v9}, Ljavax/swing/JRootPane;->setDefaultButton(Ljavax/swing/JButton;)V

    .line 1773
    new-instance v8, Ljavax/swing/JList;

    new-instance v9, Ljavax/swing/DefaultListModel;

    invoke-direct {v9}, Ljavax/swing/DefaultListModel;-><init>()V

    invoke-direct {v8, v9}, Ljavax/swing/JList;-><init>(Ljavax/swing/ListModel;)V

    iput-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    .line 1774
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v8}, Ljavax/swing/JList;->getModel()Ljavax/swing/ListModel;

    move-result-object v7

    check-cast v7, Ljavax/swing/DefaultListModel;

    .line 1775
    .local v7, "model":Ljavax/swing/DefaultListModel;
    invoke-virtual {v7}, Ljavax/swing/DefaultListModel;->clear()V

    .line 1777
    iget-object v8, p1, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v8}, Lorg/mozilla/javascript/tools/debugger/Dim;->functionNames()[Ljava/lang/String;

    move-result-object v0

    .line 1778
    .local v0, "a":[Ljava/lang/String;
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 1779
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v8, v0

    if-ge v3, v8, :cond_0

    .line 1780
    aget-object v8, v0, v3

    invoke-virtual {v7, v8}, Ljavax/swing/DefaultListModel;->addElement(Ljava/lang/Object;)V

    .line 1779
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1782
    :cond_0
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljavax/swing/JList;->setSelectedIndex(I)V

    .line 1784
    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    array-length v8, v0

    if-lez v8, :cond_1

    const/4 v8, 0x1

    :goto_1
    invoke-virtual {v9, v8}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 1785
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljavax/swing/JList;->setSelectionMode(I)V

    .line 1786
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    new-instance v9, Lorg/mozilla/javascript/tools/debugger/FindFunction$MouseHandler;

    invoke-direct {v9, p0}, Lorg/mozilla/javascript/tools/debugger/FindFunction$MouseHandler;-><init>(Lorg/mozilla/javascript/tools/debugger/FindFunction;)V

    invoke-virtual {v8, v9}, Ljavax/swing/JList;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1787
    new-instance v6, Ljavax/swing/JScrollPane;

    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-direct {v6, v8}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1788
    .local v6, "listScroller":Ljavax/swing/JScrollPane;
    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0x140

    const/16 v10, 0xf0

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v6, v8}, Ljavax/swing/JScrollPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 1789
    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0xfa

    const/16 v10, 0x50

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v6, v8}, Ljavax/swing/JScrollPane;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 1790
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Ljavax/swing/JScrollPane;->setAlignmentX(F)V

    .line 1796
    new-instance v5, Ljavax/swing/JPanel;

    invoke-direct {v5}, Ljavax/swing/JPanel;-><init>()V

    .line 1797
    .local v5, "listPane":Ljavax/swing/JPanel;
    new-instance v8, Ljavax/swing/BoxLayout;

    const/4 v9, 0x1

    invoke-direct {v8, v5, v9}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v5, v8}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1798
    new-instance v4, Ljavax/swing/JLabel;

    invoke-direct {v4, p3}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 1799
    .local v4, "label":Ljavax/swing/JLabel;
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v4, v8}, Ljavax/swing/JLabel;->setLabelFor(Ljava/awt/Component;)V

    .line 1800
    invoke-virtual {v5, v4}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1801
    new-instance v8, Ljava/awt/Dimension;

    const/4 v9, 0x0

    const/4 v10, 0x5

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v8}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1802
    invoke-virtual {v5, v6}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1803
    const/16 v8, 0xa

    const/16 v9, 0xa

    const/16 v10, 0xa

    const/16 v11, 0xa

    invoke-static {v8, v9, v10, v11}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1806
    new-instance v1, Ljavax/swing/JPanel;

    invoke-direct {v1}, Ljavax/swing/JPanel;-><init>()V

    .line 1807
    .local v1, "buttonPane":Ljavax/swing/JPanel;
    new-instance v8, Ljavax/swing/BoxLayout;

    const/4 v9, 0x0

    invoke-direct {v8, v1, v9}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v1, v8}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1808
    const/4 v8, 0x0

    const/16 v9, 0xa

    const/16 v10, 0xa

    const/16 v11, 0xa

    invoke-static {v8, v9, v10, v11}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1809
    invoke-static {}, Ljavax/swing/Box;->createHorizontalGlue()Ljava/awt/Component;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1810
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v1, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1811
    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0xa

    const/4 v10, 0x0

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v8}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1812
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v1, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1815
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->getContentPane()Ljava/awt/Container;

    move-result-object v2

    .line 1816
    .local v2, "contentPane":Ljava/awt/Container;
    const-string v8, "Center"

    invoke-virtual {v2, v5, v8}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1817
    const-string v8, "South"

    invoke-virtual {v2, v1, v8}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1818
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->pack()V

    .line 1819
    new-instance v8, Lorg/mozilla/javascript/tools/debugger/FindFunction$1;

    invoke-direct {v8, p0}, Lorg/mozilla/javascript/tools/debugger/FindFunction$1;-><init>(Lorg/mozilla/javascript/tools/debugger/FindFunction;)V

    invoke-virtual {p0, v8}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1830
    return-void

    .line 1784
    .end local v1    # "buttonPane":Ljavax/swing/JPanel;
    .end local v2    # "contentPane":Ljava/awt/Container;
    .end local v4    # "label":Ljavax/swing/JLabel;
    .end local v5    # "listPane":Ljavax/swing/JPanel;
    .end local v6    # "listScroller":Ljavax/swing/JScrollPane;
    :cond_1
    const/4 v8, 0x0

    goto/16 :goto_1
.end method

.method static synthetic access$002(Lorg/mozilla/javascript/tools/debugger/FindFunction;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/FindFunction;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 1728
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->value:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lorg/mozilla/javascript/tools/debugger/FindFunction;)Ljavax/swing/JButton;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/FindFunction;

    .prologue
    .line 1728
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    return-object v0
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 8
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    const/4 v7, 0x0

    .line 1848
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1849
    .local v0, "cmd":Ljava/lang/String;
    const-string v6, "Cancel"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1850
    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1851
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->value:Ljava/lang/String;

    .line 1870
    :cond_0
    :goto_0
    return-void

    .line 1852
    :cond_1
    const-string v6, "Select"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1853
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v6}, Ljavax/swing/JList;->getSelectedIndex()I

    move-result v6

    if-ltz v6, :cond_0

    .line 1857
    :try_start_0
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v6}, Ljavax/swing/JList;->getSelectedValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->value:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1861
    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1862
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v6, v6, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->value:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/tools/debugger/Dim;->functionSourceByName(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    move-result-object v2

    .line 1863
    .local v2, "item":Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;
    if-eqz v2, :cond_0

    .line 1864
    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;->sourceInfo()Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    move-result-object v4

    .line 1865
    .local v4, "si":Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v5

    .line 1866
    .local v5, "url":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;->firstLine()I

    move-result v3

    .line 1867
    .local v3, "lineNumber":I
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v6, v5, v3}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V

    goto :goto_0

    .line 1858
    .end local v2    # "item":Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;
    .end local v3    # "lineNumber":I
    .end local v4    # "si":Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
    .end local v5    # "url":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1859
    .local v1, "exc":Ljava/lang/ArrayIndexOutOfBoundsException;
    goto :goto_0
.end method

.method public showDialog(Ljava/awt/Component;)Ljava/lang/String;
    .locals 1
    .param p1, "comp"    # Ljava/awt/Component;

    .prologue
    .line 1836
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->value:Ljava/lang/String;

    .line 1837
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 1838
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1839
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FindFunction;->value:Ljava/lang/String;

    return-object v0
.end method
