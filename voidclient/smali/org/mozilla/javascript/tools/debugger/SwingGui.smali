.class public Lorg/mozilla/javascript/tools/debugger/SwingGui;
.super Ljavax/swing/JFrame;
.source "SwingGui.java"

# interfaces
.implements Lorg/mozilla/javascript/tools/debugger/GuiCallback;


# static fields
.field private static final serialVersionUID:J = -0x7208c10b13b21fc5L


# instance fields
.field private awtEventQueue:Ljava/awt/EventQueue;

.field private console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

.field private context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

.field private currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

.field private desk:Ljavax/swing/JDesktopPane;

.field dim:Lorg/mozilla/javascript/tools/debugger/Dim;

.field dlg:Ljavax/swing/JFileChooser;

.field private exitAction:Ljava/lang/Runnable;

.field private final fileWindows:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/tools/debugger/FileWindow;",
            ">;"
        }
    .end annotation
.end field

.field private menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

.field private split1:Ljavax/swing/JSplitPane;

.field private statusBar:Ljavax/swing/JLabel;

.field private toolBar:Ljavax/swing/JToolBar;

.field private final toplevels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljavax/swing/JFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/Dim;Ljava/lang/String;)V
    .locals 1
    .param p1, "dim"    # Lorg/mozilla/javascript/tools/debugger/Dim;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 148
    invoke-direct {p0, p2}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 118
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toplevels:Ljava/util/Map;

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    .line 149
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    .line 150
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->init()V

    .line 151
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/tools/debugger/Dim;->setGuiCallback(Lorg/mozilla/javascript/tools/debugger/GuiCallback;)V

    .line 152
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->exit()V

    return-void
.end method

