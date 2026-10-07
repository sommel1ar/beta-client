.class public Lorg/mozilla/javascript/NativeJavaClass;
.super Lorg/mozilla/javascript/NativeJavaObject;
.source "NativeJavaClass.java"

# interfaces
.implements Lorg/mozilla/javascript/Function;


# static fields
.field static final javaClassPropertyName:Ljava/lang/String; = "__javaObject__"

.field static final serialVersionUID:J = -0x59a93e92bdc24ba0L


# instance fields
.field private staticFieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeJavaObject;-><init>()V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V
    .locals 1
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/NativeJavaClass;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V
    .locals 1
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "isAdapter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/mozilla/javascript/NativeJavaObject;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V

    .line 44
    return-void
.end method

.method static constructInternal([Ljava/lang/Object;Lorg/mozilla/javascript/MemberBox;)Ljava/lang/Object;
    .locals 11
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "ctor"    # Lorg/mozilla/javascript/MemberBox;

    .prologue
    .line 214
    iget-object v1, p1, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 216
    .local v1, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget-boolean v9, p1, Lorg/mozilla/javascript/MemberBox;->vararg:Z

    if-eqz v9, :cond_5

    .line 218
    array-length v9, v1

    new-array v4, v9, [Ljava/lang/Object;

    .line 219
    .local v4, "newArgs":[Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, v1

    add-int/lit8 v9, v9, -0x1

    if-ge v3, v9, :cond_0

    .line 220
    aget-object v9, p0, v3

    aget-object v10, v1, v3

    invoke-static {v9, v10}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v4, v3

    .line 219
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 227
    :cond_0
    array-length v9, p0

    array-length v10, v1

    if-ne v9, v10, :cond_4

    array-length v9, p0

    add-int/lit8 v9, v9, -0x1

    aget-object v9, p0, v9

    if-eqz v9, :cond_1

    array-length v9, p0

    add-int/lit8 v9, v9, -0x1

    aget-object v9, p0, v9

    instance-of v9, v9, Lorg/mozilla/javascript/NativeArray;

    if-nez v9, :cond_1

    array-length v9, p0

    add-int/lit8 v9, v9, -0x1

    aget-object v9, p0, v9

    instance-of v9, v9, Lorg/mozilla/javascript/NativeJavaArray;

    if-eqz v9, :cond_4

    .line 233
    :cond_1
    array-length v9, p0

    add-int/lit8 v9, v9, -0x1

    aget-object v9, p0, v9

    array-length v10, v1

    add-int/lit8 v10, v10, -0x1

    aget-object v10, v1, v10

    invoke-static {v9, v10}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .line 249
    .local v7, "varArgs":Ljava/lang/Object;
    :cond_2
    array-length v9, v1

    add-int/lit8 v9, v9, -0x1

    aput-object v7, v4, v9

    .line 251
    move-object p0, v4

    .line 266
    .end local v4    # "newArgs":[Ljava/lang/Object;
    .end local v7    # "varArgs":Ljava/lang/Object;
    :cond_3
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/MemberBox;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    return-object v9

    .line 237
    .restart local v4    # "newArgs":[Ljava/lang/Object;
    :cond_4
    array-length v9, v1

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v1, v9

    invoke-virtual {v9}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 239
    .local v2, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v9, p0

    array-length v10, v1

    sub-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x1

    invoke-static {v2, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v7

    .line 241
    .restart local v7    # "varArgs":Ljava/lang/Object;
    const/4 v3, 0x0

    :goto_1
    invoke-static {v7}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v9

    if-ge v3, v9, :cond_2

    .line 242
    array-length v9, v1

    add-int/lit8 v9, v9, -0x1

    add-int/2addr v9, v3

    aget-object v9, p0, v9

    invoke-static {v9, v2}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    .line 244
    .local v6, "value":Ljava/lang/Object;
    invoke-static {v7, v3, v6}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 241
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 253
    .end local v2    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "i":I
    .end local v4    # "newArgs":[Ljava/lang/Object;
    .end local v6    # "value":Ljava/lang/Object;
    .end local v7    # "varArgs":Ljava/lang/Object;
    :cond_5
    move-object v5, p0

    .line 254
    .local v5, "origArgs":[Ljava/lang/Object;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2
    array-length v9, p0

    if-ge v3, v9, :cond_3

    .line 255
    aget-object v0, p0, v3

    .line 256
    .local v0, "arg":Ljava/lang/Object;
    aget-object v9, v1, v3

    invoke-static {v0, v9}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    .line 257
    .local v8, "x":Ljava/lang/Object;
    if-eq v8, v0, :cond_7

    .line 258
    if-ne p0, v5, :cond_6

    .line 259
    invoke-virtual {v5}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "args":[Ljava/lang/Object;
    check-cast p0, [Ljava/lang/Object;

    .line 261
    .restart local p0    # "args":[Ljava/lang/Object;
    :cond_6
    aput-object v8, p0, v3

    .line 254
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method static constructSpecific(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/MemberBox;)Lorg/mozilla/javascript/Scriptable;
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "ctor"    # Lorg/mozilla/javascript/MemberBox;

    .prologue
    .line 205
    invoke-static {p2, p3}, Lorg/mozilla/javascript/NativeJavaClass;->constructInternal([Ljava/lang/Object;Lorg/mozilla/javascript/MemberBox;)Ljava/lang/Object;

    move-result-object v0

    .line 208
    .local v0, "instance":Ljava/lang/Object;
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 209
    .local v1, "topLevel":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v2

    invoke-virtual {v2, p0, v1, v0}, Lorg/mozilla/javascript/WrapFactory;->wrapNewObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    return-object v2
.end method

.method private static findNestedClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 297
    .local p0, "parentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x24

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "nestedClassName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 299
    .local v0, "loader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_0

    .line 304
    invoke-static {v1}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 306
    :goto_0
    return-object v2

    :cond_0
    invoke-static {v0, v1}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 135
    array-length v3, p4

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    aget-object v3, p4, v5

    instance-of v3, v3, Lorg/mozilla/javascript/Scriptable;

    if-eqz v3, :cond_2

    .line 136
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v0

    .line 137
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    aget-object v2, p4, v5

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .line 139
    .local v2, "p":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    instance-of v3, v2, Lorg/mozilla/javascript/Wrapper;

    if-eqz v3, :cond_1

    move-object v3, v2

    .line 140
    check-cast v3, Lorg/mozilla/javascript/Wrapper;

    invoke-interface {v3}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 141
    .local v1, "o":Ljava/lang/Object;
    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 147
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "o":Ljava/lang/Object;
    .end local v2    # "p":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    return-object v2

    .line 144
    .restart local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "p":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    invoke-interface {v2}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 145
    if-nez v2, :cond_0

    .line 147
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "p":Lorg/mozilla/javascript/Scriptable;
    :cond_2
    invoke-virtual {p0, p1, p2, p4}, Lorg/mozilla/javascript/NativeJavaClass;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    goto :goto_0
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 19
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 152
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v5

    .line 153
    .local v5, "classObject":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/Class;->getModifiers()I

    move-result v11

    .line 154
    .local v11, "modifiers":I
    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isInterface(I)Z

    move-result v17

    if-nez v17, :cond_1

    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v17

    if-nez v17, :cond_1

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v6, v0, Lorg/mozilla/javascript/JavaMembers;->ctors:Lorg/mozilla/javascript/NativeJavaMethod;

    .line 158
    .local v6, "ctors":Lorg/mozilla/javascript/NativeJavaMethod;
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v6, v0, v1}, Lorg/mozilla/javascript/NativeJavaMethod;->findCachedFunction(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;)I

    move-result v9

    .line 159
    .local v9, "index":I
    if-gez v9, :cond_0

    .line 160
    invoke-static/range {p3 .. p3}, Lorg/mozilla/javascript/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 161
    .local v14, "sig":Ljava/lang/String;
    const-string v17, "msg.no.java.ctor"

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v17

    throw v17

    .line 166
    .end local v14    # "sig":Ljava/lang/String;
    :cond_0
    iget-object v0, v6, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v17, v0

    aget-object v17, v17, v9

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v17

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeJavaClass;->constructSpecific(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/MemberBox;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v17

    .line 189
    .end local v6    # "ctors":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v9    # "index":I
    :goto_0
    return-object v17

    .line 168
    :cond_1
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v17, v0

    if-nez v17, :cond_2

    .line 169
    const-string v17, "msg.adapter.zero.args"

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v17

    throw v17

    .line 171
    :cond_2
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v15

    .line 172
    .local v15, "topLevel":Lorg/mozilla/javascript/Scriptable;
    const-string v12, ""

    .line 176
    .local v12, "msg":Ljava/lang/String;
    :try_start_0
    const-string v17, "Dalvik"

    const-string v18, "java.vm.name"

    invoke-static/range {v18 .. v18}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    invoke-virtual {v5}, Ljava/lang/Class;->isInterface()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 178
    const/16 v17, 0x0

    aget-object v17, p3, v17

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptableObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v5, v0}, Lorg/mozilla/javascript/NativeJavaClass;->createInterfaceAdapter(Ljava/lang/Class;Lorg/mozilla/javascript/ScriptableObject;)Ljava/lang/Object;

    move-result-object v13

    .line 180
    .local v13, "obj":Ljava/lang/Object;
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v13, v3}, Lorg/mozilla/javascript/WrapFactory;->wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v17

    goto :goto_0

    .line 184
    .end local v13    # "obj":Ljava/lang/Object;
    :cond_3
    const-string v17, "JavaAdapter"

    move-object/from16 v0, v17

    invoke-interface {v15, v0, v15}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v16

    .line 185
    .local v16, "v":Ljava/lang/Object;
    sget-object v17, Lorg/mozilla/javascript/NativeJavaClass;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_4

    .line 186
    move-object/from16 v0, v16

    check-cast v0, Lorg/mozilla/javascript/Function;

    move-object v8, v0

    .line 188
    .local v8, "f":Lorg/mozilla/javascript/Function;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v4, v0, [Ljava/lang/Object;

    const/16 v17, 0x0

    aput-object p0, v4, v17

    const/16 v17, 0x1

    const/16 v18, 0x0

    aget-object v18, p3, v18

    aput-object v18, v4, v17

    .line 189
    .local v4, "adapterArgs":[Ljava/lang/Object;
    move-object/from16 v0, p1

    invoke-interface {v8, v0, v15, v4}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    goto :goto_0

    .line 191
    .end local v4    # "adapterArgs":[Ljava/lang/Object;
    .end local v8    # "f":Lorg/mozilla/javascript/Function;
    .end local v16    # "v":Ljava/lang/Object;
    :catch_0
    move-exception v7

    .line 193
    .local v7, "ex":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 194
    .local v10, "m":Ljava/lang/String;
    if-eqz v10, :cond_4

    .line 195
    move-object v12, v10

    .line 197
    .end local v7    # "ex":Ljava/lang/Exception;
    .end local v10    # "m":Ljava/lang/String;
    :cond_4
    const-string v17, "msg.cant.instantiate"

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v12, v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v17

    throw v17
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v8, 0x1

    .line 69
    const-string v6, "prototype"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 70
    const/4 v3, 0x0

    .line 98
    :cond_0
    :goto_0
    return-object v3

    .line 72
    :cond_1
    iget-object v6, p0, Lorg/mozilla/javascript/NativeJavaClass;->staticFieldAndMethods:Ljava/util/Map;

    if-eqz v6, :cond_2

    .line 73
    iget-object v6, p0, Lorg/mozilla/javascript/NativeJavaClass;->staticFieldAndMethods:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 74
    .local v3, "result":Ljava/lang/Object;
    if-nez v3, :cond_0

    .line 78
    .end local v3    # "result":Ljava/lang/Object;
    :cond_2
    iget-object v6, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    invoke-virtual {v6, p1, v8}, Lorg/mozilla/javascript/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 79
    iget-object v6, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    iget-object v7, p0, Lorg/mozilla/javascript/NativeJavaClass;->javaObject:Ljava/lang/Object;

    invoke-virtual {v6, p0, p1, v7, v8}, Lorg/mozilla/javascript/JavaMembers;->get(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 82
    :cond_3
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 83
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 84
    .local v4, "scope":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v5

    .line 86
    .local v5, "wrapFactory":Lorg/mozilla/javascript/WrapFactory;
    const-string v6, "__javaObject__"

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 87
    iget-object v6, p0, Lorg/mozilla/javascript/NativeJavaClass;->javaObject:Ljava/lang/Object;

    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    invoke-virtual {v5, v0, v4, v6, v7}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 93
    :cond_4
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6, p1}, Lorg/mozilla/javascript/NativeJavaClass;->findNestedClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 94
    .local v1, "nestedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_5

    .line 95
    invoke-virtual {v5, v0, v4, v1}, Lorg/mozilla/javascript/WrapFactory;->wrapJavaClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 97
    .local v2, "nestedValue":Lorg/mozilla/javascript/Scriptable;
    invoke-interface {v2, p0}, Lorg/mozilla/javascript/Scriptable;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    move-object v3, v2

    .line 98
    goto :goto_0

    .line 101
    .end local v2    # "nestedValue":Lorg/mozilla/javascript/Scriptable;
    :cond_5
    iget-object v6, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    invoke-virtual {v6, p1}, Lorg/mozilla/javascript/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const-string v0, "JavaClass"

    return-object v0
.end method

.method public getClassObject()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 115
    invoke-super {p0}, Lorg/mozilla/javascript/NativeJavaObject;->unwrap()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_0

    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_2

    .line 121
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaClass;->toString()Ljava/lang/String;

    move-result-object p0

    .line 126
    .end local p0    # "this":Lorg/mozilla/javascript/NativeJavaClass;
    :cond_1
    :goto_0
    return-object p0

    .line 122
    .restart local p0    # "this":Lorg/mozilla/javascript/NativeJavaClass;
    :cond_2
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_3

    .line 123
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 124
    :cond_3
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_1

    .line 125
    sget-object p0, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto :goto_0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->getIds(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v0, 0x1

    .line 60
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    invoke-virtual {v1, p1, v0}, Lorg/mozilla/javascript/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "__javaObject__"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p1, "value"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 285
    instance-of v1, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v1, :cond_0

    instance-of v1, p1, Lorg/mozilla/javascript/NativeJavaClass;

    if-nez v1, :cond_0

    .line 287
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "value":Lorg/mozilla/javascript/Scriptable;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 289
    .local v0, "instance":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    .line 293
    .end local v0    # "instance":Ljava/lang/Object;
    :goto_0
    return v1

    .restart local p1    # "value":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected initMembers()V
    .locals 3

    .prologue
    .line 48
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaClass;->javaObject:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Class;

    .line 49
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaClass;->parent:Lorg/mozilla/javascript/Scriptable;

    iget-boolean v2, p0, Lorg/mozilla/javascript/NativeJavaClass;->isAdapter:Z

    invoke-static {v1, v0, v0, v2}, Lorg/mozilla/javascript/JavaMembers;->lookupClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Ljava/lang/Class;Z)Lorg/mozilla/javascript/JavaMembers;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    .line 50
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v0, v2}, Lorg/mozilla/javascript/JavaMembers;->getFieldAndMethodsObjects(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Z)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/NativeJavaClass;->staticFieldAndMethods:Ljava/util/Map;

    .line 51
    return-void
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 106
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaClass;->javaObject:Ljava/lang/Object;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/JavaMembers;->put(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 107
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[JavaClass "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
