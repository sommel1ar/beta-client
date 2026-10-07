.class public final Lorg/mozilla/javascript/Interpreter;
.super Lorg/mozilla/javascript/Icode;
.source "Interpreter.java"

# interfaces
.implements Lorg/mozilla/javascript/Evaluator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/Interpreter$1;,
        Lorg/mozilla/javascript/Interpreter$GeneratorState;,
        Lorg/mozilla/javascript/Interpreter$ContinuationJump;,
        Lorg/mozilla/javascript/Interpreter$CallFrame;
    }
.end annotation


# static fields
.field static final EXCEPTION_HANDLER_SLOT:I = 0x2

.field static final EXCEPTION_LOCAL_SLOT:I = 0x4

.field static final EXCEPTION_SCOPE_SLOT:I = 0x5

.field static final EXCEPTION_SLOT_SIZE:I = 0x6

.field static final EXCEPTION_TRY_END_SLOT:I = 0x1

.field static final EXCEPTION_TRY_START_SLOT:I = 0x0

.field static final EXCEPTION_TYPE_SLOT:I = 0x3


# instance fields
.field itsData:Lorg/mozilla/javascript/InterpreterData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 186
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/mozilla/javascript/Icode;-><init>()V

    .line 818
    return-void
.end method

.method private static addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "extra"    # I

    .prologue
    .line 3177
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    iget v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    sub-int/2addr v1, v2

    add-int/2addr v1, p2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 3178
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    iget v1, p0, Lorg/mozilla/javascript/Context;->instructionThreshold:I

    if-le v0, v1, :cond_0

    .line 3179
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Context;->observeInstructionCount(I)V

    .line 3180
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 3182
    :cond_0
    return-void
.end method

