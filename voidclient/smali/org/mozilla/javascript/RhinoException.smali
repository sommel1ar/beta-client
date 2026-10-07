.class public abstract Lorg/mozilla/javascript/RhinoException;
.super Ljava/lang/RuntimeException;
.source "RhinoException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/RhinoException$1;
    }
.end annotation


# static fields
.field private static final JAVA_STACK_PATTERN:Ljava/util/regex/Pattern;

.field static final serialVersionUID:J = 0x1a2389d850259671L

.field private static stackStyle:Lorg/mozilla/javascript/StackStyle;


# instance fields
.field private columnNumber:I

.field interpreterLineData:[I

.field interpreterStackInfo:Ljava/lang/Object;

.field private lineNumber:I

.field private lineSource:Ljava/lang/String;

.field private sourceName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 24
    const-string v1, "_c_(.*)_\\d+"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/mozilla/javascript/RhinoException;->JAVA_STACK_PATTERN:Ljava/util/regex/Pattern;

    .line 422
    sget-object v1, Lorg/mozilla/javascript/StackStyle;->RHINO:Lorg/mozilla/javascript/StackStyle;

    sput-object v1, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    .line 434
    const-string v1, "rhino.stack.style"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 435
    .local v0, "style":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 436
    const-string v1, "Rhino"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 437
    sget-object v1, Lorg/mozilla/javascript/StackStyle;->RHINO:Lorg/mozilla/javascript/StackStyle;

    sput-object v1, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    .line 444
    :cond_0
    :goto_0
    return-void

    .line 438
    :cond_1
    const-string v1, "Mozilla"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 439
    sget-object v1, Lorg/mozilla/javascript/StackStyle;->MOZILLA:Lorg/mozilla/javascript/StackStyle;

    sput-object v1, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    goto :goto_0

    .line 440
    :cond_2
    const-string v1, "V8"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 441
    sget-object v1, Lorg/mozilla/javascript/StackStyle;->V8:Lorg/mozilla/javascript/StackStyle;

    sput-object v1, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 28
    invoke-static {}, Lorg/mozilla/javascript/Context;->createInterpreter()Lorg/mozilla/javascript/Evaluator;

    move-result-object v0

    .line 29
    .local v0, "e":Lorg/mozilla/javascript/Evaluator;
    if-eqz v0, :cond_0

    .line 30
    invoke-interface {v0, p0}, Lorg/mozilla/javascript/Evaluator;->captureStackInfo(Lorg/mozilla/javascript/RhinoException;)V

    .line 31
    :cond_0
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "details"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 36
    invoke-static {}, Lorg/mozilla/javascript/Context;->createInterpreter()Lorg/mozilla/javascript/Evaluator;

    move-result-object v0

    .line 37
    .local v0, "e":Lorg/mozilla/javascript/Evaluator;
    if-eqz v0, :cond_0

    .line 38
    invoke-interface {v0, p0}, Lorg/mozilla/javascript/Evaluator;->captureStackInfo(Lorg/mozilla/javascript/RhinoException;)V

    .line 39
    :cond_0
    return-void
.end method

.method static formatStackTrace([Lorg/mozilla/javascript/ScriptStackElement;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "stack"    # [Lorg/mozilla/javascript/ScriptStackElement;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .local v1, "buffer":Ljava/lang/StringBuilder;
    const-string v6, "line.separator"

    invoke-static {v6}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 232
    .local v5, "lineSeparator":Ljava/lang/String;
    sget-object v6, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    sget-object v7, Lorg/mozilla/javascript/StackStyle;->V8:Lorg/mozilla/javascript/StackStyle;

    if-ne v6, v7, :cond_0

    const-string v6, "null"

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 234
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    :cond_0
    move-object v0, p0

    .local v0, "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, v0, v3

    .line 239
    .local v2, "elem":Lorg/mozilla/javascript/ScriptStackElement;
    sget-object v6, Lorg/mozilla/javascript/RhinoException$1;->$SwitchMap$org$mozilla$javascript$StackStyle:[I

    sget-object v7, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    invoke-virtual {v7}, Lorg/mozilla/javascript/StackStyle;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 250
    :goto_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 241
    :pswitch_0
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ScriptStackElement;->renderMozillaStyle(Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 244
    :pswitch_1
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ScriptStackElement;->renderV8Style(Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 247
    :pswitch_2
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 252
    .end local v2    # "elem":Lorg/mozilla/javascript/ScriptStackElement;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 239
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private generateStackTrace()Ljava/lang/String;
    .locals 4

    .prologue
    .line 185
    new-instance v2, Ljava/io/CharArrayWriter;

    invoke-direct {v2}, Ljava/io/CharArrayWriter;-><init>()V

    .line 186
    .local v2, "writer":Ljava/io/CharArrayWriter;
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-super {p0, v3}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 187
    invoke-virtual {v2}, Ljava/io/CharArrayWriter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "origStackTrace":Ljava/lang/String;
    invoke-static {}, Lorg/mozilla/javascript/Context;->createInterpreter()Lorg/mozilla/javascript/Evaluator;

    move-result-object v0

    .line 189
    .local v0, "e":Lorg/mozilla/javascript/Evaluator;
    if-eqz v0, :cond_0

    .line 190
    invoke-interface {v0, p0, v1}, Lorg/mozilla/javascript/Evaluator;->getPatchedStack(Lorg/mozilla/javascript/RhinoException;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 191
    :goto_0
    return-object v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static getStackStyle()Lorg/mozilla/javascript/StackStyle;
    .locals 1

    .prologue
    .line 416
    sget-object v0, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    return-object v0
.end method

.method public static setStackStyle(Lorg/mozilla/javascript/StackStyle;)V
    .locals 0
    .param p0, "style"    # Lorg/mozilla/javascript/StackStyle;

    .prologue
    .line 408
    sput-object p0, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    .line 409
    return-void
.end method

.method public static useMozillaStackStyle(Z)V
    .locals 1
    .param p0, "flag"    # Z

    .prologue
    .line 397
    if-eqz p0, :cond_0

    sget-object v0, Lorg/mozilla/javascript/StackStyle;->MOZILLA:Lorg/mozilla/javascript/StackStyle;

    :goto_0
    sput-object v0, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    .line 398
    return-void

    .line 397
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/StackStyle;->RHINO:Lorg/mozilla/javascript/StackStyle;

    goto :goto_0
.end method

.method public static usesMozillaStackStyle()Z
    .locals 2

    .prologue
    .line 382
    sget-object v0, Lorg/mozilla/javascript/RhinoException;->stackStyle:Lorg/mozilla/javascript/StackStyle;

    sget-object v1, Lorg/mozilla/javascript/StackStyle;->MOZILLA:Lorg/mozilla/javascript/StackStyle;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final columnNumber()I
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lorg/mozilla/javascript/RhinoException;->columnNumber:I

    return v0
.end method

.method public details()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    invoke-super {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 3

    .prologue
    .line 44
    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->details()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "details":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/RhinoException;->sourceName:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget v2, p0, Lorg/mozilla/javascript/RhinoException;->lineNumber:I

    if-gtz v2, :cond_1

    .line 58
    .end local v1    # "details":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v1

    .line 48
    .restart local v1    # "details":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    iget-object v2, p0, Lorg/mozilla/javascript/RhinoException;->sourceName:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 51
    iget-object v2, p0, Lorg/mozilla/javascript/RhinoException;->sourceName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_2
    iget v2, p0, Lorg/mozilla/javascript/RhinoException;->lineNumber:I

    if-lez v2, :cond_3

    .line 54
    const/16 v2, 0x23

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    iget v2, p0, Lorg/mozilla/javascript/RhinoException;->lineNumber:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    :cond_3
    const/16 v2, 0x29

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getScriptStack()[Lorg/mozilla/javascript/ScriptStackElement;
    .locals 2

    .prologue
    .line 280
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/RhinoException;->getScriptStack(ILjava/lang/String;)[Lorg/mozilla/javascript/ScriptStackElement;

    move-result-object v0

    return-object v0
.end method

.method public getScriptStack(ILjava/lang/String;)[Lorg/mozilla/javascript/ScriptStackElement;
    .locals 24
    .param p1, "limit"    # I
    .param p2, "hideFunction"    # Ljava/lang/String;

    .prologue
    .line 296
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .local v17, "list":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ScriptStackElement;>;"
    const/4 v12, 0x0

    check-cast v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    .line 298
    .local v12, "interpreterStack":[[Lorg/mozilla/javascript/ScriptStackElement;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    move-object/from16 v22, v0

    if-eqz v22, :cond_0

    .line 299
    invoke-static {}, Lorg/mozilla/javascript/Context;->createInterpreter()Lorg/mozilla/javascript/Evaluator;

    move-result-object v11

    .line 300
    .local v11, "interpreter":Lorg/mozilla/javascript/Evaluator;
    instance-of v0, v11, Lorg/mozilla/javascript/Interpreter;

    move/from16 v22, v0

    if-eqz v22, :cond_0

    .line 301
    check-cast v11, Lorg/mozilla/javascript/Interpreter;

    .end local v11    # "interpreter":Lorg/mozilla/javascript/Evaluator;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Lorg/mozilla/javascript/Interpreter;->getScriptStackElements(Lorg/mozilla/javascript/RhinoException;)[[Lorg/mozilla/javascript/ScriptStackElement;

    move-result-object v12

    .line 304
    :cond_0
    const/4 v13, 0x0

    .line 305
    .local v13, "interpreterStackIndex":I
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/RhinoException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v21

    .line 306
    .local v21, "stack":[Ljava/lang/StackTraceElement;
    const/4 v5, 0x0

    .line 307
    .local v5, "count":I
    if-nez p2, :cond_3

    const/16 v20, 0x1

    .line 312
    .local v20, "printStarted":Z
    :goto_0
    move-object/from16 v3, v21

    .local v3, "arr$":[Ljava/lang/StackTraceElement;
    array-length v15, v3

    .local v15, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    move v10, v9

    .end local v9    # "i$":I
    .local v10, "i$":I
    move v14, v13

    .end local v3    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v13    # "interpreterStackIndex":I
    .end local v15    # "len$":I
    .local v14, "interpreterStackIndex":I
    :goto_1
    if-ge v10, v15, :cond_b

    aget-object v6, v3, v10

    .line 313
    .local v6, "e":Ljava/lang/StackTraceElement;
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v8

    .line 314
    .local v8, "fileName":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v22

    const-string v23, "_c_"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_7

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v22

    const/16 v23, -0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_7

    if-eqz v8, :cond_7

    const-string v22, ".java"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_7

    .line 318
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v19

    .line 319
    .local v19, "methodName":Ljava/lang/String;
    sget-object v22, Lorg/mozilla/javascript/RhinoException;->JAVA_STACK_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v18

    .line 322
    .local v18, "match":Ljava/util/regex/Matcher;
    const-string v22, "_c_script_0"

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_4

    invoke-virtual/range {v18 .. v18}, Ljava/util/regex/Matcher;->find()Z

    move-result v22

    if-eqz v22, :cond_4

    const/16 v22, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v19

    .line 325
    :goto_2
    if-nez v20, :cond_5

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    .line 326
    const/16 v20, 0x1

    :cond_1
    :goto_3
    move v13, v14

    .line 312
    .end local v10    # "i$":I
    .end local v14    # "interpreterStackIndex":I
    .end local v18    # "match":Ljava/util/regex/Matcher;
    .end local v19    # "methodName":Ljava/lang/String;
    .restart local v13    # "interpreterStackIndex":I
    :cond_2
    :goto_4
    add-int/lit8 v9, v10, 0x1

    .restart local v9    # "i$":I
    move v10, v9

    .end local v9    # "i$":I
    .restart local v10    # "i$":I
    move v14, v13

    .end local v13    # "interpreterStackIndex":I
    .restart local v14    # "interpreterStackIndex":I
    goto :goto_1

    .line 307
    .end local v6    # "e":Ljava/lang/StackTraceElement;
    .end local v8    # "fileName":Ljava/lang/String;
    .end local v10    # "i$":I
    .end local v14    # "interpreterStackIndex":I
    .end local v20    # "printStarted":Z
    .restart local v13    # "interpreterStackIndex":I
    :cond_3
    const/16 v20, 0x0

    goto :goto_0

    .line 322
    .end local v13    # "interpreterStackIndex":I
    .restart local v6    # "e":Ljava/lang/StackTraceElement;
    .restart local v8    # "fileName":Ljava/lang/String;
    .restart local v10    # "i$":I
    .restart local v14    # "interpreterStackIndex":I
    .restart local v18    # "match":Ljava/util/regex/Matcher;
    .restart local v19    # "methodName":Ljava/lang/String;
    .restart local v20    # "printStarted":Z
    :cond_4
    const/16 v19, 0x0

    goto :goto_2

    .line 327
    :cond_5
    if-eqz v20, :cond_1

    if-ltz p1, :cond_6

    move/from16 v0, p1

    if-ge v5, v0, :cond_1

    .line 328
    :cond_6
    new-instance v22, Lorg/mozilla/javascript/ScriptStackElement;

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v23

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    move/from16 v2, v23

    invoke-direct {v0, v8, v1, v2}, Lorg/mozilla/javascript/ScriptStackElement;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 332
    .end local v18    # "match":Ljava/util/regex/Matcher;
    .end local v19    # "methodName":Ljava/lang/String;
    :cond_7
    const-string v22, "org.mozilla.javascript.Interpreter"

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_c

    const-string v22, "interpretLoop"

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_c

    if-eqz v12, :cond_c

    array-length v0, v12

    move/from16 v22, v0

    move/from16 v0, v22

    if-le v0, v14, :cond_c

    .line 337
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "interpreterStackIndex":I
    .restart local v13    # "interpreterStackIndex":I
    aget-object v4, v12, v14

    .local v4, "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    array-length v0, v4

    move/from16 v16, v0

    .local v16, "len$":I
    const/4 v9, 0x0

    .end local v10    # "i$":I
    .restart local v9    # "i$":I
    :goto_5
    move/from16 v0, v16

    if-ge v9, v0, :cond_2

    aget-object v7, v4, v9

    .line 338
    .local v7, "elem":Lorg/mozilla/javascript/ScriptStackElement;
    if-nez v20, :cond_9

    iget-object v0, v7, Lorg/mozilla/javascript/ScriptStackElement;->functionName:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_9

    .line 339
    const/16 v20, 0x1

    .line 337
    :cond_8
    :goto_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 340
    :cond_9
    if-eqz v20, :cond_8

    if-ltz p1, :cond_a

    move/from16 v0, p1

    if-ge v5, v0, :cond_8

    .line 341
    :cond_a
    move-object/from16 v0, v17

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 347
    .end local v4    # "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v6    # "e":Ljava/lang/StackTraceElement;
    .end local v7    # "elem":Lorg/mozilla/javascript/ScriptStackElement;
    .end local v8    # "fileName":Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v13    # "interpreterStackIndex":I
    .end local v16    # "len$":I
    .restart local v10    # "i$":I
    .restart local v14    # "interpreterStackIndex":I
    :cond_b
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    new-array v0, v0, [Lorg/mozilla/javascript/ScriptStackElement;

    move-object/from16 v22, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v22

    check-cast v22, [Lorg/mozilla/javascript/ScriptStackElement;

    return-object v22

    .restart local v6    # "e":Ljava/lang/StackTraceElement;
    .restart local v8    # "fileName":Ljava/lang/String;
    :cond_c
    move v13, v14

    .end local v14    # "interpreterStackIndex":I
    .restart local v13    # "interpreterStackIndex":I
    goto/16 :goto_4
.end method

.method public getScriptStackTrace()Ljava/lang/String;
    .locals 2

    .prologue
    .line 204
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/RhinoException;->getScriptStackTrace(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScriptStackTrace(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "limit"    # I
    .param p2, "functionName"    # Ljava/lang/String;

    .prologue
    .line 223
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/RhinoException;->getScriptStack(ILjava/lang/String;)[Lorg/mozilla/javascript/ScriptStackElement;

    move-result-object v0

    .line 224
    .local v0, "stack":[Lorg/mozilla/javascript/ScriptStackElement;
    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->details()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/RhinoException;->formatStackTrace([Lorg/mozilla/javascript/ScriptStackElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getScriptStackTrace(Ljava/io/FilenameFilter;)Ljava/lang/String;
    .locals 1
    .param p1, "filter"    # Ljava/io/FilenameFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 267
    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->getScriptStackTrace()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final initColumnNumber(I)V
    .locals 2
    .param p1, "columnNumber"    # I

    .prologue
    .line 132
    if-gtz p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/RhinoException;->columnNumber:I

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 134
    :cond_1
    iput p1, p0, Lorg/mozilla/javascript/RhinoException;->columnNumber:I

    .line 135
    return-void
.end method

.method public final initLineNumber(I)V
    .locals 2
    .param p1, "lineNumber"    # I

    .prologue
    .line 109
    if-gtz p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/RhinoException;->lineNumber:I

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 111
    :cond_1
    iput p1, p0, Lorg/mozilla/javascript/RhinoException;->lineNumber:I

    .line 112
    return-void
.end method

.method public final initLineSource(Ljava/lang/String;)V
    .locals 1
    .param p1, "lineSource"    # Ljava/lang/String;

    .prologue
    .line 155
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 156
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/RhinoException;->lineSource:Ljava/lang/String;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 157
    :cond_1
    iput-object p1, p0, Lorg/mozilla/javascript/RhinoException;->lineSource:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public final initSourceName(Ljava/lang/String;)V
    .locals 1
    .param p1, "sourceName"    # Ljava/lang/String;

    .prologue
    .line 85
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 86
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/RhinoException;->sourceName:Ljava/lang/String;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 87
    :cond_1
    iput-object p1, p0, Lorg/mozilla/javascript/RhinoException;->sourceName:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public final lineNumber()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lorg/mozilla/javascript/RhinoException;->lineNumber:I

    return v0
.end method

.method public final lineSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/mozilla/javascript/RhinoException;->lineSource:Ljava/lang/String;

    return-object v0
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintStream;

    .prologue
    .line 364
    iget-object v0, p0, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 365
    invoke-super {p0, p1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 369
    :goto_0
    return-void

    .line 367
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/RhinoException;->generateStackTrace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintWriter;

    .prologue
    .line 354
    iget-object v0, p0, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 355
    invoke-super {p0, p1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 359
    :goto_0
    return-void

    .line 357
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/RhinoException;->generateStackTrace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0
.end method

.method final recordErrorOrigin(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 1
    .param p1, "sourceName"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I
    .param p3, "lineSource"    # Ljava/lang/String;
    .param p4, "columnNumber"    # I

    .prologue
    .line 164
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 165
    const/4 p2, 0x0

    .line 168
    :cond_0
    if-eqz p1, :cond_1

    .line 169
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/RhinoException;->initSourceName(Ljava/lang/String;)V

    .line 171
    :cond_1
    if-eqz p2, :cond_2

    .line 172
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/RhinoException;->initLineNumber(I)V

    .line 174
    :cond_2
    if-eqz p3, :cond_3

    .line 175
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/RhinoException;->initLineSource(Ljava/lang/String;)V

    .line 177
    :cond_3
    if-eqz p4, :cond_4

    .line 178
    invoke-virtual {p0, p4}, Lorg/mozilla/javascript/RhinoException;->initColumnNumber(I)V

    .line 180
    :cond_4
    return-void
.end method

.method public final sourceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/mozilla/javascript/RhinoException;->sourceName:Ljava/lang/String;

    return-object v0
.end method
