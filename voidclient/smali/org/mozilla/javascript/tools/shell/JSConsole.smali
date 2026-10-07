.class public Lorg/mozilla/javascript/tools/shell/JSConsole;
.super Ljavax/swing/JFrame;
.source "JSConsole.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field static final serialVersionUID:J = 0x2367c621635c1accL


# instance fields
.field private CWD:Ljava/io/File;

.field private consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

.field private dlg:Ljavax/swing/JFileChooser;


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .locals 19
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 89
    const-string v17, "Rhino JavaScript Console"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 90
    new-instance v12, Ljavax/swing/JMenuBar;

    invoke-direct {v12}, Ljavax/swing/JMenuBar;-><init>()V

    .line 91
    .local v12, "menubar":Ljavax/swing/JMenuBar;
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/shell/JSConsole;->createFileChooser()V

    .line 92
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v6, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    const-string v18, "Load..."

    aput-object v18, v6, v17

    const/16 v17, 0x1

    const-string v18, "Exit"

    aput-object v18, v6, v17

    .line 93
    .local v6, "fileItems":[Ljava/lang/String;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v5, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    const-string v18, "Load"

    aput-object v18, v5, v17

    const/16 v17, 0x1

    const-string v18, "Exit"

    aput-object v18, v5, v17

    .line 94
    .local v5, "fileCmds":[Ljava/lang/String;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v8, v0, [C

    fill-array-data v8, :array_0

    .line 95
    .local v8, "fileShortCuts":[C
    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v2, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    const-string v18, "Cut"

    aput-object v18, v2, v17

    const/16 v17, 0x1

    const-string v18, "Copy"

    aput-object v18, v2, v17

    const/16 v17, 0x2

    const-string v18, "Paste"

    aput-object v18, v2, v17

    .line 96
    .local v2, "editItems":[Ljava/lang/String;
    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v4, v0, [C

    fill-array-data v4, :array_1

    .line 97
    .local v4, "editShortCuts":[C
    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v13, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    const-string v18, "Metal"

    aput-object v18, v13, v17

    const/16 v17, 0x1

    const-string v18, "Windows"

    aput-object v18, v13, v17

    const/16 v17, 0x2

    const-string v18, "Motif"

    aput-object v18, v13, v17

    .line 98
    .local v13, "plafItems":[Ljava/lang/String;
    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v15, v0, [Z

    fill-array-data v15, :array_2

    .line 99
    .local v15, "plafState":[Z
    new-instance v7, Ljavax/swing/JMenu;

    const-string v17, "File"

    move-object/from16 v0, v17

    invoke-direct {v7, v0}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 100
    .local v7, "fileMenu":Ljavax/swing/JMenu;
    const/16 v17, 0x46

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 101
    new-instance v3, Ljavax/swing/JMenu;

    const-string v17, "Edit"

    move-object/from16 v0, v17

    invoke-direct {v3, v0}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 102
    .local v3, "editMenu":Ljavax/swing/JMenu;
    const/16 v17, 0x45

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 103
    new-instance v14, Ljavax/swing/JMenu;

    const-string v17, "Platform"

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 104
    .local v14, "plafMenu":Ljavax/swing/JMenu;
    const/16 v17, 0x50

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 105
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    array-length v0, v6

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_0

    .line 106
    new-instance v11, Ljavax/swing/JMenuItem;

    aget-object v17, v6, v10

    aget-char v18, v8, v10

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v11, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 108
    .local v11, "item":Ljavax/swing/JMenuItem;
    aget-object v17, v5, v10

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 109
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 110
    invoke-virtual {v7, v11}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 105
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 112
    .end local v11    # "item":Ljavax/swing/JMenuItem;
    :cond_0
    const/4 v10, 0x0

    :goto_1
    array-length v0, v2

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_1

    .line 113
    new-instance v11, Ljavax/swing/JMenuItem;

    aget-object v17, v2, v10

    aget-char v18, v4, v10

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v11, v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 115
    .restart local v11    # "item":Ljavax/swing/JMenuItem;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 116
    invoke-virtual {v3, v11}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 112
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 118
    .end local v11    # "item":Ljavax/swing/JMenuItem;
    :cond_1
    new-instance v9, Ljavax/swing/ButtonGroup;

    invoke-direct {v9}, Ljavax/swing/ButtonGroup;-><init>()V

    .line 119
    .local v9, "group":Ljavax/swing/ButtonGroup;
    const/4 v10, 0x0

    :goto_2
    array-length v0, v13

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_2

    .line 120
    new-instance v11, Ljavax/swing/JRadioButtonMenuItem;

    aget-object v17, v13, v10

    aget-boolean v18, v15, v10

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v11, v0, v1}, Ljavax/swing/JRadioButtonMenuItem;-><init>(Ljava/lang/String;Z)V

    .line 122
    .local v11, "item":Ljavax/swing/JRadioButtonMenuItem;
    invoke-virtual {v9, v11}, Ljavax/swing/ButtonGroup;->add(Ljavax/swing/AbstractButton;)V

    .line 123
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Ljavax/swing/JRadioButtonMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 124
    invoke-virtual {v14, v11}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 119
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 126
    .end local v11    # "item":Ljavax/swing/JRadioButtonMenuItem;
    :cond_2
    invoke-virtual {v12, v7}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 127
    invoke-virtual {v12, v3}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 128
    invoke-virtual {v12, v14}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 129
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/tools/shell/JSConsole;->setJMenuBar(Ljavax/swing/JMenuBar;)V

    .line 130
    new-instance v17, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;-><init>([Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    .line 131
    new-instance v16, Ljavax/swing/JScrollPane;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v17}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 132
    .local v16, "scroller":Ljavax/swing/JScrollPane;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/JSConsole;->setContentPane(Ljava/awt/Container;)V

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v17, v0

    const/16 v18, 0x18

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setRows(I)V

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v17, v0

    const/16 v18, 0x50

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->setColumns(I)V

    .line 135
    new-instance v17, Lorg/mozilla/javascript/tools/shell/JSConsole$2;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/shell/JSConsole$2;-><init>(Lorg/mozilla/javascript/tools/shell/JSConsole;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/JSConsole;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 141
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/shell/JSConsole;->pack()V

    .line 142
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/JSConsole;->setVisible(Z)V

    .line 146
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getIn()Ljava/io/InputStream;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/Main;->setIn(Ljava/io/InputStream;)V

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getOut()Ljava/io/PrintStream;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/Main;->setOut(Ljava/io/PrintStream;)V

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->getErr()Ljava/io/PrintStream;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/Main;->setErr(Ljava/io/PrintStream;)V

    .line 149
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/tools/shell/Main;->main([Ljava/lang/String;)V

    .line 150
    return-void

    .line 94
    nop

    :array_0
    .array-data 2
        0x4cs
        0x58s
    .end array-data

    .line 96
    :array_1
    .array-data 2
        0x54s
        0x43s
        0x50s
    .end array-data

    .line 98
    nop

    :array_2
    .array-data 1
        0x1t
        0x0t
        0x0t
    .end array-data
.end method

.method public static main([Ljava/lang/String;)V
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 56
    new-instance v0, Lorg/mozilla/javascript/tools/shell/JSConsole;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/shell/JSConsole;-><init>([Ljava/lang/String;)V

    .line 57
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 7
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    const/4 v6, 0x0

    .line 153
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "cmd":Ljava/lang/String;
    const/4 v3, 0x0

    .line 155
    .local v3, "plaf_name":Ljava/lang/String;
    const-string v4, "Load"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 156
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/JSConsole;->chooseFile()Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "f":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 158
    const/16 v4, 0x5c

    const/16 v5, 0x2f

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 159
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "load(\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\");"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->eval(Ljava/lang/String;)V

    .line 194
    .end local v2    # "f":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 161
    :cond_1
    const-string v4, "Exit"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 162
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 163
    :cond_2
    const-string v4, "Cut"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 164
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->cut()V

    goto :goto_0

    .line 165
    :cond_3
    const-string v4, "Copy"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 166
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->copy()V

    goto :goto_0

    .line 167
    :cond_4
    const-string v4, "Paste"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 168
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->paste()V

    goto :goto_0

    .line 170
    :cond_5
    const-string v4, "Metal"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 171
    const-string v3, "javax.swing.plaf.metal.MetalLookAndFeel"

    .line 177
    :cond_6
    :goto_1
    if-eqz v3, :cond_0

    .line 179
    :try_start_0
    invoke-static {v3}, Ljavax/swing/UIManager;->setLookAndFeel(Ljava/lang/String;)V

    .line 180
    invoke-static {p0}, Ljavax/swing/SwingUtilities;->updateComponentTreeUI(Ljava/awt/Component;)V

    .line 181
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->consoleTextArea:Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/ConsoleTextArea;->postUpdateUI()V

    .line 184
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/JSConsole;->createFileChooser()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 185
    :catch_0
    move-exception v1

    .line 186
    .local v1, "exc":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Platform"

    invoke-static {p0, v4, v5, v6}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    goto :goto_0

    .line 172
    .end local v1    # "exc":Ljava/lang/Exception;
    :cond_7
    const-string v4, "Windows"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 173
    const-string v3, "com.sun.java.swing.plaf.windows.WindowsLookAndFeel"

    goto :goto_1

    .line 174
    :cond_8
    const-string v4, "Motif"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 175
    const-string v3, "com.sun.java.swing.plaf.motif.MotifLookAndFeel"

    goto :goto_1
.end method

.method public chooseFile()Ljava/lang/String;
    .locals 5

    .prologue
    .line 36
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->CWD:Ljava/io/File;

    if-nez v3, :cond_0

    .line 37
    const-string v3, "user.dir"

    invoke-static {v3}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "dir":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 39
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->CWD:Ljava/io/File;

    .line 42
    .end local v0    # "dir":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->CWD:Ljava/io/File;

    if-eqz v3, :cond_1

    .line 43
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->CWD:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljavax/swing/JFileChooser;->setCurrentDirectory(Ljava/io/File;)V

    .line 45
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    const-string v4, "Select a file to load"

    invoke-virtual {v3, v4}, Ljavax/swing/JFileChooser;->setDialogTitle(Ljava/lang/String;)V

    .line 46
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v3, p0}, Ljavax/swing/JFileChooser;->showOpenDialog(Ljava/awt/Component;)I

    move-result v2

    .line 47
    .local v2, "returnVal":I
    if-nez v2, :cond_2

    .line 48
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v3}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "result":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v4}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->CWD:Ljava/io/File;

    .line 52
    .end local v1    # "result":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public createFileChooser()V
    .locals 2

    .prologue
    .line 60
    new-instance v1, Ljavax/swing/JFileChooser;

    invoke-direct {v1}, Ljavax/swing/JFileChooser;-><init>()V

    iput-object v1, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    .line 61
    new-instance v0, Lorg/mozilla/javascript/tools/shell/JSConsole$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/shell/JSConsole$1;-><init>(Lorg/mozilla/javascript/tools/shell/JSConsole;)V

    .line 84
    .local v0, "filter":Ljavax/swing/filechooser/FileFilter;
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v1, v0}, Ljavax/swing/JFileChooser;->addChoosableFileFilter(Ljavax/swing/filechooser/FileFilter;)V

    .line 86
    return-void
.end method
