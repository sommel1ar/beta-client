.class public Lorg/mozilla/javascript/FunctionObject;
.super Lorg/mozilla/javascript/BaseFunction;
.source "FunctionObject.java"


# static fields
.field public static final JAVA_BOOLEAN_TYPE:I = 0x3

.field public static final JAVA_DOUBLE_TYPE:I = 0x4

.field public static final JAVA_INT_TYPE:I = 0x2

.field public static final JAVA_OBJECT_TYPE:I = 0x6

.field public static final JAVA_SCRIPTABLE_TYPE:I = 0x5

.field public static final JAVA_STRING_TYPE:I = 0x1

.field public static final JAVA_UNSUPPORTED_TYPE:I = 0x0

.field private static final VARARGS_CTOR:S = -0x2s

.field private static final VARARGS_METHOD:S = -0x1s

.field private static sawSecurityException:Z = false

.field static final serialVersionUID:J = -0x4a002e39945f012bL


# instance fields
.field private functionName:Ljava/lang/String;

.field private transient hasVoidReturn:Z

.field private isStatic:Z

.field member:Lorg/mozilla/javascript/MemberBox;

.field private parmsLength:I

.field private transient returnTypeTag:I

.field private transient typeTags:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lorg/mozilla/javascript/Scriptable;)V
    .locals 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "methodOrConstructor"    # Ljava/lang/reflect/Member;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 85
    instance-of v8, p2, Ljava/lang/reflect/Constructor;

    if-eqz v8, :cond_2

    .line 86
    new-instance v8, Lorg/mozilla/javascript/MemberBox;

    check-cast p2, Ljava/lang/reflect/Constructor;

    .end local p2    # "methodOrConstructor":Ljava/lang/reflect/Member;
    invoke-direct {v8, p2}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Constructor;)V

    iput-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    .line 87
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/mozilla/javascript/FunctionObject;->isStatic:Z

    .line 92
    :goto_0
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v8}, Lorg/mozilla/javascript/MemberBox;->getName()Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "methodName":Ljava/lang/String;
    iput-object p1, p0, Lorg/mozilla/javascript/FunctionObject;->functionName:Ljava/lang/String;

    .line 94
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    iget-object v7, v8, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 95
    .local v7, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v0, v7

    .line 96
    .local v0, "arity":I
    const/4 v8, 0x4

    if-ne v0, v8, :cond_9

    const/4 v8, 0x1

    aget-object v8, v7, v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-nez v8, :cond_0

    const/4 v8, 0x2

    aget-object v8, v7, v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 98
    :cond_0
    const/4 v8, 0x1

    aget-object v8, v7, v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 99
    iget-boolean v8, p0, Lorg/mozilla/javascript/FunctionObject;->isStatic:Z

    if-eqz v8, :cond_1

    const/4 v8, 0x0

    aget-object v8, v7, v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_1

    const/4 v8, 0x1

    aget-object v8, v7, v8

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_1

    const/4 v8, 0x2

    aget-object v8, v7, v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_1

    const/4 v8, 0x3

    aget-object v8, v7, v8

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v8, v9, :cond_3

    .line 105
    :cond_1
    const-string v8, "msg.varargs.ctor"

    invoke-static {v8, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v8

    throw v8

    .line 89
    .end local v0    # "arity":I
    .end local v4    # "methodName":Ljava/lang/String;
    .end local v7    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local p2    # "methodOrConstructor":Ljava/lang/reflect/Member;
    :cond_2
    new-instance v8, Lorg/mozilla/javascript/MemberBox;

    check-cast p2, Ljava/lang/reflect/Method;

    .end local p2    # "methodOrConstructor":Ljava/lang/reflect/Member;
    invoke-direct {v8, p2}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    .line 90
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v8}, Lorg/mozilla/javascript/MemberBox;->isStatic()Z

    move-result v8

    iput-boolean v8, p0, Lorg/mozilla/javascript/FunctionObject;->isStatic:Z

    goto :goto_0

    .line 108
    .restart local v0    # "arity":I
    .restart local v4    # "methodName":Ljava/lang/String;
    .restart local v7    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_3
    const/4 v8, -0x2

    iput v8, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    .line 136
    :cond_4
    :goto_1
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v8}, Lorg/mozilla/javascript/MemberBox;->isMethod()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 137
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v8}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v3

    .line 138
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    .line 139
    .local v5, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v8, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v5, v8, :cond_b

    .line 140
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/mozilla/javascript/FunctionObject;->hasVoidReturn:Z

    .line 152
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5
    :goto_2
    invoke-static {p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V

    .line 153
    return-void

    .line 110
    :cond_6
    iget-boolean v8, p0, Lorg/mozilla/javascript/FunctionObject;->isStatic:Z

    if-eqz v8, :cond_7

    const/4 v8, 0x0

    aget-object v8, v7, v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_7

    const/4 v8, 0x1

    aget-object v8, v7, v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_7

    const/4 v8, 0x2

    aget-object v8, v7, v8

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_7

    const/4 v8, 0x3

    aget-object v8, v7, v8

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-eq v8, v9, :cond_8

    .line 116
    :cond_7
    const-string v8, "msg.varargs.fun"

    invoke-static {v8, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v8

    throw v8

    .line 119
    :cond_8
    const/4 v8, -0x1

    iput v8, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    goto :goto_1

    .line 122
    :cond_9
    iput v0, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    .line 123
    if-lez v0, :cond_4

    .line 124
    new-array v8, v0, [B

    iput-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->typeTags:[B

    .line 125
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-eq v2, v0, :cond_4

    .line 126
    aget-object v8, v7, v2

    invoke-static {v8}, Lorg/mozilla/javascript/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v6

    .line 127
    .local v6, "tag":I
    if-nez v6, :cond_a

    .line 128
    const-string v8, "msg.bad.parms"

    aget-object v9, v7, v2

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v8

    throw v8

    .line 131
    :cond_a
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->typeTags:[B

    int-to-byte v9, v6

    aput-byte v9, v8, v2

    .line 125
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 142
    .end local v2    # "i":I
    .end local v6    # "tag":I
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v5    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_b
    invoke-static {v5}, Lorg/mozilla/javascript/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v8

    iput v8, p0, Lorg/mozilla/javascript/FunctionObject;->returnTypeTag:I

    goto :goto_2

    .line 145
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_c
    iget-object v8, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v8}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    .line 146
    .local v1, "ctorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v8, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v8, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 147
    const-string v8, "msg.bad.ctor.return"

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v8

    throw v8
.end method

.method public static convertArg(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "arg"    # Ljava/lang/Object;
    .param p3, "typeTag"    # I

    .prologue
    .line 184
    packed-switch p3, :pswitch_data_0

    .line 207
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 186
    :pswitch_0
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 205
    .end local p2    # "arg":Ljava/lang/Object;
    :cond_0
    :goto_0
    :pswitch_1
    return-object p2

    .line 188
    .restart local p2    # "arg":Ljava/lang/Object;
    :cond_1
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 190
    :pswitch_2
    instance-of v0, p2, Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 192
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    goto :goto_0

    .line 194
    :pswitch_3
    instance-of v0, p2, Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 196
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_1
    move-object p2, v0

    goto :goto_0

    :cond_2
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1

    .line 199
    :pswitch_4
    instance-of v0, p2, Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 201
    new-instance v0, Ljava/lang/Double;

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    move-object p2, v0

    goto :goto_0

    .line 203
    :pswitch_5
    invoke-static {p0, p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p2

    goto :goto_0

    .line 184
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_1
    .end packed-switch
.end method

.method public static convertArg(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 352
    .local p3, "desired":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p3}, Lorg/mozilla/javascript/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v0

    .line 353
    .local v0, "tag":I
    if-nez v0, :cond_0

    .line 354
    const-string v1, "msg.cant.convert"

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    throw v1

    .line 357
    :cond_0
    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/FunctionObject;->convertArg(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 6
    .param p0, "methods"    # [Ljava/lang/reflect/Method;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 249
    const/4 v1, 0x0

    .line 250
    .local v1, "found":Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, p0

    .local v0, "N":I
    :goto_0
    if-eq v2, v0, :cond_2

    .line 251
    aget-object v3, p0, v2

    .line 252
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 253
    if-eqz v1, :cond_0

    .line 254
    const-string v4, "msg.no.overload"

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, p1, v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 258
    :cond_0
    move-object v1, v3

    .line 250
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 261
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_2
    return-object v1
.end method

.method static getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 273
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 277
    .local v5, "methods":[Ljava/lang/reflect/Method;
    :try_start_0
    sget-boolean v7, Lorg/mozilla/javascript/FunctionObject;->sawSecurityException:Z

    if-nez v7, :cond_0

    .line 278
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 283
    :cond_0
    :goto_0
    if-nez v5, :cond_1

    .line 284
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    .line 286
    :cond_1
    const/4 v0, 0x0

    .line 287
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v7, v5

    if-ge v2, v7, :cond_5

    .line 288
    sget-boolean v7, Lorg/mozilla/javascript/FunctionObject;->sawSecurityException:Z

    if-eqz v7, :cond_3

    aget-object v7, v5, v2

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    if-eq v7, p0, :cond_4

    .line 292
    :cond_2
    const/4 v7, 0x0

    aput-object v7, v5, v2

    .line 287
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 279
    .end local v0    # "count":I
    .end local v2    # "i":I
    :catch_0
    move-exception v1

    .line 281
    .local v1, "e":Ljava/lang/SecurityException;
    const/4 v7, 0x1

    sput-boolean v7, Lorg/mozilla/javascript/FunctionObject;->sawSecurityException:Z

    goto :goto_0

    .line 288
    .end local v1    # "e":Ljava/lang/SecurityException;
    .restart local v0    # "count":I
    .restart local v2    # "i":I
    :cond_3
    aget-object v7, v5, v2

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 294
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 297
    :cond_5
    new-array v6, v0, [Ljava/lang/reflect/Method;

    .line 298
    .local v6, "result":[Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 299
    .local v3, "j":I
    const/4 v2, 0x0

    :goto_3
    array-length v7, v5

    if-ge v2, v7, :cond_7

    .line 300
    aget-object v7, v5, v2

    if-eqz v7, :cond_6

    .line 301
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "j":I
    .local v4, "j":I
    aget-object v7, v5, v2

    aput-object v7, v6, v3

    move v3, v4

    .line 299
    .end local v4    # "j":I
    .restart local v3    # "j":I
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 303
    :cond_7
    return-object v6
.end method

.method public static getTypeTag(Ljava/lang/Class;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_0

    .line 163
    const/4 v0, 0x1

    .line 178
    :goto_0
    return v0

    .line 164
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_1

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2

    .line 165
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 166
    :cond_2
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_3

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_4

    .line 167
    :cond_3
    const/4 v0, 0x3

    goto :goto_0

    .line 168
    :cond_4
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_5

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_6

    .line 169
    :cond_5
    const/4 v0, 0x4

    goto :goto_0

    .line 170
    :cond_6
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 171
    const/4 v0, 0x5

    goto :goto_0

    .line 172
    :cond_7
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_8

    .line 173
    const/4 v0, 0x6

    goto :goto_0

    .line 178
    :cond_8
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 6
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 507
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 508
    iget v4, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-lez v4, :cond_0

    .line 509
    iget-object v4, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    iget-object v3, v4, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 510
    .local v3, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget v4, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/mozilla/javascript/FunctionObject;->typeTags:[B

    .line 511
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v4, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-eq v0, v4, :cond_0

    .line 512
    iget-object v4, p0, Lorg/mozilla/javascript/FunctionObject;->typeTags:[B

    aget-object v5, v3, v0

    invoke-static {v5}, Lorg/mozilla/javascript/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v4, v0

    .line 511
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 515
    .end local v0    # "i":I
    .end local v3    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v4}, Lorg/mozilla/javascript/MemberBox;->isMethod()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 516
    iget-object v4, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v4}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v1

    .line 517
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    .line 518
    .local v2, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v2, v4, :cond_2

    .line 519
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/mozilla/javascript/FunctionObject;->hasVoidReturn:Z

    .line 524
    .end local v1    # "method":Ljava/lang/reflect/Method;
    .end local v2    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    :goto_1
    return-void

    .line 521
    .restart local v1    # "method":Ljava/lang/reflect/Method;
    .restart local v2    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    invoke-static {v2}, Lorg/mozilla/javascript/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v4

    iput v4, p0, Lorg/mozilla/javascript/FunctionObject;->returnTypeTag:I

    goto :goto_1
.end method


# virtual methods
.method public addAsConstructor(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 324
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/FunctionObject;->initAsConstructor(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 325
    invoke-interface {p2}, Lorg/mozilla/javascript/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {p1, v0, p0, v1}, Lorg/mozilla/javascript/FunctionObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 327
    return-void
.end method

.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 374
    const/4 v5, 0x0

    .line 375
    .local v5, "checkMethodResult":Z
    move-object/from16 v0, p4

    array-length v3, v0

    .line 377
    .local v3, "argsLength":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    if-ge v9, v3, :cond_1

    .line 379
    aget-object v14, p4, v9

    instance-of v14, v14, Lorg/mozilla/javascript/ConsString;

    if-eqz v14, :cond_0

    .line 380
    aget-object v14, p4, v9

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    aput-object v14, p4, v9

    .line 377
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 384
    :cond_1
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-gez v14, :cond_7

    .line 385
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    const/4 v15, -0x1

    if-ne v14, v15, :cond_3

    .line 386
    const/4 v14, 0x4

    new-array v11, v14, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p1, v11, v14

    const/4 v14, 0x1

    aput-object p3, v11, v14

    const/4 v14, 0x2

    aput-object p4, v11, v14

    const/4 v14, 0x3

    aput-object p0, v11, v14

    .line 387
    .local v11, "invokeArgs":[Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    const/4 v15, 0x0

    invoke-virtual {v14, v15, v11}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 388
    .local v13, "result":Ljava/lang/Object;
    const/4 v5, 0x1

    .line 458
    :goto_1
    if-eqz v5, :cond_2

    .line 459
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/mozilla/javascript/FunctionObject;->hasVoidReturn:Z

    if-eqz v14, :cond_11

    .line 460
    sget-object v13, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 470
    :cond_2
    :goto_2
    return-object v13

    .line 390
    .end local v11    # "invokeArgs":[Ljava/lang/Object;
    .end local v13    # "result":Ljava/lang/Object;
    :cond_3
    if-nez p3, :cond_4

    const/4 v10, 0x1

    .line 391
    .local v10, "inNewExpr":Z
    :goto_3
    if-eqz v10, :cond_5

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 392
    .local v4, "b":Ljava/lang/Boolean;
    :goto_4
    const/4 v14, 0x4

    new-array v11, v14, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p1, v11, v14

    const/4 v14, 0x1

    aput-object p4, v11, v14

    const/4 v14, 0x2

    aput-object p0, v11, v14

    const/4 v14, 0x3

    aput-object v4, v11, v14

    .line 393
    .restart local v11    # "invokeArgs":[Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v14}, Lorg/mozilla/javascript/MemberBox;->isCtor()Z

    move-result v14

    if-eqz v14, :cond_6

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v14, v11}, Lorg/mozilla/javascript/MemberBox;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 396
    .restart local v13    # "result":Ljava/lang/Object;
    :goto_5
    goto :goto_1

    .line 390
    .end local v4    # "b":Ljava/lang/Boolean;
    .end local v10    # "inNewExpr":Z
    .end local v11    # "invokeArgs":[Ljava/lang/Object;
    .end local v13    # "result":Ljava/lang/Object;
    :cond_4
    const/4 v10, 0x0

    goto :goto_3

    .line 391
    .restart local v10    # "inNewExpr":Z
    :cond_5
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4

    .line 393
    .restart local v4    # "b":Ljava/lang/Boolean;
    .restart local v11    # "invokeArgs":[Ljava/lang/Object;
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    const/4 v15, 0x0

    invoke-virtual {v14, v15, v11}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    goto :goto_5

    .line 399
    .end local v4    # "b":Ljava/lang/Boolean;
    .end local v10    # "inNewExpr":Z
    .end local v11    # "invokeArgs":[Ljava/lang/Object;
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/mozilla/javascript/FunctionObject;->isStatic:Z

    if-nez v14, :cond_9

    .line 400
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v14}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    .line 401
    .local v6, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p3

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_9

    .line 402
    const/4 v7, 0x0

    .line 403
    .local v7, "compatible":Z
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_8

    .line 404
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/FunctionObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v12

    .line 405
    .local v12, "parentScope":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p2

    if-eq v0, v12, :cond_8

    .line 408
    invoke-virtual {v6, v12}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    .line 409
    if-eqz v7, :cond_8

    .line 410
    move-object/from16 p3, v12

    .line 414
    .end local v12    # "parentScope":Lorg/mozilla/javascript/Scriptable;
    :cond_8
    if-nez v7, :cond_9

    .line 416
    const-string v14, "msg.incompat.call"

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/FunctionObject;->functionName:Ljava/lang/String;

    invoke-static {v14, v15}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v14

    throw v14

    .line 423
    .end local v6    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "compatible":Z
    :cond_9
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-ne v14, v3, :cond_c

    .line 426
    move-object/from16 v11, p4

    .line 427
    .restart local v11    # "invokeArgs":[Ljava/lang/Object;
    const/4 v9, 0x0

    :goto_6
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-eq v9, v14, :cond_d

    .line 428
    aget-object v2, p4, v9

    .line 429
    .local v2, "arg":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->typeTags:[B

    aget-byte v14, v14, v9

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v2, v14}, Lorg/mozilla/javascript/FunctionObject;->convertArg(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v8

    .line 430
    .local v8, "converted":Ljava/lang/Object;
    if-eq v2, v8, :cond_b

    .line 431
    move-object/from16 v0, p4

    if-ne v11, v0, :cond_a

    .line 432
    invoke-virtual/range {p4 .. p4}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "invokeArgs":[Ljava/lang/Object;
    check-cast v11, [Ljava/lang/Object;

    .line 434
    .restart local v11    # "invokeArgs":[Ljava/lang/Object;
    :cond_a
    aput-object v8, v11, v9

    .line 427
    :cond_b
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 437
    .end local v2    # "arg":Ljava/lang/Object;
    .end local v8    # "converted":Ljava/lang/Object;
    .end local v11    # "invokeArgs":[Ljava/lang/Object;
    :cond_c
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-nez v14, :cond_e

    .line 438
    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 449
    .restart local v11    # "invokeArgs":[Ljava/lang/Object;
    :cond_d
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v14}, Lorg/mozilla/javascript/MemberBox;->isMethod()Z

    move-result v14

    if-eqz v14, :cond_10

    .line 450
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v0, p3

    invoke-virtual {v14, v0, v11}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 451
    .restart local v13    # "result":Ljava/lang/Object;
    const/4 v5, 0x1

    goto/16 :goto_1

    .line 440
    .end local v11    # "invokeArgs":[Ljava/lang/Object;
    .end local v13    # "result":Ljava/lang/Object;
    :cond_e
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    new-array v11, v14, [Ljava/lang/Object;

    .line 441
    .restart local v11    # "invokeArgs":[Ljava/lang/Object;
    const/4 v9, 0x0

    :goto_7
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-eq v9, v14, :cond_d

    .line 442
    if-ge v9, v3, :cond_f

    aget-object v2, p4, v9

    .line 445
    .restart local v2    # "arg":Ljava/lang/Object;
    :goto_8
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->typeTags:[B

    aget-byte v14, v14, v9

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v2, v14}, Lorg/mozilla/javascript/FunctionObject;->convertArg(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v14

    aput-object v14, v11, v9

    .line 441
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 442
    .end local v2    # "arg":Ljava/lang/Object;
    :cond_f
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_8

    .line 453
    :cond_10
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v14, v11}, Lorg/mozilla/javascript/MemberBox;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .restart local v13    # "result":Ljava/lang/Object;
    goto/16 :goto_1

    .line 461
    :cond_11
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/FunctionObject;->returnTypeTag:I

    if-nez v14, :cond_2

    .line 462
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v14

    const/4 v15, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v14, v0, v1, v13, v15}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v13

    goto/16 :goto_2
.end method

.method public createObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 481
    iget-object v2, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v2}, Lorg/mozilla/javascript/MemberBox;->isCtor()Z

    move-result v2

    if-nez v2, :cond_0

    iget v2, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    const/4 v3, -0x2

    if-ne v2, v3, :cond_1

    .line 482
    :cond_0
    const/4 v1, 0x0

    .line 493
    :goto_0
    return-object v1

    .line 486
    :cond_1
    :try_start_0
    iget-object v2, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v2}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/Scriptable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 491
    .local v1, "result":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0}, Lorg/mozilla/javascript/FunctionObject;->getClassPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/mozilla/javascript/Scriptable;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 492
    invoke-virtual {p0}, Lorg/mozilla/javascript/FunctionObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/mozilla/javascript/Scriptable;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_0

    .line 487
    .end local v1    # "result":Lorg/mozilla/javascript/Scriptable;
    :catch_0
    move-exception v0

    .line 488
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method public getArity()I
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    goto :goto_0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lorg/mozilla/javascript/FunctionObject;->functionName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/FunctionObject;->functionName:Ljava/lang/String;

    goto :goto_0
.end method

.method public getLength()I
    .locals 1

    .prologue
    .line 226
    invoke-virtual {p0}, Lorg/mozilla/javascript/FunctionObject;->getArity()I

    move-result v0

    return v0
.end method

.method public getMethodOrConstructor()Ljava/lang/reflect/Member;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v0}, Lorg/mozilla/javascript/MemberBox;->isMethod()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v0}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v0

    .line 243
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/FunctionObject;->member:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v0}, Lorg/mozilla/javascript/MemberBox;->ctor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    goto :goto_0
.end method

.method initAsConstructor(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 331
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V

    .line 332
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/FunctionObject;->setImmunePrototypeProperty(Ljava/lang/Object;)V

    .line 334
    invoke-interface {p2, p0}, Lorg/mozilla/javascript/Scriptable;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 336
    const-string v0, "constructor"

    const/4 v1, 0x7

    invoke-static {p2, v0, p0, v1}, Lorg/mozilla/javascript/FunctionObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 340
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/FunctionObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 341
    return-void
.end method

.method isVarArgsConstructor()Z
    .locals 2

    .prologue
    .line 501
    iget v0, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isVarArgsMethod()Z
    .locals 2

    .prologue
    .line 497
    iget v0, p0, Lorg/mozilla/javascript/FunctionObject;->parmsLength:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