.method private static bytecodeSpan(I)I
    .locals 3
    .param p0, "bytecode"    # I

    .prologue
    const/4 v1, 0x5

    const/4 v2, 0x2

    const/4 v0, 0x3

    .line 493
    sparse-switch p0, :sswitch_data_0

    .line 570
    invoke-static {p0}, Lorg/mozilla/javascript/Interpreter;->validBytecode(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    :sswitch_0
    move v0, v1

    .line 571
    :goto_0
    :sswitch_1
    return v0

    :sswitch_2
    move v0, v2

    .line 518
    goto :goto_0

    :sswitch_3
    move v0, v2

    .line 526
    goto :goto_0

    :sswitch_4
    move v0, v1

    .line 534
    goto :goto_0

    :sswitch_5
    move v0, v2

    .line 538
    goto :goto_0

    :sswitch_6
    move v0, v1

    .line 546
    goto :goto_0

    :sswitch_7
    move v0, v2

    .line 550
    goto :goto_0

    :sswitch_8
    move v0, v1

    .line 558
    goto :goto_0

    :sswitch_9
    move v0, v2

    .line 564
    goto :goto_0

    .line 571
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 493
    nop

    :sswitch_data_0
    .sparse-switch
        -0x3f -> :sswitch_1
        -0x3e -> :sswitch_1
        -0x3d -> :sswitch_9
        -0x36 -> :sswitch_1
        -0x31 -> :sswitch_9
        -0x30 -> :sswitch_9
        -0x2f -> :sswitch_8
        -0x2e -> :sswitch_1
        -0x2d -> :sswitch_7
        -0x28 -> :sswitch_6
        -0x27 -> :sswitch_1
        -0x26 -> :sswitch_5
        -0x1c -> :sswitch_4
        -0x1b -> :sswitch_1
        -0x1a -> :sswitch_1
        -0x17 -> :sswitch_1
        -0x15 -> :sswitch_0
        -0xb -> :sswitch_3
        -0xa -> :sswitch_3
        -0x9 -> :sswitch_3
        -0x8 -> :sswitch_3
        -0x7 -> :sswitch_3
        -0x6 -> :sswitch_1
        0x5 -> :sswitch_1
        0x6 -> :sswitch_1
        0x7 -> :sswitch_1
        0x32 -> :sswitch_1
        0x39 -> :sswitch_2
        0x48 -> :sswitch_1
    .end sparse-switch
.end method

.method public static captureContinuation(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/NativeContinuation;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 2973
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    instance-of v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-nez v0, :cond_1

    .line 2976
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Interpreter frames not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2978
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v0, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/mozilla/javascript/Interpreter;->captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;

    move-result-object v0

    return-object v0
.end method

.method private static captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "requireContinuationsTopFrame"    # Z

    .prologue
    const/4 v6, 0x0

    .line 2984
    new-instance v0, Lorg/mozilla/javascript/NativeContinuation;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeContinuation;-><init>()V

    .line 2985
    .local v0, "c":Lorg/mozilla/javascript/NativeContinuation;
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;)V

    .line 2989
    move-object v3, p1

    .line 2990
    .local v3, "x":Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object v2, p1

    .line 2991
    .local v2, "outermost":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_0
    if-eqz v3, :cond_3

    iget-boolean v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v4, :cond_3

    .line 2992
    const/4 v4, 0x1

    iput-boolean v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2994
    iget v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    add-int/lit8 v1, v4, 0x1

    .local v1, "i":I
    :goto_1
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    array-length v4, v4

    if-eq v1, v4, :cond_0

    .line 2996
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aput-object v6, v4, v1

    .line 2997
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    const/4 v5, 0x0

    aput v5, v4, v1

    .line 2994
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2999
    :cond_0
    iget v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v5, 0x26

    if-ne v4, v5, :cond_2

    .line 3001
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v5, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-object v6, v4, v5

    .line 3008
    :cond_1
    :goto_2
    move-object v2, v3

    .line 3009
    iget-object v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_0

    .line 3003
    :cond_2
    iget v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v5, 0x1e

    if-eq v4, v5, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_2

    .line 3012
    .end local v1    # "i":I
    :cond_3
    if-eqz p2, :cond_5

    .line 3013
    :goto_3
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v4, :cond_4

    .line 3014
    iget-object v2, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_3

    .line 3016
    :cond_4
    iget-boolean v4, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->isContinuationsTopFrame:Z

    if-nez v4, :cond_5

    .line 3017
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Cannot capture continuation from JavaScript code not called directly by executeScriptWithContinuations or callFunctionWithContinuations"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 3024
    :cond_5
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/NativeContinuation;->initImplementation(Ljava/lang/Object;)V

    .line 3025
    return-object v0
.end method

.method private static captureFrameForGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .locals 3
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    const/4 v2, 0x0

    .line 162
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 163
    invoke-virtual {p0}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object v0

    .line 164
    .local v0, "result":Lorg/mozilla/javascript/Interpreter$CallFrame;
    iput-boolean v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 167
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 168
    iput v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    .line 170
    return-object v0
.end method

.method private static doAdd([Ljava/lang/Object;[DILorg/mozilla/javascript/Context;)V
    .locals 16
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3073
    add-int/lit8 v14, p2, 0x1

    aget-object v9, p0, v14

    .line 3074
    .local v9, "rhs":Ljava/lang/Object;
    aget-object v7, p0, p2

    .line 3077
    .local v7, "lhs":Ljava/lang/Object;
    sget-object v14, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v9, v14, :cond_2

    .line 3078
    add-int/lit8 v14, p2, 0x1

    aget-wide v2, p1, v14

    .line 3079
    .local v2, "d":D
    sget-object v14, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v7, v14, :cond_0

    .line 3080
    aget-wide v14, p1, p2

    add-double/2addr v14, v2

    aput-wide v14, p1, p2

    .line 3131
    .end local v2    # "d":D
    .end local v7    # "lhs":Ljava/lang/Object;
    .end local v9    # "rhs":Ljava/lang/Object;
    :goto_0
    return-void

    .line 3083
    .restart local v2    # "d":D
    .restart local v7    # "lhs":Ljava/lang/Object;
    .restart local v9    # "rhs":Ljava/lang/Object;
    :cond_0
    const/4 v6, 0x1

    .line 3109
    .local v6, "leftRightOrder":Z
    :goto_1
    instance-of v14, v7, Lorg/mozilla/javascript/Scriptable;

    if-eqz v14, :cond_a

    .line 3110
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v9

    .line 3111
    .local v9, "rhs":Ljava/lang/Number;
    if-nez v6, :cond_1

    .line 3112
    move-object v13, v7

    .line 3113
    .local v13, "tmp":Ljava/lang/Object;
    move-object v7, v9

    .line 3114
    .local v7, "lhs":Ljava/lang/Number;
    move-object v9, v13

    .line 3116
    .end local v7    # "lhs":Ljava/lang/Number;
    .end local v9    # "rhs":Ljava/lang/Number;
    .end local v13    # "tmp":Ljava/lang/Object;
    :cond_1
    move-object/from16 v0, p3

    invoke-static {v7, v9, v0}, Lorg/mozilla/javascript/ScriptRuntime;->add(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v14

    aput-object v14, p0, p2

    goto :goto_0

    .line 3085
    .end local v2    # "d":D
    .end local v6    # "leftRightOrder":Z
    .local v7, "lhs":Ljava/lang/Object;
    .local v9, "rhs":Ljava/lang/Object;
    :cond_2
    sget-object v14, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v7, v14, :cond_3

    .line 3086
    aget-wide v2, p1, p2

    .line 3087
    .restart local v2    # "d":D
    move-object v7, v9

    .line 3088
    const/4 v6, 0x0

    .restart local v6    # "leftRightOrder":Z
    goto :goto_1

    .line 3091
    .end local v2    # "d":D
    .end local v6    # "leftRightOrder":Z
    :cond_3
    instance-of v14, v7, Lorg/mozilla/javascript/Scriptable;

    if-nez v14, :cond_4

    instance-of v14, v9, Lorg/mozilla/javascript/Scriptable;

    if-eqz v14, :cond_5

    .line 3092
    :cond_4
    move-object/from16 v0, p3

    invoke-static {v7, v9, v0}, Lorg/mozilla/javascript/ScriptRuntime;->add(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v14

    aput-object v14, p0, p2

    goto :goto_0

    .line 3093
    :cond_5
    instance-of v14, v7, Ljava/lang/CharSequence;

    if-nez v14, :cond_6

    instance-of v14, v9, Ljava/lang/CharSequence;

    if-eqz v14, :cond_7

    .line 3094
    :cond_6
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v8

    .line 3095
    .local v8, "lstr":Ljava/lang/CharSequence;
    invoke-static {v9}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v12

    .line 3096
    .local v12, "rstr":Ljava/lang/CharSequence;
    new-instance v14, Lorg/mozilla/javascript/ConsString;

    invoke-direct {v14, v8, v12}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v14, p0, p2

    goto :goto_0

    .line 3098
    .end local v8    # "lstr":Ljava/lang/CharSequence;
    .end local v12    # "rstr":Ljava/lang/CharSequence;
    :cond_7
    instance-of v14, v7, Ljava/lang/Number;

    if-eqz v14, :cond_8

    check-cast v7, Ljava/lang/Number;

    .end local v7    # "lhs":Ljava/lang/Object;
    invoke-virtual {v7}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 3100
    .local v4, "lDbl":D
    :goto_2
    instance-of v14, v9, Ljava/lang/Number;

    if-eqz v14, :cond_9

    check-cast v9, Ljava/lang/Number;

    .end local v9    # "rhs":Ljava/lang/Object;
    invoke-virtual {v9}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v10

    .line 3102
    .local v10, "rDbl":D
    :goto_3
    sget-object v14, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v14, p0, p2

    .line 3103
    add-double v14, v4, v10

    aput-wide v14, p1, p2

    goto :goto_0

    .line 3098
    .end local v4    # "lDbl":D
    .end local v10    # "rDbl":D
    .restart local v7    # "lhs":Ljava/lang/Object;
    .restart local v9    # "rhs":Ljava/lang/Object;
    :cond_8
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    goto :goto_2

    .line 3100
    .end local v7    # "lhs":Ljava/lang/Object;
    .restart local v4    # "lDbl":D
    :cond_9
    invoke-static {v9}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v10

    goto :goto_3

    .line 3117
    .end local v4    # "lDbl":D
    .restart local v2    # "d":D
    .restart local v6    # "leftRightOrder":Z
    .restart local v7    # "lhs":Ljava/lang/Object;
    :cond_a
    instance-of v14, v7, Ljava/lang/CharSequence;

    if-eqz v14, :cond_c

    move-object v8, v7

    .line 3118
    check-cast v8, Ljava/lang/CharSequence;

    .line 3119
    .restart local v8    # "lstr":Ljava/lang/CharSequence;
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-static {v14}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v12

    .line 3120
    .restart local v12    # "rstr":Ljava/lang/CharSequence;
    if-eqz v6, :cond_b

    .line 3121
    new-instance v14, Lorg/mozilla/javascript/ConsString;

    invoke-direct {v14, v8, v12}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v14, p0, p2

    goto/16 :goto_0

    .line 3123
    :cond_b
    new-instance v14, Lorg/mozilla/javascript/ConsString;

    invoke-direct {v14, v12, v8}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v14, p0, p2

    goto/16 :goto_0

    .line 3126
    .end local v8    # "lstr":Ljava/lang/CharSequence;
    .end local v12    # "rstr":Ljava/lang/CharSequence;
    :cond_c
    instance-of v14, v7, Ljava/lang/Number;

    if-eqz v14, :cond_d

    check-cast v7, Ljava/lang/Number;

    .end local v7    # "lhs":Ljava/lang/Object;
    invoke-virtual {v7}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 3128
    .restart local v4    # "lDbl":D
    :goto_4
    sget-object v14, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v14, p0, p2

    .line 3129
    add-double v14, v4, v2

    aput-wide v14, p1, p2

    goto/16 :goto_0

    .line 3126
    .end local v4    # "lDbl":D
    .restart local v7    # "lhs":Ljava/lang/Object;
    :cond_d
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    goto :goto_4
.end method

.method private static doArithmetic(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 5
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 3135
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v2

    .line 3136
    .local v2, "rDbl":D
    add-int/lit8 p4, p4, -0x1

    .line 3137
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v0

    .line 3138
    .local v0, "lDbl":D
    sget-object v4, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v4, p2, p4

    .line 3139
    packed-switch p1, :pswitch_data_0

    .line 3153
    :goto_0
    aput-wide v0, p3, p4

    .line 3154
    return p4

    .line 3141
    :pswitch_0
    sub-double/2addr v0, v2

    .line 3142
    goto :goto_0

    .line 3144
    :pswitch_1
    mul-double/2addr v0, v2

    .line 3145
    goto :goto_0

    .line 3147
    :pswitch_2
    div-double/2addr v0, v2

    .line 3148
    goto :goto_0

    .line 3150
    :pswitch_3
    rem-double/2addr v0, v2

    goto :goto_0

    .line 3139
    :pswitch_data_0
    .packed-switch 0x16
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static doBitOp(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2168
    add-int/lit8 v2, p4, -0x1

    invoke-static {p0, v2}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v0

    .line 2169
    .local v0, "lIntValue":I
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v1

    .line 2170
    .local v1, "rIntValue":I
    add-int/lit8 p4, p4, -0x1

    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v2, p2, p4

    .line 2171
    packed-switch p1, :pswitch_data_0

    .line 2188
    :goto_0
    :pswitch_0
    int-to-double v2, v0

    aput-wide v2, p3, p4

    .line 2189
    return p4

    .line 2173
    :pswitch_1
    and-int/2addr v0, v1

    .line 2174
    goto :goto_0

    .line 2176
    :pswitch_2
    or-int/2addr v0, v1

    .line 2177
    goto :goto_0

    .line 2179
    :pswitch_3
    xor-int/2addr v0, v1

    .line 2180
    goto :goto_0

    .line 2182
    :pswitch_4
    shl-int/2addr v0, v1

    .line 2183
    goto :goto_0

    .line 2185
    :pswitch_5
    shr-int/2addr v0, v1

    goto :goto_0

    .line 2171
    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private static doCallSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[BI)I
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "iCode"    # [B
    .param p6, "indexReg"    # I

    .prologue
    .line 2263
    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v2, p5, v2

    and-int/lit16 v8, v2, 0xff

    .line 2264
    .local v8, "callType":I
    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v2, 0x1

    aget-byte v2, p5, v2

    if-eqz v2, :cond_1

    const/4 v11, 0x1

    .line 2265
    .local v11, "isNew":Z
    :goto_0
    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v2, 0x2

    move-object/from16 v0, p5

    invoke-static {v0, v2}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v10

    .line 2268
    .local v10, "sourceLine":I
    if-eqz v11, :cond_2

    .line 2270
    sub-int p4, p4, p6

    .line 2272
    aget-object v3, p2, p4

    .line 2273
    .local v3, "function":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v3, v2, :cond_0

    .line 2274
    aget-wide v6, p3, p4

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2275
    .end local v3    # "function":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v2, p4, 0x1

    move/from16 v0, p6

    invoke-static {p2, p3, v2, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v5

    .line 2277
    .local v5, "outArgs":[Ljava/lang/Object;
    iget-object v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {p0, v3, v5, v2, v8}, Lorg/mozilla/javascript/ScriptRuntime;->newSpecial(Lorg/mozilla/javascript/Context;Ljava/lang/Object;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p2, p4

    .line 2294
    :goto_1
    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v2, 0x4

    iput v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2295
    return p4

    .line 2264
    .end local v5    # "outArgs":[Ljava/lang/Object;
    .end local v10    # "sourceLine":I
    .end local v11    # "isNew":Z
    :cond_1
    const/4 v11, 0x0

    goto :goto_0

    .line 2281
    .restart local v10    # "sourceLine":I
    .restart local v11    # "isNew":Z
    :cond_2
    add-int/lit8 v2, p6, 0x1

    sub-int p4, p4, v2

    .line 2285
    add-int/lit8 v2, p4, 0x1

    aget-object v4, p2, v2

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    .line 2286
    .local v4, "functionThis":Lorg/mozilla/javascript/Scriptable;
    aget-object v3, p2, p4

    check-cast v3, Lorg/mozilla/javascript/Callable;

    .line 2287
    .local v3, "function":Lorg/mozilla/javascript/Callable;
    add-int/lit8 v2, p4, 0x2

    move/from16 v0, p6

    invoke-static {p2, p3, v2, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v5

    .line 2289
    .restart local v5    # "outArgs":[Ljava/lang/Object;
    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v7, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    iget-object v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v9, v2, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move-object v2, p0

    invoke-static/range {v2 .. v10}, Lorg/mozilla/javascript/ScriptRuntime;->callSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p2, p4

    goto :goto_1
.end method

.method private static doCompare(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 9
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 2110
    add-int/lit8 p4, p4, -0x1

    .line 2111
    add-int/lit8 v8, p4, 0x1

    aget-object v3, p2, v8

    .line 2112
    .local v3, "rhs":Ljava/lang/Object;
    aget-object v2, p2, p4

    .line 2119
    .local v2, "lhs":Ljava/lang/Object;
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v3, v8, :cond_0

    .line 2120
    add-int/lit8 v8, p4, 0x1

    aget-wide v4, p3, v8

    .line 2121
    .local v4, "rDbl":D
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v0

    .line 2128
    .local v0, "lDbl":D
    :goto_0
    packed-switch p1, :pswitch_data_0

    .line 2142
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 2122
    .end local v0    # "lDbl":D
    .end local v4    # "rDbl":D
    :cond_0
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v8, :cond_5

    .line 2123
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    .line 2124
    .restart local v4    # "rDbl":D
    aget-wide v0, p3, p4

    .restart local v0    # "lDbl":D
    goto :goto_0

    .line 2130
    :pswitch_0
    cmpl-double v8, v0, v4

    if-ltz v8, :cond_1

    .line 2162
    .end local v0    # "lDbl":D
    .end local v4    # "rDbl":D
    .local v6, "valBln":Z
    :goto_1
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, p2, p4

    .line 2163
    return p4

    .end local v6    # "valBln":Z
    .restart local v0    # "lDbl":D
    .restart local v4    # "rDbl":D
    :cond_1
    move v6, v7

    .line 2130
    goto :goto_1

    .line 2133
    :pswitch_1
    cmpg-double v8, v0, v4

    if-gtz v8, :cond_2

    .line 2134
    .restart local v6    # "valBln":Z
    :goto_2
    goto :goto_1

    .end local v6    # "valBln":Z
    :cond_2
    move v6, v7

    .line 2133
    goto :goto_2

    .line 2136
    :pswitch_2
    cmpl-double v8, v0, v4

    if-lez v8, :cond_3

    .line 2137
    .restart local v6    # "valBln":Z
    :goto_3
    goto :goto_1

    .end local v6    # "valBln":Z
    :cond_3
    move v6, v7

    .line 2136
    goto :goto_3

    .line 2139
    :pswitch_3
    cmpg-double v8, v0, v4

    if-gez v8, :cond_4

    .line 2140
    .restart local v6    # "valBln":Z
    :goto_4
    goto :goto_1

    .end local v6    # "valBln":Z
    :cond_4
    move v6, v7

    .line 2139
    goto :goto_4

    .line 2145
    .end local v0    # "lDbl":D
    .end local v4    # "rDbl":D
    :cond_5
    packed-switch p1, :pswitch_data_1

    .line 2159
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 2147
    :pswitch_4
    invoke-static {v3, v2}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2148
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2150
    .end local v6    # "valBln":Z
    :pswitch_5
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2151
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2153
    .end local v6    # "valBln":Z
    :pswitch_6
    invoke-static {v3, v2}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2154
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2156
    .end local v6    # "valBln":Z
    :pswitch_7
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2157
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2128
    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch

    .line 2145
    :pswitch_data_1
    .packed-switch 0xe
        :pswitch_7
        :pswitch_5
        :pswitch_6
        :pswitch_4
    .end packed-switch
.end method

.method private static doDelName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "op"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I

    .prologue
    .line 2194
    aget-object v1, p3, p5

    .line 2195
    .local v1, "rhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_0

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2196
    .end local v1    # "rhs":Ljava/lang/Object;
    :cond_0
    add-int/lit8 p5, p5, -0x1

    .line 2197
    aget-object v0, p3, p5

    .line 2198
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_1

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2199
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    if-nez p2, :cond_2

    const/4 v2, 0x1

    :goto_0
    invoke-static {v0, v1, p0, v3, v2}, Lorg/mozilla/javascript/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p3, p5

    .line 2201
    return p5

    .line 2199
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static doElemIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[B[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "iCode"    # [B
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I

    .prologue
    .line 2248
    aget-object v1, p3, p5

    .line 2249
    .local v1, "rhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_0

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2250
    .end local v1    # "rhs":Ljava/lang/Object;
    :cond_0
    add-int/lit8 p5, p5, -0x1

    .line 2251
    aget-object v0, p3, p5

    .line 2252
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_1

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2253
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1
    iget-object v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v3, p2, v3

    invoke-static {v0, v1, p0, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p3, p5

    .line 2255
    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2256
    return p5
.end method

.method private static doEquals([Ljava/lang/Object;[DI)Z
    .locals 6
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I

    .prologue
    .line 2485
    add-int/lit8 v2, p2, 0x1

    aget-object v1, p0, v2

    .line 2486
    .local v1, "rhs":Ljava/lang/Object;
    aget-object v0, p0, p2

    .line 2487
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_2

    .line 2488
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_1

    .line 2489
    aget-wide v2, p1, p2

    add-int/lit8 v4, p2, 0x1

    aget-wide v4, p1, v4

    cmpl-double v2, v2, v4

    if-nez v2, :cond_0

    const/4 v2, 0x1

    .line 2497
    :goto_0
    return v2

    .line 2489
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 2491
    :cond_1
    add-int/lit8 v2, p2, 0x1

    aget-wide v2, p1, v2

    invoke-static {v2, v3, v0}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 2494
    :cond_2
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_3

    .line 2495
    aget-wide v2, p1, p2

    invoke-static {v2, v3, v1}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 2497
    :cond_3
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0
.end method

.method private static doGetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I
    .locals 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2206
    add-int/lit8 p4, p4, -0x1

    .line 2207
    aget-object v3, p2, p4

    .line 2208
    .local v3, "lhs":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v3, v5, :cond_0

    .line 2209
    aget-wide v6, p3, p4

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2212
    .end local v3    # "lhs":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v5, p4, 0x1

    aget-object v2, p2, v5

    .line 2213
    .local v2, "id":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v2, v5, :cond_1

    .line 2214
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v3, v2, p0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 2219
    .local v4, "value":Ljava/lang/Object;
    :goto_0
    aput-object v4, p2, p4

    .line 2220
    return p4

    .line 2216
    .end local v4    # "value":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v5, p4, 0x1

    aget-wide v0, p3, v5

    .line 2217
    .local v0, "d":D
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v3, v0, v1, p0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectIndex(Ljava/lang/Object;DLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "value":Ljava/lang/Object;
    goto :goto_0
.end method

.method private static doGetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "indexReg"    # I

    .prologue
    .line 2349
    add-int/lit8 p3, p3, 0x1

    .line 2350
    iget-boolean v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v1, :cond_0

    .line 2351
    aget-object v1, p4, p6

    aput-object v1, p1, p3

    .line 2352
    aget-wide v2, p5, p6

    aput-wide v2, p2, p3

    .line 2357
    :goto_0
    return p3

    .line 2354
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v1, v1, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v1, p6

    .line 2355
    .local v0, "stringReg":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v1, v0, v2}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, p1, p3

    goto :goto_0
.end method

.method private static doInOrInstanceof(Lorg/mozilla/javascript/Context;I[Ljava/lang/Object;[DI)I
    .locals 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2093
    aget-object v1, p2, p4

    .line 2094
    .local v1, "rhs":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v3, :cond_0

    aget-wide v4, p3, p4

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2095
    .end local v1    # "rhs":Ljava/lang/Object;
    :cond_0
    add-int/lit8 p4, p4, -0x1

    .line 2096
    aget-object v0, p2, p4

    .line 2097
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v3, :cond_1

    aget-wide v4, p3, p4

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2099
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1
    const/16 v3, 0x34

    if-ne p1, v3, :cond_2

    .line 2100
    invoke-static {v0, v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->in(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v2

    .line 2104
    .local v2, "valBln":Z
    :goto_0
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, p2, p4

    .line 2105
    return p4

    .line 2102
    .end local v2    # "valBln":Z
    :cond_2
    invoke-static {v0, v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->instanceOf(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v2

    .restart local v2    # "valBln":Z
    goto :goto_0
.end method

.method private static doRefMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "flags"    # I

    .prologue
    .line 2405
    aget-object v0, p1, p3

    .line 2406
    .local v0, "elem":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_0

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2407
    .end local v0    # "elem":Ljava/lang/Object;
    :cond_0
    add-int/lit8 p3, p3, -0x1

    .line 2408
    aget-object v1, p1, p3

    .line 2409
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2410
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_1
    invoke-static {v1, v0, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->memberRef(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;

    move-result-object v2

    aput-object v2, p1, p3

    .line 2411
    return p3
.end method

.method private static doRefNsMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I
    .locals 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "flags"    # I

    .prologue
    .line 2416
    aget-object v0, p1, p3

    .line 2417
    .local v0, "elem":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v3, :cond_0

    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2418
    .end local v0    # "elem":Ljava/lang/Object;
    :cond_0
    add-int/lit8 p3, p3, -0x1

    .line 2419
    aget-object v1, p1, p3

    .line 2420
    .local v1, "ns":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v3, :cond_1

    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2421
    .end local v1    # "ns":Ljava/lang/Object;
    :cond_1
    add-int/lit8 p3, p3, -0x1

    .line 2422
    aget-object v2, p1, p3

    .line 2423
    .local v2, "obj":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v3, :cond_2

    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 2424
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_2
    invoke-static {v2, v1, v0, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->memberRef(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;

    move-result-object v3

    aput-object v3, p1, p3

    .line 2425
    return p3
.end method

.method private static doRefNsName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DII)I
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "flags"    # I

    .prologue
    .line 2431
    aget-object v0, p2, p4

    .line 2432
    .local v0, "name":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_0

    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2433
    .end local v0    # "name":Ljava/lang/Object;
    :cond_0
    add-int/lit8 p4, p4, -0x1

    .line 2434
    aget-object v1, p2, p4

    .line 2435
    .local v1, "ns":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2436
    .end local v1    # "ns":Ljava/lang/Object;
    :cond_1
    iget-object v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, v0, p0, v2, p5}, Lorg/mozilla/javascript/ScriptRuntime;->nameRef(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;

    move-result-object v2

    aput-object v2, p2, p4

    .line 2437
    return p4
.end method

.method private static doSetConstVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .locals 6
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "varAttributes"    # [I
    .param p7, "indexReg"    # I

    .prologue
    .line 2302
    iget-boolean v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v3, :cond_2

    .line 2303
    aget v3, p6, p7

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_0

    .line 2304
    const-string v3, "msg.var.redecl"

    iget-object v4, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v4, v4, p7

    invoke-static {v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 2307
    :cond_0
    aget v3, p6, p7

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_1

    .line 2310
    aget-object v3, p1, p3

    aput-object v3, p4, p7

    .line 2311
    aget v3, p6, p7

    and-int/lit8 v3, v3, -0x9

    aput v3, p6, p7

    .line 2312
    aget-wide v4, p2, p3

    aput-wide v4, p5, p7

    .line 2324
    :cond_1
    :goto_0
    return p3

    .line 2315
    :cond_2
    aget-object v2, p1, p3

    .line 2316
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v3, :cond_3

    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 2317
    .end local v2    # "val":Ljava/lang/Object;
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v1, v3, p7

    .line 2318
    .local v1, "stringReg":Ljava/lang/String;
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    instance-of v3, v3, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v3, :cond_4

    .line 2319
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    check-cast v0, Lorg/mozilla/javascript/ConstProperties;

    .line 2320
    .local v0, "cp":Lorg/mozilla/javascript/ConstProperties;
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0, v1, v3, v2}, Lorg/mozilla/javascript/ConstProperties;->putConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 2322
    .end local v0    # "cp":Lorg/mozilla/javascript/ConstProperties;
    :cond_4
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method private static doSetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I
    .locals 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2225
    add-int/lit8 p4, p4, -0x2

    .line 2226
    add-int/lit8 v5, p4, 0x2

    aget-object v4, p2, v5

    .line 2227
    .local v4, "rhs":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v4, v5, :cond_0

    .line 2228
    add-int/lit8 v5, p4, 0x2

    aget-wide v8, p3, v5

    invoke-static {v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .line 2230
    .end local v4    # "rhs":Ljava/lang/Object;
    :cond_0
    aget-object v1, p2, p4

    .line 2231
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v5, :cond_1

    .line 2232
    aget-wide v8, p3, p4

    invoke-static {v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2235
    .end local v1    # "lhs":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v5, p4, 0x1

    aget-object v0, p2, v5

    .line 2236
    .local v0, "id":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v0, v5, :cond_2

    .line 2237
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, v0, v4, p0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .line 2242
    .local v7, "value":Ljava/lang/Object;
    :goto_0
    aput-object v7, p2, p4

    .line 2243
    return p4

    .line 2239
    .end local v7    # "value":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v5, p4, 0x1

    aget-wide v2, p3, v5

    .line 2240
    .local v2, "d":D
    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object v5, p0

    invoke-static/range {v1 .. v6}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .restart local v7    # "value":Ljava/lang/Object;
    goto :goto_0
.end method

.method private static doSetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .locals 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "varAttributes"    # [I
    .param p7, "indexReg"    # I

    .prologue
    .line 2331
    iget-boolean v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v2, :cond_1

    .line 2332
    aget v2, p6, p7

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_0

    .line 2333
    aget-object v2, p1, p3

    aput-object v2, p4, p7

    .line 2334
    aget-wide v2, p2, p3

    aput-wide v2, p5, p7

    .line 2342
    :cond_0
    :goto_0
    return p3

    .line 2337
    :cond_1
    aget-object v1, p1, p3

    .line 2338
    .local v1, "val":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_2

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2339
    .end local v1    # "val":Ljava/lang/Object;
    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v2, v2, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v2, p7

    .line 2340
    .local v0, "stringReg":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2, v0, v3, v1}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static doShallowEquals([Ljava/lang/Object;[DI)Z
    .locals 9
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I

    .prologue
    const/4 v7, 0x0

    .line 2505
    add-int/lit8 v8, p2, 0x1

    aget-object v6, p0, v8

    .line 2506
    .local v6, "rhs":Ljava/lang/Object;
    aget-object v1, p0, p2

    .line 2507
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v0, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    .line 2509
    .local v0, "DBL_MRK":Lorg/mozilla/javascript/UniqueTag;
    if-ne v6, v0, :cond_2

    .line 2510
    add-int/lit8 v8, p2, 0x1

    aget-wide v4, p1, v8

    .line 2511
    .local v4, "rdbl":D
    if-ne v1, v0, :cond_1

    .line 2512
    aget-wide v2, p1, p2

    .line 2528
    .end local v1    # "lhs":Ljava/lang/Object;
    .end local v6    # "rhs":Ljava/lang/Object;
    .local v2, "ldbl":D
    :goto_0
    cmpl-double v8, v2, v4

    if-nez v8, :cond_0

    const/4 v7, 0x1

    .end local v2    # "ldbl":D
    .end local v4    # "rdbl":D
    :cond_0
    :goto_1
    return v7

    .line 2513
    .restart local v1    # "lhs":Ljava/lang/Object;
    .restart local v4    # "rdbl":D
    .restart local v6    # "rhs":Ljava/lang/Object;
    :cond_1
    instance-of v8, v1, Ljava/lang/Number;

    if-eqz v8, :cond_0

    .line 2514
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "lhs":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .restart local v2    # "ldbl":D
    goto :goto_0

    .line 2518
    .end local v2    # "ldbl":D
    .end local v4    # "rdbl":D
    .restart local v1    # "lhs":Ljava/lang/Object;
    :cond_2
    if-ne v1, v0, :cond_3

    .line 2519
    aget-wide v2, p1, p2

    .line 2520
    .restart local v2    # "ldbl":D
    instance-of v8, v6, Ljava/lang/Number;

    if-eqz v8, :cond_0

    .line 2521
    check-cast v6, Ljava/lang/Number;

    .end local v6    # "rhs":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .restart local v4    # "rdbl":D
    goto :goto_0

    .line 2526
    .end local v2    # "ldbl":D
    .end local v4    # "rdbl":D
    .restart local v6    # "rhs":Ljava/lang/Object;
    :cond_3
    invoke-static {v1, v6}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    goto :goto_1
.end method

.method private static doVarIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .locals 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "vars"    # [Ljava/lang/Object;
    .param p6, "varDbls"    # [D
    .param p7, "varAttributes"    # [I
    .param p8, "indexReg"    # I

    .prologue
    .line 2366
    add-int/lit8 p4, p4, 0x1

    .line 2367
    iget-object v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v8, v8, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v9, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v4, v8, v9

    .line 2368
    .local v4, "incrDecrMask":I
    iget-boolean v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v8, :cond_8

    .line 2369
    aget-object v7, p5, p8

    .line 2371
    .local v7, "varValue":Ljava/lang/Object;
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v7, v8, :cond_1

    .line 2372
    aget-wide v0, p6, p8

    .line 2376
    .local v0, "d":D
    :goto_0
    and-int/lit8 v8, v4, 0x1

    if-nez v8, :cond_2

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    add-double v2, v0, v8

    .line 2378
    .local v2, "d2":D
    :goto_1
    and-int/lit8 v8, v4, 0x2

    if-eqz v8, :cond_3

    const/4 v5, 0x1

    .line 2379
    .local v5, "post":Z
    :goto_2
    aget v8, p7, p8

    and-int/lit8 v8, v8, 0x1

    if-nez v8, :cond_5

    .line 2380
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v7, v8, :cond_0

    .line 2381
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v8, p5, p8

    .line 2383
    :cond_0
    aput-wide v2, p6, p8

    .line 2384
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v8, p2, p4

    .line 2385
    if-eqz v5, :cond_4

    .end local v0    # "d":D
    :goto_3
    aput-wide v0, p3, p4

    .line 2399
    .end local v2    # "d2":D
    .end local v5    # "post":Z
    .end local v7    # "varValue":Ljava/lang/Object;
    :goto_4
    iget v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2400
    return p4

    .line 2374
    .restart local v7    # "varValue":Ljava/lang/Object;
    :cond_1
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .restart local v0    # "d":D
    goto :goto_0

    .line 2376
    :cond_2
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    sub-double v2, v0, v8

    goto :goto_1

    .line 2378
    .restart local v2    # "d2":D
    :cond_3
    const/4 v5, 0x0

    goto :goto_2

    .restart local v5    # "post":Z
    :cond_4
    move-wide v0, v2

    .line 2385
    goto :goto_3

    .line 2387
    :cond_5
    if-eqz v5, :cond_6

    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v7, v8, :cond_6

    .line 2388
    aput-object v7, p2, p4

    goto :goto_4

    .line 2390
    :cond_6
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v8, p2, p4

    .line 2391
    if-eqz v5, :cond_7

    .end local v0    # "d":D
    :goto_5
    aput-wide v0, p3, p4

    goto :goto_4

    .restart local v0    # "d":D
    :cond_7
    move-wide v0, v2

    goto :goto_5

    .line 2395
    .end local v0    # "d":D
    .end local v2    # "d2":D
    .end local v5    # "post":Z
    .end local v7    # "varValue":Ljava/lang/Object;
    :cond_8
    iget-object v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v8, v8, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v6, v8, p8

    .line 2396
    .local v6, "varName":Ljava/lang/String;
    iget-object v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v8, v6, p0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v8

    aput-object v8, p2, p4

    goto :goto_4
.end method

.method static dumpICode(Lorg/mozilla/javascript/InterpreterData;)V
    .locals 0
    .param p0, "idata"    # Lorg/mozilla/javascript/InterpreterData;

    .prologue
    .line 283
    return-void
.end method

.method private static enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "continuationRestart"    # Z

    .prologue
    .line 2868
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v2, v3, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    .line 2869
    .local v2, "usesActivation":Z
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v3, :cond_4

    const/4 v0, 0x1

    .line 2870
    .local v0, "isDebugged":Z
    :goto_0
    if-nez v2, :cond_0

    if-eqz v0, :cond_3

    .line 2871
    :cond_0
    iget-object v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 2872
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_5

    .line 2873
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2902
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 2903
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    iget-object v4, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v3, p0, v1, v4, p2}, Lorg/mozilla/javascript/debug/DebugFrame;->onEnter(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)V

    .line 2908
    :cond_2
    if-eqz v2, :cond_3

    .line 2909
    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->enterActivationFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 2912
    .end local v1    # "scope":Lorg/mozilla/javascript/Scriptable;
    :cond_3
    return-void

    .line 2869
    .end local v0    # "isDebugged":Z
    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    .line 2874
    .restart local v0    # "isDebugged":Z
    .restart local v1    # "scope":Lorg/mozilla/javascript/Scriptable;
    :cond_5
    if-eqz p3, :cond_1

    .line 2884
    :cond_6
    instance-of v3, v1, Lorg/mozilla/javascript/NativeWith;

    if-eqz v3, :cond_1

    .line 2885
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 2886
    if-eqz v1, :cond_7

    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v3, :cond_6

    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    if-ne v3, v1, :cond_6

    .line 2892
    :cond_7
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_1
.end method

.method private static exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V
    .locals 9
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "throwable"    # Ljava/lang/Object;

    .prologue
    .line 2917
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v5, v5, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    if-eqz v5, :cond_0

    .line 2918
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->exitActivationFunction(Lorg/mozilla/javascript/Context;)V

    .line 2921
    :cond_0
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v5, :cond_1

    .line 2923
    :try_start_0
    instance-of v5, p2, Ljava/lang/Throwable;

    if-eqz v5, :cond_2

    .line 2924
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    const/4 v8, 0x1

    invoke-interface {v5, p0, v8, p2}, Lorg/mozilla/javascript/debug/DebugFrame;->onExit(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)V

    .line 2950
    :cond_1
    :goto_0
    return-void

    .line 2927
    :cond_2
    move-object v0, p2

    check-cast v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    move-object v2, v0

    .line 2928
    .local v2, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    if-nez v2, :cond_4

    .line 2929
    iget-object v4, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2933
    .local v4, "result":Ljava/lang/Object;
    :goto_1
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v4, v5, :cond_3

    .line 2935
    if-nez v2, :cond_5

    .line 2936
    iget-wide v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 2940
    .local v6, "resultDbl":D
    :goto_2
    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .line 2942
    .end local v4    # "result":Ljava/lang/Object;
    .end local v6    # "resultDbl":D
    :cond_3
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    const/4 v8, 0x0

    invoke-interface {v5, p0, v8, v4}, Lorg/mozilla/javascript/debug/DebugFrame;->onExit(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2944
    .end local v2    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :catch_0
    move-exception v3

    .line 2945
    .local v3, "ex":Ljava/lang/Throwable;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v8, "RHINO USAGE WARNING: onExit terminated with exception"

    invoke-virtual {v5, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 2947
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3, v5}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 2931
    .end local v3    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_4
    :try_start_1
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .restart local v4    # "result":Ljava/lang/Object;
    goto :goto_1

    .line 2938
    :cond_5
    iget-wide v6, v2, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .restart local v6    # "resultDbl":D
    goto :goto_2
.end method

.method private static freezeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stackTop"    # I
    .param p3, "generatorState"    # Lorg/mozilla/javascript/Interpreter$GeneratorState;

    .prologue
    .line 2631
    iget v0, p3, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 2633
    const-string v0, "msg.yield.closing"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 2636
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2637
    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v0, p2

    iput-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2638
    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v0, v0, p2

    iput-wide v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 2639
    iput p2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2640
    iget v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2641
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->exitActivationFunction(Lorg/mozilla/javascript/Context;)V

    .line 2642
    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v0, v1, :cond_1

    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    :goto_0
    return-object v0

    :cond_1
    iget-wide v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    goto :goto_0
.end method

.method private static getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;
    .locals 6
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "shift"    # I
    .param p3, "count"    # I

    .prologue
    .line 3160
    if-nez p3, :cond_1

    .line 3161
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 3171
    :cond_0
    return-object v0

    .line 3163
    :cond_1
    new-array v0, p3, [Ljava/lang/Object;

    .line 3164
    .local v0, "args":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, p3, :cond_0

    .line 3165
    aget-object v2, p0, p2

    .line 3166
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v3, :cond_2

    .line 3167
    aget-wide v4, p1, p2

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 3169
    .end local v2    # "val":Ljava/lang/Object;
    :cond_2
    aput-object v2, v0, v1

    .line 3164
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method static getEncodedSource(Lorg/mozilla/javascript/InterpreterData;)Ljava/lang/String;
    .locals 3
    .param p0, "idata"    # Lorg/mozilla/javascript/InterpreterData;

    .prologue
    .line 776
    iget-object v0, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSource:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 777
    const/4 v0, 0x0

    .line 779
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSource:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSourceStart:I

    iget v2, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSourceEnd:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static getExceptionHandler(Lorg/mozilla/javascript/Interpreter$CallFrame;Z)I
    .locals 10
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "onlyFinally"    # Z

    .prologue
    .line 240
    iget-object v8, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v8, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 241
    .local v4, "exceptionTable":[I
    if-nez v4, :cond_1

    .line 243
    const/4 v0, -0x1

    .line 277
    :cond_0
    return v0

    .line 249
    :cond_1
    iget v8, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v8, -0x1

    .line 252
    .local v6, "pc":I
    const/4 v0, -0x1

    .local v0, "best":I
    const/4 v2, 0x0

    .local v2, "bestStart":I
    const/4 v1, 0x0

    .line 253
    .local v1, "bestEnd":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v8, v4

    if-eq v5, v8, :cond_0

    .line 254
    add-int/lit8 v8, v5, 0x0

    aget v7, v4, v8

    .line 255
    .local v7, "start":I
    add-int/lit8 v8, v5, 0x1

    aget v3, v4, v8

    .line 256
    .local v3, "end":I
    if-gt v7, v6, :cond_2

    if-lt v6, v3, :cond_3

    .line 253
    :cond_2
    :goto_1
    add-int/lit8 v5, v5, 0x6

    goto :goto_0

    .line 259
    :cond_3
    if-eqz p1, :cond_4

    add-int/lit8 v8, v5, 0x3

    aget v8, v4, v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    .line 262
    :cond_4
    if-ltz v0, :cond_6

    .line 266
    if-lt v1, v3, :cond_2

    .line 270
    if-le v2, v7, :cond_5

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 271
    :cond_5
    if-ne v1, v3, :cond_6

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 273
    :cond_6
    move v0, v5

    .line 274
    move v2, v7

    .line 275
    move v1, v3

    goto :goto_1
.end method

.method private static getIndex([BI)I
    .locals 2
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 229
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static getInt([BI)I
    .locals 2
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 233
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method static getLineNumbers(Lorg/mozilla/javascript/InterpreterData;)[I
    .locals 8
    .param p0, "data"    # Lorg/mozilla/javascript/InterpreterData;

    .prologue
    .line 576
    new-instance v5, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v5}, Lorg/mozilla/javascript/UintMap;-><init>()V

    .line 578
    .local v5, "presentLines":Lorg/mozilla/javascript/UintMap;
    iget-object v1, p0, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 579
    .local v1, "iCode":[B
    array-length v2, v1

    .line 580
    .local v2, "iCodeLength":I
    const/4 v4, 0x0

    .local v4, "pc":I
    :goto_0
    if-eq v4, v2, :cond_2

    .line 581
    aget-byte v0, v1, v4

    .line 582
    .local v0, "bytecode":I
    invoke-static {v0}, Lorg/mozilla/javascript/Interpreter;->bytecodeSpan(I)I

    move-result v6

    .line 583
    .local v6, "span":I
    const/16 v7, -0x1a

    if-ne v0, v7, :cond_1

    .line 584
    const/4 v7, 0x3

    if-eq v6, v7, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 585
    :cond_0
    add-int/lit8 v7, v4, 0x1

    invoke-static {v1, v7}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v3

    .line 586
    .local v3, "line":I
    const/4 v7, 0x0

    invoke-virtual {v5, v3, v7}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 588
    .end local v3    # "line":I
    :cond_1
    add-int/2addr v4, v6

    .line 589
    goto :goto_0

    .line 591
    .end local v0    # "bytecode":I
    .end local v6    # "span":I
    :cond_2
    invoke-virtual {v5}, Lorg/mozilla/javascript/UintMap;->getKeys()[I

    move-result-object v7

    return-object v7
.end method

.method private static getShort([BI)I
    .locals 2
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 225
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V
    .locals 20
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "callerScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsDbl"    # [D
    .param p5, "argShift"    # I
    .param p6, "argCount"    # I
    .param p7, "fnOrScript"    # Lorg/mozilla/javascript/InterpretedFunction;
    .param p8, "parentFrame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p9, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    .line 2727
    move-object/from16 v0, p7

    iget-object v9, v0, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 2729
    .local v9, "idata":Lorg/mozilla/javascript/InterpreterData;
    iget-boolean v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v16, v0

    .line 2730
    .local v16, "useActivation":Z
    const/4 v4, 0x0

    .line 2731
    .local v4, "debuggerFrame":Lorg/mozilla/javascript/debug/DebugFrame;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->debugger:Lorg/mozilla/javascript/debug/Debugger;

    move-object/from16 v18, v0

    if-eqz v18, :cond_0

    .line 2732
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->debugger:Lorg/mozilla/javascript/debug/Debugger;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-interface {v0, v1, v9}, Lorg/mozilla/javascript/debug/Debugger;->getFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/debug/DebuggableScript;)Lorg/mozilla/javascript/debug/DebugFrame;

    move-result-object v4

    .line 2733
    if-eqz v4, :cond_0

    .line 2734
    const/16 v16, 0x1

    .line 2738
    :cond_0
    if-eqz v16, :cond_2

    .line 2741
    if-eqz p4, :cond_1

    .line 2742
    invoke-static/range {p3 .. p6}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object p3

    .line 2744
    :cond_1
    const/16 p5, 0x0

    .line 2745
    const/16 p4, 0x0

    .line 2749
    :cond_2
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    move/from16 v18, v0

    if-eqz v18, :cond_6

    .line 2750
    invoke-virtual/range {p7 .. p7}, Lorg/mozilla/javascript/InterpretedFunction;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v12

    .line 2752
    .local v12, "scope":Lorg/mozilla/javascript/Scriptable;
    if-eqz v16, :cond_3

    .line 2753
    move-object/from16 v0, p7

    move-object/from16 v1, p3

    invoke-static {v0, v12, v1}, Lorg/mozilla/javascript/ScriptRuntime;->createFunctionActivation(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v12

    .line 2762
    :cond_3
    :goto_0
    iget-object v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    if-eqz v18, :cond_7

    .line 2763
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    move/from16 v18, v0

    if-eqz v18, :cond_4

    iget-boolean v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v18, v0

    if-nez v18, :cond_4

    .line 2764
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2765
    :cond_4
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    iget-object v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v8, v0, :cond_7

    .line 2766
    iget-object v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    aget-object v7, v18, v8

    .line 2767
    .local v7, "fdata":Lorg/mozilla/javascript/InterpreterData;
    iget v0, v7, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_5

    .line 2768
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-static {v0, v12, v1, v8}, Lorg/mozilla/javascript/Interpreter;->initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)V

    .line 2765
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 2757
    .end local v7    # "fdata":Lorg/mozilla/javascript/InterpreterData;
    .end local v8    # "i":I
    .end local v12    # "scope":Lorg/mozilla/javascript/Scriptable;
    :cond_6
    move-object/from16 v12, p1

    .line 2758
    .restart local v12    # "scope":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p7

    iget-object v0, v0, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->evalScriptFlag:Z

    move/from16 v18, v0

    move-object/from16 v0, p7

    move-object/from16 v1, p2

    move-object/from16 v2, p0

    move/from16 v3, v18

    invoke-static {v0, v1, v2, v12, v3}, Lorg/mozilla/javascript/ScriptRuntime;->initScript(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V

    goto :goto_0

    .line 2775
    :cond_7
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    move/from16 v18, v0

    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxLocals:I

    move/from16 v19, v0

    add-int v18, v18, v19

    add-int/lit8 v6, v18, -0x1

    .line 2776
    .local v6, "emptyStackTop":I
    iget v10, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxFrameArray:I

    .line 2777
    .local v10, "maxFrameArray":I
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxStack:I

    move/from16 v18, v0

    add-int v18, v18, v6

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    if-eq v10, v0, :cond_8

    .line 2778
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2784
    :cond_8
    move-object/from16 v0, p9

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v18, v0

    if-eqz v18, :cond_a

    move-object/from16 v0, p9

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-gt v10, v0, :cond_a

    .line 2786
    const/4 v15, 0x1

    .line 2787
    .local v15, "stackReuse":Z
    move-object/from16 v0, p9

    iget-object v13, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 2788
    .local v13, "stack":[Ljava/lang/Object;
    move-object/from16 v0, p9

    iget-object v14, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    .line 2789
    .local v14, "stackAttributes":[I
    move-object/from16 v0, p9

    iget-object v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 2797
    .local v11, "sDbl":[D
    :goto_2
    invoke-virtual {v9}, Lorg/mozilla/javascript/InterpreterData;->getParamAndVarCount()I

    move-result v17

    .line 2798
    .local v17, "varCount":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_3
    move/from16 v0, v17

    if-ge v8, v0, :cond_b

    .line 2799
    invoke-virtual {v9, v8}, Lorg/mozilla/javascript/InterpreterData;->getParamOrVarConst(I)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 2800
    const/16 v18, 0xd

    aput v18, v14, v8

    .line 2798
    :cond_9
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 2791
    .end local v8    # "i":I
    .end local v11    # "sDbl":[D
    .end local v13    # "stack":[Ljava/lang/Object;
    .end local v14    # "stackAttributes":[I
    .end local v15    # "stackReuse":Z
    .end local v17    # "varCount":I
    :cond_a
    const/4 v15, 0x0

    .line 2792
    .restart local v15    # "stackReuse":Z
    new-array v13, v10, [Ljava/lang/Object;

    .line 2793
    .restart local v13    # "stack":[Ljava/lang/Object;
    new-array v14, v10, [I

    .line 2794
    .restart local v14    # "stackAttributes":[I
    new-array v11, v10, [D

    .restart local v11    # "sDbl":[D
    goto :goto_2

    .line 2802
    .restart local v8    # "i":I
    .restart local v17    # "varCount":I
    :cond_b
    iget v5, v9, Lorg/mozilla/javascript/InterpreterData;->argCount:I

    .line 2803
    .local v5, "definedArgs":I
    move/from16 v0, p6

    if-le v5, v0, :cond_c

    move/from16 v5, p6

    .line 2807
    :cond_c
    move-object/from16 v0, p8

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2808
    if-nez p8, :cond_d

    const/16 v18, 0x0

    :goto_4
    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    .line 2810
    move-object/from16 v0, p9

    iget v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    move/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getMaximumInterpreterStackDepth()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_e

    .line 2812
    const-string v18, "Exceeded maximum stack depth"

    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v18

    throw v18

    .line 2808
    :cond_d
    move-object/from16 v0, p8

    iget v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    goto :goto_4

    .line 2814
    :cond_e
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput-boolean v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2816
    move-object/from16 v0, p7

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    .line 2817
    move-object/from16 v0, p9

    iput-object v9, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 2819
    move-object/from16 v0, p9

    iput-object v13, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 2820
    move-object/from16 v0, p9

    iput-object v14, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    .line 2821
    move-object/from16 v0, p9

    iput-object v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 2822
    move-object/from16 v0, p9

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2823
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    .line 2824
    move-object/from16 v0, p9

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    .line 2826
    move-object/from16 v0, p9

    iput-object v4, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    .line 2827
    move/from16 v0, v16

    move-object/from16 v1, p9

    iput-boolean v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    .line 2829
    move-object/from16 v0, p2

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    .line 2833
    sget-object v18, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v18

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2834
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2835
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    .line 2836
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->firstLinePC:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    .line 2837
    move-object/from16 v0, p9

    iput-object v12, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 2839
    move-object/from16 v0, p9

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2840
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 2842
    const/16 v18, 0x0

    move-object/from16 v0, p3

    move/from16 v1, p5

    move/from16 v2, v18

    invoke-static {v0, v1, v13, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2843
    if-eqz p4, :cond_f

    .line 2844
    const/16 v18, 0x0

    move-object/from16 v0, p4

    move/from16 v1, p5

    move/from16 v2, v18

    invoke-static {v0, v1, v11, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2846
    :cond_f
    move v8, v5

    :goto_5
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v8, v0, :cond_10

    .line 2847
    sget-object v18, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aput-object v18, v13, v8

    .line 2846
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 2849
    :cond_10
    if-eqz v15, :cond_11

    .line 2852
    add-int/lit8 v8, v6, 0x1

    :goto_6
    array-length v0, v13

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v8, v0, :cond_11

    .line 2853
    const/16 v18, 0x0

    aput-object v18, v13, v8

    .line 2852
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 2857
    :cond_11
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p9

    move-object/from16 v2, p3

    move/from16 v3, v18

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Interpreter;->enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    .line 2858
    return-void
.end method

.method private static initFrameForApplyOrCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .locals 24
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "indexReg"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I
    .param p6, "op"    # I
    .param p7, "calleeScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p8, "ifun"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p9, "iApplyCallable"    # Lorg/mozilla/javascript/InterpretedFunction;

    .prologue
    .line 2677
    if-eqz p2, :cond_2

    .line 2678
    add-int/lit8 v2, p5, 0x2

    aget-object v23, p3, v2

    .line 2679
    .local v23, "obj":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    move-object/from16 v0, v23

    if-ne v0, v2, :cond_0

    .line 2680
    add-int/lit8 v2, p5, 0x2

    aget-wide v2, p4, v2

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v23

    .line 2681
    .end local v23    # "obj":Ljava/lang/Object;
    :cond_0
    move-object/from16 v0, p1

    iget-object v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 2686
    .local v4, "applyThis":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    if-nez v4, :cond_1

    .line 2688
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 2690
    :cond_1
    const/16 v2, -0x37

    move/from16 v0, p6

    if-ne v0, v2, :cond_3

    .line 2691
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2692
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 p1, v0

    .line 2698
    :goto_1
    new-instance v11, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v2, 0x0

    invoke-direct {v11, v2}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 2699
    .local v11, "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    invoke-static/range {p8 .. p8}, Lorg/mozilla/javascript/BaseFunction;->isApply(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2700
    const/4 v2, 0x2

    move/from16 v0, p2

    if-ge v0, v2, :cond_4

    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 2702
    .local v5, "callArgs":[Ljava/lang/Object;
    :goto_2
    const/4 v6, 0x0

    const/4 v7, 0x0

    array-length v8, v5

    move-object/from16 v2, p0

    move-object/from16 v3, p7

    move-object/from16 v9, p9

    move-object/from16 v10, p1

    invoke-static/range {v2 .. v11}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 2716
    .end local v5    # "callArgs":[Ljava/lang/Object;
    :goto_3
    move-object/from16 p1, v11

    .line 2717
    return-object p1

    .line 2684
    .end local v4    # "applyThis":Lorg/mozilla/javascript/Scriptable;
    .end local v11    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_2
    const/4 v4, 0x0

    .restart local v4    # "applyThis":Lorg/mozilla/javascript/Scriptable;
    goto :goto_0

    .line 2695
    :cond_3
    move/from16 v0, p5

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2696
    move/from16 v0, p6

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    goto :goto_1

    .line 2700
    .restart local v11    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_4
    add-int/lit8 v2, p5, 0x3

    aget-object v2, p3, v2

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lorg/mozilla/javascript/ScriptRuntime;->getApplyArguments(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    goto :goto_2

    .line 2707
    :cond_5
    const/16 v22, 0x1

    .local v22, "i":I
    :goto_4
    move/from16 v0, v22

    move/from16 v1, p2

    if-ge v0, v1, :cond_6

    .line 2708
    add-int/lit8 v2, p5, 0x1

    add-int v2, v2, v22

    add-int/lit8 v3, p5, 0x2

    add-int v3, v3, v22

    aget-object v3, p3, v3

    aput-object v3, p3, v2

    .line 2709
    add-int/lit8 v2, p5, 0x1

    add-int v2, v2, v22

    add-int/lit8 v3, p5, 0x2

    add-int v3, v3, v22

    aget-wide v6, p4, v3

    aput-wide v6, p4, v2

    .line 2707
    add-int/lit8 v22, v22, 0x1

    goto :goto_4

    .line 2711
    :cond_6
    const/4 v2, 0x2

    move/from16 v0, p2

    if-ge v0, v2, :cond_7

    const/16 v18, 0x0

    .line 2712
    .local v18, "argCount":I
    :goto_5
    add-int/lit8 v17, p5, 0x2

    move-object/from16 v12, p0

    move-object/from16 v13, p7

    move-object v14, v4

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    move-object/from16 v19, p9

    move-object/from16 v20, p1

    move-object/from16 v21, v11

    invoke-static/range {v12 .. v21}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    goto :goto_3

    .line 2711
    .end local v18    # "argCount":I
    :cond_7
    add-int/lit8 v18, p2, -0x1

    goto :goto_5
.end method

.method private static initFrameForNoSuchMethod(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .locals 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "indexReg"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I
    .param p6, "op"    # I
    .param p7, "funThisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p8, "calleeScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p9, "noSuchMethodShim"    # Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    .param p10, "ifun"    # Lorg/mozilla/javascript/InterpretedFunction;

    .prologue
    .line 2449
    const/4 v5, 0x0

    .line 2452
    .local v5, "argsArray":[Ljava/lang/Object;
    add-int/lit8 v14, p5, 0x2

    .line 2453
    .local v14, "shift":I
    move/from16 v0, p2

    new-array v12, v0, [Ljava/lang/Object;

    .line 2454
    .local v12, "elements":[Ljava/lang/Object;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    move/from16 v0, p2

    if-ge v13, v0, :cond_1

    .line 2455
    aget-object v15, p3, v14

    .line 2456
    .local v15, "val":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v15, v2, :cond_0

    .line 2457
    aget-wide v2, p4, v14

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v15

    .line 2459
    .end local v15    # "val":Ljava/lang/Object;
    :cond_0
    aput-object v15, v12, v13

    .line 2454
    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 2461
    :cond_1
    const/4 v2, 0x2

    new-array v5, v2, [Ljava/lang/Object;

    .line 2462
    const/4 v2, 0x0

    move-object/from16 v0, p9

    iget-object v3, v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;->methodName:Ljava/lang/String;

    aput-object v3, v5, v2

    .line 2463
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-virtual {v0, v1, v12}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    aput-object v3, v5, v2

    .line 2466
    move-object/from16 v10, p1

    .line 2467
    .local v10, "callParentFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v11, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v2, 0x0

    invoke-direct {v11, v2}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 2468
    .local v11, "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/16 v2, -0x37

    move/from16 v0, p6

    if-ne v0, v2, :cond_2

    .line 2469
    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2470
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2474
    :cond_2
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    move-object/from16 v2, p0

    move-object/from16 v3, p8

    move-object/from16 v4, p7

    move-object/from16 v9, p10

    invoke-static/range {v2 .. v11}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 2476
    const/16 v2, -0x37

    move/from16 v0, p6

    if-eq v0, v2, :cond_3

    .line 2477
    move/from16 v0, p5

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2478
    move/from16 v0, p6

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 2480
    :cond_3
    return-object v11
.end method

.method private static initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)V
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "parent"    # Lorg/mozilla/javascript/InterpretedFunction;
    .param p3, "index"    # I

    .prologue
    .line 787
    invoke-static {p0, p1, p2, p3}, Lorg/mozilla/javascript/InterpretedFunction;->createFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v0

    .line 788
    .local v0, "fn":Lorg/mozilla/javascript/InterpretedFunction;
    iget-object v1, v0, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget v1, v1, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    iget-object v2, p2, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v2, v2, Lorg/mozilla/javascript/InterpreterData;->evalScriptFlag:Z

    invoke-static {p0, p1, v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;IZ)V

    .line 790
    return-void
.end method

.method static interpret(Lorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p0, "ifun"    # Lorg/mozilla/javascript/InterpretedFunction;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 796
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->hasTopCall(Lorg/mozilla/javascript/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 798
    :cond_0
    iget-object v0, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    iget-object v1, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    .line 799
    iget-object v10, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 800
    .local v10, "savedDomain":Ljava/lang/Object;
    iget-object v0, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iput-object v0, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 802
    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityController:Lorg/mozilla/javascript/SecurityController;

    iget-object v1, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object v2, p1

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/mozilla/javascript/SecurityController;->callWithDomain(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 805
    iput-object v10, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 815
    .end local v10    # "savedDomain":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 805
    .restart local v10    # "savedDomain":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    iput-object v10, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    throw v0

    .line 809
    .end local v10    # "savedDomain":Ljava/lang/Object;
    :cond_1
    new-instance v9, Lorg/mozilla/javascript/Interpreter$CallFrame;

    invoke-direct {v9, v4}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 810
    .local v9, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    array-length v6, p4

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v7, p0

    move-object v8, v4

    invoke-static/range {v0 .. v9}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 812
    iget-boolean v0, p1, Lorg/mozilla/javascript/Context;->isContinuationsTopCall:Z

    iput-boolean v0, v9, Lorg/mozilla/javascript/Interpreter$CallFrame;->isContinuationsTopFrame:Z

    .line 813
    iput-boolean v5, p1, Lorg/mozilla/javascript/Context;->isContinuationsTopCall:Z

    .line 815
    invoke-static {p1, v9, v4}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method private static interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 113
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "throwable"    # Ljava/lang/Object;

    .prologue
    .line 885
    sget-object v55, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    .line 886
    .local v55, "DBL_MRK":Lorg/mozilla/javascript/UniqueTag;
    sget-object v107, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 888
    .local v107, "undefined":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget v6, v0, Lorg/mozilla/javascript/Context;->instructionThreshold:I

    if-eqz v6, :cond_5

    const/16 v79, 0x1

    .line 891
    .local v79, "instructionCounting":Z
    :goto_0
    const/16 v60, 0x64

    .line 893
    .local v60, "INVOCATION_COST":I
    const/16 v56, 0x64

    .line 895
    .local v56, "EXCEPTION_COST":I
    const/16 v105, 0x0

    .line 896
    .local v105, "stringReg":Ljava/lang/String;
    const/16 v21, -0x1

    .line 898
    .local v21, "indexReg":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v6, :cond_1

    .line 901
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    if-nez v6, :cond_0

    .line 902
    new-instance v6, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v6}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    .line 904
    :cond_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 914
    :cond_1
    const/16 v74, 0x0

    .line 915
    .local v74, "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    if-eqz p2, :cond_2

    .line 916
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;

    if-eqz v6, :cond_6

    move-object/from16 v74, p2

    .line 917
    check-cast v74, Lorg/mozilla/javascript/Interpreter$GeneratorState;

    .line 920
    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    const/4 v7, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6, v7}, Lorg/mozilla/javascript/Interpreter;->enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    .line 921
    const/16 p2, 0x0

    .line 928
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_2
    :goto_1
    const/16 v80, 0x0

    .line 929
    .local v80, "interpreterResult":Ljava/lang/Object;
    const-wide/16 v82, 0x0

    .local v82, "interpreterResultDbl":D
    move-object/from16 v112, p2

    .line 934
    .end local v80    # "interpreterResult":Ljava/lang/Object;
    :goto_2
    if-eqz v112, :cond_7

    .line 938
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, v112

    move-object/from16 v2, p1

    move/from16 v3, v21

    move/from16 v4, v79

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/Interpreter;->processThrowable(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Interpreter$CallFrame;IZ)Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p1

    .line 940
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    move-object/from16 p2, v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 941
    .restart local p2    # "throwable":Ljava/lang/Object;
    const/4 v6, 0x0

    :try_start_1
    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->throwable:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4

    move-object/from16 v112, p2

    .line 948
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_3
    :goto_3
    :try_start_2
    move-object/from16 v0, p1

    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 949
    .local v9, "stack":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 950
    .local v10, "sDbl":[D
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v0, v6, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v29, v0

    .line 951
    .local v29, "vars":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v0, v6, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    move-object/from16 v30, v0

    .line 952
    .local v30, "varDbls":[D
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v0, v6, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    move-object/from16 v31, v0

    .line 953
    .local v31, "varAttributes":[I
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v14, v6, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 954
    .local v14, "iCode":[B
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v6, Lorg/mozilla/javascript/InterpreterData;->itsStringTable:[Ljava/lang/String;

    move-object/from16 v106, v0

    .line 960
    .local v106, "strings":[Ljava/lang/String;
    move-object/from16 v0, p1

    iget v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 963
    .local v11, "stackTop":I
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 970
    :cond_4
    :goto_4
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v6, 0x1

    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v8, v14, v6

    .line 974
    .local v8, "op":I
    packed-switch v8, :pswitch_data_0

    .line 1890
    :pswitch_0
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    invoke-static {v6}, Lorg/mozilla/javascript/Interpreter;->dumpICode(Lorg/mozilla/javascript/InterpreterData;)V

    .line 1891
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unknown icode : "

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v12, " @ pc : "

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    iget v12, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 1933
    .end local v8    # "op":I
    .end local v9    # "stack":[Ljava/lang/Object;
    .end local v10    # "sDbl":[D
    .end local v11    # "stackTop":I
    .end local v14    # "iCode":[B
    .end local v29    # "vars":[Ljava/lang/Object;
    .end local v30    # "varDbls":[D
    .end local v31    # "varAttributes":[I
    .end local v106    # "strings":[Ljava/lang/String;
    :catch_0
    move-exception v69

    .line 1934
    .local v69, "ex":Ljava/lang/Throwable;
    :goto_5
    if-eqz v112, :cond_4a

    .line 1936
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v69

    invoke-virtual {v0, v6}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 1937
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 888
    .end local v21    # "indexReg":I
    .end local v56    # "EXCEPTION_COST":I
    .end local v60    # "INVOCATION_COST":I
    .end local v69    # "ex":Ljava/lang/Throwable;
    .end local v74    # "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    .end local v79    # "instructionCounting":Z
    .end local v82    # "interpreterResultDbl":D
    .end local v105    # "stringReg":Ljava/lang/String;
    .restart local p2    # "throwable":Ljava/lang/Object;
    :cond_5
    const/16 v79, 0x0

    goto/16 :goto_0

    .line 922
    .restart local v21    # "indexReg":I
    .restart local v56    # "EXCEPTION_COST":I
    .restart local v60    # "INVOCATION_COST":I
    .restart local v74    # "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    .restart local v79    # "instructionCounting":Z
    .restart local v105    # "stringReg":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    if-nez v6, :cond_2

    .line 924
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto/16 :goto_1

    .line 943
    .end local p2    # "throwable":Ljava/lang/Object;
    .restart local v82    # "interpreterResultDbl":D
    :cond_7
    if-nez v74, :cond_3

    :try_start_3
    move-object/from16 v0, p1

    iget-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-eqz v6, :cond_3

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto/16 :goto_3

    .line 976
    .restart local v8    # "op":I
    .restart local v9    # "stack":[Ljava/lang/Object;
    .restart local v10    # "sDbl":[D
    .restart local v11    # "stackTop":I
    .restart local v14    # "iCode":[B
    .restart local v29    # "vars":[Ljava/lang/Object;
    .restart local v30    # "varDbls":[D
    .restart local v31    # "varAttributes":[I
    .restart local v106    # "strings":[Ljava/lang/String;
    :pswitch_1
    move-object/from16 v0, p1

    iget-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v6, :cond_9

    .line 979
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, -0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 980
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/Interpreter;->captureFrameForGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;)Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object v73

    .line 981
    .local v73, "generatorFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/4 v6, 0x1

    move-object/from16 v0, v73

    iput-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 982
    new-instance v72, Lorg/mozilla/javascript/NativeGenerator;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v73

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v0, v72

    move-object/from16 v1, v73

    invoke-direct {v0, v6, v7, v1}, Lorg/mozilla/javascript/NativeGenerator;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;Ljava/lang/Object;)V

    .line 984
    .local v72, "generator":Lorg/mozilla/javascript/NativeGenerator;
    move-object/from16 v0, v72

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1917
    .end local v72    # "generator":Lorg/mozilla/javascript/NativeGenerator;
    .end local v73    # "generatorFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_6
    :pswitch_2
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 1918
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    move-object/from16 v80, v0

    .line 1919
    .restart local v80    # "interpreterResult":Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-wide v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    move-wide/from16 v82, v0

    .line 1920
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v6, :cond_48

    .line 1921
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 p1, v0

    .line 1922
    move-object/from16 v0, p1

    iget-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-eqz v6, :cond_8

    .line 1923
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p1

    .line 1925
    :cond_8
    move-object/from16 v0, p1

    move-object/from16 v1, v80

    move-wide/from16 v2, v82

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Interpreter;->setCallResult(Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;D)V

    .line 1927
    const/16 v80, 0x0

    goto/16 :goto_2

    .line 992
    .end local v80    # "interpreterResult":Ljava/lang/Object;
    :cond_9
    :pswitch_3
    move-object/from16 v0, p1

    iget-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v6, :cond_b

    .line 993
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v74

    invoke-static {v0, v1, v11, v2}, Lorg/mozilla/javascript/Interpreter;->freezeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;)Ljava/lang/Object;

    move-result-object v80

    .line 2086
    .end local v8    # "op":I
    .end local v9    # "stack":[Ljava/lang/Object;
    .end local v10    # "sDbl":[D
    .end local v11    # "stackTop":I
    .end local v14    # "iCode":[B
    .end local v29    # "vars":[Ljava/lang/Object;
    .end local v30    # "varDbls":[D
    .end local v31    # "varAttributes":[I
    .end local v106    # "strings":[Ljava/lang/String;
    :cond_a
    :goto_7
    return-object v80

    .line 995
    .restart local v8    # "op":I
    .restart local v9    # "stack":[Ljava/lang/Object;
    .restart local v10    # "sDbl":[D
    .restart local v11    # "stackTop":I
    .restart local v14    # "iCode":[B
    .restart local v29    # "vars":[Ljava/lang/Object;
    .restart local v30    # "varDbls":[D
    .restart local v31    # "varAttributes":[I
    .restart local v106    # "strings":[Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p1

    move-object/from16 v1, v74

    invoke-static {v0, v11, v1, v8}, Lorg/mozilla/javascript/Interpreter;->thawGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;I)Ljava/lang/Object;

    move-result-object v91

    .line 996
    .local v91, "obj":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v0, v91

    if-eq v0, v6, :cond_4

    .line 997
    move-object/from16 p2, v91

    .line 1945
    .end local v8    # "op":I
    .end local v9    # "stack":[Ljava/lang/Object;
    .end local v10    # "sDbl":[D
    .end local v11    # "stackTop":I
    .end local v14    # "iCode":[B
    .end local v29    # "vars":[Ljava/lang/Object;
    .end local v30    # "varDbls":[D
    .end local v31    # "varAttributes":[I
    .end local v91    # "obj":Ljava/lang/Object;
    .end local v106    # "strings":[Ljava/lang/String;
    :goto_8
    if-nez p2, :cond_c

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1948
    :cond_c
    const/16 v57, 0x2

    .line 1949
    .local v57, "EX_CATCH_STATE":I
    const/16 v58, 0x1

    .line 1950
    .local v58, "EX_FINALLY_STATE":I
    const/16 v59, 0x0

    .line 1953
    .local v59, "EX_NO_JS_STATE":I
    const/16 v64, 0x0

    .line 1955
    .local v64, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    if-eqz v74, :cond_4b

    move-object/from16 v0, v74

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_4b

    move-object/from16 v0, v74

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    move-object/from16 v0, p2

    if-ne v0, v6, :cond_4b

    .line 1959
    const/16 v70, 0x1

    .line 1987
    .local v70, "exState":I
    :goto_9
    if-eqz v79, :cond_5f

    .line 1989
    const/16 v6, 0x64

    :try_start_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/Interpreter;->addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_2

    move-object/from16 v6, p2

    .line 2001
    :goto_a
    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v7, :cond_d

    instance-of v7, v6, Ljava/lang/RuntimeException;

    if-eqz v7, :cond_d

    move-object/from16 v100, v6

    .line 2005
    check-cast v100, Ljava/lang/RuntimeException;

    .line 2007
    .local v100, "rex":Ljava/lang/RuntimeException;
    :try_start_5
    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    move-object/from16 v0, p0

    move-object/from16 v1, v100

    invoke-interface {v7, v0, v1}, Lorg/mozilla/javascript/debug/DebugFrame;->onExceptionThrown(Lorg/mozilla/javascript/Context;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    .line 2018
    .end local v100    # "rex":Ljava/lang/RuntimeException;
    :cond_d
    :goto_b
    if-eqz v70, :cond_57

    .line 2019
    const/4 v7, 0x2

    move/from16 v0, v70

    if-eq v0, v7, :cond_56

    const/16 v93, 0x1

    .line 2020
    .local v93, "onlyFinally":Z
    :goto_c
    move-object/from16 v0, p1

    move/from16 v1, v93

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Interpreter;->getExceptionHandler(Lorg/mozilla/javascript/Interpreter$CallFrame;Z)I

    move-result v21

    .line 2021
    if-ltz v21, :cond_57

    move-object/from16 v112, v6

    .line 2025
    goto/16 :goto_2

    .line 1005
    .end local v57    # "EX_CATCH_STATE":I
    .end local v58    # "EX_FINALLY_STATE":I
    .end local v59    # "EX_NO_JS_STATE":I
    .end local v64    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .end local v70    # "exState":I
    .end local v93    # "onlyFinally":Z
    .restart local v8    # "op":I
    .restart local v9    # "stack":[Ljava/lang/Object;
    .restart local v10    # "sDbl":[D
    .restart local v11    # "stackTop":I
    .restart local v14    # "iCode":[B
    .restart local v29    # "vars":[Ljava/lang/Object;
    .restart local v30    # "varDbls":[D
    .restart local v31    # "varAttributes":[I
    .restart local v106    # "strings":[Ljava/lang/String;
    :pswitch_4
    const/4 v6, 0x1

    :try_start_6
    move-object/from16 v0, p1

    iput-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 1006
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v103

    .line 1007
    .local v103, "sourceLine":I
    new-instance v6, Lorg/mozilla/javascript/JavaScriptException;

    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v7}, Lorg/mozilla/javascript/NativeIterator;->getStopIterationObject(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v12, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v12, v12, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move/from16 v0, v103

    invoke-direct {v6, v7, v12, v0}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    move-object/from16 v0, v74

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    goto/16 :goto_6

    .line 1013
    .end local v103    # "sourceLine":I
    :pswitch_5
    aget-object v110, v9, v11

    .line 1014
    .local v110, "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_e

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v110

    .line 1015
    .end local v110    # "value":Ljava/lang/Object;
    :cond_e
    add-int/lit8 v11, v11, -0x1

    .line 1017
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v103

    .line 1018
    .restart local v103    # "sourceLine":I
    new-instance p2, Lorg/mozilla/javascript/JavaScriptException;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v110

    move/from16 v2, v103

    invoke-direct {v0, v1, v6, v2}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .local p2, "throwable":Lorg/mozilla/javascript/JavaScriptException;
    goto/16 :goto_8

    .line 1024
    .end local v103    # "sourceLine":I
    .end local p2    # "throwable":Lorg/mozilla/javascript/JavaScriptException;
    :pswitch_6
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1025
    aget-object p2, v9, v21

    .local p2, "throwable":Ljava/lang/Object;
    goto/16 :goto_8

    .line 1032
    .end local p2    # "throwable":Ljava/lang/Object;
    :pswitch_7
    move-object/from16 v0, p1

    invoke-static {v0, v8, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doCompare(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1033
    goto/16 :goto_4

    .line 1037
    :pswitch_8
    move-object/from16 v0, p0

    invoke-static {v0, v8, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doInOrInstanceof(Lorg/mozilla/javascript/Context;I[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1038
    goto/16 :goto_4

    .line 1042
    :pswitch_9
    add-int/lit8 v11, v11, -0x1

    .line 1043
    invoke-static {v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doEquals([Ljava/lang/Object;[DI)Z

    move-result v109

    .line 1044
    .local v109, "valBln":Z
    const/16 v6, 0xd

    if-ne v8, v6, :cond_f

    const/4 v6, 0x1

    :goto_d
    xor-int v109, v109, v6

    .line 1045
    invoke-static/range {v109 .. v109}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1044
    :cond_f
    const/4 v6, 0x0

    goto :goto_d

    .line 1050
    .end local v109    # "valBln":Z
    :pswitch_a
    add-int/lit8 v11, v11, -0x1

    .line 1051
    invoke-static {v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doShallowEquals([Ljava/lang/Object;[DI)Z

    move-result v109

    .line 1052
    .restart local v109    # "valBln":Z
    const/16 v6, 0x2f

    if-ne v8, v6, :cond_10

    const/4 v6, 0x1

    :goto_e
    xor-int v109, v109, v6

    .line 1053
    invoke-static/range {v109 .. v109}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1052
    :cond_10
    const/4 v6, 0x0

    goto :goto_e

    .line 1057
    .end local v109    # "valBln":Z
    :pswitch_b
    add-int/lit8 v104, v11, -0x1

    .end local v11    # "stackTop":I
    .local v104, "stackTop":I
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 1058
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move/from16 v11, v104

    .line 1059
    .end local v104    # "stackTop":I
    .restart local v11    # "stackTop":I
    goto/16 :goto_4

    .line 1063
    :pswitch_c
    add-int/lit8 v104, v11, -0x1

    .end local v11    # "stackTop":I
    .restart local v104    # "stackTop":I
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v6

    if-nez v6, :cond_5e

    .line 1064
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move/from16 v11, v104

    .line 1065
    .end local v104    # "stackTop":I
    .restart local v11    # "stackTop":I
    goto/16 :goto_4

    .line 1069
    :pswitch_d
    add-int/lit8 v104, v11, -0x1

    .end local v11    # "stackTop":I
    .restart local v104    # "stackTop":I
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v6

    if-nez v6, :cond_11

    .line 1070
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move/from16 v11, v104

    .line 1071
    .end local v104    # "stackTop":I
    .restart local v11    # "stackTop":I
    goto/16 :goto_4

    .line 1073
    .end local v11    # "stackTop":I
    .restart local v104    # "stackTop":I
    :cond_11
    add-int/lit8 v11, v104, -0x1

    .end local v104    # "stackTop":I
    .restart local v11    # "stackTop":I
    const/4 v6, 0x0

    aput-object v6, v9, v104

    .line 1899
    :goto_f
    :pswitch_e
    if-eqz v79, :cond_12

    .line 1900
    const/4 v6, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/Interpreter;->addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V

    .line 1902
    :cond_12
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getShort([BI)I

    move-result v92

    .line 1903
    .local v92, "offset":I
    if-eqz v92, :cond_47

    .line 1905
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v92, -0x1

    add-int/2addr v6, v7

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 1910
    :goto_10
    if-eqz v79, :cond_4

    .line 1911
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    goto/16 :goto_4

    .line 1078
    .end local v92    # "offset":I
    :pswitch_f
    add-int/lit8 v11, v11, 0x1

    .line 1079
    aput-object v55, v9, v11

    .line 1080
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    int-to-double v6, v6

    aput-wide v6, v10, v11

    goto :goto_f

    .line 1083
    :pswitch_10
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    add-int/lit8 v6, v6, 0x1

    if-ne v11, v6, :cond_13

    .line 1085
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1086
    aget-object v6, v9, v11

    aput-object v6, v9, v21

    .line 1087
    aget-wide v6, v10, v11

    aput-wide v6, v10, v21

    .line 1088
    add-int/lit8 v11, v11, -0x1

    goto/16 :goto_4

    .line 1092
    :cond_13
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    if-eq v11, v6, :cond_4

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto/16 :goto_4

    .line 1097
    :pswitch_11
    if-eqz v79, :cond_14

    .line 1098
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/Interpreter;->addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V

    .line 1100
    :cond_14
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1101
    aget-object v110, v9, v21

    .line 1102
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-eq v0, v1, :cond_15

    .line 1104
    move-object/from16 p2, v110

    .restart local p2    # "throwable":Ljava/lang/Object;
    goto/16 :goto_8

    .line 1108
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_15
    aget-wide v6, v10, v21

    double-to-int v6, v6

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 1109
    if-eqz v79, :cond_4

    .line 1110
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    goto/16 :goto_4

    .line 1115
    .end local v110    # "value":Ljava/lang/Object;
    :pswitch_12
    const/4 v6, 0x0

    aput-object v6, v9, v11

    .line 1116
    add-int/lit8 v11, v11, -0x1

    .line 1117
    goto/16 :goto_4

    .line 1119
    :pswitch_13
    aget-object v6, v9, v11

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1120
    aget-wide v6, v10, v11

    move-object/from16 v0, p1

    iput-wide v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 1121
    const/4 v6, 0x0

    aput-object v6, v9, v11

    .line 1122
    add-int/lit8 v11, v11, -0x1

    .line 1123
    goto/16 :goto_4

    .line 1125
    :pswitch_14
    add-int/lit8 v6, v11, 0x1

    aget-object v7, v9, v11

    aput-object v7, v9, v6

    .line 1126
    add-int/lit8 v6, v11, 0x1

    aget-wide v12, v10, v11

    aput-wide v12, v10, v6

    .line 1127
    add-int/lit8 v11, v11, 0x1

    .line 1128
    goto/16 :goto_4

    .line 1130
    :pswitch_15
    add-int/lit8 v6, v11, 0x1

    add-int/lit8 v7, v11, -0x1

    aget-object v7, v9, v7

    aput-object v7, v9, v6

    .line 1131
    add-int/lit8 v6, v11, 0x1

    add-int/lit8 v7, v11, -0x1

    aget-wide v12, v10, v7

    aput-wide v12, v10, v6

    .line 1132
    add-int/lit8 v6, v11, 0x2

    aget-object v7, v9, v11

    aput-object v7, v9, v6

    .line 1133
    add-int/lit8 v6, v11, 0x2

    aget-wide v12, v10, v11

    aput-wide v12, v10, v6

    .line 1134
    add-int/lit8 v11, v11, 0x2

    .line 1135
    goto/16 :goto_4

    .line 1137
    :pswitch_16
    aget-object v90, v9, v11

    .line 1138
    .local v90, "o":Ljava/lang/Object;
    add-int/lit8 v6, v11, -0x1

    aget-object v6, v9, v6

    aput-object v6, v9, v11

    .line 1139
    add-int/lit8 v6, v11, -0x1

    aput-object v90, v9, v6

    .line 1140
    aget-wide v66, v10, v11

    .line 1141
    .local v66, "d":D
    add-int/lit8 v6, v11, -0x1

    aget-wide v6, v10, v6

    aput-wide v6, v10, v11

    .line 1142
    add-int/lit8 v6, v11, -0x1

    aput-wide v66, v10, v6

    goto/16 :goto_4

    .line 1146
    .end local v66    # "d":D
    .end local v90    # "o":Ljava/lang/Object;
    :pswitch_17
    aget-object v6, v9, v11

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1147
    aget-wide v6, v10, v11

    move-object/from16 v0, p1

    iput-wide v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 1148
    add-int/lit8 v11, v11, -0x1

    .line 1149
    goto/16 :goto_6

    .line 1153
    :pswitch_18
    move-object/from16 v0, v107

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    goto/16 :goto_6

    .line 1156
    :pswitch_19
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v95

    .line 1157
    .local v95, "rIntValue":I
    aput-object v55, v9, v11

    .line 1158
    xor-int/lit8 v6, v95, -0x1

    int-to-double v6, v6

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1166
    .end local v95    # "rIntValue":I
    :pswitch_1a
    move-object/from16 v0, p1

    invoke-static {v0, v8, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doBitOp(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1167
    goto/16 :goto_4

    .line 1170
    :pswitch_1b
    add-int/lit8 v6, v11, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v84

    .line 1171
    .local v84, "lDbl":D
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v6

    and-int/lit8 v95, v6, 0x1f

    .line 1172
    .restart local v95    # "rIntValue":I
    add-int/lit8 v11, v11, -0x1

    aput-object v55, v9, v11

    .line 1173
    invoke-static/range {v84 .. v85}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v6

    ushr-long v6, v6, v95

    long-to-double v6, v6

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1178
    .end local v84    # "lDbl":D
    .end local v95    # "rIntValue":I
    :pswitch_1c
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v96

    .line 1179
    .local v96, "rDbl":D
    aput-object v55, v9, v11

    .line 1180
    const/16 v6, 0x1d

    if-ne v8, v6, :cond_16

    .line 1181
    move-wide/from16 v0, v96

    neg-double v0, v0

    move-wide/from16 v96, v0

    .line 1183
    :cond_16
    aput-wide v96, v10, v11

    goto/16 :goto_4

    .line 1187
    .end local v96    # "rDbl":D
    :pswitch_1d
    add-int/lit8 v11, v11, -0x1

    .line 1188
    move-object/from16 v0, p0

    invoke-static {v9, v10, v11, v0}, Lorg/mozilla/javascript/Interpreter;->doAdd([Ljava/lang/Object;[DILorg/mozilla/javascript/Context;)V

    goto/16 :goto_4

    .line 1194
    :pswitch_1e
    move-object/from16 v0, p1

    invoke-static {v0, v8, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doArithmetic(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1195
    goto/16 :goto_4

    .line 1198
    :pswitch_1f
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v6

    if-nez v6, :cond_17

    const/4 v6, 0x1

    :goto_11
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    :cond_17
    const/4 v6, 0x0

    goto :goto_11

    .line 1202
    :pswitch_20
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v105

    invoke-static {v0, v6, v1}, Lorg/mozilla/javascript/ScriptRuntime;->bind(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1206
    :pswitch_21
    aget-object v101, v9, v11

    .line 1207
    .local v101, "rhs":Ljava/lang/Object;
    move-object/from16 v0, v101

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_18

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v101

    .line 1208
    .end local v101    # "rhs":Ljava/lang/Object;
    :cond_18
    add-int/lit8 v11, v11, -0x1

    .line 1209
    aget-object v86, v9, v11

    check-cast v86, Lorg/mozilla/javascript/Scriptable;

    .line 1210
    .local v86, "lhs":Lorg/mozilla/javascript/Scriptable;
    const/16 v6, 0x8

    if-ne v8, v6, :cond_19

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, v101

    move-object/from16 v2, p0

    move-object/from16 v3, v105

    invoke-static {v0, v1, v2, v6, v3}, Lorg/mozilla/javascript/ScriptRuntime;->setName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    :goto_12
    aput-object v6, v9, v11

    goto/16 :goto_4

    :cond_19
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, v101

    move-object/from16 v2, p0

    move-object/from16 v3, v105

    invoke-static {v0, v1, v2, v6, v3}, Lorg/mozilla/javascript/ScriptRuntime;->strictSetName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_12

    .line 1218
    .end local v86    # "lhs":Lorg/mozilla/javascript/Scriptable;
    :pswitch_22
    aget-object v101, v9, v11

    .line 1219
    .restart local v101    # "rhs":Ljava/lang/Object;
    move-object/from16 v0, v101

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_1a

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v101

    .line 1220
    .end local v101    # "rhs":Ljava/lang/Object;
    :cond_1a
    add-int/lit8 v11, v11, -0x1

    .line 1221
    aget-object v86, v9, v11

    check-cast v86, Lorg/mozilla/javascript/Scriptable;

    .line 1222
    .restart local v86    # "lhs":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, v86

    move-object/from16 v1, v101

    move-object/from16 v2, p0

    move-object/from16 v3, v105

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->setConst(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .end local v86    # "lhs":Lorg/mozilla/javascript/Scriptable;
    :pswitch_23
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    .line 1227
    invoke-static/range {v6 .. v11}, Lorg/mozilla/javascript/Interpreter;->doDelName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1228
    goto/16 :goto_4

    .line 1231
    :pswitch_24
    aget-object v86, v9, v11

    .line 1232
    .local v86, "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_1b

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1233
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_1b
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, v105

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1238
    :pswitch_25
    aget-object v86, v9, v11

    .line 1239
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_1c

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1240
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_1c
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, v105

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1245
    :pswitch_26
    aget-object v101, v9, v11

    .line 1246
    .restart local v101    # "rhs":Ljava/lang/Object;
    move-object/from16 v0, v101

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_1d

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v101

    .line 1247
    .end local v101    # "rhs":Ljava/lang/Object;
    :cond_1d
    add-int/lit8 v11, v11, -0x1

    .line 1248
    aget-object v86, v9, v11

    .line 1249
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_1e

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1250
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_1e
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, v105

    move-object/from16 v2, v101

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1255
    :pswitch_27
    aget-object v86, v9, v11

    .line 1256
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_1f

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1257
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_1f
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v7, v14, v7

    move-object/from16 v0, v86

    move-object/from16 v1, v105

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    .line 1260
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1264
    :pswitch_28
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doGetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1265
    goto/16 :goto_4

    .line 1268
    :pswitch_29
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->doSetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1269
    goto/16 :goto_4

    :pswitch_2a
    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object v15, v9

    move-object/from16 v16, v10

    move/from16 v17, v11

    .line 1272
    invoke-static/range {v12 .. v17}, Lorg/mozilla/javascript/Interpreter;->doElemIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[B[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1273
    goto/16 :goto_4

    .line 1276
    :pswitch_2b
    aget-object v99, v9, v11

    check-cast v99, Lorg/mozilla/javascript/Ref;

    .line 1277
    .local v99, "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, v99

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->refGet(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1281
    .end local v99    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_2c
    aget-object v110, v9, v11

    .line 1282
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_20

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v110

    .line 1283
    .end local v110    # "value":Ljava/lang/Object;
    :cond_20
    add-int/lit8 v11, v11, -0x1

    .line 1284
    aget-object v99, v9, v11

    check-cast v99, Lorg/mozilla/javascript/Ref;

    .line 1285
    .restart local v99    # "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v99

    move-object/from16 v1, v110

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->refSet(Lorg/mozilla/javascript/Ref;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1289
    .end local v99    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_2d
    aget-object v99, v9, v11

    check-cast v99, Lorg/mozilla/javascript/Ref;

    .line 1290
    .restart local v99    # "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, v99

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->refDel(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1294
    .end local v99    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_2e
    aget-object v99, v9, v11

    check-cast v99, Lorg/mozilla/javascript/Ref;

    .line 1295
    .restart local v99    # "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v7, v14, v7

    move-object/from16 v0, v99

    move-object/from16 v1, p0

    invoke-static {v0, v1, v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->refIncrDecr(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    .line 1297
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1301
    .end local v99    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_2f
    add-int/lit8 v11, v11, 0x1

    .line 1302
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1303
    aget-object v6, v9, v21

    aput-object v6, v9, v11

    .line 1304
    aget-wide v6, v10, v21

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1307
    :pswitch_30
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1308
    const/4 v6, 0x0

    aput-object v6, v9, v21

    goto/16 :goto_4

    .line 1312
    :pswitch_31
    add-int/lit8 v11, v11, 0x1

    .line 1313
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v105

    move-object/from16 v1, p0

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getNameFunctionAndThis(Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v6

    aput-object v6, v9, v11

    .line 1315
    add-int/lit8 v11, v11, 0x1

    .line 1316
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1319
    :pswitch_32
    aget-object v91, v9, v11

    .line 1320
    .restart local v91    # "obj":Ljava/lang/Object;
    move-object/from16 v0, v91

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_21

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v91

    .line 1322
    .end local v91    # "obj":Ljava/lang/Object;
    :cond_21
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v91

    move-object/from16 v1, v105

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v6

    aput-object v6, v9, v11

    .line 1324
    add-int/lit8 v11, v11, 0x1

    .line 1325
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1329
    :pswitch_33
    add-int/lit8 v6, v11, -0x1

    aget-object v91, v9, v6

    .line 1330
    .restart local v91    # "obj":Ljava/lang/Object;
    move-object/from16 v0, v91

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_22

    add-int/lit8 v6, v11, -0x1

    aget-wide v6, v10, v6

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v91

    .line 1331
    .end local v91    # "obj":Ljava/lang/Object;
    :cond_22
    aget-object v77, v9, v11

    .line 1332
    .local v77, "id":Ljava/lang/Object;
    move-object/from16 v0, v77

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_23

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v77

    .line 1333
    .end local v77    # "id":Ljava/lang/Object;
    :cond_23
    add-int/lit8 v6, v11, -0x1

    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v91

    move-object/from16 v1, v77

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v7}, Lorg/mozilla/javascript/ScriptRuntime;->getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v7

    aput-object v7, v9, v6

    .line 1335
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1339
    :pswitch_34
    aget-object v110, v9, v11

    .line 1340
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_24

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v110

    .line 1341
    .end local v110    # "value":Ljava/lang/Object;
    :cond_24
    move-object/from16 v0, v110

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->getValueFunctionAndThis(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;

    move-result-object v6

    aput-object v6, v9, v11

    .line 1342
    add-int/lit8 v11, v11, 0x1

    .line 1343
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1347
    :pswitch_35
    if-eqz v79, :cond_25

    .line 1348
    move-object/from16 v0, p0

    iget v6, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/lit8 v6, v6, 0x64

    move-object/from16 v0, p0

    iput v6, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    :cond_25
    move-object/from16 v15, p0

    move-object/from16 v16, p1

    move-object/from16 v17, v9

    move-object/from16 v18, v10

    move/from16 v19, v11

    move-object/from16 v20, v14

    .line 1350
    invoke-static/range {v15 .. v21}, Lorg/mozilla/javascript/Interpreter;->doCallSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[BI)I

    move-result v11

    .line 1351
    goto/16 :goto_4

    .line 1356
    :pswitch_36
    if-eqz v79, :cond_26

    .line 1357
    move-object/from16 v0, p0

    iget v6, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/lit8 v6, v6, 0x64

    move-object/from16 v0, p0

    iput v6, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 1361
    :cond_26
    add-int/lit8 v6, v21, 0x1

    sub-int/2addr v11, v6

    .line 1365
    aget-object v71, v9, v11

    check-cast v71, Lorg/mozilla/javascript/Callable;

    .line 1366
    .local v71, "fun":Lorg/mozilla/javascript/Callable;
    add-int/lit8 v6, v11, 0x1

    aget-object v17, v9, v6

    check-cast v17, Lorg/mozilla/javascript/Scriptable;

    .line 1367
    .local v17, "funThisObj":Lorg/mozilla/javascript/Scriptable;
    const/16 v6, 0x46

    if-ne v8, v6, :cond_27

    .line 1368
    add-int/lit8 v6, v11, 0x2

    move/from16 v0, v21

    invoke-static {v9, v10, v6, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v94

    .line 1370
    .local v94, "outArgs":[Ljava/lang/Object;
    move-object/from16 v0, v71

    move-object/from16 v1, v17

    move-object/from16 v2, v94

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->callRef(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Ref;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1374
    .end local v94    # "outArgs":[Ljava/lang/Object;
    :cond_27
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v16, v0

    .line 1375
    .local v16, "calleeScope":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p1

    iget-boolean v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-eqz v6, :cond_28

    .line 1376
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    .line 1378
    :cond_28
    move-object/from16 v0, v71

    instance-of v6, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v6, :cond_2b

    .line 1379
    move-object/from16 v0, v71

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v22, v0

    .line 1380
    .local v22, "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v22

    iget-object v7, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v6, v7, :cond_2b

    .line 1381
    move-object/from16 v23, p1

    .line 1382
    .local v23, "callParentFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v24, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v6, 0x0

    move-object/from16 v0, v24

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 1383
    .local v24, "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/16 v6, -0x37

    if-ne v8, v6, :cond_29

    .line 1399
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 v23, v0

    .line 1402
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 1404
    :cond_29
    add-int/lit8 v20, v11, 0x2

    move-object/from16 v15, p0

    move-object/from16 v18, v9

    move-object/from16 v19, v10

    invoke-static/range {v15 .. v24}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 1407
    const/16 v6, -0x37

    if-eq v8, v6, :cond_2a

    .line 1408
    move-object/from16 v0, p1

    iput v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 1409
    move-object/from16 v0, p1

    iput v8, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 1411
    :cond_2a
    move-object/from16 p1, v24

    goto/16 :goto_2

    .line 1416
    .end local v22    # "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    .end local v23    # "callParentFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v24    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_2b
    move-object/from16 v0, v71

    instance-of v6, v0, Lorg/mozilla/javascript/NativeContinuation;

    if-eqz v6, :cond_2d

    .line 1419
    new-instance v64, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    check-cast v71, Lorg/mozilla/javascript/NativeContinuation;

    .end local v71    # "fun":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, v64

    move-object/from16 v1, v71

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Interpreter$ContinuationJump;-><init>(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 1423
    .restart local v64    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    if-nez v21, :cond_2c

    .line 1424
    move-object/from16 v0, v107

    move-object/from16 v1, v64

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 1431
    :goto_13
    move-object/from16 p2, v64

    .local p2, "throwable":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    goto/16 :goto_8

    .line 1426
    .end local p2    # "throwable":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_2c
    add-int/lit8 v6, v11, 0x2

    aget-object v6, v9, v6

    move-object/from16 v0, v64

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 1427
    add-int/lit8 v6, v11, 0x2

    aget-wide v6, v10, v6

    move-object/from16 v0, v64

    iput-wide v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D

    goto :goto_13

    .line 1435
    .end local v64    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .restart local v71    # "fun":Lorg/mozilla/javascript/Callable;
    :cond_2d
    move-object/from16 v0, v71

    instance-of v6, v0, Lorg/mozilla/javascript/IdFunctionObject;

    if-eqz v6, :cond_2f

    .line 1436
    move-object/from16 v0, v71

    check-cast v0, Lorg/mozilla/javascript/IdFunctionObject;

    move-object/from16 v22, v0

    .line 1437
    .local v22, "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/NativeContinuation;->isContinuationConstructor(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 1438
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v7, v12}, Lorg/mozilla/javascript/Interpreter;->captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;

    move-result-object v7

    aput-object v7, v6, v11

    goto/16 :goto_4

    .line 1444
    :cond_2e
    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/BaseFunction;->isApplyOrCall(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v6

    if-eqz v6, :cond_2f

    .line 1445
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->getCallable(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v62

    .line 1446
    .local v62, "applyCallable":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, v62

    instance-of v6, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v6, :cond_2f

    .line 1447
    move-object/from16 v0, v62

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v34, v0

    .line 1448
    .local v34, "iApplyCallable":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v34

    iget-object v7, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v6, v7, :cond_2f

    move-object/from16 v25, p0

    move-object/from16 v26, p1

    move/from16 v27, v21

    move-object/from16 v28, v9

    move-object/from16 v29, v10

    move/from16 v30, v11

    move/from16 v31, v8

    move-object/from16 v32, v16

    move-object/from16 v33, v22

    .line 1449
    invoke-static/range {v25 .. v34}, Lorg/mozilla/javascript/Interpreter;->initFrameForApplyOrCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;

    .end local v29    # "vars":[Ljava/lang/Object;
    .end local v30    # "varDbls":[D
    .end local v31    # "varAttributes":[I
    move-result-object p1

    goto/16 :goto_2

    .line 1460
    .end local v22    # "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    .end local v34    # "iApplyCallable":Lorg/mozilla/javascript/InterpretedFunction;
    .end local v62    # "applyCallable":Lorg/mozilla/javascript/Callable;
    .restart local v29    # "vars":[Ljava/lang/Object;
    .restart local v30    # "varDbls":[D
    .restart local v31    # "varAttributes":[I
    :cond_2f
    move-object/from16 v0, v71

    instance-of v6, v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;

    if-eqz v6, :cond_30

    .line 1462
    move-object/from16 v0, v71

    check-cast v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;

    move-object/from16 v44, v0

    .line 1463
    .local v44, "noSuchMethodShim":Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    move-object/from16 v0, v44

    iget-object v0, v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;->noSuchMethodMethod:Lorg/mozilla/javascript/Callable;

    move-object/from16 v89, v0

    .line 1465
    .local v89, "noSuchMethodMethod":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, v89

    instance-of v6, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v6, :cond_30

    .line 1466
    move-object/from16 v0, v89

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v22, v0

    .line 1467
    .local v22, "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v22

    iget-object v7, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v6, v7, :cond_30

    move-object/from16 v35, p0

    move-object/from16 v36, p1

    move/from16 v37, v21

    move-object/from16 v38, v9

    move-object/from16 v39, v10

    move/from16 v40, v11

    move/from16 v41, v8

    move-object/from16 v42, v17

    move-object/from16 v43, v16

    move-object/from16 v45, v22

    .line 1468
    invoke-static/range {v35 .. v45}, Lorg/mozilla/javascript/Interpreter;->initFrameForNoSuchMethod(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p1

    goto/16 :goto_2

    .line 1476
    .end local v22    # "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    .end local v44    # "noSuchMethodShim":Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    .end local v89    # "noSuchMethodMethod":Lorg/mozilla/javascript/Callable;
    :cond_30
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 1477
    move-object/from16 v0, p1

    iput v8, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 1478
    move-object/from16 v0, p1

    iput v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 1479
    add-int/lit8 v6, v11, 0x2

    move/from16 v0, v21

    invoke-static {v9, v10, v6, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v71

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    invoke-interface {v0, v1, v2, v3, v6}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1485
    .end local v16    # "calleeScope":Lorg/mozilla/javascript/Scriptable;
    .end local v17    # "funThisObj":Lorg/mozilla/javascript/Scriptable;
    .end local v71    # "fun":Lorg/mozilla/javascript/Callable;
    :pswitch_37
    if-eqz v79, :cond_31

    .line 1486
    move-object/from16 v0, p0

    iget v6, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/lit8 v6, v6, 0x64

    move-object/from16 v0, p0

    iput v6, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 1490
    :cond_31
    sub-int v11, v11, v21

    .line 1492
    aget-object v86, v9, v11

    .line 1493
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    instance-of v6, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v6, :cond_32

    .line 1494
    move-object/from16 v0, v86

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v52, v0

    .line 1495
    .local v52, "f":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v52

    iget-object v7, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v6, v7, :cond_32

    .line 1496
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v6}, Lorg/mozilla/javascript/InterpretedFunction;->createObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v47

    .line 1497
    .local v47, "newInstance":Lorg/mozilla/javascript/Scriptable;
    new-instance v24, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v6, 0x0

    move-object/from16 v0, v24

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 1498
    .restart local v24    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v46, v0

    add-int/lit8 v50, v11, 0x1

    move-object/from16 v45, p0

    move-object/from16 v48, v9

    move-object/from16 v49, v10

    move/from16 v51, v21

    move-object/from16 v53, p1

    move-object/from16 v54, v24

    invoke-static/range {v45 .. v54}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 1502
    aput-object v47, v9, v11

    .line 1503
    move-object/from16 v0, p1

    iput v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 1504
    move-object/from16 v0, p1

    iput v8, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 1505
    move-object/from16 p1, v24

    goto/16 :goto_2

    .line 1509
    .end local v24    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v47    # "newInstance":Lorg/mozilla/javascript/Scriptable;
    .end local v52    # "f":Lorg/mozilla/javascript/InterpretedFunction;
    :cond_32
    move-object/from16 v0, v86

    instance-of v6, v0, Lorg/mozilla/javascript/Function;

    if-nez v6, :cond_34

    .line 1510
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_33

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1511
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_33
    invoke-static/range {v86 .. v86}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 1513
    .restart local v86    # "lhs":Ljava/lang/Object;
    :cond_34
    move-object/from16 v0, v86

    check-cast v0, Lorg/mozilla/javascript/Function;

    move-object/from16 v71, v0

    .line 1515
    .local v71, "fun":Lorg/mozilla/javascript/Function;
    move-object/from16 v0, v71

    instance-of v6, v0, Lorg/mozilla/javascript/IdFunctionObject;

    if-eqz v6, :cond_35

    .line 1516
    move-object/from16 v0, v71

    check-cast v0, Lorg/mozilla/javascript/IdFunctionObject;

    move-object/from16 v22, v0

    .line 1517
    .local v22, "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/NativeContinuation;->isContinuationConstructor(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v6

    if-eqz v6, :cond_35

    .line 1518
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v7, v12}, Lorg/mozilla/javascript/Interpreter;->captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;

    move-result-object v7

    aput-object v7, v6, v11

    goto/16 :goto_4

    .line 1524
    .end local v22    # "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    :cond_35
    add-int/lit8 v6, v11, 0x1

    move/from16 v0, v21

    invoke-static {v9, v10, v6, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v94

    .line 1525
    .restart local v94    # "outArgs":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v71

    move-object/from16 v1, p0

    move-object/from16 v2, v94

    invoke-interface {v0, v1, v6, v2}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1529
    .end local v71    # "fun":Lorg/mozilla/javascript/Function;
    .end local v86    # "lhs":Ljava/lang/Object;
    .end local v94    # "outArgs":[Ljava/lang/Object;
    :pswitch_38
    aget-object v86, v9, v11

    .line 1530
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_36

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1531
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_36
    invoke-static/range {v86 .. v86}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1535
    :pswitch_39
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v105

    invoke-static {v6, v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeofName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1538
    :pswitch_3a
    add-int/lit8 v11, v11, 0x1

    aput-object v105, v9, v11

    goto/16 :goto_4

    .line 1541
    :pswitch_3b
    add-int/lit8 v11, v11, 0x1

    .line 1542
    aput-object v55, v9, v11

    .line 1543
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getShort([BI)I

    move-result v6

    int-to-double v6, v6

    aput-wide v6, v10, v11

    .line 1544
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1547
    :pswitch_3c
    add-int/lit8 v11, v11, 0x1

    .line 1548
    aput-object v55, v9, v11

    .line 1549
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getInt([BI)I

    move-result v6

    int-to-double v6, v6

    aput-wide v6, v10, v11

    .line 1550
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x4

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1553
    :pswitch_3d
    add-int/lit8 v11, v11, 0x1

    .line 1554
    aput-object v55, v9, v11

    .line 1555
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    aget-wide v6, v6, v21

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1558
    :pswitch_3e
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v105

    invoke-static {v0, v6, v1}, Lorg/mozilla/javascript/ScriptRuntime;->name(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1561
    :pswitch_3f
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v7, v14, v7

    move-object/from16 v0, v105

    move-object/from16 v1, p0

    invoke-static {v6, v0, v1, v7}, Lorg/mozilla/javascript/ScriptRuntime;->nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    .line 1563
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1566
    :pswitch_40
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v6, 0x1

    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v21, v14, v6

    :pswitch_41
    move-object/from16 v25, p1

    move-object/from16 v26, v9

    move-object/from16 v27, v10

    move/from16 v28, v11

    move/from16 v32, v21

    .line 1569
    invoke-static/range {v25 .. v32}, Lorg/mozilla/javascript/Interpreter;->doSetConstVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v11

    .line 1571
    goto/16 :goto_4

    .line 1573
    :pswitch_42
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v6, 0x1

    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v21, v14, v6

    :pswitch_43
    move-object/from16 v25, p1

    move-object/from16 v26, v9

    move-object/from16 v27, v10

    move/from16 v28, v11

    move/from16 v32, v21

    .line 1576
    invoke-static/range {v25 .. v32}, Lorg/mozilla/javascript/Interpreter;->doSetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v11

    .line 1578
    goto/16 :goto_4

    .line 1580
    :pswitch_44
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v6, 0x1

    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v21, v14, v6

    :pswitch_45
    move-object/from16 v35, p1

    move-object/from16 v36, v9

    move-object/from16 v37, v10

    move/from16 v38, v11

    move-object/from16 v39, v29

    move-object/from16 v40, v30

    move/from16 v41, v21

    .line 1583
    invoke-static/range {v35 .. v41}, Lorg/mozilla/javascript/Interpreter;->doGetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[DI)I

    move-result v11

    .line 1584
    goto/16 :goto_4

    :pswitch_46
    move-object/from16 v35, p0

    move-object/from16 v36, p1

    move-object/from16 v37, v9

    move-object/from16 v38, v10

    move/from16 v39, v11

    move-object/from16 v40, v29

    move-object/from16 v41, v30

    move-object/from16 v42, v31

    move/from16 v43, v21

    .line 1586
    invoke-static/range {v35 .. v43}, Lorg/mozilla/javascript/Interpreter;->doVarIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v11

    .line 1588
    goto/16 :goto_4

    .line 1591
    :pswitch_47
    add-int/lit8 v11, v11, 0x1

    .line 1592
    aput-object v55, v9, v11

    .line 1593
    const-wide/16 v6, 0x0

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1596
    :pswitch_48
    add-int/lit8 v11, v11, 0x1

    .line 1597
    aput-object v55, v9, v11

    .line 1598
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1601
    :pswitch_49
    add-int/lit8 v11, v11, 0x1

    const/4 v6, 0x0

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1604
    :pswitch_4a
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1607
    :pswitch_4b
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1610
    :pswitch_4c
    add-int/lit8 v11, v11, 0x1

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1613
    :pswitch_4d
    add-int/lit8 v11, v11, 0x1

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1616
    :pswitch_4e
    add-int/lit8 v11, v11, 0x1

    aput-object v107, v9, v11

    goto/16 :goto_4

    .line 1619
    :pswitch_4f
    aget-object v86, v9, v11

    .line 1620
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_37

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1621
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_37
    add-int/lit8 v11, v11, -0x1

    .line 1622
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, p0

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/ScriptRuntime;->enterWith(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_4

    .line 1626
    :pswitch_50
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->leaveWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_4

    .line 1632
    :pswitch_51
    add-int/lit8 v11, v11, -0x1

    .line 1633
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1635
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    move-object/from16 v0, p1

    iget v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v6, v6, v7

    if-eqz v6, :cond_38

    const/16 v61, 0x1

    .line 1636
    .local v61, "afterFirstScope":Z
    :goto_14
    add-int/lit8 v6, v11, 0x1

    aget-object v63, v9, v6

    check-cast v63, Ljava/lang/Throwable;

    .line 1638
    .local v63, "caughtException":Ljava/lang/Throwable;
    if-nez v61, :cond_39

    .line 1639
    const/16 v81, 0x0

    .line 1643
    .local v81, "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    :goto_15
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v63

    move-object/from16 v1, v81

    move-object/from16 v2, v105

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->newCatchScope(Ljava/lang/Throwable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v21

    .line 1646
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1635
    .end local v61    # "afterFirstScope":Z
    .end local v63    # "caughtException":Ljava/lang/Throwable;
    .end local v81    # "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    :cond_38
    const/16 v61, 0x0

    goto :goto_14

    .line 1641
    .restart local v61    # "afterFirstScope":Z
    .restart local v63    # "caughtException":Ljava/lang/Throwable;
    :cond_39
    aget-object v81, v9, v21

    check-cast v81, Lorg/mozilla/javascript/Scriptable;

    .restart local v81    # "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    goto :goto_15

    .line 1652
    .end local v61    # "afterFirstScope":Z
    .end local v63    # "caughtException":Ljava/lang/Throwable;
    .end local v81    # "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    :pswitch_52
    aget-object v86, v9, v11

    .line 1653
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_3a

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1654
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_3a
    add-int/lit8 v11, v11, -0x1

    .line 1655
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1656
    const/16 v6, 0x3a

    if-ne v8, v6, :cond_3b

    const/16 v68, 0x0

    .line 1661
    .local v68, "enumType":I
    :goto_16
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    move-object/from16 v1, p0

    move/from16 v2, v68

    invoke-static {v0, v1, v6, v2}, Lorg/mozilla/javascript/ScriptRuntime;->enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v21

    goto/16 :goto_4

    .line 1656
    .end local v68    # "enumType":I
    :cond_3b
    const/16 v6, 0x3b

    if-ne v8, v6, :cond_3c

    const/16 v68, 0x1

    goto :goto_16

    :cond_3c
    const/16 v68, 0x2

    goto :goto_16

    .line 1666
    :pswitch_53
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1667
    aget-object v108, v9, v21

    .line 1668
    .local v108, "val":Ljava/lang/Object;
    add-int/lit8 v11, v11, 0x1

    .line 1669
    const/16 v6, 0x3d

    if-ne v8, v6, :cond_3d

    invoke-static/range {v108 .. v108}, Lorg/mozilla/javascript/ScriptRuntime;->enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v6

    :goto_17
    aput-object v6, v9, v11

    goto/16 :goto_4

    :cond_3d
    move-object/from16 v0, v108

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->enumId(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_17

    .line 1676
    .end local v108    # "val":Ljava/lang/Object;
    :pswitch_54
    aget-object v91, v9, v11

    .line 1677
    .restart local v91    # "obj":Ljava/lang/Object;
    move-object/from16 v0, v91

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_3e

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v91

    .line 1678
    .end local v91    # "obj":Ljava/lang/Object;
    :cond_3e
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v91

    move-object/from16 v1, v105

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1684
    :pswitch_55
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v9, v10, v11, v1}, Lorg/mozilla/javascript/Interpreter;->doRefMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I

    move-result v11

    .line 1685
    goto/16 :goto_4

    .line 1689
    :pswitch_56
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v9, v10, v11, v1}, Lorg/mozilla/javascript/Interpreter;->doRefNsMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I

    move-result v11

    .line 1690
    goto/16 :goto_4

    .line 1694
    :pswitch_57
    aget-object v88, v9, v11

    .line 1695
    .local v88, "name":Ljava/lang/Object;
    move-object/from16 v0, v88

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_3f

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v88

    .line 1696
    .end local v88    # "name":Ljava/lang/Object;
    :cond_3f
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v88

    move-object/from16 v1, p0

    move/from16 v2, v21

    invoke-static {v0, v1, v6, v2}, Lorg/mozilla/javascript/ScriptRuntime;->nameRef(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    :pswitch_58
    move-object/from16 v35, p0

    move-object/from16 v36, p1

    move-object/from16 v37, v9

    move-object/from16 v38, v10

    move/from16 v39, v11

    move/from16 v40, v21

    .line 1702
    invoke-static/range {v35 .. v40}, Lorg/mozilla/javascript/Interpreter;->doRefNsName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DII)I

    move-result v11

    .line 1703
    goto/16 :goto_4

    .line 1706
    :pswitch_59
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1707
    aget-object v6, v9, v21

    check-cast v6, Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_4

    .line 1710
    :pswitch_5a
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v21, v21, v6

    .line 1711
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    aput-object v6, v9, v21

    goto/16 :goto_4

    .line 1714
    :pswitch_5b
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v6, v7, v1}, Lorg/mozilla/javascript/InterpretedFunction;->createFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1719
    :pswitch_5c
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v6, v7, v1}, Lorg/mozilla/javascript/Interpreter;->initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)V

    goto/16 :goto_4

    .line 1722
    :pswitch_5d
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsRegExpLiterals:[Ljava/lang/Object;

    aget-object v98, v6, v21

    .line 1723
    .local v98, "re":Ljava/lang/Object;
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v98

    invoke-static {v0, v6, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1727
    .end local v98    # "re":Ljava/lang/Object;
    :pswitch_5e
    add-int/lit8 v11, v11, 0x1

    .line 1728
    move/from16 v0, v21

    new-array v6, v0, [I

    aput-object v6, v9, v11

    .line 1729
    add-int/lit8 v11, v11, 0x1

    .line 1730
    move/from16 v0, v21

    new-array v6, v0, [Ljava/lang/Object;

    aput-object v6, v9, v11

    .line 1731
    const-wide/16 v6, 0x0

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1734
    :pswitch_5f
    aget-object v110, v9, v11

    .line 1735
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_40

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v110

    .line 1736
    .end local v110    # "value":Ljava/lang/Object;
    :cond_40
    add-int/lit8 v11, v11, -0x1

    .line 1737
    aget-wide v6, v10, v11

    double-to-int v0, v6

    move/from16 v76, v0

    .line 1738
    .local v76, "i":I
    aget-object v6, v9, v11

    check-cast v6, [Ljava/lang/Object;

    check-cast v6, [Ljava/lang/Object;

    aput-object v110, v6, v76

    .line 1739
    add-int/lit8 v6, v76, 0x1

    int-to-double v6, v6

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1743
    .end local v76    # "i":I
    :pswitch_60
    aget-object v110, v9, v11

    .line 1744
    .restart local v110    # "value":Ljava/lang/Object;
    add-int/lit8 v11, v11, -0x1

    .line 1745
    aget-wide v6, v10, v11

    double-to-int v0, v6

    move/from16 v76, v0

    .line 1746
    .restart local v76    # "i":I
    aget-object v6, v9, v11

    check-cast v6, [Ljava/lang/Object;

    check-cast v6, [Ljava/lang/Object;

    aput-object v110, v6, v76

    .line 1747
    add-int/lit8 v6, v11, -0x1

    aget-object v6, v9, v6

    check-cast v6, [I

    check-cast v6, [I

    const/4 v7, -0x1

    aput v7, v6, v76

    .line 1748
    add-int/lit8 v6, v76, 0x1

    int-to-double v6, v6

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1752
    .end local v76    # "i":I
    .end local v110    # "value":Ljava/lang/Object;
    :pswitch_61
    aget-object v110, v9, v11

    .line 1753
    .restart local v110    # "value":Ljava/lang/Object;
    add-int/lit8 v11, v11, -0x1

    .line 1754
    aget-wide v6, v10, v11

    double-to-int v0, v6

    move/from16 v76, v0

    .line 1755
    .restart local v76    # "i":I
    aget-object v6, v9, v11

    check-cast v6, [Ljava/lang/Object;

    check-cast v6, [Ljava/lang/Object;

    aput-object v110, v6, v76

    .line 1756
    add-int/lit8 v6, v11, -0x1

    aget-object v6, v9, v6

    check-cast v6, [I

    check-cast v6, [I

    const/4 v7, 0x1

    aput v7, v6, v76

    .line 1757
    add-int/lit8 v6, v76, 0x1

    int-to-double v6, v6

    aput-wide v6, v10, v11

    goto/16 :goto_4

    .line 1763
    .end local v76    # "i":I
    .end local v110    # "value":Ljava/lang/Object;
    :pswitch_62
    aget-object v6, v9, v11

    check-cast v6, [Ljava/lang/Object;

    move-object v0, v6

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v65, v0

    .line 1764
    .local v65, "data":[Ljava/lang/Object;
    add-int/lit8 v11, v11, -0x1

    .line 1765
    aget-object v6, v9, v11

    check-cast v6, [I

    move-object v0, v6

    check-cast v0, [I

    move-object/from16 v75, v0

    .line 1767
    .local v75, "getterSetters":[I
    const/16 v6, 0x42

    if-ne v8, v6, :cond_41

    .line 1768
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->literalIds:[Ljava/lang/Object;

    aget-object v6, v6, v21

    check-cast v6, [Ljava/lang/Object;

    move-object v0, v6

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v78, v0

    .line 1769
    .local v78, "ids":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v78

    move-object/from16 v1, v65

    move-object/from16 v2, v75

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v108

    .line 1779
    .end local v78    # "ids":[Ljava/lang/Object;
    .local v108, "val":Lorg/mozilla/javascript/Scriptable;
    :goto_18
    aput-object v108, v9, v11

    goto/16 :goto_4

    .line 1772
    .end local v108    # "val":Lorg/mozilla/javascript/Scriptable;
    :cond_41
    const/16 v102, 0x0

    .line 1773
    .local v102, "skipIndexces":[I
    const/16 v6, -0x1f

    if-ne v8, v6, :cond_42

    .line 1774
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->literalIds:[Ljava/lang/Object;

    aget-object v6, v6, v21

    check-cast v6, [I

    move-object v0, v6

    check-cast v0, [I

    move-object/from16 v102, v0

    .line 1776
    :cond_42
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v65

    move-object/from16 v1, v102

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->newArrayLiteral([Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v108

    .restart local v108    # "val":Lorg/mozilla/javascript/Scriptable;
    goto :goto_18

    .line 1783
    .end local v65    # "data":[Ljava/lang/Object;
    .end local v75    # "getterSetters":[I
    .end local v102    # "skipIndexces":[I
    .end local v108    # "val":Lorg/mozilla/javascript/Scriptable;
    :pswitch_63
    aget-object v86, v9, v11

    .line 1784
    .restart local v86    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v86

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_43

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v86

    .line 1785
    .end local v86    # "lhs":Ljava/lang/Object;
    :cond_43
    add-int/lit8 v11, v11, -0x1

    .line 1786
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v86

    invoke-static {v0, v6}, Lorg/mozilla/javascript/ScriptRuntime;->enterDotQuery(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_4

    .line 1790
    :pswitch_64
    move-object/from16 v0, p1

    invoke-static {v0, v11}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v109

    .line 1791
    .restart local v109    # "valBln":Z
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move/from16 v0, v109

    invoke-static {v0, v6}, Lorg/mozilla/javascript/ScriptRuntime;->updateDotQuery(ZLorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v111

    .line 1792
    .local v111, "x":Ljava/lang/Object;
    if-eqz v111, :cond_44

    .line 1793
    aput-object v111, v9, v11

    .line 1794
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->leaveDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    move-object/from16 v0, p1

    iput-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 1795
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1799
    :cond_44
    add-int/lit8 v11, v11, -0x1

    .line 1800
    goto/16 :goto_f

    .line 1803
    .end local v109    # "valBln":Z
    .end local v111    # "x":Ljava/lang/Object;
    :pswitch_65
    aget-object v110, v9, v11

    .line 1804
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_45

    aget-wide v6, v10, v11

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v110

    .line 1805
    .end local v110    # "value":Ljava/lang/Object;
    :cond_45
    move-object/from16 v0, v110

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setDefaultNamespace(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1809
    :pswitch_66
    aget-object v110, v9, v11

    .line 1810
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-eq v0, v1, :cond_4

    .line 1811
    move-object/from16 v0, v110

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeAttributeValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1816
    .end local v110    # "value":Ljava/lang/Object;
    :pswitch_67
    aget-object v110, v9, v11

    .line 1817
    .restart local v110    # "value":Ljava/lang/Object;
    move-object/from16 v0, v110

    move-object/from16 v1, v55

    if-eq v0, v1, :cond_4

    .line 1818
    move-object/from16 v0, v110

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeTextValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v11

    goto/16 :goto_4

    .line 1823
    .end local v110    # "value":Ljava/lang/Object;
    :pswitch_68
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v6, :cond_4

    .line 1824
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    move-object/from16 v0, p0

    invoke-interface {v6, v0}, Lorg/mozilla/javascript/debug/DebugFrame;->onDebuggerStatement(Lorg/mozilla/javascript/Context;)V

    goto/16 :goto_4

    .line 1828
    :pswitch_69
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    .line 1829
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v6, :cond_46

    .line 1830
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v87

    .line 1831
    .local v87, "line":I
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    move-object/from16 v0, p0

    move/from16 v1, v87

    invoke-interface {v6, v0, v1}, Lorg/mozilla/javascript/debug/DebugFrame;->onLineChange(Lorg/mozilla/javascript/Context;I)V

    .line 1833
    .end local v87    # "line":I
    :cond_46
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1836
    :pswitch_6a
    const/16 v21, 0x0

    .line 1837
    goto/16 :goto_4

    .line 1839
    :pswitch_6b
    const/16 v21, 0x1

    .line 1840
    goto/16 :goto_4

    .line 1842
    :pswitch_6c
    const/16 v21, 0x2

    .line 1843
    goto/16 :goto_4

    .line 1845
    :pswitch_6d
    const/16 v21, 0x3

    .line 1846
    goto/16 :goto_4

    .line 1848
    :pswitch_6e
    const/16 v21, 0x4

    .line 1849
    goto/16 :goto_4

    .line 1851
    :pswitch_6f
    const/16 v21, 0x5

    .line 1852
    goto/16 :goto_4

    .line 1854
    :pswitch_70
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v6, v14, v6

    and-int/lit16 v0, v6, 0xff

    move/from16 v21, v0

    .line 1855
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1858
    :pswitch_71
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v21

    .line 1859
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1862
    :pswitch_72
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getInt([BI)I

    move-result v21

    .line 1863
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x4

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1866
    :pswitch_73
    const/4 v6, 0x0

    aget-object v105, v106, v6

    .line 1867
    goto/16 :goto_4

    .line 1869
    :pswitch_74
    const/4 v6, 0x1

    aget-object v105, v106, v6

    .line 1870
    goto/16 :goto_4

    .line 1872
    :pswitch_75
    const/4 v6, 0x2

    aget-object v105, v106, v6

    .line 1873
    goto/16 :goto_4

    .line 1875
    :pswitch_76
    const/4 v6, 0x3

    aget-object v105, v106, v6

    .line 1876
    goto/16 :goto_4

    .line 1878
    :pswitch_77
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v6, v14, v6

    and-int/lit16 v6, v6, 0xff

    aget-object v105, v106, v6

    .line 1879
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1882
    :pswitch_78
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v6

    aget-object v105, v106, v6

    .line 1883
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1886
    :pswitch_79
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v14, v6}, Lorg/mozilla/javascript/Interpreter;->getInt([BI)I

    move-result v6

    aget-object v105, v106, v6

    .line 1887
    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x4

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_4

    .line 1907
    .restart local v92    # "offset":I
    :cond_47
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, v6, Lorg/mozilla/javascript/InterpreterData;->longJumps:Lorg/mozilla/javascript/UintMap;

    move-object/from16 v0, p1

    iget v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/UintMap;->getExistingInt(I)I

    move-result v6

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_10

    .end local v92    # "offset":I
    .restart local v80    # "interpreterResult":Ljava/lang/Object;
    :cond_48
    move-object/from16 v6, v112

    .line 2065
    .end local v8    # "op":I
    .end local v9    # "stack":[Ljava/lang/Object;
    .end local v10    # "sDbl":[D
    .end local v11    # "stackTop":I
    .end local v14    # "iCode":[B
    .end local v29    # "vars":[Ljava/lang/Object;
    .end local v30    # "varDbls":[D
    .end local v31    # "varAttributes":[I
    .end local v80    # "interpreterResult":Ljava/lang/Object;
    .end local v106    # "strings":[Ljava/lang/String;
    :cond_49
    :goto_19
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    if-eqz v7, :cond_5b

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v7

    if-eqz v7, :cond_5b

    .line 2068
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ObjArray;->pop()Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 2077
    :goto_1a
    if-eqz v6, :cond_5d

    .line 2078
    instance-of v7, v6, Ljava/lang/RuntimeException;

    if-eqz v7, :cond_5c

    .line 2079
    check-cast v6, Ljava/lang/RuntimeException;

    throw v6

    .line 1939
    .restart local v69    # "ex":Ljava/lang/Throwable;
    :cond_4a
    move-object/from16 p2, v69

    .local p2, "throwable":Ljava/lang/Throwable;
    goto/16 :goto_8

    .line 1960
    .end local v69    # "ex":Ljava/lang/Throwable;
    .end local p2    # "throwable":Ljava/lang/Throwable;
    .restart local v57    # "EX_CATCH_STATE":I
    .restart local v58    # "EX_FINALLY_STATE":I
    .restart local v59    # "EX_NO_JS_STATE":I
    .restart local v64    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_4b
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/JavaScriptException;

    if-eqz v6, :cond_4c

    .line 1961
    const/16 v70, 0x2

    .restart local v70    # "exState":I
    goto/16 :goto_9

    .line 1962
    .end local v70    # "exState":I
    :cond_4c
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/EcmaError;

    if-eqz v6, :cond_4d

    .line 1964
    const/16 v70, 0x2

    .restart local v70    # "exState":I
    goto/16 :goto_9

    .line 1965
    .end local v70    # "exState":I
    :cond_4d
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/EvaluatorException;

    if-eqz v6, :cond_4e

    .line 1966
    const/16 v70, 0x2

    .restart local v70    # "exState":I
    goto/16 :goto_9

    .line 1967
    .end local v70    # "exState":I
    :cond_4e
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/ContinuationPending;

    if-eqz v6, :cond_4f

    .line 1968
    const/16 v70, 0x0

    .restart local v70    # "exState":I
    goto/16 :goto_9

    .line 1969
    .end local v70    # "exState":I
    :cond_4f
    move-object/from16 v0, p2

    instance-of v6, v0, Ljava/lang/RuntimeException;

    if-eqz v6, :cond_51

    .line 1970
    const/16 v6, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v6

    if-eqz v6, :cond_50

    const/16 v70, 0x2

    .restart local v70    # "exState":I
    :goto_1b
    goto/16 :goto_9

    .end local v70    # "exState":I
    :cond_50
    const/16 v70, 0x1

    goto :goto_1b

    .line 1973
    :cond_51
    move-object/from16 v0, p2

    instance-of v6, v0, Ljava/lang/Error;

    if-eqz v6, :cond_53

    .line 1974
    const/16 v6, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v6

    if-eqz v6, :cond_52

    const/16 v70, 0x2

    .restart local v70    # "exState":I
    :goto_1c
    goto/16 :goto_9

    .end local v70    # "exState":I
    :cond_52
    const/16 v70, 0x0

    goto :goto_1c

    .line 1977
    :cond_53
    move-object/from16 v0, p2

    instance-of v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    if-eqz v6, :cond_54

    .line 1979
    const/16 v70, 0x1

    .restart local v70    # "exState":I
    move-object/from16 v64, p2

    .line 1980
    check-cast v64, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    goto/16 :goto_9

    .line 1982
    .end local v70    # "exState":I
    :cond_54
    const/16 v6, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v6

    if-eqz v6, :cond_55

    const/16 v70, 0x2

    .restart local v70    # "exState":I
    :goto_1d
    goto/16 :goto_9

    .end local v70    # "exState":I
    :cond_55
    const/16 v70, 0x1

    goto :goto_1d

    .line 1990
    .restart local v70    # "exState":I
    :catch_1
    move-exception v69

    .line 1991
    .local v69, "ex":Ljava/lang/RuntimeException;
    move-object/from16 p2, v69

    .line 1992
    .local p2, "throwable":Ljava/lang/RuntimeException;
    const/16 v70, 0x1

    move-object/from16 v6, p2

    .line 1999
    goto/16 :goto_a

    .line 1993
    .end local v69    # "ex":Ljava/lang/RuntimeException;
    .end local p2    # "throwable":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v69

    .line 1996
    .local v69, "ex":Ljava/lang/Error;
    move-object/from16 p2, v69

    .line 1997
    .local p2, "throwable":Ljava/lang/Error;
    const/16 v64, 0x0

    .line 1998
    const/16 v70, 0x0

    move-object/from16 v6, p2

    goto/16 :goto_a

    .line 2008
    .end local v69    # "ex":Ljava/lang/Error;
    .end local p2    # "throwable":Ljava/lang/Error;
    .restart local v100    # "rex":Ljava/lang/RuntimeException;
    :catch_3
    move-exception v69

    .line 2011
    .local v69, "ex":Ljava/lang/Throwable;
    move-object/from16 p2, v69

    .line 2012
    .local p2, "throwable":Ljava/lang/Throwable;
    const/16 v64, 0x0

    .line 2013
    const/16 v70, 0x0

    move-object/from16 v6, p2

    goto/16 :goto_b

    .line 2019
    .end local v69    # "ex":Ljava/lang/Throwable;
    .end local v100    # "rex":Ljava/lang/RuntimeException;
    .end local p2    # "throwable":Ljava/lang/Throwable;
    :cond_56
    const/16 v93, 0x0

    goto/16 :goto_c

    .line 2031
    :cond_57
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2033
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 p1, v0

    .line 2034
    if-nez p1, :cond_59

    .line 2044
    if-eqz v64, :cond_49

    .line 2045
    move-object/from16 v0, v64

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v7, :cond_58

    .line 2047
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2049
    :cond_58
    move-object/from16 v0, v64

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v7, :cond_5a

    .line 2051
    const/16 v21, -0x1

    move-object/from16 v112, v6

    .line 2052
    goto/16 :goto_2

    .line 2035
    :cond_59
    if-eqz v64, :cond_d

    move-object/from16 v0, v64

    iget-object v7, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 v0, p1

    if-ne v7, v0, :cond_d

    .line 2038
    const/16 v21, -0x1

    move-object/from16 v112, v6

    .line 2039
    goto/16 :goto_2

    .line 2055
    :cond_5a
    move-object/from16 v0, v64

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    move-object/from16 v80, v0

    .line 2056
    .restart local v80    # "interpreterResult":Ljava/lang/Object;
    move-object/from16 v0, v64

    iget-wide v0, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D

    move-wide/from16 v82, v0

    .line 2057
    const/16 p2, 0x0

    .local p2, "throwable":Ljava/lang/Object;
    move-object/from16 v6, p2

    goto/16 :goto_19

    .line 2072
    .end local v57    # "EX_CATCH_STATE":I
    .end local v58    # "EX_FINALLY_STATE":I
    .end local v59    # "EX_NO_JS_STATE":I
    .end local v64    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .end local v70    # "exState":I
    .end local v80    # "interpreterResult":Ljava/lang/Object;
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_5b
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 2074
    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    goto/16 :goto_1a

    .line 2082
    :cond_5c
    check-cast v6, Ljava/lang/Error;

    throw v6

    .line 2086
    :cond_5d
    move-object/from16 v0, v80

    move-object/from16 v1, v55

    if-ne v0, v1, :cond_a

    invoke-static/range {v82 .. v83}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v80

    goto/16 :goto_7

    .line 1933
    .restart local p2    # "throwable":Ljava/lang/Object;
    :catch_4
    move-exception v69

    move-object/from16 v112, p2

    goto/16 :goto_5

    .end local p2    # "throwable":Ljava/lang/Object;
    .restart local v8    # "op":I
    .restart local v9    # "stack":[Ljava/lang/Object;
    .restart local v10    # "sDbl":[D
    .restart local v14    # "iCode":[B
    .restart local v29    # "vars":[Ljava/lang/Object;
    .restart local v30    # "varDbls":[D
    .restart local v31    # "varAttributes":[I
    .restart local v104    # "stackTop":I
    .restart local v106    # "strings":[Ljava/lang/String;
    :cond_5e
    move/from16 v11, v104

    .end local v104    # "stackTop":I
    .restart local v11    # "stackTop":I
    goto/16 :goto_f

    .end local v8    # "op":I
    .end local v9    # "stack":[Ljava/lang/Object;
    .end local v10    # "sDbl":[D
    .end local v11    # "stackTop":I
    .end local v14    # "iCode":[B
    .end local v29    # "vars":[Ljava/lang/Object;
    .end local v30    # "varDbls":[D
    .end local v31    # "varAttributes":[I
    .end local v106    # "strings":[Ljava/lang/String;
    .restart local v57    # "EX_CATCH_STATE":I
    .restart local v58    # "EX_FINALLY_STATE":I
    .restart local v59    # "EX_NO_JS_STATE":I
    .restart local v64    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .restart local v70    # "exState":I
    :cond_5f
    move-object/from16 v6, p2

    goto/16 :goto_a

    .line 974
    nop

    :pswitch_data_0
    .packed-switch -0x40
        :pswitch_68
        :pswitch_4
        :pswitch_1
        :pswitch_40
        :pswitch_0
        :pswitch_22
        :pswitch_61
        :pswitch_60
        :pswitch_30
        :pswitch_36
        :pswitch_64
        :pswitch_63
        :pswitch_48
        :pswitch_47
        :pswitch_4e
        :pswitch_42
        :pswitch_44
        :pswitch_79
        :pswitch_78
        :pswitch_77
        :pswitch_76
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_62
        :pswitch_5f
        :pswitch_5e
        :pswitch_3c
        :pswitch_3b
        :pswitch_69
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_18
        :pswitch_35
        :pswitch_5c
        :pswitch_5b
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_39
        :pswitch_5a
        :pswitch_59
        :pswitch_2e
        :pswitch_2a
        :pswitch_27
        :pswitch_3f
        :pswitch_46
        :pswitch_d
        :pswitch_13
        :pswitch_12
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_23
        :pswitch_0
        :pswitch_4f
        :pswitch_50
        :pswitch_17
        :pswitch_e
        :pswitch_c
        :pswitch_b
        :pswitch_21
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_1a
        :pswitch_1a
        :pswitch_1b
        :pswitch_1d
        :pswitch_1e
        :pswitch_1e
        :pswitch_1e
        :pswitch_1e
        :pswitch_1f
        :pswitch_19
        :pswitch_1c
        :pswitch_1c
        :pswitch_37
        :pswitch_23
        :pswitch_38
        :pswitch_25
        :pswitch_24
        :pswitch_26
        :pswitch_28
        :pswitch_29
        :pswitch_36
        :pswitch_3e
        :pswitch_3d
        :pswitch_3a
        :pswitch_49
        :pswitch_4a
        :pswitch_4c
        :pswitch_4d
        :pswitch_a
        :pswitch_a
        :pswitch_5d
        :pswitch_20
        :pswitch_5
        :pswitch_6
        :pswitch_8
        :pswitch_8
        :pswitch_2f
        :pswitch_45
        :pswitch_43
        :pswitch_51
        :pswitch_52
        :pswitch_52
        :pswitch_52
        :pswitch_53
        :pswitch_53
        :pswitch_4b
        :pswitch_2
        :pswitch_62
        :pswitch_62
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_36
        :pswitch_54
        :pswitch_3
        :pswitch_21
        :pswitch_65
        :pswitch_66
        :pswitch_67
        :pswitch_55
        :pswitch_56
        :pswitch_57
        :pswitch_58
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
        :pswitch_41
    .end packed-switch
.end method

.method private static isFrameEnterExitRequired(Lorg/mozilla/javascript/Interpreter$CallFrame;)Z
    .locals 1
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    .line 2862
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static processThrowable(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Interpreter$CallFrame;IZ)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "throwable"    # Ljava/lang/Object;
    .param p2, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p3, "indexReg"    # I
    .param p4, "instructionCounting"    # Z

    .prologue
    .line 2538
    if-ltz p3, :cond_2

    .line 2542
    iget-boolean v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-eqz v9, :cond_0

    .line 2544
    invoke-virtual {p2}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p2

    .line 2547
    :cond_0
    iget-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v7, v9, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 2549
    .local v7, "table":[I
    add-int/lit8 v9, p3, 0x2

    aget v9, v7, v9

    iput v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2550
    if-eqz p4, :cond_1

    .line 2551
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    iput v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    .line 2554
    :cond_1
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    iput v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2555
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int/lit8 v10, p3, 0x5

    aget v10, v7, v10

    add-int v6, v9, v10

    .line 2558
    .local v6, "scopeLocal":I
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int/lit8 v10, p3, 0x4

    aget v10, v7, v10

    add-int v3, v9, v10

    .line 2561
    .local v3, "exLocal":I
    iget-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v9, v9, v6

    check-cast v9, Lorg/mozilla/javascript/Scriptable;

    iput-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 2562
    iget-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aput-object p1, v9, v3

    .line 2564
    const/4 p1, 0x0

    .line 2623
    .end local v3    # "exLocal":I
    .end local v6    # "scopeLocal":I
    .end local v7    # "table":[I
    :goto_0
    iput-object p1, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    .line 2624
    return-object p2

    :cond_2
    move-object v0, p1

    .line 2567
    check-cast v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    .line 2570
    .local v0, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    const/4 p1, 0x0

    .line 2572
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eq v9, p2, :cond_3

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2577
    :cond_3
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-nez v9, :cond_4

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2581
    :cond_4
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget v9, v9, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    add-int/lit8 v5, v9, 0x1

    .line 2582
    .local v5, "rewindCount":I
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v9, :cond_5

    .line 2583
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget v9, v9, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    sub-int/2addr v5, v9

    .line 2586
    :cond_5
    const/4 v1, 0x0

    .line 2587
    .local v1, "enterCount":I
    const/4 v2, 0x0

    .line 2589
    .local v2, "enterFrames":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v8, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2590
    .local v8, "x":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v5, :cond_9

    .line 2591
    iget-boolean v9, v8, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v9, :cond_6

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2592
    :cond_6
    invoke-static {v8}, Lorg/mozilla/javascript/Interpreter;->isFrameEnterExitRequired(Lorg/mozilla/javascript/Interpreter$CallFrame;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 2593
    if-nez v2, :cond_7

    .line 2597
    sub-int v9, v5, v4

    new-array v2, v9, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2600
    :cond_7
    aput-object v8, v2, v1

    .line 2601
    add-int/lit8 v1, v1, 0x1

    .line 2603
    :cond_8
    iget-object v8, v8, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2590
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2606
    :cond_9
    :goto_2
    if-eqz v1, :cond_a

    .line 2610
    add-int/lit8 v1, v1, -0x1

    .line 2611
    aget-object v8, v2, v1

    .line 2612
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    const/4 v10, 0x1

    invoke-static {p0, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    goto :goto_2

    .line 2619
    :cond_a
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    invoke-virtual {v9}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p2

    .line 2620
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    iget-wide v10, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D

    invoke-static {p2, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->setCallResult(Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;D)V

    goto :goto_0
.end method

.method public static restartContinuation(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "c"    # Lorg/mozilla/javascript/NativeContinuation;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 855
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->hasTopCall(Lorg/mozilla/javascript/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 856
    invoke-static {p0, p1, p2, v4, p3}, Lorg/mozilla/javascript/ScriptRuntime;->doTopCall(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 875
    :cond_0
    :goto_0
    return-object v0

    .line 860
    :cond_1
    array-length v3, p3

    if-nez v3, :cond_2

    .line 861
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 866
    .local v0, "arg":Ljava/lang/Object;
    :goto_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeContinuation;->getImplementation()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 867
    .local v1, "capturedFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    if-eqz v1, :cond_0

    .line 872
    new-instance v2, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    invoke-direct {v2, p0, v4}, Lorg/mozilla/javascript/Interpreter$ContinuationJump;-><init>(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 874
    .local v2, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    iput-object v0, v2, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 875
    invoke-static {p1, v4, v2}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 863
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v1    # "capturedFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v2    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_2
    const/4 v3, 0x0

    aget-object v0, p3, v3

    .restart local v0    # "arg":Ljava/lang/Object;
    goto :goto_1
.end method

.method public static resumeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "operation"    # I
    .param p3, "savedState"    # Ljava/lang/Object;
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 834
    move-object v1, p3

    check-cast v1, Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 835
    .local v1, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v2, Lorg/mozilla/javascript/Interpreter$GeneratorState;

    invoke-direct {v2, p2, p4}, Lorg/mozilla/javascript/Interpreter$GeneratorState;-><init>(ILjava/lang/Object;)V

    .line 836
    .local v2, "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    const/4 v4, 0x2

    if-ne p2, v4, :cond_2

    .line 838
    :try_start_0
    invoke-static {p0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 849
    :cond_0
    :goto_0
    return-object v3

    .line 839
    :catch_0
    move-exception v0

    .line 841
    .local v0, "e":Ljava/lang/RuntimeException;
    if-eq v0, p4, :cond_1

    .line 842
    throw v0

    .line 844
    :cond_1
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 846
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_2
    invoke-static {p0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 847
    .local v3, "result":Ljava/lang/Object;
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    if-eqz v4, :cond_0

    .line 848
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    throw v4
.end method

.method private static setCallResult(Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;D)V
    .locals 2
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "callResult"    # Ljava/lang/Object;
    .param p2, "callResultDbl"    # D

    .prologue
    .line 2956
    iget v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v1, 0x26

    if-ne v0, v1, :cond_1

    .line 2957
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-object p1, v0, v1

    .line 2958
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-wide p2, v0, v1

    .line 2969
    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 2970
    return-void

    .line 2959
    :cond_1
    iget v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_2

    .line 2963
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 2964
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-object p1, v0, v1

    goto :goto_0

    .line 2967
    :cond_2
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_0
.end method

.method private static stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z
    .locals 8
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "i"    # I

    .prologue
    const-wide/16 v6, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 3050
    iget-object v5, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v2, v5, p1

    .line 3051
    .local v2, "x":Ljava/lang/Object;
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v2, v5, :cond_1

    .line 3066
    .end local v2    # "x":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v3

    .line 3053
    .restart local v2    # "x":Ljava/lang/Object;
    :cond_1
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-ne v2, v5, :cond_2

    move v3, v4

    .line 3054
    goto :goto_0

    .line 3055
    :cond_2
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v5, :cond_4

    .line 3056
    iget-object v5, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v0, v5, p1

    .line 3057
    .local v0, "d":D
    cmpl-double v5, v0, v0

    if-nez v5, :cond_3

    cmpl-double v5, v0, v6

    if-nez v5, :cond_0

    :cond_3
    move v3, v4

    goto :goto_0

    .line 3058
    .end local v0    # "d":D
    :cond_4
    if-eqz v2, :cond_5

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v2, v5, :cond_6

    :cond_5
    move v3, v4

    .line 3059
    goto :goto_0

    .line 3060
    :cond_6
    instance-of v5, v2, Ljava/lang/Number;

    if-eqz v5, :cond_8

    .line 3061
    check-cast v2, Ljava/lang/Number;

    .end local v2    # "x":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 3062
    .restart local v0    # "d":D
    cmpl-double v5, v0, v0

    if-nez v5, :cond_7

    cmpl-double v5, v0, v6

    if-nez v5, :cond_0

    :cond_7
    move v3, v4

    goto :goto_0

    .line 3063
    .end local v0    # "d":D
    .restart local v2    # "x":Ljava/lang/Object;
    :cond_8
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_9

    .line 3064
    check-cast v2, Ljava/lang/Boolean;

    .end local v2    # "x":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_0

    .line 3066
    .restart local v2    # "x":Ljava/lang/Object;
    :cond_9
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_0
.end method

.method private static stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D
    .locals 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "i"    # I

    .prologue
    .line 3040
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v1, p1

    .line 3041
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v0, v1, :cond_0

    .line 3042
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 3044
    :goto_0
    return-wide v2

    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v2, v1, p1

    goto :goto_0
.end method

.method private static stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I
    .locals 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "i"    # I

    .prologue
    .line 3030
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v1, p1

    .line 3031
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v1, :cond_0

    .line 3032
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v2, v1, p1

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(D)I

    move-result v1

    .line 3034
    :goto_0
    return v1

    :cond_0
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    goto :goto_0
.end method

.method private static thawGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;I)Ljava/lang/Object;
    .locals 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stackTop"    # I
    .param p2, "generatorState"    # Lorg/mozilla/javascript/Interpreter$GeneratorState;
    .param p3, "op"    # I

    .prologue
    .line 2651
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2652
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v1, v1, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v1, v2}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v0

    .line 2653
    .local v0, "sourceLine":I
    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2654
    iget v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 2657
    new-instance v1, Lorg/mozilla/javascript/JavaScriptException;

    iget-object v2, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 2668
    :goto_0
    return-object v1

    .line 2661
    :cond_0
    iget v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 2662
    iget-object v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    goto :goto_0

    .line 2664
    :cond_1
    iget v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    if-eqz v1, :cond_2

    .line 2665
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2666
    :cond_2
    const/16 v1, 0x48

    if-ne p3, v1, :cond_3

    .line 2667
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget-object v2, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    aput-object v2, v1, p1

    .line 2668
    :cond_3
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public captureStackInfo(Lorg/mozilla/javascript/RhinoException;)V
    .locals 10
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    const/4 v9, 0x0

    .line 596
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 597
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v1, :cond_0

    iget-object v8, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-nez v8, :cond_1

    .line 599
    :cond_0
    iput-object v9, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    .line 600
    iput-object v9, p1, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    .line 647
    :goto_0
    return-void

    .line 605
    :cond_1
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    if-eqz v8, :cond_2

    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    if-nez v8, :cond_3

    .line 608
    :cond_2
    const/4 v8, 0x1

    new-array v0, v8, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 623
    .local v0, "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_1
    array-length v8, v0

    add-int/lit8 v9, v8, -0x1

    iget-object v8, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v8, Lorg/mozilla/javascript/Interpreter$CallFrame;

    aput-object v8, v0, v9

    .line 625
    const/4 v4, 0x0

    .line 626
    .local v4, "interpreterFrameCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    array-length v8, v0

    if-eq v3, v8, :cond_5

    .line 627
    aget-object v8, v0, v3

    iget v8, v8, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    add-int/lit8 v8, v8, 0x1

    add-int/2addr v4, v8

    .line 626
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 610
    .end local v0    # "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v3    # "i":I
    .end local v4    # "interpreterFrameCount":I
    :cond_3
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v7

    .line 611
    .local v7, "previousCount":I
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->peek()Ljava/lang/Object;

    move-result-object v8

    iget-object v9, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-ne v8, v9, :cond_4

    .line 618
    add-int/lit8 v7, v7, -0x1

    .line 620
    :cond_4
    add-int/lit8 v8, v7, 0x1

    new-array v0, v8, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 621
    .restart local v0    # "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8, v0}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;)V

    goto :goto_1

    .line 630
    .end local v7    # "previousCount":I
    .restart local v3    # "i":I
    .restart local v4    # "interpreterFrameCount":I
    :cond_5
    new-array v5, v4, [I

    .line 633
    .local v5, "linePC":[I
    move v6, v4

    .line 634
    .local v6, "linePCIndex":I
    array-length v3, v0

    :cond_6
    if-eqz v3, :cond_7

    .line 635
    add-int/lit8 v3, v3, -0x1

    .line 636
    aget-object v2, v0, v3

    .line 637
    .local v2, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_3
    if-eqz v2, :cond_6

    .line 638
    add-int/lit8 v6, v6, -0x1

    .line 639
    iget v8, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    aput v8, v5, v6

    .line 640
    iget-object v2, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_3

    .line 643
    .end local v2    # "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_7
    if-eqz v6, :cond_8

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 645
    :cond_8
    iput-object v0, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    .line 646
    iput-object v5, p1, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    goto :goto_0
.end method

.method public compile(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 2
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .prologue
    .line 193
    new-instance v0, Lorg/mozilla/javascript/CodeGenerator;

    invoke-direct {v0}, Lorg/mozilla/javascript/CodeGenerator;-><init>()V

    .line 194
    .local v0, "cgen":Lorg/mozilla/javascript/CodeGenerator;
    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/mozilla/javascript/CodeGenerator;->compile(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)Lorg/mozilla/javascript/InterpreterData;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    .line 195
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    return-object v1
.end method

.method public createFunctionObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/Function;
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "bytecode"    # Ljava/lang/Object;
    .param p4, "staticSecurityDomain"    # Ljava/lang/Object;

    .prologue
    .line 216
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    if-eq p3, v0, :cond_0

    .line 218
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 220
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-static {p1, p2, v0, p4}, Lorg/mozilla/javascript/InterpretedFunction;->createFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpreterData;Ljava/lang/Object;)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v0

    return-object v0
.end method

.method public createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/Script;
    .locals 1
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;

    .prologue
    .line 200
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    if-eq p1, v0, :cond_0

    .line 202
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 204
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-static {v0, p2}, Lorg/mozilla/javascript/InterpretedFunction;->createScript(Lorg/mozilla/javascript/InterpreterData;Ljava/lang/Object;)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v0

    return-object v0
.end method

.method public getPatchedStack(Lorg/mozilla/javascript/RhinoException;Ljava/lang/String;)Ljava/lang/String;
    .locals 15
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;
    .param p2, "nativeStackTrace"    # Ljava/lang/String;

    .prologue
    .line 664
    const-string v13, "org.mozilla.javascript.Interpreter.interpretLoop"

    .line 665
    .local v13, "tag":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit16 v14, v14, 0x3e8

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 666
    .local v12, "sb":Ljava/lang/StringBuilder;
    const-string v14, "line.separator"

    invoke-static {v14}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 668
    .local v8, "lineSeparator":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    check-cast v14, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object v1, v14

    check-cast v1, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 669
    .local v1, "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    .line 670
    .local v6, "linePC":[I
    array-length v2, v1

    .line 671
    .local v2, "arrayIndex":I
    array-length v7, v6

    .line 672
    .local v7, "linePCIndex":I
    const/4 v9, 0x0

    .line 673
    .local v9, "offset":I
    :cond_0
    if-eqz v2, :cond_1

    .line 674
    add-int/lit8 v2, v2, -0x1

    .line 675
    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    .line 676
    .local v11, "pos":I
    if-gez v11, :cond_2

    .line 715
    .end local v11    # "pos":I
    :cond_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 717
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 681
    .restart local v11    # "pos":I
    :cond_2
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v14

    add-int/2addr v11, v14

    .line 683
    :goto_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v14

    if-eq v11, v14, :cond_3

    .line 684
    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 685
    .local v3, "c":C
    const/16 v14, 0xa

    if-eq v3, v14, :cond_3

    const/16 v14, 0xd

    if-ne v3, v14, :cond_7

    .line 689
    .end local v3    # "c":C
    :cond_3
    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 690
    move v9, v11

    .line 692
    aget-object v4, v1, v2

    .line 693
    .local v4, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_1
    if-eqz v4, :cond_0

    .line 694
    if-nez v7, :cond_4

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 695
    :cond_4
    add-int/lit8 v7, v7, -0x1

    .line 696
    iget-object v5, v4, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 697
    .local v5, "idata":Lorg/mozilla/javascript/InterpreterData;
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    const-string v14, "\tat script"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 699
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    if-eqz v14, :cond_5

    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_5

    .line 700
    const/16 v14, 0x2e

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 701
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    :cond_5
    const/16 v14, 0x28

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 704
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 705
    aget v10, v6, v7

    .line 706
    .local v10, "pc":I
    if-ltz v10, :cond_6

    .line 708
    const/16 v14, 0x3a

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 709
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    invoke-static {v14, v10}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 711
    :cond_6
    const/16 v14, 0x29

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 712
    iget-object v4, v4, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 713
    goto :goto_1

    .line 683
    .end local v4    # "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v5    # "idata":Lorg/mozilla/javascript/InterpreterData;
    .end local v10    # "pc":I
    .restart local v3    # "c":C
    :cond_7
    add-int/lit8 v11, v11, 0x1

    goto :goto_0
.end method

.method public getScriptStack(Lorg/mozilla/javascript/RhinoException;)Ljava/util/List;
    .locals 13
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/RhinoException;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 721
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Interpreter;->getScriptStackElements(Lorg/mozilla/javascript/RhinoException;)[[Lorg/mozilla/javascript/ScriptStackElement;

    move-result-object v11

    .line 722
    .local v11, "stack":[[Lorg/mozilla/javascript/ScriptStackElement;
    new-instance v9, Ljava/util/ArrayList;

    array-length v12, v11

    invoke-direct {v9, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 723
    .local v9, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v12, "line.separator"

    invoke-static {v12}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 725
    .local v8, "lineSeparator":Ljava/lang/String;
    move-object v0, v11

    .local v0, "arr$":[[Lorg/mozilla/javascript/ScriptStackElement;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    move v5, v4

    .end local v0    # "arr$":[[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v3, v0, v5

    .line 726
    .local v3, "group":[Lorg/mozilla/javascript/ScriptStackElement;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 727
    .local v10, "sb":Ljava/lang/StringBuilder;
    move-object v1, v3

    .local v1, "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v4, 0x0

    .end local v5    # "i$":I
    .restart local v4    # "i$":I
    :goto_1
    if-ge v4, v7, :cond_0

    aget-object v2, v1, v4

    .line 728
    .local v2, "elem":Lorg/mozilla/javascript/ScriptStackElement;
    invoke-virtual {v2, v10}, Lorg/mozilla/javascript/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    .line 729
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 727
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 731
    .end local v2    # "elem":Lorg/mozilla/javascript/ScriptStackElement;
    :cond_0
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 725
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 733
    .end local v1    # "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v3    # "group":[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v7    # "len$":I
    .end local v10    # "sb":Ljava/lang/StringBuilder;
    :cond_1
    return-object v9
.end method

.method public getScriptStackElements(Lorg/mozilla/javascript/RhinoException;)[[Lorg/mozilla/javascript/ScriptStackElement;
    .locals 13
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    .line 738
    iget-object v12, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v12, :cond_0

    .line 739
    const/4 v12, 0x0

    check-cast v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    .line 771
    :goto_0
    return-object v12

    .line 742
    :cond_0
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 744
    .local v10, "list":Ljava/util/List;, "Ljava/util/List<[Lorg/mozilla/javascript/ScriptStackElement;>;"
    iget-object v12, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    check-cast v12, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object v0, v12

    check-cast v0, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 745
    .local v0, "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v8, p1, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    .line 746
    .local v8, "linePC":[I
    array-length v1, v0

    .line 747
    .local v1, "arrayIndex":I
    array-length v9, v8

    .line 748
    .local v9, "linePCIndex":I
    :goto_1
    if-eqz v1, :cond_5

    .line 749
    add-int/lit8 v1, v1, -0x1

    .line 750
    aget-object v3, v0, v1

    .line 751
    .local v3, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 752
    .local v5, "group":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ScriptStackElement;>;"
    :goto_2
    if-eqz v3, :cond_4

    .line 753
    if-nez v9, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 754
    :cond_1
    add-int/lit8 v9, v9, -0x1

    .line 755
    iget-object v6, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 756
    .local v6, "idata":Lorg/mozilla/javascript/InterpreterData;
    iget-object v2, v6, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    .line 757
    .local v2, "fileName":Ljava/lang/String;
    const/4 v4, 0x0

    .line 758
    .local v4, "functionName":Ljava/lang/String;
    const/4 v7, -0x1

    .line 759
    .local v7, "lineNumber":I
    aget v11, v8, v9

    .line 760
    .local v11, "pc":I
    if-ltz v11, :cond_2

    .line 761
    iget-object v12, v6, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    invoke-static {v12, v11}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v7

    .line 763
    :cond_2
    iget-object v12, v6, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    if-eqz v12, :cond_3

    iget-object v12, v6, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_3

    .line 764
    iget-object v4, v6, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    .line 766
    :cond_3
    iget-object v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 767
    new-instance v12, Lorg/mozilla/javascript/ScriptStackElement;

    invoke-direct {v12, v2, v4, v7}, Lorg/mozilla/javascript/ScriptStackElement;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 769
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v4    # "functionName":Ljava/lang/String;
    .end local v6    # "idata":Lorg/mozilla/javascript/InterpreterData;
    .end local v7    # "lineNumber":I
    .end local v11    # "pc":I
    :cond_4
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Lorg/mozilla/javascript/ScriptStackElement;

    invoke-interface {v5, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 771
    .end local v3    # "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v5    # "group":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ScriptStackElement;>;"
    :cond_5
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    invoke-interface {v10, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    goto :goto_0
.end method

.method public getSourcePositionFromStack(Lorg/mozilla/javascript/Context;[I)Ljava/lang/String;
    .locals 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "linep"    # [I

    .prologue
    const/4 v4, 0x0

    .line 651
    iget-object v0, p1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v0, Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 652
    .local v0, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v1, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 653
    .local v1, "idata":Lorg/mozilla/javascript/InterpreterData;
    iget v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    if-ltz v2, :cond_0

    .line 654
    iget-object v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v3, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    invoke-static {v2, v3}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v2

    aput v2, p2, v4

    .line 658
    :goto_0
    iget-object v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    return-object v2

    .line 656
    :cond_0
    aput v4, p2, v4

    goto :goto_0
.end method

.method public setEvalScriptFlag(Lorg/mozilla/javascript/Script;)V
    .locals 2
    .param p1, "script"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 209
    check-cast p1, Lorg/mozilla/javascript/InterpretedFunction;

    .end local p1    # "script":Lorg/mozilla/javascript/Script;
    iget-object v0, p1, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/mozilla/javascript/InterpreterData;->evalScriptFlag:Z

    .line 210
    return-void
.end method
