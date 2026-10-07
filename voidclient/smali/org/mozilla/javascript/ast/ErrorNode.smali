.class public Lorg/mozilla/javascript/ast/ErrorNode;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "ErrorNode.java"


# instance fields
.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/ErrorNode;->type:I

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/ErrorNode;->type:I

    .line 28
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/ErrorNode;->type:I

    .line 32
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ErrorNode;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/mozilla/javascript/ast/ErrorNode;->message:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "depth"    # I

    .prologue
    .line 50
    const-string v0, ""

    return-object v0
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 59
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    .line 60
    return-void
.end method
