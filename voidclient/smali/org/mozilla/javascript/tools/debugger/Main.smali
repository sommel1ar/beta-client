.class public Lorg/mozilla/javascript/tools/debugger/Main;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/debugger/Main$IProxy;
    }
.end annotation


# instance fields
.field private debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field private dim:Lorg/mozilla/javascript/tools/debugger/Dim;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-direct {v0}, Lorg/mozilla/javascript/tools/debugger/Dim;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    .line 38
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-direct {v0, v1, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;-><init>(Lorg/mozilla/javascript/tools/debugger/Dim;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 39
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 205
    new-instance v1, Lorg/mozilla/javascript/tools/debugger/Main;

    const-string v2, "Rhino JavaScript Debugger"

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/tools/debugger/Main;-><init>(Ljava/lang/String;)V

    .line 206
    .local v1, "main":Lorg/mozilla/javascript/tools/debugger/Main;
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->doBreak()V

    .line 207
    new-instance v2, Lorg/mozilla/javascript/tools/debugger/Main$IProxy;

    invoke-direct {v2, v4}, Lorg/mozilla/javascript/tools/debugger/Main$IProxy;-><init>(I)V

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/tools/debugger/Main;->setExitAction(Ljava/lang/Runnable;)V

    .line 209
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getIn()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->setIn(Ljava/io/InputStream;)V

    .line 210
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getOut()Ljava/io/PrintStream;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 211
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getErr()Ljava/io/PrintStream;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 213
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    .line 214
    .local v0, "global":Lorg/mozilla/javascript/tools/shell/Global;
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getIn()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/shell/Global;->setIn(Ljava/io/InputStream;)V

    .line 215
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getOut()Ljava/io/PrintStream;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 216
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getErr()Ljava/io/PrintStream;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 218
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/tools/debugger/Main;->attachTo(Lorg/mozilla/javascript/ContextFactory;)V

    .line 221
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/tools/debugger/Main;->setScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 223
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->pack()V

    .line 224
    const/16 v2, 0x258

    const/16 v3, 0x1cc

    invoke-virtual {v1, v2, v3}, Lorg/mozilla/javascript/tools/debugger/Main;->setSize(II)V

    .line 225
    invoke-virtual {v1, v4}, Lorg/mozilla/javascript/tools/debugger/Main;->setVisible(Z)V

    .line 227
    invoke-static {p0}, Lorg/mozilla/javascript/tools/shell/Main;->exec([Ljava/lang/String;)I

    .line 228
    return-void
.end method

.method public static mainEmbedded(Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;
    .locals 3
    .param p0, "title"    # Ljava/lang/String;

    .prologue
    .line 237
    invoke-static {}, Lorg/mozilla/javascript/ContextFactory;->getGlobal()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v0

    .line 238
    .local v0, "factory":Lorg/mozilla/javascript/ContextFactory;
    new-instance v1, Lorg/mozilla/javascript/tools/shell/Global;

    invoke-direct {v1}, Lorg/mozilla/javascript/tools/shell/Global;-><init>()V

    .line 239
    .local v1, "global":Lorg/mozilla/javascript/tools/shell/Global;
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/tools/shell/Global;->init(Lorg/mozilla/javascript/ContextFactory;)V

    .line 240
    invoke-static {v0, v1, p0}, Lorg/mozilla/javascript/tools/debugger/Main;->mainEmbedded(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;

    move-result-object v2

    return-object v2
.end method

.method public static mainEmbedded(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;
    .locals 1
    .param p0, "factory"    # Lorg/mozilla/javascript/ContextFactory;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 251
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/tools/debugger/Main;->mainEmbeddedImpl(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Object;Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;

    move-result-object v0

    return-object v0
.end method

.method public static mainEmbedded(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/tools/debugger/ScopeProvider;Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;
    .locals 1
    .param p0, "factory"    # Lorg/mozilla/javascript/ContextFactory;
    .param p1, "scopeProvider"    # Lorg/mozilla/javascript/tools/debugger/ScopeProvider;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 262
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/tools/debugger/Main;->mainEmbeddedImpl(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Object;Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;

    move-result-object v0

    return-object v0
.end method

.method private static mainEmbeddedImpl(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Object;Ljava/lang/String;)Lorg/mozilla/javascript/tools/debugger/Main;
    .locals 6
    .param p0, "factory"    # Lorg/mozilla/javascript/ContextFactory;
    .param p1, "scopeProvider"    # Ljava/lang/Object;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 271
    if-nez p2, :cond_0

    .line 272
    const-string p2, "Rhino JavaScript Debugger (embedded usage)"

    .line 274
    :cond_0
    new-instance v1, Lorg/mozilla/javascript/tools/debugger/Main;

    invoke-direct {v1, p2}, Lorg/mozilla/javascript/tools/debugger/Main;-><init>(Ljava/lang/String;)V

    .line 275
    .local v1, "main":Lorg/mozilla/javascript/tools/debugger/Main;
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->doBreak()V

    .line 276
    new-instance v3, Lorg/mozilla/javascript/tools/debugger/Main$IProxy;

    invoke-direct {v3, v5}, Lorg/mozilla/javascript/tools/debugger/Main$IProxy;-><init>(I)V

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/tools/debugger/Main;->setExitAction(Ljava/lang/Runnable;)V

    .line 278
    invoke-virtual {v1, p0}, Lorg/mozilla/javascript/tools/debugger/Main;->attachTo(Lorg/mozilla/javascript/ContextFactory;)V

    .line 279
    instance-of v3, p1, Lorg/mozilla/javascript/tools/debugger/ScopeProvider;

    if-eqz v3, :cond_1

    .line 280
    check-cast p1, Lorg/mozilla/javascript/tools/debugger/ScopeProvider;

    .end local p1    # "scopeProvider":Ljava/lang/Object;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/tools/debugger/Main;->setScopeProvider(Lorg/mozilla/javascript/tools/debugger/ScopeProvider;)V

    .line 292
    :goto_0
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->pack()V

    .line 293
    const/16 v3, 0x258

    const/16 v4, 0x1cc

    invoke-virtual {v1, v3, v4}, Lorg/mozilla/javascript/tools/debugger/Main;->setSize(II)V

    .line 294
    invoke-virtual {v1, v5}, Lorg/mozilla/javascript/tools/debugger/Main;->setVisible(Z)V

    .line 295
    return-object v1

    .restart local p1    # "scopeProvider":Ljava/lang/Object;
    :cond_1
    move-object v2, p1

    .line 282
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .line 283
    .local v2, "scope":Lorg/mozilla/javascript/Scriptable;
    instance-of v3, v2, Lorg/mozilla/javascript/tools/shell/Global;

    if-eqz v3, :cond_2

    move-object v0, v2

    .line 284
    check-cast v0, Lorg/mozilla/javascript/tools/shell/Global;

    .line 285
    .local v0, "global":Lorg/mozilla/javascript/tools/shell/Global;
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getIn()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/tools/shell/Global;->setIn(Ljava/io/InputStream;)V

    .line 286
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getOut()Ljava/io/PrintStream;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 287
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/Main;->getErr()Ljava/io/PrintStream;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 289
    .end local v0    # "global":Lorg/mozilla/javascript/tools/shell/Global;
    :cond_2
    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/tools/debugger/Main;->setScope(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_0
.end method


# virtual methods
.method public attachTo(Lorg/mozilla/javascript/ContextFactory;)V
    .locals 1
    .param p1, "factory"    # Lorg/mozilla/javascript/ContextFactory;

    .prologue
    .line 190
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->attachTo(Lorg/mozilla/javascript/ContextFactory;)V

    .line 191
    return-void
.end method

.method public clearAllBreakpoints()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim;->clearAllBreakpoints()V

    .line 84
    return-void
.end method

.method public contextCreated(Lorg/mozilla/javascript/Context;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 340
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public contextEntered(Lorg/mozilla/javascript/Context;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 322
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public contextExited(Lorg/mozilla/javascript/Context;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 331
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public contextReleased(Lorg/mozilla/javascript/Context;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 350
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public detach()V
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim;->detach()V

    .line 198
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 180
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/Main;->clearAllBreakpoints()V

    .line 181
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim;->go()V

    .line 182
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->dispose()V

    .line 183
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    .line 184
    return-void
.end method

.method public doBreak()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreak()V

    .line 53
    return-void
.end method

.method public getDebugFrame()Ljavax/swing/JFrame;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    return-object v0
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getConsole()Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->getErr()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getConsole()Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->getIn()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getConsole()Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/JSInternalConsole;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public go()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim;->go()V

    .line 91
    return-void
.end method

.method public isVisible()Z
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->isVisible()Z

    move-result v0

    return v0
.end method

.method public pack()V
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->pack()V

    .line 153
    return-void
.end method

.method public setBreakOnEnter(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 67
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreakOnEnter(Z)V

    .line 68
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getMenubar()Lorg/mozilla/javascript/tools/debugger/Menubar;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Menubar;->getBreakOnEnter()Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 69
    return-void
.end method

.method public setBreakOnExceptions(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 59
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreakOnExceptions(Z)V

    .line 60
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getMenubar()Lorg/mozilla/javascript/tools/debugger/Menubar;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Menubar;->getBreakOnExceptions()Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 61
    return-void
.end method

.method public setBreakOnReturn(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 75
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->setBreakOnReturn(Z)V

    .line 76
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getMenubar()Lorg/mozilla/javascript/tools/debugger/Menubar;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Menubar;->getBreakOnReturn()Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 77
    return-void
.end method

.method public setExitAction(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 121
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setExitAction(Ljava/lang/Runnable;)V

    .line 122
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0
    .param p1, "level"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 314
    return-void
.end method

.method public setScope(Lorg/mozilla/javascript/Scriptable;)V
    .locals 1
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 97
    invoke-static {p1}, Lorg/mozilla/javascript/tools/debugger/Main$IProxy;->newScopeProvider(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/tools/debugger/ScopeProvider;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/Main;->setScopeProvider(Lorg/mozilla/javascript/tools/debugger/ScopeProvider;)V

    .line 98
    return-void
.end method

.method public setScopeProvider(Lorg/mozilla/javascript/tools/debugger/ScopeProvider;)V
    .locals 1
    .param p1, "p"    # Lorg/mozilla/javascript/tools/debugger/ScopeProvider;

    .prologue
    .line 105
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->setScopeProvider(Lorg/mozilla/javascript/tools/debugger/ScopeProvider;)V

    .line 106
    return-void
.end method

.method public setSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 159
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setSize(II)V

    .line 160
    return-void
.end method

.method public setSize(Ljava/awt/Dimension;)V
    .locals 3
    .param p1, "dimension"    # Ljava/awt/Dimension;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 305
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iget v1, p1, Ljava/awt/Dimension;->width:I

    iget v2, p1, Ljava/awt/Dimension;->height:I

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setSize(II)V

    .line 306
    return-void
.end method

.method public setSourceProvider(Lorg/mozilla/javascript/tools/debugger/SourceProvider;)V
    .locals 1
    .param p1, "sourceProvider"    # Lorg/mozilla/javascript/tools/debugger/SourceProvider;

    .prologue
    .line 113
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->dim:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim;->setSourceProvider(Lorg/mozilla/javascript/tools/debugger/SourceProvider;)V

    .line 114
    return-void
.end method

.method public setVisible(Z)V
    .locals 1
    .param p1, "flag"    # Z

    .prologue
    .line 166
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Main;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->setVisible(Z)V

    .line 167
    return-void
.end method
