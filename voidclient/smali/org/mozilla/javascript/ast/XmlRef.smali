.class public abstract Lorg/mozilla/javascript/ast/XmlRef;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "XmlRef.java"


# instance fields
.field protected atPos:I

.field protected colonPos:I

.field protected namespace:Lorg/mozilla/javascript/ast/Name;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 40
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 37
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->atPos:I

    .line 38
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->colonPos:I

    .line 41
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    const/4 v0, -0x1

    .line 44
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 37
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->atPos:I

    .line 38
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->colonPos:I

    .line 45
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    const/4 v0, -0x1

    .line 48
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 37
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->atPos:I

    .line 38
    iput v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->colonPos:I

    .line 49
    return-void
.end method


# virtual methods
.method public getAtPos()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->atPos:I

    return v0
.end method

.method public getColonPos()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->colonPos:I

    return v0
.end method

.method public getNamespace()Lorg/mozilla/javascript/ast/Name;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->namespace:Lorg/mozilla/javascript/ast/Name;

    return-object v0
.end method

.method public isAttributeAccess()Z
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lorg/mozilla/javascript/ast/XmlRef;->atPos:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAtPos(I)V
    .locals 0
    .param p1, "atPos"    # I

    .prologue
    .line 87
    iput p1, p0, Lorg/mozilla/javascript/ast/XmlRef;->atPos:I

    .line 88
    return-void
.end method

.method public setColonPos(I)V
    .locals 0
    .param p1, "colonPos"    # I

    .prologue
    .line 102
    iput p1, p0, Lorg/mozilla/javascript/ast/XmlRef;->colonPos:I

    .line 103
    return-void
.end method

.method public setNamespace(Lorg/mozilla/javascript/ast/Name;)V
    .locals 0
    .param p1, "namespace"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/mozilla/javascript/ast/XmlRef;->namespace:Lorg/mozilla/javascript/ast/Name;

    .line 64
    if-eqz p1, :cond_0

    .line 65
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/Name;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 66
    :cond_0
    return-void
.end method
