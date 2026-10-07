.class Lorg/mozilla/javascript/optimizer/BodyCodegen;
.super Ljava/lang/Object;
.source "Codegen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;,
        Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ECMAERROR_EXCEPTION:I = 0x2

.field private static final EVALUATOR_EXCEPTION:I = 0x1

.field private static final EXCEPTION_MAX:I = 0x5

.field private static final FINALLY_EXCEPTION:I = 0x4

.field static final GENERATOR_START:I = 0x0

.field static final GENERATOR_TERMINATE:I = -0x1

.field static final GENERATOR_YIELD_START:I = 0x1

.field private static final JAVASCRIPT_EXCEPTION:I = 0x0

.field private static final MAX_LOCALS:I = 0x400

.field private static final THROWABLE_EXCEPTION:I = 0x3


# instance fields
.field private argsLocal:S

.field cfw:Lorg/mozilla/classfile/ClassFileWriter;

.field codegen:Lorg/mozilla/javascript/optimizer/Codegen;

.field compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

.field private contextLocal:S

.field private enterAreaStartLabel:I

.field private epilogueLabel:I

.field private exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

.field private finallys:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/mozilla/javascript/Node;",
            "Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;",
            ">;"
        }
    .end annotation
.end field

.field private firstFreeLocal:S

.field private fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

.field private funObjLocal:S

.field private generatorStateLocal:S

.field private generatorSwitch:I

.field private hasVarsInRegs:Z

.field private inDirectCallFunction:Z

.field private inLocalBlock:Z

.field private isGenerator:Z

.field private itsForcedObjectParameters:Z

.field private itsLineNumber:I

.field private itsOneArgArray:S

.field private itsZeroArgArray:S

.field private literals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/Node;",
            ">;"
        }
    .end annotation
.end field

