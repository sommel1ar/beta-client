.class public abstract Lorg/mozilla/javascript/NativeFunction;
.super Lorg/mozilla/javascript/BaseFunction;
.source "NativeFunction.java"


# static fields
.field static final serialVersionUID:J = 0x78edfb41ce2c09d1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    return-void
.end method


# virtual methods
.method final decompile(II)Ljava/lang/String;
    .locals 3
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .prologue
    const/4 v2, 0x1

    .line 34
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeFunction;->getEncodedSource()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "encodedSource":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 36
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v2

    .line 40
    :goto_0
    return-object v2

    .line 38
    :cond_0
    new-instance v1, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/UintMap;-><init>(I)V

    .line 39
    .local v1, "properties":Lorg/mozilla/javascript/UintMap;
    invoke-virtual {v1, v2, p1}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 40
    invoke-static {v0, p2, v1}, Lorg/mozilla/javascript/Decompiler;->decompile(Ljava/lang/String;ILorg/mozilla/javascript/UintMap;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getArity()I
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeFunction;->getParamCount()I

    move-result v0

    return v0
.end method

.method public getDebuggableView()Lorg/mozilla/javascript/debug/DebuggableScript;
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEncodedSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract getLanguageVersion()I
.end method

.method public getLength()I
    .locals 5

    .prologue
    .line 47
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeFunction;->getParamCount()I

    move-result v2

    .line 48
    .local v2, "paramCount":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeFunction;->getLanguageVersion()I

    move-result v3

    const/16 v4, 0x78

    if-eq v3, v4, :cond_1

    .line 56
    .end local v2    # "paramCount":I
    :cond_0
    :goto_0
    return v2

    .line 51
    .restart local v2    # "paramCount":I
    :cond_1
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 52
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->findFunctionActivation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/NativeCall;

    move-result-object v0

    .line 53
    .local v0, "activation":Lorg/mozilla/javascript/NativeCall;
    if-eqz v0, :cond_0

    .line 56
    iget-object v3, v0, Lorg/mozilla/javascript/NativeCall;->originalArgs:[Ljava/lang/Object;

    array-length v2, v3

    goto :goto_0
.end method

.method protected abstract getParamAndVarCount()I
.end method

.method protected abstract getParamCount()I
.end method

.method protected getParamOrVarConst(I)Z
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract getParamOrVarName(I)Ljava/lang/String;
.end method

.method public final initScriptFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V
    .locals 0
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 23
    invoke-static {p0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V

    .line 24
    return-void
.end method

.method public jsGet_name()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public resumeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "operation"    # I
    .param p4, "state"    # Ljava/lang/Object;
    .param p5, "value"    # Ljava/lang/Object;

    .prologue
    .line 101
    new-instance v0, Lorg/mozilla/javascript/EvaluatorException;

    const-string v1, "resumeGenerator() not implemented"

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/EvaluatorException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
