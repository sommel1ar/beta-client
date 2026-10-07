.class public Lorg/mozilla/javascript/ast/SwitchCase;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "SwitchCase.java"


# instance fields
.field private expression:Lorg/mozilla/javascript/ast/AstNode;

.field private statements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 36
    const/16 v0, 0x73

    iput v0, p0, Lorg/mozilla/javascript/ast/SwitchCase;->type:I

    .line 40
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 36
    const/16 v0, 0x73

    iput v0, p0, Lorg/mozilla/javascript/ast/SwitchCase;->type:I

    .line 44
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 36
    const/16 v0, 0x73

    iput v0, p0, Lorg/mozilla/javascript/ast/SwitchCase;->type:I

    .line 48
    return-void
.end method


# virtual methods
.method public addStatement(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 3
    .param p1, "statement"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/SwitchCase;->assertNotNull(Ljava/lang/Object;)V

    .line 109
    iget-object v1, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    if-nez v1, :cond_0

    .line 110
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    .line 112
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v1

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v2

    add-int v0, v1, v2

    .line 113
    .local v0, "end":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/SwitchCase;->getPosition()I

    move-result v1

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/SwitchCase;->setLength(I)V

    .line 114
    iget-object v1, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 116
    return-void
.end method

.method public getExpression()Lorg/mozilla/javascript/ast/AstNode;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getStatements()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    return-object v0
.end method

.method public isDefault()Z
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setExpression(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    .line 66
    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 68
    :cond_0
    return-void
.end method

.method public setStatements(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, "statements":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    iget-object v2, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 91
    iget-object v2, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 93
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 94
    .local v1, "s":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/SwitchCase;->addStatement(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_0

    .line 96
    .end local v1    # "s":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 5
    .param p1, "depth"    # I

    .prologue
    .line 120
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/SwitchCase;->makeIndent(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    iget-object v3, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    if-nez v3, :cond_0

    .line 123
    const-string v3, "default:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :goto_0
    iget-object v3, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    if-eqz v3, :cond_1

    .line 130
    iget-object v3, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 131
    .local v1, "s":Lorg/mozilla/javascript/ast/AstNode;
    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 125
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "s":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    const-string v3, "case "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    iget-object v3, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    const-string v3, ":\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 134
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 143
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 144
    iget-object v2, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    if-eqz v2, :cond_0

    .line 145
    iget-object v2, p0, Lorg/mozilla/javascript/ast/SwitchCase;->expression:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 147
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    if-eqz v2, :cond_1

    .line 148
    iget-object v2, p0, Lorg/mozilla/javascript/ast/SwitchCase;->statements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 149
    .local v1, "s":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_0

    .line 153
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "s":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    return-void
.end method
