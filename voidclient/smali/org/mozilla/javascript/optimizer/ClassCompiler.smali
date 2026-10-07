.class public Lorg/mozilla/javascript/optimizer/ClassCompiler;
.super Ljava/lang/Object;
.source "ClassCompiler.java"


# instance fields
.field private compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

.field private mainMethodClassName:Ljava/lang/String;

.field private targetExtends:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private targetImplements:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/CompilerEnvirons;)V
    .locals 1
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 30
    :cond_0
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 31
    const-string v0, "org.mozilla.javascript.optimizer.OptRuntime"

    iput-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public compileToClassFiles(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)[Ljava/lang/Object;
    .locals 23
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "sourceLocation"    # Ljava/lang/String;
    .param p3, "lineno"    # I
    .param p4, "mainClassName"    # Ljava/lang/String;

    .prologue
    .line 133
    new-instance v20, Lorg/mozilla/javascript/Parser;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/Parser;-><init>(Lorg/mozilla/javascript/CompilerEnvirons;)V

    .line 134
    .local v20, "p":Lorg/mozilla/javascript/Parser;
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/Parser;->parse(Ljava/lang/String;Ljava/lang/String;I)Lorg/mozilla/javascript/ast/AstRoot;

    move-result-object v10

    .line 135
    .local v10, "ast":Lorg/mozilla/javascript/ast/AstRoot;
    new-instance v15, Lorg/mozilla/javascript/IRFactory;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-direct {v15, v5}, Lorg/mozilla/javascript/IRFactory;-><init>(Lorg/mozilla/javascript/CompilerEnvirons;)V

    .line 136
    .local v15, "irf":Lorg/mozilla/javascript/IRFactory;
    invoke-virtual {v15, v10}, Lorg/mozilla/javascript/IRFactory;->transformTree(Lorg/mozilla/javascript/ast/AstRoot;)Lorg/mozilla/javascript/ast/ScriptNode;

    move-result-object v7

    .line 139
    .local v7, "tree":Lorg/mozilla/javascript/ast/ScriptNode;
    const/4 v15, 0x0

    .line 140
    const/4 v10, 0x0

    .line 141
    const/16 v20, 0x0

    .line 143
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->getTargetExtends()Ljava/lang/Class;

    move-result-object v22

    .line 144
    .local v22, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->getTargetImplements()[Ljava/lang/Class;

    move-result-object v14

    .line 146
    .local v14, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-nez v14, :cond_0

    if-nez v22, :cond_0

    const/16 v16, 0x1

    .line 147
    .local v16, "isPrimary":Z
    :goto_0
    if-eqz v16, :cond_1

    .line 148
    move-object/from16 v6, p4

    .line 153
    .local v6, "scriptClassName":Ljava/lang/String;
    :goto_1
    new-instance v4, Lorg/mozilla/javascript/optimizer/Codegen;

    invoke-direct {v4}, Lorg/mozilla/javascript/optimizer/Codegen;-><init>()V

    .line 154
    .local v4, "codegen":Lorg/mozilla/javascript/optimizer/Codegen;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/optimizer/Codegen;->setMainMethodClass(Ljava/lang/String;)V

    .line 155
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/ScriptNode;->getEncodedSource()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Lorg/mozilla/javascript/optimizer/Codegen;->compileToClassFile(Lorg/mozilla/javascript/CompilerEnvirons;Ljava/lang/String;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)[B

    move-result-object v21

    .line 160
    .local v21, "scriptClassBytes":[B
    if-eqz v16, :cond_2

    .line 161
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v6, v5, v8

    const/4 v8, 0x1

    aput-object v21, v5, v8

    .line 180
    :goto_2
    return-object v5

    .line 146
    .end local v4    # "codegen":Lorg/mozilla/javascript/optimizer/Codegen;
    .end local v6    # "scriptClassName":Ljava/lang/String;
    .end local v16    # "isPrimary":Z
    .end local v21    # "scriptClassBytes":[B
    :cond_0
    const/16 v16, 0x0

    goto :goto_0

    .line 150
    .restart local v16    # "isPrimary":Z
    :cond_1
    const-string v5, "1"

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1, v5}, Lorg/mozilla/javascript/optimizer/ClassCompiler;->makeAuxiliaryClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "scriptClassName":Ljava/lang/String;
    goto :goto_1

    .line 163
    .restart local v4    # "codegen":Lorg/mozilla/javascript/optimizer/Codegen;
    .restart local v21    # "scriptClassBytes":[B
    :cond_2
    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v11

    .line 164
    .local v11, "functionCount":I
    new-instance v12, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v12, v11}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    .line 165
    .local v12, "functionNames":Lorg/mozilla/javascript/ObjToIntMap;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_3
    if-eq v13, v11, :cond_4

    .line 166
    invoke-virtual {v7, v13}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v19

    .line 167
    .local v19, "ofn":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v18

    .line 168
    .local v18, "name":Ljava/lang/String;
    if-eqz v18, :cond_3

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3

    .line 169
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v5

    move-object/from16 v0, v18

    invoke-virtual {v12, v0, v5}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 165
    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 172
    .end local v18    # "name":Ljava/lang/String;
    .end local v19    # "ofn":Lorg/mozilla/javascript/ast/FunctionNode;
    :cond_4
    if-nez v22, :cond_5

    .line 173
    sget-object v22, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    .line 175
    :cond_5
    move-object/from16 v0, p4

    move-object/from16 v1, v22

    invoke-static {v12, v0, v1, v14, v6}, Lorg/mozilla/javascript/JavaAdapter;->createAdapterCode(Lorg/mozilla/javascript/ObjToIntMap;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;Ljava/lang/String;)[B

    move-result-object v17

    .line 180
    .local v17, "mainClassBytes":[B
    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p4, v5, v8

    const/4 v8, 0x1

    aput-object v17, v5, v8

    const/4 v8, 0x2

    aput-object v6, v5, v8

    const/4 v8, 0x3

    aput-object v21, v5, v8

    goto :goto_2
.end method

.method public getCompilerEnv()Lorg/mozilla/javascript/CompilerEnvirons;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    return-object v0
.end method

.method public getMainMethodClass()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetExtends()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->targetExtends:Ljava/lang/Class;

    return-object v0
.end method

.method public getTargetImplements()[Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->targetImplements:[Ljava/lang/Class;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->targetImplements:[Ljava/lang/Class;

    invoke-virtual {v0}, [Ljava/lang/Class;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    check-cast v0, [Ljava/lang/Class;

    goto :goto_0
.end method

.method protected makeAuxiliaryClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "mainClassName"    # Ljava/lang/String;
    .param p2, "auxMarker"    # Ljava/lang/String;

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setMainMethodClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setTargetExtends(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "extendsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->targetExtends:Ljava/lang/Class;

    .line 81
    return-void
.end method

.method public setTargetImplements([Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "implementsClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lorg/mozilla/javascript/optimizer/ClassCompiler;->targetImplements:[Ljava/lang/Class;

    .line 100
    return-void

    .line 99
    :cond_0
    invoke-virtual {p1}, [Ljava/lang/Class;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    check-cast v0, [Ljava/lang/Class;

    goto :goto_0
.end method
