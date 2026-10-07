.class public Lorg/mozilla/javascript/optimizer/Codegen;
.super Ljava/lang/Object;
.source "Codegen.java"

# interfaces
.implements Lorg/mozilla/javascript/Evaluator;


# static fields
.field static final DEFAULT_MAIN_METHOD_CLASS:Ljava/lang/String; = "org.mozilla.javascript.optimizer.OptRuntime"

.field static final FUNCTION_CONSTRUCTOR_SIGNATURE:Ljava/lang/String; = "(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;I)V"

.field static final FUNCTION_INIT_SIGNATURE:Ljava/lang/String; = "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V"

.field static final ID_FIELD_NAME:Ljava/lang/String; = "_id"

.field static final REGEXP_INIT_METHOD_NAME:Ljava/lang/String; = "_reInit"

.field static final REGEXP_INIT_METHOD_SIGNATURE:Ljava/lang/String; = "(Lorg/mozilla/javascript/Context;)V"

.field private static final SUPER_CLASS_NAME:Ljava/lang/String; = "org.mozilla.javascript.NativeFunction"

.field private static final globalLock:Ljava/lang/Object;

.field private static globalSerialClassCounter:I


# instance fields
.field private compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

.field private directCallTargets:Lorg/mozilla/javascript/ObjArray;

