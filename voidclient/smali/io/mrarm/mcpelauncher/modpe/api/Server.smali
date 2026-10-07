.class public Lio/mrarm/mcpelauncher/modpe/api/Server;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Server.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static getAddress()Ljava/lang/String;
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 10
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Server;->nativeGetAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAllPlayerNames()[Ljava/lang/String;
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 25
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Server;->nativeGetAllPlayerNames()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAllPlayers()[J
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 20
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Server;->nativeGetAllPlayers()[J

    move-result-object v0

    return-object v0
.end method

.method public static getPort()I
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 15
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Server;->nativeGetPort()I

    move-result v0

    return v0
.end method

.method private static native nativeGetAddress()Ljava/lang/String;
.end method

.method private static native nativeGetAllPlayerNames()[Ljava/lang/String;
.end method

.method private static native nativeGetAllPlayers()[J
.end method

.method private static native nativeGetPort()I
.end method

.method private static native nativeSendChat(Ljava/lang/String;)V
.end method

.method public static sendChat(Ljava/lang/String;)V
    .locals 0
    .param p0, "text"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 30
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Server;->nativeSendChat(Ljava/lang/String;)V

    .line 31
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string v0, "Server"

    return-object v0
.end method
