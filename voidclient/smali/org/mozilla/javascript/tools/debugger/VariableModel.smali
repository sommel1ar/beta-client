.class Lorg/mozilla/javascript/tools/debugger/VariableModel;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    }
.end annotation


# static fields
.field private static final CHILDLESS:[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

.field private static final cNames:[Ljava/lang/String;

.field private static final cTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field private debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

.field private root:Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2435
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, " Name"

    aput-object v1, v0, v2

    const-string v1, " Value"

    aput-object v1, v0, v3

    sput-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->cNames:[Ljava/lang/String;

    .line 2440
    new-array v0, v4, [Ljava/lang/Class;

    const-class v1, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    aput-object v1, v0, v2

    const-class v1, Ljava/lang/String;

    aput-object v1, v0, v3

    sput-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->cTypes:[Ljava/lang/Class;

    .line 2446
    new-array v0, v2, [Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    sput-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->CHILDLESS:[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2461
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2462
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/Dim;Ljava/lang/Object;)V
    .locals 2
    .param p1, "debugger"    # Lorg/mozilla/javascript/tools/debugger/Dim;
    .param p2, "scope"    # Ljava/lang/Object;

    .prologue
    .line 2467
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2468
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    .line 2469
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    const-string v1, "this"

    invoke-direct {v0, p2, v1}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->root:Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2470
    return-void
.end method

.method private children(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    .locals 6
    .param p1, "node"    # Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .prologue
    .line 2616
    invoke-static {p1}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;->access$000(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 2617
    invoke-static {p1}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;->access$000(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    move-result-object v0

    .line 2651
    :goto_0
    return-object v0

    .line 2622
    :cond_0
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/VariableModel;->getValue(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v3

    .line 2623
    .local v3, "value":Ljava/lang/Object;
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/tools/debugger/Dim;->getObjectIds(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    .line 2624
    .local v2, "ids":[Ljava/lang/Object;
    if-eqz v2, :cond_1

    array-length v4, v2

    if-nez v4, :cond_3

    .line 2625
    :cond_1
    sget-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->CHILDLESS:[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2650
    .local v0, "children":[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    :cond_2
    invoke-static {p1, v0}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;->access$002(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    goto :goto_0

    .line 2627
    .end local v0    # "children":[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    :cond_3
    new-instance v4, Lorg/mozilla/javascript/tools/debugger/VariableModel$1;

    invoke-direct {v4, p0}, Lorg/mozilla/javascript/tools/debugger/VariableModel$1;-><init>(Lorg/mozilla/javascript/tools/debugger/VariableModel;)V

    invoke-static {v2, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 2645
    array-length v4, v2

    new-array v0, v4, [Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2646
    .restart local v0    # "children":[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v4, v2

    if-eq v1, v4, :cond_2

    .line 2647
    new-instance v4, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    aget-object v5, v2, v1

    invoke-direct {v4, v3, v5}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    aput-object v4, v0, v1

    .line 2646
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public addTreeModelListener(Ljavax/swing/event/TreeModelListener;)V
    .locals 0
    .param p1, "l"    # Ljavax/swing/event/TreeModelListener;

    .prologue
    .line 2550
    return-void
.end method

.method public getChild(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 2
    .param p1, "nodeObj"    # Ljava/lang/Object;
    .param p2, "i"    # I

    .prologue
    .line 2499
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    if-nez v1, :cond_0

    .line 2500
    const/4 v1, 0x0

    .line 2503
    :goto_0
    return-object v1

    :cond_0
    move-object v0, p1

    .line 2502
    check-cast v0, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2503
    .local v0, "node":Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/debugger/VariableModel;->children(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    move-result-object v1

    aget-object v1, v1, p2

    goto :goto_0
.end method

.method public getChildCount(Ljava/lang/Object;)I
    .locals 2
    .param p1, "nodeObj"    # Ljava/lang/Object;

    .prologue
    .line 2488
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    if-nez v1, :cond_0

    .line 2489
    const/4 v1, 0x0

    .line 2492
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 2491
    check-cast v0, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2492
    .local v0, "node":Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/debugger/VariableModel;->children(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    move-result-object v1

    array-length v1, v1

    goto :goto_0
.end method

.method public getColumnClass(I)Ljava/lang/Class;
    .locals 1
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 2579
    sget-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->cTypes:[Ljava/lang/Class;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getColumnCount()I
    .locals 1

    .prologue
    .line 2565
    sget-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->cNames:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1
    .param p1, "column"    # I

    .prologue
    .line 2572
    sget-object v0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->cNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getIndexOfChild(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 6
    .param p1, "parentObj"    # Ljava/lang/Object;
    .param p2, "childObj"    # Ljava/lang/Object;

    .prologue
    const/4 v4, -0x1

    .line 2521
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    if-nez v5, :cond_1

    move v2, v4

    .line 2532
    :cond_0
    :goto_0
    return v2

    :cond_1
    move-object v3, p1

    .line 2524
    check-cast v3, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .local v3, "parent":Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    move-object v0, p2

    .line 2525
    check-cast v0, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2526
    .local v0, "child":Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/tools/debugger/VariableModel;->children(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    move-result-object v1

    .line 2527
    .local v1, "children":[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v1

    if-eq v2, v5, :cond_2

    .line 2528
    aget-object v5, v1, v2

    if-eq v5, v0, :cond_0

    .line 2527
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    move v2, v4

    .line 2532
    goto :goto_0
.end method

.method public getRoot()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 2478
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    if-nez v0, :cond_0

    .line 2479
    const/4 v0, 0x0

    .line 2481
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->root:Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    goto :goto_0
.end method

.method public getValue(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .prologue
    .line 2659
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-static {p1}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;->access$100(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;->access$200(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/mozilla/javascript/tools/debugger/Dim;->getObjectProperty(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 2661
    :goto_0
    return-object v1

    .line 2660
    :catch_0
    move-exception v0

    .line 2661
    .local v0, "exc":Ljava/lang/Exception;
    const-string v1, "undefined"

    goto :goto_0
.end method

.method public getValueAt(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 9
    .param p1, "nodeObj"    # Ljava/lang/Object;
    .param p2, "column"    # I

    .prologue
    const/4 v7, 0x0

    .line 2586
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    if-nez v8, :cond_0

    .line 2609
    :goto_0
    return-object v7

    :cond_0
    move-object v5, p1

    .line 2587
    check-cast v5, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2588
    .local v5, "node":Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 2590
    :pswitch_0
    invoke-virtual {v5}, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 2594
    :pswitch_1
    :try_start_0
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/tools/debugger/VariableModel;->getValue(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/mozilla/javascript/tools/debugger/Dim;->objectToString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 2598
    .local v6, "result":Ljava/lang/String;
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2599
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    .line 2600
    .local v4, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-ge v3, v4, :cond_2

    .line 2601
    invoke-virtual {v6, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 2602
    .local v1, "ch":C
    invoke-static {v1}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 2603
    const/16 v1, 0x20

    .line 2605
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2600
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2595
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v1    # "ch":C
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "result":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 2596
    .local v2, "exc":Ljava/lang/RuntimeException;
    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "result":Ljava/lang/String;
    goto :goto_1

    .line 2607
    .end local v2    # "exc":Ljava/lang/RuntimeException;
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 2588
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public isCellEditable(Ljava/lang/Object;I)Z
    .locals 1
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "column"    # I

    .prologue
    .line 2539
    if-nez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLeaf(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "nodeObj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 2510
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/VariableModel;->debugger:Lorg/mozilla/javascript/tools/debugger/Dim;

    if-nez v2, :cond_1

    .line 2514
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 2513
    check-cast v0, Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    .line 2514
    .local v0, "node":Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/debugger/VariableModel;->children(Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;)[Lorg/mozilla/javascript/tools/debugger/VariableModel$VariableNode;

    move-result-object v2

    array-length v2, v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0
.end method

.method public removeTreeModelListener(Ljavax/swing/event/TreeModelListener;)V
    .locals 0
    .param p1, "l"    # Ljavax/swing/event/TreeModelListener;

    .prologue
    .line 2555
    return-void
.end method

.method public setValueAt(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "node"    # Ljava/lang/Object;
    .param p3, "column"    # I

    .prologue
    .line 2545
    return-void
.end method

.method public valueForPathChanged(Ljavax/swing/tree/TreePath;Ljava/lang/Object;)V
    .locals 0
    .param p1, "path"    # Ljavax/swing/tree/TreePath;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 2557
    return-void
.end method
