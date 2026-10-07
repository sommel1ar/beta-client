.class public Lorg/mozilla/javascript/InterfaceAdapter;
.super Ljava/lang/Object;
.source "InterfaceAdapter.java"


# instance fields
.field private final proxyHelper:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Class;)V
    .locals 3
    .param p1, "cf"    # Lorg/mozilla/javascript/ContextFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/ContextFactory;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v0, Lorg/mozilla/javascript/VMBridge;->instance:Lorg/mozilla/javascript/VMBridge;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lorg/mozilla/javascript/VMBridge;->getInterfaceProxyHelper(Lorg/mozilla/javascript/ContextFactory;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/InterfaceAdapter;->proxyHelper:Ljava/lang/Object;

    .line 71
    return-void
.end method

.method static create(Lorg/mozilla/javascript/Context;Ljava/lang/Class;Lorg/mozilla/javascript/ScriptableObject;)Ljava/lang/Object;
    .locals 11
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "object"    # Lorg/mozilla/javascript/ScriptableObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/mozilla/javascript/ScriptableObject;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 31
    :cond_0
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    .line 32
    .local v5, "topScope":Lorg/mozilla/javascript/Scriptable;
    invoke-static {v5}, Lorg/mozilla/javascript/ClassCache;->get(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ClassCache;

    move-result-object v6

    .line 34
    .local v6, "cache":Lorg/mozilla/javascript/ClassCache;
    invoke-virtual {v6, p1}, Lorg/mozilla/javascript/ClassCache;->getInterfaceAdapter(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/InterfaceAdapter;

    .line 35
    .local v3, "adapter":Lorg/mozilla/javascript/InterfaceAdapter;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getFactory()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v2

    .line 36
    .local v2, "cf":Lorg/mozilla/javascript/ContextFactory;
    if-nez v3, :cond_4

    .line 37
    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v10

    .line 38
    .local v10, "methods":[Ljava/lang/reflect/Method;
    instance-of v0, p2, Lorg/mozilla/javascript/Callable;

    if-eqz v0, :cond_3

    .line 43
    array-length v8, v10

    .line 44
    .local v8, "length":I
    if-nez v8, :cond_1

    .line 45
    const-string v0, "msg.no.empty.interface.conversion"

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0

    .line 48
    :cond_1
    const/4 v0, 0x1

    if-le v8, v0, :cond_3

    .line 49
    const/4 v0, 0x0

    aget-object v0, v10, v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v9

    .line 50
    .local v9, "methodName":Ljava/lang/String;
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_0
    if-ge v7, v8, :cond_3

    .line 51
    aget-object v0, v10, v7

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 52
    const-string v0, "msg.no.function.interface.conversion"

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0

    .line 50
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 59
    .end local v7    # "i":I
    .end local v8    # "length":I
    .end local v9    # "methodName":Ljava/lang/String;
    :cond_3
    new-instance v3, Lorg/mozilla/javascript/InterfaceAdapter;

    .end local v3    # "adapter":Lorg/mozilla/javascript/InterfaceAdapter;
    invoke-direct {v3, v2, p1}, Lorg/mozilla/javascript/InterfaceAdapter;-><init>(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Class;)V

    .line 60
    .restart local v3    # "adapter":Lorg/mozilla/javascript/InterfaceAdapter;
    invoke-virtual {v6, p1, v3}, Lorg/mozilla/javascript/ClassCache;->cacheInterfaceAdapter(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 62
    .end local v10    # "methods":[Ljava/lang/reflect/Method;
    :cond_4
    sget-object v0, Lorg/mozilla/javascript/VMBridge;->instance:Lorg/mozilla/javascript/VMBridge;

    iget-object v1, v3, Lorg/mozilla/javascript/InterfaceAdapter;->proxyHelper:Ljava/lang/Object;

    move-object v4, p2

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/VMBridge;->newInterfaceProxy(Ljava/lang/Object;Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/InterfaceAdapter;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public invoke(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "cf"    # Lorg/mozilla/javascript/ContextFactory;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "topScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObject"    # Ljava/lang/Object;
    .param p5, "method"    # Ljava/lang/reflect/Method;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 80
    new-instance v0, Lorg/mozilla/javascript/InterfaceAdapter$1;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/InterfaceAdapter$1;-><init>(Lorg/mozilla/javascript/InterfaceAdapter;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V

    .line 86
    .local v0, "action":Lorg/mozilla/javascript/ContextAction;
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/ContextFactory;->call(Lorg/mozilla/javascript/ContextAction;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method invokeImpl(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "topScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObject"    # Ljava/lang/Object;
    .param p5, "method"    # Ljava/lang/reflect/Method;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 97
    move-object/from16 v0, p2

    instance-of v15, v0, Lorg/mozilla/javascript/Callable;

    if-eqz v15, :cond_1

    move-object/from16 v5, p2

    .line 98
    check-cast v5, Lorg/mozilla/javascript/Callable;

    .line 122
    .local v5, "function":Lorg/mozilla/javascript/Callable;
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v14

    .line 123
    .local v14, "wf":Lorg/mozilla/javascript/WrapFactory;
    if-nez p6, :cond_5

    .line 124
    sget-object p6, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 135
    :cond_0
    const/4 v15, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v14, v0, v1, v2, v15}, Lorg/mozilla/javascript/WrapFactory;->wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v12

    .line 137
    .local v12, "thisObj":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p6

    invoke-interface {v5, v0, v1, v12, v2}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 138
    .local v9, "result":Ljava/lang/Object;
    invoke-virtual/range {p5 .. p5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v7

    .line 139
    .local v7, "javaResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v15, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v7, v15, :cond_7

    .line 140
    const/4 v9, 0x0

    .line 144
    .end local v5    # "function":Lorg/mozilla/javascript/Callable;
    .end local v7    # "javaResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "result":Ljava/lang/Object;
    .end local v12    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    .end local v14    # "wf":Lorg/mozilla/javascript/WrapFactory;
    :goto_1
    return-object v9

    :cond_1
    move-object/from16 v11, p2

    .line 100
    check-cast v11, Lorg/mozilla/javascript/Scriptable;

    .line 101
    .local v11, "s":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual/range {p5 .. p5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    .line 102
    .local v8, "methodName":Ljava/lang/String;
    invoke-static {v11, v8}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 103
    .local v13, "value":Ljava/lang/Object;
    sget-object v15, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne v13, v15, :cond_3

    .line 107
    const-string v15, "msg.undefined.function.interface"

    invoke-static {v15, v8}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 109
    invoke-virtual/range {p5 .. p5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v10

    .line 110
    .local v10, "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v15, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v10, v15, :cond_2

    .line 111
    const/4 v9, 0x0

    goto :goto_1

    .line 113
    :cond_2
    const/4 v15, 0x0

    invoke-static {v15, v10}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_1

    .line 116
    .end local v10    # "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    instance-of v15, v13, Lorg/mozilla/javascript/Callable;

    if-nez v15, :cond_4

    .line 117
    const-string v15, "msg.not.function.interface"

    invoke-static {v15, v8}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v15

    throw v15

    :cond_4
    move-object v5, v13

    .line 120
    check-cast v5, Lorg/mozilla/javascript/Callable;

    .restart local v5    # "function":Lorg/mozilla/javascript/Callable;
    goto :goto_0

    .line 126
    .end local v8    # "methodName":Ljava/lang/String;
    .end local v11    # "s":Lorg/mozilla/javascript/Scriptable;
    .end local v13    # "value":Ljava/lang/Object;
    .restart local v14    # "wf":Lorg/mozilla/javascript/WrapFactory;
    :cond_5
    const/4 v6, 0x0

    .local v6, "i":I
    move-object/from16 v0, p6

    array-length v3, v0

    .local v3, "N":I
    :goto_2
    if-eq v6, v3, :cond_0

    .line 127
    aget-object v4, p6, v6

    .line 129
    .local v4, "arg":Ljava/lang/Object;
    instance-of v15, v4, Ljava/lang/String;

    if-nez v15, :cond_6

    instance-of v15, v4, Ljava/lang/Number;

    if-nez v15, :cond_6

    instance-of v15, v4, Ljava/lang/Boolean;

    if-nez v15, :cond_6

    .line 131
    const/4 v15, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v14, v0, v1, v4, v15}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v15

    aput-object v15, p6, v6

    .line 126
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 142
    .end local v3    # "N":I
    .end local v4    # "arg":Ljava/lang/Object;
    .end local v6    # "i":I
    .restart local v7    # "javaResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v9    # "result":Ljava/lang/Object;
    .restart local v12    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_7
    invoke-static {v9, v7}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_1
.end method
