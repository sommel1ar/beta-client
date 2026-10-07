.class Lorg/mozilla/javascript/optimizer/OptTransformer;
.super Lorg/mozilla/javascript/NodeTransformer;
.source "OptTransformer.java"


# instance fields
.field private directCallTargets:Lorg/mozilla/javascript/ObjArray;

.field private possibleDirectCalls:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/optimizer/OptFunctionNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;Lorg/mozilla/javascript/ObjArray;)V
    .locals 0
    .param p2, "directCallTargets"    # Lorg/mozilla/javascript/ObjArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/optimizer/OptFunctionNode;",
            ">;",
            "Lorg/mozilla/javascript/ObjArray;",
            ")V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "possibleDirectCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/optimizer/OptFunctionNode;>;"
    invoke-direct {p0}, Lorg/mozilla/javascript/NodeTransformer;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/OptTransformer;->possibleDirectCalls:Ljava/util/Map;

    .line 24
    iput-object p2, p0, Lorg/mozilla/javascript/optimizer/OptTransformer;->directCallTargets:Lorg/mozilla/javascript/ObjArray;

    .line 25
    return-void
.end method

.method private detectDirectCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 8
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 41
    invoke-virtual {p2}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v6

    const/16 v7, 0x6d

    if-ne v6, v7, :cond_3

    .line 42
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 45
    .local v3, "left":Lorg/mozilla/javascript/Node;
    const/4 v1, 0x0

    .line 46
    .local v1, "argCount":I
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 47
    .local v0, "arg":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 49
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 52
    :cond_0
    if-nez v1, :cond_1

    .line 53
    invoke-static {p2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v6

    const/4 v7, 0x1

    iput-boolean v7, v6, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->itsContainsCalls0:Z

    .line 68
    :cond_1
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptTransformer;->possibleDirectCalls:Ljava/util/Map;

    if-eqz v6, :cond_3

    .line 69
    const/4 v5, 0x0

    .line 70
    .local v5, "targetName":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x27

    if-ne v6, v7, :cond_4

    .line 71
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v5

    .line 77
    :cond_2
    :goto_1
    if-eqz v5, :cond_3

    .line 79
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptTransformer;->possibleDirectCalls:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .line 80
    .local v4, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    if-eqz v4, :cond_3

    iget-object v6, v4, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v6

    if-ne v1, v6, :cond_3

    iget-object v6, v4, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v6

    if-nez v6, :cond_3

    .line 87
    const/16 v6, 0x20

    if-gt v1, v6, :cond_3

    .line 88
    const/16 v6, 0x9

    invoke-virtual {p1, v6, v4}, Lorg/mozilla/javascript/Node;->putProp(ILjava/lang/Object;)V

    .line 89
    invoke-virtual {v4}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v6

    if-nez v6, :cond_3

    .line 90
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptTransformer;->directCallTargets:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v2

    .line 91
    .local v2, "index":I
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptTransformer;->directCallTargets:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 92
    invoke-virtual {v4, v2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->setDirectTargetIndex(I)V

    .line 99
    .end local v0    # "arg":Lorg/mozilla/javascript/Node;
    .end local v1    # "argCount":I
    .end local v2    # "index":I
    .end local v3    # "left":Lorg/mozilla/javascript/Node;
    .end local v4    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .end local v5    # "targetName":Ljava/lang/String;
    :cond_3
    return-void

    .line 72
    .restart local v0    # "arg":Lorg/mozilla/javascript/Node;
    .restart local v1    # "argCount":I
    .restart local v3    # "left":Lorg/mozilla/javascript/Node;
    .restart local v5    # "targetName":Ljava/lang/String;
    :cond_4
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x21

    if-ne v6, v7, :cond_5

    .line 73
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 74
    :cond_5
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x22

    if-ne v6, v7, :cond_2

    .line 75
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6
.end method


# virtual methods
.method protected visitCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/optimizer/OptTransformer;->detectDirectCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 36
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/NodeTransformer;->visitCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 37
    return-void
.end method

.method protected visitNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/optimizer/OptTransformer;->detectDirectCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 30
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/NodeTransformer;->visitNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 31
    return-void
.end method
