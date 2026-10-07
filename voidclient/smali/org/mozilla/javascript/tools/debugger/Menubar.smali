.class Lorg/mozilla/javascript/tools/debugger/Menubar;
.super Ljavax/swing/JMenuBar;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = 0x2ca5af859e3599a5L


# instance fields
.field private breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

.field private breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

.field private breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

.field private debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field private interruptOnlyItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljavax/swing/JMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private runOnlyItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljavax/swing/JMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private windowMenu:Ljavax/swing/JMenu;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V
    .locals 23
    .param p1, "debugGui"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .prologue
    .line 3213
    invoke-direct/range {p0 .. p0}, Ljavax/swing/JMenuBar;-><init>()V

    .line 3175
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v20 .. v20}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    .line 3181
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v20 .. v20}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    .line 3214
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 3215
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v11, v0, [Ljava/lang/String;

    const/16 v20, 0x0

    const-string v21, "Open..."

    aput-object v21, v11, v20

    const/16 v20, 0x1

    const-string v21, "Run..."

    aput-object v21, v11, v20

    const/16 v20, 0x2

    const-string v21, ""

    aput-object v21, v11, v20

    const/16 v20, 0x3

    const-string v21, "Exit"

    aput-object v21, v11, v20

    .line 3216
    .local v11, "fileItems":[Ljava/lang/String;
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v10, v0, [Ljava/lang/String;

    const/16 v20, 0x0

    const-string v21, "Open"

    aput-object v21, v10, v20

    const/16 v20, 0x1

    const-string v21, "Load"

    aput-object v21, v10, v20

    const/16 v20, 0x2

    const-string v21, ""

    aput-object v21, v10, v20

    const/16 v20, 0x3

    const-string v21, "Exit"

    aput-object v21, v10, v20

    .line 3217
    .local v10, "fileCmds":[Ljava/lang/String;
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v13, v0, [C

    fill-array-data v13, :array_0

    .line 3218
    .local v13, "fileShortCuts":[C
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v9, v0, [I

    fill-array-data v9, :array_1

    .line 3222
    .local v9, "fileAccelerators":[I
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v6, v0, [Ljava/lang/String;

    const/16 v20, 0x0

    const-string v21, "Cut"

    aput-object v21, v6, v20

    const/16 v20, 0x1

    const-string v21, "Copy"

    aput-object v21, v6, v20

    const/16 v20, 0x2

    const-string v21, "Paste"

    aput-object v21, v6, v20

    const/16 v20, 0x3

    const-string v21, "Go to function..."

    aput-object v21, v6, v20

    .line 3223
    .local v6, "editItems":[Ljava/lang/String;
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v8, v0, [C

    fill-array-data v8, :array_2

    .line 3224
    .local v8, "editShortCuts":[C
    const/16 v20, 0x5

    move/from16 v0, v20

    new-array v3, v0, [Ljava/lang/String;

    const/16 v20, 0x0

    const-string v21, "Break"

    aput-object v21, v3, v20

    const/16 v20, 0x1

    const-string v21, "Go"

    aput-object v21, v3, v20

    const/16 v20, 0x2

    const-string v21, "Step Into"

    aput-object v21, v3, v20

    const/16 v20, 0x3

    const-string v21, "Step Over"

    aput-object v21, v3, v20

    const/16 v20, 0x4

    const-string v21, "Step Out"

    aput-object v21, v3, v20

    .line 3225
    .local v3, "debugItems":[Ljava/lang/String;
    const/16 v20, 0x5

    move/from16 v0, v20

    new-array v5, v0, [C

    fill-array-data v5, :array_3

    .line 3226
    .local v5, "debugShortCuts":[C
    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v20, 0x0

    const-string v21, "Metal"

    aput-object v21, v17, v20

    const/16 v20, 0x1

    const-string v21, "Windows"

    aput-object v21, v17, v20

    const/16 v20, 0x2

    const-string v21, "Motif"

    aput-object v21, v17, v20

    .line 3227
    .local v17, "plafItems":[Ljava/lang/String;
    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v0, v0, [C

    move-object/from16 v19, v0

    fill-array-data v19, :array_4

    .line 3228
    .local v19, "plafShortCuts":[C
    const/16 v20, 0x7

    move/from16 v0, v20

    new-array v2, v0, [I

    fill-array-data v2, :array_5

    .line 3235
    .local v2, "debugAccelerators":[I
    new-instance v12, Ljavax/swing/JMenu;

    const-string v20, "File"

    move-object/from16 v0, v20

    invoke-direct {v12, v0}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 3236
    .local v12, "fileMenu":Ljavax/swing/JMenu;
    const/16 v20, 0x46

    move/from16 v0, v20

    invoke-virtual {v12, v0}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3237
    new-instance v7, Ljavax/swing/JMenu;

    const-string v20, "Edit"

    move-object/from16 v0, v20

    invoke-direct {v7, v0}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 3238
    .local v7, "editMenu":Ljavax/swing/JMenu;
    const/16 v20, 0x45

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3239
    new-instance v18, Ljavax/swing/JMenu;

    const-string v20, "Platform"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 3240
    .local v18, "plafMenu":Ljavax/swing/JMenu;
    const/16 v20, 0x50

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3241
    new-instance v4, Ljavax/swing/JMenu;

    const-string v20, "Debug"

    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 3242
    .local v4, "debugMenu":Ljavax/swing/JMenu;
    const/16 v20, 0x44

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3243
    new-instance v20, Ljavax/swing/JMenu;

    const-string v21, "Window"

    invoke-direct/range {v20 .. v21}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    .line 3244
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    move-object/from16 v20, v0

    const/16 v21, 0x57

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3245
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    array-length v0, v11

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v14, v0, :cond_2

    .line 3246
    aget-object v20, v11, v14

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_1

    .line 3247
    invoke-virtual {v12}, Ljavax/swing/JMenu;->addSeparator()V

    .line 3245
    :cond_0
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 3249
    :cond_1
    new-instance v15, Ljavax/swing/JMenuItem;

    aget-object v20, v11, v14

    aget-char v21, v13, v14

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 3251
    .local v15, "item":Ljavax/swing/JMenuItem;
    aget-object v20, v10, v14

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 3252
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3253
    invoke-virtual {v12, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3254
    aget v20, v9, v14

    if-eqz v20, :cond_0

    .line 3255
    aget v20, v9, v14

    const/16 v21, 0x2

    invoke-static/range {v20 .. v21}, Ljavax/swing/KeyStroke;->getKeyStroke(II)Ljavax/swing/KeyStroke;

    move-result-object v16

    .line 3256
    .local v16, "k":Ljavax/swing/KeyStroke;
    invoke-virtual/range {v15 .. v16}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    goto :goto_1

    .line 3260
    .end local v15    # "item":Ljavax/swing/JMenuItem;
    .end local v16    # "k":Ljavax/swing/KeyStroke;
    :cond_2
    const/4 v14, 0x0

    :goto_2
    array-length v0, v6

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v14, v0, :cond_3

    .line 3261
    new-instance v15, Ljavax/swing/JMenuItem;

    aget-object v20, v6, v14

    aget-char v21, v8, v14

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 3263
    .restart local v15    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3264
    invoke-virtual {v7, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3260
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 3266
    .end local v15    # "item":Ljavax/swing/JMenuItem;
    :cond_3
    const/4 v14, 0x0

    :goto_3
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v14, v0, :cond_4

    .line 3267
    new-instance v15, Ljavax/swing/JMenuItem;

    aget-object v20, v17, v14

    aget-char v21, v19, v14

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 3269
    .restart local v15    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3270
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3266
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 3272
    .end local v15    # "item":Ljavax/swing/JMenuItem;
    :cond_4
    const/4 v14, 0x0

    :goto_4
    array-length v0, v3

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v14, v0, :cond_7

    .line 3273
    new-instance v15, Ljavax/swing/JMenuItem;

    aget-object v20, v3, v14

    aget-char v21, v5, v14

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 3275
    .restart local v15    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3276
    aget v20, v2, v14

    if-eqz v20, :cond_5

    .line 3277
    aget v20, v2, v14

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Ljavax/swing/KeyStroke;->getKeyStroke(II)Ljavax/swing/KeyStroke;

    move-result-object v16

    .line 3278
    .restart local v16    # "k":Ljavax/swing/KeyStroke;
    invoke-virtual/range {v15 .. v16}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    .line 3280
    .end local v16    # "k":Ljavax/swing/KeyStroke;
    :cond_5
    if-eqz v14, :cond_6

    .line 3281
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3285
    :goto_5
    invoke-virtual {v4, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3272
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 3283
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 3287
    .end local v15    # "item":Ljavax/swing/JMenuItem;
    :cond_7
    new-instance v20, Ljavax/swing/JCheckBoxMenuItem;

    const-string v21, "Break on Exceptions"

    invoke-direct/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    .line 3288
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    const/16 v21, 0x58

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;->setMnemonic(C)V

    .line 3289
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljavax/swing/JCheckBoxMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3290
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 3291
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3293
    new-instance v20, Ljavax/swing/JCheckBoxMenuItem;

    const-string v21, "Break on Function Enter"

    invoke-direct/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    .line 3294
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    const/16 v21, 0x45

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;->setMnemonic(C)V

    .line 3295
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljavax/swing/JCheckBoxMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3296
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 3297
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3299
    new-instance v20, Ljavax/swing/JCheckBoxMenuItem;

    const-string v21, "Break on Function Return"

    invoke-direct/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    .line 3300
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    const/16 v21, 0x52

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;->setMnemonic(C)V

    .line 3301
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljavax/swing/JCheckBoxMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3302
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 3303
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3305
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3306
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/mozilla/javascript/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3308
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3310
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    move-object/from16 v20, v0

    new-instance v15, Ljavax/swing/JMenuItem;

    const-string v21, "Cascade"

    const/16 v22, 0x41

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .restart local v15    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3311
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3312
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    move-object/from16 v20, v0

    new-instance v15, Ljavax/swing/JMenuItem;

    .end local v15    # "item":Ljavax/swing/JMenuItem;
    const-string v21, "Tile"

    const/16 v22, 0x54

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .restart local v15    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3313
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3314
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljavax/swing/JMenu;->addSeparator()V

    .line 3315
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    move-object/from16 v20, v0

    new-instance v15, Ljavax/swing/JMenuItem;

    .end local v15    # "item":Ljavax/swing/JMenuItem;
    const-string v21, "Console"

    const/16 v22, 0x43

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v15, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .restart local v15    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3316
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3317
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3319
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/Menubar;->updateEnabled(Z)V

    .line 3320
    return-void

    .line 3217
    :array_0
    .array-data 2
        0x30s
        0x4es
        0x0s
        0x58s
    .end array-data

    .line 3218
    :array_1
    .array-data 4
        0x4f
        0x4e
        0x0
        0x51
    .end array-data

    .line 3223
    :array_2
    .array-data 2
        0x54s
        0x43s
        0x50s
        0x46s
    .end array-data

    .line 3225
    :array_3
    .array-data 2
        0x42s
        0x47s
        0x49s
        0x4fs
        0x54s
    .end array-data

    .line 3227
    nop

    :array_4
    .array-data 2
        0x4ds
        0x57s
        0x46s
    .end array-data

    .line 3228
    nop

    :array_5
    .array-data 4
        0x13
        0x74
        0x7a
        0x76
        0x77
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 5
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 3356
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 3357
    .local v0, "cmd":Ljava/lang/String;
    const/4 v1, 0x0

    .line 3358
    .local v1, "plaf_name":Ljava/lang/String;
    const-string v3, "Metal"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3359
    const-string v1, "javax.swing.plaf.metal.MetalLookAndFeel"

    .line 3378
    :goto_0
    :try_start_0
    invoke-static {v1}, Ljavax/swing/UIManager;->setLookAndFeel(Ljava/lang/String;)V

    .line 3379
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-static {v3}, Ljavax/swing/SwingUtilities;->updateComponentTreeUI(Ljava/awt/Component;)V

    .line 3380
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, v3, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-static {v3}, Ljavax/swing/SwingUtilities;->updateComponentTreeUI(Ljava/awt/Component;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3384
    :goto_1
    return-void

    .line 3360
    :cond_0
    const-string v3, "Windows"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3361
    const-string v1, "com.sun.java.swing.plaf.windows.WindowsLookAndFeel"

    goto :goto_0

    .line 3362
    :cond_1
    const-string v3, "Motif"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3363
    const-string v1, "com.sun.java.swing.plaf.motif.MotifLookAndFeel"

    goto :goto_0

    .line 3365
    :cond_2
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getSource()Ljava/lang/Object;

    move-result-object v2

    .line 3366
    .local v2, "source":Ljava/lang/Object;
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    if-ne v2, v3, :cond_3

    .line 3367
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, v3, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v4}, Ljavax/swing/JCheckBoxMenuItem;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreakOnExceptions(Z)V

    goto :goto_1

    .line 3368
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    if-ne v2, v3, :cond_4

    .line 3369
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, v3, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v4}, Ljavax/swing/JCheckBoxMenuItem;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreakOnEnter(Z)V

    goto :goto_1

    .line 3370
    :cond_4
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    if-ne v2, v3, :cond_5

    .line 3371
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v3, v3, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v4}, Ljavax/swing/JCheckBoxMenuItem;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreakOnReturn(Z)V

    goto :goto_1

    .line 3373
    :cond_5
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->actionPerformed(Ljava/awt/event/ActionEvent;)V

    goto :goto_1

    .line 3381
    .end local v2    # "source":Ljava/lang/Object;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public addFile(Ljava/lang/String;)V
    .locals 9
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 3390
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v6}, Ljavax/swing/JMenu;->getItemCount()I

    move-result v0

    .line 3392
    .local v0, "count":I
    const/4 v6, 0x4

    if-ne v0, v6, :cond_0

    .line 3393
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v6}, Ljavax/swing/JMenu;->addSeparator()V

    .line 3394
    add-int/lit8 v0, v0, 0x1

    .line 3396
    :cond_0
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    add-int/lit8 v7, v0, -0x1

    invoke-virtual {v6, v7}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v3

    .line 3397
    .local v3, "lastItem":Ljavax/swing/JMenuItem;
    const/4 v1, 0x0

    .line 3398
    .local v1, "hasMoreWin":Z
    const/4 v4, 0x5

    .line 3399
    .local v4, "maxWin":I
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v6

    const-string v7, "More Windows..."

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 3401
    const/4 v1, 0x1

    .line 3402
    add-int/lit8 v4, v4, 0x1

    .line 3404
    :cond_1
    if-nez v1, :cond_3

    add-int/lit8 v6, v0, -0x4

    const/4 v7, 0x5

    if-ne v6, v7, :cond_3

    .line 3405
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v2, Ljavax/swing/JMenuItem;

    const-string v7, "More Windows..."

    const/16 v8, 0x4d

    invoke-direct {v2, v7, v8}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .local v2, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v6, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3406
    const-string v6, "More Windows..."

    invoke-virtual {v2, v6}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 3407
    invoke-virtual {v2, p0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3425
    .end local v2    # "item":Ljavax/swing/JMenuItem;
    :cond_2
    :goto_0
    return-void

    .line 3409
    :cond_3
    add-int/lit8 v6, v0, -0x4

    if-gt v6, v4, :cond_2

    .line 3410
    if-eqz v1, :cond_4

    .line 3411
    add-int/lit8 v0, v0, -0x1

    .line 3412
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v6, v3}, Ljavax/swing/JMenu;->remove(Ljavax/swing/JMenuItem;)V

    .line 3414
    :cond_4
    invoke-static {p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3416
    .local v5, "shortName":Ljava/lang/String;
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v2, Ljavax/swing/JMenuItem;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v8, v0, -0x4

    add-int/lit8 v8, v8, 0x30

    int-to-char v8, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v0, -0x4

    add-int/lit8 v8, v8, 0x30

    invoke-direct {v2, v7, v8}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .restart local v2    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v6, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3417
    if-eqz v1, :cond_5

    .line 3418
    iget-object v6, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v6, v3}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3423
    :cond_5
    invoke-virtual {v2, p1}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 3424
    invoke-virtual {v2, p0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    goto :goto_0
.end method

.method public getBreakOnEnter()Ljavax/swing/JCheckBoxMenuItem;
    .locals 1

    .prologue
    .line 3333
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    return-object v0
.end method

.method public getBreakOnExceptions()Ljavax/swing/JCheckBoxMenuItem;
    .locals 1

    .prologue
    .line 3326
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    return-object v0
.end method

.method public getBreakOnReturn()Ljavax/swing/JCheckBoxMenuItem;
    .locals 1

    .prologue
    .line 3340
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    return-object v0
.end method

.method public getDebugMenu()Ljavax/swing/JMenu;
    .locals 1

    .prologue
    .line 3347
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/Menubar;->getMenu(I)Ljavax/swing/JMenu;

    move-result-object v0

    return-object v0
.end method

.method public updateEnabled(Z)V
    .locals 3
    .param p1, "interrupted"    # Z

    .prologue
    .line 3431
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_0

    .line 3432
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/swing/JMenuItem;

    .line 3433
    .local v1, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v1, p1}, Ljavax/swing/JMenuItem;->setEnabled(Z)V

    .line 3431
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3436
    .end local v1    # "item":Ljavax/swing/JMenuItem;
    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_2

    .line 3437
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/swing/JMenuItem;

    .line 3438
    .restart local v1    # "item":Ljavax/swing/JMenuItem;
    if-nez p1, :cond_1

    const/4 v2, 0x1

    :goto_2
    invoke-virtual {v1, v2}, Ljavax/swing/JMenuItem;->setEnabled(Z)V

    .line 3436
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3438
    :cond_1
    const/4 v2, 0x0

    goto :goto_2

    .line 3440
    .end local v1    # "item":Ljavax/swing/JMenuItem;
    :cond_2
    return-void
.end method