.field private locals:[I

.field private localsMax:S

.field private maxLocals:I

.field private maxStack:I

.field private operationLocal:S

.field private popvLocal:S

.field private savedCodeOffset:I

.field scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

.field public scriptOrFnIndex:I

.field private thisObjLocal:S

.field private varRegisters:[S

.field private variableObjectLocal:S


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1254
    const-class v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4153
    new-instance v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;-><init>(Lorg/mozilla/javascript/optimizer/BodyCodegen;)V

    iput-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    .line 5485
    iput v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxLocals:I

    .line 5486
    iput v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxStack:I

    .line 5491
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/optimizer/BodyCodegen;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/optimizer/BodyCodegen;
    .param p1, "x1"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 1254
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getFinallyAtTarget(Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/mozilla/javascript/optimizer/BodyCodegen;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/optimizer/BodyCodegen;
    .param p1, "x1"    # I

    .prologue
    .line 1254
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionTypeToName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addDoubleWrap()V
    .locals 2

    .prologue
    .line 5352
    const-string v0, "wrapDouble"

    const-string v1, "(D)Ljava/lang/Double;"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5353
    return-void
.end method

.method private addGoto(Lorg/mozilla/javascript/Node;I)V
    .locals 2
    .param p1, "target"    # Lorg/mozilla/javascript/Node;
    .param p2, "jumpcode"    # I

    .prologue
    .line 5293
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v0

    .line 5294
    .local v0, "targetLabel":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5295
    return-void
.end method

.method private addGotoWithReturn(Lorg/mozilla/javascript/Node;)V
    .locals 4
    .param p1, "target"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3016
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;

    .line 3017
    .local v0, "ret":Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 3018
    const/16 v2, 0xa7

    invoke-direct {p0, p1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addGoto(Lorg/mozilla/javascript/Node;I)V

    .line 3019
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 3020
    .local v1, "retLabel":I
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3021
    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3022
    return-void
.end method

.method private addInstructionCount()V
    .locals 3

    .prologue
    .line 4348
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v1

    iget v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->savedCodeOffset:I

    sub-int v0, v1, v2

    .line 4352
    .local v0, "count":I
    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount(I)V

    .line 4353
    return-void
.end method

.method private addInstructionCount(I)V
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 4364
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4365
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 4366
    const-string v0, "addInstructionCount"

    const-string v1, "(Lorg/mozilla/javascript/Context;I)V"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4369
    return-void
.end method

.method private addJumpedBooleanWrap(II)V
    .locals 6
    .param p1, "trueLabel"    # I
    .param p2, "falseLabel"    # I

    .prologue
    const/16 v5, 0xb2

    .line 5338
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5339
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5340
    .local v0, "skip":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-string v2, "java/lang/Boolean"

    const-string v3, "FALSE"

    const-string v4, "Ljava/lang/Boolean;"

    invoke-virtual {v1, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5342
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xa7

    invoke-virtual {v1, v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5343
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5344
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-string v2, "java/lang/Boolean"

    const-string v3, "TRUE"

    const-string v4, "Ljava/lang/Boolean;"

    invoke-virtual {v1, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5346
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5347
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->adjustStackTop(I)V

    .line 5348
    return-void
.end method

.method private addLoadPropertyIds([Ljava/lang/Object;I)V
    .locals 4
    .param p1, "properties"    # [Ljava/lang/Object;
    .param p2, "count"    # I

    .prologue
    .line 3133
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3134
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, p2, :cond_1

    .line 3135
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3136
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3137
    aget-object v1, p1, v0

    .line 3138
    .local v1, "id":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 3139
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    check-cast v1, Ljava/lang/String;

    .end local v1    # "id":Ljava/lang/Object;
    invoke-virtual {v2, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3144
    :goto_1
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0x53

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3134
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3141
    .restart local v1    # "id":Ljava/lang/Object;
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "id":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3142
    const-string v2, "wrapInt"

    const-string v3, "(I)Ljava/lang/Integer;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 3146
    :cond_1
    return-void
.end method

.method private addLoadPropertyValues(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;I)V
    .locals 10
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "count"    # I

    .prologue
    const/16 v9, 0xa3

    const/16 v8, 0x98

    const/16 v7, 0x97

    const/16 v6, 0x5f

    const/16 v5, 0x53

    .line 3150
    iget-boolean v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v3, :cond_3

    .line 3152
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, p3, :cond_2

    .line 3153
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    .line 3154
    .local v1, "childType":I
    if-eq v1, v7, :cond_0

    if-eq v1, v8, :cond_0

    if-ne v1, v9, :cond_1

    .line 3155
    :cond_0
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3159
    :goto_1
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    .line 3152
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3157
    :cond_1
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_1

    .line 3161
    .end local v1    # "childType":I
    :cond_2
    invoke-direct {p0, p3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3162
    const/4 v2, 0x0

    :goto_2
    if-eq v2, p3, :cond_6

    .line 3163
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0x5a

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3164
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3165
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    sub-int v4, p3, v2

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3166
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3167
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3162
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 3170
    .end local v2    # "i":I
    :cond_3
    invoke-direct {p0, p3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3171
    move-object v0, p2

    .line 3172
    .local v0, "child2":Lorg/mozilla/javascript/Node;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    if-eq v2, p3, :cond_6

    .line 3173
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0x59

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3174
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3175
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    .line 3176
    .restart local v1    # "childType":I
    if-eq v1, v7, :cond_4

    if-eq v1, v8, :cond_4

    if-ne v1, v9, :cond_5

    .line 3177
    :cond_4
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3181
    :goto_4
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3182
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3172
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 3179
    :cond_5
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_4

    .line 3185
    .end local v0    # "child2":Lorg/mozilla/javascript/Node;
    .end local v1    # "childType":I
    :cond_6
    return-void
.end method

.method private addNewObjectArray(I)V
    .locals 5
    .param p1, "size"    # I

    .prologue
    .line 5304
    if-nez p1, :cond_1

    .line 5305
    iget-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsZeroArgArray:S

    if-ltz v0, :cond_0

    .line 5306
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsZeroArgArray:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5316
    :goto_0
    return-void

    .line 5308
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb2

    const-string v2, "org/mozilla/javascript/ScriptRuntime"

    const-string v3, "emptyArgs"

    const-string v4, "[Ljava/lang/Object;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5313
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 5314
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xbd

    const-string v2, "java/lang/Object"

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    goto :goto_0
.end method

.method private addObjectToDouble()V
    .locals 2

    .prologue
    .line 5299
    const-string v0, "toNumber"

    const-string v1, "(Ljava/lang/Object;)D"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5300
    return-void
.end method

.method private addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "methodSignature"    # Ljava/lang/String;

    .prologue
    .line 5330
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb8

    const-string v2, "org/mozilla/javascript/optimizer/OptRuntime"

    invoke-virtual {v0, v1, v2, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5334
    return-void
.end method

.method private addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "methodSignature"    # Ljava/lang/String;

    .prologue
    .line 5321
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb8

    const-string v2, "org.mozilla.javascript.ScriptRuntime"

    invoke-virtual {v0, v1, v2, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5325
    return-void
.end method

.method private dcpLoadAsNumber(I)V
    .locals 8
    .param p1, "dcp_register"    # I

    .prologue
    .line 5255
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5256
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xb2

    const-string v5, "java/lang/Void"

    const-string v6, "TYPE"

    const-string v7, "Ljava/lang/Class;"

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5260
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 5261
    .local v1, "isNumberLabel":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xa5

    invoke-virtual {v3, v4, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5262
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v2

    .line 5263
    .local v2, "stack":S
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5264
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 5265
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5266
    .local v0, "beyond":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5267
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5268
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 5269
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5270
    return-void
.end method

.method private dcpLoadAsObject(I)V
    .locals 8
    .param p1, "dcp_register"    # I

    .prologue
    .line 5274
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5275
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xb2

    const-string v5, "java/lang/Void"

    const-string v6, "TYPE"

    const-string v7, "Ljava/lang/Class;"

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5279
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 5280
    .local v1, "isNumberLabel":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xa5

    invoke-virtual {v3, v4, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5281
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v2

    .line 5282
    .local v2, "stack":S
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5283
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5284
    .local v0, "beyond":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5285
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5286
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 5287
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 5288
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5289
    return-void
.end method

.method private decReferenceWordLocal(S)V
    .locals 2
    .param p1, "local"    # S

    .prologue
    .line 5431
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 5432
    return-void
.end method

.method private exceptionTypeToName(I)Ljava/lang/String;
    .locals 1
    .param p1, "exceptionType"    # I

    .prologue
    .line 3906
    if-nez p1, :cond_0

    .line 3907
    const-string v0, "org/mozilla/javascript/JavaScriptException"

    .line 3915
    :goto_0
    return-object v0

    .line 3908
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 3909
    const-string v0, "org/mozilla/javascript/EvaluatorException"

    goto :goto_0

    .line 3910
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 3911
    const-string v0, "org/mozilla/javascript/EcmaError"

    goto :goto_0

    .line 3912
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    .line 3913
    const-string v0, "java/lang/Throwable"

    goto :goto_0

    .line 3914
    :cond_3
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    .line 3915
    const/4 v0, 0x0

    goto :goto_0

    .line 3917
    :cond_4
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private genSimpleCompare(III)V
    .locals 4
    .param p1, "type"    # I
    .param p2, "trueGOTO"    # I
    .param p3, "falseGOTO"    # I

    .prologue
    const/16 v3, 0x98

    const/16 v1, 0x97

    const/4 v2, -0x1

    .line 4639
    if-ne p2, v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 4640
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 4658
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 4642
    :pswitch_0
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4643
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x9e

    invoke-virtual {v0, v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4661
    :goto_0
    if-eq p3, v2, :cond_1

    .line 4662
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p3}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4663
    :cond_1
    return-void

    .line 4646
    :pswitch_1
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4647
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x9c

    invoke-virtual {v0, v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 4650
    :pswitch_2
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4651
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x9b

    invoke-virtual {v0, v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 4654
    :pswitch_3
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4655
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x9d

    invoke-virtual {v0, v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 4640
    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method private generateActivationExit()V
    .locals 2

    .prologue
    .line 1833
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1834
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1835
    const-string v0, "exitActivationFunction"

    const-string v1, "(Lorg/mozilla/javascript/Context;)V"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1837
    return-void
.end method

.method private generateArrayLiteralFactory(Lorg/mozilla/javascript/Node;I)V
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "count"    # I

    .prologue
    .line 3025
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3026
    .local v0, "methodName":Ljava/lang/String;
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 3027
    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v2, v1, 0x1

    int-to-short v2, v2

    iput-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    .line 3028
    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 3029
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-string v2, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 3035
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitArrayLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3036
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xb0

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3037
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    add-int/lit8 v2, v2, 0x1

    int-to-short v2, v2

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 3038
    return-void
.end method

.method private generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V
    .locals 10
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "argChild"    # Lorg/mozilla/javascript/Node;
    .param p3, "directCall"    # Z

    .prologue
    const/16 v9, 0x59

    .line 3565
    const/4 v0, 0x0

    .line 3566
    .local v0, "argCount":I
    move-object v1, p2

    .local v1, "child":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v1, :cond_0

    .line 3567
    add-int/lit8 v0, v0, 0x1

    .line 3566
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    goto :goto_0

    .line 3570
    :cond_0
    const/4 v6, 0x1

    if-ne v0, v6, :cond_4

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsOneArgArray:S

    if-ltz v6, :cond_4

    .line 3571
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsOneArgArray:S

    invoke-virtual {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3576
    :goto_1
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    if-eq v4, v0, :cond_7

    .line 3580
    iget-boolean v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v6, :cond_1

    .line 3581
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3582
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3585
    :cond_1
    if-nez p3, :cond_5

    .line 3586
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3609
    :cond_2
    :goto_3
    iget-boolean v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v6, :cond_3

    .line 3610
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v5

    .line 3611
    .local v5, "tempLocal":S
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 3612
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v7, 0xc0

    const-string v8, "[Ljava/lang/Object;"

    invoke-virtual {v6, v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3613
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3614
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3615
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3616
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 3619
    .end local v5    # "tempLocal":S
    :cond_3
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v7, 0x53

    invoke-virtual {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3621
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    .line 3576
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 3573
    .end local v4    # "i":I
    :cond_4
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addNewObjectArray(I)V

    goto :goto_1

    .line 3593
    .restart local v4    # "i":I
    :cond_5
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 3594
    .local v3, "dcp_register":I
    if-ltz v3, :cond_6

    .line 3595
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    goto :goto_3

    .line 3597
    :cond_6
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3598
    const/16 v6, 0x8

    const/4 v7, -0x1

    invoke-virtual {p2, v6, v7}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v2

    .line 3600
    .local v2, "childNumberFlag":I
    if-nez v2, :cond_2

    .line 3601
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto :goto_3

    .line 3623
    .end local v2    # "childNumberFlag":I
    .end local v3    # "dcp_register":I
    :cond_7
    return-void
.end method

.method private generateCatchBlock(ISIII)V
    .locals 3
    .param p1, "exceptionType"    # I
    .param p2, "savedVariableObject"    # S
    .param p3, "catchLabel"    # I
    .param p4, "exceptionLocal"    # I
    .param p5, "handler"    # I

    .prologue
    .line 3887
    if-nez p5, :cond_0

    .line 3888
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result p5

    .line 3890
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p5}, Lorg/mozilla/classfile/ClassFileWriter;->markHandler(I)V

    .line 3893
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p4}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 3896
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3897
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 3899
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionTypeToName(I)Ljava/lang/String;

    move-result-object v0

    .line 3901
    .local v0, "exceptionName":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xa7

    invoke-virtual {v1, v2, p3}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 3902
    return-void
.end method

.method private generateCheckForThrowOrClose(IZI)V
    .locals 6
    .param p1, "label"    # I
    .param p2, "hasLocals"    # Z
    .param p3, "nextState"    # I

    .prologue
    const/16 v5, 0x9f

    .line 2866
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 2867
    .local v1, "throwLabel":I
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 2870
    .local v0, "closeLabel":I
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2871
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2872
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateThrowJavaScriptException()V

    .line 2875
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2876
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2877
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0xc0

    const-string v4, "java/lang/Throwable"

    invoke-virtual {v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2878
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0xbf

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2882
    const/4 v2, -0x1

    if-eq p1, v2, :cond_0

    .line 2883
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, p1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2884
    :cond_0
    if-nez p2, :cond_1

    .line 2886
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorSwitch:I

    invoke-virtual {v2, v3, p3}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(II)V

    .line 2890
    :cond_1
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->operationLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 2891
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2892
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v5, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2893
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->operationLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 2894
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2895
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v5, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2896
    return-void
.end method

.method private generateEpilogue()V
    .locals 21

    .prologue
    .line 1721
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v17

    if-eqz v17, :cond_0

    .line 1722
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1723
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v17, v0

    if-eqz v17, :cond_5

    .line 1725
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v17, v0

    check-cast v17, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ast/FunctionNode;->getLiveLocals()Ljava/util/Map;

    move-result-object v11

    .line 1726
    .local v11, "liveLocals":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/Node;[I>;"
    if-eqz v11, :cond_3

    .line 1727
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v17, v0

    check-cast v17, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v14

    .line 1728
    .local v14, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/Node;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v7, v0, :cond_3

    .line 1729
    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/mozilla/javascript/Node;

    .line 1730
    .local v13, "node":Lorg/mozilla/javascript/Node;
    invoke-interface {v11, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [I

    .line 1731
    .local v10, "live":[I
    if-eqz v10, :cond_2

    .line 1732
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorSwitch:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNextGeneratorState(Lorg/mozilla/javascript/Node;)I

    move-result v19

    invoke-virtual/range {v17 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(II)V

    .line 1734
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateGetGeneratorLocalsState()V

    .line 1735
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    array-length v0, v10

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v9, v0, :cond_1

    .line 1736
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0x59

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1737
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1738
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0x32

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1739
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    aget v18, v10, v9

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1735
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 1741
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0x57

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1742
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0xa7

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v19

    invoke-virtual/range {v17 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 1728
    .end local v9    # "j":I
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 1748
    .end local v7    # "i":I
    .end local v10    # "live":[I
    .end local v13    # "node":Lorg/mozilla/javascript/Node;
    .end local v14    # "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/Node;>;"
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    move-object/from16 v17, v0

    if-eqz v17, :cond_5

    .line 1749
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/Node;

    .line 1750
    .local v12, "n":Lorg/mozilla/javascript/Node;
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v17

    const/16 v18, 0x7d

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_4

    .line 1751
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;

    .line 1753
    .local v15, "ret":Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    iget v0, v15, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    move/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v17 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 1756
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    iget-object v0, v15, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    invoke-virtual/range {v17 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v16

    .line 1758
    .local v16, "startSwitch":I
    const/4 v4, 0x0

    .line 1759
    .local v4, "c":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 1760
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_2
    iget-object v0, v15, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v7, v0, :cond_4

    .line 1762
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(II)V

    .line 1763
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0xa7

    iget-object v0, v15, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 1765
    add-int/lit8 v4, v4, 0x1

    .line 1760
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1772
    .end local v4    # "c":I
    .end local v7    # "i":I
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v11    # "liveLocals":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/Node;[I>;"
    .end local v12    # "n":Lorg/mozilla/javascript/Node;
    .end local v15    # "ret":Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
    .end local v16    # "startSwitch":I
    :cond_5
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_6

    .line 1773
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 1776
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    move/from16 v17, v0

    if-eqz v17, :cond_7

    .line 1777
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0xb0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1823
    :goto_3
    return-void

    .line 1779
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v17, v0

    if-eqz v17, :cond_9

    .line 1780
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v17, v0

    check-cast v17, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v17

    if-eqz v17, :cond_8

    .line 1781
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorSwitch:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 1785
    :cond_8
    const/16 v17, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateSetGeneratorResumptionPoint(I)V

    .line 1788
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1789
    const-string v17, "throwStopIteration"

    const-string v18, "(Ljava/lang/Object;)V"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1792
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 1793
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0xb0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_3

    .line 1795
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v17, v0

    if-nez v17, :cond_a

    .line 1796
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1797
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0xb0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_3

    .line 1799
    :cond_a
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateActivationExit()V

    .line 1800
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0xb0

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1805
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v6

    .line 1806
    .local v6, "finallyHandler":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->markHandler(I)V

    .line 1807
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v5

    .line 1808
    .local v5, "exceptionObject":S
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1812
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateActivationExit()V

    .line 1814
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1815
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 1817
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    const/16 v18, 0xbf

    invoke-virtual/range {v17 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1820
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->enterAreaStartLabel:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    move/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v6, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addExceptionHandler(IIILjava/lang/String;)V

    goto/16 :goto_3
.end method

.method private generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 42
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 2163
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v35

    .line 2164
    .local v35, "type":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 2165
    .local v6, "child":Lorg/mozilla/javascript/Node;
    packed-switch v35, :pswitch_data_0

    .line 2805
    :pswitch_0
    new-instance v37, Ljava/lang/RuntimeException;

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "Unexpected node type "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-direct/range {v37 .. v38}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v37

    .line 2170
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v37, v0

    if-nez v37, :cond_0

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v37

    const/16 v38, 0x88

    move/from16 v0, v37

    move/from16 v1, v38

    if-eq v0, v1, :cond_2

    .line 2171
    :cond_0
    const/16 v37, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v12

    .line 2172
    .local v12, "fnIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-static {v0, v12}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;I)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v23

    .line 2174
    .local v23, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v31

    .line 2175
    .local v31, "t":I
    const/16 v37, 0x2

    move/from16 v0, v31

    move/from16 v1, v37

    if-eq v0, v1, :cond_1

    .line 2176
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v37

    throw v37

    .line 2178
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitFunction(Lorg/mozilla/javascript/optimizer/OptFunctionNode;I)V

    .line 2808
    .end local v12    # "fnIndex":I
    .end local v23    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .end local v31    # "t":I
    :cond_2
    :goto_0
    :pswitch_2
    return-void

    .line 2184
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2185
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2186
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2187
    const-string v37, "name"

    const-string v38, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2199
    :pswitch_4
    const/16 v37, 0xa

    const/16 v38, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v29

    .line 2201
    .local v29, "specialType":I
    if-nez v29, :cond_5

    .line 2203
    const/16 v37, 0x9

    move-object/from16 v0, p1

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .line 2206
    .local v32, "target":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    if-eqz v32, :cond_3

    .line 2207
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v32

    move/from16 v3, v35

    invoke-direct {v0, v1, v2, v3, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitOptimizedCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/optimizer/OptFunctionNode;ILorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 2208
    :cond_3
    const/16 v37, 0x26

    move/from16 v0, v35

    move/from16 v1, v37

    if-ne v0, v1, :cond_4

    .line 2209
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitStandardCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 2211
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitStandardNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 2214
    .end local v32    # "target":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v35

    move/from16 v3, v29

    invoke-direct {v0, v1, v2, v3, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSpecialCall(Lorg/mozilla/javascript/Node;IILorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2220
    .end local v29    # "specialType":I
    :pswitch_5
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2222
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 2223
    const/16 v37, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    invoke-direct {v0, v1, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 2224
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2225
    const-string v37, "callRef"

    const-string v38, "(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Ref;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2236
    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getDouble()D

    move-result-wide v24

    .line 2237
    .local v24, "num":D
    const/16 v37, 0x8

    const/16 v38, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v37

    const/16 v38, -0x1

    move/from16 v0, v37

    move/from16 v1, v38

    if-eq v0, v1, :cond_6

    .line 2238
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-wide/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    goto/16 :goto_0

    .line 2240
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v38, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-wide/from16 v2, v24

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/optimizer/Codegen;->pushNumberAsObject(Lorg/mozilla/classfile/ClassFileWriter;D)V

    goto/16 :goto_0

    .line 2246
    .end local v24    # "num":D
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2250
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto/16 :goto_0

    .line 2254
    :pswitch_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x2a

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_0

    .line 2258
    :pswitch_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x1

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_0

    .line 2262
    :pswitch_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xb2

    const-string v39, "java/lang/Boolean"

    const-string v40, "TRUE"

    const-string v41, "Ljava/lang/Boolean;"

    invoke-virtual/range {v37 .. v41}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2267
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xb2

    const-string v39, "java/lang/Boolean"

    const-string v40, "FALSE"

    const-string v41, "Ljava/lang/Boolean;"

    invoke-virtual/range {v37 .. v41}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2274
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2275
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2276
    const/16 v37, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v13

    .line 2277
    .local v13, "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xb2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v41, v0

    move-object/from16 v0, v40

    move-object/from16 v1, v41

    invoke-virtual {v0, v1, v13}, Lorg/mozilla/javascript/optimizer/Codegen;->getCompiledRegexpName(Lorg/mozilla/javascript/ast/ScriptNode;I)Ljava/lang/String;

    move-result-object v40

    const-string v41, "Ljava/lang/Object;"

    invoke-virtual/range {v37 .. v41}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2280
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xb8

    const-string v39, "org/mozilla/javascript/ScriptRuntime"

    const-string v40, "wrapRegExp"

    const-string v41, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual/range {v37 .. v41}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2291
    .end local v13    # "i":I
    :pswitch_e
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v22

    .line 2292
    .local v22, "next":Lorg/mozilla/javascript/Node;
    :goto_1
    if-eqz v22, :cond_7

    .line 2293
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2294
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x57

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2295
    move-object/from16 v6, v22

    .line 2296
    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v22

    goto :goto_1

    .line 2298
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2304
    .end local v22    # "next":Lorg/mozilla/javascript/Node;
    :pswitch_f
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I

    move-result v19

    .line 2305
    .local v19, "local":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2306
    const/16 v37, 0x3d

    move/from16 v0, v35

    move/from16 v1, v37

    if-ne v0, v1, :cond_8

    .line 2307
    const-string v37, "enumNext"

    const-string v38, "(Ljava/lang/Object;)Ljava/lang/Boolean;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2310
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2311
    const-string v37, "enumId"

    const-string v38, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2320
    .end local v19    # "local":I
    :pswitch_10
    const/16 v37, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    invoke-direct {v0, v1, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitArrayLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_0

    .line 2324
    :pswitch_11
    const/16 v37, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    invoke-direct {v0, v1, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitObjectLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_0

    .line 2328
    :pswitch_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v34

    .line 2329
    .local v34, "trueTarget":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v11

    .line 2330
    .local v11, "falseTarget":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2331
    .local v5, "beyond":I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v34

    invoke-direct {v0, v6, v1, v2, v11}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    .line 2333
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2334
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xb2

    const-string v39, "java/lang/Boolean"

    const-string v40, "FALSE"

    const-string v41, "Ljava/lang/Boolean;"

    invoke-virtual/range {v37 .. v41}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2336
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xa7

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v1, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2337
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-virtual {v0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2338
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xb2

    const-string v39, "java/lang/Boolean"

    const-string v40, "TRUE"

    const-string v41, "Ljava/lang/Boolean;"

    invoke-virtual/range {v37 .. v41}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2340
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2341
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, -0x1

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->adjustStackTop(I)V

    goto/16 :goto_0

    .line 2346
    .end local v5    # "beyond":I
    .end local v11    # "falseTarget":I
    .end local v34    # "trueTarget":I
    :pswitch_13
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2347
    const-string v37, "toInt32"

    const-string v38, "(Ljava/lang/Object;)I"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2348
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, -0x1

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 2349
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x82

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2350
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x87

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2351
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto/16 :goto_0

    .line 2355
    :pswitch_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2356
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x57

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2357
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-static/range {v37 .. v37}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    goto/16 :goto_0

    .line 2361
    :pswitch_15
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2362
    const-string v37, "typeof"

    const-string v38, "(Ljava/lang/Object;)Ljava/lang/String;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2368
    :pswitch_16
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitTypeofname(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2373
    :pswitch_17
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitIncDec(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2378
    :pswitch_18
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2379
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x59

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2380
    const-string v37, "toBoolean"

    const-string v38, "(Ljava/lang/Object;)Z"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2382
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v11

    .line 2383
    .restart local v11    # "falseTarget":I
    const/16 v37, 0x69

    move/from16 v0, v35

    move/from16 v1, v37

    if-ne v0, v1, :cond_9

    .line 2384
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x99

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v1, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2387
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x57

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2388
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v37

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2389
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-virtual {v0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    goto/16 :goto_0

    .line 2386
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x9a

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v1, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_2

    .line 2394
    .end local v11    # "falseTarget":I
    :pswitch_19
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v15

    .line 2395
    .local v15, "ifThen":Lorg/mozilla/javascript/Node;
    invoke-virtual {v15}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v14

    .line 2396
    .local v14, "ifElse":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2397
    const-string v37, "toBoolean"

    const-string v38, "(Ljava/lang/Object;)Z"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2399
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v7

    .line 2400
    .local v7, "elseTarget":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x99

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v1, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2401
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v30

    .line 2402
    .local v30, "stack":S
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2403
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    .line 2404
    .local v4, "afterHook":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0xa7

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2405
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v30

    invoke-virtual {v0, v7, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 2406
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v14, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2407
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    goto/16 :goto_0

    .line 2412
    .end local v4    # "afterHook":I
    .end local v7    # "elseTarget":I
    .end local v14    # "ifElse":Lorg/mozilla/javascript/Node;
    .end local v15    # "ifThen":Lorg/mozilla/javascript/Node;
    .end local v30    # "stack":S
    :pswitch_1a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2413
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v37

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2414
    const/16 v37, 0x8

    const/16 v38, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v37

    packed-switch v37, :pswitch_data_1

    .line 2427
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v37

    const/16 v38, 0x29

    move/from16 v0, v37

    move/from16 v1, v38

    if-ne v0, v1, :cond_a

    .line 2428
    const-string v37, "add"

    const-string v38, "(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/CharSequence;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2416
    :pswitch_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x63

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_0

    .line 2419
    :pswitch_1c
    const-string v37, "add"

    const-string v38, "(DLjava/lang/Object;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2423
    :pswitch_1d
    const-string v37, "add"

    const-string v38, "(Ljava/lang/Object;D)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2432
    :cond_a
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v37

    const/16 v38, 0x29

    move/from16 v0, v37

    move/from16 v1, v38

    if-ne v0, v1, :cond_b

    .line 2433
    const-string v37, "add"

    const-string v38, "(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2438
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2439
    const-string v37, "add"

    const-string v38, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2450
    :pswitch_1e
    const/16 v37, 0x6b

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v6, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitArithmetic(Lorg/mozilla/javascript/Node;ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2454
    :pswitch_1f
    const/16 v37, 0x67

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v6, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitArithmetic(Lorg/mozilla/javascript/Node;ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2459
    :pswitch_20
    const/16 v37, 0x18

    move/from16 v0, v35

    move/from16 v1, v37

    if-ne v0, v1, :cond_c

    const/16 v37, 0x6f

    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v6, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitArithmetic(Lorg/mozilla/javascript/Node;ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    :cond_c
    const/16 v37, 0x73

    goto :goto_3

    .line 2470
    :pswitch_21
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v35

    invoke-direct {v0, v1, v2, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitBitOp(Lorg/mozilla/javascript/Node;ILorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2475
    :pswitch_22
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2476
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 2477
    const/16 v37, 0x1d

    move/from16 v0, v35

    move/from16 v1, v37

    if-ne v0, v1, :cond_d

    .line 2478
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x77

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2480
    :cond_d
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto/16 :goto_0

    .line 2485
    :pswitch_23
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2486
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    goto/16 :goto_0

    .line 2491
    :pswitch_24
    const/16 v26, -0x1

    .line 2492
    .local v26, "prop":I
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v37

    const/16 v38, 0x28

    move/from16 v0, v37

    move/from16 v1, v38

    if-ne v0, v1, :cond_e

    .line 2493
    const/16 v37, 0x8

    const/16 v38, -0x1

    move/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v6, v0, v1}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v26

    .line 2495
    :cond_e
    const/16 v37, -0x1

    move/from16 v0, v26

    move/from16 v1, v37

    if-eq v0, v1, :cond_f

    .line 2496
    const/16 v37, 0x8

    move/from16 v0, v37

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/Node;->removeProp(I)V

    .line 2497
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2498
    const/16 v37, 0x8

    move/from16 v0, v37

    move/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    goto/16 :goto_0

    .line 2500
    :cond_f
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2501
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto/16 :goto_0

    .line 2512
    .end local v26    # "prop":I
    :pswitch_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v33

    .line 2513
    .local v33, "trueGOTO":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v10

    .line 2514
    .local v10, "falseGOTO":I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v33

    invoke-direct {v0, v1, v6, v2, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitIfJumpRelOp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    .line 2515
    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v1, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addJumpedBooleanWrap(II)V

    goto/16 :goto_0

    .line 2523
    .end local v10    # "falseGOTO":I
    .end local v33    # "trueGOTO":I
    :pswitch_26
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v33

    .line 2524
    .restart local v33    # "trueGOTO":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v10

    .line 2525
    .restart local v10    # "falseGOTO":I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v33

    invoke-direct {v0, v1, v6, v2, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitIfJumpEqOp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    .line 2526
    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v1, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addJumpedBooleanWrap(II)V

    goto/16 :goto_0

    .line 2532
    .end local v10    # "falseGOTO":I
    .end local v33    # "trueGOTO":I
    :pswitch_27
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitGetProp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2536
    :pswitch_28
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2537
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v37

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2538
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2539
    const/16 v37, 0x8

    const/16 v38, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v37

    const/16 v38, -0x1

    move/from16 v0, v37

    move/from16 v1, v38

    if-eq v0, v1, :cond_10

    .line 2540
    const-string v37, "getObjectIndex"

    const-string v38, "(Ljava/lang/Object;DLorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2547
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2548
    const-string v37, "getObjectElem"

    const-string v38, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2559
    :pswitch_29
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2560
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2561
    const-string v37, "refGet"

    const-string v38, "(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2569
    :pswitch_2a
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitGetVar(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2573
    :pswitch_2b
    const/16 v37, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    invoke-direct {v0, v1, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetVar(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_0

    .line 2577
    :pswitch_2c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetName(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2581
    :pswitch_2d
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitStrictSetName(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2585
    :pswitch_2e
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetConst(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2589
    :pswitch_2f
    const/16 v37, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    invoke-direct {v0, v1, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetConstVar(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_0

    .line 2594
    :pswitch_30
    move-object/from16 v0, p0

    move/from16 v1, v35

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetProp(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2599
    :pswitch_31
    move-object/from16 v0, p0

    move/from16 v1, v35

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetElem(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2605
    :pswitch_32
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2606
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 2607
    const/16 v37, 0x8e

    move/from16 v0, v35

    move/from16 v1, v37

    if-ne v0, v1, :cond_11

    .line 2608
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    const/16 v38, 0x59

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2609
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2610
    const-string v37, "refGet"

    const-string v38, "(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2616
    :cond_11
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2617
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2618
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2619
    const-string v37, "refSet"

    const-string v38, "(Lorg/mozilla/javascript/Ref;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2630
    :pswitch_33
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2631
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2632
    const-string v37, "refDel"

    const-string v38, "(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2639
    :pswitch_34
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v37

    const/16 v38, 0x31

    move/from16 v0, v37

    move/from16 v1, v38

    if-ne v0, v1, :cond_12

    const/16 v17, 0x1

    .line 2640
    .local v17, "isName":Z
    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2641
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 2642
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2643
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2644
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Z)V

    .line 2645
    const-string v37, "delete"

    const-string v38, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Z)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2639
    .end local v17    # "isName":Z
    :cond_12
    const/16 v17, 0x0

    goto :goto_4

    .line 2654
    :goto_5
    :pswitch_35
    if-eqz v6, :cond_13

    .line 2655
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2656
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    goto :goto_5

    .line 2659
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2660
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2661
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2662
    const-string v37, "bind"

    const-string v38, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2672
    :pswitch_36
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I

    move-result v38

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto/16 :goto_0

    .line 2677
    :pswitch_37
    const/16 v37, 0x11

    move-object/from16 v0, p1

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    .line 2678
    .local v28, "special":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2679
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2680
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2681
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2682
    const-string v37, "specialRef"

    const-string v38, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2697
    .end local v28    # "special":Ljava/lang/String;
    :pswitch_38
    const/16 v37, 0x10

    const/16 v38, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v37

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v20

    .line 2701
    .local v20, "memberTypeFlags":I
    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2702
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 2703
    if-nez v6, :cond_14

    .line 2704
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2706
    packed-switch v35, :pswitch_data_2

    .line 2744
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v37

    throw v37

    .line 2708
    :pswitch_39
    const-string v21, "memberRef"

    .line 2709
    .local v21, "methodName":Ljava/lang/String;
    const-string v27, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;"

    .line 2746
    .local v27, "signature":Ljava/lang/String;
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 2747
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2716
    .end local v21    # "methodName":Ljava/lang/String;
    .end local v27    # "signature":Ljava/lang/String;
    :pswitch_3a
    const-string v21, "memberRef"

    .line 2717
    .restart local v21    # "methodName":Ljava/lang/String;
    const-string v27, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;"

    .line 2723
    .restart local v27    # "signature":Ljava/lang/String;
    goto :goto_6

    .line 2725
    .end local v21    # "methodName":Ljava/lang/String;
    .end local v27    # "signature":Ljava/lang/String;
    :pswitch_3b
    const-string v21, "nameRef"

    .line 2726
    .restart local v21    # "methodName":Ljava/lang/String;
    const-string v27, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;"

    .line 2731
    .restart local v27    # "signature":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_6

    .line 2734
    .end local v21    # "methodName":Ljava/lang/String;
    .end local v27    # "signature":Ljava/lang/String;
    :pswitch_3c
    const-string v21, "nameRef"

    .line 2735
    .restart local v21    # "methodName":Ljava/lang/String;
    const-string v27, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;"

    .line 2741
    .restart local v27    # "signature":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_6

    .line 2752
    .end local v20    # "memberTypeFlags":I
    .end local v21    # "methodName":Ljava/lang/String;
    .end local v27    # "signature":Ljava/lang/String;
    :pswitch_3d
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitDotQuery(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2756
    :pswitch_3e
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2757
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2758
    const-string v37, "escapeAttributeValue"

    const-string v38, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2765
    :pswitch_3f
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2766
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2767
    const-string v37, "escapeTextValue"

    const-string v38, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2774
    :pswitch_40
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2775
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2776
    const-string v37, "setDefaultNamespace"

    const-string v38, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2783
    :pswitch_41
    const/16 v37, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateYieldPoint(Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_0

    .line 2787
    :pswitch_42
    move-object v8, v6

    .line 2788
    .local v8, "enterWith":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v36

    .line 2789
    .local v36, "with":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v36 .. v36}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v18

    .line 2790
    .local v18, "leaveWith":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 2791
    invoke-virtual/range {v36 .. v36}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v37

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2792
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2797
    .end local v8    # "enterWith":Lorg/mozilla/javascript/Node;
    .end local v18    # "leaveWith":Lorg/mozilla/javascript/Node;
    .end local v36    # "with":Lorg/mozilla/javascript/Node;
    :pswitch_43
    move-object/from16 v16, v6

    .line 2798
    .local v16, "initStmt":Lorg/mozilla/javascript/Node;
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v9

    .line 2799
    .local v9, "expr":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 2800
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v9, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 2165
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2c
        :pswitch_21
        :pswitch_21
        :pswitch_21
        :pswitch_26
        :pswitch_26
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_21
        :pswitch_21
        :pswitch_21
        :pswitch_1a
        :pswitch_1f
        :pswitch_1e
        :pswitch_20
        :pswitch_20
        :pswitch_12
        :pswitch_13
        :pswitch_22
        :pswitch_22
        :pswitch_4
        :pswitch_34
        :pswitch_15
        :pswitch_27
        :pswitch_27
        :pswitch_30
        :pswitch_28
        :pswitch_31
        :pswitch_4
        :pswitch_3
        :pswitch_6
        :pswitch_7
        :pswitch_a
        :pswitch_8
        :pswitch_c
        :pswitch_b
        :pswitch_26
        :pswitch_26
        :pswitch_d
        :pswitch_35
        :pswitch_0
        :pswitch_0
        :pswitch_25
        :pswitch_25
        :pswitch_36
        :pswitch_2a
        :pswitch_2b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_f
        :pswitch_f
        :pswitch_9
        :pswitch_0
        :pswitch_10
        :pswitch_11
        :pswitch_29
        :pswitch_32
        :pswitch_33
        :pswitch_5
        :pswitch_37
        :pswitch_41
        :pswitch_2d
        :pswitch_40
        :pswitch_3e
        :pswitch_3f
        :pswitch_38
        :pswitch_38
        :pswitch_38
        :pswitch_38
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_19
        :pswitch_0
        :pswitch_18
        :pswitch_18
        :pswitch_17
        :pswitch_17
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_14
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_16
        :pswitch_2
        :pswitch_30
        :pswitch_31
        :pswitch_0
        :pswitch_32
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3d
        :pswitch_0
        :pswitch_0
        :pswitch_24
        :pswitch_23
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2e
        :pswitch_2f
        :pswitch_43
        :pswitch_0
        :pswitch_42
    .end packed-switch

    .line 2414
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
    .end packed-switch

    .line 2706
    :pswitch_data_2
    .packed-switch 0x4d
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
    .end packed-switch
.end method

.method private generateFunctionAndThisObj(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 7
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v6, -0x1

    .line 3628
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v4

    .line 3629
    .local v4, "type":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 3682
    :pswitch_0
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3683
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3684
    const-string v5, "getValueFunctionAndThis"

    const-string v6, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3692
    :goto_0
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3693
    const-string v5, "lastStoredScriptable"

    const-string v6, "(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3697
    return-void

    .line 3631
    :pswitch_1
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 3635
    :pswitch_2
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 3636
    .local v3, "target":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3637
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3638
    .local v0, "id":Lorg/mozilla/javascript/Node;
    const/16 v5, 0x21

    if-ne v4, v5, :cond_0

    .line 3639
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 3640
    .local v2, "property":Ljava/lang/String;
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3641
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3642
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3643
    const-string v5, "getPropFunctionAndThis"

    const-string v6, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3651
    .end local v2    # "property":Ljava/lang/String;
    :cond_0
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3652
    const/16 v5, 0x8

    invoke-virtual {p1, v5, v6}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v5

    if-eq v5, v6, :cond_1

    .line 3653
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 3654
    :cond_1
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3655
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3656
    const-string v5, "getElemFunctionAndThis"

    const-string v6, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3668
    .end local v0    # "id":Lorg/mozilla/javascript/Node;
    .end local v3    # "target":Lorg/mozilla/javascript/Node;
    :pswitch_3
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 3669
    .local v1, "name":Ljava/lang/String;
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3670
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3671
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3672
    const-string v5, "getNameFunctionAndThis"

    const-string v6, "(Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 3629
    nop

    :pswitch_data_0
    .packed-switch 0x21
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private generateGenerator()V
    .locals 5

    .prologue
    .line 1324
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1328
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 1329
    iget-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v1, v0, 0x1

    int-to-short v1, v1

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    .line 1330
    iget-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 1333
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    if-eqz v0, :cond_0

    .line 1337
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1338
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb9

    const-string v2, "org/mozilla/javascript/Scriptable"

    const-string v3, "getParentScope"

    const-string v4, "()Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1342
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1346
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1347
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1348
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1349
    const-string v0, "createFunctionActivation"

    const-string v1, "(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1354
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1357
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xbb

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v2, v2, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 1359
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1360
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1361
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1362
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFnIndex:I

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1363
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb7

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v2, v2, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v3, "<init>"

    const-string v4, "(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;I)V"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1366
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateNestedFunctionInits()V

    .line 1369
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1370
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1371
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxLocals:I

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1372
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxStack:I

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1373
    const-string v0, "createNativeGenerator"

    const-string v1, "(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;II)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1379
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1380
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    add-int/lit8 v1, v1, 0x1

    int-to-short v1, v1

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1381
    return-void
.end method

.method private generateGetGeneratorLocalsState()V
    .locals 2

    .prologue
    .line 1826
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1827
    const-string v0, "getGeneratorLocalsState"

    const-string v1, "(Ljava/lang/Object;)[Ljava/lang/Object;"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1829
    return-void
.end method

.method private generateGetGeneratorResumptionPoint()V
    .locals 5

    .prologue
    .line 1695
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1696
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb4

    const-string v2, "org/mozilla/javascript/optimizer/OptRuntime$GeneratorState"

    const-string v3, "resumptionPoint"

    const-string v4, "I"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1700
    return-void
.end method

.method private generateGetGeneratorStackState()V
    .locals 2

    .prologue
    .line 1714
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1715
    const-string v0, "getGeneratorStackState"

    const-string v1, "(Ljava/lang/Object;)[Ljava/lang/Object;"

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1717
    return-void
.end method

.method private generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V
    .locals 5
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;
    .param p3, "trueLabel"    # I
    .param p4, "falseLabel"    # I

    .prologue
    .line 2903
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    .line 2904
    .local v2, "type":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 2906
    .local v0, "child":Lorg/mozilla/javascript/Node;
    sparse-switch v2, :sswitch_data_0

    .line 2944
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2945
    const-string v3, "toBoolean"

    const-string v4, "(Ljava/lang/Object;)Z"

    invoke-direct {p0, v3, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2946
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0x9a

    invoke-virtual {v3, v4, p3}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2947
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4, p4}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2949
    :goto_0
    return-void

    .line 2908
    :sswitch_0
    invoke-direct {p0, v0, p1, p4, p3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    goto :goto_0

    .line 2913
    :sswitch_1
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 2914
    .local v1, "interLabel":I
    const/16 v3, 0x69

    if-ne v2, v3, :cond_0

    .line 2915
    invoke-direct {p0, v0, p1, v1, p4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    .line 2920
    :goto_1
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2921
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 2922
    invoke-direct {p0, v0, p1, p3, p4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    goto :goto_0

    .line 2918
    :cond_0
    invoke-direct {p0, v0, p1, p3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    goto :goto_1

    .line 2932
    .end local v1    # "interLabel":I
    :sswitch_2
    invoke-direct {p0, p1, v0, p3, p4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitIfJumpRelOp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    goto :goto_0

    .line 2939
    :sswitch_3
    invoke-direct {p0, p1, v0, p3, p4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitIfJumpEqOp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    goto :goto_0

    .line 2906
    :sswitch_data_0
    .sparse-switch
        0xc -> :sswitch_3
        0xd -> :sswitch_3
        0xe -> :sswitch_2
        0xf -> :sswitch_2
        0x10 -> :sswitch_2
        0x11 -> :sswitch_2
        0x1a -> :sswitch_0
        0x2e -> :sswitch_3
        0x2f -> :sswitch_3
        0x34 -> :sswitch_2
        0x35 -> :sswitch_2
        0x68 -> :sswitch_1
        0x69 -> :sswitch_1
    .end sparse-switch
.end method

.method private generateIntegerUnwrap()V
    .locals 5

    .prologue
    .line 2133
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb6

    const-string v2, "java/lang/Integer"

    const-string v3, "intValue"

    const-string v4, "()I"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2135
    return-void
.end method

.method private generateIntegerWrap()V
    .locals 5

    .prologue
    .line 2126
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb8

    const-string v2, "java/lang/Integer"

    const-string v3, "valueOf"

    const-string v4, "(I)Ljava/lang/Integer;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2128
    return-void
.end method

.method private generateNestedFunctionInits()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1385
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .line 1386
    .local v0, "functionCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 1387
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-static {v3, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;I)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v2

    .line 1388
    .local v2, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    iget-object v3, v2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v3

    if-ne v3, v4, :cond_0

    .line 1391
    invoke-direct {p0, v2, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitFunction(Lorg/mozilla/javascript/optimizer/OptFunctionNode;I)V

    .line 1386
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1394
    .end local v2    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    :cond_1
    return-void
.end method

.method private generateObjectLiteralFactory(Lorg/mozilla/javascript/Node;I)V
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "count"    # I

    .prologue
    .line 3041
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3042
    .local v0, "methodName":Ljava/lang/String;
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 3043
    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v2, v1, 0x1

    int-to-short v2, v2

    iput-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    .line 3044
    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 3045
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-string v2, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 3051
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitObjectLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3052
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xb0

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3053
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    add-int/lit8 v2, v2, 0x1

    int-to-short v2, v2

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 3054
    return-void
.end method

.method private generatePrologue()V
    .locals 25

    .prologue
    .line 1439
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    move/from16 v20, v0

    if-eqz v20, :cond_2

    .line 1440
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamCount()I

    move-result v6

    .line 1445
    .local v6, "directParameterCount":I
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1446
    :cond_0
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-eq v8, v6, :cond_1

    .line 1447
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v21, v0

    aput-short v21, v20, v8

    .line 1449
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    add-int/lit8 v20, v20, 0x3

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 1446
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1451
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getParameterNumberContext()Z

    move-result v20

    if-nez v20, :cond_2

    .line 1453
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsForcedObjectParameters:Z

    .line 1454
    const/4 v8, 0x0

    :goto_1
    if-eq v8, v6, :cond_2

    .line 1455
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    move-object/from16 v20, v0

    aget-short v15, v20, v8

    .line 1456
    .local v15, "reg":S
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1457
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xb2

    const-string v22, "java/lang/Void"

    const-string v23, "TYPE"

    const-string v24, "Ljava/lang/Class;"

    invoke-virtual/range {v20 .. v24}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1461
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v9

    .line 1462
    .local v9, "isObjectLabel":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xa6

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 1463
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    add-int/lit8 v21, v15, 0x1

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 1464
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 1465
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1466
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 1454
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1471
    .end local v6    # "directParameterCount":I
    .end local v8    # "i":I
    .end local v9    # "isObjectLabel":I
    .end local v15    # "reg":S
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    if-eqz v20, :cond_3

    .line 1473
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1474
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xb9

    const-string v22, "org/mozilla/javascript/Scriptable"

    const-string v23, "getParentScope"

    const-string v24, "()Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual/range {v20 .. v24}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1478
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1482
    :cond_3
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    add-int/lit8 v21, v20, 0x1

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    .line 1483
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 1486
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v20, v0

    if-eqz v20, :cond_5

    .line 1489
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    add-int/lit8 v21, v20, 0x1

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->operationLocal:S

    .line 1490
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 1496
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1497
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    add-int/lit8 v21, v20, 0x1

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    .line 1498
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 1499
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xc0

    const-string v22, "org/mozilla/javascript/optimizer/OptRuntime$GeneratorState"

    invoke-virtual/range {v20 .. v22}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 1500
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0x59

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1501
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1502
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xb4

    const-string v22, "org/mozilla/javascript/optimizer/OptRuntime$GeneratorState"

    const-string v23, "thisObj"

    const-string v24, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual/range {v20 .. v24}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1506
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1508
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_4

    .line 1509
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1512
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v20, v0

    check-cast v20, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v17

    .line 1513
    .local v17, "targets":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/Node;>;"
    if-eqz v17, :cond_5

    .line 1515
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateGetGeneratorResumptionPoint()V

    .line 1518
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v22

    add-int/lit8 v22, v22, 0x0

    invoke-virtual/range {v20 .. v22}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorSwitch:I

    .line 1520
    const/16 v20, -0x1

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCheckForThrowOrClose(IZI)V

    .line 1526
    .end local v17    # "targets":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/Node;>;"
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    if-nez v20, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpCount()I

    move-result v20

    if-eqz v20, :cond_6

    .line 1527
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1528
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xb8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string v23, "_reInit"

    const-string v24, "(Lorg/mozilla/javascript/Context;)V"

    invoke-virtual/range {v20 .. v24}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1533
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v20

    if-eqz v20, :cond_7

    .line 1534
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->saveCurrentCodeOffset()V

    .line 1536
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    move/from16 v20, v0

    if-eqz v20, :cond_13

    .line 1538
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamCount()I

    move-result v14

    .line 1539
    .local v14, "parmCount":I
    if-lez v14, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    move/from16 v20, v0

    if-nez v20, :cond_8

    .line 1542
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1543
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xbe

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1544
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1545
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v10

    .line 1546
    .local v10, "label":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xa2

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 1547
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1548
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1549
    const-string v20, "padArguments"

    const-string v21, "([Ljava/lang/Object;I)[Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1552
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1553
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 1556
    .end local v10    # "label":I
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v13

    .line 1557
    .local v13, "paramCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarCount()I

    move-result v19

    .line 1558
    .local v19, "varCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v4

    .line 1562
    .local v4, "constDeclarations":[Z
    const/4 v7, -0x1

    .line 1563
    .local v7, "firstUndefVar":S
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_2
    move/from16 v0, v19

    if-eq v8, v0, :cond_14

    .line 1564
    const/4 v15, -0x1

    .line 1565
    .restart local v15    # "reg":S
    if-ge v8, v13, :cond_e

    .line 1566
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    move/from16 v20, v0

    if-nez v20, :cond_9

    .line 1567
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v15

    .line 1568
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1569
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1570
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0x32

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1571
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1587
    :cond_9
    :goto_3
    if-ltz v15, :cond_b

    .line 1588
    aget-boolean v20, v4, v8

    if-eqz v20, :cond_a

    .line 1589
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1590
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v20

    if-eqz v20, :cond_11

    const/16 v20, 0x2

    :goto_4
    add-int v20, v20, v15

    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addIStore(I)V

    .line 1592
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    move-object/from16 v20, v0

    aput-short v15, v20, v8

    .line 1596
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v20

    if-eqz v20, :cond_d

    .line 1597
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v12

    .line 1598
    .local v12, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v20

    if-eqz v20, :cond_12

    const-string v18, "D"

    .line 1600
    .local v18, "type":Ljava/lang/String;
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v16

    .line 1601
    .local v16, "startPC":I
    if-gez v15, :cond_c

    .line 1602
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    move-object/from16 v20, v0

    aget-short v15, v20, v8

    .line 1604
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    move/from16 v2, v16

    invoke-virtual {v0, v12, v1, v2, v15}, Lorg/mozilla/classfile/ClassFileWriter;->addVariableDescriptor(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1563
    .end local v12    # "name":Ljava/lang/String;
    .end local v16    # "startPC":I
    .end local v18    # "type":Ljava/lang/String;
    :cond_d
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2

    .line 1573
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v20

    if-eqz v20, :cond_f

    .line 1574
    aget-boolean v20, v4, v8

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordPairLocal(Z)S

    move-result v15

    .line 1575
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const-wide/16 v22, 0x0

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 1576
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ClassFileWriter;->addDStore(I)V

    goto/16 :goto_3

    .line 1578
    :cond_f
    aget-boolean v20, v4, v8

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal(Z)S

    move-result v15

    .line 1579
    const/16 v20, -0x1

    move/from16 v0, v20

    if-ne v7, v0, :cond_10

    .line 1580
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 1581
    move v7, v15

    .line 1585
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_3

    .line 1583
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_6

    .line 1590
    :cond_11
    const/16 v20, 0x1

    goto/16 :goto_4

    .line 1598
    .restart local v12    # "name":Ljava/lang/String;
    :cond_12
    const-string v18, "Ljava/lang/Object;"

    goto/16 :goto_5

    .line 1615
    .end local v4    # "constDeclarations":[Z
    .end local v7    # "firstUndefVar":S
    .end local v8    # "i":I
    .end local v12    # "name":Ljava/lang/String;
    .end local v13    # "paramCount":I
    .end local v14    # "parmCount":I
    .end local v15    # "reg":S
    .end local v19    # "varCount":I
    :cond_13
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v20, v0

    if-eqz v20, :cond_15

    .line 1691
    :cond_14
    :goto_7
    return-void

    .line 1620
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    if-eqz v20, :cond_17

    .line 1621
    const-string v5, "activation"

    .line 1622
    .local v5, "debugVariableName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1623
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1624
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1625
    const-string v20, "createFunctionActivation"

    const-string v21, "(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1630
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1631
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1632
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1633
    const-string v20, "enterActivationFunction"

    const-string v21, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1653
    :goto_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->enterAreaStartLabel:I

    .line 1654
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1655
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->enterAreaStartLabel:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 1657
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateNestedFunctionInits()V

    .line 1660
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v20

    if-eqz v20, :cond_16

    .line 1661
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const-string v21, "Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v22

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v5, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addVariableDescriptor(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1666
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    if-nez v20, :cond_18

    .line 1668
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    .line 1669
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 1670
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1672
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/ast/ScriptNode;->getEndLineno()I

    move-result v11

    .line 1673
    .local v11, "linenum":I
    const/16 v20, -0x1

    move/from16 v0, v20

    if-eq v11, v0, :cond_14

    .line 1674
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    int-to-short v0, v11

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addLineNumberEntry(S)V

    goto/16 :goto_7

    .line 1638
    .end local v5    # "debugVariableName":Ljava/lang/String;
    .end local v11    # "linenum":I
    :cond_17
    const-string v5, "global"

    .line 1639
    .restart local v5    # "debugVariableName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1640
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1641
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1642
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1643
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1644
    const-string v20, "initScript"

    const-string v21, "(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 1677
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->itsContainsCalls0:Z

    move/from16 v20, v0

    if-eqz v20, :cond_19

    .line 1678
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsZeroArgArray:S

    .line 1679
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xb2

    const-string v22, "org/mozilla/javascript/ScriptRuntime"

    const-string v23, "emptyArgs"

    const-string v24, "[Ljava/lang/Object;"

    invoke-virtual/range {v20 .. v24}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1682
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsZeroArgArray:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1684
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->itsContainsCalls1:Z

    move/from16 v20, v0

    if-eqz v20, :cond_14

    .line 1685
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsOneArgArray:S

    .line 1686
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1687
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    const/16 v21, 0xbd

    const-string v22, "java/lang/Object"

    invoke-virtual/range {v20 .. v22}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 1688
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsOneArgArray:S

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_7
.end method

.method private generateSaveLocals(Lorg/mozilla/javascript/Node;)Z
    .locals 6
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4222
    const/4 v0, 0x0

    .line 4223
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge v1, v4, :cond_1

    .line 4224
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    aget v4, v4, v1

    if-eqz v4, :cond_0

    .line 4225
    add-int/lit8 v0, v0, 0x1

    .line 4223
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4228
    :cond_1
    if-nez v0, :cond_2

    .line 4229
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v4, Lorg/mozilla/javascript/ast/FunctionNode;

    const/4 v5, 0x0

    invoke-virtual {v4, p1, v5}, Lorg/mozilla/javascript/ast/FunctionNode;->addLiveLocals(Lorg/mozilla/javascript/Node;[I)V

    .line 4230
    const/4 v4, 0x0

    .line 4260
    :goto_1
    return v4

    .line 4234
    :cond_2
    iget v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxLocals:I

    if-le v4, v0, :cond_4

    iget v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxLocals:I

    :goto_2
    iput v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxLocals:I

    .line 4237
    new-array v2, v0, [I

    .line 4238
    .local v2, "ls":[I
    const/4 v3, 0x0

    .line 4239
    .local v3, "s":I
    const/4 v1, 0x0

    :goto_3
    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge v1, v4, :cond_5

    .line 4240
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    aget v4, v4, v1

    if-eqz v4, :cond_3

    .line 4241
    aput v1, v2, v3

    .line 4242
    add-int/lit8 v3, v3, 0x1

    .line 4239
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .end local v2    # "ls":[I
    .end local v3    # "s":I
    :cond_4
    move v4, v0

    .line 4234
    goto :goto_2

    .line 4247
    .restart local v2    # "ls":[I
    .restart local v3    # "s":I
    :cond_5
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v4, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v4, p1, v2}, Lorg/mozilla/javascript/ast/FunctionNode;->addLiveLocals(Lorg/mozilla/javascript/Node;[I)V

    .line 4250
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateGetGeneratorLocalsState()V

    .line 4251
    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_6

    .line 4252
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v5, 0x59

    invoke-virtual {v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4253
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v4, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 4254
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    aget v5, v2, v1

    invoke-virtual {v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4255
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v5, 0x53

    invoke-virtual {v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4251
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 4258
    :cond_6
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v5, 0x57

    invoke-virtual {v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4260
    const/4 v4, 0x1

    goto :goto_1
.end method

.method private generateSetGeneratorResumptionPoint(I)V
    .locals 5
    .param p1, "nextState"    # I

    .prologue
    .line 1704
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1705
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1706
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb5

    const-string v2, "org/mozilla/javascript/optimizer/OptRuntime$GeneratorState"

    const-string v3, "resumptionPoint"

    const-string v4, "I"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1710
    return-void
.end method

.method private generateStatement(Lorg/mozilla/javascript/Node;)V
    .locals 21
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 1841
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 1842
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v17

    .line 1843
    .local v17, "type":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 1844
    .local v3, "child":Lorg/mozilla/javascript/Node;
    sparse-switch v17, :sswitch_data_0

    .line 2119
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v18

    throw v18

    .line 1852
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_0

    .line 1855
    const/16 v18, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount(I)V

    .line 1857
    :cond_0
    :goto_0
    if-eqz v3, :cond_3

    .line 1858
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 1859
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    goto :goto_0

    .line 1864
    :sswitch_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inLocalBlock:Z

    .line 1865
    .local v13, "prevLocal":Z
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inLocalBlock:Z

    .line 1866
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v10

    .line 1867
    .local v10, "local":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v18, v0

    if-eqz v18, :cond_1

    .line 1868
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1869
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1871
    :cond_1
    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1, v10}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 1872
    :goto_1
    if-eqz v3, :cond_2

    .line 1873
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 1874
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    goto :goto_1

    .line 1876
    :cond_2
    int-to-short v0, v10

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 1877
    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->removeProp(I)V

    .line 1878
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inLocalBlock:Z

    .line 2122
    .end local v10    # "local":I
    .end local v13    # "prevLocal":Z
    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    :cond_3
    :goto_2
    :sswitch_2
    return-void

    .line 1883
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_3
    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v8

    .line 1884
    .local v8, "fnIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-static {v0, v8}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;I)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v12

    .line 1885
    .local v12, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    iget-object v0, v12, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v16

    .line 1886
    .local v16, "t":I
    const/16 v18, 0x3

    move/from16 v0, v16

    move/from16 v1, v18

    if-ne v0, v1, :cond_4

    .line 1887
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v12, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitFunction(Lorg/mozilla/javascript/optimizer/OptFunctionNode;I)V

    goto :goto_2

    .line 1889
    :cond_4
    const/16 v18, 0x1

    move/from16 v0, v16

    move/from16 v1, v18

    if-eq v0, v1, :cond_3

    .line 1890
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v18

    throw v18

    .line 1897
    .end local v8    # "fnIndex":I
    .end local v12    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .end local v16    # "t":I
    :sswitch_4
    check-cast p1, Lorg/mozilla/javascript/ast/Jump;

    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitTryCatchFinally(Lorg/mozilla/javascript/ast/Jump;Lorg/mozilla/javascript/Node;)V

    goto :goto_2

    .line 1903
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->setStackTop(S)V

    .line 1905
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I

    move-result v10

    .line 1906
    .restart local v10    # "local":I
    const/16 v18, 0xe

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v15

    .line 1909
    .local v15, "scopeIndex":I
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v11

    .line 1910
    .local v11, "name":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 1911
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 1912
    if-nez v15, :cond_5

    .line 1913
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1918
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 1919
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1920
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1922
    const-string v18, "newCatchScope"

    const-string v19, "(Ljava/lang/Throwable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1930
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_2

    .line 1916
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_3

    .line 1935
    .end local v10    # "local":I
    .end local v11    # "name":Ljava/lang/String;
    .end local v15    # "scopeIndex":I
    :sswitch_6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 1936
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_6

    .line 1937
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1938
    :cond_6
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateThrowJavaScriptException()V

    goto/16 :goto_2

    .line 1942
    :sswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_7

    .line 1943
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1944
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1945
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0xbf

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_2

    .line 1950
    :sswitch_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v18, v0

    if-nez v18, :cond_8

    .line 1951
    if-eqz v3, :cond_a

    .line 1952
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 1960
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_9

    .line 1961
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1962
    :cond_9
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    move/from16 v18, v0

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_e

    .line 1963
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    move/from16 v18, v0

    if-nez v18, :cond_d

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v18

    throw v18

    .line 1953
    :cond_a
    const/16 v18, 0x4

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_b

    .line 1954
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    goto :goto_4

    .line 1956
    :cond_b
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    move/from16 v18, v0

    if-gez v18, :cond_c

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v18

    throw v18

    .line 1957
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_4

    .line 1964
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1966
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0xa7

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    move/from16 v20, v0

    invoke-virtual/range {v18 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto/16 :goto_2

    .line 1970
    :sswitch_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_f

    .line 1971
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1972
    :cond_f
    check-cast p1, Lorg/mozilla/javascript/ast/Jump;

    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSwitch(Lorg/mozilla/javascript/ast/Jump;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_2

    .line 1976
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 1977
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1978
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1979
    const-string v18, "enterWith"

    const-string v19, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1985
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1986
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->incReferenceWordLocal(S)V

    goto/16 :goto_2

    .line 1990
    :sswitch_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1991
    const-string v18, "leaveWith"

    const-string v19, "(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1995
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 1996
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->decReferenceWordLocal(S)V

    goto/16 :goto_2

    .line 2002
    :sswitch_c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2003
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2004
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2005
    const/16 v18, 0x3a

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_10

    const/4 v4, 0x0

    .line 2010
    .local v4, "enumType":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 2011
    const-string v18, "enumInit"

    const-string v19, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2017
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_2

    .line 2005
    .end local v4    # "enumType":I
    :cond_10
    const/16 v18, 0x3b

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_11

    const/4 v4, 0x1

    goto :goto_5

    :cond_11
    const/4 v4, 0x2

    goto :goto_5

    .line 2021
    :sswitch_d
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v18

    const/16 v19, 0x38

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_12

    .line 2024
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v3, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetVar(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_2

    .line 2026
    :cond_12
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v18

    const/16 v19, 0x9c

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_13

    .line 2029
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v3, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitSetConstVar(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_2

    .line 2031
    :cond_13
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v18

    const/16 v19, 0x48

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_14

    .line 2032
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateYieldPoint(Lorg/mozilla/javascript/Node;Z)V

    goto/16 :goto_2

    .line 2035
    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2036
    const/16 v18, 0x8

    const/16 v19, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_15

    .line 2037
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0x58

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_2

    .line 2039
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0x57

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_2

    .line 2044
    :sswitch_e
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2045
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    move/from16 v18, v0

    if-gez v18, :cond_16

    .line 2046
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    .line 2048
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_2

    .line 2053
    :sswitch_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_17

    .line 2054
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 2055
    :cond_17
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v9

    .line 2056
    .local v9, "label":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2057
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 2058
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->saveCurrentCodeOffset()V

    goto/16 :goto_2

    .line 2066
    .end local v9    # "label":I
    :sswitch_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_18

    .line 2067
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addInstructionCount()V

    .line 2068
    :cond_18
    check-cast p1, Lorg/mozilla/javascript/ast/Jump;

    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-direct {v0, v1, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->visitGoto(Lorg/mozilla/javascript/ast/Jump;ILorg/mozilla/javascript/Node;)V

    goto/16 :goto_2

    .line 2078
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_11
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    move/from16 v18, v0

    if-eqz v18, :cond_3

    .line 2082
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v18

    if-eqz v18, :cond_19

    .line 2083
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->saveCurrentCodeOffset()V

    .line 2086
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->setStackTop(S)V

    .line 2089
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v6

    .line 2091
    .local v6, "finallyRegister":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v7

    .line 2092
    .local v7, "finallyStart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2093
    .local v5, "finallyEnd":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 2095
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIntegerWrap()V

    .line 2096
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 2098
    :goto_6
    if-eqz v3, :cond_1a

    .line 2099
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 2100
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    goto :goto_6

    .line 2103
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2104
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0xc0

    const-string v20, "java/lang/Integer"

    invoke-virtual/range {v18 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2105
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIntegerUnwrap()V

    .line 2106
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;

    .line 2107
    .local v14, "ret":Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v18

    move/from16 v0, v18

    iput v0, v14, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    .line 2108
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    const/16 v19, 0xa7

    iget v0, v14, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    move/from16 v20, v0

    invoke-virtual/range {v18 .. v20}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 2110
    int-to-short v0, v6

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 2111
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    goto/16 :goto_2

    .line 1844
    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_a
        0x3 -> :sswitch_b
        0x4 -> :sswitch_8
        0x5 -> :sswitch_10
        0x6 -> :sswitch_10
        0x7 -> :sswitch_10
        0x32 -> :sswitch_6
        0x33 -> :sswitch_7
        0x39 -> :sswitch_5
        0x3a -> :sswitch_c
        0x3b -> :sswitch_c
        0x3c -> :sswitch_c
        0x40 -> :sswitch_8
        0x51 -> :sswitch_4
        0x6d -> :sswitch_3
        0x72 -> :sswitch_9
        0x7b -> :sswitch_0
        0x7d -> :sswitch_11
        0x80 -> :sswitch_0
        0x81 -> :sswitch_0
        0x82 -> :sswitch_0
        0x83 -> :sswitch_f
        0x84 -> :sswitch_0
        0x85 -> :sswitch_d
        0x86 -> :sswitch_e
        0x87 -> :sswitch_10
        0x88 -> :sswitch_0
        0x8d -> :sswitch_1
        0xa0 -> :sswitch_2
    .end sparse-switch
.end method

.method private generateThrowJavaScriptException()V
    .locals 5

    .prologue
    .line 2140
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xbb

    const-string v2, "org/mozilla/javascript/JavaScriptException"

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2142
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x5a

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2143
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0x5f

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2144
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2145
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsLineNumber:I

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 2146
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xb7

    const-string v2, "org/mozilla/javascript/JavaScriptException"

    const-string v3, "<init>"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/String;I)V"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2151
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v1, 0xbf

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2152
    return-void
.end method

.method private generateYieldPoint(Lorg/mozilla/javascript/Node;Z)V
    .locals 9
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "exprContext"    # Z

    .prologue
    const/16 v8, 0x57

    const/16 v7, 0x5f

    .line 2812
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v4

    .line 2813
    .local v4, "top":I
    iget v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxStack:I

    if-le v5, v4, :cond_0

    iget v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxStack:I

    :goto_0
    iput v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->maxStack:I

    .line 2814
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v5

    if-eqz v5, :cond_2

    .line 2815
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateGetGeneratorStackState()V

    .line 2816
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_1

    .line 2817
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0x5a

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2818
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2819
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2820
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2821
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0x53

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2816
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v2    # "i":I
    :cond_0
    move v5, v4

    .line 2813
    goto :goto_0

    .line 2824
    .restart local v2    # "i":I
    :cond_1
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2828
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 2829
    .local v0, "child":Lorg/mozilla/javascript/Node;
    if-eqz v0, :cond_3

    .line 2830
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 2835
    :goto_2
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNextGeneratorState(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 2836
    .local v3, "nextState":I
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateSetGeneratorResumptionPoint(I)V

    .line 2838
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateSaveLocals(Lorg/mozilla/javascript/Node;)Z

    move-result v1

    .line 2840
    .local v1, "hasLocals":Z
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0xb0

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2842
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v5

    invoke-direct {p0, v5, v1, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCheckForThrowOrClose(IZI)V

    .line 2846
    if-eqz v4, :cond_5

    .line 2847
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateGetGeneratorStackState()V

    .line 2848
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    if-ge v2, v4, :cond_4

    .line 2849
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0x59

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2850
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    sub-int v6, v4, v2

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2851
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0x32

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2852
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2848
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 2832
    .end local v1    # "hasLocals":Z
    .end local v2    # "i":I
    .end local v3    # "nextState":I
    :cond_3
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v5}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    goto :goto_2

    .line 2854
    .restart local v1    # "hasLocals":Z
    .restart local v2    # "i":I
    .restart local v3    # "nextState":I
    :cond_4
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2858
    .end local v2    # "i":I
    :cond_5
    if-eqz p2, :cond_6

    .line 2859
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2861
    :cond_6
    return-void
.end method

.method private getFinallyAtTarget(Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/16 v3, 0x7d

    .line 4207
    if-nez p1, :cond_1

    .line 4208
    const/4 p1, 0x0

    .line 4214
    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    :cond_0
    :goto_0
    return-object p1

    .line 4209
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    if-eq v1, v3, :cond_0

    .line 4211
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    const/16 v2, 0x83

    if-ne v1, v2, :cond_2

    .line 4212
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 4213
    .local v0, "fBlock":Lorg/mozilla/javascript/Node;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    if-ne v1, v3, :cond_2

    move-object p1, v0

    .line 4214
    goto :goto_0

    .line 4217
    .end local v0    # "fBlock":Lorg/mozilla/javascript/Node;
    :cond_2
    const-string v1, "bad finally target"

    invoke-static {v1}, Lorg/mozilla/javascript/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 5248
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/Node;

    .line 5249
    .local v0, "localBlock":Lorg/mozilla/javascript/Node;
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v1

    .line 5250
    .local v1, "localSlot":I
    return v1
.end method

.method private getNewWordIntern(I)S
    .locals 7
    .param p1, "count"    # I

    .prologue
    const/16 v6, 0x400

    const/4 v5, 0x1

    .line 5378
    sget-boolean v4, Lorg/mozilla/javascript/optimizer/BodyCodegen;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    if-lt p1, v5, :cond_0

    const/4 v4, 0x3

    if-le p1, v4, :cond_1

    :cond_0
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 5380
    :cond_1
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    .line 5381
    .local v2, "locals":[I
    const/4 v3, -0x1

    .line 5382
    .local v3, "result":I
    if-le p1, v5, :cond_8

    .line 5384
    iget-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    .local v0, "i":I
    :goto_0
    add-int v4, v0, p1

    if-gt v4, v6, :cond_4

    .line 5385
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    if-ge v1, p1, :cond_3

    .line 5386
    add-int v4, v0, v1

    aget v4, v2, v4

    if-eqz v4, :cond_2

    .line 5387
    add-int/lit8 v4, v1, 0x1

    add-int/2addr v0, v4

    .line 5388
    goto :goto_0

    .line 5385
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 5391
    :cond_3
    move v3, v0

    .line 5398
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_4
    :goto_2
    const/4 v4, -0x1

    if-eq v3, v4, :cond_b

    .line 5399
    aput v5, v2, v3

    .line 5400
    if-le p1, v5, :cond_5

    .line 5401
    add-int/lit8 v4, v3, 0x1

    aput v5, v2, v4

    .line 5402
    :cond_5
    const/4 v4, 0x2

    if-le p1, v4, :cond_6

    .line 5403
    add-int/lit8 v4, v3, 0x2

    aput v5, v2, v4

    .line 5405
    :cond_6
    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ne v3, v4, :cond_a

    .line 5406
    add-int v0, v3, p1

    .restart local v0    # "i":I
    :goto_3
    if-ge v0, v6, :cond_b

    .line 5407
    aget v4, v2, v0

    if-nez v4, :cond_9

    .line 5408
    int-to-short v4, v0

    iput-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 5409
    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    iget-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge v4, v5, :cond_7

    .line 5410
    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 5411
    :cond_7
    int-to-short v4, v3

    .line 5415
    .end local v0    # "i":I
    :goto_4
    return v4

    .line 5395
    :cond_8
    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    goto :goto_2

    .line 5406
    .restart local v0    # "i":I
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 5415
    .end local v0    # "i":I
    :cond_a
    int-to-short v4, v3

    goto :goto_4

    .line 5419
    :cond_b
    const-string v4, "Program too complex (out of locals)"

    invoke-static {v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4
.end method

.method private getNewWordLocal()S
    .locals 1

    .prologue
    .line 5373
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordIntern(I)S

    move-result v0

    return v0
.end method

.method private getNewWordLocal(Z)S
    .locals 1
    .param p1, "isConst"    # Z

    .prologue
    .line 5368
    if-eqz p1, :cond_0

    const/4 v0, 0x2

    :goto_0
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordIntern(I)S

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private getNewWordPairLocal(Z)S
    .locals 1
    .param p1, "isConst"    # Z

    .prologue
    .line 5363
    if-eqz p1, :cond_0

    const/4 v0, 0x3

    :goto_0
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordIntern(I)S

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private getNextGeneratorState(Lorg/mozilla/javascript/Node;)I
    .locals 2
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 2156
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v1, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 2158
    .local v0, "nodeIndex":I
    add-int/lit8 v1, v0, 0x1

    return v1
.end method

.method private getTargetLabel(Lorg/mozilla/javascript/Node;)I
    .locals 2
    .param p1, "target"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 2981
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->labelId()I

    move-result v0

    .line 2982
    .local v0, "labelId":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 2983
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 2984
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/Node;->labelId(I)V

    .line 2986
    :cond_0
    return v0
.end method

.method private incReferenceWordLocal(S)V
    .locals 2
    .param p1, "local"    # S

    .prologue
    .line 5425
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 5426
    return-void
.end method

.method private initBodyGeneration()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v5, -0x1

    .line 1398
    iput-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    .line 1399
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v1

    const/16 v4, 0x6d

    if-ne v1, v4, :cond_3

    .line 1400
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-static {v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .line 1401
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    iget-object v1, v1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v1

    if-nez v1, :cond_2

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    .line 1402
    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-eqz v1, :cond_0

    .line 1403
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    iget-object v1, v1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarCount()I

    move-result v0

    .line 1404
    .local v0, "n":I
    if-eqz v0, :cond_0

    .line 1405
    new-array v1, v0, [S

    iput-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    .line 1408
    .end local v0    # "n":I
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v1

    iput-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    .line 1409
    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v1, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    .line 1416
    :cond_1
    :goto_1
    const/16 v1, 0x400

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    .line 1418
    iput-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    .line 1419
    iput-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    .line 1420
    const/4 v1, 0x2

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    .line 1421
    const/4 v1, 0x3

    iput-short v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    .line 1422
    iput-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    .line 1423
    iput-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 1425
    iput-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->popvLocal:S

    .line 1426
    iput-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    .line 1427
    iput-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsZeroArgArray:S

    .line 1428
    iput-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsOneArgArray:S

    .line 1429
    iput v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1430
    iput v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->enterAreaStartLabel:I

    .line 1431
    iput-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatorStateLocal:S

    .line 1432
    return-void

    :cond_2
    move v1, v3

    .line 1401
    goto :goto_0

    .line 1411
    :cond_3
    iput-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .line 1412
    iput-boolean v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    .line 1413
    iput-boolean v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    goto :goto_1
.end method

.method private inlineFinally(Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "finallyTarget"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4193
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 4194
    .local v1, "finallyStart":I
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 4195
    .local v0, "finallyEnd":I
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 4196
    invoke-direct {p0, p1, v1, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inlineFinally(Lorg/mozilla/javascript/Node;II)V

    .line 4197
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 4198
    return-void
.end method

.method private inlineFinally(Lorg/mozilla/javascript/Node;II)V
    .locals 3
    .param p1, "finallyTarget"    # Lorg/mozilla/javascript/Node;
    .param p2, "finallyStart"    # I
    .param p3, "finallyEnd"    # I

    .prologue
    .line 4181
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getFinallyAtTarget(Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 4182
    .local v1, "fBlock":Lorg/mozilla/javascript/Node;
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->resetTargets()V

    .line 4183
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 4184
    .local v0, "child":Lorg/mozilla/javascript/Node;
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v1, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->markInlineFinallyStart(Lorg/mozilla/javascript/Node;I)V

    .line 4185
    :goto_0
    if-eqz v0, :cond_0

    .line 4186
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 4187
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    goto :goto_0

    .line 4189
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v1, p3}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->markInlineFinallyEnd(Lorg/mozilla/javascript/Node;I)V

    .line 4190
    return-void
.end method

.method private static isArithmeticNode(Lorg/mozilla/javascript/Node;)Z
    .locals 2
    .param p0, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4531
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v0

    .line 4532
    .local v0, "type":I
    const/16 v1, 0x16

    if-eq v0, v1, :cond_0

    const/16 v1, 0x19

    if-eq v0, v1, :cond_0

    const/16 v1, 0x18

    if-eq v0, v1, :cond_0

    const/16 v1, 0x17

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private nodeIsDirectCallParameter(Lorg/mozilla/javascript/Node;)I
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4620
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    const/16 v2, 0x37

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsForcedObjectParameters:Z

    if-nez v1, :cond_0

    .line 4623
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v0

    .line 4624
    .local v0, "varIndex":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4625
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v1, v1, v0

    .line 4628
    .end local v0    # "varIndex":I
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private releaseWordLocal(S)V
    .locals 2
    .param p1, "local"    # S

    .prologue
    .line 5436
    iget-short v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge p1, v0, :cond_0

    .line 5437
    iput-short p1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 5438
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->locals:[I

    const/4 v1, 0x0

    aput v1, v0, p1

    .line 5439
    return-void
.end method

.method private saveCurrentCodeOffset()V
    .locals 1

    .prologue
    .line 4338
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lorg/mozilla/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->savedCodeOffset:I

    .line 4339
    return-void
.end method

.method private updateLineNumber(Lorg/mozilla/javascript/Node;)V
    .locals 2
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3701
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsLineNumber:I

    .line 3702
    iget v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsLineNumber:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 3705
    :goto_0
    return-void

    .line 3704
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsLineNumber:I

    int-to-short v1, v1

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addLineNumberEntry(S)V

    goto :goto_0
.end method

.method private varIsDirectCallParameter(I)Z
    .locals 1
    .param p1, "varIndex"    # I

    .prologue
    .line 4633
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsForcedObjectParameters:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private visitArithmetic(Lorg/mozilla/javascript/Node;ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "opCode"    # I
    .param p3, "child"    # Lorg/mozilla/javascript/Node;
    .param p4, "parent"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v3, -0x1

    .line 4541
    const/16 v2, 0x8

    invoke-virtual {p1, v2, v3}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v0

    .line 4542
    .local v0, "childNumberFlag":I
    if-eq v0, v3, :cond_1

    .line 4543
    invoke-direct {p0, p3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4544
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    invoke-direct {p0, v2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4545
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, p2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4560
    :cond_0
    :goto_0
    return-void

    .line 4548
    :cond_1
    invoke-static {p4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isArithmeticNode(Lorg/mozilla/javascript/Node;)Z

    move-result v1

    .line 4549
    .local v1, "childOfArithmetic":Z
    invoke-direct {p0, p3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4550
    invoke-static {p3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isArithmeticNode(Lorg/mozilla/javascript/Node;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 4551
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4552
    :cond_2
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    invoke-direct {p0, v2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4553
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isArithmeticNode(Lorg/mozilla/javascript/Node;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 4554
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4555
    :cond_3
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, p2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4556
    if-nez v1, :cond_0

    .line 4557
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto :goto_0
.end method

.method private visitArrayLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V
    .locals 9
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "topLevel"    # Z

    .prologue
    const/16 v8, 0x5f

    const/16 v7, 0x53

    .line 3059
    const/4 v0, 0x0

    .line 3060
    .local v0, "count":I
    move-object v1, p2

    .local v1, "cursor":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v1, :cond_0

    .line 3061
    add-int/lit8 v0, v0, 0x1

    .line 3060
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    goto :goto_0

    .line 3065
    :cond_0
    if-nez p3, :cond_3

    const/16 v5, 0xa

    if-gt v0, v5, :cond_1

    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v5

    const/16 v6, 0x7530

    if-le v5, v6, :cond_3

    :cond_1
    iget-boolean v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v5, :cond_3

    iget-boolean v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v5, :cond_3

    iget-boolean v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inLocalBlock:Z

    if-nez v5, :cond_3

    .line 3067
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    if-nez v5, :cond_2

    .line 3068
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    iput-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    .line 3070
    :cond_2
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3071
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_literal"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3072
    .local v3, "methodName":Ljava/lang/String;
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3073
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3074
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3075
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3076
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3077
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0xb6

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v7, v7, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v8, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {v5, v6, v7, v3, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3129
    .end local v3    # "methodName":Ljava/lang/String;
    :goto_1
    return-void

    .line 3087
    :cond_3
    iget-boolean v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v5, :cond_5

    .line 3090
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-eq v2, v0, :cond_4

    .line 3091
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3092
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    .line 3090
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 3094
    :cond_4
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3095
    const/4 v2, 0x0

    :goto_3
    if-eq v2, v0, :cond_6

    .line 3096
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0x5a

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3097
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3098
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    sub-int v6, v0, v2

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3099
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3100
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3095
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 3103
    .end local v2    # "i":I
    :cond_5
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3104
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_4
    if-eq v2, v0, :cond_6

    .line 3105
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0x59

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3106
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3107
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3108
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3109
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    .line 3104
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 3112
    :cond_6
    const/16 v5, 0xb

    invoke-virtual {p1, v5}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    move-object v4, v5

    check-cast v4, [I

    .line 3113
    .local v4, "skipIndexes":[I
    if-nez v4, :cond_7

    .line 3114
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3115
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3120
    :goto_5
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3121
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3122
    const-string v5, "newArrayLiteral"

    const-string v6, "([Ljava/lang/Object;Ljava/lang/String;ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3117
    :cond_7
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v4}, Lorg/mozilla/javascript/optimizer/OptRuntime;->encodeIntArray([I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3118
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    array-length v6, v4

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    goto :goto_5
.end method

.method private visitBitOp(Lorg/mozilla/javascript/Node;ILorg/mozilla/javascript/Node;)V
    .locals 5
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "type"    # I
    .param p3, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/16 v4, 0x7e

    const/4 v3, -0x1

    .line 4564
    const/16 v1, 0x8

    invoke-virtual {p1, v1, v3}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v0

    .line 4565
    .local v0, "childNumberFlag":I
    invoke-direct {p0, p3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4570
    const/16 v1, 0x14

    if-ne p2, v1, :cond_1

    .line 4571
    const-string v1, "toUint32"

    const-string v2, "(Ljava/lang/Object;)J"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4572
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4573
    const-string v1, "toInt32"

    const-string v2, "(Ljava/lang/Object;)I"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4576
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x1f

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 4577
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4578
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4579
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x8a

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4580
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4616
    :cond_0
    :goto_0
    return-void

    .line 4583
    :cond_1
    if-ne v0, v3, :cond_2

    .line 4584
    const-string v1, "toInt32"

    const-string v2, "(Ljava/lang/Object;)I"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4585
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4586
    const-string v1, "toInt32"

    const-string v2, "(Ljava/lang/Object;)I"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4593
    :goto_1
    packed-switch p2, :pswitch_data_0

    .line 4610
    :pswitch_0
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 4589
    :cond_2
    const-string v1, "toInt32"

    const-string v2, "(D)I"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4590
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4591
    const-string v1, "toInt32"

    const-string v2, "(D)I"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 4595
    :pswitch_1
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x80

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4612
    :goto_2
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x87

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4613
    if-ne v0, v3, :cond_0

    .line 4614
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto :goto_0

    .line 4598
    :pswitch_2
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x82

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_2

    .line 4601
    :pswitch_3
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_2

    .line 4604
    :pswitch_4
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x7a

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_2

    .line 4607
    :pswitch_5
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x78

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_2

    .line 4593
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method private visitDotQuery(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 5212
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 5213
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5214
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5215
    const-string v1, "enterDotQuery"

    const-string v2, "(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5219
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 5224
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5225
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5226
    .local v0, "queryLoopStart":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5227
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x57

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5229
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5230
    const-string v1, "toBoolean"

    const-string v2, "(Ljava/lang/Object;)Z"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5231
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5232
    const-string v1, "updateDotQuery"

    const-string v2, "(ZLorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5236
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5237
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xc6

    invoke-virtual {v1, v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5239
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5240
    const-string v1, "leaveDotQuery"

    const-string v2, "(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5243
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 5244
    return-void
.end method

.method private visitFunction(Lorg/mozilla/javascript/optimizer/OptFunctionNode;I)V
    .locals 6
    .param p1, "ofn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "functionType"    # I

    .prologue
    .line 2953
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v2, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/optimizer/Codegen;->getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I

    move-result v0

    .line 2954
    .local v0, "fnIndex":I
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xbb

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v3, v3, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2956
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 2957
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2958
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2959
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 2960
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0xb7

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v3, v3, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v4, "<init>"

    const-string v5, "(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;I)V"

    invoke-virtual {v1, v2, v3, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2963
    const/4 v1, 0x2

    if-ne p2, v1, :cond_0

    .line 2977
    :goto_0
    return-void

    .line 2968
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 2969
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2970
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 2971
    const-string v1, "initFunction"

    const-string v2, "(Lorg/mozilla/javascript/NativeFunction;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;)V"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private visitGetProp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 5056
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5057
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 5058
    .local v1, "nameChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5059
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_0

    .line 5060
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5061
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5062
    const-string v2, "getObjectPropNoWarn"

    const-string v3, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5095
    :goto_0
    return-void

    .line 5075
    :cond_0
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v0

    .line 5076
    .local v0, "childType":I
    const/16 v2, 0x2b

    if-ne v0, v2, :cond_1

    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    const/16 v3, 0x29

    if-ne v2, v3, :cond_1

    .line 5077
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5078
    const-string v2, "getObjectProp"

    const-string v3, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5085
    :cond_1
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5086
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5087
    const-string v2, "getObjectProp"

    const-string v3, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private visitGetVar(Lorg/mozilla/javascript/Node;)V
    .locals 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v3, -0x1

    .line 4930
    iget-boolean v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 4931
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 4932
    .local v1, "varIndex":I
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v0, v2, v1

    .line 4933
    .local v0, "reg":S
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 4938
    const/16 v2, 0x8

    invoke-virtual {p1, v2, v3}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v2

    if-eq v2, v3, :cond_1

    .line 4939
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    .line 4948
    :goto_0
    return-void

    .line 4941
    :cond_1
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    goto :goto_0

    .line 4943
    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 4944
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    goto :goto_0

    .line 4946
    :cond_3
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_0
.end method

.method private visitGoto(Lorg/mozilla/javascript/ast/Jump;ILorg/mozilla/javascript/Node;)V
    .locals 5
    .param p1, "node"    # Lorg/mozilla/javascript/ast/Jump;
    .param p2, "type"    # I
    .param p3, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v4, 0x6

    .line 2991
    iget-object v1, p1, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 2992
    .local v1, "target":Lorg/mozilla/javascript/Node;
    if-eq p2, v4, :cond_0

    const/4 v3, 0x7

    if-ne p2, v3, :cond_3

    .line 2993
    :cond_0
    if-nez p3, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2994
    :cond_1
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v2

    .line 2995
    .local v2, "targetLabel":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 2996
    .local v0, "fallThruLabel":I
    if-ne p2, v4, :cond_2

    .line 2997
    invoke-direct {p0, p3, p1, v2, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    .line 3000
    :goto_0
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3013
    .end local v0    # "fallThruLabel":I
    .end local v2    # "targetLabel":I
    :goto_1
    return-void

    .line 2999
    .restart local v0    # "fallThruLabel":I
    .restart local v2    # "targetLabel":I
    :cond_2
    invoke-direct {p0, p3, p1, v0, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateIfJump(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V

    goto :goto_0

    .line 3002
    .end local v0    # "fallThruLabel":I
    .end local v2    # "targetLabel":I
    :cond_3
    const/16 v3, 0x87

    if-ne p2, v3, :cond_5

    .line 3003
    iget-boolean v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v3, :cond_4

    .line 3004
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addGotoWithReturn(Lorg/mozilla/javascript/Node;)V

    goto :goto_1

    .line 3007
    :cond_4
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inlineFinally(Lorg/mozilla/javascript/Node;)V

    goto :goto_1

    .line 3010
    :cond_5
    const/16 v3, 0xa7

    invoke-direct {p0, v1, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addGoto(Lorg/mozilla/javascript/Node;I)V

    goto :goto_1
.end method

.method private visitIfJumpEqOp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V
    .locals 20
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "trueGOTO"    # I
    .param p4, "falseGOTO"    # I

    .prologue
    .line 4772
    const/4 v15, -0x1

    move/from16 v0, p3

    if-eq v0, v15, :cond_0

    const/4 v15, -0x1

    move/from16 v0, p4

    if-ne v0, v15, :cond_1

    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v15

    throw v15

    .line 4774
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v10

    .line 4775
    .local v10, "stackInitial":S
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v13

    .line 4776
    .local v13, "type":I
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 4779
    .local v8, "rChild":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v15

    const/16 v16, 0x2a

    move/from16 v0, v16

    if-eq v15, v0, :cond_2

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v15

    const/16 v16, 0x2a

    move/from16 v0, v16

    if-ne v15, v0, :cond_9

    .line 4781
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v15

    const/16 v16, 0x2a

    move/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 4782
    move-object/from16 p2, v8

    .line 4784
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4785
    const/16 v15, 0x2e

    if-eq v13, v15, :cond_4

    const/16 v15, 0x2f

    if-ne v13, v15, :cond_6

    .line 4786
    :cond_4
    const/16 v15, 0x2e

    if-ne v13, v15, :cond_5

    const/16 v11, 0xc6

    .line 4788
    .local v11, "testCode":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move/from16 v0, p3

    invoke-virtual {v15, v11, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4807
    .end local v11    # "testCode":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xa7

    move/from16 v0, v16

    move/from16 v1, p4

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4867
    :goto_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v15

    if-eq v10, v15, :cond_c

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v15

    throw v15

    .line 4786
    :cond_5
    const/16 v11, 0xc7

    goto :goto_0

    .line 4790
    :cond_6
    const/16 v15, 0xc

    if-eq v13, v15, :cond_8

    .line 4792
    const/16 v15, 0xd

    if-eq v13, v15, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v15

    throw v15

    .line 4793
    :cond_7
    move/from16 v12, p3

    .line 4794
    .local v12, "tmp":I
    move/from16 p3, p4

    .line 4795
    move/from16 p4, v12

    .line 4797
    .end local v12    # "tmp":I
    :cond_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0x59

    invoke-virtual/range {v15 .. v16}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4798
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v14

    .line 4799
    .local v14, "undefCheckLabel":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xc7

    move/from16 v0, v16

    invoke-virtual {v15, v0, v14}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4800
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v9

    .line 4801
    .local v9, "stack":S
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0x57

    invoke-virtual/range {v15 .. v16}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4802
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xa7

    move/from16 v0, v16

    move/from16 v1, p3

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4803
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15, v14, v9}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 4804
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-static {v15}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 4805
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xa5

    move/from16 v0, v16

    move/from16 v1, p3

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto/16 :goto_1

    .line 4809
    .end local v9    # "stack":S
    .end local v14    # "undefCheckLabel":I
    :cond_9
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lorg/mozilla/javascript/Node;)I

    move-result v4

    .line 4810
    .local v4, "child_dcp_register":I
    const/4 v15, -0x1

    if-eq v4, v15, :cond_a

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v15

    const/16 v16, 0x95

    move/from16 v0, v16

    if-ne v15, v0, :cond_a

    .line 4813
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v5

    .line 4814
    .local v5, "convertChild":Lorg/mozilla/javascript/Node;
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v15

    const/16 v16, 0x28

    move/from16 v0, v16

    if-ne v15, v0, :cond_a

    .line 4815
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4816
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xb2

    const-string v17, "java/lang/Void"

    const-string v18, "TYPE"

    const-string v19, "Ljava/lang/Class;"

    invoke-virtual/range {v15 .. v19}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4820
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v7

    .line 4821
    .local v7, "notNumbersLabel":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xa6

    move/from16 v0, v16

    invoke-virtual {v15, v0, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4822
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v16, v4, 0x1

    invoke-virtual/range {v15 .. v16}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4823
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getDouble()D

    move-result-wide v16

    invoke-virtual/range {v15 .. v17}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 4824
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0x97

    invoke-virtual/range {v15 .. v16}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4825
    const/16 v15, 0xc

    if-ne v13, v15, :cond_b

    .line 4826
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0x99

    move/from16 v0, v16

    move/from16 v1, p3

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4829
    :goto_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xa7

    move/from16 v0, v16

    move/from16 v1, p4

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4830
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v15, v7}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 4835
    .end local v5    # "convertChild":Lorg/mozilla/javascript/Node;
    .end local v7    # "notNumbersLabel":I
    :cond_a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4836
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4840
    sparse-switch v13, :sswitch_data_0

    .line 4858
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v15

    throw v15

    .line 4828
    .restart local v5    # "convertChild":Lorg/mozilla/javascript/Node;
    .restart local v7    # "notNumbersLabel":I
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0x9a

    move/from16 v0, v16

    move/from16 v1, p3

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_3

    .line 4842
    .end local v5    # "convertChild":Lorg/mozilla/javascript/Node;
    .end local v7    # "notNumbersLabel":I
    :sswitch_0
    const-string v6, "eq"

    .line 4843
    .local v6, "name":Ljava/lang/String;
    const/16 v11, 0x9a

    .line 4860
    .restart local v11    # "testCode":I
    :goto_4
    const-string v15, "(Ljava/lang/Object;Ljava/lang/Object;)Z"

    move-object/from16 v0, p0

    invoke-direct {v0, v6, v15}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4864
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move/from16 v0, p3

    invoke-virtual {v15, v11, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4865
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v16, 0xa7

    move/from16 v0, v16

    move/from16 v1, p4

    invoke-virtual {v15, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto/16 :goto_2

    .line 4846
    .end local v6    # "name":Ljava/lang/String;
    .end local v11    # "testCode":I
    :sswitch_1
    const-string v6, "eq"

    .line 4847
    .restart local v6    # "name":Ljava/lang/String;
    const/16 v11, 0x99

    .line 4848
    .restart local v11    # "testCode":I
    goto :goto_4

    .line 4850
    .end local v6    # "name":Ljava/lang/String;
    .end local v11    # "testCode":I
    :sswitch_2
    const-string v6, "shallowEq"

    .line 4851
    .restart local v6    # "name":Ljava/lang/String;
    const/16 v11, 0x9a

    .line 4852
    .restart local v11    # "testCode":I
    goto :goto_4

    .line 4854
    .end local v6    # "name":Ljava/lang/String;
    .end local v11    # "testCode":I
    :sswitch_3
    const-string v6, "shallowEq"

    .line 4855
    .restart local v6    # "name":Ljava/lang/String;
    const/16 v11, 0x99

    .line 4856
    .restart local v11    # "testCode":I
    goto :goto_4

    .line 4868
    .end local v4    # "child_dcp_register":I
    .end local v6    # "name":Ljava/lang/String;
    .end local v11    # "testCode":I
    :cond_c
    return-void

    .line 4840
    nop

    :sswitch_data_0
    .sparse-switch
        0xc -> :sswitch_0
        0xd -> :sswitch_1
        0x2e -> :sswitch_2
        0x2f -> :sswitch_3
    .end sparse-switch
.end method

.method private visitIfJumpRelOp(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;II)V
    .locals 17
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "trueGOTO"    # I
    .param p4, "falseGOTO"    # I

    .prologue
    .line 4668
    const/4 v12, -0x1

    move/from16 v0, p3

    if-eq v0, v12, :cond_0

    const/4 v12, -0x1

    move/from16 v0, p4

    if-ne v0, v12, :cond_1

    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v12

    throw v12

    .line 4669
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v11

    .line 4670
    .local v11, "type":I
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 4671
    .local v6, "rChild":Lorg/mozilla/javascript/Node;
    const/16 v12, 0x35

    if-eq v11, v12, :cond_2

    const/16 v12, 0x34

    if-ne v11, v12, :cond_4

    .line 4672
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4673
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4674
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v0, p0

    iget-short v13, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4675
    const/16 v12, 0x35

    if-ne v11, v12, :cond_3

    const-string v12, "instanceOf"

    :goto_0
    const-string v13, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z"

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4681
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0x9a

    move/from16 v0, p3

    invoke-virtual {v12, v13, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4682
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0xa7

    move/from16 v0, p4

    invoke-virtual {v12, v13, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4767
    :goto_1
    return-void

    .line 4675
    :cond_3
    const-string v12, "in"

    goto :goto_0

    .line 4685
    :cond_4
    const/16 v12, 0x8

    const/4 v13, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v3

    .line 4686
    .local v3, "childNumberFlag":I
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lorg/mozilla/javascript/Node;)I

    move-result v5

    .line 4687
    .local v5, "left_dcp_register":I
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lorg/mozilla/javascript/Node;)I

    move-result v8

    .line 4688
    .local v8, "right_dcp_register":I
    const/4 v12, -0x1

    if-eq v3, v12, :cond_9

    .line 4692
    const/4 v12, 0x2

    if-eq v3, v12, :cond_5

    .line 4694
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4702
    :goto_2
    const/4 v12, 0x1

    if-eq v3, v12, :cond_7

    .line 4704
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4712
    :goto_3
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-direct {v0, v11, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->genSimpleCompare(III)V

    goto :goto_1

    .line 4695
    :cond_5
    const/4 v12, -0x1

    if-eq v5, v12, :cond_6

    .line 4696
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    goto :goto_2

    .line 4698
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4699
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    goto :goto_2

    .line 4705
    :cond_7
    const/4 v12, -0x1

    if-eq v8, v12, :cond_8

    .line 4706
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    goto :goto_3

    .line 4708
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4709
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    goto :goto_3

    .line 4715
    :cond_9
    const/4 v12, -0x1

    if-eq v5, v12, :cond_f

    const/4 v12, -0x1

    if-eq v8, v12, :cond_f

    .line 4718
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v10

    .line 4719
    .local v10, "stack":S
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    .line 4720
    .local v4, "leftIsNotNumber":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4721
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0xb2

    const-string v14, "java/lang/Void"

    const-string v15, "TYPE"

    const-string v16, "Ljava/lang/Class;"

    invoke-virtual/range {v12 .. v16}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4725
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0xa6

    invoke-virtual {v12, v13, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4726
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v13, v5, 0x1

    invoke-virtual {v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4727
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    .line 4728
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-direct {v0, v11, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->genSimpleCompare(III)V

    .line 4729
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v12

    if-eq v10, v12, :cond_a

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v12

    throw v12

    .line 4731
    :cond_a
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 4732
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v7

    .line 4733
    .local v7, "rightIsNotNumber":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4734
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0xb2

    const-string v14, "java/lang/Void"

    const-string v15, "TYPE"

    const-string v16, "Ljava/lang/Class;"

    invoke-virtual/range {v12 .. v16}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4738
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0xa6

    invoke-virtual {v12, v13, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4739
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4740
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4741
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v13, v8, 0x1

    invoke-virtual {v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4742
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-direct {v0, v11, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->genSimpleCompare(III)V

    .line 4743
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v12

    if-eq v10, v12, :cond_b

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v12

    throw v12

    .line 4745
    :cond_b
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v7}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 4747
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4748
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v12, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4755
    .end local v4    # "leftIsNotNumber":I
    .end local v7    # "rightIsNotNumber":I
    .end local v10    # "stack":S
    :goto_4
    const/16 v12, 0x11

    if-eq v11, v12, :cond_c

    const/16 v12, 0x10

    if-ne v11, v12, :cond_d

    .line 4756
    :cond_c
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0x5f

    invoke-virtual {v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4758
    :cond_d
    const/16 v12, 0xe

    if-eq v11, v12, :cond_e

    const/16 v12, 0x10

    if-ne v11, v12, :cond_10

    :cond_e
    const-string v9, "cmp_LT"

    .line 4760
    .local v9, "routine":Ljava/lang/String;
    :goto_5
    const-string v12, "(Ljava/lang/Object;Ljava/lang/Object;)Z"

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v12}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4764
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0x9a

    move/from16 v0, p3

    invoke-virtual {v12, v13, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4765
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v13, 0xa7

    move/from16 v0, p4

    invoke-virtual {v12, v13, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto/16 :goto_1

    .line 4751
    .end local v9    # "routine":Ljava/lang/String;
    :cond_f
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4752
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v6, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_4

    .line 4758
    :cond_10
    const-string v9, "cmp_LE"

    goto :goto_5
.end method

.method private visitIncDec(Lorg/mozilla/javascript/Node;)V
    .locals 14
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4373
    const/16 v10, 0xd

    invoke-virtual {p1, v10}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v4

    .line 4374
    .local v4, "incrDecrMask":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 4375
    .local v0, "child":Lorg/mozilla/javascript/Node;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v10

    sparse-switch v10, :sswitch_data_0

    .line 4525
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    .line 4527
    :cond_0
    :goto_0
    return-void

    .line 4377
    :sswitch_0
    iget-boolean v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v10, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 4378
    :cond_1
    and-int/lit8 v10, v4, 0x2

    if-eqz v10, :cond_2

    const/4 v6, 0x1

    .line 4379
    .local v6, "post":Z
    :goto_1
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v10, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v9

    .line 4380
    .local v9, "varIndex":I
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v8, v10, v9

    .line 4381
    .local v8, "reg":S
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    iget-object v10, v10, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v10}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v1

    .line 4382
    .local v1, "constDeclarations":[Z
    aget-boolean v10, v1, v9

    if-eqz v10, :cond_9

    .line 4383
    const/16 v10, 0x8

    const/4 v11, -0x1

    invoke-virtual {p1, v10, v11}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_5

    .line 4384
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v10

    if-eqz v10, :cond_3

    const/4 v5, 0x1

    .line 4385
    .local v5, "offset":I
    :goto_2
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int v11, v8, v5

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4386
    if-nez v6, :cond_0

    .line 4387
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v10, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 4388
    and-int/lit8 v10, v4, 0x1

    if-nez v10, :cond_4

    .line 4389
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x63

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 4378
    .end local v1    # "constDeclarations":[Z
    .end local v5    # "offset":I
    .end local v6    # "post":Z
    .end local v8    # "reg":S
    .end local v9    # "varIndex":I
    :cond_2
    const/4 v6, 0x0

    goto :goto_1

    .line 4384
    .restart local v1    # "constDeclarations":[Z
    .restart local v6    # "post":Z
    .restart local v8    # "reg":S
    .restart local v9    # "varIndex":I
    :cond_3
    const/4 v5, 0x0

    goto :goto_2

    .line 4391
    .restart local v5    # "offset":I
    :cond_4
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x67

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 4395
    .end local v5    # "offset":I
    :cond_5
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 4396
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    .line 4400
    :goto_3
    if-eqz v6, :cond_7

    .line 4401
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x59

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4402
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4403
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x58

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 4398
    :cond_6
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_3

    .line 4405
    :cond_7
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4406
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v10, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 4407
    and-int/lit8 v10, v4, 0x1

    if-nez v10, :cond_8

    .line 4408
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x63

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4412
    :goto_4
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    goto/16 :goto_0

    .line 4410
    :cond_8
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x67

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 4417
    :cond_9
    const/16 v10, 0x8

    const/4 v11, -0x1

    invoke-virtual {p1, v10, v11}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_e

    .line 4418
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v10

    if-eqz v10, :cond_c

    const/4 v5, 0x1

    .line 4419
    .restart local v5    # "offset":I
    :goto_5
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int v11, v8, v5

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4420
    if-eqz v6, :cond_a

    .line 4421
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x5c

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4423
    :cond_a
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v10, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 4424
    and-int/lit8 v10, v4, 0x1

    if-nez v10, :cond_d

    .line 4425
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x63

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4429
    :goto_6
    if-nez v6, :cond_b

    .line 4430
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x5c

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4432
    :cond_b
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int v11, v8, v5

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addDStore(I)V

    goto/16 :goto_0

    .line 4418
    .end local v5    # "offset":I
    :cond_c
    const/4 v5, 0x0

    goto :goto_5

    .line 4427
    .restart local v5    # "offset":I
    :cond_d
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x67

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_6

    .line 4434
    .end local v5    # "offset":I
    :cond_e
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v10

    if-eqz v10, :cond_11

    .line 4435
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    .line 4439
    :goto_7
    if-eqz v6, :cond_f

    .line 4440
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x59

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4442
    :cond_f
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4443
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v10, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 4444
    and-int/lit8 v10, v4, 0x1

    if-nez v10, :cond_12

    .line 4445
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x63

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4449
    :goto_8
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4450
    if-nez v6, :cond_10

    .line 4451
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x59

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4453
    :cond_10
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_0

    .line 4437
    :cond_11
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_7

    .line 4447
    :cond_12
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0x67

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_8

    .line 4457
    .end local v1    # "constDeclarations":[Z
    .end local v6    # "post":Z
    .end local v8    # "reg":S
    .end local v9    # "varIndex":I
    :sswitch_1
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4458
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4459
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4460
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 4461
    const-string v10, "nameIncrDecr"

    const-string v11, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4468
    :sswitch_2
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 4470
    :sswitch_3
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 4471
    .local v3, "getPropChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4472
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    invoke-direct {p0, v10, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4473
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4474
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4475
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 4476
    const-string v10, "propIncrDecr"

    const-string v11, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4485
    .end local v3    # "getPropChild":Lorg/mozilla/javascript/Node;
    :sswitch_4
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 4486
    .local v2, "elemChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4487
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    invoke-direct {p0, v10, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4488
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4489
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4490
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 4491
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    const/16 v11, 0x8

    const/4 v12, -0x1

    invoke-virtual {v10, v11, v12}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_13

    .line 4492
    const-string v10, "elemIncrDecr"

    const-string v11, "(Ljava/lang/Object;DLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4500
    :cond_13
    const-string v10, "elemIncrDecr"

    const-string v11, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4511
    .end local v2    # "elemChild":Lorg/mozilla/javascript/Node;
    :sswitch_5
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    .line 4512
    .local v7, "refChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v7, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4513
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4514
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4515
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 4516
    const-string v10, "refIncrDecr"

    const-string v11, "(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4375
    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_3
        0x22 -> :sswitch_2
        0x24 -> :sswitch_4
        0x27 -> :sswitch_1
        0x37 -> :sswitch_0
        0x43 -> :sswitch_5
    .end sparse-switch
.end method

.method private visitObjectLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V
    .locals 12
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "topLevel"    # Z

    .prologue
    const/16 v11, 0x98

    const/16 v10, 0x97

    const/16 v9, 0xa

    .line 3189
    const/16 v7, 0xc

    invoke-virtual {p1, v7}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Object;

    move-object v6, v7

    check-cast v6, [Ljava/lang/Object;

    .line 3190
    .local v6, "properties":[Ljava/lang/Object;
    array-length v2, v6

    .line 3193
    .local v2, "count":I
    if-nez p3, :cond_2

    if-gt v2, v9, :cond_0

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lorg/mozilla/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v7

    const/16 v8, 0x7530

    if-le v7, v8, :cond_2

    :cond_0
    iget-boolean v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v7, :cond_2

    iget-boolean v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v7, :cond_2

    iget-boolean v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inLocalBlock:Z

    if-nez v7, :cond_2

    .line 3195
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    if-nez v7, :cond_1

    .line 3196
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    iput-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    .line 3198
    :cond_1
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v7, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3199
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v8, v9}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_literal"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3200
    .local v5, "methodName":Ljava/lang/String;
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3201
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3202
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3203
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3204
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3205
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v8, 0xb6

    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v9, v9, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v10, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {v7, v8, v9, v5, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3269
    .end local v5    # "methodName":Ljava/lang/String;
    :goto_0
    return-void

    .line 3214
    :cond_2
    iget-boolean v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v7, :cond_5

    .line 3217
    invoke-direct {p0, p1, p2, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addLoadPropertyValues(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;I)V

    .line 3218
    invoke-direct {p0, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addLoadPropertyIds([Ljava/lang/Object;I)V

    .line 3220
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v8, 0x5f

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3227
    :goto_1
    const/4 v3, 0x0

    .line 3228
    .local v3, "hasGetterSetters":Z
    move-object v0, p2

    .line 3229
    .local v0, "child2":Lorg/mozilla/javascript/Node;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    if-eq v4, v2, :cond_4

    .line 3230
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    .line 3231
    .local v1, "childType":I
    if-eq v1, v10, :cond_3

    if-ne v1, v11, :cond_6

    .line 3232
    :cond_3
    const/4 v3, 0x1

    .line 3238
    .end local v1    # "childType":I
    :cond_4
    if-eqz v3, :cond_9

    .line 3239
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3240
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v8, 0xbc

    invoke-virtual {v7, v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 3241
    move-object v0, p2

    .line 3242
    const/4 v4, 0x0

    :goto_3
    if-eq v4, v2, :cond_a

    .line 3243
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v8, 0x59

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3244
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3245
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    .line 3246
    .restart local v1    # "childType":I
    if-ne v1, v10, :cond_7

    .line 3247
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v8, 0x2

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3253
    :goto_4
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v8, 0x4f

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3254
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3242
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 3222
    .end local v0    # "child2":Lorg/mozilla/javascript/Node;
    .end local v1    # "childType":I
    .end local v3    # "hasGetterSetters":Z
    .end local v4    # "i":I
    :cond_5
    invoke-direct {p0, v6, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addLoadPropertyIds([Ljava/lang/Object;I)V

    .line 3223
    invoke-direct {p0, p1, p2, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addLoadPropertyValues(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;I)V

    goto :goto_1

    .line 3235
    .restart local v0    # "child2":Lorg/mozilla/javascript/Node;
    .restart local v1    # "childType":I
    .restart local v3    # "hasGetterSetters":Z
    .restart local v4    # "i":I
    :cond_6
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3229
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 3248
    :cond_7
    if-ne v1, v11, :cond_8

    .line 3249
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v8, 0x4

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 3251
    :cond_8
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v8, 0x3

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 3257
    .end local v1    # "childType":I
    :cond_9
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3260
    :cond_a
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3261
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3262
    const-string v7, "newObjectLiteral"

    const-string v8, "([Ljava/lang/Object;[Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private visitOptimizedCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/optimizer/OptFunctionNode;ILorg/mozilla/javascript/Node;)V
    .locals 15
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "target"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p3, "type"    # I
    .param p4, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3451
    invoke-virtual/range {p4 .. p4}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 3452
    .local v6, "firstArgChild":Lorg/mozilla/javascript/Node;
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v4, v9, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 3454
    .local v4, "className":Ljava/lang/String;
    const/4 v8, 0x0

    .line 3455
    .local v8, "thisObjLocal":S
    const/16 v9, 0x1e

    move/from16 v0, p3

    if-ne v0, v9, :cond_0

    .line 3456
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3464
    :goto_0
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    .line 3465
    .local v3, "beyond":I
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v7

    .line 3467
    .local v7, "regularCall":I
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0x59

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3468
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xc1

    invoke-virtual {v9, v10, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3469
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0x99

    invoke-virtual {v9, v10, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 3470
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xc0

    invoke-virtual {v9, v10, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3471
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0x59

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3472
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xb4

    const-string v11, "_id"

    const-string v12, "I"

    invoke-virtual {v9, v10, v4, v11, v12}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3473
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v0, p2

    iget-object v11, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v10, v11}, Lorg/mozilla/javascript/optimizer/Codegen;->getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I

    move-result v10

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3474
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xa0

    invoke-virtual {v9, v10, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 3477
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3478
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3481
    const/16 v9, 0x1e

    move/from16 v0, p3

    if-ne v0, v9, :cond_1

    .line 3482
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3494
    :goto_1
    move-object v2, v6

    .line 3495
    .local v2, "argChild":Lorg/mozilla/javascript/Node;
    :goto_2
    if-eqz v2, :cond_4

    .line 3496
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lorg/mozilla/javascript/Node;)I

    move-result v5

    .line 3497
    .local v5, "dcp_register":I
    if-ltz v5, :cond_2

    .line 3498
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3499
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v10, v5, 0x1

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 3512
    :goto_3
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 3513
    goto :goto_2

    .line 3458
    .end local v2    # "argChild":Lorg/mozilla/javascript/Node;
    .end local v3    # "beyond":I
    .end local v5    # "dcp_register":I
    .end local v7    # "regularCall":I
    :cond_0
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3459
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v8

    .line 3460
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_0

    .line 3484
    .restart local v3    # "beyond":I
    .restart local v7    # "regularCall":I
    :cond_1
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_1

    .line 3500
    .restart local v2    # "argChild":Lorg/mozilla/javascript/Node;
    .restart local v5    # "dcp_register":I
    :cond_2
    const/16 v9, 0x8

    const/4 v10, -0x1

    invoke-virtual {v2, v9, v10}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v9

    if-nez v9, :cond_3

    .line 3503
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xb2

    const-string v11, "java/lang/Void"

    const-string v12, "TYPE"

    const-string v13, "Ljava/lang/Class;"

    invoke-virtual {v9, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3507
    move-object/from16 v0, p1

    invoke-direct {p0, v2, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_3

    .line 3509
    :cond_3
    move-object/from16 v0, p1

    invoke-direct {p0, v2, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3510
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-wide/16 v10, 0x0

    invoke-virtual {v9, v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    goto :goto_3

    .line 3515
    .end local v5    # "dcp_register":I
    :cond_4
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xb2

    const-string v11, "org/mozilla/javascript/ScriptRuntime"

    const-string v12, "emptyArgs"

    const-string v13, "[Ljava/lang/Object;"

    invoke-virtual {v9, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3518
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v11, 0xb8

    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v12, v9, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const/16 v9, 0x1e

    move/from16 v0, p3

    if-ne v0, v9, :cond_6

    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v0, p2

    iget-object v13, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v9, v13}, Lorg/mozilla/javascript/optimizer/Codegen;->getDirectCtorName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v9

    :goto_4
    iget-object v13, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v0, p2

    iget-object v14, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v13, v14}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v11, v12, v9, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3525
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xa7

    invoke-virtual {v9, v10, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 3527
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v7}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3529
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3530
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3532
    const/16 v9, 0x1e

    move/from16 v0, p3

    if-eq v0, v9, :cond_5

    .line 3533
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3534
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 3539
    :cond_5
    const/4 v9, 0x1

    move-object/from16 v0, p1

    invoke-direct {p0, v0, v6, v9}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3541
    const/16 v9, 0x1e

    move/from16 v0, p3

    if-ne v0, v9, :cond_7

    .line 3542
    const-string v9, "newObject"

    const-string v10, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3560
    :goto_5
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3561
    return-void

    .line 3518
    :cond_6
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    move-object/from16 v0, p2

    iget-object v13, v0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v9, v13}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v9

    goto :goto_4

    .line 3550
    :cond_7
    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v10, 0xb9

    const-string v11, "org/mozilla/javascript/Callable"

    const-string v12, "call"

    const-string v13, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {v9, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5
.end method

.method private visitSetConst(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4912
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .line 4913
    .local v0, "name":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    .line 4914
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4915
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    goto :goto_0

    .line 4917
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4918
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4919
    const-string v1, "setConst"

    const-string v2, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4926
    return-void
.end method

.method private visitSetConstVar(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V
    .locals 11
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "needValue"    # Z

    .prologue
    const/16 v10, 0xa7

    const/16 v9, 0x9a

    const/4 v8, -0x1

    const/4 v6, 0x1

    .line 5012
    iget-boolean v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v7, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 5013
    :cond_0
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v7, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v5

    .line 5014
    .local v5, "varIndex":I
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-direct {p0, v7, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5015
    const/16 v7, 0x8

    invoke-virtual {p1, v7, v8}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v7

    if-eq v7, v8, :cond_1

    move v1, v6

    .line 5016
    .local v1, "isNumber":Z
    :goto_0
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v3, v7, v5

    .line 5017
    .local v3, "reg":S
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5018
    .local v0, "beyond":I
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 5019
    .local v2, "noAssign":I
    if-eqz v1, :cond_3

    .line 5020
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v8, v3, 0x2

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 5021
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7, v9, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5022
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v4

    .line 5023
    .local v4, "stack":S
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 5024
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v7, v3, 0x2

    invoke-virtual {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addIStore(I)V

    .line 5025
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addDStore(I)V

    .line 5026
    if-eqz p3, :cond_2

    .line 5027
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 5028
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v2, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5051
    :goto_1
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 5052
    return-void

    .line 5015
    .end local v0    # "beyond":I
    .end local v1    # "isNumber":Z
    .end local v2    # "noAssign":I
    .end local v3    # "reg":S
    .end local v4    # "stack":S
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 5030
    .restart local v0    # "beyond":I
    .restart local v1    # "isNumber":Z
    .restart local v2    # "noAssign":I
    .restart local v3    # "reg":S
    .restart local v4    # "stack":S
    :cond_2
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v10, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5031
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v2, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5032
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v7, 0x58

    invoke-virtual {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 5036
    .end local v4    # "stack":S
    :cond_3
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 5037
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7, v9, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5038
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v4

    .line 5039
    .restart local v4    # "stack":S
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v7, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 5040
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addIStore(I)V

    .line 5041
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 5042
    if-eqz p3, :cond_4

    .line 5043
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5044
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v2, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    goto :goto_1

    .line 5046
    :cond_4
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v10, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 5047
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v6, v2, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5048
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v7, 0x57

    invoke-virtual {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_1
.end method

.method private visitSetElem(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 5
    .param p1, "type"    # I
    .param p2, "node"    # Lorg/mozilla/javascript/Node;
    .param p3, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/16 v4, 0x8c

    const/4 v3, -0x1

    .line 5150
    invoke-direct {p0, p3, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5151
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p3

    .line 5152
    if-ne p1, v4, :cond_0

    .line 5153
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5155
    :cond_0
    invoke-direct {p0, p3, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5156
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p3

    .line 5157
    const/16 v1, 0x8

    invoke-virtual {p2, v1, v3}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v1

    if-eq v1, v3, :cond_2

    const/4 v0, 0x1

    .line 5158
    .local v0, "indexIsNumber":Z
    :goto_0
    if-ne p1, v4, :cond_1

    .line 5159
    if-eqz v0, :cond_3

    .line 5162
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5163
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5164
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5165
    const-string v1, "getObjectIndex"

    const-string v2, "(Ljava/lang/Object;DLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5186
    :cond_1
    :goto_1
    invoke-direct {p0, p3, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5187
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5188
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5189
    if-eqz v0, :cond_4

    .line 5190
    const-string v1, "setObjectIndex"

    const-string v2, "(Ljava/lang/Object;DLjava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5208
    :goto_2
    return-void

    .line 5157
    .end local v0    # "indexIsNumber":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 5174
    .restart local v0    # "indexIsNumber":Z
    :cond_3
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v2, 0x5a

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5175
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5176
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5177
    const-string v1, "getObjectElem"

    const-string v2, "(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 5199
    :cond_4
    const-string v1, "setObjectElem"

    const-string v2, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method private visitSetName(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4872
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .line 4873
    .local v0, "name":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    .line 4874
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4875
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    goto :goto_0

    .line 4877
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4878
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4879
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4880
    const-string v1, "setName"

    const-string v2, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4888
    return-void
.end method

.method private visitSetProp(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 5
    .param p1, "type"    # I
    .param p2, "node"    # Lorg/mozilla/javascript/Node;
    .param p3, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/16 v4, 0x8b

    .line 5099
    move-object v1, p3

    .line 5100
    .local v1, "objectChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p3, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5101
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p3

    .line 5102
    if-ne p1, v4, :cond_0

    .line 5103
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5105
    :cond_0
    move-object v0, p3

    .line 5106
    .local v0, "nameChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p3, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5107
    invoke-virtual {p3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p3

    .line 5108
    if-ne p1, v4, :cond_1

    .line 5110
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0x5a

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5113
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    const/16 v3, 0x2b

    if-ne v2, v3, :cond_2

    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    const/16 v3, 0x29

    if-ne v2, v3, :cond_2

    .line 5116
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5117
    const-string v2, "getObjectProp"

    const-string v3, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5135
    :cond_1
    :goto_0
    invoke-direct {p0, p3, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 5136
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5137
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5138
    const-string v2, "setObjectProp"

    const-string v3, "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5146
    return-void

    .line 5124
    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5125
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 5126
    const-string v2, "getObjectProp"

    const-string v3, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private visitSetVar(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V
    .locals 13
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;
    .param p3, "needValue"    # Z

    .prologue
    .line 4952
    iget-boolean v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v8, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 4953
    :cond_0
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v8, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v7

    .line 4954
    .local v7, "varIndex":I
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    invoke-direct {p0, v8, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4955
    const/16 v8, 0x8

    const/4 v9, -0x1

    invoke-virtual {p1, v8, v9}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_2

    const/4 v2, 0x1

    .line 4956
    .local v2, "isNumber":Z
    :goto_0
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v5, v8, v7

    .line 4957
    .local v5, "reg":S
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    iget-object v8, v8, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v1

    .line 4958
    .local v1, "constDeclarations":[Z
    aget-boolean v8, v1, v7

    if-eqz v8, :cond_4

    .line 4959
    if-nez p3, :cond_1

    .line 4960
    if-eqz v2, :cond_3

    .line 4961
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0x58

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 5008
    :cond_1
    :goto_1
    return-void

    .line 4955
    .end local v1    # "constDeclarations":[Z
    .end local v2    # "isNumber":Z
    .end local v5    # "reg":S
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 4963
    .restart local v1    # "constDeclarations":[Z
    .restart local v2    # "isNumber":Z
    .restart local v5    # "reg":S
    :cond_3
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0x57

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 4966
    :cond_4
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 4967
    if-eqz v2, :cond_6

    .line 4968
    if-eqz p3, :cond_5

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0x5c

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4969
    :cond_5
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4970
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0xb2

    const-string v10, "java/lang/Void"

    const-string v11, "TYPE"

    const-string v12, "Ljava/lang/Class;"

    invoke-virtual {v8, v9, v10, v11, v12}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4974
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    .line 4975
    .local v3, "isNumberLabel":I
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 4976
    .local v0, "beyond":I
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0xa5

    invoke-virtual {v8, v9, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4977
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v6

    .line 4978
    .local v6, "stack":S
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4979
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 4980
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0xa7

    invoke-virtual {v8, v9, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4981
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v3, v6}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 4982
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    add-int/lit8 v9, v5, 0x1

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->addDStore(I)V

    .line 4983
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    goto :goto_1

    .line 4986
    .end local v0    # "beyond":I
    .end local v3    # "isNumberLabel":I
    .end local v6    # "stack":S
    :cond_6
    if-eqz p3, :cond_7

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0x59

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4987
    :cond_7
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto :goto_1

    .line 4990
    :cond_8
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v8, v7}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v4

    .line 4991
    .local v4, "isNumberVar":Z
    if-eqz v2, :cond_b

    .line 4992
    if-eqz v4, :cond_9

    .line 4993
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addDStore(I)V

    .line 4994
    if-eqz p3, :cond_1

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    goto/16 :goto_1

    .line 4996
    :cond_9
    if-eqz p3, :cond_a

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v9, 0x5c

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 4999
    :cond_a
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 5000
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    goto/16 :goto_1

    .line 5003
    :cond_b
    if-eqz v4, :cond_c

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 5004
    :cond_c
    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 5005
    if-eqz p3, :cond_1

    iget-object v8, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    goto/16 :goto_1
.end method

.method private visitSpecialCall(Lorg/mozilla/javascript/Node;IILorg/mozilla/javascript/Node;)V
    .locals 6
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "type"    # I
    .param p3, "specialType"    # I
    .param p4, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/16 v5, 0x1e

    .line 3274
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3276
    if-ne p2, v5, :cond_0

    .line 3277
    invoke-direct {p0, p4, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3283
    :goto_0
    invoke-virtual {p4}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p4

    .line 3285
    const/4 v3, 0x0

    invoke-direct {p0, p1, p4, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3290
    if-ne p2, v5, :cond_1

    .line 3291
    const-string v1, "newObjectSpecial"

    .line 3292
    .local v1, "methodName":Ljava/lang/String;
    const-string v0, "(Lorg/mozilla/javascript/Context;Ljava/lang/Object;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;"

    .line 3299
    .local v0, "callSignature":Ljava/lang/String;
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3300
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3301
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3321
    :goto_1
    invoke-direct {p0, v1, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3322
    return-void

    .line 3280
    .end local v0    # "callSignature":Ljava/lang/String;
    .end local v1    # "methodName":Ljava/lang/String;
    :cond_0
    invoke-direct {p0, p4, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 3303
    :cond_1
    const-string v1, "callSpecial"

    .line 3304
    .restart local v1    # "methodName":Ljava/lang/String;
    const-string v0, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;"

    .line 3313
    .restart local v0    # "callSignature":Ljava/lang/String;
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3314
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3315
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 3316
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v2

    .line 3317
    .local v2, "sourceName":Ljava/lang/String;
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    if-nez v2, :cond_2

    const-string v2, ""

    .end local v2    # "sourceName":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3318
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->itsLineNumber:I

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    goto :goto_1
.end method

.method private visitStandardCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 12
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3326
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v10

    const/16 v11, 0x26

    if-eq v10, v11, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 3328
    :cond_0
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 3329
    .local v3, "firstArgChild":Lorg/mozilla/javascript/Node;
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v2

    .line 3334
    .local v2, "childType":I
    if-nez v3, :cond_4

    .line 3335
    const/16 v10, 0x27

    if-ne v2, v10, :cond_1

    .line 3337
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v6

    .line 3338
    .local v6, "name":Ljava/lang/String;
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3339
    const-string v5, "callName0"

    .line 3340
    .local v5, "methodName":Ljava/lang/String;
    const-string v9, "(Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .line 3422
    .end local v6    # "name":Ljava/lang/String;
    .local v9, "signature":Ljava/lang/String;
    :goto_0
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3423
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v11, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3424
    invoke-direct {p0, v5, v9}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3425
    return-void

    .line 3344
    .end local v5    # "methodName":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    :cond_1
    const/16 v10, 0x21

    if-ne v2, v10, :cond_2

    .line 3346
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    .line 3347
    .local v7, "propTarget":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v7, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3348
    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v4

    .line 3349
    .local v4, "id":Lorg/mozilla/javascript/Node;
    invoke-virtual {v4}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v8

    .line 3350
    .local v8, "property":Ljava/lang/String;
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3351
    const-string v5, "callProp0"

    .line 3352
    .restart local v5    # "methodName":Ljava/lang/String;
    const-string v9, "(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .line 3357
    .restart local v9    # "signature":Ljava/lang/String;
    goto :goto_0

    .end local v4    # "id":Lorg/mozilla/javascript/Node;
    .end local v5    # "methodName":Ljava/lang/String;
    .end local v7    # "propTarget":Lorg/mozilla/javascript/Node;
    .end local v8    # "property":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    :cond_2
    const/16 v10, 0x22

    if-ne v2, v10, :cond_3

    .line 3358
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 3360
    :cond_3
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3361
    const-string v5, "call0"

    .line 3362
    .restart local v5    # "methodName":Ljava/lang/String;
    const-string v9, "(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .restart local v9    # "signature":Ljava/lang/String;
    goto :goto_0

    .line 3369
    .end local v5    # "methodName":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    :cond_4
    const/16 v10, 0x27

    if-ne v2, v10, :cond_5

    .line 3374
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v6

    .line 3375
    .restart local v6    # "name":Ljava/lang/String;
    const/4 v10, 0x0

    invoke-direct {p0, p1, v3, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3376
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v10, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3377
    const-string v5, "callName"

    .line 3378
    .restart local v5    # "methodName":Ljava/lang/String;
    const-string v9, "([Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .line 3383
    .restart local v9    # "signature":Ljava/lang/String;
    goto :goto_0

    .line 3384
    .end local v5    # "methodName":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    :cond_5
    const/4 v1, 0x0

    .line 3385
    .local v1, "argCount":I
    move-object v0, v3

    .local v0, "arg":Lorg/mozilla/javascript/Node;
    :goto_1
    if-eqz v0, :cond_6

    .line 3386
    add-int/lit8 v1, v1, 0x1

    .line 3385
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    goto :goto_1

    .line 3388
    :cond_6
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3390
    const/4 v10, 0x1

    if-ne v1, v10, :cond_7

    .line 3391
    invoke-direct {p0, v3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3392
    const-string v5, "call1"

    .line 3393
    .restart local v5    # "methodName":Ljava/lang/String;
    const-string v9, "(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .restart local v9    # "signature":Ljava/lang/String;
    goto :goto_0

    .line 3399
    .end local v5    # "methodName":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    :cond_7
    const/4 v10, 0x2

    if-ne v1, v10, :cond_8

    .line 3400
    invoke-direct {p0, v3, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3401
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v10

    invoke-direct {p0, v10, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3402
    const-string v5, "call2"

    .line 3403
    .restart local v5    # "methodName":Ljava/lang/String;
    const-string v9, "(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .restart local v9    # "signature":Ljava/lang/String;
    goto :goto_0

    .line 3411
    .end local v5    # "methodName":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    :cond_8
    const/4 v10, 0x0

    invoke-direct {p0, p1, v3, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3412
    const-string v5, "callN"

    .line 3413
    .restart local v5    # "methodName":Ljava/lang/String;
    const-string v9, "(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    .restart local v9    # "signature":Ljava/lang/String;
    goto/16 :goto_0
.end method

.method private visitStandardNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3429
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    const/16 v2, 0x1e

    if-eq v1, v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 3431
    :cond_0
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3433
    .local v0, "firstArgChild":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3435
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3436
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3438
    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCallArgArray(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Z)V

    .line 3439
    const-string v1, "newObject"

    const-string v2, "(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3446
    return-void
.end method

.method private visitStrictSetName(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4892
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .line 4893
    .local v0, "name":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    .line 4894
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4895
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    goto :goto_0

    .line 4897
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4898
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4899
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4900
    const-string v1, "strictSetName"

    const-string v2, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4908
    return-void
.end method

.method private visitSwitch(Lorg/mozilla/javascript/ast/Jump;Lorg/mozilla/javascript/Node;)V
    .locals 5
    .param p1, "switchNode"    # Lorg/mozilla/javascript/ast/Jump;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4268
    invoke-direct {p0, p2, p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4270
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v1

    .line 4271
    .local v1, "selector":S
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 4273
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/Jump;

    .line 4274
    .local v0, "caseNode":Lorg/mozilla/javascript/ast/Jump;
    :goto_0
    if-eqz v0, :cond_1

    .line 4277
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Jump;->getType()I

    move-result v3

    const/16 v4, 0x73

    if-eq v3, v4, :cond_0

    .line 4278
    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 4279
    :cond_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Jump;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 4280
    .local v2, "test":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v2, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateExpression(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 4281
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4282
    const-string v3, "shallowEq"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/Object;)Z"

    invoke-direct {p0, v3, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4286
    iget-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    const/16 v4, 0x9a

    invoke-direct {p0, v3, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addGoto(Lorg/mozilla/javascript/Node;I)V

    .line 4275
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Jump;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .end local v0    # "caseNode":Lorg/mozilla/javascript/ast/Jump;
    check-cast v0, Lorg/mozilla/javascript/ast/Jump;

    .restart local v0    # "caseNode":Lorg/mozilla/javascript/ast/Jump;
    goto :goto_0

    .line 4288
    .end local v2    # "test":Lorg/mozilla/javascript/Node;
    :cond_1
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 4289
    return-void
.end method

.method private visitTryCatchFinally(Lorg/mozilla/javascript/ast/Jump;Lorg/mozilla/javascript/Node;)V
    .locals 18
    .param p1, "node"    # Lorg/mozilla/javascript/ast/Jump;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3721
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v4

    .line 3722
    .local v4, "savedVariableObject":S
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v0, p0

    iget-short v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3723
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 3730
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v17

    .line 3731
    .local v17, "startLabel":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v3, 0x0

    move/from16 v0, v17

    invoke-virtual {v2, v0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 3733
    move-object/from16 v0, p1

    iget-object v8, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 3734
    .local v8, "catchTarget":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v13

    .line 3735
    .local v13, "finallyTarget":Lorg/mozilla/javascript/Node;
    const/4 v2, 0x5

    new-array v14, v2, [I

    .line 3737
    .local v14, "handlerLabels":[I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->pushExceptionInfo(Lorg/mozilla/javascript/ast/Jump;)V

    .line 3738
    if-eqz v8, :cond_0

    .line 3739
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    aput v3, v14, v2

    .line 3740
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    aput v3, v14, v2

    .line 3741
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    aput v3, v14, v2

    .line 3742
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v9

    .line 3743
    .local v9, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v9, :cond_0

    const/16 v2, 0xd

    invoke-virtual {v9, v2}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3745
    const/4 v2, 0x3

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    aput v3, v14, v2

    .line 3748
    .end local v9    # "cx":Lorg/mozilla/javascript/Context;
    :cond_0
    if-eqz v13, :cond_1

    .line 3749
    const/4 v2, 0x4

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    aput v3, v14, v2

    .line 3751
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    move/from16 v0, v17

    invoke-virtual {v2, v14, v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->setHandlers([II)V

    .line 3754
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v2, :cond_3

    if-eqz v13, :cond_3

    .line 3755
    new-instance v16, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;

    invoke-direct/range {v16 .. v16}, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;-><init>()V

    .line 3756
    .local v16, "ret":Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    if-nez v2, :cond_2

    .line 3757
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    .line 3760
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    move-object/from16 v0, v16

    invoke-interface {v2, v13, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3762
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-virtual {v13}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3765
    .end local v16    # "ret":Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
    :cond_3
    :goto_0
    if-eqz p2, :cond_5

    .line 3766
    move-object/from16 v0, p2

    if-ne v0, v8, :cond_4

    .line 3767
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v5

    .line 3768
    .local v5, "catchLabel":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3770
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3772
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3774
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    const/4 v3, 0x3

    invoke-virtual {v2, v3, v5}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3777
    .end local v5    # "catchLabel":I
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 3778
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    goto :goto_0

    .line 3782
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v15

    .line 3783
    .local v15, "realEnd":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0xa7

    invoke-virtual {v2, v3, v15}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 3785
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->getLocalBlockRegister(Lorg/mozilla/javascript/Node;)I

    move-result v6

    .line 3788
    .local v6, "exceptionLocal":I
    if-eqz v8, :cond_6

    .line 3790
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->labelId()I

    move-result v5

    .line 3797
    .restart local v5    # "catchLabel":I
    const/4 v3, 0x0

    const/4 v2, 0x0

    aget v7, v14, v2

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3804
    const/4 v3, 0x1

    const/4 v2, 0x1

    aget v7, v14, v2

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3812
    const/4 v3, 0x2

    const/4 v2, 0x2

    aget v7, v14, v2

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3816
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v9

    .line 3817
    .restart local v9    # "cx":Lorg/mozilla/javascript/Context;
    if-eqz v9, :cond_6

    const/16 v2, 0xd

    invoke-virtual {v9, v2}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 3820
    const/4 v3, 0x3

    const/4 v2, 0x3

    aget v7, v14, v2

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3828
    .end local v5    # "catchLabel":I
    .end local v9    # "cx":Lorg/mozilla/javascript/Context;
    :cond_6
    if-eqz v13, :cond_9

    .line 3829
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v11

    .line 3830
    .local v11, "finallyHandler":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v10

    .line 3831
    .local v10, "finallyEnd":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v11}, Lorg/mozilla/classfile/ClassFileWriter;->markHandler(I)V

    .line 3832
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v2, :cond_7

    .line 3833
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v3, 0x4

    aget v3, v14, v3

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3835
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 3838
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3839
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    move-object/from16 v0, p0

    iget-short v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 3842
    invoke-virtual {v13}, Lorg/mozilla/javascript/Node;->labelId()I

    move-result v12

    .line 3843
    .local v12, "finallyLabel":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v2, :cond_b

    .line 3844
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addGotoWithReturn(Lorg/mozilla/javascript/Node;)V

    .line 3851
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 3852
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v2, :cond_8

    .line 3853
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0xc0

    const-string v7, "java/lang/Throwable"

    invoke-virtual {v2, v3, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3854
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v3, 0xbf

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 3856
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v10}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3858
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v2, :cond_9

    .line 3859
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/4 v3, 0x0

    move/from16 v0, v17

    invoke-virtual {v2, v0, v12, v11, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addExceptionHandler(IIILjava/lang/String;)V

    .line 3863
    .end local v10    # "finallyEnd":I
    .end local v11    # "finallyHandler":I
    .end local v12    # "finallyLabel":I
    :cond_9
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 3864
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v2, v15}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 3866
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v2, :cond_a

    .line 3867
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionManager:Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->popExceptionInfo()V

    .line 3869
    :cond_a
    return-void

    .line 3846
    .restart local v10    # "finallyEnd":I
    .restart local v11    # "finallyHandler":I
    .restart local v12    # "finallyLabel":I
    :cond_b
    const/4 v2, 0x4

    aget v2, v14, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v2, v10}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->inlineFinally(Lorg/mozilla/javascript/Node;II)V

    goto :goto_1
.end method

.method private visitTypeofname(Lorg/mozilla/javascript/Node;)V
    .locals 10
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 4293
    iget-boolean v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-eqz v5, :cond_2

    .line 4294
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    iget-object v5, v5, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v5, p1}, Lorg/mozilla/javascript/ast/FunctionNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v4

    .line 4295
    .local v4, "varIndex":I
    if-ltz v4, :cond_2

    .line 4296
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-virtual {v5, v4}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 4297
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-string v6, "number"

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4330
    .end local v4    # "varIndex":I
    :goto_0
    return-void

    .line 4298
    .restart local v4    # "varIndex":I
    :cond_0
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 4299
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v1, v5, v4

    .line 4300
    .local v1, "dcp_register":I
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4301
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0xb2

    const-string v7, "java/lang/Void"

    const-string v8, "TYPE"

    const-string v9, "Ljava/lang/Class;"

    invoke-virtual {v5, v6, v7, v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4303
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 4304
    .local v2, "isNumberLabel":I
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0xa5

    invoke-virtual {v5, v6, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4305
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v3

    .line 4306
    .local v3, "stack":S
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4307
    const-string v5, "typeof"

    const-string v6, "(Ljava/lang/Object;)Ljava/lang/String;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4310
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 4311
    .local v0, "beyond":I
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const/16 v6, 0xa7

    invoke-virtual {v5, v6, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 4312
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(IS)V

    .line 4313
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    const-string v6, "number"

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4314
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v5, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    goto :goto_0

    .line 4316
    .end local v0    # "beyond":I
    .end local v1    # "dcp_register":I
    .end local v2    # "isNumberLabel":I
    .end local v3    # "stack":S
    :cond_1
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v6, v6, v4

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4317
    const-string v5, "typeof"

    const-string v6, "(Ljava/lang/Object;)Ljava/lang/String;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 4324
    .end local v4    # "varIndex":I
    :cond_2
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 4325
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4326
    const-string v5, "typeofName"

    const-string v6, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/String;"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method


# virtual methods
.method generateBodyCode()V
    .locals 9

    .prologue
    const/16 v8, 0xa

    .line 1258
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-static {v4}, Lorg/mozilla/javascript/optimizer/Codegen;->isGenerator(Lorg/mozilla/javascript/ast/ScriptNode;)Z

    move-result v4

    iput-boolean v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    .line 1261
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 1263
    iget-boolean v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v4, :cond_1

    .line 1267
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v5, v5, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Lorg/mozilla/javascript/Context;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Ljava/lang/Object;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Ljava/lang/Object;I)Ljava/lang/Object;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1273
    .local v3, "type":Ljava/lang/String;
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_gen"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3, v8}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1282
    .end local v3    # "type":Ljava/lang/String;
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generatePrologue()V

    .line 1284
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->fnCurrent:Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    if-eqz v4, :cond_2

    .line 1285
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/ScriptNode;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 1289
    .local v2, "treeTop":Lorg/mozilla/javascript/Node;
    :goto_1
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateStatement(Lorg/mozilla/javascript/Node;)V

    .line 1290
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateEpilogue()V

    .line 1292
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-short v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->localsMax:S

    add-int/lit8 v5, v5, 0x1

    int-to-short v5, v5

    invoke-virtual {v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1294
    iget-boolean v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v4, :cond_0

    .line 1297
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateGenerator()V

    .line 1300
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    if-eqz v4, :cond_3

    .line 1302
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_3

    .line 1303
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/Node;

    .line 1304
    .local v1, "node":Lorg/mozilla/javascript/Node;
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    .line 1305
    .local v3, "type":I
    packed-switch v3, :pswitch_data_0

    .line 1313
    invoke-static {v3}, Lorg/mozilla/javascript/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    .line 1302
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1277
    .end local v0    # "i":I
    .end local v1    # "node":Lorg/mozilla/javascript/Node;
    .end local v2    # "treeTop":Lorg/mozilla/javascript/Node;
    .end local v3    # "type":I
    :cond_1
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v8}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    goto :goto_0

    .line 1287
    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    .restart local v2    # "treeTop":Lorg/mozilla/javascript/Node;
    goto :goto_1

    .line 1307
    .restart local v0    # "i":I
    .restart local v1    # "node":Lorg/mozilla/javascript/Node;
    .restart local v3    # "type":I
    :pswitch_0
    add-int/lit8 v4, v0, 0x1

    invoke-direct {p0, v1, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateObjectLiteralFactory(Lorg/mozilla/javascript/Node;I)V

    goto :goto_3

    .line 1310
    :pswitch_1
    add-int/lit8 v4, v0, 0x1

    invoke-direct {p0, v1, v4}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateArrayLiteralFactory(Lorg/mozilla/javascript/Node;I)V

    goto :goto_3

    .line 1318
    .end local v0    # "i":I
    .end local v1    # "node":Lorg/mozilla/javascript/Node;
    .end local v3    # "type":I
    :cond_3
    return-void

    .line 1305
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
