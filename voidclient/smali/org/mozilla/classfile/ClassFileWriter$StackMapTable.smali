.class final Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/classfile/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "StackMapTable"
.end annotation


# static fields
.field static final DEBUGSTACKMAP:Z


# instance fields
.field private locals:[I

.field private localsTop:I

.field private rawStackMap:[B

.field private rawStackMapTop:I

.field private stack:[I

.field private stackTop:I

.field private superBlockDeps:[Lorg/mozilla/classfile/SuperBlock;

.field private superBlocks:[Lorg/mozilla/classfile/SuperBlock;

.field final synthetic this$0:Lorg/mozilla/classfile/ClassFileWriter;

.field private wide:Z

.field private workList:[Lorg/mozilla/classfile/SuperBlock;

.field private workListTop:I


# direct methods
.method constructor <init>(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 1433
    iput-object p1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1434
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    .line 1435
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    .line 1436
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    .line 1437
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    .line 1438
    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    .line 1439
    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    .line 1440
    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    .line 1441
    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 1442
    iput-boolean v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    .line 1443
    return-void
.end method

.method private addToWorkList(Lorg/mozilla/classfile/SuperBlock;)V
    .locals 4
    .param p1, "sb"    # Lorg/mozilla/classfile/SuperBlock;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1841
    invoke-virtual {p1}, Lorg/mozilla/classfile/SuperBlock;->isInQueue()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1842
    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/SuperBlock;->setInQueue(Z)V

    .line 1843
    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/SuperBlock;->setInitialized(Z)V

    .line 1844
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 1845
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [Lorg/mozilla/classfile/SuperBlock;

    .line 1846
    .local v0, "tmp":[Lorg/mozilla/classfile/SuperBlock;
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1847
    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    .line 1849
    .end local v0    # "tmp":[Lorg/mozilla/classfile/SuperBlock;
    :cond_0
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    aput-object p1, v1, v2

    .line 1851
    :cond_1
    return-void
.end method

.method private clearStack()V
    .locals 1

    .prologue
    .line 2385
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    .line 2386
    return-void
.end method

.method private computeRawStackMap()V
    .locals 14

    .prologue
    const/4 v13, 0x3

    .line 2416
    iget-object v11, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    const/4 v12, 0x0

    aget-object v8, v11, v12

    .line 2417
    .local v8, "prev":Lorg/mozilla/classfile/SuperBlock;
    invoke-virtual {v8}, Lorg/mozilla/classfile/SuperBlock;->getTrimmedLocals()[I

    move-result-object v9

    .line 2418
    .local v9, "prevLocals":[I
    const/4 v10, -0x1

    .line 2419
    .local v10, "prevOffset":I
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    iget-object v11, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v11, v11

    if-ge v4, v11, :cond_9

    .line 2420
    iget-object v11, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    aget-object v0, v11, v4

    .line 2421
    .local v0, "current":Lorg/mozilla/classfile/SuperBlock;
    invoke-virtual {v0}, Lorg/mozilla/classfile/SuperBlock;->getTrimmedLocals()[I

    move-result-object v1

    .line 2422
    .local v1, "currentLocals":[I
    invoke-virtual {v0}, Lorg/mozilla/classfile/SuperBlock;->getStack()[I

    move-result-object v2

    .line 2423
    .local v2, "currentStack":[I
    invoke-virtual {v0}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v11

    sub-int/2addr v11, v10

    add-int/lit8 v7, v11, -0x1

    .line 2425
    .local v7, "offsetDelta":I
    array-length v11, v2

    if-nez v11, :cond_6

    .line 2426
    array-length v11, v9

    array-length v12, v1

    if-le v11, v12, :cond_1

    array-length v6, v1

    .line 2428
    .local v6, "last":I
    :goto_1
    array-length v11, v9

    array-length v12, v1

    sub-int/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 2433
    .local v3, "delta":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    if-ge v5, v6, :cond_0

    .line 2434
    aget v11, v9, v5

    aget v12, v1, v5

    if-eq v11, v12, :cond_2

    .line 2438
    :cond_0
    array-length v11, v1

    if-ne v5, v11, :cond_3

    if-nez v3, :cond_3

    .line 2441
    invoke-direct {p0, v1, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeSameFrame([II)V

    .line 2474
    .end local v3    # "delta":I
    .end local v5    # "j":I
    .end local v6    # "last":I
    :goto_3
    move-object v8, v0

    .line 2475
    move-object v9, v1

    .line 2476
    invoke-virtual {v0}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v10

    .line 2419
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2426
    :cond_1
    array-length v6, v9

    goto :goto_1

    .line 2433
    .restart local v3    # "delta":I
    .restart local v5    # "j":I
    .restart local v6    # "last":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 2442
    :cond_3
    array-length v11, v1

    if-ne v5, v11, :cond_4

    if-gt v3, v13, :cond_4

    .line 2445
    invoke-direct {p0, v3, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeChopFrame(II)V

    goto :goto_3

    .line 2446
    :cond_4
    array-length v11, v9

    if-ne v5, v11, :cond_5

    if-gt v3, v13, :cond_5

    .line 2449
    invoke-direct {p0, v1, v3, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeAppendFrame([III)V

    goto :goto_3

    .line 2453
    :cond_5
    invoke-direct {p0, v1, v2, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeFullFrame([I[II)V

    goto :goto_3

    .line 2456
    .end local v3    # "delta":I
    .end local v5    # "j":I
    .end local v6    # "last":I
    :cond_6
    array-length v11, v2

    const/4 v12, 0x1

    if-ne v11, v12, :cond_8

    .line 2457
    invoke-static {v9, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 2458
    invoke-direct {p0, v1, v2, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeSameLocalsOneStackItemFrame([I[II)V

    goto :goto_3

    .line 2464
    :cond_7
    invoke-direct {p0, v1, v2, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeFullFrame([I[II)V

    goto :goto_3

    .line 2471
    :cond_8
    invoke-direct {p0, v1, v2, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeFullFrame([I[II)V

    goto :goto_3

    .line 2478
    .end local v0    # "current":Lorg/mozilla/classfile/SuperBlock;
    .end local v1    # "currentLocals":[I
    .end local v2    # "currentStack":[I
    .end local v7    # "offsetDelta":I
    :cond_9
    return-void
.end method

.method private execute(I)I
    .locals 38
    .param p1, "bci"    # I

    .prologue
    .line 1860
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v35

    aget-byte v35, v35, p1

    move/from16 v0, v35

    and-int/lit16 v5, v0, 0xff

    .line 1862
    .local v5, "bc":I
    const/16 v17, 0x0

    .line 1866
    .local v17, "length":I
    packed-switch v5, :pswitch_data_0

    .line 2267
    :pswitch_0
    new-instance v35, Ljava/lang/IllegalArgumentException;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "bad opcode: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v35

    .line 1874
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1875
    add-int/lit8 v35, p1, 0x1

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2270
    :cond_0
    :goto_0
    :pswitch_2
    if-nez v17, :cond_1

    .line 2271
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    move/from16 v0, v35

    invoke-static {v5, v0}, Lorg/mozilla/classfile/ClassFileWriter;->opcodeLength(IZ)I

    move-result v17

    .line 2273
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_2

    const/16 v35, 0xc4

    move/from16 v0, v35

    if-eq v5, v0, :cond_2

    .line 2274
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    .line 2276
    :cond_2
    return v17

    .line 1885
    :pswitch_3
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1895
    :pswitch_4
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1908
    :pswitch_5
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    goto :goto_0

    .line 1911
    :pswitch_6
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop2()J

    goto :goto_0

    .line 1914
    :pswitch_7
    const/16 v35, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto :goto_0

    .line 1936
    :pswitch_8
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1946
    :pswitch_9
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1961
    :pswitch_a
    const/16 v35, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto :goto_0

    .line 1975
    :pswitch_b
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1980
    :pswitch_c
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1988
    :pswitch_d
    const/16 v35, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto :goto_0

    .line 1996
    :pswitch_e
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2001
    :pswitch_f
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2010
    :pswitch_10
    const/16 v35, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto :goto_0

    .line 2018
    :pswitch_11
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2023
    :pswitch_12
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2031
    :pswitch_13
    const/16 v35, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto :goto_0

    .line 2034
    :pswitch_14
    add-int/lit8 v36, p1, 0x1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_3

    const/16 v35, 0x2

    :goto_1
    move-object/from16 v0, p0

    move/from16 v1, v36

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    const/16 v36, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    :cond_3
    const/16 v35, 0x1

    goto :goto_1

    .line 2040
    :pswitch_15
    add-int/lit8 v35, v5, -0x3b

    const/16 v36, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    .line 2043
    :pswitch_16
    add-int/lit8 v36, p1, 0x1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_4

    const/16 v35, 0x2

    :goto_2
    move-object/from16 v0, p0

    move/from16 v1, v36

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    const/16 v36, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    :cond_4
    const/16 v35, 0x1

    goto :goto_2

    .line 2049
    :pswitch_17
    add-int/lit8 v35, v5, -0x3f

    const/16 v36, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    .line 2052
    :pswitch_18
    add-int/lit8 v36, p1, 0x1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_5

    const/16 v35, 0x2

    :goto_3
    move-object/from16 v0, p0

    move/from16 v1, v36

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    :cond_5
    const/16 v35, 0x1

    goto :goto_3

    .line 2058
    :pswitch_19
    add-int/lit8 v35, v5, -0x43

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    .line 2061
    :pswitch_1a
    add-int/lit8 v36, p1, 0x1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_6

    const/16 v35, 0x2

    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v36

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    const/16 v36, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    :cond_6
    const/16 v35, 0x1

    goto :goto_4

    .line 2067
    :pswitch_1b
    add-int/lit8 v35, v5, -0x47

    const/16 v36, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    goto/16 :goto_0

    .line 2070
    :pswitch_1c
    add-int/lit8 v36, p1, 0x1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_7

    const/16 v35, 0x2

    :goto_5
    move-object/from16 v0, p0

    move/from16 v1, v36

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeALoad(I)V

    goto/16 :goto_0

    :cond_7
    const/16 v35, 0x1

    goto :goto_5

    .line 2076
    :pswitch_1d
    add-int/lit8 v35, v5, -0x2a

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeALoad(I)V

    goto/16 :goto_0

    .line 2079
    :pswitch_1e
    add-int/lit8 v36, p1, 0x1

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    move/from16 v35, v0

    if-eqz v35, :cond_8

    const/16 v35, 0x2

    :goto_6
    move-object/from16 v0, p0

    move/from16 v1, v36

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeAStore(I)V

    goto/16 :goto_0

    :cond_8
    const/16 v35, 0x1

    goto :goto_6

    .line 2085
    :pswitch_1f
    add-int/lit8 v35, v5, -0x4b

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeAStore(I)V

    goto/16 :goto_0

    .line 2093
    :pswitch_20
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->clearStack()V

    goto/16 :goto_0

    .line 2096
    :pswitch_21
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v32

    .line 2097
    .local v32, "type":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->clearStack()V

    .line 2098
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2101
    .end local v32    # "type":I
    :pswitch_22
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v32

    .line 2102
    .restart local v32    # "type":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v33

    .line 2103
    .local v33, "type2":I
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2104
    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2109
    .end local v32    # "type":I
    .end local v33    # "type2":I
    :pswitch_23
    const/16 v35, 0x12

    move/from16 v0, v35

    if-ne v5, v0, :cond_9

    .line 2110
    add-int/lit8 v35, p1, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(I)I

    move-result v15

    .line 2114
    .local v15, "index":I
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ConstantPool;->getConstantType(I)B

    move-result v8

    .line 2115
    .local v8, "constType":B
    packed-switch v8, :pswitch_data_1

    .line 2133
    :pswitch_24
    new-instance v35, Ljava/lang/IllegalArgumentException;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "bad const type "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v35

    .line 2112
    .end local v8    # "constType":B
    .end local v15    # "index":I
    :cond_9
    add-int/lit8 v35, p1, 0x1

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v15

    .restart local v15    # "index":I
    goto :goto_7

    .line 2117
    .restart local v8    # "constType":B
    :pswitch_25
    const/16 v35, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2120
    :pswitch_26
    const/16 v35, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2123
    :pswitch_27
    const/16 v35, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2126
    :pswitch_28
    const/16 v35, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2129
    :pswitch_29
    const-string v35, "java/lang/String"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2138
    .end local v8    # "constType":B
    .end local v15    # "index":I
    :pswitch_2a
    invoke-static/range {p1 .. p1}, Lorg/mozilla/classfile/TypeInfo;->UNINITIALIZED_VARIABLE(I)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2141
    :pswitch_2b
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2142
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v35

    add-int/lit8 v36, p1, 0x1

    aget-byte v35, v35, v36

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$900(I)C

    move-result v7

    .line 2144
    .local v7, "componentType":C
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "["

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v15

    .line 2145
    .restart local v15    # "index":I
    int-to-short v0, v15

    move/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2148
    .end local v7    # "componentType":C
    .end local v15    # "index":I
    :pswitch_2c
    add-int/lit8 v35, p1, 0x1

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v15

    .line 2149
    .restart local v15    # "index":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 2150
    .local v6, "className":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2151
    new-instance v35, Ljava/lang/StringBuilder;

    invoke-direct/range {v35 .. v35}, Ljava/lang/StringBuilder;-><init>()V

    const-string v36, "[L"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    const/16 v36, 0x3b

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2158
    .end local v6    # "className":Ljava/lang/String;
    .end local v15    # "index":I
    :pswitch_2d
    add-int/lit8 v35, p1, 0x1

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v15

    .line 2159
    .restart local v15    # "index":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lorg/mozilla/classfile/FieldOrMethodRef;

    .line 2161
    .local v23, "m":Lorg/mozilla/classfile/FieldOrMethodRef;
    invoke-virtual/range {v23 .. v23}, Lorg/mozilla/classfile/FieldOrMethodRef;->getType()Ljava/lang/String;

    move-result-object v25

    .line 2162
    .local v25, "methodType":Ljava/lang/String;
    invoke-virtual/range {v23 .. v23}, Lorg/mozilla/classfile/FieldOrMethodRef;->getName()Ljava/lang/String;

    move-result-object v24

    .line 2163
    .local v24, "methodName":Ljava/lang/String;
    invoke-static/range {v25 .. v25}, Lorg/mozilla/classfile/ClassFileWriter;->access$1000(Ljava/lang/String;)I

    move-result v35

    ushr-int/lit8 v27, v35, 0x10

    .line 2164
    .local v27, "parameterCount":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_8
    move/from16 v0, v27

    if-ge v14, v0, :cond_a

    .line 2165
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2164
    add-int/lit8 v14, v14, 0x1

    goto :goto_8

    .line 2167
    :cond_a
    const/16 v35, 0xb8

    move/from16 v0, v35

    if-eq v5, v0, :cond_c

    .line 2168
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v16

    .line 2169
    .local v16, "instType":I
    invoke-static/range {v16 .. v16}, Lorg/mozilla/classfile/TypeInfo;->getTag(I)I

    move-result v31

    .line 2170
    .local v31, "tag":I
    const/16 v35, 0x0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/TypeInfo;->UNINITIALIZED_VARIABLE(I)I

    move-result v35

    move/from16 v0, v31

    move/from16 v1, v35

    if-eq v0, v1, :cond_b

    const/16 v35, 0x6

    move/from16 v0, v31

    move/from16 v1, v35

    if-ne v0, v1, :cond_c

    .line 2172
    :cond_b
    const-string v35, "<init>"

    move-object/from16 v0, v35

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-eqz v35, :cond_d

    .line 2173
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$1100(Lorg/mozilla/classfile/ClassFileWriter;)S

    move-result v35

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v26

    .line 2175
    .local v26, "newType":I
    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->initializeTypeInfo(II)V

    .line 2181
    .end local v16    # "instType":I
    .end local v26    # "newType":I
    .end local v31    # "tag":I
    :cond_c
    const/16 v35, 0x29

    move-object/from16 v0, v25

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v28

    .line 2182
    .local v28, "rParen":I
    add-int/lit8 v35, v28, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v29

    .line 2183
    .local v29, "returnType":Ljava/lang/String;
    invoke-static/range {v29 .. v29}, Lorg/mozilla/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 2184
    const-string v35, "V"

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-nez v35, :cond_0

    .line 2185
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-static {v0, v1}, Lorg/mozilla/classfile/TypeInfo;->fromType(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2177
    .end local v28    # "rParen":I
    .end local v29    # "returnType":Ljava/lang/String;
    .restart local v16    # "instType":I
    .restart local v31    # "tag":I
    :cond_d
    new-instance v35, Ljava/lang/IllegalStateException;

    const-string v36, "bad instance"

    invoke-direct/range {v35 .. v36}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v35

    .line 2189
    .end local v14    # "i":I
    .end local v15    # "index":I
    .end local v16    # "instType":I
    .end local v23    # "m":Lorg/mozilla/classfile/FieldOrMethodRef;
    .end local v24    # "methodName":Ljava/lang/String;
    .end local v25    # "methodType":Ljava/lang/String;
    .end local v27    # "parameterCount":I
    .end local v31    # "tag":I
    :pswitch_2e
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2191
    :pswitch_2f
    add-int/lit8 v35, p1, 0x1

    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v15

    .line 2192
    .restart local v15    # "index":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/mozilla/classfile/FieldOrMethodRef;

    .line 2194
    .local v11, "f":Lorg/mozilla/classfile/FieldOrMethodRef;
    invoke-virtual {v11}, Lorg/mozilla/classfile/FieldOrMethodRef;->getType()Ljava/lang/String;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 2195
    .local v12, "fieldType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-static {v12, v0}, Lorg/mozilla/classfile/TypeInfo;->fromType(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2198
    .end local v11    # "f":Lorg/mozilla/classfile/FieldOrMethodRef;
    .end local v12    # "fieldType":Ljava/lang/String;
    .end local v15    # "index":I
    :pswitch_30
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v32

    .line 2199
    .restart local v32    # "type":I
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2200
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2203
    .end local v32    # "type":I
    :pswitch_31
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v32

    .line 2204
    .restart local v32    # "type":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v33

    .line 2205
    .restart local v33    # "type2":I
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2206
    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2207
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2210
    .end local v32    # "type":I
    .end local v33    # "type2":I
    :pswitch_32
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v32

    .line 2211
    .restart local v32    # "type":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v18

    .line 2212
    .local v18, "lType":J
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2213
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2214
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2217
    .end local v18    # "lType":J
    .end local v32    # "type":I
    :pswitch_33
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v18

    .line 2218
    .restart local v18    # "lType":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2219
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    goto/16 :goto_0

    .line 2222
    .end local v18    # "lType":J
    :pswitch_34
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v18

    .line 2223
    .restart local v18    # "lType":J
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v32

    .line 2224
    .restart local v32    # "type":I
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2225
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2226
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    goto/16 :goto_0

    .line 2229
    .end local v18    # "lType":J
    .end local v32    # "type":I
    :pswitch_35
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v18

    .line 2230
    .restart local v18    # "lType":J
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v20

    .line 2231
    .local v20, "lType2":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2232
    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2233
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    goto/16 :goto_0

    .line 2236
    .end local v18    # "lType":J
    .end local v20    # "lType2":J
    :pswitch_36
    add-int/lit8 v35, p1, 0x1

    xor-int/lit8 v36, p1, -0x1

    and-int/lit8 v36, v36, 0x3

    add-int v30, v35, v36

    .line 2237
    .local v30, "switchStart":I
    add-int/lit8 v35, v30, 0x4

    const/16 v36, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v22

    .line 2238
    .local v22, "low":I
    add-int/lit8 v35, v30, 0x8

    const/16 v36, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v13

    .line 2239
    .local v13, "high":I
    sub-int v35, v13, v22

    add-int/lit8 v35, v35, 0x4

    mul-int/lit8 v35, v35, 0x4

    add-int v35, v35, v30

    sub-int v17, v35, p1

    .line 2240
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    goto/16 :goto_0

    .line 2243
    .end local v13    # "high":I
    .end local v22    # "low":I
    .end local v30    # "switchStart":I
    :pswitch_37
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2244
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v35

    ushr-int/lit8 v34, v35, 0x8

    .line 2245
    .local v34, "typeIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 2247
    .restart local v6    # "className":Ljava/lang/String;
    move-object v4, v6

    .line 2248
    .local v4, "arrayType":Ljava/lang/String;
    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    move-result v35

    const/16 v36, 0x5b

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_e

    .line 2249
    new-instance v35, Ljava/lang/IllegalStateException;

    const-string v36, "bad array type"

    invoke-direct/range {v35 .. v36}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v35

    .line 2251
    :cond_e
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 2252
    .local v9, "elementDesc":Ljava/lang/String;
    invoke-static {v9}, Lorg/mozilla/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2253
    .local v10, "elementType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v34

    .line 2254
    invoke-static/range {v34 .. v34}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v35

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_0

    .line 2258
    .end local v4    # "arrayType":Ljava/lang/String;
    .end local v6    # "className":Ljava/lang/String;
    .end local v9    # "elementDesc":Ljava/lang/String;
    .end local v10    # "elementType":Ljava/lang/String;
    .end local v34    # "typeIndex":I
    :pswitch_38
    const/16 v35, 0x1

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->wide:Z

    goto/16 :goto_0

    .line 1866
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_7
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_d
        :pswitch_d
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_13
        :pswitch_13
        :pswitch_a
        :pswitch_a
        :pswitch_23
        :pswitch_23
        :pswitch_23
        :pswitch_a
        :pswitch_d
        :pswitch_10
        :pswitch_13
        :pswitch_1c
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_37
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_14
        :pswitch_16
        :pswitch_18
        :pswitch_1a
        :pswitch_1e
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_22
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_8
        :pswitch_b
        :pswitch_8
        :pswitch_b
        :pswitch_8
        :pswitch_b
        :pswitch_8
        :pswitch_b
        :pswitch_8
        :pswitch_b
        :pswitch_8
        :pswitch_b
        :pswitch_2
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_9
        :pswitch_f
        :pswitch_12
        :pswitch_9
        :pswitch_c
        :pswitch_12
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_36
        :pswitch_0
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_2f
        :pswitch_5
        :pswitch_2e
        :pswitch_4
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_0
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_9
        :pswitch_21
        :pswitch_1
        :pswitch_9
        :pswitch_5
        :pswitch_5
        :pswitch_38
        :pswitch_0
        :pswitch_5
        :pswitch_5
        :pswitch_2
    .end packed-switch

    .line 2115
    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_28
        :pswitch_26
        :pswitch_27
        :pswitch_25
        :pswitch_24
        :pswitch_29
    .end packed-switch
.end method

.method private executeALoad(I)V
    .locals 5
    .param p1, "localIndex"    # I

    .prologue
    .line 2280
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getLocal(I)I

    move-result v1

    .line 2281
    .local v1, "type":I
    invoke-static {v1}, Lorg/mozilla/classfile/TypeInfo;->getTag(I)I

    move-result v0

    .line 2282
    .local v0, "tag":I
    const/4 v2, 0x7

    if-eq v0, v2, :cond_0

    const/4 v2, 0x6

    if-eq v0, v2, :cond_0

    const/16 v2, 0x8

    if-eq v0, v2, :cond_0

    const/4 v2, 0x5

    if-ne v0, v2, :cond_1

    .line 2286
    :cond_0
    invoke-direct {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2292
    return-void

    .line 2288
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad local variable type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " at index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private executeAStore(I)V
    .locals 1
    .param p1, "localIndex"    # I

    .prologue
    .line 2295
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->setLocal(II)V

    .line 2296
    return-void
.end method

.method private executeBlock(Lorg/mozilla/classfile/SuperBlock;)V
    .locals 26
    .param p1, "work"    # Lorg/mozilla/classfile/SuperBlock;

    .prologue
    .line 1720
    const/4 v8, 0x0

    .line 1721
    .local v8, "bc":I
    const/16 v20, 0x0

    .line 1730
    .local v20, "next":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v9

    .local v9, "bci":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getEnd()I

    move-result v3

    if-ge v9, v3, :cond_6

    .line 1731
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v3

    aget-byte v3, v3, v9

    and-int/lit16 v8, v3, 0xff

    .line 1732
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->execute(I)I

    move-result v20

    .line 1739
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->isBranch(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1740
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getBranchTarget(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v25

    .line 1751
    .local v25, "targetSB":Lorg/mozilla/classfile/SuperBlock;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->flowInto(Lorg/mozilla/classfile/SuperBlock;)V

    .line 1784
    .end local v25    # "targetSB":Lorg/mozilla/classfile/SuperBlock;
    :cond_0
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->access$400(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v3

    move/from16 v0, v17

    if-ge v0, v3, :cond_5

    .line 1785
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-result-object v3

    aget-object v13, v3, v17

    .line 1786
    .local v13, "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v4, v13, Lorg/mozilla/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v3

    int-to-short v0, v3

    move/from16 v23, v0

    .line 1787
    .local v23, "startPC":S
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v4, v13, Lorg/mozilla/classfile/ExceptionTableEntry;->itsEndLabel:I

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v3

    int-to-short v12, v3

    .line 1788
    .local v12, "endPC":S
    move/from16 v0, v23

    if-lt v9, v0, :cond_1

    if-lt v9, v12, :cond_3

    .line 1784
    :cond_1
    :goto_2
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 1758
    .end local v12    # "endPC":S
    .end local v13    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v17    # "i":I
    .end local v23    # "startPC":S
    :cond_2
    const/16 v3, 0xaa

    if-ne v8, v3, :cond_0

    .line 1759
    add-int/lit8 v3, v9, 0x1

    xor-int/lit8 v4, v9, -0x1

    and-int/lit8 v4, v4, 0x3

    add-int v24, v3, v4

    .line 1760
    .local v24, "switchStart":I
    const/4 v3, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1, v3}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v11

    .line 1761
    .local v11, "defaultOffset":I
    add-int v3, v9, v11

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v25

    .line 1767
    .restart local v25    # "targetSB":Lorg/mozilla/classfile/SuperBlock;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->flowInto(Lorg/mozilla/classfile/SuperBlock;)V

    .line 1768
    add-int/lit8 v3, v24, 0x4

    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v19

    .line 1769
    .local v19, "low":I
    add-int/lit8 v3, v24, 0x8

    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v16

    .line 1770
    .local v16, "high":I
    sub-int v3, v16, v19

    add-int/lit8 v22, v3, 0x1

    .line 1771
    .local v22, "numCases":I
    add-int/lit8 v10, v24, 0xc

    .line 1772
    .local v10, "caseBase":I
    const/16 v17, 0x0

    .restart local v17    # "i":I
    :goto_3
    move/from16 v0, v17

    move/from16 v1, v22

    if-ge v0, v1, :cond_0

    .line 1773
    mul-int/lit8 v3, v17, 0x4

    add-int/2addr v3, v10

    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v3

    add-int v18, v9, v3

    .line 1774
    .local v18, "label":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v25

    .line 1780
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->flowInto(Lorg/mozilla/classfile/SuperBlock;)V

    .line 1772
    add-int/lit8 v17, v17, 0x1

    goto :goto_3

    .line 1791
    .end local v10    # "caseBase":I
    .end local v11    # "defaultOffset":I
    .end local v16    # "high":I
    .end local v18    # "label":I
    .end local v19    # "low":I
    .end local v22    # "numCases":I
    .end local v24    # "switchStart":I
    .end local v25    # "targetSB":Lorg/mozilla/classfile/SuperBlock;
    .restart local v12    # "endPC":S
    .restart local v13    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .restart local v23    # "startPC":S
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v4, v13, Lorg/mozilla/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v3

    int-to-short v15, v3

    .line 1793
    .local v15, "handlerPC":S
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v2

    .line 1796
    .local v2, "sb":Lorg/mozilla/classfile/SuperBlock;
    iget-short v3, v13, Lorg/mozilla/classfile/ExceptionTableEntry;->itsCatchType:S

    if-nez v3, :cond_4

    .line 1797
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v3

    const-string v4, "java/lang/Throwable"

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v3

    invoke-static {v3}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v14

    .line 1802
    .local v14, "exceptionType":I
    :goto_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    move-object/from16 v0, p0

    iget v4, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput v14, v5, v6

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v7}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v7

    invoke-virtual/range {v2 .. v7}, Lorg/mozilla/classfile/SuperBlock;->merge([II[IILorg/mozilla/classfile/ConstantPool;)Z

    .line 1804
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->addToWorkList(Lorg/mozilla/classfile/SuperBlock;)V

    goto/16 :goto_2

    .line 1800
    .end local v14    # "exceptionType":I
    :cond_4
    iget-short v3, v13, Lorg/mozilla/classfile/ExceptionTableEntry;->itsCatchType:S

    invoke-static {v3}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v14

    .restart local v14    # "exceptionType":I
    goto :goto_4

    .line 1730
    .end local v2    # "sb":Lorg/mozilla/classfile/SuperBlock;
    .end local v12    # "endPC":S
    .end local v13    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v14    # "exceptionType":I
    .end local v15    # "handlerPC":S
    .end local v23    # "startPC":S
    :cond_5
    add-int v9, v9, v20

    goto/16 :goto_0

    .line 1817
    .end local v17    # "i":I
    :cond_6
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->isSuperBlockEnd(I)Z

    move-result v3

    if-nez v3, :cond_7

    .line 1818
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getIndex()I

    move-result v3

    add-int/lit8 v21, v3, 0x1

    .line 1819
    .local v21, "nextIndex":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v3, v3

    move/from16 v0, v21

    if-ge v0, v3, :cond_7

    .line 1825
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    aget-object v3, v3, v21

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->flowInto(Lorg/mozilla/classfile/SuperBlock;)V

    .line 1828
    .end local v21    # "nextIndex":I
    :cond_7
    return-void
.end method

.method private executeStore(II)V
    .locals 0
    .param p1, "localIndex"    # I
    .param p2, "typeInfo"    # I

    .prologue
    .line 2299
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2300
    invoke-direct {p0, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->setLocal(II)V

    .line 2301
    return-void
.end method

.method private executeWorkList()V
    .locals 3

    .prologue
    .line 1705
    :goto_0
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    if-lez v1, :cond_0

    .line 1706
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    aget-object v0, v1, v2

    .line 1707
    .local v0, "work":Lorg/mozilla/classfile/SuperBlock;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/SuperBlock;->setInQueue(Z)V

    .line 1708
    invoke-virtual {v0}, Lorg/mozilla/classfile/SuperBlock;->getLocals()[I

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    .line 1709
    invoke-virtual {v0}, Lorg/mozilla/classfile/SuperBlock;->getStack()[I

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    .line 1710
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    array-length v1, v1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    .line 1711
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    array-length v1, v1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    .line 1712
    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeBlock(Lorg/mozilla/classfile/SuperBlock;)V

    goto :goto_0

    .line 1714
    .end local v0    # "work":Lorg/mozilla/classfile/SuperBlock;
    :cond_0
    return-void
.end method

.method private flowInto(Lorg/mozilla/classfile/SuperBlock;)V
    .locals 6
    .param p1, "sb"    # Lorg/mozilla/classfile/SuperBlock;

    .prologue
    .line 1835
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v5

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/classfile/SuperBlock;->merge([II[IILorg/mozilla/classfile/ConstantPool;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1836
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->addToWorkList(Lorg/mozilla/classfile/SuperBlock;)V

    .line 1838
    :cond_0
    return-void
.end method

.method private getBranchTarget(I)Lorg/mozilla/classfile/SuperBlock;
    .locals 3
    .param p1, "bci"    # I

    .prologue
    .line 1555
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v1}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v1

    aget-byte v1, v1, p1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    .line 1556
    add-int/lit8 v1, p1, 0x1

    const/4 v2, 0x4

    invoke-direct {p0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v1

    add-int v0, p1, v1

    .line 1560
    .local v0, "target":I
    :goto_0
    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v1

    return-object v1

    .line 1558
    .end local v0    # "target":I
    :cond_0
    add-int/lit8 v1, p1, 0x1

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v1

    int-to-short v1, v1

    add-int v0, p1, v1

    .restart local v0    # "target":I
    goto :goto_0
.end method

.method private getLocal(I)I
    .locals 1
    .param p1, "localIndex"    # I

    .prologue
    .line 2323
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    if-ge p1, v0, :cond_0

    .line 2324
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    aget v0, v0, p1

    .line 2326
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getOperand(I)I
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 1594
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v0

    return v0
.end method

.method private getOperand(II)I
    .locals 5
    .param p1, "start"    # I
    .param p2, "size"    # I

    .prologue
    .line 1603
    const/4 v1, 0x0

    .line 1604
    .local v1, "result":I
    const/4 v2, 0x4

    if-le p2, v2, :cond_0

    .line 1605
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "bad operand size"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1607
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_1

    .line 1608
    shl-int/lit8 v2, v1, 0x8

    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v3

    add-int v4, p1, v0

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int v1, v2, v3

    .line 1607
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1610
    :cond_1
    return v1
.end method

.method private getSuperBlockDependencies()[Lorg/mozilla/classfile/SuperBlock;
    .locals 14

    .prologue
    .line 1526
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v12, v12

    new-array v3, v12, [Lorg/mozilla/classfile/SuperBlock;

    .line 1528
    .local v3, "deps":[Lorg/mozilla/classfile/SuperBlock;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v12}, Lorg/mozilla/classfile/ClassFileWriter;->access$400(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v12

    if-ge v7, v12, :cond_0

    .line 1529
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v12}, Lorg/mozilla/classfile/ClassFileWriter;->access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-result-object v12

    aget-object v4, v12, v7

    .line 1530
    .local v4, "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v13, v4, Lorg/mozilla/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v12

    int-to-short v8, v12

    .line 1531
    .local v8, "startPC":S
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v13, v4, Lorg/mozilla/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v12

    int-to-short v5, v12

    .line 1532
    .local v5, "handlerPC":S
    invoke-direct {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v6

    .line 1533
    .local v6, "handlerSB":Lorg/mozilla/classfile/SuperBlock;
    invoke-direct {p0, v8}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v2

    .line 1534
    .local v2, "dep":Lorg/mozilla/classfile/SuperBlock;
    invoke-virtual {v6}, Lorg/mozilla/classfile/SuperBlock;->getIndex()I

    move-result v12

    aput-object v2, v3, v12

    .line 1528
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1536
    .end local v2    # "dep":Lorg/mozilla/classfile/SuperBlock;
    .end local v4    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v5    # "handlerPC":S
    .end local v6    # "handlerSB":Lorg/mozilla/classfile/SuperBlock;
    .end local v8    # "startPC":S
    :cond_0
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v12}, Lorg/mozilla/classfile/ClassFileWriter;->access$600(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/javascript/UintMap;

    move-result-object v12

    invoke-virtual {v12}, Lorg/mozilla/javascript/UintMap;->getKeys()[I

    move-result-object v10

    .line 1537
    .local v10, "targetPCs":[I
    const/4 v7, 0x0

    :goto_1
    array-length v12, v10

    if-ge v7, v12, :cond_1

    .line 1538
    aget v9, v10, v7

    .line 1539
    .local v9, "targetPC":I
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v12}, Lorg/mozilla/classfile/ClassFileWriter;->access$600(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/javascript/UintMap;

    move-result-object v12

    const/4 v13, -0x1

    invoke-virtual {v12, v9, v13}, Lorg/mozilla/javascript/UintMap;->getInt(II)I

    move-result v0

    .line 1540
    .local v0, "branchPC":I
    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v1

    .line 1541
    .local v1, "branchSB":Lorg/mozilla/classfile/SuperBlock;
    invoke-direct {p0, v9}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v11

    .line 1542
    .local v11, "targetSB":Lorg/mozilla/classfile/SuperBlock;
    invoke-virtual {v11}, Lorg/mozilla/classfile/SuperBlock;->getIndex()I

    move-result v12

    aput-object v1, v3, v12

    .line 1537
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1545
    .end local v0    # "branchPC":I
    .end local v1    # "branchSB":Lorg/mozilla/classfile/SuperBlock;
    .end local v9    # "targetPC":I
    .end local v11    # "targetSB":Lorg/mozilla/classfile/SuperBlock;
    :cond_1
    return-object v3
.end method

.method private getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;
    .locals 5
    .param p1, "offset"    # I

    .prologue
    .line 1486
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 1487
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    aget-object v1, v2, v0

    .line 1488
    .local v1, "sb":Lorg/mozilla/classfile/SuperBlock;
    if-nez v1, :cond_1

    .line 1494
    .end local v1    # "sb":Lorg/mozilla/classfile/SuperBlock;
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad offset: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1490
    .restart local v1    # "sb":Lorg/mozilla/classfile/SuperBlock;
    :cond_1
    invoke-virtual {v1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v2

    if-lt p1, v2, :cond_2

    invoke-virtual {v1}, Lorg/mozilla/classfile/SuperBlock;->getEnd()I

    move-result v2

    if-ge p1, v2, :cond_2

    .line 1491
    return-object v1

    .line 1486
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getWorstCaseWriteSize()I
    .locals 3

    .prologue
    .line 2488
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v1}, Lorg/mozilla/classfile/ClassFileWriter;->access$1300(Lorg/mozilla/classfile/ClassFileWriter;)S

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    add-int/lit8 v1, v1, 0x7

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v2}, Lorg/mozilla/classfile/ClassFileWriter;->access$1400(Lorg/mozilla/classfile/ClassFileWriter;)S

    move-result v2

    mul-int/lit8 v2, v2, 0x3

    add-int/2addr v1, v2

    mul-int/2addr v0, v1

    return v0
.end method

.method private initializeTypeInfo(II)V
    .locals 2
    .param p1, "prevType"    # I
    .param p2, "newType"    # I

    .prologue
    .line 2309
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->initializeTypeInfo(II[II)V

    .line 2310
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->initializeTypeInfo(II[II)V

    .line 2311
    return-void
.end method

.method private initializeTypeInfo(II[II)V
    .locals 2
    .param p1, "prevType"    # I
    .param p2, "newType"    # I
    .param p3, "data"    # [I
    .param p4, "dataTop"    # I

    .prologue
    .line 2315
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_1

    .line 2316
    aget v1, p3, v0

    if-ne v1, p1, :cond_0

    .line 2317
    aput p2, p3, v0

    .line 2315
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2320
    :cond_1
    return-void
.end method

.method private isBranch(I)Z
    .locals 1
    .param p1, "opcode"    # I

    .prologue
    .line 1568
    sparse-switch p1, :sswitch_data_0

    .line 1589
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 1587
    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 1568
    nop

    :sswitch_data_0
    .sparse-switch
        0x99 -> :sswitch_0
        0x9a -> :sswitch_0
        0x9b -> :sswitch_0
        0x9c -> :sswitch_0
        0x9d -> :sswitch_0
        0x9e -> :sswitch_0
        0x9f -> :sswitch_0
        0xa0 -> :sswitch_0
        0xa1 -> :sswitch_0
        0xa2 -> :sswitch_0
        0xa3 -> :sswitch_0
        0xa4 -> :sswitch_0
        0xa5 -> :sswitch_0
        0xa6 -> :sswitch_0
        0xa7 -> :sswitch_0
        0xc6 -> :sswitch_0
        0xc7 -> :sswitch_0
        0xc8 -> :sswitch_0
    .end sparse-switch
.end method

.method private isSuperBlockEnd(I)Z
    .locals 1
    .param p1, "opcode"    # I

    .prologue
    .line 1502
    sparse-switch p1, :sswitch_data_0

    .line 1515
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 1513
    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 1502
    nop

    :sswitch_data_0
    .sparse-switch
        0xa7 -> :sswitch_0
        0xaa -> :sswitch_0
        0xab -> :sswitch_0
        0xac -> :sswitch_0
        0xad -> :sswitch_0
        0xae -> :sswitch_0
        0xb0 -> :sswitch_0
        0xb1 -> :sswitch_0
        0xbf -> :sswitch_0
        0xc8 -> :sswitch_0
    .end sparse-switch
.end method

.method private killSuperBlock(Lorg/mozilla/classfile/SuperBlock;)V
    .locals 15
    .param p1, "sb"    # Lorg/mozilla/classfile/SuperBlock;

    .prologue
    .line 1657
    const/4 v0, 0x0

    new-array v1, v0, [I

    .line 1658
    .local v1, "locals":[I
    const/4 v0, 0x1

    new-array v3, v0, [I

    const/4 v0, 0x0

    const-string v2, "java/lang/Throwable"

    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v4

    invoke-static {v2, v4}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v2

    aput v2, v3, v0

    .line 1665
    .local v3, "stack":[I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$400(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v0

    if-ge v13, v0, :cond_2

    .line 1666
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-result-object v0

    aget-object v8, v0, v13

    .line 1667
    .local v8, "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v2, v8, Lorg/mozilla/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v10

    .line 1668
    .local v10, "eteStart":I
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v2, v8, Lorg/mozilla/classfile/ExceptionTableEntry;->itsEndLabel:I

    invoke-virtual {v0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v9

    .line 1669
    .local v9, "eteEnd":I
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v2, v8, Lorg/mozilla/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {v0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v11

    .line 1670
    .local v11, "handlerPC":I
    invoke-direct {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lorg/mozilla/classfile/SuperBlock;

    move-result-object v12

    .line 1671
    .local v12, "handlerSB":Lorg/mozilla/classfile/SuperBlock;
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v0

    if-le v0, v10, :cond_0

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v0

    if-lt v0, v9, :cond_1

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v0

    if-le v10, v0, :cond_3

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getEnd()I

    move-result v0

    if-ge v10, v0, :cond_3

    invoke-virtual {v12}, Lorg/mozilla/classfile/SuperBlock;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1674
    :cond_1
    invoke-virtual {v12}, Lorg/mozilla/classfile/SuperBlock;->getLocals()[I

    move-result-object v1

    .line 1682
    .end local v8    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v9    # "eteEnd":I
    .end local v10    # "eteStart":I
    .end local v11    # "handlerPC":I
    .end local v12    # "handlerSB":Lorg/mozilla/classfile/SuperBlock;
    :cond_2
    const/4 v13, 0x0

    :goto_1
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$400(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v0

    if-ge v13, v0, :cond_6

    .line 1683
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-result-object v0

    aget-object v8, v0, v13

    .line 1684
    .restart local v8    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    iget v2, v8, Lorg/mozilla/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v10

    .line 1685
    .restart local v10    # "eteStart":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v0

    if-ne v10, v0, :cond_5

    .line 1686
    add-int/lit8 v14, v13, 0x1

    .local v14, "j":I
    :goto_2
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$400(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v0

    if-ge v14, v0, :cond_4

    .line 1687
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-result-object v0

    add-int/lit8 v2, v14, -0x1

    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-result-object v4

    aget-object v4, v4, v14

    aput-object v4, v0, v2

    .line 1686
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 1665
    .end local v14    # "j":I
    .restart local v9    # "eteEnd":I
    .restart local v11    # "handlerPC":I
    .restart local v12    # "handlerSB":Lorg/mozilla/classfile/SuperBlock;
    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 1689
    .end local v9    # "eteEnd":I
    .end local v11    # "handlerPC":I
    .end local v12    # "handlerSB":Lorg/mozilla/classfile/SuperBlock;
    .restart local v14    # "j":I
    :cond_4
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$410(Lorg/mozilla/classfile/ClassFileWriter;)I

    .line 1690
    add-int/lit8 v13, v13, -0x1

    .line 1682
    .end local v14    # "j":I
    :cond_5
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 1694
    .end local v8    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v10    # "eteStart":I
    :cond_6
    array-length v2, v1

    array-length v4, v3

    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/classfile/SuperBlock;->merge([II[IILorg/mozilla/classfile/ConstantPool;)Z

    .line 1697
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getEnd()I

    move-result v0

    add-int/lit8 v7, v0, -0x1

    .line 1698
    .local v7, "end":I
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v0

    const/16 v2, -0x41

    aput-byte v2, v0, v7

    .line 1699
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/SuperBlock;->getStart()I

    move-result v6

    .local v6, "bci":I
    :goto_3
    if-ge v6, v7, :cond_7

    .line 1700
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B

    move-result-object v0

    const/4 v2, 0x0

    aput-byte v2, v0, v6

    .line 1699
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1702
    :cond_7
    return-void
.end method

.method private pop()I
    .locals 2

    .prologue
    .line 2350
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    aget v0, v0, v1

    return v0
.end method

.method private pop2()J
    .locals 6

    .prologue
    .line 2376
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    int-to-long v0, v2

    .line 2377
    .local v0, "type":J
    long-to-int v2, v0

    invoke-static {v2}, Lorg/mozilla/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2380
    .end local v0    # "type":J
    :goto_0
    return-wide v0

    .restart local v0    # "type":J
    :cond_0
    const/16 v2, 0x20

    shl-long v2, v0, v2

    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v4

    const v5, 0xffffff

    and-int/2addr v4, v5

    int-to-long v4, v4

    or-long v0, v2, v4

    goto :goto_0
.end method

.method private push(I)V
    .locals 4
    .param p1, "typeInfo"    # I

    .prologue
    const/4 v3, 0x0

    .line 2341
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 2342
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    mul-int/lit8 v1, v1, 0x2

    const/4 v2, 0x4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v0, v1, [I

    .line 2343
    .local v0, "tmp":[I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2344
    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    .line 2346
    .end local v0    # "tmp":[I
    :cond_0
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    aput p1, v1, v2

    .line 2347
    return-void
.end method

.method private push2(J)V
    .locals 5
    .param p1, "typeInfo"    # J

    .prologue
    const-wide/32 v2, 0xffffff

    .line 2360
    and-long v0, p1, v2

    long-to-int v0, v0

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2361
    const/16 v0, 0x20

    ushr-long/2addr p1, v0

    .line 2362
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 2363
    and-long v0, p1, v2

    long-to-int v0, v0

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2365
    :cond_0
    return-void
.end method

.method private setLocal(II)V
    .locals 4
    .param p1, "localIndex"    # I
    .param p2, "typeInfo"    # I

    .prologue
    const/4 v3, 0x0

    .line 2331
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    if-lt p1, v1, :cond_0

    .line 2332
    add-int/lit8 v1, p1, 0x1

    new-array v0, v1, [I

    .line 2333
    .local v0, "tmp":[I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2334
    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    .line 2335
    add-int/lit8 v1, p1, 0x1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    .line 2337
    .end local v0    # "tmp":[I
    :cond_0
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->locals:[I

    aput p2, v1, p1

    .line 2338
    return-void
.end method

.method private verify()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 1618
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->access$100(Lorg/mozilla/classfile/ClassFileWriter;)[I

    move-result-object v1

    .line 1619
    .local v1, "initialLocals":[I
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    aget-object v0, v0, v4

    array-length v2, v1

    new-array v3, v4, [I

    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v5}, Lorg/mozilla/classfile/ClassFileWriter;->access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/classfile/SuperBlock;->merge([II[IILorg/mozilla/classfile/ConstantPool;)Z

    .line 1624
    new-array v0, v8, [Lorg/mozilla/classfile/SuperBlock;

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    aget-object v2, v2, v4

    aput-object v2, v0, v4

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workList:[Lorg/mozilla/classfile/SuperBlock;

    .line 1625
    iput v8, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    .line 1626
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeWorkList()V

    .line 1629
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v0, v0

    if-ge v6, v0, :cond_1

    .line 1630
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    aget-object v7, v0, v6

    .line 1631
    .local v7, "sb":Lorg/mozilla/classfile/SuperBlock;
    invoke-virtual {v7}, Lorg/mozilla/classfile/SuperBlock;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1632
    invoke-direct {p0, v7}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->killSuperBlock(Lorg/mozilla/classfile/SuperBlock;)V

    .line 1629
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1635
    .end local v7    # "sb":Lorg/mozilla/classfile/SuperBlock;
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->executeWorkList()V

    .line 1636
    return-void
.end method

.method private writeAppendFrame([III)V
    .locals 4
    .param p1, "locals"    # [I
    .param p2, "localsDelta"    # I
    .param p3, "offsetDelta"    # I

    .prologue
    .line 2540
    array-length v1, p1

    sub-int v0, v1, p2

    .line 2541
    .local v0, "start":I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit16 v3, p2, 0xfb

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 2542
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {p3, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2543
    invoke-direct {p0, p1, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeTypes([II)I

    move-result v1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2544
    return-void
.end method

.method private writeChopFrame(II)V
    .locals 3
    .param p1, "localsDelta"    # I
    .param p2, "offsetDelta"    # I

    .prologue
    .line 2547
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    rsub-int v2, p1, 0xfb

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 2548
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {p2, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2549
    return-void
.end method

.method private writeFullFrame([I[II)V
    .locals 3
    .param p1, "locals"    # [I
    .param p2, "stack"    # [I
    .param p3, "offsetDelta"    # I

    .prologue
    .line 2528
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/4 v2, -0x1

    aput-byte v2, v0, v1

    .line 2529
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {p3, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2530
    array-length v0, p1

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2532
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeTypes([I)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2533
    array-length v0, p2

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2535
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeTypes([I)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2536
    return-void
.end method

.method private writeSameFrame([II)V
    .locals 3
    .param p1, "locals"    # [I
    .param p2, "offsetDelta"    # I

    .prologue
    .line 2493
    const/16 v0, 0x3f

    if-gt p2, v0, :cond_0

    .line 2497
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 2505
    :goto_0
    return-void

    .line 2501
    :cond_0
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/4 v2, -0x5

    aput-byte v2, v0, v1

    .line 2502
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {p2, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    goto :goto_0
.end method

.method private writeSameLocalsOneStackItemFrame([I[II)V
    .locals 3
    .param p1, "locals"    # [I
    .param p2, "stack"    # [I
    .param p3, "offsetDelta"    # I

    .prologue
    .line 2510
    const/16 v0, 0x3f

    if-gt p3, v0, :cond_0

    .line 2514
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, p3, 0x40

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 2523
    :goto_0
    const/4 v0, 0x0

    aget v0, p2, v0

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeType(I)I

    .line 2524
    return-void

    .line 2519
    :cond_0
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/16 v2, -0x9

    aput-byte v2, v0, v1

    .line 2520
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {p3, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    goto :goto_0
.end method

.method private writeType(I)I
    .locals 4
    .param p1, "type"    # I

    .prologue
    .line 2564
    and-int/lit16 v0, p1, 0xff

    .line 2565
    .local v0, "tag":I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 2566
    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 2568
    :cond_0
    ushr-int/lit8 v1, p1, 0x8

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v3, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2571
    :cond_1
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    return v1
.end method

.method private writeTypes([I)I
    .locals 1
    .param p1, "types"    # [I

    .prologue
    .line 2552
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeTypes([II)I

    move-result v0

    return v0
.end method

.method private writeTypes([II)I
    .locals 3
    .param p1, "types"    # [I
    .param p2, "start"    # I

    .prologue
    .line 2556
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2557
    .local v1, "startOffset":I
    move v0, p2

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 2558
    aget v2, p1, v0

    invoke-direct {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->writeType(I)I

    move-result v2

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2557
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2560
    :cond_0
    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    return v2
.end method


# virtual methods
.method computeWriteSize()I
    .locals 2

    .prologue
    .line 2399
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getWorstCaseWriteSize()I

    move-result v0

    .line 2400
    .local v0, "writeSize":I
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    .line 2401
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->computeRawStackMap()V

    .line 2402
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v1, v1, 0x2

    return v1
.end method

.method generate()V
    .locals 6

    .prologue
    .line 1446
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$000(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v4

    new-array v4, v4, [Lorg/mozilla/classfile/SuperBlock;

    iput-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    .line 1447
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$100(Lorg/mozilla/classfile/ClassFileWriter;)[I

    move-result-object v2

    .line 1449
    .local v2, "initialLocals":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$000(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 1450
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$200(Lorg/mozilla/classfile/ClassFileWriter;)[I

    move-result-object v4

    aget v3, v4, v1

    .line 1452
    .local v3, "start":I
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$000(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v1, v4, :cond_0

    .line 1453
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$300(Lorg/mozilla/classfile/ClassFileWriter;)I

    move-result v0

    .line 1457
    .local v0, "end":I
    :goto_1
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    new-instance v5, Lorg/mozilla/classfile/SuperBlock;

    invoke-direct {v5, v1, v3, v0, v2}, Lorg/mozilla/classfile/SuperBlock;-><init>(III[I)V

    aput-object v5, v4, v1

    .line 1449
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1455
    .end local v0    # "end":I
    :cond_0
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->this$0:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/classfile/ClassFileWriter;->access$200(Lorg/mozilla/classfile/ClassFileWriter;)[I

    move-result-object v4

    add-int/lit8 v5, v1, 0x1

    aget v0, v4, v5

    .restart local v0    # "end":I
    goto :goto_1

    .line 1470
    .end local v0    # "end":I
    .end local v3    # "start":I
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->getSuperBlockDependencies()[Lorg/mozilla/classfile/SuperBlock;

    move-result-object v4

    iput-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlockDeps:[Lorg/mozilla/classfile/SuperBlock;

    .line 1472
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->verify()V

    .line 1483
    return-void
.end method

.method write([BI)I
    .locals 3
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 2406
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v0, v0, 0x2

    invoke-static {v0, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result p2

    .line 2407
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lorg/mozilla/classfile/SuperBlock;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 2408
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2409
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/2addr v0, p2

    return v0
.end method
