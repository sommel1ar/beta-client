.class public Lorg/mozilla/javascript/NativeCallSite;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeCallSite.java"


# static fields
.field private static final CALLSITE_TAG:Ljava/lang/String; = "CallSite"

.field private static final Id_constructor:I = 0x1

.field private static final Id_getColumnNumber:I = 0x9

.field private static final Id_getEvalOrigin:I = 0xa

.field private static final Id_getFileName:I = 0x7

.field private static final Id_getFunction:I = 0x4

.field private static final Id_getFunctionName:I = 0x5

.field private static final Id_getLineNumber:I = 0x8

.field private static final Id_getMethodName:I = 0x6

.field private static final Id_getThis:I = 0x2

.field private static final Id_getTypeName:I = 0x3

.field private static final Id_isConstructor:I = 0xe

.field private static final Id_isEval:I = 0xc

.field private static final Id_isNative:I = 0xd

.field private static final Id_isToplevel:I = 0xb

.field private static final Id_toString:I = 0xf

.field private static final MAX_PROTOTYPE_ID:I = 0xf


# instance fields
.field private element:Lorg/mozilla/javascript/ScriptStackElement;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 37
    return-void
.end method

.method private getFalse()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 148
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0
.end method

.method private getFileName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 165
    :goto_0
    if-eqz p1, :cond_0

    instance-of v1, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v1, :cond_0

    .line 166
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 168
    :cond_0
    if-nez p1, :cond_1

    .line 169
    sget-object v1, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 172
    :goto_1
    return-object v1

    :cond_1
    move-object v0, p1

    .line 171
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 172
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget-object v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->fileName:Ljava/lang/String;

    goto :goto_1
.end method

.method private getFunctionName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 153
    :goto_0
    if-eqz p1, :cond_0

    instance-of v1, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v1, :cond_0

    .line 154
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 156
    :cond_0
    if-nez p1, :cond_1

    .line 157
    sget-object v1, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 160
    :goto_1
    return-object v1

    :cond_1
    move-object v0, p1

    .line 159
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 160
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget-object v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->functionName:Ljava/lang/String;

    goto :goto_1
.end method

