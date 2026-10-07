.class public Lorg/mozilla/javascript/ast/Assignment;
.super Lorg/mozilla/javascript/ast/InfixExpression;
.source "Assignment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(I)V

    .line 20
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(II)V

    .line 24
    return-void
.end method

.method public constructor <init>(IILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "left"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p4, "right"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 28
    return-void
.end method

.method public constructor <init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V
    .locals 0
    .param p1, "operator"    # I
    .param p2, "left"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p3, "right"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p4, "operatorPos"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 0
    .param p1, "left"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "right"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 32
    return-void
.end method