.field private itsConstantList:[D

.field private itsConstantListSize:I

.field mainClassName:Ljava/lang/String;

.field mainClassSignature:Ljava/lang/String;

.field private mainMethodClass:Ljava/lang/String;

.field private scriptOrFnIndexes:Lorg/mozilla/javascript/ObjToIntMap;

.field scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1235
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/optimizer/Codegen;->globalLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1244
    const-string v0, "org.mozilla.javascript.optimizer.OptRuntime"

    iput-object v0, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainMethodClass:Ljava/lang/String;

    return-void
.end method

.method private static addDoubleWrap(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 4
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 1119
    const/16 v0, 0xb8

    const-string v1, "org/mozilla/javascript/optimizer/OptRuntime"

    const-string v2, "wrapDouble"

    const-string v3, "(D)Ljava/lang/Double;"

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1122
    return-void
.end method

.method static badTree()Ljava/lang/RuntimeException;
    .locals 2

    .prologue
    .line 1206
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Bad tree in codegen"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static collectScriptNodes_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/ObjArray;)V
    .locals 3
    .param p0, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p1, "x"    # Lorg/mozilla/javascript/ObjArray;

    .prologue
    .line 256
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 257
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v1

    .line 258
    .local v1, "nestedCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, v1, :cond_0

    .line 259
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/mozilla/javascript/optimizer/Codegen;->collectScriptNodes_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/ObjArray;)V

    .line 258
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 261
    :cond_0
    return-void
.end method

.method private defineClass(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Class;
    .locals 11
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 118
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "bytecode":Ljava/lang/Object;
    move-object v5, p1

    check-cast v5, [Ljava/lang/Object;

    .line 119
    .local v5, "nameBytesPair":[Ljava/lang/Object;
    const/4 v8, 0x0

    aget-object v2, v5, v8

    check-cast v2, Ljava/lang/String;

    .line 120
    .local v2, "className":Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v8, v5, v8

    check-cast v8, [B

    move-object v1, v8

    check-cast v1, [B

    .line 124
    .local v1, "classBytes":[B
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    .line 126
    .local v6, "rhinoLoader":Ljava/lang/ClassLoader;
    invoke-static {v6, p2}, Lorg/mozilla/javascript/SecurityController;->createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lorg/mozilla/javascript/GeneratedClassLoader;

    move-result-object v4

    .line 130
    .local v4, "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    :try_start_0
    invoke-interface {v4, v2, v1}, Lorg/mozilla/javascript/GeneratedClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v0

    .line 131
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v4, v0}, Lorg/mozilla/javascript/GeneratedClassLoader;->linkClass(Ljava/lang/Class;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 132
    return-object v0

    .line 133
    .end local v0    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v7

    .line 134
    .local v7, "x":Ljava/lang/SecurityException;
    move-object v3, v7

    .line 138
    .end local v7    # "x":Ljava/lang/SecurityException;
    .local v3, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Malformed optimizer package "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 135
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 136
    .local v7, "x":Ljava/lang/IllegalArgumentException;
    move-object v3, v7

    .restart local v3    # "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private emitConstantDudeInitializers(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 12
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 1023
    iget v0, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantListSize:I

    .line 1024
    .local v0, "N":I
    if-nez v0, :cond_0

    .line 1051
    :goto_0
    return-void

    .line 1027
    :cond_0
    const-string v8, "<clinit>"

    const-string v9, "()V"

    const/16 v10, 0x18

    invoke-virtual {p1, v8, v9, v10}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1029
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantList:[D

    .line 1030
    .local v1, "array":[D
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v0, :cond_2

    .line 1031
    aget-wide v6, v1, v4

    .line 1032
    .local v6, "num":D
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "_k"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1033
    .local v2, "constantName":Ljava/lang/String;
    invoke-static {v6, v7}, Lorg/mozilla/javascript/optimizer/Codegen;->getStaticConstantWrapperType(D)Ljava/lang/String;

    move-result-object v3

    .line 1034
    .local v3, "constantType":Ljava/lang/String;
    const/16 v8, 0xa

    invoke-virtual {p1, v2, v3, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1036
    double-to-int v5, v6

    .line 1037
    .local v5, "inum":I
    int-to-double v8, v5

    cmpl-double v8, v8, v6

    if-nez v8, :cond_1

    .line 1038
    invoke-virtual {p1, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1039
    const/16 v8, 0xb8

    const-string v9, "java/lang/Integer"

    const-string v10, "valueOf"

    const-string v11, "(I)Ljava/lang/Integer;"

    invoke-virtual {p1, v8, v9, v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1045
    :goto_2
    const/16 v8, 0xb3

    iget-object v9, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {p1, v8, v9, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1030
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1042
    :cond_1
    invoke-virtual {p1, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 1043
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Codegen;->addDoubleWrap(Lorg/mozilla/classfile/ClassFileWriter;)V

    goto :goto_2

    .line 1049
    .end local v2    # "constantName":Ljava/lang/String;
    .end local v3    # "constantType":Ljava/lang/String;
    .end local v5    # "inum":I
    .end local v6    # "num":D
    :cond_2
    const/16 v8, 0xb1

    invoke-virtual {p1, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1050
    const/4 v8, 0x0

    invoke-virtual {p1, v8}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    goto :goto_0
.end method

.method private emitDirectConstructor(Lorg/mozilla/classfile/ClassFileWriter;Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V
    .locals 12
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p2, "ofn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .prologue
    const/16 v11, 0xb0

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 340
    iget-object v4, p2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/optimizer/Codegen;->getDirectCtorName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xa

    invoke-virtual {p1, v4, v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 344
    iget-object v4, p2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v0

    .line 345
    .local v0, "argCount":I
    mul-int/lit8 v4, v0, 0x3

    add-int/lit8 v4, v4, 0x4

    add-int/lit8 v2, v4, 0x1

    .line 347
    .local v2, "firstLocal":I
    invoke-virtual {p1, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 348
    invoke-virtual {p1, v9}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 349
    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 350
    const/16 v4, 0xb6

    const-string v5, "org/mozilla/javascript/BaseFunction"

    const-string v6, "createObject"

    const-string v7, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p1, v4, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 358
    invoke-virtual {p1, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 359
    invoke-virtual {p1, v9}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 360
    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 361
    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 362
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 363
    mul-int/lit8 v4, v3, 0x3

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 364
    mul-int/lit8 v4, v3, 0x3

    add-int/lit8 v4, v4, 0x5

    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    .line 362
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 366
    :cond_0
    mul-int/lit8 v4, v0, 0x3

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 367
    const/16 v4, 0xb8

    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    iget-object v6, p2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v4, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 372
    .local v1, "exitLabel":I
    const/16 v4, 0x59

    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 373
    const/16 v4, 0xc1

    const-string v5, "org/mozilla/javascript/Scriptable"

    invoke-virtual {p1, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 374
    const/16 v4, 0x99

    invoke-virtual {p1, v4, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 376
    const/16 v4, 0xc0

    const-string v5, "org/mozilla/javascript/Scriptable"

    invoke-virtual {p1, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 377
    invoke-virtual {p1, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 378
    invoke-virtual {p1, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 380
    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 381
    invoke-virtual {p1, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 383
    add-int/lit8 v4, v2, 0x1

    int-to-short v4, v4

    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 384
    return-void
.end method

.method private emitRegExpInit(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 14
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 957
    const/4 v9, 0x0

    .line 958
    .local v9, "totalRegCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v10, v10

    if-eq v1, v10, :cond_0

    .line 959
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v10, v10, v1

    invoke-virtual {v10}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpCount()I

    move-result v10

    add-int/2addr v9, v10

    .line 958
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 961
    :cond_0
    if-nez v9, :cond_1

    .line 1019
    :goto_1
    return-void

    .line 965
    :cond_1
    const-string v10, "_reInit"

    const-string v11, "(Lorg/mozilla/javascript/Context;)V"

    const/16 v12, 0xa

    invoke-virtual {p1, v10, v11, v12}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 967
    const-string v10, "_reInitDone"

    const-string v11, "Z"

    const/16 v12, 0x4a

    invoke-virtual {p1, v10, v11, v12}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 969
    const/16 v10, 0xb2

    iget-object v11, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v12, "_reInitDone"

    const-string v13, "Z"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 971
    .local v0, "doInit":I
    const/16 v10, 0x99

    invoke-virtual {p1, v10, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 972
    const/16 v10, 0xb1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 973
    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 976
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 977
    const/16 v10, 0xb8

    const-string v11, "org/mozilla/javascript/ScriptRuntime"

    const-string v12, "checkRegExpProxy"

    const-string v13, "(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addAStore(I)V

    .line 986
    const/4 v1, 0x0

    :goto_2
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v10, v10

    if-eq v1, v10, :cond_4

    .line 987
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v3, v10, v1

    .line 988
    .local v3, "n":Lorg/mozilla/javascript/ast/ScriptNode;
    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpCount()I

    move-result v8

    .line 989
    .local v8, "regCount":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_3
    if-eq v2, v8, :cond_3

    .line 990
    invoke-virtual {p0, v3, v2}, Lorg/mozilla/javascript/optimizer/Codegen;->getCompiledRegexpName(Lorg/mozilla/javascript/ast/ScriptNode;I)Ljava/lang/String;

    move-result-object v4

    .line 991
    .local v4, "reFieldName":Ljava/lang/String;
    const-string v5, "Ljava/lang/Object;"

    .line 992
    .local v5, "reFieldType":Ljava/lang/String;
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpString(I)Ljava/lang/String;

    move-result-object v7

    .line 993
    .local v7, "reString":Ljava/lang/String;
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpFlags(I)Ljava/lang/String;

    move-result-object v6

    .line 994
    .local v6, "reFlags":Ljava/lang/String;
    const/16 v10, 0xa

    invoke-virtual {p1, v4, v5, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 996
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 997
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 998
    invoke-virtual {p1, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 999
    if-nez v6, :cond_2

    .line 1000
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1004
    :goto_4
    const/16 v10, 0xb9

    const-string v11, "org/mozilla/javascript/RegExpProxy"

    const-string v12, "compileRegExp"

    const-string v13, "(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1010
    const/16 v10, 0xb3

    iget-object v11, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {p1, v10, v11, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 989
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1002
    :cond_2
    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto :goto_4

    .line 986
    .end local v4    # "reFieldName":Ljava/lang/String;
    .end local v5    # "reFieldType":Ljava/lang/String;
    .end local v6    # "reFlags":Ljava/lang/String;
    .end local v7    # "reString":Ljava/lang/String;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1015
    .end local v2    # "j":I
    .end local v3    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .end local v8    # "regCount":I
    :cond_4
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 1016
    const/16 v10, 0xb3

    iget-object v11, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v12, "_reInitDone"

    const-string v13, "Z"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1017
    const/16 v10, 0xb1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1018
    const/4 v10, 0x2

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    goto/16 :goto_1
.end method

.method private generateCallMethod(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 22
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 470
    const-string v18, "call"

    const-string v19, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    const/16 v20, 0x11

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 482
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v11

    .line 483
    .local v11, "nonTopCallLabel":I
    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 484
    const/16 v18, 0xb8

    const-string v19, "org/mozilla/javascript/ScriptRuntime"

    const-string v20, "hasTopCall"

    const-string v21, "(Lorg/mozilla/javascript/Context;)Z"

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    const/16 v18, 0x9a

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 490
    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 491
    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 492
    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 493
    const/16 v18, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 494
    const/16 v18, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 495
    const/16 v18, 0xb8

    const-string v19, "org/mozilla/javascript/ScriptRuntime"

    const-string v20, "doTopCall"

    const-string v21, "(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    const/16 v18, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 505
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 508
    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 509
    const/16 v18, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 510
    const/16 v18, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 511
    const/16 v18, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 512
    const/16 v18, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 514
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v7, v0

    .line 515
    .local v7, "end":I
    const/16 v18, 0x2

    move/from16 v0, v18

    if-gt v0, v7, :cond_2

    const/4 v8, 0x1

    .line 517
    .local v8, "generateSwitch":Z
    :goto_0
    const/16 v16, 0x0

    .line 518
    .local v16, "switchStart":I
    const/4 v15, 0x0

    .line 519
    .local v15, "switchStackTop":I
    if-eqz v8, :cond_0

    .line 520
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 521
    const/16 v18, 0xb4

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "_id"

    const-string v21, "I"

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    const/16 v18, 0x1

    add-int/lit8 v19, v7, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v16

    .line 527
    :cond_0
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    if-eq v9, v7, :cond_5

    .line 528
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v18, v0

    aget-object v10, v18, v9

    .line 529
    .local v10, "n":Lorg/mozilla/javascript/ast/ScriptNode;
    if-eqz v8, :cond_1

    .line 530
    if-nez v9, :cond_3

    .line 531
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 532
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v15

    .line 538
    :cond_1
    :goto_2
    invoke-virtual {v10}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v18

    const/16 v19, 0x6d

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_4

    .line 539
    invoke-static {v10}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v12

    .line 540
    .local v12, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    invoke-virtual {v12}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v18

    if-eqz v18, :cond_4

    .line 541
    iget-object v0, v12, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v14

    .line 542
    .local v14, "pcount":I
    if-eqz v14, :cond_4

    .line 545
    const/4 v13, 0x0

    .local v13, "p":I
    :goto_3
    if-eq v13, v14, :cond_4

    .line 546
    const/16 v18, 0xbe

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 547
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 548
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v17

    .line 549
    .local v17, "undefArg":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v6

    .line 550
    .local v6, "beyond":I
    const/16 v18, 0xa4

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 552
    const/16 v18, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 553
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 554
    const/16 v18, 0x32

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 555
    const/16 v18, 0xa7

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 556
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 557
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 558
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 560
    const/16 v18, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->adjustStackTop(I)V

    .line 561
    const-wide/16 v18, 0x0

    move-object/from16 v0, p1

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 563
    const/16 v18, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 545
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 515
    .end local v6    # "beyond":I
    .end local v8    # "generateSwitch":Z
    .end local v9    # "i":I
    .end local v10    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .end local v12    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .end local v13    # "p":I
    .end local v14    # "pcount":I
    .end local v15    # "switchStackTop":I
    .end local v16    # "switchStart":I
    .end local v17    # "undefArg":I
    :cond_2
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 534
    .restart local v8    # "generateSwitch":Z
    .restart local v9    # "i":I
    .restart local v10    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .restart local v15    # "switchStackTop":I
    .restart local v16    # "switchStart":I
    :cond_3
    add-int/lit8 v18, v9, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2, v15}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    goto/16 :goto_2

    .line 568
    :cond_4
    const/16 v18, 0xb8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    const/16 v18, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 527
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 574
    .end local v10    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_5
    const/16 v18, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 576
    return-void
.end method

.method private generateCode(Ljava/lang/String;)[B
    .locals 14
    .param p1, "encodedSource"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 265
    iget-object v12, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v12, v12, v11

    invoke-virtual {v12}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v12

    const/16 v13, 0x88

    if-ne v12, v13, :cond_5

    move v5, v10

    .line 266
    .local v5, "hasScript":Z
    :goto_0
    iget-object v12, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v12, v12

    if-gt v12, v10, :cond_0

    if-nez v5, :cond_6

    :cond_0
    move v4, v10

    .line 268
    .local v4, "hasFunctions":Z
    :goto_1
    const/4 v9, 0x0

    .line 269
    .local v9, "sourceFile":Ljava/lang/String;
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v10}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 270
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v10, v10, v11

    invoke-virtual {v10}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v9

    .line 273
    :cond_1
    new-instance v1, Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v11, "org.mozilla.javascript.NativeFunction"

    invoke-direct {v1, v10, v11, v9}, Lorg/mozilla/classfile/ClassFileWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .local v1, "cfw":Lorg/mozilla/classfile/ClassFileWriter;
    const-string v10, "_id"

    const-string v11, "I"

    const/4 v12, 0x2

    invoke-virtual {v1, v10, v11, v12}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 278
    if-eqz v4, :cond_2

    .line 279
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateFunctionConstructor(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 282
    :cond_2
    if-eqz v5, :cond_3

    .line 283
    const-string v10, "org/mozilla/javascript/Script"

    invoke-virtual {v1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addInterface(Ljava/lang/String;)V

    .line 284
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateScriptCtor(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 285
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateMain(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 286
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateExecute(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 289
    :cond_3
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateCallMethod(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 290
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateResumeGenerator(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 292
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/optimizer/Codegen;->generateNativeFunctionOverrides(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;)V

    .line 294
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v2, v10

    .line 295
    .local v2, "count":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    if-eq v6, v2, :cond_7

    .line 296
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v7, v10, v6

    .line 298
    .local v7, "n":Lorg/mozilla/javascript/ast/ScriptNode;
    new-instance v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;

    invoke-direct {v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;-><init>()V

    .line 299
    .local v0, "bodygen":Lorg/mozilla/javascript/optimizer/BodyCodegen;
    iput-object v1, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    .line 300
    iput-object p0, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->codegen:Lorg/mozilla/javascript/optimizer/Codegen;

    .line 301
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    iput-object v10, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 302
    iput-object v7, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    .line 303
    iput v6, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen;->scriptOrFnIndex:I

    .line 306
    :try_start_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->generateBodyCode()V
    :try_end_0
    .catch Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v10

    const/16 v11, 0x6d

    if-ne v10, v11, :cond_4

    .line 312
    invoke-static {v7}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v8

    .line 313
    .local v8, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    invoke-direct {p0, v1, v8}, Lorg/mozilla/javascript/optimizer/Codegen;->generateFunctionInit(Lorg/mozilla/classfile/ClassFileWriter;Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V

    .line 314
    invoke-virtual {v8}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 315
    invoke-direct {p0, v1, v8}, Lorg/mozilla/javascript/optimizer/Codegen;->emitDirectConstructor(Lorg/mozilla/classfile/ClassFileWriter;Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V

    .line 295
    .end local v8    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .end local v0    # "bodygen":Lorg/mozilla/javascript/optimizer/BodyCodegen;
    .end local v1    # "cfw":Lorg/mozilla/classfile/ClassFileWriter;
    .end local v2    # "count":I
    .end local v4    # "hasFunctions":Z
    .end local v5    # "hasScript":Z
    .end local v6    # "i":I
    .end local v7    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .end local v9    # "sourceFile":Ljava/lang/String;
    :cond_5
    move v5, v11

    .line 265
    goto/16 :goto_0

    .restart local v5    # "hasScript":Z
    :cond_6
    move v4, v11

    .line 266
    goto :goto_1

    .line 307
    .restart local v0    # "bodygen":Lorg/mozilla/javascript/optimizer/BodyCodegen;
    .restart local v1    # "cfw":Lorg/mozilla/classfile/ClassFileWriter;
    .restart local v2    # "count":I
    .restart local v4    # "hasFunctions":Z
    .restart local v6    # "i":I
    .restart local v7    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .restart local v9    # "sourceFile":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 308
    .local v3, "e":Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;
    invoke-virtual {v3}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v7, v10}, Lorg/mozilla/javascript/optimizer/Codegen;->reportClassFileFormatException(Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 320
    .end local v0    # "bodygen":Lorg/mozilla/javascript/optimizer/BodyCodegen;
    .end local v3    # "e":Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;
    .end local v7    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_7
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->emitRegExpInit(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 321
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->emitConstantDudeInitializers(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 323
    invoke-virtual {v1}, Lorg/mozilla/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v10

    return-object v10
.end method

.method private generateExecute(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 6
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    const/4 v5, 0x1

    .line 602
    const-string v2, "exec"

    const-string v3, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;"

    const/16 v4, 0x11

    invoke-virtual {p1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 608
    const/4 v0, 0x1

    .line 609
    .local v0, "CONTEXT_ARG":I
    const/4 v1, 0x2

    .line 611
    .local v1, "SCOPE_ARG":I
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 612
    invoke-virtual {p1, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 613
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 614
    const/16 v2, 0x59

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 615
    invoke-virtual {p1, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 616
    const/16 v2, 0xb6

    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "call"

    const-string v5, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {p1, v2, v3, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    const/16 v2, 0xb0

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 627
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 628
    return-void
.end method

.method private generateFunctionConstructor(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 14
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 649
    const/4 v2, 0x1

    .line 650
    .local v2, "SCOPE_ARG":I
    const/4 v0, 0x2

    .line 651
    .local v0, "CONTEXT_ARG":I
    const/4 v1, 0x3

    .line 653
    .local v1, "ID_ARG":I
    const-string v10, "<init>"

    const-string v11, "(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;I)V"

    const/4 v12, 0x1

    invoke-virtual {p1, v10, v11, v12}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 654
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 655
    const/16 v10, 0xb7

    const-string v11, "org.mozilla.javascript.NativeFunction"

    const-string v12, "<init>"

    const-string v13, "()V"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 659
    const/4 v10, 0x3

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 660
    const/16 v10, 0xb5

    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "_id"

    const-string v13, "I"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 663
    const/4 v10, 0x2

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 664
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 666
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    const/4 v11, 0x0

    aget-object v10, v10, v11

    invoke-virtual {v10}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v10

    const/16 v11, 0x88

    if-ne v10, v11, :cond_0

    const/4 v7, 0x1

    .line 667
    .local v7, "start":I
    :goto_0
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v3, v10

    .line 668
    .local v3, "end":I
    if-ne v7, v3, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 666
    .end local v3    # "end":I
    .end local v7    # "start":I
    :cond_0
    const/4 v7, 0x0

    goto :goto_0

    .line 669
    .restart local v3    # "end":I
    .restart local v7    # "start":I
    :cond_1
    const/4 v10, 0x2

    sub-int v11, v3, v7

    if-gt v10, v11, :cond_4

    const/4 v4, 0x1

    .line 671
    .local v4, "generateSwitch":Z
    :goto_1
    const/4 v9, 0x0

    .line 672
    .local v9, "switchStart":I
    const/4 v8, 0x0

    .line 673
    .local v8, "switchStackTop":I
    if-eqz v4, :cond_2

    .line 674
    const/4 v10, 0x3

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 677
    add-int/lit8 v10, v7, 0x1

    add-int/lit8 v11, v3, -0x1

    invoke-virtual {p1, v10, v11}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v9

    .line 680
    :cond_2
    move v5, v7

    .local v5, "i":I
    :goto_2
    if-eq v5, v3, :cond_6

    .line 681
    if-eqz v4, :cond_3

    .line 682
    if-ne v5, v7, :cond_5

    .line 683
    invoke-virtual {p1, v9}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 684
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v8

    .line 690
    :cond_3
    :goto_3
    iget-object v10, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v10, v10, v5

    invoke-static {v10}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v6

    .line 691
    .local v6, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    const/16 v10, 0xb7

    iget-object v11, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/optimizer/Codegen;->getFunctionInitMethodName(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V"

    invoke-virtual {p1, v10, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    const/16 v10, 0xb1

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 680
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 669
    .end local v4    # "generateSwitch":Z
    .end local v5    # "i":I
    .end local v6    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .end local v8    # "switchStackTop":I
    .end local v9    # "switchStart":I
    :cond_4
    const/4 v4, 0x0

    goto :goto_1

    .line 686
    .restart local v4    # "generateSwitch":Z
    .restart local v5    # "i":I
    .restart local v8    # "switchStackTop":I
    .restart local v9    # "switchStart":I
    :cond_5
    add-int/lit8 v10, v5, -0x1

    sub-int/2addr v10, v7

    invoke-virtual {p1, v9, v10, v8}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    goto :goto_3

    .line 699
    :cond_6
    const/4 v10, 0x4

    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 700
    return-void
.end method

.method private generateFunctionInit(Lorg/mozilla/classfile/ClassFileWriter;Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V
    .locals 7
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p2, "ofn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .prologue
    const/4 v6, 0x1

    .line 705
    const/4 v0, 0x1

    .line 706
    .local v0, "CONTEXT_ARG":I
    const/4 v1, 0x2

    .line 707
    .local v1, "SCOPE_ARG":I
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/optimizer/Codegen;->getFunctionInitMethodName(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V"

    const/16 v4, 0x12

    invoke-virtual {p1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 712
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 713
    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 714
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 715
    const/16 v2, 0xb6

    const-string v3, "org/mozilla/javascript/NativeFunction"

    const-string v4, "initScriptFunction"

    const-string v5, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V"

    invoke-virtual {p1, v2, v3, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    iget-object v2, p2, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/FunctionNode;->getRegexpCount()I

    move-result v2

    if-eqz v2, :cond_0

    .line 724
    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 725
    const/16 v2, 0xb8

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v4, "_reInit"

    const-string v5, "(Lorg/mozilla/javascript/Context;)V"

    invoke-virtual {p1, v2, v3, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 729
    :cond_0
    const/16 v2, 0xb1

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 731
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 732
    return-void
.end method

.method private generateMain(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 4
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 580
    const-string v0, "main"

    const-string v1, "([Ljava/lang/String;)V"

    const/16 v2, 0x9

    invoke-virtual {p1, v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 584
    const/16 v0, 0xbb

    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 585
    const/16 v0, 0x59

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 586
    const/16 v0, 0xb7

    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "<init>"

    const-string v3, "()V"

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    const/16 v0, 0x2a

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 591
    const/16 v0, 0xb8

    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainMethodClass:Ljava/lang/String;

    const-string v2, "main"

    const-string v3, "(Lorg/mozilla/javascript/Script;[Ljava/lang/String;)V"

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 595
    const/16 v0, 0xb1

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 597
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 598
    return-void
.end method

.method private generateNativeFunctionOverrides(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;)V
    .locals 29
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p2, "encodedSource"    # Ljava/lang/String;

    .prologue
    .line 740
    const-string v25, "getLanguageVersion"

    const-string v26, "()I"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 742
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 743
    const/16 v25, 0xac

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 746
    const/16 v25, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 751
    const/4 v6, 0x0

    .line 752
    .local v6, "Do_getFunctionName":I
    const/4 v8, 0x1

    .line 753
    .local v8, "Do_getParamCount":I
    const/4 v7, 0x2

    .line 754
    .local v7, "Do_getParamAndVarCount":I
    const/4 v10, 0x3

    .line 755
    .local v10, "Do_getParamOrVarName":I
    const/4 v5, 0x4

    .line 756
    .local v5, "Do_getEncodedSource":I
    const/4 v9, 0x5

    .line 757
    .local v9, "Do_getParamOrVarConst":I
    const/4 v11, 0x6

    .line 759
    .local v11, "SWITCH_COUNT":I
    const/16 v16, 0x0

    .local v16, "methodIndex":I
    :goto_0
    const/16 v25, 0x6

    move/from16 v0, v16

    move/from16 v1, v25

    if-eq v0, v1, :cond_f

    .line 760
    const/16 v25, 0x4

    move/from16 v0, v16

    move/from16 v1, v25

    if-ne v0, v1, :cond_0

    if-nez p2, :cond_0

    .line 759
    :goto_1
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 770
    :cond_0
    packed-switch v16, :pswitch_data_0

    .line 803
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v25

    throw v25

    .line 772
    :pswitch_0
    const/16 v17, 0x1

    .line 773
    .local v17, "methodLocals":S
    const-string v25, "getFunctionName"

    const-string v26, "()Ljava/lang/String;"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 806
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v13, v0

    .line 808
    .local v13, "count":I
    const/16 v24, 0x0

    .line 809
    .local v24, "switchStart":I
    const/16 v23, 0x0

    .line 810
    .local v23, "switchStackTop":I
    const/16 v25, 0x1

    move/from16 v0, v25

    if-le v13, v0, :cond_1

    .line 813
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 814
    const/16 v25, 0xb4

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v26

    const-string v27, "_id"

    const-string v28, "I"

    move-object/from16 v0, p1

    move/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    move-object/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 818
    const/16 v25, 0x1

    add-int/lit8 v26, v13, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v24

    .line 821
    :cond_1
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_3
    if-eq v14, v13, :cond_e

    .line 822
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v25, v0

    aget-object v18, v25, v14

    .line 823
    .local v18, "n":Lorg/mozilla/javascript/ast/ScriptNode;
    if-nez v14, :cond_3

    .line 824
    const/16 v25, 0x1

    move/from16 v0, v25

    if-le v13, v0, :cond_2

    .line 825
    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 826
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v23

    .line 834
    :cond_2
    :goto_4
    packed-switch v16, :pswitch_data_1

    .line 945
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v25

    throw v25

    .line 777
    .end local v13    # "count":I
    .end local v14    # "i":I
    .end local v17    # "methodLocals":S
    .end local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .end local v23    # "switchStackTop":I
    .end local v24    # "switchStart":I
    :pswitch_1
    const/16 v17, 0x1

    .line 778
    .restart local v17    # "methodLocals":S
    const-string v25, "getParamCount"

    const-string v26, "()I"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    goto :goto_2

    .line 782
    .end local v17    # "methodLocals":S
    :pswitch_2
    const/16 v17, 0x1

    .line 783
    .restart local v17    # "methodLocals":S
    const-string v25, "getParamAndVarCount"

    const-string v26, "()I"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    goto/16 :goto_2

    .line 787
    .end local v17    # "methodLocals":S
    :pswitch_3
    const/16 v17, 0x2

    .line 788
    .restart local v17    # "methodLocals":S
    const-string v25, "getParamOrVarName"

    const-string v26, "(I)Ljava/lang/String;"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    goto/16 :goto_2

    .line 792
    .end local v17    # "methodLocals":S
    :pswitch_4
    const/16 v17, 0x3

    .line 793
    .restart local v17    # "methodLocals":S
    const-string v25, "getParamOrVarConst"

    const-string v26, "(I)Z"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    goto/16 :goto_2

    .line 797
    .end local v17    # "methodLocals":S
    :pswitch_5
    const/16 v17, 0x1

    .line 798
    .restart local v17    # "methodLocals":S
    const-string v25, "getEncodedSource"

    const-string v26, "()Ljava/lang/String;"

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 800
    invoke-virtual/range {p1 .. p2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 829
    .restart local v13    # "count":I
    .restart local v14    # "i":I
    .restart local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    .restart local v23    # "switchStackTop":I
    .restart local v24    # "switchStart":I
    :cond_3
    add-int/lit8 v25, v14, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    goto :goto_4

    .line 837
    :pswitch_6
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v25

    const/16 v26, 0x88

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_5

    .line 838
    const-string v25, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 843
    .end local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :goto_5
    const/16 v25, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 821
    :cond_4
    :goto_6
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_3

    .line 840
    .restart local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_5
    check-cast v18, Lorg/mozilla/javascript/ast/FunctionNode;

    .end local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v19

    .line 841
    .local v19, "name":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto :goto_5

    .line 848
    .end local v19    # "name":Ljava/lang/String;
    .restart local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :pswitch_7
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamCount()I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 849
    const/16 v25, 0xac

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_6

    .line 854
    :pswitch_8
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarCount()I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 855
    const/16 v25, 0xac

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_6

    .line 861
    :pswitch_9
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarCount()I

    move-result v20

    .line 862
    .local v20, "paramAndVarCount":I
    if-nez v20, :cond_6

    .line 866
    const/16 v25, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 867
    const/16 v25, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_6

    .line 868
    :cond_6
    const/16 v25, 0x1

    move/from16 v0, v20

    move/from16 v1, v25

    if-ne v0, v1, :cond_7

    .line 871
    const/16 v25, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 872
    const/16 v25, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_6

    .line 875
    :cond_7
    const/16 v25, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 878
    const/16 v25, 0x1

    add-int/lit8 v26, v20, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v21

    .line 880
    .local v21, "paramSwitchStart":I
    const/4 v15, 0x0

    .local v15, "j":I
    :goto_7
    move/from16 v0, v20

    if-eq v15, v0, :cond_4

    .line 881
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v25

    if-eqz v25, :cond_8

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 882
    :cond_8
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v22

    .line 883
    .local v22, "s":Ljava/lang/String;
    if-nez v15, :cond_9

    .line 884
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 889
    :goto_8
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 890
    const/16 v25, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 880
    add-int/lit8 v15, v15, 0x1

    goto :goto_7

    .line 886
    :cond_9
    add-int/lit8 v25, v15, -0x1

    const/16 v26, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v21

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    goto :goto_8

    .line 898
    .end local v15    # "j":I
    .end local v20    # "paramAndVarCount":I
    .end local v21    # "paramSwitchStart":I
    .end local v22    # "s":Ljava/lang/String;
    :pswitch_a
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarCount()I

    move-result v20

    .line 899
    .restart local v20    # "paramAndVarCount":I
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarConst()[Z

    move-result-object v12

    .line 900
    .local v12, "constness":[Z
    if-nez v20, :cond_a

    .line 904
    const/16 v25, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 905
    const/16 v25, 0xac

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_6

    .line 906
    :cond_a
    const/16 v25, 0x1

    move/from16 v0, v20

    move/from16 v1, v25

    if-ne v0, v1, :cond_b

    .line 909
    const/16 v25, 0x0

    aget-boolean v25, v12, v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Z)V

    .line 910
    const/16 v25, 0xac

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_6

    .line 913
    :cond_b
    const/16 v25, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 916
    const/16 v25, 0x1

    add-int/lit8 v26, v20, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v21

    .line 918
    .restart local v21    # "paramSwitchStart":I
    const/4 v15, 0x0

    .restart local v15    # "j":I
    :goto_9
    move/from16 v0, v20

    if-eq v15, v0, :cond_4

    .line 919
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/classfile/ClassFileWriter;->getStackTop()S

    move-result v25

    if-eqz v25, :cond_c

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 920
    :cond_c
    if-nez v15, :cond_d

    .line 921
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 926
    :goto_a
    aget-boolean v25, v12, v15

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Z)V

    .line 927
    const/16 v25, 0xac

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 918
    add-int/lit8 v15, v15, 0x1

    goto :goto_9

    .line 923
    :cond_d
    add-int/lit8 v25, v15, -0x1

    const/16 v26, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v21

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    goto :goto_a

    .line 935
    .end local v12    # "constness":[Z
    .end local v15    # "j":I
    .end local v20    # "paramAndVarCount":I
    .end local v21    # "paramSwitchStart":I
    :pswitch_b
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getEncodedSourceStart()I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 936
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/ast/ScriptNode;->getEncodedSourceEnd()I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 937
    const/16 v25, 0xb6

    const-string v26, "java/lang/String"

    const-string v27, "substring"

    const-string v28, "(II)Ljava/lang/String;"

    move-object/from16 v0, p1

    move/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    move-object/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 941
    const/16 v25, 0xb0

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_6

    .line 949
    .end local v18    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_e
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    goto/16 :goto_1

    .line 951
    .end local v13    # "count":I
    .end local v14    # "i":I
    .end local v17    # "methodLocals":S
    .end local v23    # "switchStackTop":I
    .end local v24    # "switchStart":I
    :cond_f
    return-void

    .line 770
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 834
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_b
        :pswitch_a
    .end packed-switch
.end method

.method private generateResumeGenerator(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 13
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    const/16 v12, 0xb0

    const/4 v11, 0x6

    const/4 v10, 0x0

    .line 406
    const/4 v1, 0x0

    .line 407
    .local v1, "hasGenerators":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v6, v6

    if-ge v2, v6, :cond_1

    .line 408
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v6, v6, v2

    invoke-static {v6}, Lorg/mozilla/javascript/optimizer/Codegen;->isGenerator(Lorg/mozilla/javascript/ast/ScriptNode;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 409
    const/4 v1, 0x1

    .line 407
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 414
    :cond_1
    if-nez v1, :cond_2

    .line 466
    :goto_1
    return-void

    .line 417
    :cond_2
    const-string v6, "resumeGenerator"

    const-string v7, "(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

    const/16 v8, 0x11

    invoke-virtual {p1, v6, v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 425
    invoke-virtual {p1, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 426
    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 427
    const/4 v6, 0x2

    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 428
    const/4 v6, 0x4

    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 429
    const/4 v6, 0x5

    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 430
    const/4 v6, 0x3

    invoke-virtual {p1, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    .line 432
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 433
    const/16 v6, 0xb4

    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "_id"

    const-string v9, "I"

    invoke-virtual {p1, v6, v7, v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p1, v10, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v4

    .line 436
    .local v4, "startSwitch":I
    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 437
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 439
    .local v0, "endlabel":I
    const/4 v2, 0x0

    :goto_2
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    array-length v6, v6

    if-ge v2, v6, :cond_4

    .line 440
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v3, v6, v2

    .line 441
    .local v3, "n":Lorg/mozilla/javascript/ast/ScriptNode;
    invoke-virtual {p1, v4, v2, v11}, Lorg/mozilla/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 442
    invoke-static {v3}, Lorg/mozilla/javascript/optimizer/Codegen;->isGenerator(Lorg/mozilla/javascript/ast/ScriptNode;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 443
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "Lorg/mozilla/javascript/Context;"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "Ljava/lang/Object;"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "Ljava/lang/Object;I)Ljava/lang/Object;"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 449
    .local v5, "type":Ljava/lang/String;
    const/16 v6, 0xb8

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/optimizer/Codegen;->getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "_gen"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v6, v7, v8, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    invoke-virtual {p1, v12}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 439
    .end local v5    # "type":Ljava/lang/String;
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 455
    :cond_3
    const/16 v6, 0xa7

    invoke-virtual {p1, v6, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_3

    .line 459
    .end local v3    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_4
    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 460
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Codegen;->pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 461
    invoke-virtual {p1, v12}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 465
    invoke-virtual {p1, v11}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    goto/16 :goto_1
.end method

.method private generateScriptCtor(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 5
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    const/4 v4, 0x1

    .line 632
    const-string v0, "<init>"

    const-string v1, "()V"

    invoke-virtual {p1, v0, v1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 634
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 635
    const/16 v0, 0xb7

    const-string v1, "org.mozilla.javascript.NativeFunction"

    const-string v2, "<init>"

    const-string v3, "()V"

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadThis()V

    .line 639
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 640
    const/16 v0, 0xb5

    invoke-virtual {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "_id"

    const-string v3, "I"

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    const/16 v0, 0xb1

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 644
    invoke-virtual {p1, v4}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 645
    return-void
.end method

.method private static getStaticConstantWrapperType(D)Ljava/lang/String;
    .locals 4
    .param p0, "num"    # D

    .prologue
    .line 1126
    double-to-int v0, p0

    .line 1127
    .local v0, "inum":I
    int-to-double v2, v0

    cmpl-double v1, v2, p0

    if-nez v1, :cond_0

    .line 1128
    const-string v1, "Ljava/lang/Integer;"

    .line 1130
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "Ljava/lang/Double;"

    goto :goto_0
.end method

.method private static initOptFunctions_r(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 4
    .param p0, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 231
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .local v0, "N":I
    :goto_0
    if-eq v2, v0, :cond_0

    .line 232
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v1

    .line 233
    .local v1, "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    new-instance v3, Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    invoke-direct {v3, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;-><init>(Lorg/mozilla/javascript/ast/FunctionNode;)V

    .line 234
    invoke-static {v1}, Lorg/mozilla/javascript/optimizer/Codegen;->initOptFunctions_r(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 231
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 236
    .end local v1    # "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    :cond_0
    return-void
.end method

.method private initScriptNodesData(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 5
    .param p1, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 240
    new-instance v2, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v2}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    .line 241
    .local v2, "x":Lorg/mozilla/javascript/ObjArray;
    invoke-static {p1, v2}, Lorg/mozilla/javascript/optimizer/Codegen;->collectScriptNodes_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/ObjArray;)V

    .line 243
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v0

    .line 244
    .local v0, "count":I
    new-array v3, v0, [Lorg/mozilla/javascript/ast/ScriptNode;

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    .line 245
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;)V

    .line 247
    new-instance v3, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v3, v0}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnIndexes:Lorg/mozilla/javascript/ObjToIntMap;

    .line 248
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 249
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnIndexes:Lorg/mozilla/javascript/ObjToIntMap;

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnNodes:[Lorg/mozilla/javascript/ast/ScriptNode;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4, v1}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 248
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 251
    :cond_0
    return-void
.end method

.method static isGenerator(Lorg/mozilla/javascript/ast/ScriptNode;)Z
    .locals 2
    .param p0, "node"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 388
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v0

    const/16 v1, 0x6d

    if-ne v0, v1, :cond_0

    check-cast p0, Lorg/mozilla/javascript/ast/FunctionNode;

    .end local p0    # "node":Lorg/mozilla/javascript/ast/ScriptNode;
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->isGenerator()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static pushUndefined(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 4
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 1135
    const/16 v0, 0xb2

    const-string v1, "org/mozilla/javascript/Undefined"

    const-string v2, "instance"

    const-string v3, "Ljava/lang/Object;"

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1137
    return-void
.end method

.method private reportClassFileFormatException(Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 5
    .param p1, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 176
    instance-of v1, p1, Lorg/mozilla/javascript/ast/FunctionNode;

    if-eqz v1, :cond_0

    const-string v2, "msg.while.compiling.fn"

    move-object v1, p1

    check-cast v1, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionName()Lorg/mozilla/javascript/ast/Name;

    move-result-object v1

    invoke-static {v2, v1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "msg":Ljava/lang/String;
    :goto_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getLineno()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    return-object v1

    .line 176
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    const-string v1, "msg.while.compiling.script"

    invoke-static {v1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private transform(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .locals 9
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 186
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Codegen;->initOptFunctions_r(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 188
    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/Codegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v7}, Lorg/mozilla/javascript/CompilerEnvirons;->getOptimizationLevel()I

    move-result v4

    .line 190
    .local v4, "optLevel":I
    const/4 v6, 0x0

    .line 191
    .local v6, "possibleDirectCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/optimizer/OptFunctionNode;>;"
    if-lez v4, :cond_2

    .line 197
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v7

    const/16 v8, 0x88

    if-ne v7, v8, :cond_2

    .line 198
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .line 199
    .local v0, "functionCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_2

    .line 200
    invoke-static {p1, v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;I)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v3

    .line 201
    .local v3, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    iget-object v7, v3, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_1

    .line 204
    iget-object v7, v3, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v2

    .line 205
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_1

    .line 206
    if-nez v6, :cond_0

    .line 207
    new-instance v6, Ljava/util/HashMap;

    .end local v6    # "possibleDirectCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/optimizer/OptFunctionNode;>;"
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 209
    .restart local v6    # "possibleDirectCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/optimizer/OptFunctionNode;>;"
    :cond_0
    invoke-interface {v6, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 216
    .end local v0    # "functionCount":I
    .end local v1    # "i":I
    .end local v3    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    :cond_2
    if-eqz v6, :cond_3

    .line 217
    new-instance v7, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v7}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v7, p0, Lorg/mozilla/javascript/optimizer/Codegen;->directCallTargets:Lorg/mozilla/javascript/ObjArray;

    .line 220
    :cond_3
    new-instance v5, Lorg/mozilla/javascript/optimizer/OptTransformer;

    iget-object v7, p0, Lorg/mozilla/javascript/optimizer/Codegen;->directCallTargets:Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v5, v6, v7}, Lorg/mozilla/javascript/optimizer/OptTransformer;-><init>(Ljava/util/Map;Lorg/mozilla/javascript/ObjArray;)V

    .line 222
    .local v5, "ot":Lorg/mozilla/javascript/optimizer/OptTransformer;
    invoke-virtual {v5, p1}, Lorg/mozilla/javascript/optimizer/OptTransformer;->transform(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 224
    if-lez v4, :cond_4

    .line 225
    new-instance v7, Lorg/mozilla/javascript/optimizer/Optimizer;

    invoke-direct {v7}, Lorg/mozilla/javascript/optimizer/Optimizer;-><init>()V

    invoke-virtual {v7, p1}, Lorg/mozilla/javascript/optimizer/Optimizer;->optimize(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 227
    :cond_4
    return-void
.end method


# virtual methods
.method public captureStackInfo(Lorg/mozilla/javascript/RhinoException;)V
    .locals 1
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    .line 36
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method cleanName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;
    .locals 3
    .param p1, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 1159
    const-string v1, ""

    .line 1160
    .local v1, "result":Ljava/lang/String;
    instance-of v2, p1, Lorg/mozilla/javascript/ast/FunctionNode;

    if-eqz v2, :cond_1

    .line 1161
    check-cast p1, Lorg/mozilla/javascript/ast/FunctionNode;

    .end local p1    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionName()Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    .line 1162
    .local v0, "name":Lorg/mozilla/javascript/ast/Name;
    if-nez v0, :cond_0

    .line 1163
    const-string v1, "anonymous"

    .line 1170
    .end local v0    # "name":Lorg/mozilla/javascript/ast/Name;
    :goto_0
    return-object v1

    .line 1165
    .restart local v0    # "name":Lorg/mozilla/javascript/ast/Name;
    :cond_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1168
    .end local v0    # "name":Lorg/mozilla/javascript/ast/Name;
    .restart local p1    # "n":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_1
    const-string v1, "script"

    goto :goto_0
.end method

.method public compile(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 10
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .prologue
    const/4 v9, 0x0

    .line 61
    sget-object v1, Lorg/mozilla/javascript/optimizer/Codegen;->globalLock:Ljava/lang/Object;

    monitor-enter v1

    .line 62
    :try_start_0
    sget v0, Lorg/mozilla/javascript/optimizer/Codegen;->globalSerialClassCounter:I

    add-int/lit8 v8, v0, 0x1

    sput v8, Lorg/mozilla/javascript/optimizer/Codegen;->globalSerialClassCounter:I

    .line 63
    .local v8, "serial":I
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    const-string v6, "c"

    .line 66
    .local v6, "baseName":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 67
    invoke-virtual {p2}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\W"

    const-string v3, "_"

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 68
    invoke-virtual {v6, v9}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "org.mozilla.javascript.gen."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .local v2, "mainClassName":Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    .line 75
    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/optimizer/Codegen;->compileToClassFile(Lorg/mozilla/javascript/CompilerEnvirons;Ljava/lang/String;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)[B

    move-result-object v7

    .line 79
    .local v7, "mainClassBytes":[B
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v2, v0, v9

    const/4 v1, 0x1

    aput-object v7, v0, v1

    return-object v0

    .line 63
    .end local v2    # "mainClassName":Ljava/lang/String;
    .end local v6    # "baseName":Ljava/lang/String;
    .end local v7    # "mainClassBytes":[B
    .end local v8    # "serial":I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public compileToClassFile(Lorg/mozilla/javascript/CompilerEnvirons;Ljava/lang/String;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)[B
    .locals 2
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;
    .param p2, "mainClassName"    # Ljava/lang/String;
    .param p3, "scriptOrFn"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p4, "encodedSource"    # Ljava/lang/String;
    .param p5, "returnFunction"    # Z

    .prologue
    .line 147
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 149
    invoke-direct {p0, p3}, Lorg/mozilla/javascript/optimizer/Codegen;->transform(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 155
    if-eqz p5, :cond_0

    .line 156
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object p3

    .line 159
    :cond_0
    invoke-direct {p0, p3}, Lorg/mozilla/javascript/optimizer/Codegen;->initScriptNodesData(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 161
    iput-object p2, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 162
    invoke-static {p2}, Lorg/mozilla/classfile/ClassFileWriter;->classNameToSignature(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    .line 166
    :try_start_0
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/optimizer/Codegen;->generateCode(Ljava/lang/String;)[B
    :try_end_0
    .catch Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;
    invoke-virtual {v0}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p3, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->reportClassFileFormatException(Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public createFunctionObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/Function;
    .locals 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "bytecode"    # Ljava/lang/Object;
    .param p4, "staticSecurityDomain"    # Ljava/lang/Object;

    .prologue
    .line 101
    invoke-direct {p0, p3, p4}, Lorg/mozilla/javascript/optimizer/Codegen;->defineClass(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 105
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v1, v5, v6

    .line 106
    .local v1, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v5, 0x3

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    const/4 v5, 0x2

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    .line 107
    .local v4, "initArgs":[Ljava/lang/Object;
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/NativeFunction;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .local v3, "f":Lorg/mozilla/javascript/NativeFunction;
    return-object v3

    .line 108
    .end local v1    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v3    # "f":Lorg/mozilla/javascript/NativeFunction;
    .end local v4    # "initArgs":[Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 109
    .local v2, "ex":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to instantiate compiled class:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/Script;
    .locals 6
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/optimizer/Codegen;->defineClass(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 89
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/Script;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .local v2, "script":Lorg/mozilla/javascript/Script;
    return-object v2

    .line 90
    .end local v2    # "script":Lorg/mozilla/javascript/Script;
    :catch_0
    move-exception v1

    .line 91
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to instantiate compiled class:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method getBodyMethodName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 1151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_c_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/Codegen;->cleanName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/Codegen;->getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getBodyMethodSignature(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;
    .locals 6
    .param p1, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 1175
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1176
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/16 v4, 0x28

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1177
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1178
    const-string v4, "Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1181
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v4

    const/16 v5, 0x6d

    if-ne v4, v5, :cond_0

    .line 1182
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->get(Lorg/mozilla/javascript/ast/ScriptNode;)Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    move-result-object v1

    .line 1183
    .local v1, "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    invoke-virtual {v1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1184
    iget-object v4, v1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v2

    .line 1185
    .local v2, "pCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, v2, :cond_0

    .line 1186
    const-string v4, "Ljava/lang/Object;D"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1185
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1190
    .end local v0    # "i":I
    .end local v1    # "ofn":Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .end local v2    # "pCount":I
    :cond_0
    const-string v4, "[Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1191
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method getCompiledRegexpName(Lorg/mozilla/javascript/ast/ScriptNode;I)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p2, "regexpIndex"    # I

    .prologue
    .line 1201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_re"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/Codegen;->getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getDirectCtorName(Lorg/mozilla/javascript/ast/ScriptNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 1146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/Codegen;->getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getFunctionInitMethodName(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)Ljava/lang/String;
    .locals 2
    .param p1, "ofn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .prologue
    .line 1196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_i"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/optimizer/Codegen;->getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getIndex(Lorg/mozilla/javascript/ast/ScriptNode;)I
    .locals 1
    .param p1, "n"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 1141
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/Codegen;->scriptOrFnIndexes:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ObjToIntMap;->getExisting(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getPatchedStack(Lorg/mozilla/javascript/RhinoException;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;
    .param p2, "nativeStackTrace"    # Ljava/lang/String;

    .prologue
    .line 44
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getScriptStack(Lorg/mozilla/javascript/RhinoException;)Ljava/util/List;
    .locals 1
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
    .line 48
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getSourcePositionFromStack(Lorg/mozilla/javascript/Context;[I)Ljava/lang/String;
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "linep"    # [I

    .prologue
    .line 40
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method pushNumberAsObject(Lorg/mozilla/classfile/ClassFileWriter;D)V
    .locals 12
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p2, "num"    # D

    .prologue
    const/4 v9, 0x0

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    const-wide/16 v10, 0x0

    const/16 v8, 0xb2

    .line 1055
    cmpl-double v5, p2, v10

    if-nez v5, :cond_1

    .line 1056
    div-double/2addr v6, p2

    cmpl-double v5, v6, v10

    if-lez v5, :cond_0

    .line 1058
    const-string v5, "org/mozilla/javascript/optimizer/OptRuntime"

    const-string v6, "zeroObj"

    const-string v7, "Ljava/lang/Double;"

    invoke-virtual {p1, v8, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    :goto_0
    return-void

    .line 1062
    :cond_0
    invoke-virtual {p1, p2, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 1063
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Codegen;->addDoubleWrap(Lorg/mozilla/classfile/ClassFileWriter;)V

    goto :goto_0

    .line 1066
    :cond_1
    cmpl-double v5, p2, v6

    if-nez v5, :cond_2

    .line 1067
    const-string v5, "org/mozilla/javascript/optimizer/OptRuntime"

    const-string v6, "oneObj"

    const-string v7, "Ljava/lang/Double;"

    invoke-virtual {p1, v8, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1072
    :cond_2
    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    cmpl-double v5, p2, v6

    if-nez v5, :cond_3

    .line 1073
    const-string v5, "org/mozilla/javascript/optimizer/OptRuntime"

    const-string v6, "minusOneObj"

    const-string v7, "Ljava/lang/Double;"

    invoke-virtual {p1, v8, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1077
    :cond_3
    cmpl-double v5, p2, p2

    if-eqz v5, :cond_4

    .line 1078
    const-string v5, "org/mozilla/javascript/ScriptRuntime"

    const-string v6, "NaNobj"

    const-string v7, "Ljava/lang/Double;"

    invoke-virtual {p1, v8, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1082
    :cond_4
    iget v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantListSize:I

    const/16 v6, 0x7d0

    if-lt v5, v6, :cond_5

    .line 1087
    invoke-virtual {p1, p2, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(D)V

    .line 1088
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Codegen;->addDoubleWrap(Lorg/mozilla/classfile/ClassFileWriter;)V

    goto :goto_0

    .line 1091
    :cond_5
    iget v0, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantListSize:I

    .line 1092
    .local v0, "N":I
    const/4 v4, 0x0

    .line 1093
    .local v4, "index":I
    if-nez v0, :cond_8

    .line 1094
    const/16 v5, 0x40

    new-array v5, v5, [D

    iput-object v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantList:[D

    .line 1106
    :cond_6
    :goto_1
    if-ne v4, v0, :cond_7

    .line 1107
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantList:[D

    aput-wide p2, v5, v0

    .line 1108
    add-int/lit8 v5, v0, 0x1

    iput v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantListSize:I

    .line 1110
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_k"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1111
    .local v2, "constantName":Ljava/lang/String;
    invoke-static {p2, p3}, Lorg/mozilla/javascript/optimizer/Codegen;->getStaticConstantWrapperType(D)Ljava/lang/String;

    move-result-object v3

    .line 1112
    .local v3, "constantType":Ljava/lang/String;
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {p1, v8, v5, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1096
    .end local v2    # "constantName":Ljava/lang/String;
    .end local v3    # "constantType":Ljava/lang/String;
    :cond_8
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantList:[D

    .line 1097
    .local v1, "array":[D
    :goto_2
    if-eq v4, v0, :cond_9

    aget-wide v6, v1, v4

    cmpl-double v5, v6, p2

    if-eqz v5, :cond_9

    .line 1098
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1100
    :cond_9
    array-length v5, v1

    if-ne v0, v5, :cond_6

    .line 1101
    mul-int/lit8 v5, v0, 0x2

    new-array v1, v5, [D

    .line 1102
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantList:[D

    invoke-static {v5, v9, v1, v9, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1103
    iput-object v1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->itsConstantList:[D

    goto :goto_1
.end method

.method public setEvalScriptFlag(Lorg/mozilla/javascript/Script;)V
    .locals 1
    .param p1, "script"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 52
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setMainMethodClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1211
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/Codegen;->mainMethodClass:Ljava/lang/String;

    .line 1212
    return-void
.end method
