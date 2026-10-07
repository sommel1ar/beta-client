.class public Lorg/mozilla/javascript/ast/ArrayLiteral;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "ArrayLiteral.java"

# interfaces
.implements Lorg/mozilla/javascript/ast/DestructuringForm;


# static fields
.field private static final NO_ELEMS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private destructuringLength:I

.field private elements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field

.field private isDestructuring:Z

.field private skipCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ast/ArrayLiteral;->NO_ELEMS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 44
    const/16 v0, 0x41

    iput v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->type:I

    .line 48
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 44
    const/16 v0, 0x41

    iput v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->type:I

    .line 52
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 44
    const/16 v0, 0x41

    iput v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->type:I

    .line 56
    return-void
.end method


# virtual methods
.method public addElement(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 1
    .param p1, "element"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/ArrayLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 91
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    .line 93
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 95
    return-void
.end method

.method public getDestructuringLength()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->destructuringLength:I

    return v0
.end method

.method public getElement(I)Lorg/mozilla/javascript/ast/AstNode;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 112
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-nez v0, :cond_0

    .line 113
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "no elements"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getElements()Ljava/util/List;
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
    .line 65
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/mozilla/javascript/ast/ArrayLiteral;->NO_ELEMS:Ljava/util/List;

    goto :goto_0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getSkipCount()I
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->skipCount:I

    return v0
.end method

.method public isDestructuring()Z
    .locals 1

    .prologue
    .line 166
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->isDestructuring:Z

    return v0
.end method

.method public setDestructuringLength(I)V
    .locals 0
    .param p1, "destructuringLength"    # I

    .prologue
    .line 132
    iput p1, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->destructuringLength:I

    .line 133
    return-void
.end method

.method public setElements(Ljava/util/List;)V
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
    .line 73
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    if-nez p1, :cond_1

    .line 74
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    .line 81
    :cond_0
    return-void

    .line 76
    :cond_1
    iget-object v2, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v2, :cond_2

    .line 77
    iget-object v2, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 78
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/AstNode;

    .line 79
    .local v0, "e":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/ArrayLiteral;->addElement(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_0
.end method

.method public setIsDestructuring(Z)V
    .locals 0
    .param p1, "destructuring"    # Z

    .prologue
    .line 157
    iput-boolean p1, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->isDestructuring:Z

    .line 158
    return-void
.end method

.method public setSkipCount(I)V
    .locals 0
    .param p1, "count"    # I

    .prologue
    .line 148
    iput p1, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->skipCount:I

    .line 149
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .prologue
    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/ArrayLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    iget-object v1, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 175
    iget-object v1, p0, Lorg/mozilla/javascript/ast/ArrayLiteral;->elements:Ljava/util/List;

    invoke-virtual {p0, v1, v0}, Lorg/mozilla/javascript/ast/ArrayLiteral;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 177
    :cond_0
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 188
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 189
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ArrayLiteral;->getElements()Ljava/util/List;

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

    .line 190
    .local v0, "e":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_0

    .line 193
    .end local v0    # "e":Lorg/mozilla/javascript/ast/AstNode;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method
