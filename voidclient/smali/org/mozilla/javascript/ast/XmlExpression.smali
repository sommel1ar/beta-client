.class public Lorg/mozilla/javascript/ast/XmlExpression;
.super Lorg/mozilla/javascript/ast/XmlFragment;
.source "XmlExpression.java"


# instance fields
.field private expression:Lorg/mozilla/javascript/ast/AstNode;

.field private isXmlAttribute:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/XmlFragment;-><init>()V

    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/XmlFragment;-><init>(I)V

    .line 26
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/XmlFragment;-><init>(II)V

    .line 30
    return-void
.end method

.method public constructor <init>(ILorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "expr"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/XmlFragment;-><init>(I)V

    .line 34
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/ast/XmlExpression;->setExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 35
    return-void
.end method


# virtual methods
.method public getExpression()Lorg/mozilla/javascript/ast/AstNode;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlExpression;->expression:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public isXmlAttribute()Z
    .locals 1

    .prologue
    .line 58
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/XmlExpression;->isXmlAttribute:Z

    return v0
.end method

.method public setExpression(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 50
    iput-object p1, p0, Lorg/mozilla/javascript/ast/XmlExpression;->expression:Lorg/mozilla/javascript/ast/AstNode;

    .line 51
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 52
    return-void
.end method

.method public setIsXmlAttribute(Z)V
    .locals 0
    .param p1, "isXmlAttribute"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lorg/mozilla/javascript/ast/XmlExpression;->isXmlAttribute:Z

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/ast/XmlExpression;->expression:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 78
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlExpression;->expression:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 81
    :cond_0
    return-void
.end method
