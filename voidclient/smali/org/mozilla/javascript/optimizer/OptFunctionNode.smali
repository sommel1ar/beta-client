.class public final Lorg/mozilla/javascript/optimizer/OptFunctionNode;
.super Ljava/lang/Object;
.source "OptFunctionNode.java"


# instance fields
.field private directTargetIndex:I

.field public final fnode:Lorg/mozilla/javascript/ast/FunctionNode;

.field itsContainsCalls0:Z

.field itsContainsCalls1:Z

.field private itsParameterNumberContext:Z

.field private numberVarFlags:[Z


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/ast/FunctionNode;)V
    .locals 1
    .param p1, "fnode"    # Lorg/mozilla/javascript/ast/FunctionNode;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->directTargetIndex:I

    .line 16
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    .line 17
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/FunctionNode;->setCompilerData(Ljava/lang/Object;)V

    .line 18
    return-void
.end method

.method public static get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .locals 1
    .param p0, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 28
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ScriptNode;->getCompilerData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    return-object v0
.end method

.method public static get(Lorg/mozilla/javascript/ast/ScriptNode;I)Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .locals 2
    .param p0, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p1, "i"    # I

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v0

    .line 23
    .local v0, "fnode":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getCompilerData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    return-object v1
.end method


# virtual methods
.method public getDirectTargetIndex()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->directTargetIndex:I

    return v0
.end method

.method public getParameterNumberContext()Z
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->itsParameterNumberContext:Z

    return v0
.end method

.method public getVarCount()I
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarCount()I

    move-result v0

    return v0
.end method

.method public getVarIndex(Lorg/mozilla/javascript/Node;)I
    .locals 5
    .param p1, "n"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v4, 0x7

    const/4 v3, -0x1

    .line 92
    invoke-virtual {p1, v4, v3}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v0

    .line 93
    .local v0, "index":I
    if-ne v0, v3, :cond_4

    .line 95
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    .line 96
    .local v2, "type":I
    const/16 v3, 0x37

    if-ne v2, v3, :cond_0

    .line 97
    move-object v1, p1

    .line 104
    .local v1, "node":Lorg/mozilla/javascript/Node;
    :goto_0
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v0

    .line 105
    if-gez v0, :cond_3

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 98
    .end local v1    # "node":Lorg/mozilla/javascript/Node;
    :cond_0
    const/16 v3, 0x38

    if-eq v2, v3, :cond_1

    const/16 v3, 0x9c

    if-ne v2, v3, :cond_2

    .line 100
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    .restart local v1    # "node":Lorg/mozilla/javascript/Node;
    goto :goto_0

    .line 102
    .end local v1    # "node":Lorg/mozilla/javascript/Node;
    :cond_2
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 106
    .restart local v1    # "node":Lorg/mozilla/javascript/Node;
    :cond_3
    invoke-virtual {p1, v4, v0}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 108
    .end local v1    # "node":Lorg/mozilla/javascript/Node;
    .end local v2    # "type":I
    :cond_4
    return v0
.end method

.method public isNumberVar(I)Z
    .locals 1
    .param p1, "varIndex"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v0

    sub-int/2addr p1, v0

    .line 72
    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->numberVarFlags:[Z

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->numberVarFlags:[Z

    aget-boolean v0, v0, p1

    .line 75
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isParameter(I)Z
    .locals 1
    .param p1, "varIndex"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isTargetOfDirectCall()Z
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->directTargetIndex:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setDirectTargetIndex(I)V
    .locals 1
    .param p1, "directTargetIndex"    # I

    .prologue
    .line 44
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->directTargetIndex:I

    if-ltz v0, :cond_1

    .line 45
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 46
    :cond_1
    iput p1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->directTargetIndex:I

    .line 47
    return-void
.end method

.method setIsNumberVar(I)V
    .locals 3
    .param p1, "varIndex"    # I

    .prologue
    .line 80
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v1

    sub-int/2addr p1, v1

    .line 82
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 83
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->numberVarFlags:[Z

    if-nez v1, :cond_1

    .line 84
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarCount()I

    move-result v1

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v2

    sub-int v0, v1, v2

    .line 85
    .local v0, "size":I
    new-array v1, v0, [Z

    iput-object v1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->numberVarFlags:[Z

    .line 87
    .end local v0    # "size":I
    :cond_1
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->numberVarFlags:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, p1

    .line 88
    return-void
.end method

.method setParameterNumberContext(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->itsParameterNumberContext:Z

    .line 52
    return-void
.end method
