.class Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;
.super Ljavax/swing/JPopupMenu;
.source "SwingGui.java"


# static fields
.field private static final serialVersionUID:J = 0x31d08dfa625eeb7dL


# instance fields
.field x:I

.field y:I


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/FileTextArea;)V
    .locals 2
    .param p1, "w"    # Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    .prologue
    .line 1364
    invoke-direct {p0}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 1366
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Set Breakpoint"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .local v0, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1367
    invoke-virtual {v0, p1}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1368
    new-instance v0, Ljavax/swing/JMenuItem;

    .end local v0    # "item":Ljavax/swing/JMenuItem;
    const-string v1, "Clear Breakpoint"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .restart local v0    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1369
    invoke-virtual {v0, p1}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1370
    new-instance v0, Ljavax/swing/JMenuItem;

    .end local v0    # "item":Ljavax/swing/JMenuItem;
    const-string v1, "Run"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .restart local v0    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1371
    invoke-virtual {v0, p1}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1372
    return-void
.end method


# virtual methods
.method public show(Ljavax/swing/JComponent;II)V
    .locals 0
    .param p1, "comp"    # Ljavax/swing/JComponent;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 1378
    iput p2, p0, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->x:I

    .line 1379
    iput p3, p0, Lorg/mozilla/javascript/tools/debugger/FilePopupMenu;->y:I

    .line 1380
    invoke-super {p0, p1, p2, p3}, Ljavax/swing/JPopupMenu;->show(Ljava/awt/Component;II)V

    .line 1381
    return-void
.end method
