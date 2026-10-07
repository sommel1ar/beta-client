.class Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;
.super Ljava/awt/event/KeyAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/tools/debugger/MoreWindows;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/MoreWindows;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/debugger/MoreWindows;)V
    .locals 0

    .prologue
    .line 1672
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;->this$0:Lorg/mozilla/javascript/tools/debugger/MoreWindows;

    invoke-direct {p0}, Ljava/awt/event/KeyAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 3
    .param p1, "ke"    # Ljava/awt/event/KeyEvent;

    .prologue
    .line 1675
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v0

    .line 1676
    .local v0, "code":I
    const/16 v1, 0x1b

    if-ne v0, v1, :cond_0

    .line 1677
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1678
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;->this$0:Lorg/mozilla/javascript/tools/debugger/MoreWindows;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->access$102(Lorg/mozilla/javascript/tools/debugger/MoreWindows;Ljava/lang/String;)Ljava/lang/String;

    .line 1679
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MoreWindows$1;->this$0:Lorg/mozilla/javascript/tools/debugger/MoreWindows;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1681
    :cond_0
    return-void
.end method
