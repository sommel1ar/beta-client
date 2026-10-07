.class Lorg/mozilla/javascript/tools/debugger/ContextWindow;
.super Ljavax/swing/JPanel;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = 0x2000b40c9d971f53L


# instance fields
.field private cmdLine:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

.field context:Ljavax/swing/JComboBox;

.field private debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field private enabled:Z

.field private evaluator:Lorg/mozilla/javascript/tools/debugger/Evaluator;

.field private localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

.field split:Ljavax/swing/JSplitPane;

.field private tableModel:Lorg/mozilla/javascript/tools/debugger/MyTableModel;

.field private tabs:Ljavax/swing/JTabbedPane;

.field private tabs2:Ljavax/swing/JTabbedPane;

.field private thisTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

.field toolTips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V
    .locals 30
    .param p1, "debugGui"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .prologue
    .line 2884
    invoke-direct/range {p0 .. p0}, Ljavax/swing/JPanel;-><init>()V

    .line 2885
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 2886
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->enabled:Z

    .line 2887
    new-instance v25, Ljavax/swing/JPanel;

    invoke-direct/range {v25 .. v25}, Ljavax/swing/JPanel;-><init>()V

    .line 2888
    .local v25, "left":Ljavax/swing/JPanel;
    new-instance v28, Ljavax/swing/JToolBar;

    invoke-direct/range {v28 .. v28}, Ljavax/swing/JToolBar;-><init>()V

    .line 2889
    .local v28, "t1":Ljavax/swing/JToolBar;
    const-string v5, "Variables"

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljavax/swing/JToolBar;->setName(Ljava/lang/String;)V

    .line 2890
    new-instance v5, Ljava/awt/GridLayout;

    invoke-direct {v5}, Ljava/awt/GridLayout;-><init>()V

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljavax/swing/JToolBar;->setLayout(Ljava/awt/LayoutManager;)V

    .line 2891
    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2892
    new-instance v26, Ljavax/swing/JPanel;

    invoke-direct/range {v26 .. v26}, Ljavax/swing/JPanel;-><init>()V

    .line 2893
    .local v26, "p1":Ljavax/swing/JPanel;
    new-instance v5, Ljava/awt/GridLayout;

    invoke-direct {v5}, Ljava/awt/GridLayout;-><init>()V

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 2894
    new-instance v27, Ljavax/swing/JPanel;

    invoke-direct/range {v27 .. v27}, Ljavax/swing/JPanel;-><init>()V

    .line 2895
    .local v27, "p2":Ljavax/swing/JPanel;
    new-instance v5, Ljava/awt/GridLayout;

    invoke-direct {v5}, Ljava/awt/GridLayout;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 2896
    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2897
    new-instance v22, Ljavax/swing/JLabel;

    const-string v5, "Context:"

    move-object/from16 v0, v22

    invoke-direct {v0, v5}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 2898
    .local v22, "label":Ljavax/swing/JLabel;
    new-instance v5, Ljavax/swing/JComboBox;

    invoke-direct {v5}, Ljavax/swing/JComboBox;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    .line 2899
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Ljavax/swing/JComboBox;->setLightWeightPopupEnabled(Z)V

    .line 2900
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v5}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->toolTips:Ljava/util/List;

    .line 2901
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v5}, Ljavax/swing/JComboBox;->getBorder()Ljavax/swing/border/Border;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljavax/swing/JLabel;->setBorder(Ljavax/swing/border/Border;)V

    .line 2902
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 2903
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    const-string v9, "ContextSwitch"

    invoke-virtual {v5, v9}, Ljavax/swing/JComboBox;->setActionCommand(Ljava/lang/String;)V

    .line 2904
    new-instance v23, Ljava/awt/GridBagLayout;

    invoke-direct/range {v23 .. v23}, Ljava/awt/GridBagLayout;-><init>()V

    .line 2905
    .local v23, "layout":Ljava/awt/GridBagLayout;
    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 2906
    new-instance v24, Ljava/awt/GridBagConstraints;

    invoke-direct/range {v24 .. v24}, Ljava/awt/GridBagConstraints;-><init>()V

    .line 2907
    .local v24, "lc":Ljava/awt/GridBagConstraints;
    move-object/from16 v0, v24

    iget-object v5, v0, Ljava/awt/GridBagConstraints;->insets:Ljava/awt/Insets;

    const/4 v9, 0x5

    iput v9, v5, Ljava/awt/Insets;->left:I

    .line 2908
    const/16 v5, 0x11

    move-object/from16 v0, v24

    iput v5, v0, Ljava/awt/GridBagConstraints;->anchor:I

    .line 2909
    const/4 v5, 0x5

    move-object/from16 v0, v24

    iput v5, v0, Ljava/awt/GridBagConstraints;->ipadx:I

    .line 2910
    move-object/from16 v0, v23

    move-object/from16 v1, v22

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 2911
    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2912
    new-instance v20, Ljava/awt/GridBagConstraints;

    invoke-direct/range {v20 .. v20}, Ljava/awt/GridBagConstraints;-><init>()V

    .line 2913
    .local v20, "c":Ljava/awt/GridBagConstraints;
    const/4 v5, 0x0

    move-object/from16 v0, v20

    iput v5, v0, Ljava/awt/GridBagConstraints;->gridwidth:I

    .line 2914
    const/4 v5, 0x2

    move-object/from16 v0, v20

    iput v5, v0, Ljava/awt/GridBagConstraints;->fill:I

    .line 2915
    const/16 v5, 0x11

    move-object/from16 v0, v20

    iput v5, v0, Ljava/awt/GridBagConstraints;->anchor:I

    .line 2916
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v5, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 2917
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2918
    new-instance v5, Ljavax/swing/JTabbedPane;

    const/4 v9, 0x3

    invoke-direct {v5, v9}, Ljavax/swing/JTabbedPane;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    .line 2919
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    new-instance v9, Ljava/awt/Dimension;

    const/16 v13, 0x1f4

    const/16 v14, 0x12c

    invoke-direct {v9, v13, v14}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v5, v9}, Ljavax/swing/JTabbedPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 2920
    new-instance v5, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    new-instance v9, Lorg/mozilla/javascript/tools/debugger/VariableModel;

    invoke-direct {v9}, Lorg/mozilla/javascript/tools/debugger/VariableModel;-><init>()V

    invoke-direct {v5, v9}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;-><init>(Lorg/mozilla/javascript/tools/debugger/VariableModel;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->thisTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    .line 2921
    new-instance v21, Ljavax/swing/JScrollPane;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->thisTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 2922
    .local v21, "jsp":Ljavax/swing/JScrollPane;
    invoke-virtual/range {v21 .. v21}, Ljavax/swing/JScrollPane;->getViewport()Ljavax/swing/JViewport;

    move-result-object v5

    new-instance v9, Ljava/awt/Dimension;

    const/4 v13, 0x5

    const/4 v14, 0x2

    invoke-direct {v9, v13, v14}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v5, v9}, Ljavax/swing/JViewport;->setViewSize(Ljava/awt/Dimension;)V

    .line 2923
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    const-string v9, "this"

    move-object/from16 v0, v21

    invoke-virtual {v5, v9, v0}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 2924
    new-instance v5, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    new-instance v9, Lorg/mozilla/javascript/tools/debugger/VariableModel;

    invoke-direct {v9}, Lorg/mozilla/javascript/tools/debugger/VariableModel;-><init>()V

    invoke-direct {v5, v9}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;-><init>(Lorg/mozilla/javascript/tools/debugger/VariableModel;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    .line 2925
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    const/4 v9, 0x4

    invoke-virtual {v5, v9}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setAutoResizeMode(I)V

    .line 2926
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 2927
    new-instance v21, Ljavax/swing/JScrollPane;

    .end local v21    # "jsp":Ljavax/swing/JScrollPane;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 2928
    .restart local v21    # "jsp":Ljavax/swing/JScrollPane;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    const-string v9, "Locals"

    move-object/from16 v0, v21

    invoke-virtual {v5, v9, v0}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 2929
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    move-object/from16 v0, v20

    iput-wide v14, v0, Ljava/awt/GridBagConstraints;->weighty:D

    move-object/from16 v0, v20

    iput-wide v14, v0, Ljava/awt/GridBagConstraints;->weightx:D

    .line 2930
    const/4 v5, 0x0

    move-object/from16 v0, v20

    iput v5, v0, Ljava/awt/GridBagConstraints;->gridheight:I

    .line 2931
    const/4 v5, 0x1

    move-object/from16 v0, v20

    iput v5, v0, Ljava/awt/GridBagConstraints;->fill:I

    .line 2932
    const/16 v5, 0x11

    move-object/from16 v0, v20

    iput v5, v0, Ljava/awt/GridBagConstraints;->anchor:I

    .line 2933
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v5, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 2934
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2935
    new-instance v5, Lorg/mozilla/javascript/tools/debugger/Evaluator;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Lorg/mozilla/javascript/tools/debugger/Evaluator;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->evaluator:Lorg/mozilla/javascript/tools/debugger/Evaluator;

    .line 2936
    new-instance v5, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->cmdLine:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    .line 2938
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->evaluator:Lorg/mozilla/javascript/tools/debugger/Evaluator;

    iget-object v5, v5, Lorg/mozilla/javascript/tools/debugger/Evaluator;->tableModel:Lorg/mozilla/javascript/tools/debugger/MyTableModel;

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tableModel:Lorg/mozilla/javascript/tools/debugger/MyTableModel;

    .line 2939
    new-instance v21, Ljavax/swing/JScrollPane;

    .end local v21    # "jsp":Ljavax/swing/JScrollPane;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->evaluator:Lorg/mozilla/javascript/tools/debugger/Evaluator;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 2940
    .restart local v21    # "jsp":Ljavax/swing/JScrollPane;
    new-instance v29, Ljavax/swing/JToolBar;

    invoke-direct/range {v29 .. v29}, Ljavax/swing/JToolBar;-><init>()V

    .line 2941
    .local v29, "t2":Ljavax/swing/JToolBar;
    const-string v5, "Evaluate"

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljavax/swing/JToolBar;->setName(Ljava/lang/String;)V

    .line 2942
    new-instance v5, Ljavax/swing/JTabbedPane;

    const/4 v9, 0x3

    invoke-direct {v5, v9}, Ljavax/swing/JTabbedPane;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    .line 2943
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    const-string v9, "Watch"

    move-object/from16 v0, v21

    invoke-virtual {v5, v9, v0}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 2944
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    const-string v9, "Evaluate"

    new-instance v13, Ljavax/swing/JScrollPane;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->cmdLine:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-direct {v13, v14}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v5, v9, v13}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 2945
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    new-instance v9, Ljava/awt/Dimension;

    const/16 v13, 0x1f4

    const/16 v14, 0x12c

    invoke-direct {v9, v13, v14}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v5, v9}, Ljavax/swing/JTabbedPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 2946
    new-instance v5, Ljava/awt/GridLayout;

    invoke-direct {v5}, Ljava/awt/GridLayout;-><init>()V

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljavax/swing/JToolBar;->setLayout(Ljava/awt/LayoutManager;)V

    .line 2947
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2948
    move-object/from16 v0, v27

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 2949
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->evaluator:Lorg/mozilla/javascript/tools/debugger/Evaluator;

    const/4 v9, 0x4

    invoke-virtual {v5, v9}, Lorg/mozilla/javascript/tools/debugger/Evaluator;->setAutoResizeMode(I)V

    .line 2950
    new-instance v5, Ljavax/swing/JSplitPane;

    const/4 v9, 0x1

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-direct {v5, v9, v0, v1}, Ljavax/swing/JSplitPane;-><init>(ILjava/awt/Component;Ljava/awt/Component;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    .line 2952
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 2953
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    const-wide/high16 v14, 0x3fe0000000000000L    # 0.5

    invoke-static {v5, v14, v15}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setResizeWeight(Ljavax/swing/JSplitPane;D)V

    .line 2954
    new-instance v5, Ljava/awt/BorderLayout;

    invoke-direct {v5}, Ljava/awt/BorderLayout;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->setLayout(Ljava/awt/LayoutManager;)V

    .line 2955
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    const-string v9, "Center"

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v9}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 2957
    move-object/from16 v7, v28

    .line 2958
    .local v7, "finalT1":Ljavax/swing/JToolBar;
    move-object/from16 v10, v29

    .line 2959
    .local v10, "finalT2":Ljavax/swing/JToolBar;
    move-object/from16 v8, v26

    .line 2960
    .local v8, "finalP1":Ljavax/swing/JPanel;
    move-object/from16 v11, v27

    .line 2961
    .local v11, "finalP2":Ljavax/swing/JPanel;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    .line 2962
    .local v12, "finalSplit":Ljavax/swing/JSplitPane;
    move-object/from16 v6, p0

    .line 2964
    .local v6, "finalThis":Ljavax/swing/JPanel;
    new-instance v4, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;

    move-object/from16 v5, p0

    move-object/from16 v9, p1

    invoke-direct/range {v4 .. v12}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;-><init>(Lorg/mozilla/javascript/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V

    .line 3067
    .local v4, "clistener":Ljava/awt/event/ComponentListener;
    new-instance v13, Lorg/mozilla/javascript/tools/debugger/ContextWindow$2;

    move-object/from16 v14, p0

    move-object v15, v6

    move-object/from16 v16, v7

    move-object/from16 v17, v10

    move-object/from16 v18, v11

    move-object/from16 v19, v12

    invoke-direct/range {v13 .. v19}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$2;-><init>(Lorg/mozilla/javascript/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljavax/swing/JPanel;->addContainerListener(Ljava/awt/event/ContainerListener;)V

    .line 3097
    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljavax/swing/JToolBar;->addComponentListener(Ljava/awt/event/ComponentListener;)V

    .line 3098
    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljavax/swing/JToolBar;->addComponentListener(Ljava/awt/event/ComponentListener;)V

    .line 3099
    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->setEnabled(Z)V

    .line 3100
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 10
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 3134
    iget-boolean v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->enabled:Z

    if-nez v7, :cond_1

    .line 3159
    :cond_0
    :goto_0
    return-void

    .line 3135
    :cond_1
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v7

    const-string v8, "ContextSwitch"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 3136
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v7, v7, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v7}, Lorg/mozilla/javascript/tools/debugger/Dim;->currentContextData()Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;

    move-result-object v0

    .line 3137
    .local v0, "contextData":Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;
    if-eqz v0, :cond_0

    .line 3138
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v7}, Ljavax/swing/JComboBox;->getSelectedIndex()I

    move-result v3

    .line 3139
    .local v3, "frameIndex":I
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->toolTips:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljavax/swing/JComboBox;->setToolTipText(Ljava/lang/String;)V

    .line 3140
    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v2

    .line 3141
    .local v2, "frameCount":I
    if-ge v3, v2, :cond_0

    .line 3144
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;->getFrame(I)Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;

    move-result-object v1

    .line 3145
    .local v1, "frame":Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->scope()Ljava/lang/Object;

    move-result-object v4

    .line 3146
    .local v4, "scope":Ljava/lang/Object;
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->thisObj()Ljava/lang/Object;

    move-result-object v6

    .line 3147
    .local v6, "thisObj":Ljava/lang/Object;
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->thisTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    new-instance v8, Lorg/mozilla/javascript/tools/debugger/VariableModel;

    iget-object v9, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v9, v9, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-direct {v8, v9, v6}, Lorg/mozilla/javascript/tools/debugger/VariableModel;-><init>(Lorg/mozilla/javascript/tools/debugger/Dim;Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->resetTree(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;)Ljavax/swing/JTree;

    .line 3149
    if-eq v4, v6, :cond_2

    .line 3150
    new-instance v5, Lorg/mozilla/javascript/tools/debugger/VariableModel;

    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v7, v7, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-direct {v5, v7, v4}, Lorg/mozilla/javascript/tools/debugger/VariableModel;-><init>(Lorg/mozilla/javascript/tools/debugger/Dim;Ljava/lang/Object;)V

    .line 3154
    .local v5, "scopeModel":Lorg/mozilla/javascript/tools/debugger/VariableModel;
    :goto_1
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    invoke-virtual {v7, v5}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->resetTree(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;)Ljavax/swing/JTree;

    .line 3155
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v7, v7, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v7, v3}, Lorg/mozilla/javascript/tools/debugger/Dim;->contextSwitch(I)V

    .line 3156
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v7, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->showStopLine(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;)V

    .line 3157
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->tableModel:Lorg/mozilla/javascript/tools/debugger/MyTableModel;

    invoke-virtual {v7}, Lorg/mozilla/javascript/tools/debugger/MyTableModel;->updateModel()V

    goto :goto_0

    .line 3152
    .end local v5    # "scopeModel":Lorg/mozilla/javascript/tools/debugger/VariableModel;
    :cond_2
    new-instance v5, Lorg/mozilla/javascript/tools/debugger/VariableModel;

    invoke-direct {v5}, Lorg/mozilla/javascript/tools/debugger/VariableModel;-><init>()V

    .restart local v5    # "scopeModel":Lorg/mozilla/javascript/tools/debugger/VariableModel;
    goto :goto_1
.end method

.method public disableUpdate()V
    .locals 1

    .prologue
    .line 3118
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->enabled:Z

    .line 3119
    return-void
.end method

.method public enableUpdate()V
    .locals 1

    .prologue
    .line 3125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->enabled:Z

    .line 3126
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 3107
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v0, p1}, Ljavax/swing/JComboBox;->setEnabled(Z)V

    .line 3108
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->thisTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setEnabled(Z)V

    .line 3109
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->localsTable:Lorg/mozilla/javascript/tools/debugger/MyTreeTable;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setEnabled(Z)V

    .line 3110
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->evaluator:Lorg/mozilla/javascript/tools/debugger/Evaluator;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Evaluator;->setEnabled(Z)V

    .line 3111
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->cmdLine:Lorg/mozilla/javascript/tools/debugger/EvalTextArea;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/EvalTextArea;->setEnabled(Z)V

    .line 3112
    return-void
.end method
