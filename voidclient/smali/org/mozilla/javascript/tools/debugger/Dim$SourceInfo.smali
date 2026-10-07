.class public Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
.super Ljava/lang/Object;
.source "Dim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/debugger/Dim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SourceInfo"
.end annotation


# static fields
.field private static final EMPTY_BOOLEAN_ARRAY:[Z


# instance fields
.field private breakableLines:[Z

.field private breakpoints:[Z

.field private functionSources:[Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

.field private source:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1346
    const/4 v0, 0x0

    new-array v0, v0, [Z

    sput-object v0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->EMPTY_BOOLEAN_ARRAY:[Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;[Lorg/mozilla/javascript/debug/DebuggableScript;Ljava/lang/String;)V
    .locals 22
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "functions"    # [Lorg/mozilla/javascript/debug/DebuggableScript;
    .param p3, "normilizedUrl"    # Ljava/lang/String;

    .prologue
    .line 1377
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1378
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->source:Ljava/lang/String;

    .line 1379
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url:Ljava/lang/String;

    .line 1381
    move-object/from16 v0, p2

    array-length v5, v0

    .line 1382
    .local v5, "N":I
    new-array v10, v5, [[I

    .line 1383
    .local v10, "lineArrays":[[I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-eq v7, v5, :cond_0

    .line 1384
    aget-object v18, p2, v7

    invoke-interface/range {v18 .. v18}, Lorg/mozilla/javascript/debug/DebuggableScript;->getLineNumbers()[I

    move-result-object v18

    aput-object v18, v10, v7

    .line 1383
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1387
    :cond_0
    const/16 v16, 0x0

    .local v16, "minAll":I
    const/4 v14, -0x1

    .line 1388
    .local v14, "maxAll":I
    new-array v6, v5, [I

    .line 1389
    .local v6, "firstLines":[I
    const/4 v7, 0x0

    :goto_1
    if-eq v7, v5, :cond_9

    .line 1390
    aget-object v11, v10, v7

    .line 1391
    .local v11, "lines":[I
    if-eqz v11, :cond_1

    array-length v0, v11

    move/from16 v18, v0

    if-nez v18, :cond_3

    .line 1392
    :cond_1
    const/16 v18, -0x1

    aput v18, v6, v7

    .line 1389
    :cond_2
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1395
    :cond_3
    const/16 v18, 0x0

    aget v13, v11, v18

    .local v13, "max":I
    move v15, v13

    .line 1396
    .local v15, "min":I
    const/4 v8, 0x1

    .local v8, "j":I
    :goto_3
    array-length v0, v11

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v8, v0, :cond_6

    .line 1397
    aget v9, v11, v8

    .line 1398
    .local v9, "line":I
    if-ge v9, v15, :cond_5

    .line 1399
    move v15, v9

    .line 1396
    :cond_4
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 1400
    :cond_5
    if-le v9, v13, :cond_4

    .line 1401
    move v13, v9

    goto :goto_4

    .line 1404
    .end local v9    # "line":I
    :cond_6
    aput v15, v6, v7

    .line 1405
    move/from16 v0, v16

    if-le v0, v14, :cond_7

    .line 1406
    move/from16 v16, v15

    .line 1407
    move v14, v13

    goto :goto_2

    .line 1409
    :cond_7
    move/from16 v0, v16

    if-ge v15, v0, :cond_8

    .line 1410
    move/from16 v16, v15

    .line 1412
    :cond_8
    if-le v13, v14, :cond_2

    .line 1413
    move v14, v13

    goto :goto_2

    .line 1419
    .end local v8    # "j":I
    .end local v11    # "lines":[I
    .end local v13    # "max":I
    .end local v15    # "min":I
    :cond_9
    move/from16 v0, v16

    if-le v0, v14, :cond_c

    .line 1421
    sget-object v18, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->EMPTY_BOOLEAN_ARRAY:[Z

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    .line 1422
    sget-object v18, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->EMPTY_BOOLEAN_ARRAY:[Z

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    .line 1441
    :cond_a
    new-array v0, v5, [Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->functionSources:[Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    .line 1442
    const/4 v7, 0x0

    :goto_5
    if-eq v7, v5, :cond_f

    .line 1443
    aget-object v18, p2, v7

    invoke-interface/range {v18 .. v18}, Lorg/mozilla/javascript/debug/DebuggableScript;->getFunctionName()Ljava/lang/String;

    move-result-object v17

    .line 1444
    .local v17, "name":Ljava/lang/String;
    if-nez v17, :cond_b

    .line 1445
    const-string v17, ""

    .line 1447
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->functionSources:[Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    move-object/from16 v18, v0

    new-instance v19, Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    aget v20, v6, v7

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, v20

    move-object/from16 v3, v17

    move-object/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;-><init>(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;ILjava/lang/String;Lorg/mozilla/javascript/tools/debugger/Dim$1;)V

    aput-object v19, v18, v7

    .line 1442
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 1424
    .end local v17    # "name":Ljava/lang/String;
    :cond_c
    if-gez v16, :cond_d

    .line 1426
    new-instance v18, Ljava/lang/IllegalStateException;

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 1428
    :cond_d
    add-int/lit8 v12, v14, 0x1

    .line 1429
    .local v12, "linesTop":I
    new-array v0, v12, [Z

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    .line 1430
    new-array v0, v12, [Z

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    .line 1431
    const/4 v7, 0x0

    :goto_6
    if-eq v7, v5, :cond_a

    .line 1432
    aget-object v11, v10, v7

    .line 1433
    .restart local v11    # "lines":[I
    if-eqz v11, :cond_e

    array-length v0, v11

    move/from16 v18, v0

    if-eqz v18, :cond_e

    .line 1434
    const/4 v8, 0x0

    .restart local v8    # "j":I
    :goto_7
    array-length v0, v11

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v8, v0, :cond_e

    .line 1435
    aget v9, v11, v8

    .line 1436
    .restart local v9    # "line":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    move-object/from16 v18, v0

    const/16 v19, 0x1

    aput-boolean v19, v18, v9

    .line 1434
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 1431
    .end local v8    # "j":I
    .end local v9    # "line":I
    :cond_e
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 1450
    .end local v11    # "lines":[I
    .end local v12    # "linesTop":I
    :cond_f
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;[Lorg/mozilla/javascript/debug/DebuggableScript;Ljava/lang/String;Lorg/mozilla/javascript/tools/debugger/Dim$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # [Lorg/mozilla/javascript/debug/DebuggableScript;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lorg/mozilla/javascript/tools/debugger/Dim$1;

    .prologue
    .line 1341
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;-><init>(Ljava/lang/String;[Lorg/mozilla/javascript/debug/DebuggableScript;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;
    .param p1, "x1"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    .line 1341
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->copyBreakpointsFrom(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V

    return-void
.end method

.method static synthetic access$2500(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)[Z
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    .line 1341
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    return-object v0
.end method

.method private copyBreakpointsFrom(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V
    .locals 4
    .param p1, "old"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    .line 1485
    iget-object v2, p1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v0, v2

    .line 1486
    .local v0, "end":I
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v2, v2

    if-le v0, v2, :cond_0

    .line 1487
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v0, v2

    .line 1489
    :cond_0
    const/4 v1, 0x0

    .local v1, "line":I
    :goto_0
    if-eq v1, v0, :cond_2

    .line 1490
    iget-object v2, p1, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_1

    .line 1491
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    const/4 v3, 0x1

    aput-boolean v3, v2, v1

    .line 1489
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1494
    :cond_2
    return-void
.end method


# virtual methods
.method public breakableLine(I)Z
    .locals 1
    .param p1, "line"    # I

    .prologue
    .line 1501
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public breakpoint(I)Z
    .locals 2
    .param p1, "line"    # I

    .prologue
    .line 1509
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1510
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1512
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v0, v0

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public breakpoint(IZ)Z
    .locals 3
    .param p1, "line"    # I
    .param p2, "value"    # Z

    .prologue
    .line 1519
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1520
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1523
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    monitor-enter v2

    .line 1524
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aget-boolean v1, v1, p1

    if-eq v1, p2, :cond_1

    .line 1525
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aput-boolean p2, v1, p1

    .line 1526
    const/4 v0, 0x1

    .line 1530
    .local v0, "changed":Z
    :goto_0
    monitor-exit v2

    .line 1531
    return v0

    .line 1528
    .end local v0    # "changed":Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "changed":Z
    goto :goto_0

    .line 1530
    .end local v0    # "changed":Z
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public functionSource(I)Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 1477
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->functionSources:[Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public functionSourcesTop()I
    .locals 1

    .prologue
    .line 1470
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->functionSources:[Lorg/mozilla/javascript/tools/debugger/Dim$FunctionSource;

    array-length v0, v0

    return v0
.end method

.method public removeAllBreakpoints()V
    .locals 4

    .prologue
    .line 1538
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    monitor-enter v2

    .line 1539
    const/4 v0, 0x0

    .local v0, "line":I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v1, v1

    if-eq v0, v1, :cond_0

    .line 1540
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    const/4 v3, 0x0

    aput-boolean v3, v1, v0

    .line 1539
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1542
    :cond_0
    monitor-exit v2

    .line 1543
    return-void

    .line 1542
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public source()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1456
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->source:Ljava/lang/String;

    return-object v0
.end method

.method public url()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1463
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url:Ljava/lang/String;

    return-object v0
.end method
