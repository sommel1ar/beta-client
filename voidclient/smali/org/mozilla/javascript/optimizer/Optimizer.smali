.class Lorg/mozilla/javascript/optimizer/Optimizer;
.super Ljava/lang/Object;
.source "Optimizer.java"


# static fields
.field static final AnyType:I = 0x3

.field static final NoType:I = 0x0

.field static final NumberType:I = 0x1


# instance fields
.field private inDirectCallFunction:Z

.field private parameterUsedInNumberContext:Z

.field theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildStatementList_r(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ObjArray;)V
    .locals 3
    .param p0, "node"    # Lorg/mozilla/javascript/Node;
    .param p1, "statements"    # Lorg/mozilla/javascript/ObjArray;

    .prologue
    .line 458
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    .line 459
    .local v1, "type":I
    const/16 v2, 0x81

    if-eq v1, v2, :cond_0

    const/16 v2, 0x8d

    if-eq v1, v2, :cond_0

    const/16 v2, 0x84

    if-eq v1, v2, :cond_0

    const/16 v2, 0x6d

    if-ne v1, v2, :cond_1

    .line 464
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 465
    .local v0, "child":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v0, :cond_2

    .line 466
    invoke-static {v0, p1}, Lorg/mozilla/javascript/optimizer/Optimizer;->buildStatementList_r(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ObjArray;)V

    .line 467
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    goto :goto_0

    .line 470
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    :cond_1
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 472
    :cond_2
    return-void
.end method

