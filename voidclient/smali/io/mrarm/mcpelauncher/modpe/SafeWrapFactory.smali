.class public Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;
.super Lorg/mozilla/javascript/WrapFactory;
.source "SafeWrapFactory.java"


# static fields
.field public static instance:Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;->instance:Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/mozilla/javascript/WrapFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public isBanned(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 15
    .local p1, "javaClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    return v0
.end method

.method public wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/mozilla/javascript/Scriptable;"
        }
    .end annotation

    .prologue
    .line 27
    .local p4, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p4}, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;->isBanned(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/UnsafeClassException;

    invoke-virtual {p4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/modpe/UnsafeClassException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/WrapFactory;->wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public wrapJavaClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/mozilla/javascript/Scriptable;"
        }
    .end annotation

    .prologue
    .line 20
    .local p3, "javaClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p3}, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;->isBanned(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 21
    new-instance v0, Lio/mrarm/mcpelauncher/modpe/UnsafeClassException;

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/modpe/UnsafeClassException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/WrapFactory;->wrapJavaClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method
