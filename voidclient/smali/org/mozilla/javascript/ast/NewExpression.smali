.class public Lorg/mozilla/javascript/ast/NewExpression;
.super Lorg/mozilla/javascript/ast/FunctionCall;
.source "NewExpression.java"


# instance fields
.field private initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/FunctionCall;-><init>()V

    .line 27
    const/16 v0, 0x1e

    iput v0, p0, Lorg/mozilla/javascript/ast/NewExpression;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/FunctionCall;-><init>(I)V

    .line 27
    const/16 v0, 0x1e

    iput v0, p0, Lorg/mozilla/javascript/ast/NewExpression;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/FunctionCall;-><init>(II)V

    .line 27
    const/16 v0, 0x1e

    iput v0, p0, Lorg/mozilla/javascript/ast/NewExpression;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public getInitializer()Lorg/mozilla/javascript/ast/ObjectLiteral;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/mozilla/javascript/ast/NewExpression;->initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;

    return-object v0
.end method

.method public setInitializer(Lorg/mozilla/javascript/ast/ObjectLiteral;)V
    .locals 0
    .param p1, "initializer"    # Lorg/mozilla/javascript/ast/ObjectLiteral;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/mozilla/javascript/ast/NewExpression;->initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;

    .line 61
    if-eqz p1, :cond_0

    .line 62
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/ObjectLiteral;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 63
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .prologue
    const/4 v2, 0x0

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/NewExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    const-string v1, "new "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    iget-object v1, p0, Lorg/mozilla/javascript/ast/NewExpression;->target:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    iget-object v1, p0, Lorg/mozilla/javascript/ast/NewExpression;->arguments:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 73
    iget-object v1, p0, Lorg/mozilla/javascript/ast/NewExpression;->arguments:Ljava/util/List;

    invoke-virtual {p0, v1, v0}, Lorg/mozilla/javascript/ast/NewExpression;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 75
    :cond_0
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    iget-object v1, p0, Lorg/mozilla/javascript/ast/NewExpression;->initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;

    if-eqz v1, :cond_1

    .line 77
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    iget-object v1, p0, Lorg/mozilla/javascript/ast/NewExpression;->initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/ObjectLiteral;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 89
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 90
    iget-object v2, p0, Lorg/mozilla/javascript/ast/NewExpression;->target:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 91
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/NewExpression;->getArguments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/AstNode;

    .line 92
    .local v0, "arg":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_0

    .line 94
    .end local v0    # "arg":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/ast/NewExpression;->initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;

    if-eqz v2, :cond_1

    .line 95
    iget-object v2, p0, Lorg/mozilla/javascript/ast/NewExpression;->initializer:Lorg/mozilla/javascript/ast/ObjectLiteral;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/ObjectLiteral;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 98
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method
