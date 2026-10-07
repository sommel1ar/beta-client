.class public Lorg/mozilla/javascript/ast/DoLoop;
.super Lorg/mozilla/javascript/ast/Loop;
.source "DoLoop.java"


# instance fields
.field private condition:Lorg/mozilla/javascript/ast/AstNode;

.field private whilePosition:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/Loop;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->whilePosition:I

    .line 23
    const/16 v0, 0x76

    iput v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/Loop;-><init>(I)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->whilePosition:I

    .line 23
    const/16 v0, 0x76

    iput v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/Loop;-><init>(II)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->whilePosition:I

    .line 23
    const/16 v0, 0x76

    iput v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->type:I

    .line 35
    return-void
.end method


# virtual methods
.method public getCondition()Lorg/mozilla/javascript/ast/AstNode;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->condition:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getWhilePosition()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->whilePosition:I

    return v0
.end method

.method public setCondition(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "condition"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/DoLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 50
    iput-object p1, p0, Lorg/mozilla/javascript/ast/DoLoop;->condition:Lorg/mozilla/javascript/ast/AstNode;

    .line 51
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 52
    return-void
.end method

.method public setWhilePosition(I)V
    .locals 0
    .param p1, "whilePosition"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/mozilla/javascript/ast/DoLoop;->whilePosition:I

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/DoLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    const-string v1, "do "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    iget-object v1, p0, Lorg/mozilla/javascript/ast/DoLoop;->body:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    const-string v1, " while ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    iget-object v1, p0, Lorg/mozilla/javascript/ast/DoLoop;->condition:Lorg/mozilla/javascript/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    const-string v1, ");\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 85
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->body:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 87
    iget-object v0, p0, Lorg/mozilla/javascript/ast/DoLoop;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 89
    :cond_0
    return-void
.end method
