.class public Lorg/mozilla/javascript/ast/RegExpLiteral;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "RegExpLiteral.java"


# instance fields
.field private flags:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 21
    const/16 v0, 0x30

    iput v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->type:I

    .line 25
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 21
    const/16 v0, 0x30

    iput v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->type:I

    .line 29
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 21
    const/16 v0, 0x30

    iput v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->type:I

    .line 33
    return-void
.end method


# virtual methods
.method public getFlags()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->flags:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setFlags(Ljava/lang/String;)V
    .locals 0
    .param p1, "flags"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->flags:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/RegExpLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 48
    iput-object p1, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->value:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .prologue
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/RegExpLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->flags:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/ast/RegExpLiteral;->flags:Ljava/lang/String;

    goto :goto_0
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 76
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    .line 77
    return-void
.end method
