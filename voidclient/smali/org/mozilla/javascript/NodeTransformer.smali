.class public Lorg/mozilla/javascript/NodeTransformer;
.super Ljava/lang/Object;
.source "NodeTransformer.java"


# instance fields
.field private hasFinally:Z

.field private loopEnds:Lorg/mozilla/javascript/ObjArray;

.field private loops:Lorg/mozilla/javascript/ObjArray;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method private static addBeforeCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 1
    .param p0, "parent"    # Lorg/mozilla/javascript/Node;
    .param p1, "previous"    # Lorg/mozilla/javascript/Node;
    .param p2, "current"    # Lorg/mozilla/javascript/Node;
    .param p3, "toAdd"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 526
    if-nez p1, :cond_1

    .line 527
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    if-eq p2, v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 528
    :cond_0
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 533
    :goto_0
    return-object p3

    .line 530
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    if-eq p2, v0, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 531
    :cond_2
    invoke-virtual {p0, p3, p1}, Lorg/mozilla/javascript/Node;->addChildAfter(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0
.end method

.method private static replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 1
    .param p0, "parent"    # Lorg/mozilla/javascript/Node;
    .param p1, "previous"    # Lorg/mozilla/javascript/Node;
    .param p2, "current"    # Lorg/mozilla/javascript/Node;
    .param p3, "replacement"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 539
    if-nez p1, :cond_1

    .line 540
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    if-eq p2, v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 541
    :cond_0
    invoke-virtual {p0, p2, p3}, Lorg/mozilla/javascript/Node;->replaceChild(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 549
    :goto_0
    return-object p3

    .line 542
    :cond_1
    iget-object v0, p1, Lorg/mozilla/javascript/Node;->next:Lorg/mozilla/javascript/Node;

    if-ne v0, p2, :cond_2

    .line 545
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/Node;->replaceChildAfter(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 547
    :cond_2
    invoke-virtual {p0, p2, p3}, Lorg/mozilla/javascript/Node;->replaceChild(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0
.end method

.method private transformCompilationUnit(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 6
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 43
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    .line 44
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    .line 47
    iput-boolean v2, p0, Lorg/mozilla/javascript/NodeTransformer;->hasFinally:Z

    .line 50
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v0

    const/16 v3, 0x6d

    if-ne v0, v3, :cond_0

    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v4, v1

    .line 52
    .local v4, "createScopeObjects":Z
    :goto_0
    if-nez v4, :cond_2

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/ast/ScriptNode;->flattenSymbolTable(Z)V

    .line 56
    instance-of v0, p1, Lorg/mozilla/javascript/ast/AstRoot;

    if-eqz v0, :cond_3

    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/ast/AstRoot;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstRoot;->isInStrictMode()Z

    move-result v0

    if-eqz v0, :cond_3

    move v5, v1

    .local v5, "inStrictMode":Z
    :goto_2
    move-object v0, p0

    move-object v1, p1

    move-object v2, p1

    move-object v3, p1

    .line 58
    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V

    .line 60
    return-void

    .end local v4    # "createScopeObjects":Z
    .end local v5    # "inStrictMode":Z
    :cond_1
    move v4, v2

    .line 50
    goto :goto_0

    .restart local v4    # "createScopeObjects":Z
    :cond_2
    move v0, v2

    .line 52
    goto :goto_1

    :cond_3
    move v5, v2

    .line 56
    goto :goto_2
.end method

.method private transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V
    .locals 48
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;
    .param p3, "scope"    # Lorg/mozilla/javascript/ast/Scope;
    .param p4, "createScopeObjects"    # Z
    .param p5, "inStrictMode"    # Z

    .prologue
    .line 68
    const/4 v8, 0x0

    .line 71
    .local v8, "node":Lorg/mozilla/javascript/Node;
    :goto_0
    const/16 v40, 0x0

    .line 72
    .local v40, "previous":Lorg/mozilla/javascript/Node;
    if-nez v8, :cond_0

    .line 73
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 78
    :goto_1
    if-nez v8, :cond_1

    .line 403
    return-void

    .line 75
    :cond_0
    move-object/from16 v40, v8

    .line 76
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    goto :goto_1

    .line 82
    :cond_1
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v45

    .line 83
    .local v45, "type":I
    if-eqz p4, :cond_5

    const/16 v3, 0x81

    move/from16 v0, v45

    if-eq v0, v3, :cond_2

    const/16 v3, 0x84

    move/from16 v0, v45

    if-eq v0, v3, :cond_2

    const/16 v3, 0x9d

    move/from16 v0, v45

    if-ne v0, v3, :cond_5

    :cond_2
    instance-of v3, v8, Lorg/mozilla/javascript/ast/Scope;

    if-eqz v3, :cond_5

    move-object/from16 v36, v8

    .line 88
    check-cast v36, Lorg/mozilla/javascript/ast/Scope;

    .line 89
    .local v36, "newScope":Lorg/mozilla/javascript/ast/Scope;
    invoke-virtual/range {v36 .. v36}, Lorg/mozilla/javascript/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 92
    new-instance v31, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x9d

    move/from16 v0, v45

    if-ne v0, v3, :cond_3

    const/16 v3, 0x9e

    :goto_2
    move-object/from16 v0, v31

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 94
    .local v31, "let":Lorg/mozilla/javascript/Node;
    new-instance v22, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x99

    move-object/from16 v0, v22

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 95
    .local v22, "innerLet":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 96
    invoke-virtual/range {v36 .. v36}, Lorg/mozilla/javascript/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/String;

    .line 97
    .local v34, "name":Ljava/lang/String;
    const/16 v3, 0x27

    move-object/from16 v0, v34

    invoke-static {v3, v0}, Lorg/mozilla/javascript/Node;->newString(ILjava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_3

    .line 92
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v22    # "innerLet":Lorg/mozilla/javascript/Node;
    .end local v31    # "let":Lorg/mozilla/javascript/Node;
    .end local v34    # "name":Ljava/lang/String;
    :cond_3
    const/16 v3, 0x99

    goto :goto_2

    .line 99
    .restart local v20    # "i$":Ljava/util/Iterator;
    .restart local v22    # "innerLet":Lorg/mozilla/javascript/Node;
    .restart local v31    # "let":Lorg/mozilla/javascript/Node;
    :cond_4
    const/4 v3, 0x0

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Scope;->setSymbolTable(Ljava/util/Map;)V

    .line 100
    move-object/from16 v38, v8

    .line 101
    .local v38, "oldNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v31

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 102
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v45

    .line 103
    move-object/from16 v0, v31

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 107
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v22    # "innerLet":Lorg/mozilla/javascript/Node;
    .end local v31    # "let":Lorg/mozilla/javascript/Node;
    .end local v36    # "newScope":Lorg/mozilla/javascript/ast/Scope;
    .end local v38    # "oldNode":Lorg/mozilla/javascript/Node;
    :cond_5
    sparse-switch v45, :sswitch_data_0

    .line 399
    :cond_6
    :goto_4
    instance-of v3, v8, Lorg/mozilla/javascript/ast/Scope;

    if-eqz v3, :cond_2b

    move-object v3, v8

    check-cast v3, Lorg/mozilla/javascript/ast/Scope;

    move-object v9, v3

    :goto_5
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-direct/range {v6 .. v11}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V

    goto/16 :goto_0

    .line 112
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 113
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    move-object v3, v8

    check-cast v3, Lorg/mozilla/javascript/ast/Jump;

    iget-object v3, v3, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    goto :goto_4

    .line 118
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 119
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v30

    .line 120
    .local v30, "leave":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v30 .. v30}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_7

    .line 121
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 123
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v0, v30

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    goto :goto_4

    .end local v30    # "leave":Lorg/mozilla/javascript/Node;
    :sswitch_2
    move-object/from16 v27, v8

    .line 129
    check-cast v27, Lorg/mozilla/javascript/ast/Jump;

    .line 130
    .local v27, "jump":Lorg/mozilla/javascript/ast/Jump;
    invoke-virtual/range {v27 .. v27}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v17

    .line 131
    .local v17, "finallytarget":Lorg/mozilla/javascript/Node;
    if-eqz v17, :cond_6

    .line 132
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/mozilla/javascript/NodeTransformer;->hasFinally:Z

    .line 133
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 134
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    goto :goto_4

    .line 141
    .end local v17    # "finallytarget":Lorg/mozilla/javascript/Node;
    .end local v27    # "jump":Lorg/mozilla/javascript/ast/Jump;
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->peek()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v8, :cond_6

    .line 142
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->pop()Ljava/lang/Object;

    .line 143
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->pop()Ljava/lang/Object;

    goto/16 :goto_4

    :sswitch_4
    move-object/from16 v3, p1

    .line 148
    check-cast v3, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ast/FunctionNode;->addResumptionPoint(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_4

    .line 153
    :sswitch_5
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v3

    const/16 v4, 0x6d

    if-ne v3, v4, :cond_c

    move-object/from16 v3, p1

    check-cast v3, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/FunctionNode;->isGenerator()Z

    move-result v3

    if-eqz v3, :cond_c

    const/16 v23, 0x1

    .line 155
    .local v23, "isGenerator":Z
    :goto_6
    if-eqz v23, :cond_8

    .line 156
    const/16 v3, 0x14

    const/4 v4, 0x1

    invoke-virtual {v8, v3, v4}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 165
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/mozilla/javascript/NodeTransformer;->hasFinally:Z

    if-eqz v3, :cond_6

    .line 167
    const/16 v47, 0x0

    .line 168
    .local v47, "unwindBlock":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v3

    add-int/lit8 v19, v3, -0x1

    .local v19, "i":I
    :goto_7
    if-ltz v19, :cond_e

    .line 169
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/mozilla/javascript/Node;

    .line 170
    .local v32, "n":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v16

    .line 171
    .local v16, "elemtype":I
    const/16 v3, 0x51

    move/from16 v0, v16

    if-eq v0, v3, :cond_9

    const/16 v3, 0x7b

    move/from16 v0, v16

    if-ne v0, v3, :cond_b

    .line 173
    :cond_9
    const/16 v3, 0x51

    move/from16 v0, v16

    if-ne v0, v3, :cond_d

    .line 174
    new-instance v25, Lorg/mozilla/javascript/ast/Jump;

    const/16 v3, 0x87

    move-object/from16 v0, v25

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/ast/Jump;-><init>(I)V

    .line 175
    .local v25, "jsrnode":Lorg/mozilla/javascript/ast/Jump;
    check-cast v32, Lorg/mozilla/javascript/ast/Jump;

    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v26

    .line 176
    .local v26, "jsrtarget":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v26

    move-object/from16 v1, v25

    iput-object v0, v1, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 177
    move-object/from16 v46, v25

    .line 181
    .end local v25    # "jsrnode":Lorg/mozilla/javascript/ast/Jump;
    .end local v26    # "jsrtarget":Lorg/mozilla/javascript/Node;
    .local v46, "unwind":Lorg/mozilla/javascript/Node;
    :goto_8
    if-nez v47, :cond_a

    .line 182
    new-instance v47, Lorg/mozilla/javascript/Node;

    .end local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    const/16 v3, 0x81

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v4

    move-object/from16 v0, v47

    invoke-direct {v0, v3, v4}, Lorg/mozilla/javascript/Node;-><init>(II)V

    .line 185
    .restart local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :cond_a
    move-object/from16 v0, v47

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 168
    .end local v46    # "unwind":Lorg/mozilla/javascript/Node;
    :cond_b
    add-int/lit8 v19, v19, -0x1

    goto :goto_7

    .line 153
    .end local v16    # "elemtype":I
    .end local v19    # "i":I
    .end local v23    # "isGenerator":Z
    .end local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :cond_c
    const/16 v23, 0x0

    goto :goto_6

    .line 179
    .restart local v16    # "elemtype":I
    .restart local v19    # "i":I
    .restart local v23    # "isGenerator":Z
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    .restart local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :cond_d
    new-instance v46, Lorg/mozilla/javascript/Node;

    const/4 v3, 0x3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .restart local v46    # "unwind":Lorg/mozilla/javascript/Node;
    goto :goto_8

    .line 188
    .end local v16    # "elemtype":I
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    .end local v46    # "unwind":Lorg/mozilla/javascript/Node;
    :cond_e
    if-eqz v47, :cond_6

    .line 189
    move-object/from16 v43, v8

    .line 190
    .local v43, "returnNode":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v43 .. v43}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v42

    .line 191
    .local v42, "returnExpr":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v47

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v37

    .line 192
    .end local v8    # "node":Lorg/mozilla/javascript/Node;
    .local v37, "node":Lorg/mozilla/javascript/Node;
    if-eqz v42, :cond_f

    if-eqz v23, :cond_10

    .line 193
    :cond_f
    move-object/from16 v0, v47

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    move-object/from16 v8, v37

    .end local v37    # "node":Lorg/mozilla/javascript/Node;
    .restart local v8    # "node":Lorg/mozilla/javascript/Node;
    goto/16 :goto_0

    .line 195
    .end local v8    # "node":Lorg/mozilla/javascript/Node;
    .restart local v37    # "node":Lorg/mozilla/javascript/Node;
    :cond_10
    new-instance v5, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x86

    move-object/from16 v0, v42

    invoke-direct {v5, v3, v0}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 196
    .local v5, "store":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v47

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 197
    new-instance v43, Lorg/mozilla/javascript/Node;

    .end local v43    # "returnNode":Lorg/mozilla/javascript/Node;
    const/16 v3, 0x40

    move-object/from16 v0, v43

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 198
    .restart local v43    # "returnNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v47

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    .line 200
    invoke-direct/range {v3 .. v8}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V

    move-object/from16 v8, v37

    .line 205
    .end local v37    # "node":Lorg/mozilla/javascript/Node;
    .restart local v8    # "node":Lorg/mozilla/javascript/Node;
    goto/16 :goto_0

    .end local v5    # "store":Lorg/mozilla/javascript/Node;
    .end local v19    # "i":I
    .end local v23    # "isGenerator":Z
    .end local v42    # "returnExpr":Lorg/mozilla/javascript/Node;
    .end local v43    # "returnNode":Lorg/mozilla/javascript/Node;
    .end local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :sswitch_6
    move-object/from16 v27, v8

    .line 213
    check-cast v27, Lorg/mozilla/javascript/ast/Jump;

    .line 214
    .restart local v27    # "jump":Lorg/mozilla/javascript/ast/Jump;
    invoke-virtual/range {v27 .. v27}, Lorg/mozilla/javascript/ast/Jump;->getJumpStatement()Lorg/mozilla/javascript/ast/Jump;

    move-result-object v28

    .line 215
    .local v28, "jumpStatement":Lorg/mozilla/javascript/ast/Jump;
    if-nez v28, :cond_11

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 217
    :cond_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v19

    .line 218
    .restart local v19    # "i":I
    :cond_12
    :goto_9
    if-nez v19, :cond_13

    .line 222
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 224
    :cond_13
    add-int/lit8 v19, v19, -0x1

    .line 225
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/mozilla/javascript/Node;

    .line 226
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v32

    move-object/from16 v1, v28

    if-ne v0, v1, :cond_14

    .line 244
    const/16 v3, 0x78

    move/from16 v0, v45

    if-ne v0, v3, :cond_16

    .line 245
    move-object/from16 v0, v28

    iget-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    move-object/from16 v0, v27

    iput-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 249
    :goto_a
    const/4 v3, 0x5

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Jump;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_4

    .line 230
    :cond_14
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v16

    .line 231
    .restart local v16    # "elemtype":I
    const/16 v3, 0x7b

    move/from16 v0, v16

    if-ne v0, v3, :cond_15

    .line 232
    new-instance v30, Lorg/mozilla/javascript/Node;

    const/4 v3, 0x3

    move-object/from16 v0, v30

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 233
    .restart local v30    # "leave":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v30

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->addBeforeCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v40

    .line 235
    goto :goto_9

    .end local v30    # "leave":Lorg/mozilla/javascript/Node;
    :cond_15
    const/16 v3, 0x51

    move/from16 v0, v16

    if-ne v0, v3, :cond_12

    move-object/from16 v44, v32

    .line 236
    check-cast v44, Lorg/mozilla/javascript/ast/Jump;

    .line 237
    .local v44, "tryNode":Lorg/mozilla/javascript/ast/Jump;
    new-instance v24, Lorg/mozilla/javascript/ast/Jump;

    const/16 v3, 0x87

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/ast/Jump;-><init>(I)V

    .line 238
    .local v24, "jsrFinally":Lorg/mozilla/javascript/ast/Jump;
    invoke-virtual/range {v44 .. v44}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v24

    iput-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 239
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v24

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->addBeforeCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v40

    goto :goto_9

    .line 247
    .end local v16    # "elemtype":I
    .end local v24    # "jsrFinally":Lorg/mozilla/javascript/ast/Jump;
    .end local v44    # "tryNode":Lorg/mozilla/javascript/ast/Jump;
    :cond_16
    invoke-virtual/range {v28 .. v28}, Lorg/mozilla/javascript/ast/Jump;->getContinue()Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v27

    iput-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    goto :goto_a

    .line 255
    .end local v19    # "i":I
    .end local v27    # "jump":Lorg/mozilla/javascript/ast/Jump;
    .end local v28    # "jumpStatement":Lorg/mozilla/javascript/ast/Jump;
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    :sswitch_7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v8, v1}, Lorg/mozilla/javascript/NodeTransformer;->visitCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    goto/16 :goto_4

    .line 259
    :sswitch_8
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v8, v1}, Lorg/mozilla/javascript/NodeTransformer;->visitNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    goto/16 :goto_4

    .line 264
    :sswitch_9
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v12

    .line 265
    .local v12, "child":Lorg/mozilla/javascript/Node;
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x99

    if-ne v3, v4, :cond_19

    .line 268
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v3

    const/16 v4, 0x6d

    if-ne v3, v4, :cond_17

    move-object/from16 v3, p1

    check-cast v3, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v3

    if-eqz v3, :cond_18

    :cond_17
    const/4 v13, 0x1

    .line 270
    .local v13, "createWith":Z
    :goto_b
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v40

    invoke-virtual {v0, v13, v1, v2, v8}, Lorg/mozilla/javascript/NodeTransformer;->visitLet(ZLorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 271
    goto/16 :goto_4

    .line 268
    .end local v13    # "createWith":Z
    :cond_18
    const/4 v13, 0x0

    goto :goto_b

    .line 280
    .end local v12    # "child":Lorg/mozilla/javascript/Node;
    :cond_19
    :sswitch_a
    new-instance v41, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x81

    move-object/from16 v0, v41

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 281
    .local v41, "result":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v14

    .local v14, "cursor":Lorg/mozilla/javascript/Node;
    :cond_1a
    :goto_c
    if-eqz v14, :cond_1e

    .line 284
    move-object/from16 v32, v14

    .line 285
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    invoke-virtual {v14}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v14

    .line 286
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_1d

    .line 287
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->hasChildren()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 289
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v21

    .line 290
    .local v21, "init":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v32

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 291
    const/16 v3, 0x31

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 292
    new-instance v33, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x9a

    move/from16 v0, v45

    if-ne v0, v3, :cond_1c

    const/16 v3, 0x9b

    :goto_d
    move-object/from16 v0, v33

    move-object/from16 v1, v32

    move-object/from16 v2, v21

    invoke-direct {v0, v3, v1, v2}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    .local v33, "n":Lorg/mozilla/javascript/Node;
    move-object/from16 v32, v33

    .line 302
    .end local v21    # "init":Lorg/mozilla/javascript/Node;
    .end local v33    # "n":Lorg/mozilla/javascript/Node;
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    :cond_1b
    new-instance v39, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x85

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v4

    move-object/from16 v0, v39

    move-object/from16 v1, v32

    invoke-direct {v0, v3, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;I)V

    .line 303
    .local v39, "pop":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v41

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_c

    .line 292
    .end local v39    # "pop":Lorg/mozilla/javascript/Node;
    .restart local v21    # "init":Lorg/mozilla/javascript/Node;
    :cond_1c
    const/16 v3, 0x8

    goto :goto_d

    .line 299
    .end local v21    # "init":Lorg/mozilla/javascript/Node;
    :cond_1d
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x9e

    if-eq v3, v4, :cond_1b

    .line 300
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 305
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    :cond_1e
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v41

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 306
    goto/16 :goto_4

    .line 310
    .end local v14    # "cursor":Lorg/mozilla/javascript/Node;
    .end local v41    # "result":Lorg/mozilla/javascript/Node;
    :sswitch_b
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v15

    .line 311
    .local v15, "defining":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v15, :cond_6

    .line 312
    invoke-virtual {v8, v15}, Lorg/mozilla/javascript/Node;->setScope(Lorg/mozilla/javascript/ast/Scope;)V

    goto/16 :goto_4

    .line 323
    .end local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    :sswitch_c
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v12

    .line 324
    .restart local v12    # "child":Lorg/mozilla/javascript/Node;
    const/4 v3, 0x7

    move/from16 v0, v45

    if-ne v0, v3, :cond_21

    .line 325
    :goto_e
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x1a

    if-ne v3, v4, :cond_1f

    .line 326
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v12

    goto :goto_e

    .line 328
    :cond_1f
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0xc

    if-eq v3, v4, :cond_20

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0xd

    if-ne v3, v4, :cond_21

    .line 331
    :cond_20
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    .line 332
    .local v18, "first":Lorg/mozilla/javascript/Node;
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v29

    .line 333
    .local v29, "last":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_22

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "undefined"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 335
    move-object/from16 v12, v29

    .line 341
    .end local v18    # "first":Lorg/mozilla/javascript/Node;
    .end local v29    # "last":Lorg/mozilla/javascript/Node;
    :cond_21
    :goto_f
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x21

    if-ne v3, v4, :cond_6

    .line 342
    const/16 v3, 0x22

    invoke-virtual {v12, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_4

    .line 336
    .restart local v18    # "first":Lorg/mozilla/javascript/Node;
    .restart local v29    # "last":Lorg/mozilla/javascript/Node;
    :cond_22
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_21

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "undefined"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 338
    move-object/from16 v12, v18

    goto :goto_f

    .line 347
    .end local v12    # "child":Lorg/mozilla/javascript/Node;
    .end local v18    # "first":Lorg/mozilla/javascript/Node;
    .end local v29    # "last":Lorg/mozilla/javascript/Node;
    :sswitch_d
    if-eqz p5, :cond_23

    .line 348
    const/16 v3, 0x49

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 356
    :cond_23
    :sswitch_e
    if-nez p4, :cond_6

    .line 360
    const/16 v3, 0x27

    move/from16 v0, v45

    if-ne v0, v3, :cond_25

    .line 361
    move-object/from16 v35, v8

    .line 371
    .local v35, "nameSource":Lorg/mozilla/javascript/Node;
    :cond_24
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/Node;->getScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v3

    if-nez v3, :cond_6

    .line 374
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v34

    .line 375
    .restart local v34    # "name":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v15

    .line 376
    .restart local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v15, :cond_6

    .line 377
    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Lorg/mozilla/javascript/Node;->setScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 378
    const/16 v3, 0x27

    move/from16 v0, v45

    if-ne v0, v3, :cond_26

    .line 379
    const/16 v3, 0x37

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_4

    .line 363
    .end local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    .end local v34    # "name":Ljava/lang/String;
    .end local v35    # "nameSource":Lorg/mozilla/javascript/Node;
    :cond_25
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v35

    .line 364
    .restart local v35    # "nameSource":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x31

    if-eq v3, v4, :cond_24

    .line 365
    const/16 v3, 0x1f

    move/from16 v0, v45

    if-eq v0, v3, :cond_6

    .line 368
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 380
    .restart local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    .restart local v34    # "name":Ljava/lang/String;
    :cond_26
    const/16 v3, 0x8

    move/from16 v0, v45

    if-eq v0, v3, :cond_27

    const/16 v3, 0x49

    move/from16 v0, v45

    if-ne v0, v3, :cond_28

    .line 382
    :cond_27
    const/16 v3, 0x38

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 383
    const/16 v3, 0x29

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_4

    .line 384
    :cond_28
    const/16 v3, 0x9b

    move/from16 v0, v45

    if-ne v0, v3, :cond_29

    .line 385
    const/16 v3, 0x9c

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 386
    const/16 v3, 0x29

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_4

    .line 387
    :cond_29
    const/16 v3, 0x1f

    move/from16 v0, v45

    if-ne v0, v3, :cond_2a

    .line 389
    new-instance v32, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x2c

    move-object/from16 v0, v32

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 390
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v32

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 391
    goto/16 :goto_4

    .line 392
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    :cond_2a
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .end local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    .end local v34    # "name":Ljava/lang/String;
    .end local v35    # "nameSource":Lorg/mozilla/javascript/Node;
    :cond_2b
    move-object/from16 v9, p3

    .line 399
    goto/16 :goto_5

    .line 107
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_3
        0x4 -> :sswitch_5
        0x7 -> :sswitch_c
        0x8 -> :sswitch_d
        0x1e -> :sswitch_8
        0x1f -> :sswitch_e
        0x20 -> :sswitch_c
        0x26 -> :sswitch_7
        0x27 -> :sswitch_e
        0x48 -> :sswitch_4
        0x51 -> :sswitch_2
        0x72 -> :sswitch_0
        0x78 -> :sswitch_6
        0x79 -> :sswitch_6
        0x7a -> :sswitch_a
        0x7b -> :sswitch_1
        0x82 -> :sswitch_0
        0x83 -> :sswitch_3
        0x84 -> :sswitch_0
        0x89 -> :sswitch_b
        0x99 -> :sswitch_9
        0x9a -> :sswitch_a
        0x9b -> :sswitch_e
        0x9e -> :sswitch_9
    .end sparse-switch
.end method


# virtual methods
.method public final transform(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 3
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 35
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 36
    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v0

    .line 37
    .local v0, "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NodeTransformer;->transform(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 35
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 39
    .end local v0    # "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    :cond_0
    return-void
.end method

.method protected visitCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 409
    return-void
.end method

.method protected visitLet(ZLorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 24
    .param p1, "createWith"    # Z
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;
    .param p3, "previous"    # Lorg/mozilla/javascript/Node;
    .param p4, "scopeNode"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 414
    invoke-virtual/range {p4 .. p4}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v19

    .line 415
    .local v19, "vars":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v4

    .line 416
    .local v4, "body":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p4

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 417
    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 418
    invoke-virtual/range {p4 .. p4}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x9e

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    const/4 v11, 0x1

    .line 421
    .local v11, "isExpression":Z
    :goto_0
    if-eqz p1, :cond_8

    .line 422
    new-instance v15, Lorg/mozilla/javascript/Node;

    if-eqz v11, :cond_1

    const/16 v20, 0x9f

    :goto_1
    move/from16 v0, v20

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 423
    .local v15, "result":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v15}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v15

    .line 424
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 425
    .local v12, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v14, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x42

    move/from16 v0, v20

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 426
    .local v14, "objectLiteral":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    .local v18, "v":Lorg/mozilla/javascript/Node;
    move-object v5, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .local v5, "body":Lorg/mozilla/javascript/Node;
    :goto_2
    if-eqz v18, :cond_7

    .line 427
    move-object/from16 v7, v18

    .line 428
    .local v7, "current":Lorg/mozilla/javascript/Node;
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x9e

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_12

    .line 430
    const/16 v20, 0x16

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 432
    .local v8, "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 433
    .local v6, "c":Lorg/mozilla/javascript/Node;
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x99

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v20

    throw v20

    .line 418
    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .end local v6    # "c":Lorg/mozilla/javascript/Node;
    .end local v7    # "current":Lorg/mozilla/javascript/Node;
    .end local v8    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v11    # "isExpression":Z
    .end local v12    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v14    # "objectLiteral":Lorg/mozilla/javascript/Node;
    .end local v15    # "result":Lorg/mozilla/javascript/Node;
    .end local v18    # "v":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :cond_0
    const/4 v11, 0x0

    goto :goto_0

    .line 422
    .restart local v11    # "isExpression":Z
    :cond_1
    const/16 v20, 0x81

    goto :goto_1

    .line 435
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v6    # "c":Lorg/mozilla/javascript/Node;
    .restart local v7    # "current":Lorg/mozilla/javascript/Node;
    .restart local v8    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v12    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v14    # "objectLiteral":Lorg/mozilla/javascript/Node;
    .restart local v15    # "result":Lorg/mozilla/javascript/Node;
    .restart local v18    # "v":Lorg/mozilla/javascript/Node;
    :cond_2
    if-eqz v11, :cond_3

    .line 436
    new-instance v4, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x59

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v4, v0, v1, v5}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 444
    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :goto_3
    if-eqz v8, :cond_4

    .line 445
    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 446
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v9, v0, :cond_4

    .line 447
    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x7e

    const-wide/16 v22, 0x0

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 446
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 438
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .end local v9    # "i":I
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    :cond_3
    new-instance v4, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x81

    new-instance v21, Lorg/mozilla/javascript/Node;

    const/16 v22, 0x85

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v23

    invoke-direct/range {v21 .. v23}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v4, v0, v1, v5}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto :goto_3

    .line 451
    :cond_4
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    .line 453
    .end local v6    # "c":Lorg/mozilla/javascript/Node;
    .end local v8    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    :goto_5
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x27

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_5

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v20

    throw v20

    .line 454
    :cond_5
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/ScriptRuntime;->getIndexObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v10

    .line 456
    .local v10, "init":Lorg/mozilla/javascript/Node;
    if-nez v10, :cond_6

    .line 457
    new-instance v10, Lorg/mozilla/javascript/Node;

    .end local v10    # "init":Lorg/mozilla/javascript/Node;
    const/16 v20, 0x7e

    const-wide/16 v22, 0x0

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v10, v0, v1}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 459
    .restart local v10    # "init":Lorg/mozilla/javascript/Node;
    :cond_6
    invoke-virtual {v14, v10}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 426
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v18

    move-object v5, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_2

    .line 461
    .end local v7    # "current":Lorg/mozilla/javascript/Node;
    .end local v10    # "init":Lorg/mozilla/javascript/Node;
    :cond_7
    const/16 v20, 0xc

    invoke-virtual {v12}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v14, v0, v1}, Lorg/mozilla/javascript/Node;->putProp(ILjava/lang/Object;)V

    .line 462
    new-instance v13, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v13, v0, v14}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 463
    .local v13, "newVars":Lorg/mozilla/javascript/Node;
    invoke-virtual {v15, v13}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 464
    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x7b

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v0, v1, v5}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 465
    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x3

    invoke-direct/range {v20 .. v21}, Lorg/mozilla/javascript/Node;-><init>(I)V

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    move-object v4, v5

    .line 520
    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .end local v12    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v14    # "objectLiteral":Lorg/mozilla/javascript/Node;
    .end local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :goto_6
    return-object v15

    .line 467
    .end local v13    # "newVars":Lorg/mozilla/javascript/Node;
    .end local v15    # "result":Lorg/mozilla/javascript/Node;
    .end local v18    # "v":Lorg/mozilla/javascript/Node;
    .restart local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    :cond_8
    new-instance v15, Lorg/mozilla/javascript/Node;

    if-eqz v11, :cond_9

    const/16 v20, 0x59

    :goto_7
    move/from16 v0, v20

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 468
    .restart local v15    # "result":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v15}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v15

    .line 469
    new-instance v13, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x59

    move/from16 v0, v20

    invoke-direct {v13, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 470
    .restart local v13    # "newVars":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    .restart local v18    # "v":Lorg/mozilla/javascript/Node;
    move-object v5, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    :goto_8
    if-eqz v18, :cond_e

    .line 471
    move-object/from16 v7, v18

    .line 472
    .restart local v7    # "current":Lorg/mozilla/javascript/Node;
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x9e

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_11

    .line 474
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 475
    .restart local v6    # "c":Lorg/mozilla/javascript/Node;
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x99

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_a

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v20

    throw v20

    .line 467
    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .end local v6    # "c":Lorg/mozilla/javascript/Node;
    .end local v7    # "current":Lorg/mozilla/javascript/Node;
    .end local v13    # "newVars":Lorg/mozilla/javascript/Node;
    .end local v15    # "result":Lorg/mozilla/javascript/Node;
    .end local v18    # "v":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :cond_9
    const/16 v20, 0x81

    goto :goto_7

    .line 477
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v6    # "c":Lorg/mozilla/javascript/Node;
    .restart local v7    # "current":Lorg/mozilla/javascript/Node;
    .restart local v13    # "newVars":Lorg/mozilla/javascript/Node;
    .restart local v15    # "result":Lorg/mozilla/javascript/Node;
    .restart local v18    # "v":Lorg/mozilla/javascript/Node;
    :cond_a
    if-eqz v11, :cond_b

    .line 478
    new-instance v4, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x59

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v4, v0, v1, v5}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 485
    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :goto_9
    check-cast v7, Lorg/mozilla/javascript/ast/Scope;

    .end local v7    # "current":Lorg/mozilla/javascript/Node;
    move-object/from16 v20, p4

    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v0, v20

    invoke-static {v7, v0}, Lorg/mozilla/javascript/ast/Scope;->joinScopes(Lorg/mozilla/javascript/ast/Scope;Lorg/mozilla/javascript/ast/Scope;)V

    .line 487
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    .line 489
    .end local v6    # "c":Lorg/mozilla/javascript/Node;
    .restart local v7    # "current":Lorg/mozilla/javascript/Node;
    :goto_a
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v20

    const/16 v21, 0x27

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_c

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v20

    throw v20

    .line 480
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v6    # "c":Lorg/mozilla/javascript/Node;
    :cond_b
    new-instance v4, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x81

    new-instance v21, Lorg/mozilla/javascript/Node;

    const/16 v22, 0x85

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v23

    invoke-direct/range {v21 .. v23}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v4, v0, v1, v5}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto :goto_9

    .line 490
    .end local v6    # "c":Lorg/mozilla/javascript/Node;
    :cond_c
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/Node;->newString(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v17

    .local v17, "stringNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v20, p4

    .line 491
    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->setScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 492
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v10

    .line 493
    .restart local v10    # "init":Lorg/mozilla/javascript/Node;
    if-nez v10, :cond_d

    .line 494
    new-instance v10, Lorg/mozilla/javascript/Node;

    .end local v10    # "init":Lorg/mozilla/javascript/Node;
    const/16 v20, 0x7e

    const-wide/16 v22, 0x0

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v10, v0, v1}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 496
    .restart local v10    # "init":Lorg/mozilla/javascript/Node;
    :cond_d
    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x38

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2, v10}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 470
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v18

    move-object v5, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_8

    .line 498
    .end local v7    # "current":Lorg/mozilla/javascript/Node;
    .end local v10    # "init":Lorg/mozilla/javascript/Node;
    .end local v17    # "stringNode":Lorg/mozilla/javascript/Node;
    :cond_e
    if-eqz v11, :cond_f

    .line 499
    invoke-virtual {v15, v13}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 500
    const/16 v20, 0x59

    move-object/from16 v0, p4

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 501
    move-object/from16 v0, p4

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 502
    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 503
    instance-of v0, v5, Lorg/mozilla/javascript/ast/Scope;

    move/from16 v20, v0

    if-eqz v20, :cond_10

    move-object/from16 v20, v5

    .line 504
    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v16

    .local v16, "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    move-object/from16 v20, v5

    .line 505
    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v21, p4

    check-cast v21, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 506
    check-cast p4, Lorg/mozilla/javascript/ast/Scope;

    .end local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    move-object v4, v5

    .line 507
    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_6

    .line 509
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .end local v16    # "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    :cond_f
    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x85

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v0, v1, v13}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 510
    const/16 v20, 0x81

    move-object/from16 v0, p4

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 511
    move-object/from16 v0, p4

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 512
    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Node;->addChildrenToBack(Lorg/mozilla/javascript/Node;)V

    .line 513
    instance-of v0, v5, Lorg/mozilla/javascript/ast/Scope;

    move/from16 v20, v0

    if-eqz v20, :cond_10

    move-object/from16 v20, v5

    .line 514
    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v16

    .restart local v16    # "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    move-object/from16 v20, v5

    .line 515
    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v21, p4

    check-cast v21, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 516
    check-cast p4, Lorg/mozilla/javascript/ast/Scope;

    .end local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .end local v16    # "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    :cond_10
    move-object v4, v5

    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_6

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v7    # "current":Lorg/mozilla/javascript/Node;
    .restart local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    :cond_11
    move-object v4, v5

    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_a

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .end local v13    # "newVars":Lorg/mozilla/javascript/Node;
    .restart local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v12    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v14    # "objectLiteral":Lorg/mozilla/javascript/Node;
    :cond_12
    move-object v4, v5

    .end local v5    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_5
.end method

.method protected visitNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 406
    return-void
.end method
