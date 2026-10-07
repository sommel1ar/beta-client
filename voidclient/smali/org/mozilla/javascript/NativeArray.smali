.class public Lorg/mozilla/javascript/NativeArray;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/List;


# static fields
.field private static final ARRAY_TAG:Ljava/lang/Object;

.field private static final ConstructorId_concat:I = -0xd

.field private static final ConstructorId_every:I = -0x11

.field private static final ConstructorId_filter:I = -0x12

.field private static final ConstructorId_find:I = -0x16

.field private static final ConstructorId_findIndex:I = -0x17

.field private static final ConstructorId_forEach:I = -0x13

.field private static final ConstructorId_indexOf:I = -0xf

.field private static final ConstructorId_isArray:I = -0x1a

.field private static final ConstructorId_join:I = -0x5

.field private static final ConstructorId_lastIndexOf:I = -0x10

.field private static final ConstructorId_map:I = -0x14

.field private static final ConstructorId_pop:I = -0x9

.field private static final ConstructorId_push:I = -0x8

.field private static final ConstructorId_reduce:I = -0x18

.field private static final ConstructorId_reduceRight:I = -0x19

.field private static final ConstructorId_reverse:I = -0x6

.field private static final ConstructorId_shift:I = -0xa

.field private static final ConstructorId_slice:I = -0xe

.field private static final ConstructorId_some:I = -0x15

.field private static final ConstructorId_sort:I = -0x7

.field private static final ConstructorId_splice:I = -0xc

.field private static final ConstructorId_unshift:I = -0xb

.field private static final DEFAULT_INITIAL_CAPACITY:I = 0xa

.field private static final GROW_FACTOR:D = 1.5

.field private static final Id_concat:I = 0xd

.field private static final Id_constructor:I = 0x1

.field private static final Id_every:I = 0x11

.field private static final Id_filter:I = 0x12

.field private static final Id_find:I = 0x16

.field private static final Id_findIndex:I = 0x17

.field private static final Id_forEach:I = 0x13

.field private static final Id_indexOf:I = 0xf

.field private static final Id_join:I = 0x5

.field private static final Id_lastIndexOf:I = 0x10

.field private static final Id_length:I = 0x1

.field private static final Id_map:I = 0x14

.field private static final Id_pop:I = 0x9

.field private static final Id_push:I = 0x8

.field private static final Id_reduce:I = 0x18

.field private static final Id_reduceRight:I = 0x19

.field private static final Id_reverse:I = 0x6

.field private static final Id_shift:I = 0xa

.field private static final Id_slice:I = 0xe

.field private static final Id_some:I = 0x15

.field private static final Id_sort:I = 0x7

.field private static final Id_splice:I = 0xc

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toSource:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final Id_unshift:I = 0xb

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PRE_GROW_SIZE:I = 0x55555554

.field private static final MAX_PROTOTYPE_ID:I = 0x19

.field private static final NEGATIVE_ONE:Ljava/lang/Integer;

.field private static maximumInitialCapacity:I = 0x0

.field static final serialVersionUID:J = 0x65be3f5055db7c6aL


