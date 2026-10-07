.class public Lorg/mozilla/javascript/ast/XmlMemberGet;
.super Lorg/mozilla/javascript/ast/InfixExpression;
.source "XmlMemberGet.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>()V

    .line 22
    const/16 v0, 0x8f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlMemberGet;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(I)V

    .line 22
    const/16 v0, 0x8f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlMemberGet;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(II)V

    .line 22
    const/16 v0, 0x8f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlMemberGet;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(IILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/XmlRef;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "target"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p4, "ref"    # Lorg/mozilla/javascript/ast/XmlRef;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 22
    const/16 v0, 0x8f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlMemberGet;->type:I

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/XmlRef;)V
    .locals 1
    .param p1, "target"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "ref"    # Lorg/mozilla/javascript/ast/XmlRef;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 22
    const/16 v0, 0x8f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlMemberGet;->type:I

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/XmlRef;I)V
    .locals 1
    .param p1, "target"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "ref"    # Lorg/mozilla/javascript/ast/XmlRef;
    .param p3, "opPos"    # I

    .prologue
    const/16 v0, 0x8f

    .line 49
    invoke-direct {p0, v0, p1, p2, p3}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .line 22
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlMemberGet;->type:I

    .line 50
    return-void
.end method


# virtual methods
.method public getMemberRef()Lorg/mozilla/javascript/ast/XmlRef;
    .locals 1

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/XmlMemberGet;->getRight()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/XmlRef;

    return-object v0
.end method

.method public getTarget()Lorg/mozilla/javascript/ast/AstNode;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/XmlMemberGet;->getLeft()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method public setProperty(Lorg/mozilla/javascript/ast/XmlRef;)V
    .locals 0
    .param p1, "ref"    # Lorg/mozilla/javascript/ast/XmlRef;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlMemberGet;->setRight(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 83
    return-void
.end method

.method public setTarget(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "target"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlMemberGet;->setLeft(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .prologue
    const/4 v2, 0x0

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlMemberGet;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/XmlMemberGet;->getLeft()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/XmlMemberGet;->getType()I

    move-result v1

    invoke-static {v1}, Lorg/mozilla/javascript/ast/XmlMemberGet;->operatorToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/XmlMemberGet;->getRight()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
