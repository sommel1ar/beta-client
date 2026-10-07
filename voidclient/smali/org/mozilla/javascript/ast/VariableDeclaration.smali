.class public Lorg/mozilla/javascript/ast/VariableDeclaration;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "VariableDeclaration.java"


# instance fields
.field private isStatement:Z

.field private variables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/VariableInitializer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    .line 33
    const/16 v0, 0x7a

    iput v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    .line 33
    const/16 v0, 0x7a

    iput v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    .line 41
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    .line 33
    const/16 v0, 0x7a

    iput v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    .line 45
    return-void
.end method

.method private declTypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    invoke-static {v0}, Lorg/mozilla/javascript/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addVariable(Lorg/mozilla/javascript/ast/VariableInitializer;)V
    .locals 1
    .param p1, "v"    # Lorg/mozilla/javascript/ast/VariableInitializer;

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/VariableDeclaration;->assertNotNull(Ljava/lang/Object;)V

    .line 73
    iget-object v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/VariableInitializer;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 75
    return-void
.end method

.method public getVariables()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/VariableInitializer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    return-object v0
.end method

.method public isConst()Z
    .locals 2

    .prologue
    .line 103
    iget v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    const/16 v1, 0x9a

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLet()Z
    .locals 2

    .prologue
    .line 110
    iget v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    const/16 v1, 0x99

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isStatement()Z
    .locals 1

    .prologue
    .line 117
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->isStatement:Z

    return v0
.end method

.method public isVar()Z
    .locals 2

    .prologue
    .line 96
    iget v0, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->type:I

    const/16 v1, 0x7a

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setIsStatement(Z)V
    .locals 0
    .param p1, "isStatement"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->isStatement:Z

    .line 125
    return-void
.end method

.method public setType(I)Lorg/mozilla/javascript/Node;
    .locals 3
    .param p1, "type"    # I

    .prologue
    .line 83
    const/16 v0, 0x7a

    if-eq p1, v0, :cond_0

    const/16 v0, 0x9a

    if-eq p1, v0, :cond_0

    const/16 v0, 0x99

    if-eq p1, v0, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid decl type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;->setType(I)Lorg/mozilla/javascript/Node;

    move-result-object v0

    return-object v0
.end method

.method public setVariables(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/VariableInitializer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "variables":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/VariableInitializer;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/VariableDeclaration;->assertNotNull(Ljava/lang/Object;)V

    .line 60
    iget-object v2, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 61
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/VariableInitializer;

    .line 62
    .local v1, "vi":Lorg/mozilla/javascript/ast/VariableInitializer;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/VariableDeclaration;->addVariable(Lorg/mozilla/javascript/ast/VariableInitializer;)V

    goto :goto_0

    .line 64
    .end local v1    # "vi":Lorg/mozilla/javascript/ast/VariableInitializer;
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .prologue
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/VariableDeclaration;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/VariableDeclaration;->declTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    iget-object v1, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-virtual {p0, v1, v0}, Lorg/mozilla/javascript/ast/VariableDeclaration;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 138
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/VariableDeclaration;->isStatement()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 139
    const-string v1, ";\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 149
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 150
    iget-object v2, p0, Lorg/mozilla/javascript/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 151
    .local v1, "var":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_0

    .line 154
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "var":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    return-void
.end method
