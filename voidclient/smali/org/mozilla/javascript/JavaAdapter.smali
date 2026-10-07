.class public final Lorg/mozilla/javascript/JavaAdapter;
.super Ljava/lang/Object;
.source "JavaAdapter.java"

# interfaces
.implements Lorg/mozilla/javascript/IdFunctionCall;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;
    }
.end annotation


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final Id_JavaAdapter:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1192
    const-string v0, "JavaAdapter"

    sput-object v0, Lorg/mozilla/javascript/JavaAdapter;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/Context;
    .param p1, "x1"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "x2"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "x3"    # Lorg/mozilla/javascript/Function;
    .param p4, "x4"    # [Ljava/lang/Object;
    .param p5, "x5"    # J

    .prologue
    .line 15
    invoke-static/range {p0 .. p6}, Lorg/mozilla/javascript/JavaAdapter;->doCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static appendMethodSignature([Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/StringBuilder;)I
    .locals 6
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/StringBuilder;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1135
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p1, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v5, 0x28

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1136
    array-length v5, p0

    add-int/lit8 v1, v5, 0x1

    .line 1137
    .local v1, "firstLocal":I
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 1138
    .local v4, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2, v4}, Lorg/mozilla/javascript/JavaAdapter;->appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;

    .line 1139
    sget-object v5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq v4, v5, :cond_0

    sget-object v5, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v4, v5, :cond_1

    .line 1141
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 1137
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1144
    .end local v4    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    const/16 v5, 0x29

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1145
    invoke-static {p2, p1}, Lorg/mozilla/javascript/JavaAdapter;->appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;

    .line 1146
    return v1
.end method

