.class final Lorg/mozilla/javascript/Arguments;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "Arguments.java"


# static fields
.field private static final FTAG:Ljava/lang/String; = "Arguments"

.field private static final Id_callee:I = 0x1

.field private static final Id_caller:I = 0x3

.field private static final Id_length:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x3

.field static final serialVersionUID:J = 0x3b55a7e02ae0c5a1L


# instance fields
.field private activation:Lorg/mozilla/javascript/NativeCall;

.field private args:[Ljava/lang/Object;

.field private calleeAttr:I

.field private calleeObj:Ljava/lang/Object;

.field private callerAttr:I

.field private callerObj:Ljava/lang/Object;

.field private lengthAttr:I

.field private lengthObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/NativeCall;)V
    .locals 4
    .param p1, "activation"    # Lorg/mozilla/javascript/NativeCall;

    .prologue
    const/4 v3, 0x2

    .line 24
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 373
    iput v3, p0, Lorg/mozilla/javascript/Arguments;->callerAttr:I

    .line 374
    iput v3, p0, Lorg/mozilla/javascript/Arguments;->calleeAttr:I

    .line 375
    iput v3, p0, Lorg/mozilla/javascript/Arguments;->lengthAttr:I

    .line 25
    iput-object p1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    .line 27
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeCall;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 28
    .local v1, "parent":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Arguments;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 29
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptableObject;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Arguments;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 31
    iget-object v3, p1, Lorg/mozilla/javascript/NativeCall;->originalArgs:[Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    .line 32
    iget-object v3, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lorg/mozilla/javascript/Arguments;->lengthObj:Ljava/lang/Object;

    .line 34
    iget-object v0, p1, Lorg/mozilla/javascript/NativeCall;->function:Lorg/mozilla/javascript/NativeFunction;

    .line 35
    .local v0, "f":Lorg/mozilla/javascript/NativeFunction;
    iput-object v0, p0, Lorg/mozilla/javascript/Arguments;->calleeObj:Ljava/lang/Object;

    .line 37
    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeFunction;->getLanguageVersion()I

    move-result v2

    .line 38
    .local v2, "version":I
    const/16 v3, 0x82

    if-gt v2, v3, :cond_0

    if-eqz v2, :cond_0

    .line 41
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/mozilla/javascript/Arguments;->callerObj:Ljava/lang/Object;

    .line 45
    :goto_0
    return-void

    .line 43
    :cond_0
    sget-object v3, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/Arguments;->callerObj:Ljava/lang/Object;

    goto :goto_0
.end method

.method private arg(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 54
    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v0, v0

    if-gt v0, p1, :cond_1

    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    .line 55
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    aget-object v0, v0, p1

    goto :goto_0
.end method

.method private getFromActivation(I)Ljava/lang/Object;
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 66
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v1, v1, Lorg/mozilla/javascript/NativeCall;->function:Lorg/mozilla/javascript/NativeFunction;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "argName":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v2, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    invoke-virtual {v1, v0, v2}, Lorg/mozilla/javascript/NativeCall;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private putIntoActivation(ILjava/lang/Object;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 61
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v1, v1, Lorg/mozilla/javascript/NativeCall;->function:Lorg/mozilla/javascript/NativeFunction;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "argName":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v2, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    invoke-virtual {v1, v0, v2, p2}, Lorg/mozilla/javascript/NativeCall;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 63
    return-void
.end method

.method private removeArg(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 83
    monitor-enter p0

    .line 84
    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    .line 85
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v1, v1, Lorg/mozilla/javascript/NativeCall;->originalArgs:[Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 86
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    .line 88
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    sget-object v1, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    aput-object v1, v0, p1

    .line 90
    :cond_1
    monitor-exit p0

    .line 91
    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private replaceArg(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->sharedWithActivation(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/Arguments;->putIntoActivation(ILjava/lang/Object;)V

    .line 74
    :cond_0
    monitor-enter p0

    .line 75
    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v1, v1, Lorg/mozilla/javascript/NativeCall;->originalArgs:[Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 76
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    .line 78
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    aput-object p2, v0, p1

    .line 79
    monitor-exit p0

    .line 80
    return-void

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private sharedWithActivation(I)Z
    .locals 6
    .param p1, "index"    # I

    .prologue
    const/4 v4, 0x0

    .line 121
    iget-object v5, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v2, v5, Lorg/mozilla/javascript/NativeCall;->function:Lorg/mozilla/javascript/NativeFunction;

    .line 122
    .local v2, "f":Lorg/mozilla/javascript/NativeFunction;
    invoke-virtual {v2}, Lorg/mozilla/javascript/NativeFunction;->getParamCount()I

    move-result v1

    .line 123
    .local v1, "definedCount":I
    if-ge p1, v1, :cond_0

    .line 126
    add-int/lit8 v5, v1, -0x1

    if-ge p1, v5, :cond_2

    .line 127
    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v0

    .line 128
    .local v0, "argName":Ljava/lang/String;
    add-int/lit8 v3, p1, 0x1

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 129
    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 136
    .end local v0    # "argName":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_0
    :goto_1
    return v4

    .line 128
    .restart local v0    # "argName":Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 134
    .end local v0    # "argName":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_2
    const/4 v4, 0x1

    goto :goto_1
.end method


# virtual methods
.method protected defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V
    .locals 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p4, "checkValid"    # Z

    .prologue
    .line 340
    invoke-super {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/IdScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 342
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 343
    .local v0, "d":D
    double-to-int v2, v0

    .line 344
    .local v2, "index":I
    int-to-double v6, v2

    cmpl-double v5, v0, v6

    if-eqz v5, :cond_1

    .line 362
    :cond_0
    :goto_0
    return-void

    .line 346
    :cond_1
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v4

    .line 347
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v5, :cond_0

    .line 349
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/Arguments;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 350
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Arguments;->removeArg(I)V

    goto :goto_0

    .line 354
    :cond_2
    const-string v5, "value"

    invoke-static {p3, v5}, Lorg/mozilla/javascript/Arguments;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 355
    .local v3, "newValue":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v5, :cond_0

    .line 357
    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/Arguments;->replaceArg(ILjava/lang/Object;)V

    .line 359
    const-string v5, "writable"

    invoke-static {p3, v5}, Lorg/mozilla/javascript/Arguments;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lorg/mozilla/javascript/Arguments;->isFalse(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 360
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Arguments;->removeArg(I)V

    goto :goto_0
.end method

.method public delete(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 152
    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 153
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->removeArg(I)V

    .line 155
    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->delete(I)V

    .line 156
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 178
    const/4 v3, 0x0

    .local v3, "id":I
    const/4 v0, 0x0

    .line 179
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 180
    .local v4, "s_length":I
    const/4 v5, 0x6

    if-ne v4, v5, :cond_0

    .line 181
    const/4 v5, 0x5

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 182
    .local v2, "c":I
    const/16 v5, 0x65

    if-ne v2, v5, :cond_2

    const-string v0, "callee"

    const/4 v3, 0x1

    .line 186
    .end local v2    # "c":I
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v3, 0x0

    .line 191
    :cond_1
    if-nez v3, :cond_4

    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v5

    .line 206
    :goto_1
    return v5

    .line 183
    .restart local v2    # "c":I
    :cond_2
    const/16 v5, 0x68

    if-ne v2, v5, :cond_3

    const-string v0, "length"

    const/4 v3, 0x2

    goto :goto_0

    .line 184
    :cond_3
    const/16 v5, 0x72

    if-ne v2, v5, :cond_0

    const-string v0, "caller"

    const/4 v3, 0x3

    goto :goto_0

    .line 194
    .end local v2    # "c":I
    :cond_4
    packed-switch v3, :pswitch_data_0

    .line 204
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 196
    :pswitch_0
    iget v1, p0, Lorg/mozilla/javascript/Arguments;->calleeAttr:I

    .line 206
    .local v1, "attr":I
    :goto_2
    invoke-static {v1, v3}, Lorg/mozilla/javascript/Arguments;->instanceIdInfo(II)I

    move-result v5

    goto :goto_1

    .line 199
    .end local v1    # "attr":I
    :pswitch_1
    iget v1, p0, Lorg/mozilla/javascript/Arguments;->callerAttr:I

    .line 200
    .restart local v1    # "attr":I
    goto :goto_2

    .line 202
    .end local v1    # "attr":I
    :pswitch_2
    iget v1, p0, Lorg/mozilla/javascript/Arguments;->lengthAttr:I

    .line 203
    .restart local v1    # "attr":I
    goto :goto_2

    .line 194
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 107
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v0

    .line 108
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 109
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 114
    .end local v0    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v0

    .line 111
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_1
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->sharedWithActivation(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->getFromActivation(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    const-string v0, "Arguments"

    return-object v0
.end method

.method getIds(Z)[Ljava/lang/Object;
    .locals 10
    .param p1, "getAll"    # Z

    .prologue
    const/4 v9, 0x1

    .line 270
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getIds(Z)[Ljava/lang/Object;

    move-result-object v3

    .line 271
    .local v3, "ids":[Ljava/lang/Object;
    iget-object v8, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v8, v8

    if-eqz v8, :cond_7

    .line 272
    iget-object v8, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v8, v8

    new-array v6, v8, [Z

    .line 273
    .local v6, "present":[Z
    iget-object v8, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v0, v8

    .line 274
    .local v0, "extraCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v8, v3

    if-eq v1, v8, :cond_1

    .line 275
    aget-object v2, v3, v1

    .line 276
    .local v2, "id":Ljava/lang/Object;
    instance-of v8, v2, Ljava/lang/Integer;

    if-eqz v8, :cond_0

    .line 277
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "id":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 278
    .local v4, "index":I
    if-ltz v4, :cond_0

    iget-object v8, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v8, v8

    if-ge v4, v8, :cond_0

    .line 279
    aget-boolean v8, v6, v4

    if-nez v8, :cond_0

    .line 280
    aput-boolean v9, v6, v4

    .line 281
    add-int/lit8 v0, v0, -0x1

    .line 274
    .end local v4    # "index":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 286
    :cond_1
    if-nez p1, :cond_3

    .line 287
    const/4 v1, 0x0

    :goto_1
    array-length v8, v6

    if-ge v1, v8, :cond_3

    .line 288
    aget-boolean v8, v6, v1

    if-nez v8, :cond_2

    invoke-super {p0, v1, p0}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 289
    aput-boolean v9, v6, v1

    .line 290
    add-int/lit8 v0, v0, -0x1

    .line 287
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 294
    :cond_3
    if-eqz v0, :cond_7

    .line 295
    array-length v8, v3

    add-int/2addr v8, v0

    new-array v7, v8, [Ljava/lang/Object;

    .line 296
    .local v7, "tmp":[Ljava/lang/Object;
    const/4 v8, 0x0

    array-length v9, v3

    invoke-static {v3, v8, v7, v0, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 297
    move-object v3, v7

    .line 298
    const/4 v5, 0x0

    .line 299
    .local v5, "offset":I
    const/4 v1, 0x0

    :goto_2
    iget-object v8, p0, Lorg/mozilla/javascript/Arguments;->args:[Ljava/lang/Object;

    array-length v8, v8

    if-eq v1, v8, :cond_6

    .line 300
    if-eqz v6, :cond_4

    aget-boolean v8, v6, v1

    if-nez v8, :cond_5

    .line 301
    :cond_4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v3, v5

    .line 302
    add-int/lit8 v5, v5, 0x1

    .line 299
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 305
    :cond_6
    if-eq v5, v0, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 308
    .end local v0    # "extraCount":I
    .end local v1    # "i":I
    .end local v5    # "offset":I
    .end local v6    # "present":[Z
    .end local v7    # "tmp":[Ljava/lang/Object;
    :cond_7
    return-object v3
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 214
    packed-switch p1, :pswitch_data_0

    .line 219
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 215
    :pswitch_0
    const-string v0, "callee"

    goto :goto_0

    .line 216
    :pswitch_1
    const-string v0, "length"

    goto :goto_0

    .line 217
    :pswitch_2
    const-string v0, "caller"

    goto :goto_0

    .line 214
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 225
    packed-switch p1, :pswitch_data_0

    .line 240
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v1

    :cond_0
    :goto_0
    return-object v1

    .line 226
    :pswitch_0
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->calleeObj:Ljava/lang/Object;

    goto :goto_0

    .line 227
    :pswitch_1
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->lengthObj:Ljava/lang/Object;

    goto :goto_0

    .line 229
    :pswitch_2
    iget-object v1, p0, Lorg/mozilla/javascript/Arguments;->callerObj:Ljava/lang/Object;

    .line 230
    .local v1, "value":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 231
    :cond_1
    if-nez v1, :cond_0

    .line 232
    iget-object v2, p0, Lorg/mozilla/javascript/Arguments;->activation:Lorg/mozilla/javascript/NativeCall;

    iget-object v0, v2, Lorg/mozilla/javascript/NativeCall;->parentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 233
    .local v0, "caller":Lorg/mozilla/javascript/NativeCall;
    if-eqz v0, :cond_0

    .line 234
    const-string v2, "arguments"

    invoke-virtual {v0, v2, v0}, Lorg/mozilla/javascript/NativeCall;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 225
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .prologue
    .line 170
    const/4 v0, 0x3

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 313
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 314
    .local v0, "d":D
    double-to-int v3, v0

    .line 315
    .local v3, "index":I
    int-to-double v6, v3

    cmpl-double v6, v0, v6

    if-eqz v6, :cond_0

    .line 316
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    .line 332
    :goto_0
    return-object v2

    .line 318
    :cond_0
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v5

    .line 319
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v5, v6, :cond_1

    .line 320
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    goto :goto_0

    .line 322
    :cond_1
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/Arguments;->sharedWithActivation(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 323
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/Arguments;->getFromActivation(I)Ljava/lang/Object;

    move-result-object v5

    .line 325
    :cond_2
    invoke-super {p0, v3, p0}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 326
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    .line 327
    .local v2, "desc":Lorg/mozilla/javascript/ScriptableObject;
    const-string v6, "value"

    invoke-virtual {v2, v6, v2, v5}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 330
    .end local v2    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    :cond_3
    invoke-virtual {p0}, Lorg/mozilla/javascript/Arguments;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 331
    .local v4, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v4, :cond_4

    move-object v4, p0

    .line 332
    :cond_4
    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lorg/mozilla/javascript/Arguments;->buildDataDescriptor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    goto :goto_0
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 99
    const/4 v0, 0x1

    .line 101
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    goto :goto_0
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 142
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 143
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 147
    :goto_0
    return-void

    .line 145
    :cond_0
    invoke-direct {p0, p1, p3}, Lorg/mozilla/javascript/Arguments;->replaceArg(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 259
    packed-switch p1, :pswitch_data_0

    .line 264
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 265
    :goto_0
    return-void

    .line 260
    :pswitch_0
    iput p2, p0, Lorg/mozilla/javascript/Arguments;->calleeAttr:I

    goto :goto_0

    .line 261
    :pswitch_1
    iput p2, p0, Lorg/mozilla/javascript/Arguments;->lengthAttr:I

    goto :goto_0

    .line 262
    :pswitch_2
    iput p2, p0, Lorg/mozilla/javascript/Arguments;->callerAttr:I

    goto :goto_0

    .line 259
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 246
    packed-switch p1, :pswitch_data_0

    .line 253
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 254
    .end local p2    # "value":Ljava/lang/Object;
    :goto_0
    return-void

    .line 247
    .restart local p2    # "value":Ljava/lang/Object;
    :pswitch_0
    iput-object p2, p0, Lorg/mozilla/javascript/Arguments;->calleeObj:Ljava/lang/Object;

    goto :goto_0

    .line 248
    :pswitch_1
    iput-object p2, p0, Lorg/mozilla/javascript/Arguments;->lengthObj:Ljava/lang/Object;

    goto :goto_0

    .line 250
    :pswitch_2
    if-eqz p2, :cond_0

    .end local p2    # "value":Ljava/lang/Object;
    :goto_1
    iput-object p2, p0, Lorg/mozilla/javascript/Arguments;->callerObj:Ljava/lang/Object;

    goto :goto_0

    .restart local p2    # "value":Ljava/lang/Object;
    :cond_0
    sget-object p2, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    goto :goto_1

    .line 246
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
