.class Lorg/mozilla/javascript/optimizer/Block;
.super Ljava/lang/Object;
.source "Block.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/optimizer/Block$1;,
        Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field private static debug_blockCount:I


# instance fields
.field private itsBlockID:I

.field private itsEndNodeIndex:I

.field private itsLiveOnEntrySet:Ljava/util/BitSet;

.field private itsLiveOnExitSet:Ljava/util/BitSet;

.field private itsNotDefSet:Ljava/util/BitSet;

.field private itsPredecessors:[Lorg/mozilla/javascript/optimizer/Block;

.field private itsStartNodeIndex:I

.field private itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

.field private itsUseBeforeDefSet:Ljava/util/BitSet;


# direct methods
.method constructor <init>(II)V
    .locals 0
    .param p1, "startNodeIndex"    # I
    .param p2, "endNodeIndex"    # I

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput p1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsStartNodeIndex:I

    .line 55
    iput p2, p0, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    .line 56
    return-void
.end method

.method private static assignType([III)Z
    .locals 2
    .param p0, "varTypes"    # [I
    .param p1, "index"    # I
    .param p2, "type"    # I

    .prologue
    .line 333
    aget v0, p0, p1

    .line 334
    .local v0, "prev":I
    aget v1, p0, p1

    or-int/2addr v1, p2

    aput v1, p0, p1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static buildBlocks([Lorg/mozilla/javascript/Node;)[Lorg/mozilla/javascript/optimizer/Block;
    .locals 14
    .param p0, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 107
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 108
    .local v11, "theTargetBlocks":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/optimizer/Block$FatBlock;>;"
    new-instance v10, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v10}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    .line 111
    .local v10, "theBlocks":Lorg/mozilla/javascript/ObjArray;
    const/4 v1, 0x0

    .line 113
    .local v1, "beginNodeIndex":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v12, p0

    if-ge v7, v12, :cond_3

    .line 114
    aget-object v12, p0, v7

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    sparse-switch v12, :sswitch_data_0

    .line 113
    :cond_0
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 117
    :sswitch_0
    if-eq v7, v1, :cond_0

    .line 118
    add-int/lit8 v12, v7, -0x1

    invoke-static {v1, v12}, Lorg/mozilla/javascript/optimizer/Block;->newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-result-object v6

    .line 119
    .local v6, "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    aget-object v12, p0, v1

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    const/16 v13, 0x83

    if-ne v12, v13, :cond_1

    .line 120
    aget-object v12, p0, v1

    invoke-interface {v11, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_1
    invoke-virtual {v10, v6}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 124
    move v1, v7

    .line 125
    goto :goto_1

    .line 132
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :sswitch_1
    invoke-static {v1, v7}, Lorg/mozilla/javascript/optimizer/Block;->newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-result-object v6

    .line 133
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    aget-object v12, p0, v1

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    const/16 v13, 0x83

    if-ne v12, v13, :cond_2

    .line 134
    aget-object v12, p0, v1

    invoke-interface {v11, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_2
    invoke-virtual {v10, v6}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 138
    add-int/lit8 v1, v7, 0x1

    goto :goto_1

    .line 144
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_3
    array-length v12, p0

    if-eq v1, v12, :cond_5

    .line 145
    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    invoke-static {v1, v12}, Lorg/mozilla/javascript/optimizer/Block;->newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-result-object v6

    .line 146
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    aget-object v12, p0, v1

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    const/16 v13, 0x83

    if-ne v12, v13, :cond_4

    .line 147
    aget-object v12, p0, v1

    invoke-interface {v11, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :cond_4
    invoke-virtual {v10, v6}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 154
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_5
    const/4 v7, 0x0

    :goto_2
    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    if-ge v7, v12, :cond_9

    .line 155
    invoke-virtual {v10, v7}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-object v6, v12

    check-cast v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 157
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    iget-object v12, v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    iget v12, v12, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    aget-object v2, p0, v12

    .line 158
    .local v2, "blockEndNode":Lorg/mozilla/javascript/Node;
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    .line 160
    .local v3, "blockEndNodeType":I
    const/4 v12, 0x5

    if-eq v3, v12, :cond_6

    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-ge v7, v12, :cond_6

    .line 161
    add-int/lit8 v12, v7, 0x1

    invoke-virtual {v10, v12}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-object v5, v12

    check-cast v5, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 162
    .local v5, "fallThruTarget":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    invoke-virtual {v6, v5}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addSuccessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 163
    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addPredecessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 167
    .end local v5    # "fallThruTarget":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_6
    const/4 v12, 0x7

    if-eq v3, v12, :cond_7

    const/4 v12, 0x6

    if-eq v3, v12, :cond_7

    const/4 v12, 0x5

    if-ne v3, v12, :cond_8

    .line 170
    :cond_7
    check-cast v2, Lorg/mozilla/javascript/ast/Jump;

    .end local v2    # "blockEndNode":Lorg/mozilla/javascript/Node;
    iget-object v9, v2, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 171
    .local v9, "target":Lorg/mozilla/javascript/Node;
    invoke-interface {v11, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 172
    .local v4, "branchTargetBlock":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    const/4 v12, 0x6

    iget-object v13, v4, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    invoke-virtual {v9, v12, v13}, Lorg/mozilla/javascript/Node;->putProp(ILjava/lang/Object;)V

    .line 173
    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addSuccessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 174
    invoke-virtual {v4, v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addPredecessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 154
    .end local v4    # "branchTargetBlock":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    .end local v9    # "target":Lorg/mozilla/javascript/Node;
    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 178
    .end local v3    # "blockEndNodeType":I
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_9
    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    new-array v8, v12, [Lorg/mozilla/javascript/optimizer/Block;

    .line 180
    .local v8, "result":[Lorg/mozilla/javascript/optimizer/Block;
    const/4 v7, 0x0

    :goto_3
    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    if-ge v7, v12, :cond_a

    .line 181
    invoke-virtual {v10, v7}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-object v6, v12

    check-cast v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 182
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    iget-object v0, v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    .line 183
    .local v0, "b":Lorg/mozilla/javascript/optimizer/Block;
    invoke-virtual {v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->getSuccessors()[Lorg/mozilla/javascript/optimizer/Block;

    move-result-object v12

    iput-object v12, v0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 184
    invoke-virtual {v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->getPredecessors()[Lorg/mozilla/javascript/optimizer/Block;

    move-result-object v12

    iput-object v12, v0, Lorg/mozilla/javascript/optimizer/Block;->itsPredecessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 185
    iput v7, v0, Lorg/mozilla/javascript/optimizer/Block;->itsBlockID:I

    .line 186
    aput-object v0, v8, v7

    .line 180
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 189
    .end local v0    # "b":Lorg/mozilla/javascript/optimizer/Block;
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_a
    return-object v8

    .line 114
    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_1
        0x6 -> :sswitch_1
        0x7 -> :sswitch_1
        0x83 -> :sswitch_0
    .end sparse-switch
.end method

.method private doReachedUseDataFlow()Z
    .locals 5

    .prologue
    .line 434
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 435
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    if-eqz v1, :cond_0

    .line 436
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 437
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    aget-object v2, v2, v0

    iget-object v2, v2, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 436
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 440
    .end local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-direct {p0, v1, v2, v3, v4}, Lorg/mozilla/javascript/optimizer/Block;->updateEntrySet(Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;)Z

    move-result v1

    return v1
.end method

.method private doTypeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[I)Z
    .locals 4
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "statementNodes"    # [Lorg/mozilla/javascript/Node;
    .param p3, "varTypes"    # [I

    .prologue
    .line 607
    const/4 v0, 0x0

    .line 609
    .local v0, "changed":Z
    iget v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsStartNodeIndex:I

    .local v1, "i":I
    :goto_0
    iget v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    if-gt v1, v3, :cond_1

    .line 610
    aget-object v2, p2, v1

    .line 611
    .local v2, "n":Lorg/mozilla/javascript/Node;
    if-eqz v2, :cond_0

    .line 612
    invoke-static {p1, v2, p3}, Lorg/mozilla/javascript/optimizer/Block;->findDefPoints(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)Z

    move-result v3

    or-int/2addr v0, v3

    .line 609
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 616
    .end local v2    # "n":Lorg/mozilla/javascript/Node;
    :cond_1
    return v0
.end method

.method private static findDefPoints(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)Z
    .locals 8
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "n"    # Lorg/mozilla/javascript/Node;
    .param p2, "varTypes"    # [I

    .prologue
    .line 573
    const/4 v4, 0x0

    .line 574
    .local v4, "result":Z
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 575
    .local v0, "first":Lorg/mozilla/javascript/Node;
    move-object v2, v0

    .local v2, "next":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v2, :cond_0

    .line 576
    invoke-static {p0, v2, p2}, Lorg/mozilla/javascript/optimizer/Block;->findDefPoints(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)Z

    move-result v6

    or-int/2addr v4, v6

    .line 575
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    goto :goto_0

    .line 578
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 601
    :cond_1
    :goto_1
    return v4

    .line 581
    :sswitch_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x37

    if-ne v6, v7, :cond_1

    .line 583
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 584
    .local v1, "i":I
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v6

    aget-boolean v6, v6, v1

    if-nez v6, :cond_1

    .line 585
    const/4 v6, 0x1

    invoke-static {p2, v1, v6}, Lorg/mozilla/javascript/optimizer/Block;->assignType([III)Z

    move-result v6

    or-int/2addr v4, v6

    goto :goto_1

    .line 591
    .end local v1    # "i":I
    :sswitch_1
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 592
    .local v3, "rValue":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v3, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v5

    .line 593
    .local v5, "theType":I
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 594
    .restart local v1    # "i":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x38

    if-ne v6, v7, :cond_2

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v6

    aget-boolean v6, v6, v1

    if-nez v6, :cond_1

    .line 596
    :cond_2
    invoke-static {p2, v1, v5}, Lorg/mozilla/javascript/optimizer/Block;->assignType([III)Z

    move-result v6

    or-int/2addr v4, v6

    goto :goto_1

    .line 578
    nop

    :sswitch_data_0
    .sparse-switch
        0x38 -> :sswitch_1
        0x6a -> :sswitch_0
        0x6b -> :sswitch_0
        0x9c -> :sswitch_1
    .end sparse-switch
.end method

.method private static findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I
    .locals 10
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "n"    # Lorg/mozilla/javascript/Node;
    .param p2, "varTypes"    # [I

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x3

    .line 462
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    move v7, v8

    .line 567
    :goto_0
    :sswitch_0
    return v7

    :sswitch_1
    move v7, v8

    .line 469
    goto :goto_0

    :sswitch_2
    move v7, v8

    .line 475
    goto :goto_0

    .line 478
    :sswitch_3
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v7

    aget v7, p2, v7

    goto :goto_0

    :sswitch_4
    move v7, v8

    .line 499
    goto :goto_0

    :sswitch_5
    move v7, v8

    .line 517
    goto :goto_0

    :sswitch_6
    move v7, v8

    .line 523
    goto :goto_0

    :sswitch_7
    move v7, v8

    .line 530
    goto :goto_0

    .line 536
    :sswitch_8
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 537
    .local v0, "child":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v0, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v5

    .line 538
    .local v5, "lType":I
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-static {p0, v7, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v6

    .line 539
    .local v6, "rType":I
    or-int v7, v5, v6

    goto :goto_0

    .line 543
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    .end local v5    # "lType":I
    .end local v6    # "rType":I
    :sswitch_9
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 544
    .local v3, "ifTrue":Lorg/mozilla/javascript/Node;
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 545
    .local v1, "ifFalse":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v3, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v4

    .line 546
    .local v4, "ifTrueType":I
    invoke-static {p0, v1, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v2

    .line 547
    .local v2, "ifFalseType":I
    or-int v7, v4, v2

    goto :goto_0

    .line 556
    .end local v1    # "ifFalse":Lorg/mozilla/javascript/Node;
    .end local v2    # "ifFalseType":I
    .end local v3    # "ifTrue":Lorg/mozilla/javascript/Node;
    .end local v4    # "ifTrueType":I
    :sswitch_a
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-static {p0, v7, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v7

    goto :goto_0

    .line 560
    :sswitch_b
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 561
    .restart local v0    # "child":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v0, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v5

    .line 562
    .restart local v5    # "lType":I
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-static {p0, v7, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v6

    .line 563
    .restart local v6    # "rType":I
    or-int v7, v5, v6

    goto :goto_0

    .line 462
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_a
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_5
        0xd -> :sswitch_5
        0xe -> :sswitch_5
        0xf -> :sswitch_5
        0x10 -> :sswitch_5
        0x11 -> :sswitch_5
        0x12 -> :sswitch_0
        0x13 -> :sswitch_0
        0x14 -> :sswitch_0
        0x15 -> :sswitch_8
        0x16 -> :sswitch_0
        0x17 -> :sswitch_0
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x1a -> :sswitch_5
        0x1b -> :sswitch_0
        0x1c -> :sswitch_0
        0x1d -> :sswitch_0
        0x1e -> :sswitch_1
        0x1f -> :sswitch_5
        0x20 -> :sswitch_6
        0x21 -> :sswitch_2
        0x23 -> :sswitch_a
        0x24 -> :sswitch_2
        0x25 -> :sswitch_a
        0x26 -> :sswitch_1
        0x27 -> :sswitch_2
        0x28 -> :sswitch_0
        0x29 -> :sswitch_6
        0x2a -> :sswitch_7
        0x2b -> :sswitch_2
        0x2c -> :sswitch_5
        0x2d -> :sswitch_5
        0x2e -> :sswitch_5
        0x2f -> :sswitch_5
        0x30 -> :sswitch_7
        0x34 -> :sswitch_5
        0x35 -> :sswitch_5
        0x37 -> :sswitch_3
        0x38 -> :sswitch_a
        0x41 -> :sswitch_7
        0x42 -> :sswitch_7
        0x45 -> :sswitch_5
        0x46 -> :sswitch_1
        0x59 -> :sswitch_a
        0x66 -> :sswitch_9
        0x68 -> :sswitch_b
        0x69 -> :sswitch_b
        0x6a -> :sswitch_0
        0x6b -> :sswitch_0
        0x7e -> :sswitch_4
        0x89 -> :sswitch_6
        0x9c -> :sswitch_a
        0x9d -> :sswitch_7
    .end sparse-switch
.end method

.method private initLiveOnEntrySets(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V
    .locals 5
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 414
    invoke-virtual {p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarCount()I

    move-result v1

    .line 415
    .local v1, "listLength":I
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    .line 416
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    .line 417
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    .line 418
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    .line 419
    iget v0, p0, Lorg/mozilla/javascript/optimizer/Block;->itsStartNodeIndex:I

    .local v0, "i":I
    :goto_0
    iget v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    if-gt v0, v3, :cond_0

    .line 420
    aget-object v2, p2, v0

    .line 421
    .local v2, "n":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p1, v2}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    .line 419
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 423
    .end local v2    # "n":Lorg/mozilla/javascript/Node;
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v1}, Ljava/util/BitSet;->flip(II)V

    .line 424
    return-void
.end method

.method private lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V
    .locals 6
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "n"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 357
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    .line 398
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 399
    .local v0, "child":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v0, :cond_0

    .line 400
    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    .line 401
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    goto :goto_0

    .line 362
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    :sswitch_0
    iget-object v4, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v4, p2}, Lorg/mozilla/javascript/ast/FunctionNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 363
    .local v3, "varIndex":I
    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 364
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    .line 405
    .end local v3    # "varIndex":I
    :cond_0
    :goto_1
    return-void

    .line 370
    :sswitch_1
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 371
    .restart local v0    # "child":Lorg/mozilla/javascript/Node;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v4

    const/16 v5, 0x37

    if-ne v4, v5, :cond_2

    .line 372
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 373
    .restart local v3    # "varIndex":I
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 374
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    .line 375
    :cond_1
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    goto :goto_1

    .line 377
    .end local v3    # "varIndex":I
    :cond_2
    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    goto :goto_1

    .line 384
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    :sswitch_2
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 385
    .local v1, "lhs":Lorg/mozilla/javascript/Node;
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 386
    .local v2, "rhs":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p1, v2}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    .line 387
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/BitSet;->set(I)V

    goto :goto_1

    .line 392
    .end local v1    # "lhs":Lorg/mozilla/javascript/Node;
    .end local v2    # "rhs":Lorg/mozilla/javascript/Node;
    :sswitch_3
    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 393
    .restart local v3    # "varIndex":I
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 394
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    goto :goto_1

    .line 357
    :sswitch_data_0
    .sparse-switch
        0x37 -> :sswitch_3
        0x38 -> :sswitch_2
        0x6a -> :sswitch_1
        0x6b -> :sswitch_1
        0x89 -> :sswitch_0
        0x9c -> :sswitch_2
    .end sparse-switch
.end method

.method private markAnyTypeVariables([I)V
    .locals 2
    .param p1, "varTypes"    # [I

    .prologue
    .line 339
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_1

    .line 340
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 341
    const/4 v1, 0x3

    invoke-static {p1, v0, v1}, Lorg/mozilla/javascript/optimizer/Block;->assignType([III)Z

    .line 339
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 345
    :cond_1
    return-void
.end method

.method private static newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    .locals 2
    .param p0, "startNodeIndex"    # I
    .param p1, "endNodeIndex"    # I

    .prologue
    .line 194
    new-instance v0, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;-><init>(Lorg/mozilla/javascript/optimizer/Block$1;)V

    .line 195
    .local v0, "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    new-instance v1, Lorg/mozilla/javascript/optimizer/Block;

    invoke-direct {v1, p0, p1}, Lorg/mozilla/javascript/optimizer/Block;-><init>(II)V

    iput-object v1, v0, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    .line 196
    return-object v0
.end method

.method private printLiveOnEntrySet(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V
    .locals 0
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .prologue
    .line 634
    return-void
.end method

.method private static reachingDefDataFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V
    .locals 10
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;
    .param p2, "theBlocks"    # [Lorg/mozilla/javascript/optimizer/Block;
    .param p3, "varTypes"    # [I

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 246
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, p2

    if-ge v1, v7, :cond_0

    .line 247
    aget-object v7, p2, v1

    invoke-direct {v7, p0, p1}, Lorg/mozilla/javascript/optimizer/Block;->initLiveOnEntrySets(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 254
    :cond_0
    array-length v7, p2

    new-array v6, v7, [Z

    .line 255
    .local v6, "visit":[Z
    array-length v7, p2

    new-array v0, v7, [Z

    .line 256
    .local v0, "doneOnce":[Z
    array-length v7, p2

    add-int/lit8 v5, v7, -0x1

    .line 257
    .local v5, "vIndex":I
    const/4 v3, 0x0

    .line 258
    .local v3, "needRescan":Z
    aput-boolean v8, v6, v5

    .line 260
    :goto_1
    aget-boolean v7, v6, v5

    if-nez v7, :cond_1

    aget-boolean v7, v0, v5

    if-nez v7, :cond_3

    .line 261
    :cond_1
    aput-boolean v8, v0, v5

    .line 262
    aput-boolean v9, v6, v5

    .line 263
    aget-object v7, p2, v5

    invoke-direct {v7}, Lorg/mozilla/javascript/optimizer/Block;->doReachedUseDataFlow()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 264
    aget-object v7, p2, v5

    iget-object v4, v7, Lorg/mozilla/javascript/optimizer/Block;->itsPredecessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 265
    .local v4, "pred":[Lorg/mozilla/javascript/optimizer/Block;
    if-eqz v4, :cond_3

    .line 266
    const/4 v1, 0x0

    :goto_2
    array-length v7, v4

    if-ge v1, v7, :cond_3

    .line 267
    aget-object v7, v4, v1

    iget v2, v7, Lorg/mozilla/javascript/optimizer/Block;->itsBlockID:I

    .line 268
    .local v2, "index":I
    aput-boolean v8, v6, v2

    .line 269
    if-le v2, v5, :cond_2

    move v7, v8

    :goto_3
    or-int/2addr v3, v7

    .line 266
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    move v7, v9

    .line 269
    goto :goto_3

    .line 274
    .end local v2    # "index":I
    .end local v4    # "pred":[Lorg/mozilla/javascript/optimizer/Block;
    :cond_3
    if-nez v5, :cond_4

    .line 275
    if-eqz v3, :cond_5

    .line 276
    array-length v7, p2

    add-int/lit8 v5, v7, -0x1

    .line 277
    const/4 v3, 0x0

    goto :goto_1

    .line 282
    :cond_4
    add-int/lit8 v5, v5, -0x1

    goto :goto_1

    .line 291
    :cond_5
    aget-object v7, p2, v9

    invoke-direct {v7, p3}, Lorg/mozilla/javascript/optimizer/Block;->markAnyTypeVariables([I)V

    .line 292
    return-void
.end method

.method static runFlowAnalyzes(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V
    .locals 7
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 60
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v1

    .line 61
    .local v1, "paramCount":I
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarCount()I

    move-result v3

    .line 62
    .local v3, "varCount":I
    new-array v4, v3, [I

    .line 64
    .local v4, "varTypes":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, v1, :cond_0

    .line 65
    const/4 v5, 0x3

    aput v5, v4, v0

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 69
    :cond_0
    move v0, v1

    :goto_1
    if-eq v0, v3, :cond_1

    .line 70
    const/4 v5, 0x0

    aput v5, v4, v0

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 73
    :cond_1
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Block;->buildBlocks([Lorg/mozilla/javascript/Node;)[Lorg/mozilla/javascript/optimizer/Block;

    move-result-object v2

    .line 82
    .local v2, "theBlocks":[Lorg/mozilla/javascript/optimizer/Block;
    invoke-static {p0, p1, v2, v4}, Lorg/mozilla/javascript/optimizer/Block;->reachingDefDataFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V

    .line 83
    invoke-static {p0, p1, v2, v4}, Lorg/mozilla/javascript/optimizer/Block;->typeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V

    .line 96
    move v0, v1

    :goto_2
    if-eq v0, v3, :cond_3

    .line 97
    aget v5, v4, v0

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 98
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->setIsNumberVar(I)V

    .line 96
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 102
    :cond_3
    return-void
.end method

.method private static toString([Lorg/mozilla/javascript/optimizer/Block;[Lorg/mozilla/javascript/Node;)Ljava/lang/String;
    .locals 1
    .param p0, "blockList"    # [Lorg/mozilla/javascript/optimizer/Block;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 201
    const/4 v0, 0x0

    return-object v0
.end method

.method private static typeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V
    .locals 10
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;
    .param p2, "theBlocks"    # [Lorg/mozilla/javascript/optimizer/Block;
    .param p3, "varTypes"    # [I

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 297
    array-length v7, p2

    new-array v6, v7, [Z

    .line 298
    .local v6, "visit":[Z
    array-length v7, p2

    new-array v0, v7, [Z

    .line 299
    .local v0, "doneOnce":[Z
    const/4 v5, 0x0

    .line 300
    .local v5, "vIndex":I
    const/4 v3, 0x0

    .line 301
    .local v3, "needRescan":Z
    aput-boolean v8, v6, v5

    .line 303
    :goto_0
    aget-boolean v7, v6, v5

    if-nez v7, :cond_0

    aget-boolean v7, v0, v5

    if-nez v7, :cond_2

    .line 304
    :cond_0
    aput-boolean v8, v0, v5

    .line 305
    aput-boolean v9, v6, v5

    .line 306
    aget-object v7, p2, v5

    invoke-direct {v7, p0, p1, p3}, Lorg/mozilla/javascript/optimizer/Block;->doTypeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[I)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 308
    aget-object v7, p2, v5

    iget-object v4, v7, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 309
    .local v4, "succ":[Lorg/mozilla/javascript/optimizer/Block;
    if-eqz v4, :cond_2

    .line 310
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v7, v4

    if-ge v1, v7, :cond_2

    .line 311
    aget-object v7, v4, v1

    iget v2, v7, Lorg/mozilla/javascript/optimizer/Block;->itsBlockID:I

    .line 312
    .local v2, "index":I
    aput-boolean v8, v6, v2

    .line 313
    if-ge v2, v5, :cond_1

    move v7, v8

    :goto_2
    or-int/2addr v3, v7

    .line 310
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    move v7, v9

    .line 313
    goto :goto_2

    .line 318
    .end local v1    # "i":I
    .end local v2    # "index":I
    .end local v4    # "succ":[Lorg/mozilla/javascript/optimizer/Block;
    :cond_2
    array-length v7, p2

    add-int/lit8 v7, v7, -0x1

    if-ne v5, v7, :cond_3

    .line 319
    if-eqz v3, :cond_4

    .line 320
    const/4 v5, 0x0

    .line 321
    const/4 v3, 0x0

    goto :goto_0

    .line 326
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 329
    :cond_4
    return-void
.end method

.method private updateEntrySet(Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;)Z
    .locals 2
    .param p1, "entrySet"    # Ljava/util/BitSet;
    .param p2, "exitSet"    # Ljava/util/BitSet;
    .param p3, "useBeforeDef"    # Ljava/util/BitSet;
    .param p4, "notDef"    # Ljava/util/BitSet;

    .prologue
    .line 446
    invoke-virtual {p1}, Ljava/util/BitSet;->cardinality()I

    move-result v0

    .line 447
    .local v0, "card":I
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 448
    invoke-virtual {p1, p4}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 449
    invoke-virtual {p1, p3}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 450
    invoke-virtual {p1}, Ljava/util/BitSet;->cardinality()I

    move-result v1

    if-eq v1, v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