.method private static appendOverridableMethods(Ljava/lang/Class;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 490
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    .local p2, "skip":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 491
    .local v2, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v2

    if-ge v0, v4, :cond_4

    .line 492
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v5, v2, v0

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v2, v0

    aget-object v6, v2, v0

    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/mozilla/javascript/JavaAdapter;->getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 495
    .local v1, "methodKey":Ljava/lang/String;
    invoke-virtual {p2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 491
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 497
    :cond_1
    aget-object v4, v2, v0

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    .line 498
    .local v3, "mods":I
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 500
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 503
    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 506
    :cond_2
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 507
    :cond_3
    aget-object v4, v2, v0

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 508
    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 511
    .end local v1    # "methodKey":Ljava/lang/String;
    .end local v3    # "mods":I
    :cond_4
    return-void
.end method

.method private static appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;
    .locals 5
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/StringBuilder;"
        }
    .end annotation

    .prologue
    .line 1151
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1152
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1153
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    goto :goto_0

    .line 1155
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1157
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_1

    .line 1158
    const/16 v0, 0x5a

    .line 1165
    .local v0, "typeLetter":C
    :goto_1
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1171
    .end local v0    # "typeLetter":C
    :goto_2
    return-object p0

    .line 1159
    :cond_1
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_2

    .line 1160
    const/16 v0, 0x4a

    .restart local v0    # "typeLetter":C
    goto :goto_1

    .line 1162
    .end local v0    # "typeLetter":C
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1163
    .local v1, "typeName":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .restart local v0    # "typeLetter":C
    goto :goto_1

    .line 1167
    .end local v0    # "typeLetter":C
    .end local v1    # "typeName":Ljava/lang/String;
    :cond_3
    const/16 v2, 0x4c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1168
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1169
    const/16 v2, 0x3b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2
.end method

.method public static callMethod(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 10
    .param p0, "factory"    # Lorg/mozilla/javascript/ContextFactory;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "f"    # Lorg/mozilla/javascript/Function;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsToWrap"    # J

    .prologue
    .line 566
    if-nez p2, :cond_0

    .line 568
    const/4 v0, 0x0

    .line 583
    :goto_0
    return-object v0

    .line 570
    :cond_0
    if-nez p0, :cond_1

    .line 571
    invoke-static {}, Lorg/mozilla/javascript/ContextFactory;->getGlobal()Lorg/mozilla/javascript/ContextFactory;

    move-result-object p0

    .line 574
    :cond_1
    invoke-interface {p2}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 575
    .local v2, "scope":Lorg/mozilla/javascript/Scriptable;
    const-wide/16 v4, 0x0

    cmp-long v0, p4, v4

    if-nez v0, :cond_2

    .line 576
    invoke-static {p0, p2, v2, p1, p3}, Lorg/mozilla/javascript/Context;->call(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 579
    :cond_2
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 580
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v1, :cond_3

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-wide v6, p4

    .line 581
    invoke-static/range {v1 .. v7}, Lorg/mozilla/javascript/JavaAdapter;->doCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 583
    :cond_3
    new-instance v3, Lorg/mozilla/javascript/JavaAdapter$1;

    move-object v4, v2

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-wide v8, p4

    invoke-direct/range {v3 .. v9}, Lorg/mozilla/javascript/JavaAdapter$1;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)V

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/ContextFactory;->call(Lorg/mozilla/javascript/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public static convertResult(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "result"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v0, :cond_0

    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-eq p1, v0, :cond_0

    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p1, v0, :cond_0

    .line 99
    const/4 v0, 0x0

    .line 101
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public static createAdapterCode(Lorg/mozilla/javascript/ObjToIntMap;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;Ljava/lang/String;)[B
    .locals 36
    .param p0, "functionNames"    # Lorg/mozilla/javascript/ObjToIntMap;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p4, "scriptClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/ObjToIntMap;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")[B"
        }
    .end annotation

    .prologue
    .line 347
    .local p2, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v2, Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "<adapter>"

    move-object/from16 v0, p1

    invoke-direct {v2, v0, v3, v6}, Lorg/mozilla/classfile/ClassFileWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    .local v2, "cfw":Lorg/mozilla/classfile/ClassFileWriter;
    const-string v3, "factory"

    const-string v6, "Lorg/mozilla/javascript/ContextFactory;"

    const/16 v7, 0x11

    invoke-virtual {v2, v3, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 353
    const-string v3, "delegee"

    const-string v6, "Lorg/mozilla/javascript/Scriptable;"

    const/16 v7, 0x11

    invoke-virtual {v2, v3, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 356
    const-string v3, "self"

    const-string v6, "Lorg/mozilla/javascript/Scriptable;"

    const/16 v7, 0x11

    invoke-virtual {v2, v3, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 359
    if-nez p3, :cond_1

    const/16 v24, 0x0

    .line 360
    .local v24, "interfacesCount":I
    :goto_0
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_1
    move/from16 v0, v22

    move/from16 v1, v24

    if-ge v0, v1, :cond_2

    .line 361
    aget-object v3, p3, v22

    if-eqz v3, :cond_0

    .line 362
    aget-object v3, p3, v22

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInterface(Ljava/lang/String;)V

    .line 360
    :cond_0
    add-int/lit8 v22, v22, 0x1

    goto :goto_1

    .line 359
    .end local v22    # "i":I
    .end local v24    # "interfacesCount":I
    :cond_1
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v24, v0

    goto :goto_0

    .line 365
    .restart local v22    # "i":I
    .restart local v24    # "interfacesCount":I
    :cond_2
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x2e

    const/16 v7, 0x2f

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    .line 366
    .local v8, "superName":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v19

    .line 367
    .local v19, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    move-object/from16 v17, v19

    .local v17, "arr$":[Ljava/lang/reflect/Constructor;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v29, v0

    .local v29, "len$":I
    const/16 v23, 0x0

    .local v23, "i$":I
    :goto_2
    move/from16 v0, v23

    move/from16 v1, v29

    if-ge v0, v1, :cond_5

    aget-object v18, v17, v23

    .line 368
    .local v18, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual/range {v18 .. v18}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v34

    .line 369
    .local v34, "mod":I
    invoke-static/range {v34 .. v34}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-static/range {v34 .. v34}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 370
    :cond_3
    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v2, v0, v8, v1}, Lorg/mozilla/javascript/JavaAdapter;->generateCtor(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Constructor;)V

    .line 367
    :cond_4
    add-int/lit8 v23, v23, 0x1

    goto :goto_2

    .line 373
    .end local v18    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v34    # "mod":I
    :cond_5
    move-object/from16 v0, p1

    invoke-static {v2, v0, v8}, Lorg/mozilla/javascript/JavaAdapter;->generateSerialCtor(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    if-eqz p4, :cond_6

    .line 375
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-static {v2, v0, v8, v1}, Lorg/mozilla/javascript/JavaAdapter;->generateEmptyCtor(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    :cond_6
    new-instance v21, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct/range {v21 .. v21}, Lorg/mozilla/javascript/ObjToIntMap;-><init>()V

    .line 379
    .local v21, "generatedOverrides":Lorg/mozilla/javascript/ObjToIntMap;
    new-instance v20, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct/range {v20 .. v20}, Lorg/mozilla/javascript/ObjToIntMap;-><init>()V

    .line 382
    .local v20, "generatedMethods":Lorg/mozilla/javascript/ObjToIntMap;
    const/16 v22, 0x0

    :goto_3
    move/from16 v0, v22

    move/from16 v1, v24

    if-ge v0, v1, :cond_b

    .line 383
    aget-object v3, p3, v22

    invoke-virtual {v3}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v33

    .line 384
    .local v33, "methods":[Ljava/lang/reflect/Method;
    const/16 v27, 0x0

    .local v27, "j":I
    :goto_4
    move-object/from16 v0, v33

    array-length v3, v0

    move/from16 v0, v27

    if-ge v0, v3, :cond_a

    .line 385
    aget-object v31, v33, v27

    .line 386
    .local v31, "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v35

    .line 387
    .local v35, "mods":I
    invoke-static/range {v35 .. v35}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v3

    if-nez v3, :cond_7

    invoke-static/range {v35 .. v35}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 384
    :cond_7
    :goto_5
    add-int/lit8 v27, v27, 0x1

    goto :goto_4

    .line 390
    :cond_8
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    .line 391
    .local v4, "methodName":Ljava/lang/String;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 392
    .local v5, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 394
    :try_start_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    .line 399
    :catch_0
    move-exception v3

    .line 405
    :cond_9
    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/mozilla/javascript/JavaAdapter;->getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v10

    .line 406
    .local v10, "methodSignature":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    .line 407
    .local v32, "methodKey":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 408
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    const/4 v7, 0x1

    move-object/from16 v3, p1

    invoke-static/range {v2 .. v7}, Lorg/mozilla/javascript/JavaAdapter;->generateMethod(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V

    .line 410
    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v3}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 411
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v3}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    goto :goto_5

    .line 382
    .end local v4    # "methodName":Ljava/lang/String;
    .end local v5    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v10    # "methodSignature":Ljava/lang/String;
    .end local v31    # "method":Ljava/lang/reflect/Method;
    .end local v32    # "methodKey":Ljava/lang/String;
    .end local v35    # "mods":I
    :cond_a
    add-int/lit8 v22, v22, 0x1

    goto :goto_3

    .line 420
    .end local v27    # "j":I
    .end local v33    # "methods":[Ljava/lang/reflect/Method;
    :cond_b
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/JavaAdapter;->getOverridableMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v33

    .line 421
    .restart local v33    # "methods":[Ljava/lang/reflect/Method;
    const/16 v27, 0x0

    .restart local v27    # "j":I
    :goto_6
    move-object/from16 v0, v33

    array-length v3, v0

    move/from16 v0, v27

    if-ge v0, v3, :cond_e

    .line 422
    aget-object v31, v33, v27

    .line 423
    .restart local v31    # "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v35

    .line 427
    .restart local v35    # "mods":I
    invoke-static/range {v35 .. v35}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v25

    .line 428
    .local v25, "isAbstractMethod":Z
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    .line 429
    .restart local v4    # "methodName":Ljava/lang/String;
    if-nez v25, :cond_c

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 432
    :cond_c
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 433
    .restart local v5    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/mozilla/javascript/JavaAdapter;->getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v10

    .line 434
    .restart local v10    # "methodSignature":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    .line 435
    .restart local v32    # "methodKey":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 436
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    const/4 v7, 0x1

    move-object/from16 v3, p1

    invoke-static/range {v2 .. v7}, Lorg/mozilla/javascript/JavaAdapter;->generateMethod(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V

    .line 438
    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v3}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 439
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v3}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 443
    if-nez v25, :cond_d

    .line 444
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v12

    move-object v6, v2

    move-object/from16 v7, p1

    move-object v9, v4

    move-object v11, v5

    invoke-static/range {v6 .. v12}, Lorg/mozilla/javascript/JavaAdapter;->generateSuper(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;)V

    .line 421
    .end local v5    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v10    # "methodSignature":Ljava/lang/String;
    .end local v32    # "methodKey":Ljava/lang/String;
    :cond_d
    add-int/lit8 v27, v27, 0x1

    goto :goto_6

    .line 454
    .end local v4    # "methodName":Ljava/lang/String;
    .end local v25    # "isAbstractMethod":Z
    .end local v31    # "method":Ljava/lang/reflect/Method;
    .end local v35    # "mods":I
    :cond_e
    new-instance v26, Lorg/mozilla/javascript/ObjToIntMap$Iterator;

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;-><init>(Lorg/mozilla/javascript/ObjToIntMap;)V

    .line 455
    .local v26, "iter":Lorg/mozilla/javascript/ObjToIntMap$Iterator;
    invoke-virtual/range {v26 .. v26}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->start()V

    :goto_7
    invoke-virtual/range {v26 .. v26}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->done()Z

    move-result v3

    if-nez v3, :cond_11

    .line 456
    invoke-virtual/range {v26 .. v26}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 457
    .local v13, "functionName":Ljava/lang/String;
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 455
    :goto_8
    invoke-virtual/range {v26 .. v26}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->next()V

    goto :goto_7

    .line 459
    :cond_f
    invoke-virtual/range {v26 .. v26}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->getValue()I

    move-result v30

    .line 460
    .local v30, "length":I
    move/from16 v0, v30

    new-array v14, v0, [Ljava/lang/Class;

    .line 461
    .local v14, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v28, 0x0

    .local v28, "k":I
    :goto_9
    move/from16 v0, v28

    move/from16 v1, v30

    if-ge v0, v1, :cond_10

    .line 462
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    aput-object v3, v14, v28

    .line 461
    add-int/lit8 v28, v28, 0x1

    goto :goto_9

    .line 463
    :cond_10
    sget-object v15, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    const/16 v16, 0x0

    move-object v11, v2

    move-object/from16 v12, p1

    invoke-static/range {v11 .. v16}, Lorg/mozilla/javascript/JavaAdapter;->generateMethod(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V

    goto :goto_8

    .line 466
    .end local v13    # "functionName":Ljava/lang/String;
    .end local v14    # "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v28    # "k":I
    .end local v30    # "length":I
    :cond_11
    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method public static createAdapterWrapper(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 4
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "adapter"    # Ljava/lang/Object;

    .prologue
    .line 106
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 107
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    new-instance v0, Lorg/mozilla/javascript/NativeJavaObject;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/mozilla/javascript/NativeJavaObject;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V

    .line 108
    .local v0, "res":Lorg/mozilla/javascript/NativeJavaObject;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeJavaObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 109
    return-object v0
.end method

.method private static doCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "f"    # Lorg/mozilla/javascript/Function;
    .param p4, "args"    # [Ljava/lang/Object;
    .param p5, "argsToWrap"    # J

    .prologue
    .line 597
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p4

    if-eq v1, v2, :cond_1

    .line 598
    const-wide/16 v2, 0x0

    const/4 v4, 0x1

    shl-int/2addr v4, v1

    int-to-long v4, v4

    and-long/2addr v4, p5

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 599
    aget-object v0, p4, v1

    .line 600
    .local v0, "arg":Ljava/lang/Object;
    instance-of v2, v0, Lorg/mozilla/javascript/Scriptable;

    if-nez v2, :cond_0

    .line 601
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p0, p1, v0, v3}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p4, v1

    .line 597
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 606
    :cond_1
    invoke-interface {p3, p0, p1, p2, p4}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private static generateCtor(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Constructor;)V
    .locals 15
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 625
    .local p3, "superCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v5, 0x3

    .line 626
    .local v5, "locals":S
    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    .line 630
    .local v9, "parameters":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v11, v9

    if-nez v11, :cond_0

    .line 631
    const-string v11, "<init>"

    const-string v12, "(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/ContextFactory;)V"

    const/4 v13, 0x1

    invoke-virtual {p0, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 637
    const/16 v11, 0x2a

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 638
    const/16 v11, 0xb7

    const-string v12, "<init>"

    const-string v13, "()V"

    move-object/from16 v0, p2

    invoke-virtual {p0, v11, v0, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    :goto_0
    const/16 v11, 0x2a

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 663
    const/16 v11, 0x2b

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 664
    const/16 v11, 0xb5

    const-string v12, "delegee"

    const-string v13, "Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p1

    invoke-virtual {p0, v11, v0, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 668
    const/16 v11, 0x2a

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 669
    const/16 v11, 0x2c

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 670
    const/16 v11, 0xb5

    const-string v12, "factory"

    const-string v13, "Lorg/mozilla/javascript/ContextFactory;"

    move-object/from16 v0, p1

    invoke-virtual {p0, v11, v0, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    const/16 v11, 0x2a

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 675
    const/16 v11, 0x2b

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 676
    const/16 v11, 0x2a

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 677
    const/16 v11, 0xb8

    const-string v12, "org/mozilla/javascript/JavaAdapter"

    const-string v13, "createAdapterWrapper"

    const-string v14, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v11, v12, v13, v14}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    const/16 v11, 0xb5

    const-string v12, "self"

    const-string v13, "Lorg/mozilla/javascript/Scriptable;"

    move-object/from16 v0, p1

    invoke-virtual {p0, v11, v0, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 686
    const/16 v11, 0xb1

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 687
    invoke-virtual {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 688
    return-void

    .line 640
    :cond_0
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/ContextFactory;"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 643
    .local v10, "sig":Ljava/lang/StringBuilder;
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    .line 644
    .local v6, "marker":I
    move-object v1, v9

    .local v1, "arr$":[Ljava/lang/Class;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_1

    aget-object v2, v1, v3

    .line 645
    .local v2, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v10, v2}, Lorg/mozilla/javascript/JavaAdapter;->appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;

    .line 644
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 647
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    const-string v11, ")V"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 648
    const-string v11, "<init>"

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v11, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 651
    const/16 v11, 0x2a

    invoke-virtual {p0, v11}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 652
    const/4 v7, 0x3

    .line 653
    .local v7, "paramOffset":S
    move-object v1, v9

    array-length v4, v1

    const/4 v3, 0x0

    :goto_2
    if-ge v3, v4, :cond_2

    aget-object v8, v1, v3

    .line 654
    .local v8, "parameter":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, v7, v8}, Lorg/mozilla/javascript/JavaAdapter;->generatePushParam(Lorg/mozilla/classfile/ClassFileWriter;ILjava/lang/Class;)I

    move-result v11

    add-int/2addr v11, v7

    int-to-short v7, v11

    .line 653
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 656
    .end local v8    # "parameter":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    move v5, v7

    .line 657
    const/4 v11, 0x1

    invoke-virtual {v10, v11, v6}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 658
    const/16 v11, 0xb7

    const-string v12, "<init>"

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {p0, v11, v0, v12, v13}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static generateEmptyCtor(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;
    .param p3, "scriptClassName"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0xb7

    const/16 v6, 0x2b

    const/4 v2, 0x1

    const/16 v5, 0xb5

    const/16 v4, 0x2a

    .line 731
    const-string v0, "<init>"

    const-string v1, "()V"

    invoke-virtual {p0, v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 734
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 735
    const-string v0, "<init>"

    const-string v1, "()V"

    invoke-virtual {p0, v3, p2, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 739
    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 740
    const-string v0, "factory"

    const-string v1, "Lorg/mozilla/javascript/ContextFactory;"

    invoke-virtual {p0, v5, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 744
    const/16 v0, 0xbb

    invoke-virtual {p0, v0, p3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 745
    const/16 v0, 0x59

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 746
    const-string v0, "<init>"

    const-string v1, "()V"

    invoke-virtual {p0, v3, p3, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 749
    const/16 v0, 0xb8

    const-string v1, "org/mozilla/javascript/JavaAdapter"

    const-string v2, "runScript"

    const-string v3, "(Lorg/mozilla/javascript/Script;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 754
    const/16 v0, 0x4c

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 757
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 758
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 759
    const-string v0, "delegee"

    const-string v1, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v5, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 764
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 765
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 766
    const/16 v0, 0xb8

    const-string v1, "org/mozilla/javascript/JavaAdapter"

    const-string v2, "createAdapterWrapper"

    const-string v3, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 772
    const-string v0, "self"

    const-string v1, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v5, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    const/16 v0, 0xb1

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 776
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 777
    return-void
.end method

.method private static generateMethod(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V
    .locals 10
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "genName"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p5, "convertResult"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 948
    .local p3, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p4, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 949
    .local v5, "sb":Ljava/lang/StringBuilder;
    invoke-static {p3, p4, v5}, Lorg/mozilla/javascript/JavaAdapter;->appendMethodSignature([Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/StringBuilder;)I

    move-result v4

    .line 950
    .local v4, "paramsEnd":I
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 951
    .local v3, "methodSignature":Ljava/lang/String;
    const/4 v6, 0x1

    invoke-virtual {p0, p2, v3, v6}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 957
    const/16 v6, 0x2a

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 958
    const/16 v6, 0xb4

    const-string v7, "factory"

    const-string v8, "Lorg/mozilla/javascript/ContextFactory;"

    invoke-virtual {p0, v6, p1, v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 962
    const/16 v6, 0x2a

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 963
    const/16 v6, 0xb4

    const-string v7, "self"

    const-string v8, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v6, p1, v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 967
    const/16 v6, 0x2a

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 968
    const/16 v6, 0xb4

    const-string v7, "delegee"

    const-string v8, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v6, p1, v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    invoke-virtual {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 971
    const/16 v6, 0xb8

    const-string v7, "org/mozilla/javascript/JavaAdapter"

    const-string v8, "getFunction"

    const-string v9, "(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Function;"

    invoke-virtual {p0, v6, v7, v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 979
    array-length v6, p3

    invoke-static {p0, p3, v6}, Lorg/mozilla/javascript/JavaAdapter;->generatePushWrappedArgs(Lorg/mozilla/classfile/ClassFileWriter;[Ljava/lang/Class;I)V

    .line 982
    array-length v6, p3

    const/16 v7, 0x40

    if-le v6, v7, :cond_0

    .line 985
    const-string v6, "JavaAdapter can not subclass methods with more then 64 arguments."

    invoke-static {v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v6

    throw v6

    .line 989
    :cond_0
    const-wide/16 v0, 0x0

    .line 990
    .local v0, "convertionMask":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, p3

    if-eq v2, v6, :cond_2

    .line 991
    aget-object v6, p3, v2

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_1

    .line 992
    const/4 v6, 0x1

    shl-int/2addr v6, v2

    int-to-long v6, v6

    or-long/2addr v0, v6

    .line 990
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 995
    :cond_2
    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(J)V

    .line 999
    const/16 v6, 0xb8

    const-string v7, "org/mozilla/javascript/JavaAdapter"

    const-string v8, "callMethod"

    const-string v9, "(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;J)Ljava/lang/Object;"

    invoke-virtual {p0, v6, v7, v8, v9}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1009
    invoke-static {p0, p4, p5}, Lorg/mozilla/javascript/JavaAdapter;->generateReturnResult(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/Class;Z)V

    .line 1011
    int-to-short v6, v4

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1012
    return-void
.end method

.method private static generatePopResult(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/Class;)V
    .locals 2
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1058
    .local p1, "retType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1059
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1060
    .local v0, "typeName":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 1081
    .end local v0    # "typeName":Ljava/lang/String;
    :goto_0
    return-void

    .line 1066
    .restart local v0    # "typeName":Ljava/lang/String;
    :sswitch_0
    const/16 v1, 0xac

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1069
    :sswitch_1
    const/16 v1, 0xad

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1072
    :sswitch_2
    const/16 v1, 0xae

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1075
    :sswitch_3
    const/16 v1, 0xaf

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1079
    .end local v0    # "typeName":Ljava/lang/String;
    :cond_0
    const/16 v1, 0xb0

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1060
    nop

    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_0
        0x63 -> :sswitch_0
        0x64 -> :sswitch_3
        0x66 -> :sswitch_2
        0x69 -> :sswitch_0
        0x6c -> :sswitch_1
        0x73 -> :sswitch_0
        0x7a -> :sswitch_0
    .end sparse-switch
.end method

.method private static generatePushParam(Lorg/mozilla/classfile/ClassFileWriter;ILjava/lang/Class;)I
    .locals 4
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "paramOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "I",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .local p2, "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 1021
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1022
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addALoad(I)V

    .line 1045
    :goto_0
    return v1

    .line 1025
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1026
    .local v0, "typeName":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 1047
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1033
    :sswitch_0
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addILoad(I)V

    goto :goto_0

    .line 1037
    :sswitch_1
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLLoad(I)V

    move v1, v2

    .line 1038
    goto :goto_0

    .line 1041
    :sswitch_2
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addFLoad(I)V

    goto :goto_0

    .line 1044
    :sswitch_3
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addDLoad(I)V

    move v1, v2

    .line 1045
    goto :goto_0

    .line 1026
    nop

    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_0
        0x63 -> :sswitch_0
        0x64 -> :sswitch_3
        0x66 -> :sswitch_2
        0x69 -> :sswitch_0
        0x6c -> :sswitch_1
        0x73 -> :sswitch_0
        0x7a -> :sswitch_0
    .end sparse-switch
.end method

.method static generatePushWrappedArgs(Lorg/mozilla/classfile/ClassFileWriter;[Ljava/lang/Class;I)V
    .locals 4
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p2, "arrayLength"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "[",
            "Ljava/lang/Class",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 789
    .local p1, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 790
    const/16 v2, 0xbd

    const-string v3, "java/lang/Object"

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 791
    const/4 v1, 0x1

    .line 792
    .local v1, "paramOffset":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-eq v0, v2, :cond_0

    .line 793
    const/16 v2, 0x59

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 794
    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 795
    aget-object v2, p1, v0

    invoke-static {p0, v1, v2}, Lorg/mozilla/javascript/JavaAdapter;->generateWrapArg(Lorg/mozilla/classfile/ClassFileWriter;ILjava/lang/Class;)I

    move-result v2

    add-int/2addr v1, v2

    .line 796
    const/16 v2, 0x53

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 792
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 798
    :cond_0
    return-void
.end method

.method static generateReturnResult(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/Class;Z)V
    .locals 7
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p2, "callConvertResult"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "retType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v6, 0xac

    const/16 v5, 0xb8

    .line 871
    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_0

    .line 872
    const/16 v2, 0x57

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 873
    const/16 v2, 0xb1

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 942
    :goto_0
    return-void

    .line 875
    :cond_0
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_1

    .line 876
    const-string v2, "org/mozilla/javascript/Context"

    const-string v3, "toBoolean"

    const-string v4, "(Ljava/lang/Object;)Z"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 879
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 881
    :cond_1
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_2

    .line 885
    const-string v2, "org/mozilla/javascript/Context"

    const-string v3, "toString"

    const-string v4, "(Ljava/lang/Object;)Ljava/lang/String;"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 889
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 890
    const/16 v2, 0xb6

    const-string v3, "java/lang/String"

    const-string v4, "charAt"

    const-string v5, "(I)C"

    invoke-virtual {p0, v2, v3, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 894
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 895
    const-string v2, "org/mozilla/javascript/Context"

    const-string v3, "toNumber"

    const-string v4, "(Ljava/lang/Object;)D"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 898
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 899
    .local v1, "typeName":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 918
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected return type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 903
    :sswitch_0
    const/16 v2, 0x8e

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 904
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 907
    :sswitch_1
    const/16 v2, 0x8f

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 908
    const/16 v2, 0xad

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 911
    :sswitch_2
    const/16 v2, 0x90

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 912
    const/16 v2, 0xae

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_0

    .line 915
    :sswitch_3
    const/16 v2, 0xaf

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_0

    .line 923
    .end local v1    # "typeName":Ljava/lang/String;
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 924
    .local v0, "retTypeStr":Ljava/lang/String;
    if-eqz p2, :cond_4

    .line 925
    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(Ljava/lang/String;)V

    .line 926
    const-string v2, "java/lang/Class"

    const-string v3, "forName"

    const-string v4, "(Ljava/lang/String;)Ljava/lang/Class;"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 931
    const-string v2, "org/mozilla/javascript/JavaAdapter"

    const-string v3, "convertResult"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 939
    :cond_4
    const/16 v2, 0xc0

    invoke-virtual {p0, v2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 940
    const/16 v2, 0xb0

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_0

    .line 899
    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_0
        0x64 -> :sswitch_3
        0x66 -> :sswitch_2
        0x69 -> :sswitch_0
        0x6c -> :sswitch_1
        0x73 -> :sswitch_0
    .end sparse-switch
.end method

.method private static generateSerialCtor(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0xb5

    const/16 v3, 0x2a

    .line 694
    const-string v0, "<init>"

    const-string v1, "(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V"

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 702
    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 703
    const/16 v0, 0xb7

    const-string v1, "<init>"

    const-string v2, "()V"

    invoke-virtual {p0, v0, p2, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 706
    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 707
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 708
    const-string v0, "factory"

    const-string v1, "Lorg/mozilla/javascript/ContextFactory;"

    invoke-virtual {p0, v4, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 713
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 714
    const-string v0, "delegee"

    const-string v1, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v4, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 717
    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 718
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 719
    const-string v0, "self"

    const-string v1, "Lorg/mozilla/javascript/Scriptable;"

    invoke-virtual {p0, v4, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    const/16 v0, 0xb1

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 723
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 724
    return-void
.end method

.method private static generateSuper(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 8
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "genName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "methodSignature"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1093
    .local p5, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p6, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "super$"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0, v6, p4, v7}, Lorg/mozilla/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1097
    const/16 v6, 0x19

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 1100
    const/4 v3, 0x1

    .line 1101
    .local v3, "paramOffset":I
    move-object v0, p5

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 1102
    .local v4, "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, v3, v4}, Lorg/mozilla/javascript/JavaAdapter;->generatePushParam(Lorg/mozilla/classfile/ClassFileWriter;ILjava/lang/Class;)I

    move-result v6

    add-int/2addr v3, v6

    .line 1101
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1106
    .end local v4    # "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const/16 v6, 0xb7

    invoke-virtual {p0, v6, p2, p3, p4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1112
    move-object v5, p6

    .line 1113
    .local v5, "retType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v6, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1114
    invoke-static {p0, v5}, Lorg/mozilla/javascript/JavaAdapter;->generatePopResult(Lorg/mozilla/classfile/ClassFileWriter;Ljava/lang/Class;)V

    .line 1118
    :goto_1
    add-int/lit8 v6, v3, 0x1

    int-to-short v6, v6

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1119
    return-void

    .line 1116
    :cond_1
    const/16 v6, 0xb1

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_1
.end method

.method private static generateWrapArg(Lorg/mozilla/classfile/ClassFileWriter;ILjava/lang/Class;)I
    .locals 7
    .param p0, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;
    .param p1, "paramOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/classfile/ClassFileWriter;",
            "I",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .local p2, "argType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v6, 0xbb

    const/16 v5, 0xb7

    const/16 v4, 0x59

    const/16 v3, 0x15

    .line 808
    const/4 v0, 0x1

    .line 809
    .local v0, "size":I
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 810
    const/16 v2, 0x19

    invoke-virtual {p0, v2, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 858
    :goto_0
    return v0

    .line 812
    :cond_0
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_1

    .line 814
    const-string v2, "java/lang/Boolean"

    invoke-virtual {p0, v6, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 815
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 816
    invoke-virtual {p0, v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 817
    const-string v2, "java/lang/Boolean"

    const-string v3, "<init>"

    const-string v4, "(Z)V"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 820
    :cond_1
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_2

    .line 822
    invoke-virtual {p0, v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 823
    const/16 v2, 0xb8

    const-string v3, "java/lang/String"

    const-string v4, "valueOf"

    const-string v5, "(C)Ljava/lang/String;"

    invoke-virtual {p0, v2, v3, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 828
    :cond_2
    const-string v2, "java/lang/Double"

    invoke-virtual {p0, v6, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 829
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 830
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 831
    .local v1, "typeName":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 855
    :goto_1
    const-string v2, "java/lang/Double"

    const-string v3, "<init>"

    const-string v4, "(D)V"

    invoke-virtual {p0, v5, v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 836
    :sswitch_0
    invoke-virtual {p0, v3, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 837
    const/16 v2, 0x87

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 841
    :sswitch_1
    const/16 v2, 0x16

    invoke-virtual {p0, v2, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 842
    const/16 v2, 0x8a

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 843
    const/4 v0, 0x2

    .line 844
    goto :goto_1

    .line 847
    :sswitch_2
    const/16 v2, 0x17

    invoke-virtual {p0, v2, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 848
    const/16 v2, 0x8d

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 851
    :sswitch_3
    const/16 v2, 0x18

    invoke-virtual {p0, v2, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 852
    const/4 v0, 0x2

    goto :goto_1

    .line 831
    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_0
        0x64 -> :sswitch_3
        0x66 -> :sswitch_2
        0x69 -> :sswitch_0
        0x6c -> :sswitch_1
        0x73 -> :sswitch_0
    .end sparse-switch
.end method

.method private static getAdapterClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;[Ljava/lang/Class;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Class;
    .locals 9
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/mozilla/javascript/Scriptable;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 320
    .local p1, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p0}, Lorg/mozilla/javascript/ClassCache;->get(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ClassCache;

    move-result-object v2

    .line 321
    .local v2, "cache":Lorg/mozilla/javascript/ClassCache;
    invoke-virtual {v2}, Lorg/mozilla/javascript/ClassCache;->getInterfaceAdapterCacheMap()Ljava/util/Map;

    move-result-object v4

    .line 324
    .local v4, "generated":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;Ljava/lang/Class<*>;>;"
    invoke-static {p3}, Lorg/mozilla/javascript/JavaAdapter;->getObjectFunctionNames(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ObjToIntMap;

    move-result-object v5

    .line 326
    .local v5, "names":Lorg/mozilla/javascript/ObjToIntMap;
    new-instance v6, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;

    invoke-direct {v6, p1, p2, v5}, Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;-><init>(Ljava/lang/Class;[Ljava/lang/Class;Lorg/mozilla/javascript/ObjToIntMap;)V

    .line 327
    .local v6, "sig":Lorg/mozilla/javascript/JavaAdapter$JavaAdapterSignature;
    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 328
    .local v0, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_0

    .line 329
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "adapter"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lorg/mozilla/javascript/ClassCache;->newClassSerialNumber()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 330
    .local v1, "adapterName":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-static {v5, v1, p1, p2, v7}, Lorg/mozilla/javascript/JavaAdapter;->createAdapterCode(Lorg/mozilla/javascript/ObjToIntMap;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;Ljava/lang/String;)[B

    move-result-object v3

    .line 333
    .local v3, "code":[B
    invoke-static {v1, v3}, Lorg/mozilla/javascript/JavaAdapter;->loadAdapterClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v0

    .line 334
    invoke-virtual {v2}, Lorg/mozilla/javascript/ClassCache;->isCachingEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 335
    invoke-interface {v4, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    .end local v1    # "adapterName":Ljava/lang/String;
    .end local v3    # "code":[B
    :cond_0
    return-object v0
.end method

.method public static getAdapterSelf(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "adapter"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "self"

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 116
    .local v0, "self":Ljava/lang/reflect/Field;
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static getArgsToConvert([Ljava/lang/Class;)[I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)[I"
        }
    .end annotation

    .prologue
    .line 1176
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 1177
    .local v1, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p0

    if-eq v3, v4, :cond_1

    .line 1178
    aget-object v4, p0, v3

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1179
    add-int/lit8 v1, v1, 0x1

    .line 1177
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1181
    :cond_1
    if-nez v1, :cond_3

    .line 1182
    const/4 v0, 0x0

    .line 1189
    :cond_2
    return-object v0

    .line 1183
    :cond_3
    new-array v0, v1, [I

    .line 1184
    .local v0, "array":[I
    const/4 v1, 0x0

    .line 1185
    const/4 v3, 0x0

    :goto_1
    array-length v4, p0

    if-eq v3, v4, :cond_2

    .line 1186
    aget-object v4, p0, v3

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_4

    .line 1187
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "count":I
    .local v2, "count":I
    aput v3, v0, v1

    move v1, v2

    .line 1185
    .end local v2    # "count":I
    .restart local v1    # "count":I
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public static getFunction(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Function;
    .locals 2
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "functionName"    # Ljava/lang/String;

    .prologue
    .line 542
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 543
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 549
    const/4 v0, 0x0

    .line 554
    .end local v0    # "x":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 551
    .restart local v0    # "x":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Lorg/mozilla/javascript/Function;

    if-nez v1, :cond_1

    .line 552
    invoke-static {v0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 554
    :cond_1
    check-cast v0, Lorg/mozilla/javascript/Function;

    goto :goto_0
.end method

.method private static getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1126
    .local p1, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1127
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lorg/mozilla/javascript/JavaAdapter;->appendMethodSignature([Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/StringBuilder;)I

    .line 1128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getObjectFunctionNames(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ObjToIntMap;
    .locals 8
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 297
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getPropertyIds(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;

    move-result-object v3

    .line 298
    .local v3, "ids":[Ljava/lang/Object;
    new-instance v5, Lorg/mozilla/javascript/ObjToIntMap;

    array-length v7, v3

    invoke-direct {v5, v7}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    .line 299
    .local v5, "map":Lorg/mozilla/javascript/ObjToIntMap;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, v3

    if-eq v1, v7, :cond_3

    .line 300
    aget-object v7, v3, v1

    instance-of v7, v7, Ljava/lang/String;

    if-nez v7, :cond_1

    .line 299
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 302
    :cond_1
    aget-object v2, v3, v1

    check-cast v2, Ljava/lang/String;

    .line 303
    .local v2, "id":Ljava/lang/String;
    invoke-static {p0, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 304
    .local v6, "value":Ljava/lang/Object;
    instance-of v7, v6, Lorg/mozilla/javascript/Function;

    if-eqz v7, :cond_0

    move-object v0, v6

    .line 305
    check-cast v0, Lorg/mozilla/javascript/Function;

    .line 306
    .local v0, "f":Lorg/mozilla/javascript/Function;
    const-string v7, "length"

    invoke-static {v0, v7}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v4

    .line 308
    .local v4, "length":I
    if-gez v4, :cond_2

    .line 309
    const/4 v4, 0x0

    .line 311
    :cond_2
    invoke-virtual {v5, v2, v4}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    goto :goto_1

    .line 314
    .end local v0    # "f":Lorg/mozilla/javascript/Function;
    .end local v2    # "id":Ljava/lang/String;
    .end local v4    # "length":I
    .end local v6    # "value":Ljava/lang/Object;
    :cond_3
    return-object v5
.end method

.method static getOverridableMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
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
    .line 471
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 472
    .local v5, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 477
    .local v6, "skip":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object v1, p0

    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v1, :cond_0

    .line 478
    invoke-static {v1, v5, v6}, Lorg/mozilla/javascript/JavaAdapter;->appendOverridableMethods(Ljava/lang/Class;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    .line 477
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 480
    :cond_0
    move-object v1, p0

    :goto_1
    if-eqz v1, :cond_2

    .line 481
    invoke-virtual {v1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_2
    if-ge v2, v4, :cond_1

    aget-object v3, v0, v2

    .line 482
    .local v3, "intf":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v3, v5, v6}, Lorg/mozilla/javascript/JavaAdapter;->appendOverridableMethods(Ljava/lang/Class;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    .line 481
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 480
    .end local v3    # "intf":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_1

    .line 484
    .end local v0    # "arr$":[Ljava/lang/Class;
    .end local v2    # "i$":I
    .end local v4    # "len$":I
    :cond_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/reflect/Method;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/reflect/Method;

    return-object v7
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    const/4 v3, 0x1

    .line 71
    new-instance v1, Lorg/mozilla/javascript/JavaAdapter;

    invoke-direct {v1}, Lorg/mozilla/javascript/JavaAdapter;-><init>()V

    .line 72
    .local v1, "obj":Lorg/mozilla/javascript/JavaAdapter;
    new-instance v0, Lorg/mozilla/javascript/IdFunctionObject;

    sget-object v2, Lorg/mozilla/javascript/JavaAdapter;->FTAG:Ljava/lang/Object;

    const-string v4, "JavaAdapter"

    move v5, v3

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)V

    .line 74
    .local v0, "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/IdFunctionObject;->markAsConstructor(Lorg/mozilla/javascript/Scriptable;)V

    .line 75
    if-eqz p2, :cond_0

    .line 76
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 78
    :cond_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->exportAsScopeProperty()V

    .line 79
    return-void
.end method

.method static js_createAdapter(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 31
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 121
    move-object/from16 v0, p2

    array-length v5, v0

    .line 122
    .local v5, "N":I
    if-nez v5, :cond_0

    .line 123
    const-string v28, "msg.adapter.zero.args"

    invoke-static/range {v28 .. v28}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v28

    throw v28

    .line 133
    :cond_0
    const/4 v11, 0x0

    .local v11, "classCount":I
    :goto_0
    add-int/lit8 v28, v5, -0x1

    move/from16 v0, v28

    if-ge v11, v0, :cond_1

    .line 134
    aget-object v8, p2, v11

    .line 139
    .local v8, "arg":Ljava/lang/Object;
    instance-of v0, v8, Lorg/mozilla/javascript/NativeObject;

    move/from16 v28, v0

    if-eqz v28, :cond_2

    .line 148
    .end local v8    # "arg":Ljava/lang/Object;
    :cond_1
    const/16 v26, 0x0

    .line 149
    .local v26, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v0, v11, [Ljava/lang/Class;

    move-object/from16 v22, v0

    .line 150
    .local v22, "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v19, 0x0

    .line 151
    .local v19, "interfaceCount":I
    const/16 v17, 0x0

    .local v17, "i":I
    move/from16 v20, v19

    .end local v19    # "interfaceCount":I
    .local v20, "interfaceCount":I
    :goto_1
    move/from16 v0, v17

    if-ge v0, v11, :cond_6

    .line 152
    aget-object v28, p2, v17

    check-cast v28, Lorg/mozilla/javascript/NativeJavaClass;

    invoke-virtual/range {v28 .. v28}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v10

    .line 153
    .local v10, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v10}, Ljava/lang/Class;->isInterface()Z

    move-result v28

    if-nez v28, :cond_5

    .line 154
    if-eqz v26, :cond_4

    .line 155
    const-string v28, "msg.only.one.super"

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v28 .. v30}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v28

    throw v28

    .line 142
    .end local v10    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v17    # "i":I
    .end local v20    # "interfaceCount":I
    .end local v22    # "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v26    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v8    # "arg":Ljava/lang/Object;
    :cond_2
    instance-of v0, v8, Lorg/mozilla/javascript/NativeJavaClass;

    move/from16 v28, v0

    if-nez v28, :cond_3

    .line 143
    const-string v28, "msg.not.java.class.arg"

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v29

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v28 .. v30}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v28

    throw v28

    .line 133
    :cond_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 158
    .end local v8    # "arg":Ljava/lang/Object;
    .restart local v10    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v17    # "i":I
    .restart local v20    # "interfaceCount":I
    .restart local v22    # "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v26    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    move-object/from16 v26, v10

    move/from16 v19, v20

    .line 151
    .end local v20    # "interfaceCount":I
    .restart local v19    # "interfaceCount":I
    :goto_2
    add-int/lit8 v17, v17, 0x1

    move/from16 v20, v19

    .end local v19    # "interfaceCount":I
    .restart local v20    # "interfaceCount":I
    goto :goto_1

    .line 160
    :cond_5
    add-int/lit8 v19, v20, 0x1

    .end local v20    # "interfaceCount":I
    .restart local v19    # "interfaceCount":I
    aput-object v10, v22, v20

    goto :goto_2

    .line 164
    .end local v10    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v19    # "interfaceCount":I
    .restart local v20    # "interfaceCount":I
    :cond_6
    if-nez v26, :cond_7

    .line 165
    sget-object v26, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    .line 168
    :cond_7
    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v21, v0

    .line 169
    .local v21, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v28

    move-object/from16 v2, v21

    move/from16 v3, v29

    move/from16 v4, v20

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 171
    aget-object v28, p2, v11

    invoke-static/range {v28 .. v28}, Lorg/mozilla/javascript/ScriptableObject;->ensureScriptable(Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v23

    .line 173
    .local v23, "obj":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    move-object/from16 v2, v21

    move-object/from16 v3, v23

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/JavaAdapter;->getAdapterClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;[Ljava/lang/Class;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Class;

    move-result-object v7

    .line 176
    .local v7, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sub-int v28, v5, v11

    add-int/lit8 v9, v28, -0x1

    .line 178
    .local v9, "argsCount":I
    if-lez v9, :cond_a

    .line 182
    add-int/lit8 v28, v9, 0x2

    :try_start_0
    move/from16 v0, v28

    new-array v13, v0, [Ljava/lang/Object;

    .line 183
    .local v13, "ctorArgs":[Ljava/lang/Object;
    const/16 v28, 0x0

    aput-object v23, v13, v28

    .line 184
    const/16 v28, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getFactory()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v29

    aput-object v29, v13, v28

    .line 185
    add-int/lit8 v28, v11, 0x1

    const/16 v29, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-static {v0, v1, v13, v2, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    new-instance v12, Lorg/mozilla/javascript/NativeJavaClass;

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-direct {v12, v0, v7, v1}, Lorg/mozilla/javascript/NativeJavaClass;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V

    .line 189
    .local v12, "classWrapper":Lorg/mozilla/javascript/NativeJavaClass;
    iget-object v0, v12, Lorg/mozilla/javascript/NativeJavaClass;->members:Lorg/mozilla/javascript/JavaMembers;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v15, v0, Lorg/mozilla/javascript/JavaMembers;->ctors:Lorg/mozilla/javascript/NativeJavaMethod;

    .line 190
    .local v15, "ctors":Lorg/mozilla/javascript/NativeJavaMethod;
    move-object/from16 v0, p0

    invoke-virtual {v15, v0, v13}, Lorg/mozilla/javascript/NativeJavaMethod;->findCachedFunction(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;)I

    move-result v18

    .line 191
    .local v18, "index":I
    if-gez v18, :cond_8

    .line 192
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    .line 193
    .local v25, "sig":Ljava/lang/String;
    const-string v28, "msg.no.java.ctor"

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v28

    throw v28
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .end local v12    # "classWrapper":Lorg/mozilla/javascript/NativeJavaClass;
    .end local v13    # "ctorArgs":[Ljava/lang/Object;
    .end local v15    # "ctors":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v18    # "index":I
    .end local v25    # "sig":Ljava/lang/String;
    :catch_0
    move-exception v16

    .line 222
    .local v16, "ex":Ljava/lang/Exception;
    invoke-static/range {v16 .. v16}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v28

    throw v28

    .line 198
    .end local v16    # "ex":Ljava/lang/Exception;
    .restart local v12    # "classWrapper":Lorg/mozilla/javascript/NativeJavaClass;
    .restart local v13    # "ctorArgs":[Ljava/lang/Object;
    .restart local v15    # "ctors":Lorg/mozilla/javascript/NativeJavaMethod;
    .restart local v18    # "index":I
    :cond_8
    :try_start_1
    iget-object v0, v15, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v28, v0

    aget-object v28, v28, v18

    move-object/from16 v0, v28

    invoke-static {v13, v0}, Lorg/mozilla/javascript/NativeJavaClass;->constructInternal([Ljava/lang/Object;Lorg/mozilla/javascript/MemberBox;)Ljava/lang/Object;

    move-result-object v6

    .line 208
    .end local v12    # "classWrapper":Lorg/mozilla/javascript/NativeJavaClass;
    .end local v15    # "ctors":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v18    # "index":I
    .local v6, "adapter":Ljava/lang/Object;
    :goto_3
    invoke-static {v7, v6}, Lorg/mozilla/javascript/JavaAdapter;->getAdapterSelf(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    .line 210
    .local v24, "self":Ljava/lang/Object;
    move-object/from16 v0, v24

    instance-of v0, v0, Lorg/mozilla/javascript/Wrapper;

    move/from16 v28, v0

    if-eqz v28, :cond_b

    .line 211
    move-object/from16 v0, v24

    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v27

    .line 212
    .local v27, "unwrapped":Ljava/lang/Object;
    move-object/from16 v0, v27

    instance-of v0, v0, Lorg/mozilla/javascript/Scriptable;

    move/from16 v28, v0

    if-eqz v28, :cond_b

    .line 213
    move-object/from16 v0, v27

    instance-of v0, v0, Lorg/mozilla/javascript/ScriptableObject;

    move/from16 v28, v0

    if-eqz v28, :cond_9

    .line 214
    move-object/from16 v0, v27

    check-cast v0, Lorg/mozilla/javascript/ScriptableObject;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;)V

    .line 220
    .end local v27    # "unwrapped":Ljava/lang/Object;
    :cond_9
    :goto_4
    return-object v27

    .line 200
    .end local v6    # "adapter":Ljava/lang/Object;
    .end local v13    # "ctorArgs":[Ljava/lang/Object;
    .end local v24    # "self":Ljava/lang/Object;
    :cond_a
    const/16 v28, 0x2

    move/from16 v0, v28

    new-array v14, v0, [Ljava/lang/Class;

    const/16 v28, 0x0

    sget-object v29, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    aput-object v29, v14, v28

    const/16 v28, 0x1

    sget-object v29, Lorg/mozilla/javascript/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    aput-object v29, v14, v28

    .line 204
    .local v14, "ctorParms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v28, 0x2

    move/from16 v0, v28

    new-array v13, v0, [Ljava/lang/Object;

    const/16 v28, 0x0

    aput-object v23, v13, v28

    const/16 v28, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getFactory()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v29

    aput-object v29, v13, v28

    .line 205
    .restart local v13    # "ctorArgs":[Ljava/lang/Object;
    invoke-virtual {v7, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .restart local v6    # "adapter":Ljava/lang/Object;
    goto :goto_3

    .end local v14    # "ctorParms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v24    # "self":Ljava/lang/Object;
    :cond_b
    move-object/from16 v27, v24

    .line 220
    goto :goto_4
.end method

.method static loadAdapterClass(Ljava/lang/String;[B)Ljava/lang/Class;
    .locals 7
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classBytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 516
    invoke-static {}, Lorg/mozilla/javascript/SecurityController;->getStaticSecurityDomainClass()Ljava/lang/Class;

    move-result-object v0

    .line 517
    .local v0, "domainClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v6, Ljava/security/CodeSource;

    if-eq v0, v6, :cond_0

    const-class v6, Ljava/security/ProtectionDomain;

    if-ne v0, v6, :cond_4

    .line 519
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/SecurityUtilities;->getScriptProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v2

    .line 520
    .local v2, "protectionDomain":Ljava/security/ProtectionDomain;
    if-nez v2, :cond_1

    .line 521
    const-class v6, Lorg/mozilla/javascript/JavaAdapter;

    invoke-virtual {v6}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v2

    .line 523
    :cond_1
    const-class v6, Ljava/security/CodeSource;

    if-ne v0, v6, :cond_3

    .line 524
    if-nez v2, :cond_2

    move-object v4, v5

    .line 533
    .end local v2    # "protectionDomain":Ljava/security/ProtectionDomain;
    :goto_0
    invoke-static {v5, v4}, Lorg/mozilla/javascript/SecurityController;->createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lorg/mozilla/javascript/GeneratedClassLoader;

    move-result-object v1

    .line 535
    .local v1, "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    invoke-interface {v1, p0, p1}, Lorg/mozilla/javascript/GeneratedClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v3

    .line 536
    .local v3, "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v1, v3}, Lorg/mozilla/javascript/GeneratedClassLoader;->linkClass(Ljava/lang/Class;)V

    .line 537
    return-object v3

    .line 524
    .end local v1    # "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    .end local v3    # "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "protectionDomain":Ljava/security/ProtectionDomain;
    :cond_2
    invoke-virtual {v2}, Ljava/security/ProtectionDomain;->getCodeSource()Ljava/security/CodeSource;

    move-result-object v4

    goto :goto_0

    .line 527
    :cond_3
    move-object v4, v2

    .local v4, "staticDomain":Ljava/security/ProtectionDomain;
    goto :goto_0

    .line 531
    .end local v2    # "protectionDomain":Ljava/security/ProtectionDomain;
    .end local v4    # "staticDomain":Ljava/security/ProtectionDomain;
    :cond_4
    const/4 v4, 0x0

    .local v4, "staticDomain":Ljava/lang/Object;
    goto :goto_0
.end method

.method public static readAdapterObject(Lorg/mozilla/javascript/Scriptable;Ljava/io/ObjectInputStream;)Ljava/lang/Object;
    .locals 12
    .param p0, "self"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 258
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v3

    .line 259
    .local v3, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v3, :cond_0

    .line 260
    invoke-virtual {v3}, Lorg/mozilla/javascript/Context;->getFactory()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v5

    .line 265
    .local v5, "factory":Lorg/mozilla/javascript/ContextFactory;
    :goto_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 267
    .local v9, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    move-object v7, v10

    check-cast v7, [Ljava/lang/String;

    .line 268
    .local v7, "interfaceNames":[Ljava/lang/String;
    array-length v10, v7

    new-array v8, v10, [Ljava/lang/Class;

    .line 270
    .local v8, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    array-length v10, v7

    if-ge v6, v10, :cond_1

    .line 271
    aget-object v10, v7, v6

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    aput-object v10, v8, v6

    .line 270
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 262
    .end local v5    # "factory":Lorg/mozilla/javascript/ContextFactory;
    .end local v6    # "i":I
    .end local v7    # "interfaceNames":[Ljava/lang/String;
    .end local v8    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v9    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    const/4 v5, 0x0

    .restart local v5    # "factory":Lorg/mozilla/javascript/ContextFactory;
    goto :goto_0

    .line 273
    .restart local v6    # "i":I
    .restart local v7    # "interfaceNames":[Ljava/lang/String;
    .restart local v8    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v9    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    .line 275
    .local v4, "delegee":Lorg/mozilla/javascript/Scriptable;
    invoke-static {p0, v9, v8, v4}, Lorg/mozilla/javascript/JavaAdapter;->getAdapterClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;[Ljava/lang/Class;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Class;

    move-result-object v0

    .line 278
    .local v0, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v10, 0x3

    new-array v2, v10, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    aput-object v11, v2, v10

    const/4 v10, 0x1

    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    aput-object v11, v2, v10

    const/4 v10, 0x2

    sget-object v11, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    aput-object v11, v2, v10

    .line 283
    .local v2, "ctorParms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v10, 0x3

    new-array v1, v10, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v1, v10

    const/4 v10, 0x1

    aput-object v4, v1, v10

    const/4 v10, 0x2

    aput-object p0, v1, v10

    .line 285
    .local v1, "ctorArgs":[Ljava/lang/Object;
    :try_start_0
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    return-object v10

    .line 289
    :catch_0
    move-exception v10

    .line 292
    :goto_2
    new-instance v10, Ljava/lang/ClassNotFoundException;

    const-string v11, "adapter"

    invoke-direct {v10, v11}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 288
    :catch_1
    move-exception v10

    goto :goto_2

    .line 287
    :catch_2
    move-exception v10

    goto :goto_2

    .line 286
    :catch_3
    move-exception v10

    goto :goto_2
.end method

.method public static runScript(Lorg/mozilla/javascript/Script;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "script"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 611
    invoke-static {}, Lorg/mozilla/javascript/ContextFactory;->getGlobal()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v0

    new-instance v1, Lorg/mozilla/javascript/JavaAdapter$2;

    invoke-direct {v1, p0}, Lorg/mozilla/javascript/JavaAdapter$2;-><init>(Lorg/mozilla/javascript/Script;)V

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ContextFactory;->call(Lorg/mozilla/javascript/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method public static writeAdapterObject(Ljava/lang/Object;Ljava/io/ObjectOutputStream;)V
    .locals 6
    .param p0, "javaObject"    # Ljava/lang/Object;
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 232
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 234
    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v4

    .line 235
    .local v4, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v5, v4

    new-array v3, v5, [Ljava/lang/String;

    .line 237
    .local v3, "interfaceNames":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v4

    if-ge v2, v5, :cond_0

    .line 238
    aget-object v5, v4, v2

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v2

    .line 237
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 240
    :cond_0
    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 243
    :try_start_0
    const-string v5, "delegee"

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 244
    .local v1, "delegee":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    return-void

    .line 247
    .end local v1    # "delegee":Ljava/lang/Object;
    :catch_0
    move-exception v5

    .line 249
    :goto_1
    new-instance v5, Ljava/io/IOException;

    invoke-direct {v5}, Ljava/io/IOException;-><init>()V

    throw v5

    .line 246
    :catch_1
    move-exception v5

    goto :goto_1
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 84
    sget-object v0, Lorg/mozilla/javascript/JavaAdapter;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 86
    invoke-static {p2, p3, p5}, Lorg/mozilla/javascript/JavaAdapter;->js_createAdapter(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 89
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
