.class public Lorg/mozilla/javascript/commonjs/module/ModuleScope;
.super Lorg/mozilla/javascript/TopLevel;
.source "ModuleScope.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final base:Ljava/net/URI;

.field private final uri:Ljava/net/URI;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/net/URI;Ljava/net/URI;)V
    .locals 0
    .param p1, "prototype"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "uri"    # Ljava/net/URI;
    .param p3, "base"    # Ljava/net/URI;

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/mozilla/javascript/TopLevel;-><init>()V

    .line 25
    iput-object p2, p0, Lorg/mozilla/javascript/commonjs/module/ModuleScope;->uri:Ljava/net/URI;

    .line 26
    iput-object p3, p0, Lorg/mozilla/javascript/commonjs/module/ModuleScope;->base:Ljava/net/URI;

    .line 27
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/commonjs/module/ModuleScope;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 28
    invoke-virtual {p0}, Lorg/mozilla/javascript/commonjs/module/ModuleScope;->cacheBuiltins()V

    .line 29
    return-void
.end method


# virtual methods
.method public getBase()Ljava/net/URI;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/ModuleScope;->base:Ljava/net/URI;

    return-object v0
.end method

.method public getUri()Ljava/net/URI;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/ModuleScope;->uri:Ljava/net/URI;

    return-object v0
.end method