# instance fields
.field private dense:[Ljava/lang/Object;

.field private denseOnly:Z

.field private length:J

.field private lengthAttr:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-string v0, "Array"

    sput-object v0, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    .line 43
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    .line 2079
    const/16 v0, 0x2710

    sput v0, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    return-void
.end method

.method public constructor <init>(J)V
    .locals 5
    .param p1, "lengthArg"    # J

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 2063
    const/4 v1, 0x6

    iput v1, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    .line 61
    sget v1, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    int-to-long v2, v1

    cmp-long v1, p1, v2

    if-gtz v1, :cond_2

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 62
    iget-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v1, :cond_1

    .line 63
    long-to-int v0, p1

    .line 64
    .local v0, "intLength":I
    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 65
    const/16 v0, 0xa

    .line 66
    :cond_0
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 67
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .end local v0    # "intLength":I
    :cond_1
    iput-wide p1, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 70
    return-void

    .line 61
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .locals 2
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 2063
    const/4 v0, 0x6

    iput v0, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 75
    iput-object p1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 76
    array-length v0, p1

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 77
    return-void
.end method

.method private defaultIndexPropertyDescriptor(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 6
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 537
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 538
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_0

    move-object v1, p0

    .line 539
    :cond_0
    new-instance v0, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 540
    .local v0, "desc":Lorg/mozilla/javascript/ScriptableObject;
    sget-object v2, Lorg/mozilla/javascript/TopLevel$Builtins;->Object:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    .line 541
    const-string v2, "value"

    invoke-virtual {v0, v2, p1, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 542
    const-string v2, "writable"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 543
    const-string v2, "enumerable"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 544
    const-string v2, "configurable"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 545
    return-object v0
.end method

.method private static defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 765
    const-wide/32 v2, 0x7fffffff

    cmp-long v1, p2, v2

    if-lez v1, :cond_0

    .line 766
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 767
    .local v0, "id":Ljava/lang/String;
    invoke-interface {p1, v0, p1, p4}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 771
    .end local v0    # "id":Ljava/lang/String;
    :goto_0
    return-void

    .line 769
    :cond_0
    long-to-int v1, p2

    invoke-interface {p1, v1, p1, p4}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static deleteElem(Lorg/mozilla/javascript/Scriptable;J)V
    .locals 5
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # J

    .prologue
    .line 742
    long-to-int v0, p1

    .line 743
    .local v0, "i":I
    int-to-long v2, v0

    cmp-long v1, v2, p1

    if-nez v1, :cond_0

    invoke-interface {p0, v0}, Lorg/mozilla/javascript/Scriptable;->delete(I)V

    .line 745
    :goto_0
    return-void

    .line 744
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Lorg/mozilla/javascript/Scriptable;->delete(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private ensureCapacity(I)Z
    .locals 6
    .param p1, "capacity"    # I

    .prologue
    const/4 v1, 0x0

    .line 412
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    if-le p1, v2, :cond_1

    .line 413
    const v2, 0x55555554

    if-le p1, v2, :cond_0

    .line 414
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 424
    :goto_0
    return v1

    .line 417
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 418
    new-array v0, p1, [Ljava/lang/Object;

    .line 419
    .local v0, "newDense":[Ljava/lang/Object;
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-object v3, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v3, v3

    invoke-static {v2, v1, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 420
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v1, v1

    array-length v2, v0

    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 422
    iput-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 424
    .end local v0    # "newDense":[Ljava/lang/Object;
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J

    .prologue
    .line 749
    invoke-static {p1, p2, p3}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 750
    .local v0, "elem":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .end local v0    # "elem":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "elem":Ljava/lang/Object;
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0
.end method

.method static getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 715
    instance-of v1, p1, Lorg/mozilla/javascript/NativeString;

    if-eqz v1, :cond_0

    .line 716
    check-cast p1, Lorg/mozilla/javascript/NativeString;

    .end local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeString;->getLength()I

    move-result v1

    int-to-long v2, v1

    .line 725
    :goto_0
    return-wide v2

    .line 717
    .restart local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    instance-of v1, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v1, :cond_1

    .line 718
    check-cast p1, Lorg/mozilla/javascript/NativeArray;

    .end local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeArray;->getLength()J

    move-result-wide v2

    goto :goto_0

    .line 720
    .restart local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    const-string v1, "length"

    invoke-static {p1, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 721
    .local v0, "len":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    .line 723
    const-wide/16 v2, 0x0

    goto :goto_0

    .line 725
    :cond_2
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v2

    goto :goto_0
.end method

.method static getMaximumInitialCapacity()I
    .locals 1

    .prologue
    .line 52
    sget v0, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    return v0
.end method

.method private static getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;
    .locals 3
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # J

    .prologue
    .line 755
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 756
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 758
    :goto_0
    return-object v0

    :cond_0
    long-to-int v0, p1

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 47
    new-instance v0, Lorg/mozilla/javascript/NativeArray;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    .line 48
    .local v0, "obj":Lorg/mozilla/javascript/NativeArray;
    const/16 v1, 0x19

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeArray;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 49
    return-void
.end method

.method private static iterativeMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 24
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "id"    # I
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1599
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v16

    .line 1600
    .local v16, "length":J
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v21, v0

    if-lez v21, :cond_1

    const/16 v21, 0x0

    aget-object v5, p4, v21

    .line 1601
    .local v5, "callbackArg":Ljava/lang/Object;
    :goto_0
    if-eqz v5, :cond_0

    instance-of v0, v5, Lorg/mozilla/javascript/Function;

    move/from16 v21, v0

    if-nez v21, :cond_2

    .line 1602
    :cond_0
    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v21

    throw v21

    .line 1600
    .end local v5    # "callbackArg":Ljava/lang/Object;
    :cond_1
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 1603
    .restart local v5    # "callbackArg":Ljava/lang/Object;
    :cond_2
    const/16 v21, 0x16

    move/from16 v0, p1

    move/from16 v1, v21

    if-eq v0, v1, :cond_3

    const/16 v21, 0x17

    move/from16 v0, p1

    move/from16 v1, v21

    if-ne v0, v1, :cond_4

    :cond_3
    instance-of v0, v5, Lorg/mozilla/javascript/NativeFunction;

    move/from16 v21, v0

    if-nez v21, :cond_4

    .line 1604
    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v21

    throw v21

    :cond_4
    move-object v7, v5

    .line 1607
    check-cast v7, Lorg/mozilla/javascript/Function;

    .line 1608
    .local v7, "f":Lorg/mozilla/javascript/Function;
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v11

    .line 1610
    .local v11, "parent":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v21, v0

    const/16 v22, 0x2

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_5

    const/16 v21, 0x1

    aget-object v21, p4, v21

    if-eqz v21, :cond_5

    const/16 v21, 0x1

    aget-object v21, p4, v21

    sget-object v22, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    if-ne v0, v1, :cond_7

    .line 1611
    :cond_5
    move-object/from16 v20, v11

    .line 1616
    .local v20, "thisArg":Lorg/mozilla/javascript/Scriptable;
    :goto_1
    const/16 v21, 0x16

    move/from16 v0, v21

    move/from16 v1, p1

    if-eq v0, v1, :cond_6

    const/16 v21, 0x17

    move/from16 v0, v21

    move/from16 v1, p1

    if-ne v0, v1, :cond_8

    :cond_6
    move-object/from16 v0, v20

    move-object/from16 v1, p3

    if-ne v0, v1, :cond_8

    .line 1617
    const-string v21, "Array.prototype method called on null or undefined"

    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v21

    throw v21

    .line 1613
    .end local v20    # "thisArg":Lorg/mozilla/javascript/Scriptable;
    :cond_7
    const/16 v21, 0x1

    aget-object v21, p4, v21

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v20

    .restart local v20    # "thisArg":Lorg/mozilla/javascript/Scriptable;
    goto :goto_1

    .line 1620
    :cond_8
    const/4 v4, 0x0

    .line 1621
    .local v4, "array":Lorg/mozilla/javascript/Scriptable;
    const/16 v21, 0x12

    move/from16 v0, p1

    move/from16 v1, v21

    if-eq v0, v1, :cond_9

    const/16 v21, 0x14

    move/from16 v0, p1

    move/from16 v1, v21

    if-ne v0, v1, :cond_a

    .line 1622
    :cond_9
    const/16 v21, 0x14

    move/from16 v0, p1

    move/from16 v1, v21

    if-ne v0, v1, :cond_b

    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v19, v0

    .line 1623
    .local v19, "resultLength":I
    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 1625
    .end local v19    # "resultLength":I
    :cond_a
    const-wide/16 v12, 0x0

    .line 1626
    .local v12, "j":J
    const-wide/16 v8, 0x0

    .local v8, "i":J
    move-wide v14, v12

    .end local v12    # "j":J
    .local v14, "j":J
    :goto_3
    cmp-long v21, v8, v16

    if-gez v21, :cond_e

    .line 1627
    const/16 v21, 0x3

    move/from16 v0, v21

    new-array v10, v0, [Ljava/lang/Object;

    .line 1628
    .local v10, "innerArgs":[Ljava/lang/Object;
    move-object/from16 v0, p3

    invoke-static {v0, v8, v9}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v6

    .line 1629
    .local v6, "elem":Ljava/lang/Object;
    sget-object v21, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v21

    if-ne v6, v0, :cond_c

    move-wide v12, v14

    .line 1626
    .end local v14    # "j":J
    .restart local v12    # "j":J
    :goto_4
    const-wide/16 v22, 0x1

    add-long v8, v8, v22

    move-wide v14, v12

    .end local v12    # "j":J
    .restart local v14    # "j":J
    goto :goto_3

    .line 1622
    .end local v6    # "elem":Ljava/lang/Object;
    .end local v8    # "i":J
    .end local v10    # "innerArgs":[Ljava/lang/Object;
    .end local v14    # "j":J
    :cond_b
    const/16 v19, 0x0

    goto :goto_2

    .line 1632
    .restart local v6    # "elem":Ljava/lang/Object;
    .restart local v8    # "i":J
    .restart local v10    # "innerArgs":[Ljava/lang/Object;
    .restart local v14    # "j":J
    :cond_c
    const/16 v21, 0x0

    aput-object v6, v10, v21

    .line 1633
    const/16 v21, 0x1

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    aput-object v22, v10, v21

    .line 1634
    const/16 v21, 0x2

    aput-object p3, v10, v21

    .line 1635
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-interface {v7, v0, v11, v1, v10}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .line 1636
    .local v18, "result":Ljava/lang/Object;
    packed-switch p1, :pswitch_data_0

    :cond_d
    move-wide v12, v14

    .end local v14    # "j":J
    .restart local v12    # "j":J
    goto :goto_4

    .line 1638
    .end local v12    # "j":J
    .restart local v14    # "j":J
    :pswitch_0
    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_d

    .line 1639
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1676
    .end local v6    # "elem":Ljava/lang/Object;
    .end local v10    # "innerArgs":[Ljava/lang/Object;
    .end local v18    # "result":Ljava/lang/Object;
    :goto_5
    return-object v6

    .line 1642
    .restart local v6    # "elem":Ljava/lang/Object;
    .restart local v10    # "innerArgs":[Ljava/lang/Object;
    .restart local v18    # "result":Ljava/lang/Object;
    :pswitch_1
    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    .line 1643
    const-wide/16 v22, 0x1

    add-long v12, v14, v22

    .end local v14    # "j":J
    .restart local v12    # "j":J
    const/16 v21, 0x0

    aget-object v21, v10, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-static {v0, v4, v14, v15, v1}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    goto :goto_4

    .end local v12    # "j":J
    .restart local v14    # "j":J
    :pswitch_2
    move-wide v12, v14

    .line 1646
    .end local v14    # "j":J
    .restart local v12    # "j":J
    goto :goto_4

    .line 1648
    .end local v12    # "j":J
    .restart local v14    # "j":J
    :pswitch_3
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v4, v8, v9, v1}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    move-wide v12, v14

    .line 1649
    .end local v14    # "j":J
    .restart local v12    # "j":J
    goto :goto_4

    .line 1651
    .end local v12    # "j":J
    .restart local v14    # "j":J
    :pswitch_4
    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    .line 1652
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_5

    .line 1655
    :pswitch_5
    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    goto :goto_5

    .line 1659
    :pswitch_6
    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    .line 1660
    long-to-double v0, v8

    move-wide/from16 v22, v0

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v6

    goto :goto_5

    .line 1664
    .end local v6    # "elem":Ljava/lang/Object;
    .end local v10    # "innerArgs":[Ljava/lang/Object;
    .end local v18    # "result":Ljava/lang/Object;
    :cond_e
    packed-switch p1, :pswitch_data_1

    .line 1676
    :pswitch_7
    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_5

    .line 1666
    :pswitch_8
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_5

    :pswitch_9
    move-object v6, v4

    .line 1669
    goto :goto_5

    .line 1671
    :pswitch_a
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_5

    .line 1673
    :pswitch_b
    const-wide/high16 v22, -0x4010000000000000L    # -1.0

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v6

    goto :goto_5

    .line 1636
    nop

    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 1664
    :pswitch_data_1
    .packed-switch 0x11
        :pswitch_8
        :pswitch_9
        :pswitch_7
        :pswitch_9
        :pswitch_a
        :pswitch_7
        :pswitch_b
    .end packed-switch
.end method

.method private static jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 596
    array-length v4, p2

    if-nez v4, :cond_0

    .line 597
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    const-wide/16 v6, 0x0

    invoke-direct {v4, v6, v7}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    .line 614
    :goto_0
    return-object v4

    .line 602
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v4

    const/16 v5, 0x78

    if-ne v4, v5, :cond_1

    .line 603
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v4, p2}, Lorg/mozilla/javascript/NativeArray;-><init>([Ljava/lang/Object;)V

    goto :goto_0

    .line 605
    :cond_1
    const/4 v4, 0x0

    aget-object v0, p2, v4

    .line 606
    .local v0, "arg0":Ljava/lang/Object;
    array-length v4, p2

    const/4 v5, 0x1

    if-gt v4, v5, :cond_2

    instance-of v4, v0, Ljava/lang/Number;

    if-nez v4, :cond_3

    .line 607
    :cond_2
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v4, p2}, Lorg/mozilla/javascript/NativeArray;-><init>([Ljava/lang/Object;)V

    goto :goto_0

    .line 609
    :cond_3
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v2

    .line 610
    .local v2, "len":J
    long-to-double v4, v2

    check-cast v0, Ljava/lang/Number;

    .end local v0    # "arg0":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-eqz v4, :cond_4

    .line 611
    const-string v4, "msg.arraylength.bad"

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 612
    .local v1, "msg":Ljava/lang/String;
    const-string v4, "RangeError"

    invoke-static {v4, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v4

    throw v4

    .line 614
    .end local v1    # "msg":Ljava/lang/String;
    :cond_4
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v4, v2, v3}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    goto :goto_0
.end method

.method private static js_concat(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 28
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1352
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeArray;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1353
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v11

    .line 1354
    .local v11, "result":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_4

    instance-of v0, v11, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_4

    move-object/from16 v9, p2

    .line 1355
    check-cast v9, Lorg/mozilla/javascript/NativeArray;

    .local v9, "denseThis":Lorg/mozilla/javascript/NativeArray;
    move-object v8, v11

    .line 1356
    check-cast v8, Lorg/mozilla/javascript/NativeArray;

    .line 1357
    .local v8, "denseResult":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v0, v9, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    move/from16 v21, v0

    if-eqz v21, :cond_4

    iget-boolean v0, v8, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    move/from16 v21, v0

    if-eqz v21, :cond_4

    .line 1359
    const/4 v5, 0x1

    .line 1360
    .local v5, "canUseDense":Z
    iget-wide v0, v9, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    long-to-int v14, v0

    .line 1361
    .local v14, "length":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_1

    if-eqz v5, :cond_1

    .line 1362
    aget-object v21, p3, v10

    move-object/from16 v0, v21

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_0

    .line 1365
    aget-object v4, p3, v10

    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1366
    .local v4, "arg":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v5, v4, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 1367
    int-to-long v0, v14

    move-wide/from16 v22, v0

    iget-wide v0, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v24, v0

    add-long v22, v22, v24

    move-wide/from16 v0, v22

    long-to-int v14, v0

    .line 1361
    .end local v4    # "arg":Lorg/mozilla/javascript/NativeArray;
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 1369
    :cond_0
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 1372
    :cond_1
    if-eqz v5, :cond_4

    invoke-direct {v8, v14}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v21

    if-eqz v21, :cond_4

    .line 1373
    iget-object v0, v9, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget-object v0, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    iget-wide v0, v9, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v26, v0

    move-wide/from16 v0, v26

    long-to-int v0, v0

    move/from16 v25, v0

    invoke-static/range {v21 .. v25}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1375
    iget-wide v0, v9, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    long-to-int v6, v0

    .line 1376
    .local v6, "cursor":I
    const/4 v10, 0x0

    :goto_2
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_3

    if-eqz v5, :cond_3

    .line 1377
    aget-object v21, p3, v10

    move-object/from16 v0, v21

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_2

    .line 1378
    aget-object v4, p3, v10

    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1379
    .restart local v4    # "arg":Lorg/mozilla/javascript/NativeArray;
    iget-object v0, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget-object v0, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v23, v0

    iget-wide v0, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v1, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1382
    iget-wide v0, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v21, v0

    add-int v6, v6, v21

    .line 1376
    .end local v4    # "arg":Lorg/mozilla/javascript/NativeArray;
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 1384
    :cond_2
    iget-object v0, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v21, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "cursor":I
    .local v7, "cursor":I
    aget-object v22, p3, v10

    aput-object v22, v21, v6

    move v6, v7

    .end local v7    # "cursor":I
    .restart local v6    # "cursor":I
    goto :goto_3

    .line 1387
    :cond_3
    int-to-long v0, v14

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    iput-wide v0, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1433
    .end local v5    # "canUseDense":Z
    .end local v6    # "cursor":I
    .end local v8    # "denseResult":Lorg/mozilla/javascript/NativeArray;
    .end local v9    # "denseThis":Lorg/mozilla/javascript/NativeArray;
    .end local v14    # "length":I
    :goto_4
    return-object v11

    .line 1394
    .end local v10    # "i":I
    :cond_4
    const-wide/16 v16, 0x0

    .line 1399
    .local v16, "slot":J
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_6

    .line 1400
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v14

    .line 1403
    .local v14, "length":J
    const-wide/16 v16, 0x0

    :goto_5
    cmp-long v21, v16, v14

    if-gez v21, :cond_7

    .line 1404
    move-object/from16 v0, p2

    move-wide/from16 v1, v16

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v20

    .line 1405
    .local v20, "temp":Ljava/lang/Object;
    sget-object v21, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_5

    .line 1406
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, v20

    invoke-static {v0, v11, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1403
    :cond_5
    const-wide/16 v22, 0x1

    add-long v16, v16, v22

    goto :goto_5

    .line 1410
    .end local v14    # "length":J
    .end local v20    # "temp":Ljava/lang/Object;
    :cond_6
    const-wide/16 v22, 0x1

    add-long v18, v16, v22

    .end local v16    # "slot":J
    .local v18, "slot":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, p2

    invoke-static {v0, v11, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    move-wide/from16 v16, v18

    .line 1417
    .end local v18    # "slot":J
    .restart local v16    # "slot":J
    :cond_7
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_6
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_b

    .line 1418
    aget-object v21, p3, v10

    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_9

    .line 1420
    aget-object v4, p3, v10

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    .line 1421
    .local v4, "arg":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v14

    .line 1422
    .restart local v14    # "length":J
    const-wide/16 v12, 0x0

    .local v12, "j":J
    :goto_7
    cmp-long v21, v12, v14

    if-gez v21, :cond_a

    .line 1423
    invoke-static {v4, v12, v13}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v20

    .line 1424
    .restart local v20    # "temp":Ljava/lang/Object;
    sget-object v21, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_8

    .line 1425
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, v20

    invoke-static {v0, v11, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1422
    :cond_8
    const-wide/16 v22, 0x1

    add-long v12, v12, v22

    const-wide/16 v22, 0x1

    add-long v16, v16, v22

    goto :goto_7

    .line 1429
    .end local v4    # "arg":Lorg/mozilla/javascript/Scriptable;
    .end local v12    # "j":J
    .end local v14    # "length":J
    .end local v20    # "temp":Ljava/lang/Object;
    :cond_9
    const-wide/16 v22, 0x1

    add-long v18, v16, v22

    .end local v16    # "slot":J
    .restart local v18    # "slot":J
    aget-object v21, p3, v10

    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, v21

    invoke-static {v0, v11, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    move-wide/from16 v16, v18

    .line 1417
    .end local v18    # "slot":J
    .restart local v16    # "slot":J
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 1432
    :cond_b
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    invoke-static {v0, v11, v1, v2}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    goto/16 :goto_4
.end method

.method private static js_indexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1486
    array-length v10, p2

    if-lez v10, :cond_2

    const/4 v10, 0x0

    aget-object v0, p2, v10

    .line 1487
    .local v0, "compareTo":Ljava/lang/Object;
    :goto_0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v4

    .line 1499
    .local v4, "length":J
    array-length v10, p2

    const/4 v11, 0x2

    if-ge v10, v11, :cond_3

    .line 1501
    const-wide/16 v8, 0x0

    .line 1511
    .local v8, "start":J
    :cond_0
    instance-of v10, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v10, :cond_7

    move-object v1, p1

    .line 1512
    check-cast v1, Lorg/mozilla/javascript/NativeArray;

    .line 1513
    .local v1, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v10, v1, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v10, :cond_7

    .line 1514
    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeArray;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    .line 1515
    .local v6, "proto":Lorg/mozilla/javascript/Scriptable;
    long-to-int v2, v8

    .local v2, "i":I
    :goto_1
    int-to-long v10, v2

    cmp-long v10, v10, v4

    if-gez v10, :cond_6

    .line 1516
    iget-object v10, v1, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v7, v10, v2

    .line 1517
    .local v7, "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v7, v10, :cond_1

    if-eqz v6, :cond_1

    .line 1518
    invoke-static {v6, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v7

    .line 1520
    :cond_1
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v10, :cond_5

    invoke-static {v7, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 1523
    int-to-long v10, v2

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    .line 1535
    .end local v1    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v2    # "i":I
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .end local v7    # "val":Ljava/lang/Object;
    :goto_2
    return-object v10

    .line 1486
    .end local v0    # "compareTo":Ljava/lang/Object;
    .end local v4    # "length":J
    .end local v8    # "start":J
    :cond_2
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 1503
    .restart local v0    # "compareTo":Ljava/lang/Object;
    .restart local v4    # "length":J
    :cond_3
    const/4 v10, 0x1

    aget-object v10, p2, v10

    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v10

    double-to-long v8, v10

    .line 1504
    .restart local v8    # "start":J
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-gez v10, :cond_4

    .line 1505
    add-long/2addr v8, v4

    .line 1506
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-gez v10, :cond_4

    .line 1507
    const-wide/16 v8, 0x0

    .line 1509
    :cond_4
    const-wide/16 v10, 0x1

    sub-long v10, v4, v10

    cmp-long v10, v8, v10

    if-lez v10, :cond_0

    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_2

    .line 1515
    .restart local v1    # "na":Lorg/mozilla/javascript/NativeArray;
    .restart local v2    # "i":I
    .restart local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .restart local v7    # "val":Ljava/lang/Object;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1526
    .end local v7    # "val":Ljava/lang/Object;
    :cond_6
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_2

    .line 1529
    .end local v1    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v2    # "i":I
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_7
    move-wide v2, v8

    .local v2, "i":J
    :goto_3
    cmp-long v10, v2, v4

    if-gez v10, :cond_9

    .line 1530
    invoke-static {p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v7

    .line 1531
    .restart local v7    # "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v10, :cond_8

    invoke-static {v7, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 1532
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_2

    .line 1529
    :cond_8
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    goto :goto_3

    .line 1535
    .end local v7    # "val":Ljava/lang/Object;
    :cond_9
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_2
.end method

.method private static js_isArray(Ljava/lang/Object;)Z
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 1718
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_0

    .line 1719
    const/4 v0, 0x0

    .line 1721
    .end local p0    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    const-string v0, "Array"

    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private static js_join(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 896
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v6

    .line 897
    .local v6, "llength":J
    long-to-int v4, v6

    .line 898
    .local v4, "length":I
    int-to-long v14, v4

    cmp-long v13, v6, v14

    if-eqz v13, :cond_0

    .line 899
    const-string v13, "msg.arraylength.too.big"

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v13

    throw v13

    .line 903
    :cond_0
    move-object/from16 v0, p2

    array-length v13, v0

    const/4 v14, 0x1

    if-lt v13, v14, :cond_1

    const/4 v13, 0x0

    aget-object v13, p2, v13

    sget-object v14, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v13, v14, :cond_4

    :cond_1
    const-string v9, ","

    .line 906
    .local v9, "separator":Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v13, :cond_6

    move-object/from16 v5, p1

    .line 907
    check-cast v5, Lorg/mozilla/javascript/NativeArray;

    .line 908
    .local v5, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v13, v5, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v13, :cond_6

    .line 909
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 910
    .local v8, "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v4, :cond_5

    .line 911
    if-eqz v3, :cond_2

    .line 912
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 914
    :cond_2
    iget-object v13, v5, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v13, v13

    if-ge v3, v13, :cond_3

    .line 915
    iget-object v13, v5, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v11, v13, v3

    .line 916
    .local v11, "temp":Ljava/lang/Object;
    if-eqz v11, :cond_3

    sget-object v13, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v11, v13, :cond_3

    sget-object v13, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v11, v13, :cond_3

    .line 919
    invoke-static {v11}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 910
    .end local v11    # "temp":Ljava/lang/Object;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 903
    .end local v3    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    .end local v9    # "separator":Ljava/lang/String;
    :cond_4
    const/4 v13, 0x0

    aget-object v13, p2, v13

    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 923
    .restart local v3    # "i":I
    .restart local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .restart local v8    # "sb":Ljava/lang/StringBuilder;
    .restart local v9    # "separator":Ljava/lang/String;
    :cond_5
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 951
    .end local v3    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    :goto_2
    return-object v13

    .line 926
    :cond_6
    if-nez v4, :cond_7

    .line 927
    const-string v13, ""

    goto :goto_2

    .line 929
    :cond_7
    new-array v2, v4, [Ljava/lang/String;

    .line 930
    .local v2, "buf":[Ljava/lang/String;
    const/4 v12, 0x0

    .line 931
    .local v12, "total_size":I
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_3
    if-eq v3, v4, :cond_9

    .line 932
    int-to-long v14, v3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v14, v15}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v11

    .line 933
    .restart local v11    # "temp":Ljava/lang/Object;
    if-eqz v11, :cond_8

    sget-object v13, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v11, v13, :cond_8

    .line 934
    invoke-static {v11}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 935
    .local v10, "str":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    add-int/2addr v12, v13

    .line 936
    aput-object v10, v2, v3

    .line 931
    .end local v10    # "str":Ljava/lang/String;
    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 939
    .end local v11    # "temp":Ljava/lang/Object;
    :cond_9
    add-int/lit8 v13, v4, -0x1

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v14

    mul-int/2addr v13, v14

    add-int/2addr v12, v13

    .line 940
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 941
    .restart local v8    # "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    :goto_4
    if-eq v3, v4, :cond_c

    .line 942
    if-eqz v3, :cond_a

    .line 943
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    :cond_a
    aget-object v10, v2, v3

    .line 946
    .restart local v10    # "str":Ljava/lang/String;
    if-eqz v10, :cond_b

    .line 948
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 951
    .end local v10    # "str":Ljava/lang/String;
    :cond_c
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_2
.end method

.method private static js_lastIndexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1541
    array-length v10, p2

    if-lez v10, :cond_2

    const/4 v10, 0x0

    aget-object v0, p2, v10

    .line 1542
    .local v0, "compareTo":Ljava/lang/Object;
    :goto_0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v4

    .line 1555
    .local v4, "length":J
    array-length v10, p2

    const/4 v11, 0x2

    if-ge v10, v11, :cond_3

    .line 1557
    const-wide/16 v10, 0x1

    sub-long v8, v4, v10

    .line 1566
    .local v8, "start":J
    :cond_0
    instance-of v10, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v10, :cond_8

    move-object v1, p1

    .line 1567
    check-cast v1, Lorg/mozilla/javascript/NativeArray;

    .line 1568
    .local v1, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v10, v1, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v10, :cond_8

    .line 1569
    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeArray;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    .line 1570
    .local v6, "proto":Lorg/mozilla/javascript/Scriptable;
    long-to-int v2, v8

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_7

    .line 1571
    iget-object v10, v1, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v7, v10, v2

    .line 1572
    .local v7, "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v7, v10, :cond_1

    if-eqz v6, :cond_1

    .line 1573
    invoke-static {v6, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v7

    .line 1575
    :cond_1
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v10, :cond_6

    invoke-static {v7, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 1578
    int-to-long v10, v2

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    .line 1590
    .end local v1    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v2    # "i":I
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .end local v7    # "val":Ljava/lang/Object;
    :goto_2
    return-object v10

    .line 1541
    .end local v0    # "compareTo":Ljava/lang/Object;
    .end local v4    # "length":J
    .end local v8    # "start":J
    :cond_2
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 1559
    .restart local v0    # "compareTo":Ljava/lang/Object;
    .restart local v4    # "length":J
    :cond_3
    const/4 v10, 0x1

    aget-object v10, p2, v10

    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v10

    double-to-long v8, v10

    .line 1560
    .restart local v8    # "start":J
    cmp-long v10, v8, v4

    if-ltz v10, :cond_5

    .line 1561
    const-wide/16 v10, 0x1

    sub-long v8, v4, v10

    .line 1564
    :cond_4
    :goto_3
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-gez v10, :cond_0

    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_2

    .line 1562
    :cond_5
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-gez v10, :cond_4

    .line 1563
    add-long/2addr v8, v4

    goto :goto_3

    .line 1570
    .restart local v1    # "na":Lorg/mozilla/javascript/NativeArray;
    .restart local v2    # "i":I
    .restart local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .restart local v7    # "val":Ljava/lang/Object;
    :cond_6
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 1581
    .end local v7    # "val":Ljava/lang/Object;
    :cond_7
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_2

    .line 1584
    .end local v1    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v2    # "i":I
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_8
    move-wide v2, v8

    .local v2, "i":J
    :goto_4
    const-wide/16 v10, 0x0

    cmp-long v10, v2, v10

    if-ltz v10, :cond_a

    .line 1585
    invoke-static {p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v7

    .line 1586
    .restart local v7    # "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v10, :cond_9

    invoke-static {v7, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 1587
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_2

    .line 1584
    :cond_9
    const-wide/16 v10, 0x1

    sub-long/2addr v2, v10

    goto :goto_4

    .line 1590
    .end local v7    # "val":Ljava/lang/Object;
    :cond_a
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_2
.end method

.method private static js_pop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide/16 v10, 0x1

    const-wide/16 v8, 0x0

    .line 1106
    instance-of v5, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v5, :cond_0

    move-object v2, p1

    .line 1107
    check-cast v2, Lorg/mozilla/javascript/NativeArray;

    .line 1108
    .local v2, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v5, v2, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_0

    iget-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v5, v6, v8

    if-lez v5, :cond_0

    .line 1109
    iget-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    sub-long/2addr v6, v10

    iput-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1110
    iget-object v5, v2, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v6, v6

    aget-object v3, v5, v6

    .line 1111
    .local v3, "result":Ljava/lang/Object;
    iget-object v5, v2, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v6, v6

    sget-object v7, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v7, v5, v6

    move-object v4, v3

    .line 1132
    .end local v2    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v3    # "result":Ljava/lang/Object;
    .local v4, "result":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 1115
    .end local v4    # "result":Ljava/lang/Object;
    :cond_0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v0

    .line 1116
    .local v0, "length":J
    cmp-long v5, v0, v8

    if-lez v5, :cond_1

    .line 1117
    sub-long/2addr v0, v10

    .line 1120
    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 1124
    .restart local v3    # "result":Ljava/lang/Object;
    invoke-static {p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 1130
    :goto_1
    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-object v4, v3

    .line 1132
    .end local v3    # "result":Ljava/lang/Object;
    .restart local v4    # "result":Ljava/lang/Object;
    goto :goto_0

    .line 1126
    .end local v4    # "result":Ljava/lang/Object;
    :cond_1
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .restart local v3    # "result":Ljava/lang/Object;
    goto :goto_1
.end method

.method private static js_push(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1069
    instance-of v5, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v5, :cond_1

    move-object v4, p1

    .line 1070
    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1071
    .local v4, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v5, v4, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_1

    iget-wide v6, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v5, v6

    array-length v6, p2

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1074
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p2

    if-ge v0, v5, :cond_0

    .line 1075
    iget-object v5, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v6, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v6

    iput-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v6, v6

    aget-object v7, p2, v0

    aput-object v7, v5, v6

    .line 1074
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1077
    :cond_0
    iget-wide v6, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v6, v6

    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    .line 1099
    .end local v4    # "na":Lorg/mozilla/javascript/NativeArray;
    :goto_1
    return-object v5

    .line 1080
    .end local v0    # "i":I
    :cond_1
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v2

    .line 1081
    .local v2, "length":J
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    array-length v5, p2

    if-ge v0, v5, :cond_2

    .line 1082
    int-to-long v6, v0

    add-long/2addr v6, v2

    aget-object v5, p2, v0

    invoke-static {p0, p1, v6, v7, v5}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1081
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1085
    :cond_2
    array-length v5, p2

    int-to-long v6, v5

    add-long/2addr v2, v6

    .line 1086
    invoke-static {p0, p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v1

    .line 1092
    .local v1, "lengthObj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v5

    const/16 v6, 0x78

    if-ne v5, v6, :cond_4

    .line 1094
    array-length v5, p2

    if-nez v5, :cond_3

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    :cond_3
    array-length v5, p2

    add-int/lit8 v5, v5, -0x1

    aget-object v5, p2, v5

    goto :goto_1

    :cond_4
    move-object v5, v1

    .line 1099
    goto :goto_1
.end method

.method private static js_reverse(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 18
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 960
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v14, :cond_0

    move-object/from16 v10, p1

    .line 961
    check-cast v10, Lorg/mozilla/javascript/NativeArray;

    .line 962
    .local v10, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v14, v10, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v14, :cond_0

    .line 963
    const/4 v4, 0x0

    .local v4, "i":I
    iget-wide v14, v10, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v14, v14

    add-int/lit8 v6, v14, -0x1

    .local v6, "j":I
    :goto_0
    if-ge v4, v6, :cond_1

    .line 964
    iget-object v14, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v11, v14, v4

    .line 965
    .local v11, "temp":Ljava/lang/Object;
    iget-object v14, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-object v15, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v15, v15, v6

    aput-object v15, v14, v4

    .line 966
    iget-object v14, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aput-object v11, v14, v6

    .line 963
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 971
    .end local v4    # "i":I
    .end local v6    # "j":I
    .end local v10    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v11    # "temp":Ljava/lang/Object;
    :cond_0
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v8

    .line 973
    .local v8, "len":J
    const-wide/16 v14, 0x2

    div-long v2, v8, v14

    .line 974
    .local v2, "half":J
    const-wide/16 v4, 0x0

    .local v4, "i":J
    :goto_1
    cmp-long v14, v4, v2

    if-gez v14, :cond_1

    .line 975
    sub-long v14, v8, v4

    const-wide/16 v16, 0x1

    sub-long v6, v14, v16

    .line 976
    .local v6, "j":J
    move-object/from16 v0, p1

    invoke-static {v0, v4, v5}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v12

    .line 977
    .local v12, "temp1":Ljava/lang/Object;
    move-object/from16 v0, p1

    invoke-static {v0, v6, v7}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v13

    .line 978
    .local v13, "temp2":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4, v5, v13}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 979
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6, v7, v12}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 974
    const-wide/16 v14, 0x1

    add-long/2addr v4, v14

    goto :goto_1

    .line 981
    .end local v2    # "half":J
    .end local v4    # "i":J
    .end local v6    # "j":J
    .end local v8    # "len":J
    .end local v12    # "temp1":Ljava/lang/Object;
    .end local v13    # "temp2":Ljava/lang/Object;
    :cond_1
    return-object p1
.end method

.method private static js_shift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1138
    instance-of v7, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v7, :cond_1

    move-object v4, p1

    .line 1139
    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1140
    .local v4, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v7, v4, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v7, :cond_1

    iget-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-lez v7, :cond_1

    .line 1141
    iget-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v10, 0x1

    sub-long/2addr v8, v10

    iput-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1142
    iget-object v7, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v8, 0x0

    aget-object v5, v7, v8

    .line 1143
    .local v5, "result":Ljava/lang/Object;
    iget-object v7, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v8, 0x1

    iget-object v9, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v10, 0x0

    iget-wide v12, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v11, v12

    invoke-static {v7, v8, v9, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1144
    iget-object v7, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v8, v8

    sget-object v9, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v9, v7, v8

    .line 1145
    sget-object v7, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v5, v7, :cond_0

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 1174
    .end local v4    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v5    # "result":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v5

    .line 1149
    :cond_1
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v2

    .line 1150
    .local v2, "length":J
    const-wide/16 v8, 0x0

    cmp-long v7, v2, v8

    if-lez v7, :cond_3

    .line 1151
    const-wide/16 v0, 0x0

    .line 1152
    .local v0, "i":J
    const-wide/16 v8, 0x1

    sub-long/2addr v2, v8

    .line 1155
    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 1161
    .restart local v5    # "result":Ljava/lang/Object;
    const-wide/16 v8, 0x0

    cmp-long v7, v2, v8

    if-lez v7, :cond_2

    .line 1162
    const-wide/16 v0, 0x1

    :goto_1
    cmp-long v7, v0, v2

    if-gtz v7, :cond_2

    .line 1163
    invoke-static {p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v6

    .line 1164
    .local v6, "temp":Ljava/lang/Object;
    const-wide/16 v8, 0x1

    sub-long v8, v0, v8

    invoke-static {p0, p1, v8, v9, v6}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1162
    const-wide/16 v8, 0x1

    add-long/2addr v0, v8

    goto :goto_1

    .line 1169
    .end local v6    # "temp":Ljava/lang/Object;
    :cond_2
    invoke-static {p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 1173
    .end local v0    # "i":J
    :goto_2
    invoke-static {p0, p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    goto :goto_0

    .line 1171
    .end local v5    # "result":Ljava/lang/Object;
    :cond_3
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .restart local v5    # "result":Ljava/lang/Object;
    goto :goto_2
.end method

.method private js_slice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 18
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1439
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/NativeArray;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v9

    .line 1440
    .local v9, "scope":Lorg/mozilla/javascript/Scriptable;
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v13}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    .line 1441
    .local v8, "result":Lorg/mozilla/javascript/Scriptable;
    invoke-static/range {p1 .. p2}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v6

    .line 1444
    .local v6, "length":J
    move-object/from16 v0, p3

    array-length v13, v0

    if-nez v13, :cond_1

    .line 1445
    const-wide/16 v2, 0x0

    .line 1446
    .local v2, "begin":J
    move-wide v4, v6

    .line 1456
    .local v4, "end":J
    :goto_0
    move-wide v10, v2

    .local v10, "slot":J
    :goto_1
    cmp-long v13, v10, v4

    if-gez v13, :cond_4

    .line 1457
    move-object/from16 v0, p2

    invoke-static {v0, v10, v11}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v12

    .line 1458
    .local v12, "temp":Ljava/lang/Object;
    sget-object v13, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v12, v13, :cond_0

    .line 1459
    sub-long v14, v10, v2

    move-object/from16 v0, p1

    invoke-static {v0, v8, v14, v15, v12}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1456
    :cond_0
    const-wide/16 v14, 0x1

    add-long/2addr v10, v14

    goto :goto_1

    .line 1448
    .end local v2    # "begin":J
    .end local v4    # "end":J
    .end local v10    # "slot":J
    .end local v12    # "temp":Ljava/lang/Object;
    :cond_1
    const/4 v13, 0x0

    aget-object v13, p3, v13

    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v14

    invoke-static {v14, v15, v6, v7}, Lorg/mozilla/javascript/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v2

    .line 1449
    .restart local v2    # "begin":J
    move-object/from16 v0, p3

    array-length v13, v0

    const/4 v14, 0x1

    if-eq v13, v14, :cond_2

    const/4 v13, 0x1

    aget-object v13, p3, v13

    sget-object v14, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v13, v14, :cond_3

    .line 1450
    :cond_2
    move-wide v4, v6

    .restart local v4    # "end":J
    goto :goto_0

    .line 1452
    .end local v4    # "end":J
    :cond_3
    const/4 v13, 0x1

    aget-object v13, p3, v13

    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v14

    invoke-static {v14, v15, v6, v7}, Lorg/mozilla/javascript/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v4

    .restart local v4    # "end":J
    goto :goto_0

    .line 1462
    .restart local v10    # "slot":J
    :cond_4
    const-wide/16 v14, 0x0

    sub-long v16, v4, v2

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    move-object/from16 v0, p1

    invoke-static {v0, v8, v14, v15}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    .line 1464
    return-object v8
.end method

.method private static js_sort(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 991
    move-object/from16 v0, p3

    array-length v5, v0

    if-lez v5, :cond_0

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    const/4 v6, 0x0

    aget-object v6, p3, v6

    if-eq v5, v6, :cond_0

    .line 992
    const/4 v5, 0x0

    aget-object v5, p3, v5

    move-object/from16 v0, p0

    invoke-static {v5, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getValueFunctionAndThis(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;

    move-result-object v4

    .line 994
    .local v4, "jsCompareFunction":Lorg/mozilla/javascript/Callable;
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v7

    .line 995
    .local v7, "funThis":Lorg/mozilla/javascript/Scriptable;
    const/4 v5, 0x2

    new-array v3, v5, [Ljava/lang/Object;

    .line 996
    .local v3, "cmpBuf":[Ljava/lang/Object;
    new-instance v2, Lorg/mozilla/javascript/NativeArray$1;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    invoke-direct/range {v2 .. v7}, Lorg/mozilla/javascript/NativeArray$1;-><init>([Ljava/lang/Object;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 1043
    .end local v3    # "cmpBuf":[Ljava/lang/Object;
    .end local v4    # "jsCompareFunction":Lorg/mozilla/javascript/Callable;
    .end local v7    # "funThis":Lorg/mozilla/javascript/Scriptable;
    .local v2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v10

    .line 1044
    .local v10, "llength":J
    long-to-int v9, v10

    .line 1045
    .local v9, "length":I
    int-to-long v14, v9

    cmp-long v5, v10, v14

    if-eqz v5, :cond_1

    .line 1046
    const-string v5, "msg.arraylength.too.big"

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v5

    throw v5

    .line 1023
    .end local v2    # "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    .end local v9    # "length":I
    .end local v10    # "llength":J
    :cond_0
    new-instance v2, Lorg/mozilla/javascript/NativeArray$2;

    invoke-direct {v2}, Lorg/mozilla/javascript/NativeArray$2;-><init>()V

    .restart local v2    # "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    goto :goto_0

    .line 1051
    .restart local v9    # "length":I
    .restart local v10    # "llength":J
    :cond_1
    new-array v12, v9, [Ljava/lang/Object;

    .line 1052
    .local v12, "working":[Ljava/lang/Object;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-eq v8, v9, :cond_2

    .line 1053
    int-to-long v14, v8

    move-object/from16 v0, p2

    invoke-static {v0, v14, v15}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v12, v8

    .line 1052
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1056
    :cond_2
    invoke-static {v12, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1059
    const/4 v8, 0x0

    :goto_2
    if-ge v8, v9, :cond_3

    .line 1060
    int-to-long v14, v8

    aget-object v5, v12, v8

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1, v14, v15, v5}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1059
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 1063
    :cond_3
    return-object p2
.end method

.method private static js_splice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 38
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1219
    const/16 v28, 0x0

    .line 1220
    .local v28, "na":Lorg/mozilla/javascript/NativeArray;
    const/4 v11, 0x0

    .line 1221
    .local v11, "denseMode":Z
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v32, v0

    if-eqz v32, :cond_0

    move-object/from16 v28, p2

    .line 1222
    check-cast v28, Lorg/mozilla/javascript/NativeArray;

    .line 1223
    move-object/from16 v0, v28

    iget-boolean v11, v0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 1227
    :cond_0
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeArray;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1228
    move-object/from16 v0, p3

    array-length v6, v0

    .line 1229
    .local v6, "argc":I
    if-nez v6, :cond_1

    .line 1230
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v29

    .line 1342
    :goto_0
    return-object v29

    .line 1231
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v26

    .line 1234
    .local v26, "length":J
    const/16 v32, 0x0

    aget-object v32, p3, v32

    invoke-static/range {v32 .. v32}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v32

    move-wide/from16 v0, v32

    move-wide/from16 v2, v26

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v8

    .line 1235
    .local v8, "begin":J
    add-int/lit8 v6, v6, -0x1

    .line 1239
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v32, v0

    const/16 v33, 0x1

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_4

    .line 1240
    sub-long v12, v26, v8

    .line 1253
    .local v12, "count":J
    :goto_1
    add-long v18, v8, v12

    .line 1257
    .local v18, "end":J
    const-wide/16 v32, 0x0

    cmp-long v32, v12, v32

    if-eqz v32, :cond_b

    .line 1258
    const-wide/16 v32, 0x1

    cmp-long v32, v12, v32

    if-nez v32, :cond_7

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v32

    const/16 v33, 0x78

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_7

    .line 1272
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1, v8, v9}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v29

    .line 1302
    :goto_2
    int-to-long v0, v6

    move-wide/from16 v32, v0

    sub-long v16, v32, v12

    .line 1303
    .local v16, "delta":J
    if-eqz v11, :cond_d

    add-long v32, v26, v16

    const-wide/32 v34, 0x7fffffff

    cmp-long v32, v32, v34

    if-gez v32, :cond_d

    add-long v32, v26, v16

    move-wide/from16 v0, v32

    long-to-int v0, v0

    move/from16 v32, v0

    move-object/from16 v0, v28

    move/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v32

    if-eqz v32, :cond_d

    .line 1306
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v32, v0

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v33, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v34, v0

    int-to-long v0, v6

    move-wide/from16 v36, v0

    add-long v36, v36, v8

    move-wide/from16 v0, v36

    long-to-int v0, v0

    move/from16 v35, v0

    sub-long v36, v26, v18

    move-wide/from16 v0, v36

    long-to-int v0, v0

    move/from16 v36, v0

    invoke-static/range {v32 .. v36}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1308
    if-lez v6, :cond_2

    .line 1309
    const/16 v32, 0x2

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v33, v0

    long-to-int v0, v8

    move/from16 v34, v0

    move-object/from16 v0, p3

    move/from16 v1, v32

    move-object/from16 v2, v33

    move/from16 v3, v34

    invoke-static {v0, v1, v2, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1311
    :cond_2
    const-wide/16 v32, 0x0

    cmp-long v32, v16, v32

    if-gez v32, :cond_3

    .line 1312
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v32, v0

    add-long v34, v26, v16

    move-wide/from16 v0, v34

    long-to-int v0, v0

    move/from16 v33, v0

    move-wide/from16 v0, v26

    long-to-int v0, v0

    move/from16 v34, v0

    sget-object v35, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    invoke-static/range {v32 .. v35}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 1315
    :cond_3
    add-long v32, v26, v16

    move-wide/from16 v0, v32

    move-object/from16 v2, v28

    iput-wide v0, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    goto/16 :goto_0

    .line 1242
    .end local v12    # "count":J
    .end local v16    # "delta":J
    .end local v18    # "end":J
    :cond_4
    const/16 v32, 0x1

    aget-object v32, p3, v32

    invoke-static/range {v32 .. v32}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v14

    .line 1243
    .local v14, "dcount":D
    const-wide/16 v32, 0x0

    cmpg-double v32, v14, v32

    if-gez v32, :cond_5

    .line 1244
    const-wide/16 v12, 0x0

    .line 1250
    .restart local v12    # "count":J
    :goto_3
    add-int/lit8 v6, v6, -0x1

    goto/16 :goto_1

    .line 1245
    .end local v12    # "count":J
    :cond_5
    sub-long v32, v26, v8

    move-wide/from16 v0, v32

    long-to-double v0, v0

    move-wide/from16 v32, v0

    cmpl-double v32, v14, v32

    if-lez v32, :cond_6

    .line 1246
    sub-long v12, v26, v8

    .restart local v12    # "count":J
    goto :goto_3

    .line 1248
    .end local v12    # "count":J
    :cond_6
    double-to-long v12, v14

    .restart local v12    # "count":J
    goto :goto_3

    .line 1274
    .end local v14    # "dcount":D
    .restart local v18    # "end":J
    :cond_7
    if-eqz v11, :cond_8

    .line 1275
    sub-long v32, v18, v8

    move-wide/from16 v0, v32

    long-to-int v0, v0

    move/from16 v21, v0

    .line 1276
    .local v21, "intLen":I
    move/from16 v0, v21

    new-array v10, v0, [Ljava/lang/Object;

    .line 1277
    .local v10, "copy":[Ljava/lang/Object;
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v32, v0

    long-to-int v0, v8

    move/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v33

    move/from16 v2, v34

    move/from16 v3, v21

    invoke-static {v0, v1, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1278
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v29

    .line 1279
    .local v29, "result":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_2

    .line 1280
    .end local v10    # "copy":[Ljava/lang/Object;
    .end local v21    # "intLen":I
    .end local v29    # "result":Lorg/mozilla/javascript/Scriptable;
    :cond_8
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v30

    .line 1281
    .local v30, "resultArray":Lorg/mozilla/javascript/Scriptable;
    move-wide/from16 v24, v8

    .local v24, "last":J
    :goto_4
    cmp-long v32, v24, v18

    if-eqz v32, :cond_a

    .line 1282
    move-object/from16 v0, p2

    move-wide/from16 v1, v24

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v31

    .line 1283
    .local v31, "temp":Ljava/lang/Object;
    sget-object v32, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_9

    .line 1284
    sub-long v32, v24, v8

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-wide/from16 v2, v32

    move-object/from16 v4, v31

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1281
    :cond_9
    const-wide/16 v32, 0x1

    add-long v24, v24, v32

    goto :goto_4

    .line 1288
    .end local v31    # "temp":Ljava/lang/Object;
    :cond_a
    sub-long v32, v18, v8

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-wide/from16 v2, v32

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    .line 1289
    move-object/from16 v29, v30

    .line 1290
    .restart local v29    # "result":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_2

    .line 1293
    .end local v24    # "last":J
    .end local v29    # "result":Lorg/mozilla/javascript/Scriptable;
    .end local v30    # "resultArray":Lorg/mozilla/javascript/Scriptable;
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v32

    const/16 v33, 0x78

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_c

    .line 1295
    sget-object v29, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .local v29, "result":Ljava/lang/Object;
    goto/16 :goto_2

    .line 1297
    .end local v29    # "result":Ljava/lang/Object;
    :cond_c
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v29

    .local v29, "result":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_2

    .line 1319
    .end local v29    # "result":Lorg/mozilla/javascript/Scriptable;
    .restart local v16    # "delta":J
    :cond_d
    const-wide/16 v32, 0x0

    cmp-long v32, v16, v32

    if-lez v32, :cond_e

    .line 1320
    const-wide/16 v32, 0x1

    sub-long v24, v26, v32

    .restart local v24    # "last":J
    :goto_5
    cmp-long v32, v24, v18

    if-ltz v32, :cond_10

    .line 1321
    move-object/from16 v0, p2

    move-wide/from16 v1, v24

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v31

    .line 1322
    .restart local v31    # "temp":Ljava/lang/Object;
    add-long v32, v24, v16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v32

    move-object/from16 v4, v31

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1320
    const-wide/16 v32, 0x1

    sub-long v24, v24, v32

    goto :goto_5

    .line 1324
    .end local v24    # "last":J
    .end local v31    # "temp":Ljava/lang/Object;
    :cond_e
    const-wide/16 v32, 0x0

    cmp-long v32, v16, v32

    if-gez v32, :cond_10

    .line 1325
    move-wide/from16 v24, v18

    .restart local v24    # "last":J
    :goto_6
    cmp-long v32, v24, v26

    if-gez v32, :cond_f

    .line 1326
    move-object/from16 v0, p2

    move-wide/from16 v1, v24

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v31

    .line 1327
    .restart local v31    # "temp":Ljava/lang/Object;
    add-long v32, v24, v16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v32

    move-object/from16 v4, v31

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1325
    const-wide/16 v32, 0x1

    add-long v24, v24, v32

    goto :goto_6

    .line 1329
    .end local v31    # "temp":Ljava/lang/Object;
    :cond_f
    add-long v22, v26, v16

    .local v22, "k":J
    :goto_7
    cmp-long v32, v22, v26

    if-gez v32, :cond_10

    .line 1330
    move-object/from16 v0, p2

    move-wide/from16 v1, v22

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 1329
    const-wide/16 v32, 0x1

    add-long v22, v22, v32

    goto :goto_7

    .line 1335
    .end local v22    # "k":J
    .end local v24    # "last":J
    :cond_10
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v32, v0

    sub-int v7, v32, v6

    .line 1336
    .local v7, "argoffset":I
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_8
    move/from16 v0, v20

    if-ge v0, v6, :cond_11

    .line 1337
    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v32, v0

    add-long v32, v32, v8

    add-int v34, v20, v7

    aget-object v34, p3, v34

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v32

    move-object/from16 v4, v34

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1336
    add-int/lit8 v20, v20, 0x1

    goto :goto_8

    .line 1341
    :cond_11
    add-long v32, v26, v16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v32

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    goto/16 :goto_0
.end method

.method private static js_unshift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1180
    move-object/from16 v0, p1

    instance-of v10, v0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v10, :cond_1

    move-object/from16 v8, p1

    .line 1181
    check-cast v8, Lorg/mozilla/javascript/NativeArray;

    .line 1182
    .local v8, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v10, v8, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v10, :cond_1

    iget-wide v10, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v10, v10

    move-object/from16 v0, p2

    array-length v11, v0

    add-int/2addr v10, v11

    invoke-direct {v8, v10}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1185
    iget-object v10, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v0, p2

    array-length v13, v0

    iget-wide v14, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v14, v14

    invoke-static {v10, v11, v12, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1187
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    move-object/from16 v0, p2

    array-length v10, v0

    if-ge v3, v10, :cond_0

    .line 1188
    iget-object v10, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v11, p2, v3

    aput-object v11, v10, v3

    .line 1187
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1190
    :cond_0
    iget-wide v10, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    move-object/from16 v0, p2

    array-length v12, v0

    int-to-long v12, v12

    add-long/2addr v10, v12

    iput-wide v10, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1191
    iget-wide v10, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v10, v10

    invoke-static {v10, v11}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v10

    .line 1213
    .end local v3    # "i":I
    .end local v8    # "na":Lorg/mozilla/javascript/NativeArray;
    :goto_1
    return-object v10

    .line 1194
    :cond_1
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v6

    .line 1195
    .local v6, "length":J
    move-object/from16 v0, p2

    array-length v2, v0

    .line 1197
    .local v2, "argc":I
    move-object/from16 v0, p2

    array-length v10, v0

    if-lez v10, :cond_3

    .line 1199
    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-lez v10, :cond_2

    .line 1200
    const-wide/16 v10, 0x1

    sub-long v4, v6, v10

    .local v4, "last":J
    :goto_2
    const-wide/16 v10, 0x0

    cmp-long v10, v4, v10

    if-ltz v10, :cond_2

    .line 1201
    move-object/from16 v0, p1

    invoke-static {v0, v4, v5}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v9

    .line 1202
    .local v9, "temp":Ljava/lang/Object;
    int-to-long v10, v2

    add-long/2addr v10, v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v10, v11, v9}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1200
    const-wide/16 v10, 0x1

    sub-long/2addr v4, v10

    goto :goto_2

    .line 1207
    .end local v4    # "last":J
    .end local v9    # "temp":Ljava/lang/Object;
    :cond_2
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_3
    move-object/from16 v0, p2

    array-length v10, v0

    if-ge v3, v10, :cond_3

    .line 1208
    int-to-long v10, v3

    aget-object v12, p2, v3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v10, v11, v12}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1207
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1212
    .end local v3    # "i":I
    :cond_3
    move-object/from16 v0, p2

    array-length v10, v0

    int-to-long v10, v10

    add-long/2addr v6, v10

    .line 1213
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6, v7}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v10

    goto :goto_1
.end method

.method private static reduceMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "id"    # I
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1686
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v10

    .line 1687
    .local v10, "length":J
    move-object/from16 v0, p4

    array-length v15, v0

    if-lez v15, :cond_1

    const/4 v15, 0x0

    aget-object v2, p4, v15

    .line 1688
    .local v2, "callbackArg":Ljava/lang/Object;
    :goto_0
    if-eqz v2, :cond_0

    instance-of v15, v2, Lorg/mozilla/javascript/Function;

    if-nez v15, :cond_2

    .line 1689
    :cond_0
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v15

    throw v15

    .line 1687
    .end local v2    # "callbackArg":Ljava/lang/Object;
    :cond_1
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .restart local v2    # "callbackArg":Ljava/lang/Object;
    :cond_2
    move-object v4, v2

    .line 1691
    check-cast v4, Lorg/mozilla/javascript/Function;

    .line 1692
    .local v4, "f":Lorg/mozilla/javascript/Function;
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v13

    .line 1694
    .local v13, "parent":Lorg/mozilla/javascript/Scriptable;
    const/16 v15, 0x18

    move/from16 v0, p1

    if-ne v0, v15, :cond_3

    const/4 v12, 0x1

    .line 1695
    .local v12, "movingLeft":Z
    :goto_1
    move-object/from16 v0, p4

    array-length v15, v0

    const/16 v16, 0x1

    move/from16 v0, v16

    if-le v15, v0, :cond_4

    const/4 v15, 0x1

    aget-object v14, p4, v15

    .line 1696
    .local v14, "value":Ljava/lang/Object;
    :goto_2
    const-wide/16 v6, 0x0

    .local v6, "i":J
    :goto_3
    cmp-long v15, v6, v10

    if-gez v15, :cond_8

    .line 1697
    if-eqz v12, :cond_5

    move-wide v8, v6

    .line 1698
    .local v8, "index":J
    :goto_4
    move-object/from16 v0, p3

    invoke-static {v0, v8, v9}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 1699
    .local v3, "elem":Ljava/lang/Object;
    sget-object v15, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v15, :cond_6

    .line 1696
    :goto_5
    const-wide/16 v16, 0x1

    add-long v6, v6, v16

    goto :goto_3

    .line 1694
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v6    # "i":J
    .end local v8    # "index":J
    .end local v12    # "movingLeft":Z
    .end local v14    # "value":Ljava/lang/Object;
    :cond_3
    const/4 v12, 0x0

    goto :goto_1

    .line 1695
    .restart local v12    # "movingLeft":Z
    :cond_4
    sget-object v14, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_2

    .line 1697
    .restart local v6    # "i":J
    .restart local v14    # "value":Ljava/lang/Object;
    :cond_5
    const-wide/16 v16, 0x1

    sub-long v16, v10, v16

    sub-long v8, v16, v6

    goto :goto_4

    .line 1702
    .restart local v3    # "elem":Ljava/lang/Object;
    .restart local v8    # "index":J
    :cond_6
    sget-object v15, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v14, v15, :cond_7

    .line 1704
    move-object v14, v3

    goto :goto_5

    .line 1706
    :cond_7
    const/4 v15, 0x4

    new-array v5, v15, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v14, v5, v15

    const/4 v15, 0x1

    aput-object v3, v5, v15

    const/4 v15, 0x2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    aput-object v16, v5, v15

    const/4 v15, 0x3

    aput-object p3, v5, v15

    .line 1707
    .local v5, "innerArgs":[Ljava/lang/Object;
    move-object/from16 v0, p0

    invoke-interface {v4, v0, v13, v13, v5}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    goto :goto_5

    .line 1710
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v5    # "innerArgs":[Ljava/lang/Object;
    .end local v8    # "index":J
    :cond_8
    sget-object v15, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v14, v15, :cond_9

    .line 1712
    const-string v15, "msg.empty.array.reduce"

    invoke-static {v15}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15

    .line 1714
    :cond_9
    return-object v14
.end method

.method private static setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 776
    const-wide/32 v2, 0x7fffffff

    cmp-long v1, p2, v2

    if-lez v1, :cond_0

    .line 777
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 778
    .local v0, "id":Ljava/lang/String;
    invoke-static {p1, v0, p4}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 782
    .end local v0    # "id":Ljava/lang/String;
    :goto_0
    return-void

    .line 780
    :cond_0
    long-to-int v1, p2

    invoke-static {p1, v1, p4}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)V

    goto :goto_0
.end method

.method private setLength(Ljava/lang/Object;)V
    .locals 20
    .param p1, "val"    # Ljava/lang/Object;

    .prologue
    .line 651
    move-object/from16 v0, p0

    iget v14, v0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    and-int/lit8 v14, v14, 0x1

    if-eqz v14, :cond_0

    .line 705
    :goto_0
    return-void

    .line 655
    :cond_0
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 656
    .local v2, "d":D
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v10

    .line 657
    .local v10, "longVal":J
    long-to-double v14, v10

    cmpl-double v14, v14, v2

    if-eqz v14, :cond_1

    .line 658
    const-string v14, "msg.arraylength.bad"

    invoke-static {v14}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 659
    .local v12, "msg":Ljava/lang/String;
    const-string v14, "RangeError"

    invoke-static {v14, v12}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v14

    throw v14

    .line 662
    .end local v12    # "msg":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v14, :cond_4

    .line 663
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v14, v10, v14

    if-gez v14, :cond_2

    .line 665
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v15, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    sget-object v17, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    invoke-static/range {v14 .. v17}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 666
    move-object/from16 v0, p0

    iput-wide v10, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_0

    .line 668
    :cond_2
    const-wide/32 v14, 0x55555554

    cmp-long v14, v10, v14

    if-gez v14, :cond_3

    long-to-double v14, v10

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x3ff8000000000000L    # 1.5

    mul-double v16, v16, v18

    cmpg-double v14, v14, v16

    if-gez v14, :cond_3

    long-to-int v14, v10

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 672
    move-object/from16 v0, p0

    iput-wide v10, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_0

    .line 675
    :cond_3
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 678
    :cond_4
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v14, v10, v14

    if-gez v14, :cond_8

    .line 680
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    sub-long/2addr v14, v10

    const-wide/16 v16, 0x1000

    cmp-long v14, v14, v16

    if-lez v14, :cond_7

    .line 682
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v4

    .line 683
    .local v4, "e":[Ljava/lang/Object;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    array-length v14, v4

    if-ge v6, v14, :cond_8

    .line 684
    aget-object v5, v4, v6

    .line 685
    .local v5, "id":Ljava/lang/Object;
    instance-of v14, v5, Ljava/lang/String;

    if-eqz v14, :cond_6

    move-object v13, v5

    .line 687
    check-cast v13, Ljava/lang/String;

    .line 688
    .local v13, "strId":Ljava/lang/String;
    invoke-static {v13}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v8

    .line 689
    .local v8, "index":J
    cmp-long v14, v8, v10

    if-ltz v14, :cond_5

    .line 690
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/NativeArray;->delete(Ljava/lang/String;)V

    .line 683
    .end local v5    # "id":Ljava/lang/Object;
    .end local v8    # "index":J
    .end local v13    # "strId":Ljava/lang/String;
    :cond_5
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 692
    .restart local v5    # "id":Ljava/lang/Object;
    :cond_6
    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "id":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 693
    .local v8, "index":I
    int-to-long v14, v8

    cmp-long v14, v14, v10

    if-ltz v14, :cond_5

    .line 694
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/NativeArray;->delete(I)V

    goto :goto_2

    .line 699
    .end local v4    # "e":[Ljava/lang/Object;
    .end local v6    # "i":I
    .end local v8    # "index":I
    :cond_7
    move-wide v6, v10

    .local v6, "i":J
    :goto_3
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v14, v6, v14

    if-gez v14, :cond_8

    .line 700
    move-object/from16 v0, p0

    invoke-static {v0, v6, v7}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 699
    const-wide/16 v14, 0x1

    add-long/2addr v6, v14

    goto :goto_3

    .line 704
    .end local v6    # "i":J
    :cond_8
    move-object/from16 v0, p0

    iput-wide v10, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto/16 :goto_0
.end method

.method private static setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "length"    # J

    .prologue
    .line 731
    long-to-double v2, p2

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 732
    .local v0, "len":Ljava/lang/Number;
    const-string v1, "length"

    invoke-static {p1, v1, v0}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 733
    return-object v0
.end method

.method static setMaximumInitialCapacity(I)V
    .locals 0
    .param p0, "maximumInitialCapacity"    # I

    .prologue
    .line 56
    sput p0, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    .line 57
    return-void
.end method

.method private static setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 787
    sget-object v0, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne p4, v0, :cond_0

    .line 788
    invoke-static {p1, p2, p3}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 792
    :goto_0
    return-void

    .line 790
    :cond_0
    invoke-static {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    goto :goto_0
.end method

.method private static toArrayIndex(D)J
    .locals 4
    .param p0, "d"    # D

    .prologue
    .line 382
    cmpl-double v2, p0, p0

    if-nez v2, :cond_0

    .line 383
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v0

    .line 384
    .local v0, "index":J
    long-to-double v2, v0

    cmpl-double v2, v2, p0

    if-nez v2, :cond_0

    const-wide v2, 0xffffffffL

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 388
    .end local v0    # "index":J
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method private static toArrayIndex(Ljava/lang/Object;)J
    .locals 2
    .param p0, "id"    # Ljava/lang/Object;

    .prologue
    .line 360
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 361
    check-cast p0, Ljava/lang/String;

    .end local p0    # "id":Ljava/lang/Object;
    invoke-static {p0}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v0

    .line 365
    :goto_0
    return-wide v0

    .line 362
    .restart local p0    # "id":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 363
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "id":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(D)J

    move-result-wide v0

    goto :goto_0

    .line 365
    .restart local p0    # "id":Ljava/lang/Object;
    :cond_1
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method private static toArrayIndex(Ljava/lang/String;)J
    .locals 4
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 372
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(D)J

    move-result-wide v0

    .line 375
    .local v0, "index":J
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 378
    .end local v0    # "index":J
    :goto_0
    return-wide v0

    .restart local v0    # "index":J
    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method private static toDenseIndex(Ljava/lang/Object;)I
    .locals 4
    .param p0, "id"    # Ljava/lang/Object;

    .prologue
    .line 392
    invoke-static {p0}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/Object;)J

    move-result-wide v0

    .line 393
    .local v0, "index":J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gtz v2, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    long-to-int v2, v0

    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private static toSliceIndex(DJ)J
    .locals 6
    .param p0, "value"    # D
    .param p2, "length"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 1469
    cmpg-double v2, p0, v4

    if-gez v2, :cond_1

    .line 1470
    long-to-double v2, p2

    add-double/2addr v2, p0

    cmpg-double v2, v2, v4

    if-gez v2, :cond_0

    .line 1471
    const-wide/16 v0, 0x0

    .line 1480
    .local v0, "result":J
    :goto_0
    return-wide v0

    .line 1473
    .end local v0    # "result":J
    :cond_0
    long-to-double v2, p2

    add-double/2addr v2, p0

    double-to-long v0, v2

    .restart local v0    # "result":J
    goto :goto_0

    .line 1475
    .end local v0    # "result":J
    :cond_1
    long-to-double v2, p2

    cmpl-double v2, p0, v2

    if-lez v2, :cond_2

    .line 1476
    move-wide v0, p2

    .restart local v0    # "result":J
    goto :goto_0

    .line 1478
    .end local v0    # "result":J
    :cond_2
    double-to-long v0, p0

    .restart local v0    # "result":J
    goto :goto_0
.end method

.method private static toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;
    .locals 20
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "toSource"    # Z
    .param p4, "toLocale"    # Z

    .prologue
    .line 802
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v12

    .line 804
    .local v12, "length":J
    new-instance v11, Ljava/lang/StringBuilder;

    const/16 v18, 0x100

    move/from16 v0, v18

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 809
    .local v11, "result":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_3

    .line 810
    const/16 v18, 0x5b

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 811
    const-string v15, ", "

    .line 816
    .local v15, "separator":Ljava/lang/String;
    :goto_0
    const/4 v7, 0x0

    .line 817
    .local v7, "haslast":Z
    const-wide/16 v8, 0x0

    .line 820
    .local v8, "i":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v18, v0

    if-nez v18, :cond_4

    .line 821
    const/16 v17, 0x1

    .line 822
    .local v17, "toplevel":Z
    const/4 v10, 0x0

    .line 823
    .local v10, "iterating":Z
    new-instance v18, Lorg/mozilla/javascript/ObjToIntMap;

    const/16 v19, 0x1f

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    .line 832
    :goto_1
    if-nez v10, :cond_c

    .line 833
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 835
    if-eqz p3, :cond_0

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v18

    const/16 v19, 0x96

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_5

    :cond_0
    const/16 v16, 0x1

    .line 837
    .local v16, "skipUndefinedAndNull":Z
    :goto_2
    const-wide/16 v8, 0x0

    :goto_3
    cmp-long v18, v8, v12

    if-gez v18, :cond_c

    .line 838
    const-wide/16 v18, 0x0

    cmp-long v18, v8, v18

    if-lez v18, :cond_1

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 839
    :cond_1
    move-object/from16 v0, p2

    invoke-static {v0, v8, v9}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v4

    .line 840
    .local v4, "elem":Ljava/lang/Object;
    sget-object v18, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v18

    if-eq v4, v0, :cond_2

    if-eqz v16, :cond_6

    if-eqz v4, :cond_2

    sget-object v18, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v0, v18

    if-ne v4, v0, :cond_6

    .line 842
    :cond_2
    const/4 v7, 0x0

    .line 837
    :goto_4
    const-wide/16 v18, 0x1

    add-long v8, v8, v18

    goto :goto_3

    .line 813
    .end local v4    # "elem":Ljava/lang/Object;
    .end local v7    # "haslast":Z
    .end local v8    # "i":J
    .end local v10    # "iterating":Z
    .end local v15    # "separator":Ljava/lang/String;
    .end local v16    # "skipUndefinedAndNull":Z
    .end local v17    # "toplevel":Z
    :cond_3
    const-string v15, ","

    .restart local v15    # "separator":Ljava/lang/String;
    goto :goto_0

    .line 825
    .restart local v7    # "haslast":Z
    .restart local v8    # "i":J
    :cond_4
    const/16 v17, 0x0

    .line 826
    .restart local v17    # "toplevel":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v10

    .restart local v10    # "iterating":Z
    goto :goto_1

    .line 835
    :cond_5
    const/16 v16, 0x0

    goto :goto_2

    .line 845
    .restart local v4    # "elem":Ljava/lang/Object;
    .restart local v16    # "skipUndefinedAndNull":Z
    :cond_6
    const/4 v7, 0x1

    .line 847
    if-eqz p3, :cond_8

    .line 848
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->uneval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    .line 875
    .end local v4    # "elem":Ljava/lang/Object;
    .end local v16    # "skipUndefinedAndNull":Z
    :catchall_0
    move-exception v18

    if-eqz v17, :cond_7

    .line 876
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    :cond_7
    throw v18

    .line 850
    .restart local v4    # "elem":Ljava/lang/Object;
    .restart local v16    # "skipUndefinedAndNull":Z
    :cond_8
    :try_start_2
    instance-of v0, v4, Ljava/lang/String;

    move/from16 v18, v0

    if-eqz v18, :cond_a

    .line 851
    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v14, v0

    .line 852
    .local v14, "s":Ljava/lang/String;
    if-eqz p3, :cond_9

    .line 853
    const/16 v18, 0x22

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 854
    invoke-static {v14}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 855
    const/16 v18, 0x22

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 857
    :cond_9
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 861
    .end local v14    # "s":Ljava/lang/String;
    :cond_a
    if-eqz p4, :cond_b

    .line 864
    const-string v18, "toLocaleString"

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-static {v4, v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v5

    .line 866
    .local v5, "fun":Lorg/mozilla/javascript/Callable;
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    .line 867
    .local v6, "funThis":Lorg/mozilla/javascript/Scriptable;
    sget-object v18, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-interface {v5, v0, v1, v6, v2}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 870
    .end local v5    # "fun":Lorg/mozilla/javascript/Callable;
    .end local v6    # "funThis":Lorg/mozilla/javascript/Scriptable;
    :cond_b
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_4

    .line 875
    .end local v4    # "elem":Ljava/lang/Object;
    .end local v16    # "skipUndefinedAndNull":Z
    :cond_c
    if-eqz v17, :cond_d

    .line 876
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    .line 880
    :cond_d
    if-eqz p3, :cond_e

    .line 882
    if-nez v7, :cond_f

    const-wide/16 v18, 0x0

    cmp-long v18, v8, v18

    if-lez v18, :cond_f

    .line 883
    const-string v18, ", ]"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 887
    :cond_e
    :goto_5
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    return-object v18

    .line 885
    :cond_f
    const/16 v18, 0x5d

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 1924
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1900
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/util/Collection;

    .prologue
    .line 1928
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1908
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 1920
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1727
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/NativeArray;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1750
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 1751
    .local v0, "aC":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1752
    const/4 v2, 0x0

    .line 1753
    .end local v0    # "aC":Ljava/lang/Object;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method protected defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p4, "checkValid"    # Z

    .prologue
    .line 573
    iget-object v4, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v4, :cond_1

    .line 574
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 575
    .local v1, "values":[Ljava/lang/Object;
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 576
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 577
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v1

    if-ge v0, v4, :cond_1

    .line 578
    aget-object v4, v1, v0

    sget-object v5, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v5, :cond_0

    .line 579
    aget-object v4, v1, v0

    invoke-virtual {p0, v0, p0, v4}, Lorg/mozilla/javascript/NativeArray;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 577
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 583
    .end local v0    # "i":I
    .end local v1    # "values":[Ljava/lang/Object;
    :cond_1
    invoke-static {p2}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/Object;)J

    move-result-wide v2

    .line 584
    .local v2, "index":J
    iget-wide v4, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v4, v2, v4

    if-ltz v4, :cond_2

    .line 585
    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 587
    :cond_2
    invoke-super {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/IdScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 588
    return-void
.end method

.method public delete(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 463
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_1

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->isSealed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_1

    .line 466
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    sget-object v1, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v1, v0, p1

    .line 470
    :goto_0
    return-void

    .line 468
    :cond_1
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->delete(I)V

    goto :goto_0
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 226
    sget-object v6, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v6}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 227
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 333
    :goto_0
    return-object v4

    .line 229
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    .line 232
    .local v1, "id":I
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 335
    :pswitch_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 254
    :pswitch_1
    array-length v6, p5

    if-lez v6, :cond_2

    .line 255
    aget-object v6, p5, v5

    invoke-static {p2, p3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p4

    .line 256
    array-length v6, p5

    add-int/lit8 v6, v6, -0x1

    new-array v3, v6, [Ljava/lang/Object;

    .line 257
    .local v3, "newArgs":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    array-length v6, v3

    if-ge v0, v6, :cond_1

    .line 258
    add-int/lit8 v6, v0, 0x1

    aget-object v6, p5, v6

    aput-object v6, v3, v0

    .line 257
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 259
    :cond_1
    move-object p5, v3

    .line 261
    .end local v0    # "i":I
    .end local v3    # "newArgs":[Ljava/lang/Object;
    :cond_2
    neg-int v1, v1

    .line 262
    goto :goto_1

    .line 266
    :pswitch_2
    array-length v6, p5

    if-lez v6, :cond_3

    aget-object v6, p5, v5

    invoke-static {v6}, Lorg/mozilla/javascript/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    :goto_3
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_0

    :cond_3
    move v4, v5

    goto :goto_3

    .line 269
    :pswitch_3
    if-nez p4, :cond_4

    move v2, v4

    .line 270
    .local v2, "inNewExpr":Z
    :goto_4
    if-nez v2, :cond_5

    .line 272
    invoke-virtual {p1, p2, p3, p5}, Lorg/mozilla/javascript/IdFunctionObject;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto :goto_0

    .end local v2    # "inNewExpr":Z
    :cond_4
    move v2, v5

    .line 269
    goto :goto_4

    .line 274
    .restart local v2    # "inNewExpr":Z
    :cond_5
    invoke-static {p2, p3, p5}, Lorg/mozilla/javascript/NativeArray;->jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 278
    .end local v2    # "inNewExpr":Z
    :pswitch_4
    const/4 v4, 0x4

    invoke-virtual {p2, v4}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v4

    invoke-static {p2, p3, p4, v4, v5}, Lorg/mozilla/javascript/NativeArray;->toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 282
    :pswitch_5
    invoke-static {p2, p3, p4, v5, v4}, Lorg/mozilla/javascript/NativeArray;->toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 285
    :pswitch_6
    invoke-static {p2, p3, p4, v4, v5}, Lorg/mozilla/javascript/NativeArray;->toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 288
    :pswitch_7
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_join(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 291
    :pswitch_8
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_reverse(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto :goto_0

    .line 294
    :pswitch_9
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_sort(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto :goto_0

    .line 297
    :pswitch_a
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_push(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 300
    :pswitch_b
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_pop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 303
    :pswitch_c
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_shift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 306
    :pswitch_d
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_unshift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 309
    :pswitch_e
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_splice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 312
    :pswitch_f
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_concat(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto/16 :goto_0

    .line 315
    :pswitch_10
    invoke-direct {p0, p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_slice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto/16 :goto_0

    .line 318
    :pswitch_11
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_indexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 321
    :pswitch_12
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_lastIndexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 330
    :pswitch_13
    invoke-static {p2, v1, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->iterativeMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 333
    :pswitch_14
    invoke-static {p2, v1, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->reduceMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 232
    :pswitch_data_0
    .packed-switch -0x1a
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
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
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_14
        :pswitch_14
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .locals 13
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x0

    const/4 v5, 0x1

    .line 139
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "join"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 141
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v9, -0x6

    const-string v10, "reverse"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 143
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x7

    const-string v4, "sort"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 145
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "push"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 147
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x9

    const-string v10, "pop"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 149
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xa

    const-string v10, "shift"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 151
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xb

    const-string v4, "unshift"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 153
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xc

    const-string v10, "splice"

    move-object v6, p0

    move-object v7, p1

    move v11, v12

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 155
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xd

    const-string v4, "concat"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 157
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xe

    const-string v10, "slice"

    move-object v6, p0

    move-object v7, p1

    move v11, v12

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 159
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xf

    const-string v4, "indexOf"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 161
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x10

    const-string v4, "lastIndexOf"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 163
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x11

    const-string v4, "every"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 165
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x12

    const-string v4, "filter"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 167
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x13

    const-string v4, "forEach"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 169
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x14

    const-string v4, "map"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 171
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x15

    const-string v4, "some"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 173
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x16

    const-string v4, "find"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 175
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x17

    const-string v4, "findIndex"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 177
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x18

    const-string v4, "reduce"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 179
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x19

    const-string v4, "reduceRight"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 181
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x1a

    const-string v4, "isArray"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 183
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 184
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 105
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iget v0, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->instanceIdInfo(II)I

    move-result v0

    .line 108
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x6c

    const/16 v7, 0x70

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1950
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 1951
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 1992
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 1996
    :cond_1
    :goto_1
    return v2

    .line 1952
    :pswitch_1
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1953
    .local v1, "c":I
    const/16 v3, 0x6d

    if-ne v1, v3, :cond_2

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_0

    const/16 v2, 0x14

    goto :goto_1

    .line 1954
    :cond_2
    if-ne v1, v7, :cond_0

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_0

    const/16 v2, 0x9

    goto :goto_1

    .line 1956
    .end local v1    # "c":I
    :pswitch_2
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    packed-switch v3, :pswitch_data_1

    :pswitch_3
    goto :goto_0

    .line 1957
    :pswitch_4
    const-string v0, "join"

    const/4 v2, 0x5

    goto :goto_0

    .line 1958
    :pswitch_5
    const-string v0, "some"

    const/16 v2, 0x15

    goto :goto_0

    .line 1959
    :pswitch_6
    const-string v0, "find"

    const/16 v2, 0x16

    goto :goto_0

    .line 1960
    :pswitch_7
    const-string v0, "sort"

    const/4 v2, 0x7

    goto :goto_0

    .line 1961
    :pswitch_8
    const-string v0, "push"

    const/16 v2, 0x8

    goto :goto_0

    .line 1963
    :pswitch_9
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1964
    .restart local v1    # "c":I
    const/16 v3, 0x68

    if-ne v1, v3, :cond_3

    const-string v0, "shift"

    const/16 v2, 0xa

    goto :goto_0

    .line 1965
    :cond_3
    if-ne v1, v8, :cond_4

    const-string v0, "slice"

    const/16 v2, 0xe

    goto :goto_0

    .line 1966
    :cond_4
    const/16 v3, 0x76

    if-ne v1, v3, :cond_0

    const-string v0, "every"

    const/16 v2, 0x11

    goto :goto_0

    .line 1968
    .end local v1    # "c":I
    :pswitch_a
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 1969
    :sswitch_0
    const-string v0, "concat"

    const/16 v2, 0xd

    goto :goto_0

    .line 1970
    :sswitch_1
    const-string v0, "filter"

    const/16 v2, 0x12

    goto/16 :goto_0

    .line 1971
    :sswitch_2
    const-string v0, "reduce"

    const/16 v2, 0x18

    goto/16 :goto_0

    .line 1972
    :sswitch_3
    const-string v0, "splice"

    const/16 v2, 0xc

    goto/16 :goto_0

    .line 1974
    :pswitch_b
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1

    goto/16 :goto_0

    .line 1975
    :sswitch_4
    const-string v0, "forEach"

    const/16 v2, 0x13

    goto/16 :goto_0

    .line 1976
    :sswitch_5
    const-string v0, "indexOf"

    const/16 v2, 0xf

    goto/16 :goto_0

    .line 1977
    :sswitch_6
    const-string v0, "reverse"

    const/4 v2, 0x6

    goto/16 :goto_0

    .line 1978
    :sswitch_7
    const-string v0, "unshift"

    const/16 v2, 0xb

    goto/16 :goto_0

    .line 1980
    :pswitch_c
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1981
    .restart local v1    # "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_5

    const-string v0, "toSource"

    const/4 v2, 0x4

    goto/16 :goto_0

    .line 1982
    :cond_5
    const/16 v3, 0x74

    if-ne v1, v3, :cond_0

    const-string v0, "toString"

    const/4 v2, 0x2

    goto/16 :goto_0

    .line 1984
    .end local v1    # "c":I
    :pswitch_d
    const-string v0, "findIndex"

    const/16 v2, 0x17

    goto/16 :goto_0

    .line 1985
    :pswitch_e
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1986
    .restart local v1    # "c":I
    const/16 v3, 0x63

    if-ne v1, v3, :cond_6

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 1987
    :cond_6
    if-ne v1, v8, :cond_7

    const-string v0, "lastIndexOf"

    const/16 v2, 0x10

    goto/16 :goto_0

    .line 1988
    :cond_7
    const/16 v3, 0x72

    if-ne v1, v3, :cond_0

    const-string v0, "reduceRight"

    const/16 v2, 0x19

    goto/16 :goto_0

    .line 1990
    .end local v1    # "c":I
    :pswitch_f
    const-string v0, "toLocaleString"

    const/4 v2, 0x3

    goto/16 :goto_0

    .line 1951
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_2
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_0
        :pswitch_e
        :pswitch_0
        :pswitch_0
        :pswitch_f
    .end packed-switch

    .line 1956
    :pswitch_data_1
    .packed-switch 0x69
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 1968
    :sswitch_data_0
    .sparse-switch
        0x63 -> :sswitch_0
        0x66 -> :sswitch_1
        0x72 -> :sswitch_2
        0x73 -> :sswitch_3
    .end sparse-switch

    .line 1974
    :sswitch_data_1
    .sparse-switch
        0x66 -> :sswitch_4
        0x69 -> :sswitch_5
        0x72 -> :sswitch_6
        0x75 -> :sswitch_7
    .end sparse-switch
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 1785
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/NativeArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 342
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 343
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 346
    :goto_0
    return-object v0

    .line 344
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 345
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v0, v0, p1

    goto :goto_0

    .line 346
    :cond_1
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public get(J)Ljava/lang/Object;
    .locals 5
    .param p1, "index"    # J

    .prologue
    .line 1771
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-ltz v1, :cond_0

    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v1, p1, v2

    if-ltz v1, :cond_1

    .line 1772
    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 1774
    :cond_1
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 1775
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_2

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_4

    .line 1776
    :cond_2
    const/4 v0, 0x0

    .line 1780
    .end local v0    # "value":Ljava/lang/Object;
    :cond_3
    :goto_0
    return-object v0

    .line 1777
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_4
    instance-of v1, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v1, :cond_3

    .line 1778
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getAllIds()[Ljava/lang/Object;
    .locals 2

    .prologue
    .line 507
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 509
    .local v0, "allIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Object;>;"
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 510
    invoke-interface {v0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getAttributes(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 550
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 552
    const/4 v0, 0x0

    .line 554
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getAttributes(I)I

    move-result v0

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const-string v0, "Array"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 528
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v1, :cond_0

    .line 529
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 530
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_0

    .line 531
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 533
    .end local v0    # "cx":Lorg/mozilla/javascript/Context;
    :goto_0
    return-object v1

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 475
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getIds()[Ljava/lang/Object;

    move-result-object v6

    .line 476
    .local v6, "superIds":[Ljava/lang/Object;
    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-nez v9, :cond_1

    .line 501
    .end local v6    # "superIds":[Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v6

    .line 477
    .restart local v6    # "superIds":[Ljava/lang/Object;
    :cond_1
    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v9

    .line 478
    .local v0, "N":I
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 479
    .local v2, "currentLength":J
    int-to-long v10, v0

    cmp-long v9, v10, v2

    if-lez v9, :cond_2

    .line 480
    long-to-int v0, v2

    .line 482
    :cond_2
    if-eqz v0, :cond_0

    .line 483
    array-length v7, v6

    .line 484
    .local v7, "superLength":I
    add-int v9, v0, v7

    new-array v4, v9, [Ljava/lang/Object;

    .line 486
    .local v4, "ids":[Ljava/lang/Object;
    const/4 v5, 0x0

    .line 487
    .local v5, "presentCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-eq v1, v0, :cond_4

    .line 489
    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v9, v9, v1

    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_3

    .line 490
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v4, v5

    .line 491
    add-int/lit8 v5, v5, 0x1

    .line 487
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 494
    :cond_4
    if-eq v5, v0, :cond_5

    .line 496
    add-int v9, v5, v7

    new-array v8, v9, [Ljava/lang/Object;

    .line 497
    .local v8, "tmp":[Ljava/lang/Object;
    invoke-static {v4, v12, v8, v12, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 498
    move-object v4, v8

    .line 500
    .end local v8    # "tmp":[Ljava/lang/Object;
    :cond_5
    invoke-static {v6, v12, v4, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v6, v4

    .line 501
    goto :goto_0
.end method

.method public getIndexIds()[Ljava/lang/Integer;
    .locals 10

    .prologue
    .line 514
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v3

    .line 515
    .local v3, "ids":[Ljava/lang/Object;
    new-instance v4, Ljava/util/ArrayList;

    array-length v7, v3

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 516
    .local v4, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v6, :cond_1

    aget-object v2, v0, v1

    .line 517
    .local v2, "id":Ljava/lang/Object;
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v5

    .line 518
    .local v5, "int32Id":I
    if-ltz v5, :cond_0

    int-to-double v8, v5

    invoke-static {v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v7

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 519
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 516
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 522
    .end local v2    # "id":Ljava/lang/Object;
    .end local v5    # "int32Id":I
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/Integer;

    invoke-interface {v4, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Integer;

    return-object v7
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 114
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "length"

    .line 115
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 121
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 122
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v0, v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 124
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getLength()J
    .locals 2

    .prologue
    .line 620
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    return-wide v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 559
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v2, :cond_0

    .line 560
    invoke-static {p2}, Lorg/mozilla/javascript/NativeArray;->toDenseIndex(Ljava/lang/Object;)I

    move-result v0

    .line 561
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v2, v2, v0

    sget-object v3, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_0

    .line 562
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v1, v2, v0

    .line 563
    .local v1, "value":Ljava/lang/Object;
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/NativeArray;->defaultIndexPropertyDescriptor(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    .line 566
    .end local v0    # "index":I
    .end local v1    # "value":Ljava/lang/Object;
    :goto_0
    return-object v2

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    goto :goto_0
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .locals 3
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v0, 0x0

    .line 352
    iget-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v0}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 353
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    .line 356
    :cond_0
    :goto_0
    return v0

    .line 354
    :cond_1
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v1, :cond_2

    if-ltz p1, :cond_2

    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v1, v1

    if-ge p1, v1, :cond_2

    .line 355
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v1, v1, p1

    sget-object v2, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 356
    :cond_2
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    goto :goto_0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1789
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1790
    .local v2, "longLen":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 1791
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 1793
    :cond_0
    long-to-int v1, v2

    .line 1794
    .local v1, "len":I
    if-nez p1, :cond_2

    .line 1795
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_4

    .line 1796
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    move v4, v0

    .line 1807
    :goto_1
    return v4

    .line 1795
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1801
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    if-ge v0, v1, :cond_4

    .line 1802
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v4, v0

    .line 1803
    goto :goto_1

    .line 1801
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1807
    :cond_4
    const/4 v4, -0x1

    goto :goto_1
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 191
    packed-switch p1, :pswitch_data_0

    .line 217
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 192
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 219
    .local v1, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeArray;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 220
    return-void

    .line 193
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 194
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 195
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 196
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "join"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 197
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "reverse"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 198
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sort"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 199
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "push"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 200
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "pop"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 201
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "shift"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 202
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "unshift"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 203
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "splice"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 204
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "concat"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 205
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "slice"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 206
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "indexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 207
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "lastIndexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 208
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "every"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 209
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "filter"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 210
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "forEach"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 211
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "map"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 212
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "some"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 213
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "find"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 214
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "findIndex"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 215
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "reduce"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 216
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "reduceRight"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 191
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
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
    .end packed-switch
.end method

.method public isEmpty()Z
    .locals 4

    .prologue
    .line 1767
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 1833
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public jsGet_length()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 626
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1811
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1812
    .local v2, "longLen":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 1813
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 1815
    :cond_0
    long-to-int v1, v2

    .line 1816
    .local v1, "len":I
    if-nez p1, :cond_2

    .line 1817
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_4

    .line 1818
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    move v4, v0

    .line 1829
    :goto_1
    return v4

    .line 1817
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1823
    .end local v0    # "i":I
    :cond_2
    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_2
    if-ltz v0, :cond_4

    .line 1824
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v4, v0

    .line 1825
    goto :goto_1

    .line 1823
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 1829
    :cond_4
    const/4 v4, -0x1

    goto :goto_1
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 1

    .prologue
    .line 1837
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 6
    .param p1, "start"    # I

    .prologue
    .line 1841
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1842
    .local v2, "longLen":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 1843
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 1845
    :cond_0
    long-to-int v0, v2

    .line 1847
    .local v0, "len":I
    if-ltz p1, :cond_1

    if-le p1, v0, :cond_2

    .line 1848
    :cond_1
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1851
    :cond_2
    new-instance v1, Lorg/mozilla/javascript/NativeArray$3;

    invoke-direct {v1, p0, p1, v0}, Lorg/mozilla/javascript/NativeArray$3;-><init>(Lorg/mozilla/javascript/NativeArray;II)V

    return-object v1
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 8
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v6, 0x1

    .line 430
    if-ne p2, p0, :cond_5

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->isSealed()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_5

    .line 433
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->isExtensible()Z

    move-result v0

    if-nez v0, :cond_2

    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2

    .line 458
    :cond_1
    :goto_0
    return-void

    .line 435
    :cond_2
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_3

    .line 436
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aput-object p3, v0, p1

    .line 437
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    .line 438
    int-to-long v0, p1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_0

    .line 440
    :cond_3
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v0, :cond_4

    int-to-double v0, p1

    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    cmpg-double v0, v0, v2

    if-gez v0, :cond_4

    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 443
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aput-object p3, v0, p1

    .line 444
    int-to-long v0, p1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_0

    .line 447
    :cond_4
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 450
    :cond_5
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 451
    if-ne p2, p0, :cond_1

    iget v0, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 453
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    .line 455
    int-to-long v0, p1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_0
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 399
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 400
    if-ne p2, p0, :cond_0

    .line 402
    invoke-static {p1}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v0

    .line 403
    .local v0, "index":J
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 404
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 405
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 408
    .end local v0    # "index":J
    :cond_0
    return-void
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 1936
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1904
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1912
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1916
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 1932
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method setDenseOnly(Z)V
    .locals 1
    .param p1, "denseOnly"    # Z

    .prologue
    .line 639
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_0

    .line 640
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 641
    :cond_0
    iput-boolean p1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 642
    return-void
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 97
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 98
    iput p2, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    .line 100
    :cond_0
    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 130
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 131
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/NativeArray;->setLength(Ljava/lang/Object;)V

    .line 134
    :goto_0
    return-void

    .line 133
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method public size()I
    .locals 4

    .prologue
    .line 1758
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1759
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 1760
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 1762
    :cond_0
    long-to-int v2, v0

    return v2
.end method

.method public subList(II)Ljava/util/List;
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 1940
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1731
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .param p1, "a"    # [Ljava/lang/Object;

    .prologue
    .line 1735
    iget-wide v4, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1736
    .local v4, "longLen":J
    const-wide/32 v6, 0x7fffffff

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    .line 1737
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 1739
    :cond_0
    long-to-int v2, v4

    .line 1740
    .local v2, "len":I
    array-length v3, p1

    if-lt v3, v2, :cond_1

    move-object v0, p1

    .line 1743
    .local v0, "array":[Ljava/lang/Object;
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_2

    .line 1744
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v1

    .line 1743
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1740
    .end local v0    # "array":[Ljava/lang/Object;
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    goto :goto_0

    .line 1746
    .restart local v0    # "array":[Ljava/lang/Object;
    .restart local v1    # "i":I
    :cond_2
    return-object v0
.end method
