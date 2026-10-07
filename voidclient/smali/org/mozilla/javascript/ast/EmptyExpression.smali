.class public Lorg/mozilla/javascript/ast/EmptyExpression;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "EmptyExpression.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 19
    const/16 v0, 0x80

    iput v0, p0, Lorg/mozilla/javascript/ast/EmptyExpression;->type:I

    .line 23
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 19
    const/16 v0, 0x80

    iput v0, p0, Lorg/mozilla/javascript/ast/EmptyExpression;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 19
    const/16 v0, 0x80

    iput v0, p0, Lorg/mozilla/javascript/ast/EmptyExpression;->type:I

    .line 31
    return-void
.end method


# virtual methods
.method public toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "depth"    # I

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/EmptyExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 43
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    .line 44
    return-void
.end method