.method private convertParameter(Lorg/mozilla/javascript/Node;)Z
    .locals 3
    .param p1, "n"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 106
    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->inDirectCallFunction:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    const/16 v2, 0x37

    if-ne v1, v2, :cond_0

    .line 107
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v0

    .line 108
    .local v0, "varIndex":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/Node;->removeProp(I)V

    .line 110
    const/4 v1, 0x1

    .line 113
    .end local v0    # "varIndex":I
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private markDCPNumberContext(Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "n"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 96
    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->inDirectCallFunction:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    const/16 v2, 0x37

    if-ne v1, v2, :cond_0

    .line 97
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v0

    .line 98
    .local v0, "varIndex":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->parameterUsedInNumberContext:Z

    .line 102
    .end local v0    # "varIndex":I
    :cond_0
    return-void
.end method

.method private optimizeFunction(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V
    .locals 7
    .param p1, "theFunction"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .prologue
    .line 33
    iget-object v6, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 60
    :cond_0
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v6

    iput-boolean v6, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->inDirectCallFunction:Z

    .line 36
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .line 38
    new-instance v3, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v3}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    .line 39
    .local v3, "statementsArray":Lorg/mozilla/javascript/ObjArray;
    iget-object v6, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-static {v6, v3}, Lorg/mozilla/javascript/optimizer/Optimizer;->buildStatementList_r(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ObjArray;)V

    .line 40
    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v6

    new-array v5, v6, [Lorg/mozilla/javascript/Node;

    .line 41
    .local v5, "theStatementNodes":[Lorg/mozilla/javascript/Node;
    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;)V

    .line 43
    invoke-static {p1, v5}, Lorg/mozilla/javascript/optimizer/Block;->runFlowAnalyzes(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V

    .line 45
    iget-object v6, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v6

    if-nez v6, :cond_0

    .line 53
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->parameterUsedInNumberContext:Z

    .line 54
    move-object v0, v5

    .local v0, "arr$":[Lorg/mozilla/javascript/Node;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_2

    aget-object v4, v0, v1

    .line 55
    .local v4, "theStatementNode":Lorg/mozilla/javascript/Node;
    const/4 v6, 0x1

    invoke-direct {p0, v4, v6}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    .line 54
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 57
    .end local v4    # "theStatementNode":Lorg/mozilla/javascript/Node;
    :cond_2
    iget-boolean v6, p0, Lorg/mozilla/javascript/optimizer/Optimizer;->parameterUsedInNumberContext:Z

    invoke-virtual {p1, v6}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->setParameterNumberContext(Z)V

    goto :goto_0
.end method

.method private rewriteAsObjectChildren(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 4
    .param p1, "n"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 439
    :goto_0
    if-eqz p2, :cond_2

    .line 440
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 441
    .local v0, "nextChild":Lorg/mozilla/javascript/Node;
    const/4 v3, 0x0

    invoke-direct {p0, p2, v3}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v2

    .line 442
    .local v2, "type":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 443
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 444
    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 445
    new-instance v1, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x95

    invoke-direct {v1, v3, p2}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 446
    .local v1, "nuChild":Lorg/mozilla/javascript/Node;
    if-nez v0, :cond_1

    .line 447
    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 452
    .end local v1    # "nuChild":Lorg/mozilla/javascript/Node;
    :cond_0
    :goto_1
    move-object p2, v0

    .line 453
    goto :goto_0

    .line 449
    .restart local v1    # "nuChild":Lorg/mozilla/javascript/Node;
    :cond_1
    invoke-virtual {p1, v1, v0}, Lorg/mozilla/javascript/Node;->addChildBefore(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_1

    .line 454
    .end local v0    # "nextChild":Lorg/mozilla/javascript/Node;
    .end local v1    # "nuChild":Lorg/mozilla/javascript/Node;
    .end local v2    # "type":I
    :cond_2
    return-void
.end method

.method private rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I
    .locals 19
    .param p1, "n"    # Lorg/mozilla/javascript/Node;
    .param p2, "desired"    # I

    .prologue
    .line 118
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v17

    sparse-switch v17, :sswitch_data_0

    .line 430
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteAsObjectChildren(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 431
    const/4 v15, 0x0

    :cond_0
    :goto_0
    return v15

    .line 120
    :sswitch_0
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 121
    .local v6, "child":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v15

    .line 122
    .local v15, "type":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_1

    .line 123
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 124
    :cond_1
    const/4 v15, 0x0

    goto :goto_0

    .line 127
    .end local v6    # "child":Lorg/mozilla/javascript/Node;
    .end local v15    # "type":I
    :sswitch_1
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 128
    const/4 v15, 0x1

    goto :goto_0

    .line 132
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v16

    .line 133
    .local v16, "varIndex":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->inDirectCallFunction:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v17

    if-eqz v17, :cond_2

    const/16 v17, 0x1

    move/from16 v0, p2

    move/from16 v1, v17

    if-ne v0, v1, :cond_2

    .line 137
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 138
    const/4 v15, 0x1

    goto :goto_0

    .line 140
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 141
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 142
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 144
    :cond_3
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 149
    .end local v16    # "varIndex":I
    :sswitch_3
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 150
    .restart local v6    # "child":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v15

    .line 151
    .restart local v15    # "type":I
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v17

    const/16 v18, 0x37

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_5

    .line 152
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_4

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_4

    .line 154
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 155
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 156
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 158
    :cond_4
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 160
    :cond_5
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v17

    const/16 v18, 0x24

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_0

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v17

    const/16 v18, 0x21

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_0

    .line 164
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 168
    .end local v6    # "child":Lorg/mozilla/javascript/Node;
    .end local v15    # "type":I
    :sswitch_4
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 169
    .local v8, "lChild":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    .line 170
    .local v10, "rChild":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v10, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v11

    .line 171
    .local v11, "rType":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v16

    .line 172
    .restart local v16    # "varIndex":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->inDirectCallFunction:Z

    move/from16 v17, v0

    if-eqz v17, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 175
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_7

    .line 176
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_6

    .line 177
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 178
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 180
    :cond_6
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 181
    const/4 v15, 0x0

    goto/16 :goto_0

    :cond_7
    move v15, v11

    .line 184
    goto/16 :goto_0

    .line 186
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Optimizer;->theFunction:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v17

    if-eqz v17, :cond_a

    .line 187
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v11, v0, :cond_9

    .line 188
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 189
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x96

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 192
    :cond_9
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 193
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 194
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 197
    :cond_a
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_b

    .line 198
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_b

    .line 199
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 200
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x95

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 204
    :cond_b
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 211
    .end local v8    # "lChild":Lorg/mozilla/javascript/Node;
    .end local v10    # "rChild":Lorg/mozilla/javascript/Node;
    .end local v11    # "rType":I
    .end local v16    # "varIndex":I
    :sswitch_5
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 212
    .restart local v8    # "lChild":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    .line 213
    .restart local v10    # "rChild":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v9

    .line 214
    .local v9, "lType":I
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v10, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v11

    .line 215
    .restart local v11    # "rType":I
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 216
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 218
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 219
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-eqz v17, :cond_c

    .line 220
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 221
    :cond_c
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_d

    .line 222
    const/16 v17, 0x8

    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 246
    :cond_d
    :goto_1
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 225
    :cond_e
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-eqz v17, :cond_f

    .line 226
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_d

    .line 227
    const/16 v17, 0x8

    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_1

    .line 231
    :cond_f
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_11

    .line 232
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_10

    .line 233
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_1

    .line 236
    :cond_10
    const/16 v17, 0x8

    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_1

    .line 240
    :cond_11
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_d

    .line 241
    const/16 v17, 0x8

    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_1

    .line 250
    .end local v8    # "lChild":Lorg/mozilla/javascript/Node;
    .end local v9    # "lType":I
    .end local v10    # "rChild":Lorg/mozilla/javascript/Node;
    .end local v11    # "rType":I
    :sswitch_6
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 251
    .restart local v8    # "lChild":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    .line 252
    .restart local v10    # "rChild":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v9

    .line 253
    .restart local v9    # "lType":I
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v10, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v11

    .line 256
    .restart local v11    # "rType":I
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-eqz v17, :cond_14

    .line 257
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-eqz v17, :cond_12

    .line 258
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 261
    :cond_12
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_13

    .line 262
    const/16 v17, 0x8

    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 290
    :cond_13
    :goto_2
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 267
    :cond_14
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-eqz v17, :cond_15

    .line 268
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_13

    .line 269
    const/16 v17, 0x8

    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_2

    .line 273
    :cond_15
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_17

    .line 274
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_16

    .line 275
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 276
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 279
    :cond_16
    const/16 v17, 0x8

    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_2

    .line 283
    :cond_17
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_13

    .line 284
    const/16 v17, 0x8

    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto :goto_2

    .line 302
    .end local v8    # "lChild":Lorg/mozilla/javascript/Node;
    .end local v9    # "lType":I
    .end local v10    # "rChild":Lorg/mozilla/javascript/Node;
    .end local v11    # "rType":I
    :sswitch_7
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 303
    .restart local v8    # "lChild":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    .line 304
    .restart local v10    # "rChild":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v9

    .line 305
    .restart local v9    # "lType":I
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v10, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v11

    .line 306
    .restart local v11    # "rType":I
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 307
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 308
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_1a

    .line 309
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_18

    .line 310
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 311
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 314
    :cond_18
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_19

    .line 315
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 316
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x96

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 318
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 320
    :cond_19
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 324
    :cond_1a
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v11, v0, :cond_1c

    .line 325
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_1b

    .line 326
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 327
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x96

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v8}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 329
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 331
    :cond_1b
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 334
    :cond_1c
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_1d

    .line 335
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 336
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x96

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v8}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 339
    :cond_1d
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_1e

    .line 340
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 341
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x96

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 344
    :cond_1e
    const/16 v17, 0x8

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 345
    const/4 v15, 0x1

    goto/16 :goto_0

    .line 351
    .end local v8    # "lChild":Lorg/mozilla/javascript/Node;
    .end local v9    # "lType":I
    .end local v10    # "rChild":Lorg/mozilla/javascript/Node;
    .end local v11    # "rType":I
    :sswitch_8
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 352
    .local v3, "arrayBase":Lorg/mozilla/javascript/Node;
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v4

    .line 353
    .local v4, "arrayIndex":Lorg/mozilla/javascript/Node;
    invoke-virtual {v4}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v12

    .line 354
    .local v12, "rValue":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v5

    .line 355
    .local v5, "baseType":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v5, v0, :cond_1f

    .line 356
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_1f

    .line 357
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 358
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x95

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 362
    :cond_1f
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v4, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v7

    .line 363
    .local v7, "indexType":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v7, v0, :cond_20

    .line 364
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_20

    .line 368
    const/16 v17, 0x8

    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 371
    :cond_20
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v12, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v13

    .line 372
    .local v13, "rValueType":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v13, v0, :cond_21

    .line 373
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_21

    .line 374
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 375
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x95

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v12}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 379
    :cond_21
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 382
    .end local v3    # "arrayBase":Lorg/mozilla/javascript/Node;
    .end local v4    # "arrayIndex":Lorg/mozilla/javascript/Node;
    .end local v5    # "baseType":I
    .end local v7    # "indexType":I
    .end local v12    # "rValue":Lorg/mozilla/javascript/Node;
    .end local v13    # "rValueType":I
    :sswitch_9
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 383
    .restart local v3    # "arrayBase":Lorg/mozilla/javascript/Node;
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v4

    .line 384
    .restart local v4    # "arrayIndex":Lorg/mozilla/javascript/Node;
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v5

    .line 385
    .restart local v5    # "baseType":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v5, v0, :cond_22

    .line 386
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_22

    .line 387
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 388
    new-instance v17, Lorg/mozilla/javascript/Node;

    const/16 v18, 0x95

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 392
    :cond_22
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v4, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v7

    .line 393
    .restart local v7    # "indexType":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v7, v0, :cond_23

    .line 394
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/optimizer/Optimizer;->convertParameter(Lorg/mozilla/javascript/Node;)Z

    move-result v17

    if-nez v17, :cond_23

    .line 398
    const/16 v17, 0x8

    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 401
    :cond_23
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 405
    .end local v3    # "arrayBase":Lorg/mozilla/javascript/Node;
    .end local v4    # "arrayIndex":Lorg/mozilla/javascript/Node;
    .end local v5    # "baseType":I
    .end local v7    # "indexType":I
    :sswitch_a
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 407
    .restart local v6    # "child":Lorg/mozilla/javascript/Node;
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteAsObjectChildren(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 408
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 410
    const/16 v17, 0x9

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .line 412
    .local v14, "target":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    if-eqz v14, :cond_25

    .line 417
    :goto_3
    if-eqz v6, :cond_26

    .line 418
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteForNumberVariables(Lorg/mozilla/javascript/Node;I)I

    move-result v15

    .line 419
    .restart local v15    # "type":I
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_24

    .line 420
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/optimizer/Optimizer;->markDCPNumberContext(Lorg/mozilla/javascript/Node;)V

    .line 422
    :cond_24
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 423
    goto :goto_3

    .line 425
    .end local v15    # "type":I
    :cond_25
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/Optimizer;->rewriteAsObjectChildren(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 427
    :cond_26
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 118
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_7
        0xa -> :sswitch_7
        0xb -> :sswitch_7
        0xe -> :sswitch_5
        0xf -> :sswitch_5
        0x10 -> :sswitch_5
        0x11 -> :sswitch_5
        0x12 -> :sswitch_7
        0x13 -> :sswitch_7
        0x15 -> :sswitch_6
        0x16 -> :sswitch_7
        0x17 -> :sswitch_7
        0x18 -> :sswitch_7
        0x19 -> :sswitch_7
        0x24 -> :sswitch_9
        0x25 -> :sswitch_8
        0x26 -> :sswitch_a
        0x28 -> :sswitch_1
        0x37 -> :sswitch_2
        0x38 -> :sswitch_4
        0x6a -> :sswitch_3
        0x6b -> :sswitch_3
        0x85 -> :sswitch_0
        0x8c -> :sswitch_8
        0x9c -> :sswitch_4
    .end sparse-switch
.end method


# virtual methods
.method optimize(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 3
    .param p1, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 24
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v1

    .line 25
    .local v1, "functionCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_0

    .line 26
    invoke-static {p1, v2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;I)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v0

    .line 27
    .local v0, "f":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/Optimizer;->optimizeFunction(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V

    .line 25
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 29
    .end local v0    # "f":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    :cond_0
    return-void
.end method