.method private getLineNumber(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 177
    :goto_0
    if-eqz p1, :cond_0

    instance-of v1, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v1, :cond_0

    .line 178
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 180
    :cond_0
    if-nez p1, :cond_1

    .line 181
    sget-object v1, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 187
    :goto_1
    return-object v1

    :cond_1
    move-object v0, p1

    .line 183
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 184
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-eqz v1, :cond_2

    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->lineNumber:I

    if-gez v1, :cond_3

    .line 185
    :cond_2
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    .line 187
    :cond_3
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->lineNumber:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_1
.end method

.method private getNull()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x0

    return-object v0
.end method

.method private getUndefined()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 138
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 22
    new-instance v0, Lorg/mozilla/javascript/NativeCallSite;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeCallSite;-><init>()V

    .line 23
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    const/16 v1, 0xf

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeCallSite;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 24
    return-void
.end method

.method private js_toString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 124
    :goto_0
    if-eqz p1, :cond_0

    instance-of v2, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v2, :cond_0

    .line 125
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 127
    :cond_0
    if-nez p1, :cond_1

    .line 128
    sget-object v2, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 133
    :goto_1
    return-object v2

    :cond_1
    move-object v0, p1

    .line 130
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 131
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v2, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method static make(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeCallSite;
    .locals 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "ctorObj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/NativeCallSite;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeCallSite;-><init>()V

    .line 29
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    const-string v2, "prototype"

    invoke-interface {p1, v2, p1}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    move-object v1, v2

    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .line 30
    .local v1, "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeCallSite;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 31
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeCallSite;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 32
    return-object v0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 80
    const-string v1, "CallSite"

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 81
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 107
    :goto_0
    return-object v1

    .line 83
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 84
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 109
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 86
    :pswitch_0
    invoke-static {p3, p1}, Lorg/mozilla/javascript/NativeCallSite;->make(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeCallSite;

    move-result-object v1

    goto :goto_0

    .line 88
    :pswitch_1
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->getFunctionName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 90
    :pswitch_2
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->getFileName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 92
    :pswitch_3
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->getLineNumber(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 97
    :pswitch_4
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeCallSite;->getUndefined()Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 99
    :pswitch_5
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeCallSite;->getNull()Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 105
    :pswitch_6
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeCallSite;->getFalse()Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 107
    :pswitch_7
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->js_toString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 84
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x3

    .line 197
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 198
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 223
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 227
    :cond_1
    return v2

    .line 199
    :pswitch_1
    const-string v0, "isEval"

    const/16 v2, 0xc

    goto :goto_0

    .line 200
    :pswitch_2
    const-string v0, "getThis"

    const/4 v2, 0x2

    goto :goto_0

    .line 201
    :pswitch_3
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 202
    .local v1, "c":I
    const/16 v3, 0x69

    if-ne v1, v3, :cond_2

    const-string v0, "isNative"

    const/16 v2, 0xd

    goto :goto_0

    .line 203
    :cond_2
    const/16 v3, 0x74

    if-ne v1, v3, :cond_0

    const-string v0, "toString"

    const/16 v2, 0xf

    goto :goto_0

    .line 205
    .end local v1    # "c":I
    :pswitch_4
    const-string v0, "isToplevel"

    const/16 v2, 0xb

    goto :goto_0

    .line 206
    :pswitch_5
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 207
    :sswitch_0
    const-string v0, "getFileName"

    const/4 v2, 0x7

    goto :goto_0

    .line 208
    :sswitch_1
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_0

    .line 209
    :sswitch_2
    const-string v0, "getFunction"

    const/4 v2, 0x4

    goto :goto_0

    .line 210
    :sswitch_3
    const-string v0, "getTypeName"

    const/4 v2, 0x3

    goto :goto_0

    .line 212
    :pswitch_6
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1

    goto :goto_0

    .line 213
    :sswitch_4
    const-string v0, "getEvalOrigin"

    const/16 v2, 0xa

    goto :goto_0

    .line 214
    :sswitch_5
    const-string v0, "getLineNumber"

    const/16 v2, 0x8

    goto :goto_0

    .line 215
    :sswitch_6
    const-string v0, "getMethodName"

    const/4 v2, 0x6

    goto :goto_0

    .line 216
    :sswitch_7
    const-string v0, "isConstructor"

    const/16 v2, 0xe

    goto :goto_0

    .line 218
    :pswitch_7
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 219
    .restart local v1    # "c":I
    const/16 v3, 0x43

    if-ne v1, v3, :cond_3

    const-string v0, "getColumnNumber"

    const/16 v2, 0x9

    goto :goto_0

    .line 220
    :cond_3
    const/16 v3, 0x46

    if-ne v1, v3, :cond_0

    const-string v0, "getFunctionName"

    const/4 v2, 0x5

    goto :goto_0

    .line 198
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_7
    .end packed-switch

    .line 206
    :sswitch_data_0
    .sparse-switch
        0x69 -> :sswitch_0
        0x74 -> :sswitch_1
        0x75 -> :sswitch_2
        0x79 -> :sswitch_3
    .end sparse-switch

    .line 212
    :sswitch_data_1
    .sparse-switch
        0x45 -> :sswitch_4
        0x4c -> :sswitch_5
        0x4d -> :sswitch_6
        0x6f -> :sswitch_7
    .end sparse-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string v0, "CallSite"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 55
    packed-switch p1, :pswitch_data_0

    .line 71
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 73
    .local v1, "s":Ljava/lang/String;
    :goto_0
    const-string v2, "CallSite"

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeCallSite;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 74
    return-void

    .line 57
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getThis"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 58
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getTypeName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFunction"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 60
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFunctionName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 61
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getMethodName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFileName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 63
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getLineNumber"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 64
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getColumnNumber"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 65
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getEvalOrigin"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 66
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isToplevel"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 67
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isEval"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 68
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isNative"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 69
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isConstructor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 70
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 55
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
    .end packed-switch
.end method

.method setElement(Lorg/mozilla/javascript/ScriptStackElement;)V
    .locals 0
    .param p1, "elt"    # Lorg/mozilla/javascript/ScriptStackElement;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    .line 42
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-nez v0, :cond_0

    .line 117
    const-string v0, ""

    .line 119
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptStackElement;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
