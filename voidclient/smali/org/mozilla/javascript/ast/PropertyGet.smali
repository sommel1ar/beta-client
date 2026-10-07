.class public Lorg/mozilla/javascript/ast/PropertyGet;
.super Lorg/mozilla/javascript/ast/InfixExpression;
.source "PropertyGet.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>()V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lorg/mozilla/javascript/ast/PropertyGet;->type:I

    .line 21
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(I)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lorg/mozilla/javascript/ast/PropertyGet;->type:I

    .line 25
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(II)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lorg/mozilla/javascript/ast/PropertyGet;->type:I

    .line 29
    return-void
.end method

.method public constructor <init>(IILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/Name;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "target"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p4, "property"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lorg/mozilla/javascript/ast/PropertyGet;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/Name;)V
    .locals 1
    .param p1, "target"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "property"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lorg/mozilla/javascript/ast/PropertyGet;->type:I

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/Name;I)V
    .locals 1
    .param p1, "target"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "property"    # Lorg/mozilla/javascript/ast/Name;
    .param p3, "dotPosition"    # I

    .prologue
    const/16 v0, 0x21

    .line 44
    invoke-direct {p0, v0, p1, p2, p3}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .line 17
    iput v0, p0, Lorg/mozilla/javascript/ast/PropertyGet;->type:I

    .line 45
    return-void
.end method


# virtual methods
.method public getProperty()Lorg/mozilla/javascript/ast/Name;
    .locals 1

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/PropertyGet;->getRight()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/Name;

    return-object v0
.end method

.method public getTarget()Lorg/mozilla/javascript/ast/AstNode;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/PropertyGet;->getLeft()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method public setProperty(Lorg/mozilla/javascript/ast/Name;)V
    .locals 0
    .param p1, "property"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    .line 77
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/PropertyGet;->setRight(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 78
    return-void
.end method

.method public setTarget(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "target"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/PropertyGet;->setLeft(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 63
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .prologue
    const/4 v2, 0x0

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/PropertyGet;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/PropertyGet;->getLeft()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/PropertyGet;->getRight()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 95
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/PropertyGet;->getTarget()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 97
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/PropertyGet;->getProperty()Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/Name;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 99
    :cond_0
    return-void
.end method