.method private chooseFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 634
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v5, p1}, Ljavax/swing/JFileChooser;->setDialogTitle(Ljava/lang/String;)V

    .line 635
    const/4 v0, 0x0

    .line 636
    .local v0, "CWD":Ljava/io/File;
    const-string v5, "user.dir"

    invoke-static {v5}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 637
    .local v1, "dir":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 638
    new-instance v0, Ljava/io/File;

    .end local v0    # "CWD":Ljava/io/File;
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 640
    .restart local v0    # "CWD":Ljava/io/File;
    :cond_0
    if-eqz v0, :cond_1

    .line 641
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v5, v0}, Ljavax/swing/JFileChooser;->setCurrentDirectory(Ljava/io/File;)V

    .line 643
    :cond_1
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v5, p0}, Ljavax/swing/JFileChooser;->showOpenDialog(Ljava/awt/Component;)I

    move-result v4

    .line 644
    .local v4, "returnVal":I
    if-nez v4, :cond_2

    .line 646
    :try_start_0
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v5}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v3

    .line 647
    .local v3, "result":Ljava/lang/String;
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v5}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 648
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v2

    .line 649
    .local v2, "props":Ljava/util/Properties;
    const-string v5, "user.dir"

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    invoke-static {v2}, Ljava/lang/System;->setProperties(Ljava/util/Properties;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 656
    .end local v2    # "props":Ljava/util/Properties;
    .end local v3    # "result":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 653
    :catch_0
    move-exception v5

    .line 656
    :cond_2
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 652
    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method private exit()V
    .locals 2

    .prologue
    .line 337
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->exitAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->exitAction:Ljava/lang/Runnable;

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 340
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/Dim;->setReturnValue(I)V

    .line 341
    return-void
.end method

.method private getSelectedFrame()Ljavax/swing/JInternalFrame;
    .locals 3

    .prologue
    .line 663
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v2}, Ljavax/swing/JDesktopPane;->getAllFrames()[Ljavax/swing/JInternalFrame;

    move-result-object v0

    .line 664
    .local v0, "frames":[Ljavax/swing/JInternalFrame;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 665
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljavax/swing/JInternalFrame;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 666
    aget-object v2, v0, v1

    .line 669
    :goto_1
    return-object v2

    .line 664
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 669
    :cond_1
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v0, v2

    goto :goto_1
.end method

.method static getShortName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 357
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 358
    .local v0, "lastSlash":I
    if-gez v0, :cond_0

    .line 359
    const/16 v2, 0x5c

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 361
    :cond_0
    move-object v1, p0

    .line 362
    .local v1, "shortName":Ljava/lang/String;
    if-ltz v0, :cond_1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 363
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 365
    :cond_1
    return-object v1
.end method

.method private getWindowMenu()Ljavax/swing/JMenu;
    .locals 2

    .prologue
    .line 627
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/Menubar;->getMenu(I)Ljavax/swing/JMenu;

    move-result-object v0

    return-object v0
.end method

.method private init()V
    .locals 18

    .prologue
    .line 209
    new-instance v14, Lorg/mozilla/javascript/tools/debugger/Menubar;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/tools/debugger/Menubar;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    .line 210
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setJMenuBar(Ljavax/swing/JMenuBar;)V

    .line 211
    new-instance v14, Ljavax/swing/JToolBar;

    invoke-direct {v14}, Ljavax/swing/JToolBar;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    .line 215
    const/4 v14, 0x5

    new-array v13, v14, [Ljava/lang/String;

    const/4 v14, 0x0

    const-string v15, "Break (Pause)"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string v15, "Go (F5)"

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const-string v15, "Step Into (F11)"

    aput-object v15, v13, v14

    const/4 v14, 0x3

    const-string v15, "Step Over (F7)"

    aput-object v15, v13, v14

    const/4 v14, 0x4

    const-string v15, "Step Out (F8)"

    aput-object v15, v13, v14

    .line 220
    .local v13, "toolTips":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 221
    .local v5, "count":I
    new-instance v2, Ljavax/swing/JButton;

    const-string v14, "Break"

    invoke-direct {v2, v14}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .local v2, "breakButton":Ljavax/swing/JButton;
    move-object v3, v2

    .line 222
    .local v3, "button":Ljavax/swing/JButton;
    const-string v14, "Break"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 223
    const-string v14, "Break"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 224
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 225
    const/4 v14, 0x1

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 226
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "count":I
    .local v6, "count":I
    aget-object v14, v13, v5

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 228
    new-instance v9, Ljavax/swing/JButton;

    const-string v14, "Go"

    invoke-direct {v9, v14}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .local v9, "goButton":Ljavax/swing/JButton;
    move-object v3, v9

    .line 229
    const-string v14, "Go"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 230
    const-string v14, "Go"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 231
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 232
    const/4 v14, 0x0

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 233
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "count":I
    .restart local v5    # "count":I
    aget-object v14, v13, v6

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 235
    new-instance v10, Ljavax/swing/JButton;

    const-string v14, "Step Into"

    invoke-direct {v10, v14}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .local v10, "stepIntoButton":Ljavax/swing/JButton;
    move-object v3, v10

    .line 236
    const-string v14, "Step Into"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 237
    const-string v14, "Step Into"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 238
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 239
    const/4 v14, 0x0

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 240
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "count":I
    .restart local v6    # "count":I
    aget-object v14, v13, v5

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 242
    new-instance v12, Ljavax/swing/JButton;

    const-string v14, "Step Over"

    invoke-direct {v12, v14}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .local v12, "stepOverButton":Ljavax/swing/JButton;
    move-object v3, v12

    .line 243
    const-string v14, "Step Over"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 244
    const-string v14, "Step Over"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 245
    const/4 v14, 0x0

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 246
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 247
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "count":I
    .restart local v5    # "count":I
    aget-object v14, v13, v6

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 249
    new-instance v11, Ljavax/swing/JButton;

    const-string v14, "Step Out"

    invoke-direct {v11, v14}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .local v11, "stepOutButton":Ljavax/swing/JButton;
    move-object v3, v11

    .line 250
    const-string v14, "Step Out"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 251
    const-string v14, "Step Out"

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 252
    const/4 v14, 0x0

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 253
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 254
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "count":I
    .restart local v6    # "count":I
    aget-object v14, v13, v5

    invoke-virtual {v3, v14}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 256
    invoke-virtual {v12}, Ljavax/swing/JButton;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v7

    .line 257
    .local v7, "dim":Ljava/awt/Dimension;
    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 258
    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 259
    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 260
    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setSize(Ljava/awt/Dimension;)V

    .line 261
    invoke-virtual {v9, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 262
    invoke-virtual {v9, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 263
    invoke-virtual {v9, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 264
    invoke-virtual {v10, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 265
    invoke-virtual {v10, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 266
    invoke-virtual {v10, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 267
    invoke-virtual {v12, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 268
    invoke-virtual {v12, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 269
    invoke-virtual {v12, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 270
    invoke-virtual {v11, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 271
    invoke-virtual {v11, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 272
    invoke-virtual {v11, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 273
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v14, v2}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 274
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v14, v9}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 275
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v14, v10}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 276
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v14, v12}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 277
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v14, v11}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 279
    new-instance v4, Ljavax/swing/JPanel;

    invoke-direct {v4}, Ljavax/swing/JPanel;-><init>()V

    .line 280
    .local v4, "contentPane":Ljavax/swing/JPanel;
    new-instance v14, Ljava/awt/BorderLayout;

    invoke-direct {v14}, Ljava/awt/BorderLayout;-><init>()V

    invoke-virtual {v4, v14}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 281
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getContentPane()Ljava/awt/Container;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    const-string v16, "North"

    invoke-virtual/range {v14 .. v16}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 282
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getContentPane()Ljava/awt/Container;

    move-result-object v14

    const-string v15, "Center"

    invoke-virtual {v14, v4, v15}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 283
    new-instance v14, Ljavax/swing/JDesktopPane;

    invoke-direct {v14}, Ljavax/swing/JDesktopPane;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    .line 284
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    new-instance v15, Ljava/awt/Dimension;

    const/16 v16, 0x258

    const/16 v17, 0x12c

    invoke-direct/range {v15 .. v17}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v14, v15}, Ljavax/swing/JDesktopPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 285
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    new-instance v15, Ljava/awt/Dimension;

    const/16 v16, 0x96

    const/16 v17, 0x32

    invoke-direct/range {v15 .. v17}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v14, v15}, Ljavax/swing/JDesktopPane;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 286
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    new-instance v15, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    const-string v16, "JavaScript Console"

    invoke-direct/range {v15 .. v16}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-virtual {v14, v15}, Ljavax/swing/JDesktopPane;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 287
    new-instance v14, Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    .line 288
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    new-instance v15, Ljava/awt/Dimension;

    const/16 v16, 0x258

    const/16 v17, 0x78

    invoke-direct/range {v15 .. v17}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v14, v15}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    new-instance v15, Ljava/awt/Dimension;

    const/16 v16, 0x32

    const/16 v17, 0x32

    invoke-direct/range {v15 .. v17}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v14, v15}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 291
    new-instance v14, Ljavax/swing/JSplitPane;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    move-object/from16 v17, v0

    invoke-direct/range {v14 .. v17}, Ljavax/swing/JSplitPane;-><init>(ILjava/awt/Component;Ljava/awt/Component;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    .line 293
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 294
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    const-wide v16, 0x3fe51eb851eb851fL    # 0.66

    move-wide/from16 v0, v16

    invoke-static {v14, v0, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setResizeWeight(Ljavax/swing/JSplitPane;D)V

    .line 295
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    const-string v15, "Center"

    invoke-virtual {v4, v14, v15}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 296
    new-instance v14, Ljavax/swing/JLabel;

    invoke-direct {v14}, Ljavax/swing/JLabel;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    .line 297
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    const-string v15, "Thread: "

    invoke-virtual {v14, v15}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    .line 298
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    const-string v15, "South"

    invoke-virtual {v4, v14, v15}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 299
    new-instance v14, Ljavax/swing/JFileChooser;

    invoke-direct {v14}, Ljavax/swing/JFileChooser;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    .line 301
    new-instance v8, Lorg/mozilla/javascript/tools/debugger/SwingGui$1;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui$1;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    .line 324
    .local v8, "filter":Ljavax/swing/filechooser/FileFilter;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v14, v8}, Ljavax/swing/JFileChooser;->addChoosableFileFilter(Ljavax/swing/filechooser/FileFilter;)V

    .line 325
    new-instance v14, Lorg/mozilla/javascript/tools/debugger/SwingGui$2;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui$2;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 331
    return-void
.end method

.method private readFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 724
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 726
    .local v1, "r":Ljava/io/Reader;
    :try_start_1
    invoke-static {v1}, Lorg/mozilla/javascript/Kit;->readReader(Ljava/io/Reader;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 728
    .local v2, "text":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    .line 737
    .end local v1    # "r":Ljava/io/Reader;
    :goto_0
    return-object v2

    .line 728
    .end local v2    # "text":Ljava/lang/String;
    .restart local v1    # "r":Ljava/io/Reader;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 730
    .end local v1    # "r":Ljava/io/Reader;
    :catch_0
    move-exception v0

    .line 731
    .local v0, "ex":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error reading "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {p0, v3, v4, v5}, Lorg/mozilla/javascript/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    .line 735
    const/4 v2, 0x0

    .restart local v2    # "text":Ljava/lang/String;
    goto :goto_0
.end method

.method private setFilePosition(Lorg/mozilla/javascript/tools/debugger/FileWindow;I)V
    .locals 5
    .param p1, "w"    # Lorg/mozilla/javascript/tools/debugger/FileWindow;
    .param p2, "line"    # I

    .prologue
    const/4 v3, -0x1

    .line 543
    const/4 v0, 0x1

    .line 544
    .local v0, "activate":Z
    iget-object v2, p1, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    .line 546
    .local v2, "ta":Ljavax/swing/JTextArea;
    if-ne p2, v3, :cond_3

    .line 547
    const/4 v3, -0x1

    :try_start_0
    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V

    .line 548
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    if-ne v3, p1, :cond_0

    .line 549
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 563
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->isIcon()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 564
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v3}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v3

    invoke-interface {v3, p1}, Ljavax/swing/DesktopManager;->deiconifyFrame(Ljavax/swing/JInternalFrame;)V

    .line 566
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v3}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v3

    invoke-interface {v3, p1}, Ljavax/swing/DesktopManager;->activateFrame(Ljavax/swing/JInternalFrame;)V

    .line 568
    :try_start_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->show()V

    .line 569
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->toFront()V

    .line 570
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setSelected(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 574
    :cond_2
    :goto_1
    return-void

    .line 552
    :cond_3
    add-int/lit8 v3, p2, -0x1

    :try_start_2
    invoke-virtual {v2, v3}, Ljavax/swing/JTextArea;->getLineStartOffset(I)I

    move-result v1

    .line 553
    .local v1, "loc":I
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    if-eq v3, p1, :cond_4

    .line 554
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V

    .line 556
    :cond_4
    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V

    .line 557
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;
    :try_end_2
    .catch Ljavax/swing/text/BadLocationException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 559
    .end local v1    # "loc":I
    :catch_0
    move-exception v3

    goto :goto_0

    .line 571
    :catch_1
    move-exception v3

    goto :goto_1
.end method

.method static setResizeWeight(Ljavax/swing/JSplitPane;D)V
    .locals 7
    .param p0, "pane"    # Ljavax/swing/JSplitPane;
    .param p1, "weight"    # D

    .prologue
    .line 709
    :try_start_0
    const-class v1, Ljavax/swing/JSplitPane;

    const-string v2, "setResizeWeight"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 711
    .local v0, "m":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/Double;

    invoke-direct {v3, p1, p2}, Ljava/lang/Double;-><init>(D)V

    aput-object v3, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 716
    .end local v0    # "m":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 714
    :catch_0
    move-exception v1

    goto :goto_0

    .line 713
    :catch_1
    move-exception v1

    goto :goto_0

    .line 712
    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method private updateEnabled(Z)V
    .locals 7
    .param p1, "interrupted"    # Z

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 677
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getJMenuBar()Ljavax/swing/JMenuBar;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v4, p1}, Lorg/mozilla/javascript/tools/debugger/Menubar;->updateEnabled(Z)V

    .line 678
    const/4 v1, 0x0

    .local v1, "ci":I
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v4}, Ljavax/swing/JToolBar;->getComponentCount()I

    move-result v0

    .local v0, "cc":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 680
    if-nez v1, :cond_1

    .line 682
    if-nez p1, :cond_0

    move v2, v5

    .line 686
    .local v2, "enableButton":Z
    :goto_1
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v4, v1}, Ljavax/swing/JToolBar;->getComponent(I)Ljava/awt/Component;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/awt/Component;->setEnabled(Z)V

    .line 678
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v2    # "enableButton":Z
    :cond_0
    move v2, v6

    .line 682
    goto :goto_1

    .line 684
    :cond_1
    move v2, p1

    .restart local v2    # "enableButton":Z
    goto :goto_1

    .line 688
    .end local v2    # "enableButton":Z
    :cond_2
    if-eqz p1, :cond_4

    .line 689
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v4, v5}, Ljavax/swing/JToolBar;->setEnabled(Z)V

    .line 691
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getExtendedState()I

    move-result v3

    .line 692
    .local v3, "state":I
    if-ne v3, v5, :cond_3

    .line 693
    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setExtendedState(I)V

    .line 695
    :cond_3
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toFront()V

    .line 696
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->setEnabled(Z)V

    .line 701
    .end local v3    # "state":I
    :goto_2
    return-void

    .line 698
    :cond_4
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    if-eqz v4, :cond_5

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V

    .line 699
    :cond_5
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    invoke-virtual {v4, v6}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->setEnabled(Z)V

    goto :goto_2
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 30
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 804
    invoke-virtual/range {p1 .. p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v10

    .line 805
    .local v10, "cmd":Ljava/lang/String;
    const/16 v23, -0x1

    .line 806
    .local v23, "returnValue":I
    const-string v4, "Cut"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "Copy"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "Paste"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 807
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getSelectedFrame()Ljavax/swing/JInternalFrame;

    move-result-object v5

    .line 808
    .local v5, "f":Ljavax/swing/JInternalFrame;
    if-eqz v5, :cond_1

    instance-of v4, v5, Ljava/awt/event/ActionListener;

    if-eqz v4, :cond_1

    .line 809
    check-cast v5, Ljava/awt/event/ActionListener;

    .end local v5    # "f":Ljavax/swing/JInternalFrame;
    move-object/from16 v0, p1

    invoke-interface {v5, v0}, Ljava/awt/event/ActionListener;->actionPerformed(Ljava/awt/event/ActionEvent;)V

    .line 933
    :cond_1
    :goto_0
    const/4 v4, -0x1

    move/from16 v0, v23

    if-eq v0, v4, :cond_2

    .line 934
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->updateEnabled(Z)V

    .line 935
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    move/from16 v0, v23

    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/tools/debugger/Dim;->setReturnValue(I)V

    .line 937
    :cond_2
    return-void

    .line 811
    :cond_3
    const-string v4, "Step Over"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 812
    const/16 v23, 0x0

    goto :goto_0

    .line 813
    :cond_4
    const-string v4, "Step Into"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 814
    const/16 v23, 0x1

    goto :goto_0

    .line 815
    :cond_5
    const-string v4, "Step Out"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 816
    const/16 v23, 0x2

    goto :goto_0

    .line 817
    :cond_6
    const-string v4, "Go"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 818
    const/16 v23, 0x3

    goto :goto_0

    .line 819
    :cond_7
    const-string v4, "Break"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 820
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreak()V

    goto :goto_0

    .line 821
    :cond_8
    const-string v4, "Exit"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 822
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->exit()V

    goto :goto_0

    .line 823
    :cond_9
    const-string v4, "Open"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 824
    const-string v4, "Select a file to compile"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->chooseFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 825
    .local v16, "fileName":Ljava/lang/String;
    if-eqz v16, :cond_1

    .line 826
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 827
    .local v26, "text":Ljava/lang/String;
    if-eqz v26, :cond_1

    .line 828
    new-instance v22, Lorg/mozilla/javascript/tools/debugger/RunProxy;

    const/4 v4, 0x1

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lorg/mozilla/javascript/tools/debugger/RunProxy;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;I)V

    .line 829
    .local v22, "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    move-object/from16 v0, v16

    move-object/from16 v1, v22

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    .line 830
    move-object/from16 v0, v26

    move-object/from16 v1, v22

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/RunProxy;->text:Ljava/lang/String;

    .line 831
    new-instance v4, Ljava/lang/Thread;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 834
    .end local v16    # "fileName":Ljava/lang/String;
    .end local v22    # "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    .end local v26    # "text":Ljava/lang/String;
    :cond_a
    const-string v4, "Load"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 835
    const-string v4, "Select a file to execute"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->chooseFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 836
    .restart local v16    # "fileName":Ljava/lang/String;
    if-eqz v16, :cond_1

    .line 837
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 838
    .restart local v26    # "text":Ljava/lang/String;
    if-eqz v26, :cond_1

    .line 839
    new-instance v22, Lorg/mozilla/javascript/tools/debugger/RunProxy;

    const/4 v4, 0x2

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lorg/mozilla/javascript/tools/debugger/RunProxy;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;I)V

    .line 840
    .restart local v22    # "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    move-object/from16 v0, v16

    move-object/from16 v1, v22

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    .line 841
    move-object/from16 v0, v26

    move-object/from16 v1, v22

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/RunProxy;->text:Ljava/lang/String;

    .line 842
    new-instance v4, Ljava/lang/Thread;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 845
    .end local v16    # "fileName":Ljava/lang/String;
    .end local v22    # "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    .end local v26    # "text":Ljava/lang/String;
    :cond_b
    const-string v4, "More Windows..."

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 846
    new-instance v15, Lorg/mozilla/javascript/tools/debugger/MoreWindows;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    const-string v27, "Window"

    const-string v28, "Files"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-direct {v15, v0, v4, v1, v2}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    .local v15, "dlg":Lorg/mozilla/javascript/tools/debugger/MoreWindows;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->showDialog(Ljava/awt/Component;)Ljava/lang/String;

    goto/16 :goto_0

    .line 849
    .end local v15    # "dlg":Lorg/mozilla/javascript/tools/debugger/MoreWindows;
    :cond_c
    const-string v4, "Console"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 850
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->isIcon()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 851
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-interface {v4, v0}, Ljavax/swing/DesktopManager;->deiconifyFrame(Ljavax/swing/JInternalFrame;)V

    .line 853
    :cond_d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->show()V

    .line 854
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-interface {v4, v0}, Ljavax/swing/DesktopManager;->activateFrame(Ljavax/swing/JInternalFrame;)V

    .line 855
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    iget-object v4, v4, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->requestFocus()V

    goto/16 :goto_0

    .line 856
    :cond_e
    const-string v4, "Cut"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 857
    const-string v4, "Copy"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 858
    const-string v4, "Paste"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 859
    const-string v4, "Go to function..."

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 860
    new-instance v15, Lorg/mozilla/javascript/tools/debugger/FindFunction;

    const-string v4, "Go to function"

    const-string v27, "Function"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v15, v0, v4, v1}, Lorg/mozilla/javascript/tools/debugger/FindFunction;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljava/lang/String;Ljava/lang/String;)V

    .line 862
    .local v15, "dlg":Lorg/mozilla/javascript/tools/debugger/FindFunction;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/tools/debugger/FindFunction;->showDialog(Ljava/awt/Component;)Ljava/lang/String;

    goto/16 :goto_0

    .line 863
    .end local v15    # "dlg":Lorg/mozilla/javascript/tools/debugger/FindFunction;
    :cond_f
    const-string v4, "Tile"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 864
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getAllFrames()[Ljavax/swing/JInternalFrame;

    move-result-object v17

    .line 865
    .local v17, "frames":[Ljavax/swing/JInternalFrame;
    move-object/from16 v0, v17

    array-length v12, v0

    .line 867
    .local v12, "count":I
    int-to-double v0, v12

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v28

    move-wide/from16 v0, v28

    double-to-int v11, v0

    .local v11, "cols":I
    move/from16 v24, v11

    .line 868
    .local v24, "rows":I
    mul-int v4, v24, v11

    if-ge v4, v12, :cond_10

    .line 869
    add-int/lit8 v11, v11, 0x1

    .line 870
    mul-int v4, v24, v11

    if-ge v4, v12, :cond_10

    .line 871
    add-int/lit8 v24, v24, 0x1

    .line 874
    :cond_10
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getSize()Ljava/awt/Dimension;

    move-result-object v25

    .line 875
    .local v25, "size":Ljava/awt/Dimension;
    move-object/from16 v0, v25

    iget v4, v0, Ljava/awt/Dimension;->width:I

    div-int v8, v4, v11

    .line 876
    .local v8, "w":I
    move-object/from16 v0, v25

    iget v4, v0, Ljava/awt/Dimension;->height:I

    div-int v9, v4, v24

    .line 877
    .local v9, "h":I
    const/4 v6, 0x0

    .line 878
    .local v6, "x":I
    const/4 v7, 0x0

    .line 879
    .local v7, "y":I
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_1
    move/from16 v0, v18

    move/from16 v1, v24

    if-ge v0, v1, :cond_1

    .line 880
    const/16 v20, 0x0

    .local v20, "j":I
    :goto_2
    move/from16 v0, v20

    if-ge v0, v11, :cond_11

    .line 881
    mul-int v4, v18, v11

    add-int v19, v4, v20

    .line 882
    .local v19, "index":I
    move-object/from16 v0, v17

    array-length v4, v0

    move/from16 v0, v19

    if-lt v0, v4, :cond_12

    .line 895
    .end local v19    # "index":I
    :cond_11
    add-int/2addr v7, v9

    .line 896
    const/4 v6, 0x0

    .line 879
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 885
    .restart local v19    # "index":I
    :cond_12
    aget-object v5, v17, v19

    .line 887
    .restart local v5    # "f":Ljavax/swing/JInternalFrame;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v5, v4}, Ljavax/swing/JInternalFrame;->setIcon(Z)V

    .line 888
    const/4 v4, 0x0

    invoke-virtual {v5, v4}, Ljavax/swing/JInternalFrame;->setMaximum(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 891
    :goto_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v4

    invoke-interface/range {v4 .. v9}, Ljavax/swing/DesktopManager;->setBoundsForFrame(Ljavax/swing/JComponent;IIII)V

    .line 893
    add-int/2addr v6, v8

    .line 880
    add-int/lit8 v20, v20, 0x1

    goto :goto_2

    .line 898
    .end local v5    # "f":Ljavax/swing/JInternalFrame;
    .end local v6    # "x":I
    .end local v7    # "y":I
    .end local v8    # "w":I
    .end local v9    # "h":I
    .end local v11    # "cols":I
    .end local v12    # "count":I
    .end local v17    # "frames":[Ljavax/swing/JInternalFrame;
    .end local v18    # "i":I
    .end local v19    # "index":I
    .end local v20    # "j":I
    .end local v24    # "rows":I
    .end local v25    # "size":Ljava/awt/Dimension;
    :cond_13
    const-string v4, "Cascade"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 899
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getAllFrames()[Ljavax/swing/JInternalFrame;

    move-result-object v17

    .line 900
    .restart local v17    # "frames":[Ljavax/swing/JInternalFrame;
    move-object/from16 v0, v17

    array-length v12, v0

    .line 902
    .restart local v12    # "count":I
    const/4 v7, 0x0

    .restart local v7    # "y":I
    move v6, v7

    .line 903
    .restart local v6    # "x":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getHeight()I

    move-result v9

    .line 904
    .restart local v9    # "h":I
    div-int v13, v9, v12

    .line 905
    .local v13, "d":I
    const/16 v4, 0x1e

    if-le v13, v4, :cond_14

    const/16 v13, 0x1e

    .line 906
    :cond_14
    add-int/lit8 v18, v12, -0x1

    .restart local v18    # "i":I
    :goto_4
    if-ltz v18, :cond_1

    .line 907
    aget-object v5, v17, v18

    .line 909
    .restart local v5    # "f":Ljavax/swing/JInternalFrame;
    const/4 v4, 0x0

    :try_start_1
    invoke-virtual {v5, v4}, Ljavax/swing/JInternalFrame;->setIcon(Z)V

    .line 910
    const/4 v4, 0x0

    invoke-virtual {v5, v4}, Ljavax/swing/JInternalFrame;->setMaximum(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 913
    :goto_5
    invoke-virtual {v5}, Ljavax/swing/JInternalFrame;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v14

    .line 914
    .local v14, "dimen":Ljava/awt/Dimension;
    iget v8, v14, Ljava/awt/Dimension;->width:I

    .line 915
    .restart local v8    # "w":I
    iget v9, v14, Ljava/awt/Dimension;->height:I

    .line 916
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v4

    invoke-interface/range {v4 .. v9}, Ljavax/swing/DesktopManager;->setBoundsForFrame(Ljavax/swing/JComponent;IIII)V

    .line 906
    add-int/lit8 v18, v18, -0x1

    add-int/2addr v6, v13

    add-int/2addr v7, v13

    goto :goto_4

    .line 919
    .end local v5    # "f":Ljavax/swing/JInternalFrame;
    .end local v6    # "x":I
    .end local v7    # "y":I
    .end local v8    # "w":I
    .end local v9    # "h":I
    .end local v12    # "count":I
    .end local v13    # "d":I
    .end local v14    # "dimen":Ljava/awt/Dimension;
    .end local v17    # "frames":[Ljavax/swing/JInternalFrame;
    .end local v18    # "i":I
    :cond_15
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-result-object v21

    .line 920
    .local v21, "obj":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    if-eqz v21, :cond_1

    move-object/from16 v8, v21

    .line 921
    check-cast v8, Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .line 923
    .local v8, "w":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    :try_start_2
    invoke-virtual {v8}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->isIcon()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 924
    const/4 v4, 0x0

    invoke-virtual {v8, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setIcon(Z)V

    .line 926
    :cond_16
    const/4 v4, 0x1

    invoke-virtual {v8, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setVisible(Z)V

    .line 927
    invoke-virtual {v8}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->moveToFront()V

    .line 928
    const/4 v4, 0x1

    invoke-virtual {v8, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setSelected(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 929
    :catch_0
    move-exception v4

    goto/16 :goto_0

    .line 911
    .end local v8    # "w":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    .end local v21    # "obj":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    .restart local v5    # "f":Ljavax/swing/JInternalFrame;
    .restart local v6    # "x":I
    .restart local v7    # "y":I
    .restart local v9    # "h":I
    .restart local v12    # "count":I
    .restart local v13    # "d":I
    .restart local v17    # "frames":[Ljavax/swing/JInternalFrame;
    .restart local v18    # "i":I
    :catch_1
    move-exception v4

    goto :goto_5

    .line 889
    .end local v13    # "d":I
    .local v8, "w":I
    .restart local v11    # "cols":I
    .restart local v19    # "index":I
    .restart local v20    # "j":I
    .restart local v24    # "rows":I
    .restart local v25    # "size":Ljava/awt/Dimension;
    :catch_2
    move-exception v4

    goto/16 :goto_3
.end method

.method addTopLevel(Ljava/lang/String;Ljavax/swing/JFrame;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "frame"    # Ljavax/swing/JFrame;

    .prologue
    .line 200
    if-eq p2, p0, :cond_0

    .line 201
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->toplevels:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    :cond_0
    return-void
.end method

.method protected createFileWindow(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;I)V
    .locals 9
    .param p1, "sourceInfo"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
    .param p2, "line"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, -0x1

    .line 483
    const/4 v0, 0x1

    .line 485
    .local v0, "activate":Z
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v3

    .line 486
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Lorg/mozilla/javascript/tools/debugger/FileWindow;

    invoke-direct {v4, p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V

    .line 487
    .local v4, "w":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    if-eq p2, v7, :cond_1

    .line 489
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    if-eqz v5, :cond_0

    .line 490
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    invoke-virtual {v5, v7}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V

    .line 493
    :cond_0
    :try_start_0
    iget-object v5, v4, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    add-int/lit8 v6, p2, -0x1

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 502
    :cond_1
    :goto_0
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v5, v4}, Ljavax/swing/JDesktopPane;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 503
    if-eq p2, v7, :cond_2

    .line 504
    iput-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->currentWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .line 506
    :cond_2
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    invoke-virtual {v5, v3}, Lorg/mozilla/javascript/tools/debugger/Menubar;->addFile(Ljava/lang/String;)V

    .line 507
    invoke-virtual {v4, v8}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setVisible(Z)V

    .line 509
    if-eqz v0, :cond_3

    .line 511
    const/4 v5, 0x1

    :try_start_1
    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setMaximum(Z)V

    .line 512
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setSelected(Z)V

    .line 513
    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->moveToFront()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 517
    :cond_3
    :goto_1
    return-void

    .line 494
    :catch_0
    move-exception v2

    .line 496
    .local v2, "exc":Ljavax/swing/text/BadLocationException;
    :try_start_2
    iget-object v5, v4, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V
    :try_end_2
    .catch Ljavax/swing/text/BadLocationException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 497
    :catch_1
    move-exception v1

    .line 498
    .local v1, "ee":Ljavax/swing/text/BadLocationException;
    invoke-virtual {v4, v7}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setPosition(I)V

    goto :goto_0

    .line 514
    .end local v1    # "ee":Ljavax/swing/text/BadLocationException;
    .end local v2    # "exc":Ljavax/swing/text/BadLocationException;
    :catch_2
    move-exception v5

    goto :goto_1
.end method

.method public dispatchNextGuiEvent()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 779
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->awtEventQueue:Ljava/awt/EventQueue;

    .line 780
    .local v2, "queue":Ljava/awt/EventQueue;
    if-nez v2, :cond_0

    .line 781
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v4

    invoke-virtual {v4}, Ljava/awt/Toolkit;->getSystemEventQueue()Ljava/awt/EventQueue;

    move-result-object v2

    .line 782
    iput-object v2, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->awtEventQueue:Ljava/awt/EventQueue;

    .line 784
    :cond_0
    invoke-virtual {v2}, Ljava/awt/EventQueue;->getNextEvent()Ljava/awt/AWTEvent;

    move-result-object v1

    .line 785
    .local v1, "event":Ljava/awt/AWTEvent;
    instance-of v4, v1, Ljava/awt/ActiveEvent;

    if-eqz v4, :cond_2

    .line 786
    check-cast v1, Ljava/awt/ActiveEvent;

    .end local v1    # "event":Ljava/awt/AWTEvent;
    invoke-interface {v1}, Ljava/awt/ActiveEvent;->dispatch()V

    .line 796
    :cond_1
    :goto_0
    return-void

    .line 788
    .restart local v1    # "event":Ljava/awt/AWTEvent;
    :cond_2
    invoke-virtual {v1}, Ljava/awt/AWTEvent;->getSource()Ljava/lang/Object;

    move-result-object v3

    .line 789
    .local v3, "source":Ljava/lang/Object;
    instance-of v4, v3, Ljava/awt/Component;

    if-eqz v4, :cond_3

    move-object v0, v3

    .line 790
    check-cast v0, Ljava/awt/Component;

    .line 791
    .local v0, "comp":Ljava/awt/Component;
    invoke-virtual {v0, v1}, Ljava/awt/Component;->dispatchEvent(Ljava/awt/AWTEvent;)V

    goto :goto_0

    .line 792
    .end local v0    # "comp":Ljava/awt/Component;
    :cond_3
    instance-of v4, v3, Ljava/awt/MenuComponent;

    if-eqz v4, :cond_1

    .line 793
    check-cast v3, Ljava/awt/MenuComponent;

    .end local v3    # "source":Ljava/lang/Object;
    invoke-virtual {v3, v1}, Ljava/awt/MenuComponent;->dispatchEvent(Ljava/awt/AWTEvent;)V

    goto :goto_0
.end method

.method public enterInterrupt(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "lastFrame"    # Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;
    .param p2, "threadTitle"    # Ljava/lang/String;
    .param p3, "alertMessage"    # Ljava/lang/String;

    .prologue
    .line 757
    invoke-static {}, Ljavax/swing/SwingUtilities;->isEventDispatchThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 758
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->enterInterruptImpl(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    :goto_0
    return-void

    .line 760
    :cond_0
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lorg/mozilla/javascript/tools/debugger/RunProxy;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;I)V

    .line 761
    .local v0, "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    iput-object p1, v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->lastFrame:Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;

    .line 762
    iput-object p2, v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->threadTitle:Ljava/lang/String;

    .line 763
    iput-object p3, v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->alertMessage:Ljava/lang/String;

    .line 764
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method enterInterruptImpl(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14
    .param p1, "lastFrame"    # Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;
    .param p2, "threadTitle"    # Ljava/lang/String;
    .param p3, "alertMessage"    # Ljava/lang/String;

    .prologue
    .line 581
    iget-object v11, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Thread: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    .line 583
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->showStopLine(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;)V

    .line 585
    if-eqz p3, :cond_0

    .line 586
    const-string v11, "Exception in Script"

    const/4 v12, 0x0

    move-object/from16 v0, p3

    invoke-static {p0, v0, v11, v12}, Lorg/mozilla/javascript/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    .line 592
    :cond_0
    const/4 v11, 0x1

    invoke-direct {p0, v11}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->updateEnabled(Z)V

    .line 594
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->contextData()Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;

    move-result-object v1

    .line 596
    .local v1, "contextData":Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;
    iget-object v11, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    iget-object v2, v11, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    .line 597
    .local v2, "ctx":Ljavax/swing/JComboBox;
    iget-object v11, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    iget-object v9, v11, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->toolTips:Ljava/util/List;

    .line 598
    .local v9, "toolTips":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v11, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    invoke-virtual {v11}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->disableUpdate()V

    .line 599
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v4

    .line 600
    .local v4, "frameCount":I
    invoke-virtual {v2}, Ljavax/swing/JComboBox;->removeAllItems()V

    .line 603
    const/4 v11, 0x0

    invoke-virtual {v2, v11}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 604
    invoke-interface {v9}, Ljava/util/List;->clear()V

    .line 605
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v4, :cond_2

    .line 606
    invoke-virtual {v1, v5}, Lorg/mozilla/javascript/tools/debugger/Dim$ContextData;->getFrame(I)Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;

    move-result-object v3

    .line 607
    .local v3, "frame":Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->getUrl()Ljava/lang/String;

    move-result-object v10

    .line 608
    .local v10, "url":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->getLineNumber()I

    move-result v6

    .line 609
    .local v6, "lineNumber":I
    move-object v8, v10

    .line 610
    .local v8, "shortName":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0x14

    if-le v11, v12, :cond_1

    .line 611
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "..."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x11

    invoke-virtual {v10, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 613
    :cond_1
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\", line "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 614
    .local v7, "location":Ljava/lang/String;
    invoke-virtual {v2, v7, v5}, Ljavax/swing/JComboBox;->insertItemAt(Ljava/lang/Object;I)V

    .line 615
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\", line "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 616
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 605
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 618
    .end local v3    # "frame":Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;
    .end local v6    # "lineNumber":I
    .end local v7    # "location":Ljava/lang/String;
    .end local v8    # "shortName":Ljava/lang/String;
    .end local v10    # "url":Ljava/lang/String;
    :cond_2
    iget-object v11, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    invoke-virtual {v11}, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->enableUpdate()V

    .line 619
    const/4 v11, 0x0

    invoke-virtual {v2, v11}, Ljavax/swing/JComboBox;->setSelectedIndex(I)V

    .line 620
    new-instance v11, Ljava/awt/Dimension;

    const/16 v12, 0x32

    invoke-virtual {v2}, Ljavax/swing/JComboBox;->getMinimumSize()Ljava/awt/Dimension;

    move-result-object v13

    iget v13, v13, Ljava/awt/Dimension;->height:I

    invoke-direct {v11, v12, v13}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v2, v11}, Ljavax/swing/JComboBox;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 621
    return-void
.end method

.method public getConsole()Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    return-object v0
.end method

.method getFileWindow(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/FileWindow;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 347
    if-eqz p1, :cond_0

    const-string v0, "<stdin>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 348
    :cond_0
    const/4 v0, 0x0

    .line 350
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/tools/debugger/FileWindow;

    goto :goto_0
.end method

.method public getMenubar()Lorg/mozilla/javascript/tools/debugger/Menubar;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->menubar:Lorg/mozilla/javascript/tools/debugger/Menubar;

    return-object v0
.end method

.method public isGuiEventThread()Z
    .locals 1

    .prologue
    .line 772
    invoke-static {}, Ljavax/swing/SwingUtilities;->isEventDispatchThread()Z

    move-result v0

    return v0
.end method

.method removeWindow(Lorg/mozilla/javascript/tools/debugger/FileWindow;)V
    .locals 13
    .param p1, "w"    # Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .prologue
    const/16 v12, 0x20

    .line 372
    iget-object v10, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getWindowMenu()Ljavax/swing/JMenu;

    move-result-object v9

    .line 374
    .local v9, "windowMenu":Ljavax/swing/JMenu;
    invoke-virtual {v9}, Ljavax/swing/JMenu;->getItemCount()I

    move-result v0

    .line 375
    .local v0, "count":I
    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v9, v10}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v4

    .line 376
    .local v4, "lastItem":Ljavax/swing/JMenuItem;
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 377
    .local v5, "name":Ljava/lang/String;
    const/4 v1, 0x5

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 378
    invoke-virtual {v9, v1}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v2

    .line 379
    .local v2, "item":Ljavax/swing/JMenuItem;
    if-nez v2, :cond_1

    .line 377
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 380
    :cond_1
    invoke-virtual {v2}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v7

    .line 383
    .local v7, "text":Ljava/lang/String;
    invoke-virtual {v7, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 384
    .local v6, "pos":I
    add-int/lit8 v10, v6, 0x1

    invoke-virtual {v7, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 385
    invoke-virtual {v9, v2}, Ljavax/swing/JMenu;->remove(Ljavax/swing/JMenuItem;)V

    .line 391
    const/4 v10, 0x6

    if-ne v0, v10, :cond_3

    .line 393
    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Ljavax/swing/JMenu;->remove(I)V

    .line 422
    .end local v2    # "item":Ljavax/swing/JMenuItem;
    .end local v6    # "pos":I
    .end local v7    # "text":Ljava/lang/String;
    :cond_2
    :goto_1
    invoke-virtual {v9}, Ljavax/swing/JMenu;->revalidate()V

    .line 423
    return-void

    .line 395
    .restart local v2    # "item":Ljavax/swing/JMenuItem;
    .restart local v6    # "pos":I
    .restart local v7    # "text":Ljava/lang/String;
    :cond_3
    add-int/lit8 v3, v1, -0x4

    .line 396
    .local v3, "j":I
    :goto_2
    add-int/lit8 v10, v0, -0x1

    if-ge v1, v10, :cond_4

    .line 397
    invoke-virtual {v9, v1}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v8

    .line 398
    .local v8, "thisItem":Ljavax/swing/JMenuItem;
    if-eqz v8, :cond_6

    .line 401
    invoke-virtual {v8}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v7

    .line 402
    const-string v10, "More Windows..."

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 413
    .end local v8    # "thisItem":Ljavax/swing/JMenuItem;
    :cond_4
    add-int/lit8 v10, v0, -0x6

    if-nez v10, :cond_2

    if-eq v4, v2, :cond_2

    .line 414
    invoke-virtual {v4}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v10

    const-string v11, "More Windows..."

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 415
    invoke-virtual {v9, v4}, Ljavax/swing/JMenu;->remove(Ljavax/swing/JMenuItem;)V

    goto :goto_1

    .line 405
    .restart local v8    # "thisItem":Ljavax/swing/JMenuItem;
    :cond_5
    invoke-virtual {v7, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 406
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v11, v3, 0x30

    int-to-char v11, v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    add-int/lit8 v11, v6, 0x1

    invoke-virtual {v7, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljavax/swing/JMenuItem;->setText(Ljava/lang/String;)V

    .line 408
    add-int/lit8 v10, v3, 0x30

    invoke-virtual {v8, v10}, Ljavax/swing/JMenuItem;->setMnemonic(I)V

    .line 409
    add-int/lit8 v3, v3, 0x1

    .line 396
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public setExitAction(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 166
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->exitAction:Ljava/lang/Runnable;

    .line 167
    return-void
.end method

.method public setVisible(Z)V
    .locals 4
    .param p1, "b"    # Z

    .prologue
    .line 181
    invoke-super {p0, p1}, Ljavax/swing/JFrame;->setVisible(Z)V

    .line 182
    if-eqz p1, :cond_0

    .line 184
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->requestFocus()V

    .line 185
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->context:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    invoke-virtual {v0, v2, v3}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 187
    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->setMaximum(Z)V

    .line 188
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->setSelected(Z)V

    .line 189
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->show()V

    .line 190
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->requestFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 191
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected showFileWindow(Ljava/lang/String;I)V
    .locals 6
    .param p1, "sourceUrl"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I

    .prologue
    const/4 v5, -0x1

    .line 452
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-result-object v3

    .line 453
    .local v3, "w":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    if-nez v3, :cond_0

    .line 454
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v4, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->sourceInfo(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    move-result-object v1

    .line 455
    .local v1, "si":Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
    invoke-virtual {p0, v1, v5}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->createFileWindow(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;I)V

    .line 456
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-result-object v3

    .line 458
    .end local v1    # "si":Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
    :cond_0
    if-le p2, v5, :cond_1

    .line 459
    add-int/lit8 v4, p2, -0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getPosition(I)I

    move-result v2

    .line 460
    .local v2, "start":I
    invoke-virtual {v3, p2}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getPosition(I)I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .line 461
    .local v0, "end":I
    iget-object v4, v3, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v4, v2}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(I)V

    .line 462
    iget-object v4, v3, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v4, v2}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->setCaretPosition(I)V

    .line 463
    iget-object v4, v3, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->moveCaretPosition(I)V

    .line 466
    .end local v0    # "end":I
    .end local v2    # "start":I
    :cond_1
    :try_start_0
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->isIcon()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 467
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setIcon(Z)V

    .line 469
    :cond_2
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setVisible(Z)V

    .line 470
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->moveToFront()V

    .line 471
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setSelected(Z)V

    .line 472
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->requestFocus()V

    .line 473
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->requestFocus()V

    .line 474
    iget-object v4, v3, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->requestFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 477
    :goto_0
    return-void

    .line 475
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method showStopLine(Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;)V
    .locals 4
    .param p1, "frame"    # Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;

    .prologue
    .line 429
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 430
    .local v1, "sourceName":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v3, "<stdin>"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 431
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 432
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/SwingGui;->console:Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->show()V

    .line 442
    :cond_1
    :goto_0
    return-void

    .line 435
    :cond_2
    const/4 v3, -0x1

    invoke-virtual {p0, v1, v3}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V

    .line 436
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/Dim$StackFrame;->getLineNumber()I

    move-result v0

    .line 437
    .local v0, "lineNumber":I
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-result-object v2

    .line 438
    .local v2, "w":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    if-eqz v2, :cond_1

    .line 439
    invoke-direct {p0, v2, v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setFilePosition(Lorg/mozilla/javascript/tools/debugger/FileWindow;I)V

    goto :goto_0
.end method

.method protected updateFileWindow(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)Z
    .locals 3
    .param p1, "sourceInfo"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    .line 528
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    .line 529
    .local v0, "fileName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-result-object v1

    .line 530
    .local v1, "w":Lorg/mozilla/javascript/tools/debugger/FileWindow;
    if-eqz v1, :cond_0

    .line 531
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->updateText(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V

    .line 532
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->show()V

    .line 533
    const/4 v2, 0x1

    .line 535
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public updateSourceText(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V
    .locals 2
    .param p1, "sourceInfo"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    .line 746
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lorg/mozilla/javascript/tools/debugger/RunProxy;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;I)V

    .line 747
    .local v0, "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    iput-object p1, v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .line 748
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 749
    return-void
.end method
