.class public Lorg/mozilla/javascript/ast/XmlLiteral;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "XmlLiteral.java"


# instance fields
.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/XmlFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    .line 26
    const/16 v0, 0x91

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    .line 26
    const/16 v0, 0x91

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    .line 26
    const/16 v0, 0x91

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->type:I

    .line 38
    return-void
.end method


# virtual methods
.method public addFragment(Lorg/mozilla/javascript/ast/XmlFragment;)V
    .locals 1
    .param p1, "fragment"    # Lorg/mozilla/javascript/ast/XmlFragment;

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 66
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/XmlFragment;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 68
    return-void
.end method

.method public getFragments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/XmlFragment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    return-object v0
.end method

.method public setFragments(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/XmlFragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "fragments":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/XmlFragment;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 55
    iget-object v2, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 56
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/XmlFragment;

    .line 57
    .local v0, "fragment":Lorg/mozilla/javascript/ast/XmlFragment;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/XmlLiteral;->addFragment(Lorg/mozilla/javascript/ast/XmlFragment;)V

    goto :goto_0

    .line 58
    .end local v0    # "fragment":Lorg/mozilla/javascript/ast/XmlFragment;
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .prologue
    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0xfa

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 73
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/XmlFragment;

    .line 74
    .local v0, "frag":Lorg/mozilla/javascript/ast/XmlFragment;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/XmlFragment;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 76
    .end local v0    # "frag":Lorg/mozilla/javascript/ast/XmlFragment;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 84
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 85
    iget-object v2, p0, Lorg/mozilla/javascript/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/XmlFragment;

    .line 86
    .local v0, "frag":Lorg/mozilla/javascript/ast/XmlFragment;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/XmlFragment;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_0

    .line 89
    .end local v0    # "frag":Lorg/mozilla/javascript/ast/XmlFragment;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method
