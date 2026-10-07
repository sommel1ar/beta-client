.class public abstract Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
.super Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;
.source "NativeTypedArrayView.java"

# interfaces
.implements Ljava/util/List;
.implements Ljava/util/RandomAccess;
.implements Lorg/mozilla/javascript/ExternalArrayData;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;",
        "Ljava/util/List",
        "<TT;>;",
        "Ljava/util/RandomAccess;",
        "Lorg/mozilla/javascript/ExternalArrayData;"
    }
.end annotation


# static fields
.field private static final Id_BYTES_PER_ELEMENT:I = 0xb

.field private static final Id_constructor:I = 0x1

.field private static final Id_get:I = 0x2

.field private static final Id_length:I = 0xa

.field private static final Id_set:I = 0x3

.field private static final Id_subarray:I = 0x4

.field private static final MAX_INSTANCE_ID:I = 0xb

.field protected static final MAX_PROTOTYPE_ID:I = 0x4


# instance fields
.field protected final length:I


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 38
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-direct {p0}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    .line 40
    return-void
.end method

.method protected constructor <init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;III)V
    .locals 0
    .param p1, "ab"    # Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "byteLen"    # I

    .prologue
    .line 44
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-direct {p0, p1, p2, p4}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;-><init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V

    .line 45
    iput p3, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    .line 46
    return-void
.end method

.method private js_constructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .locals 18
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 109
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v15, 0x0

    move-object/from16 v0, p3

    invoke-static {v0, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v15

    if-nez v15, :cond_1

    .line 110
    sget-object v15, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->EMPTY_BUFFER:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-virtual {v0, v15, v1, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v14

    .line 166
    :cond_0
    :goto_0
    return-object v14

    .line 112
    :cond_1
    const/4 v15, 0x0

    aget-object v15, p3, v15

    instance-of v15, v15, Ljava/lang/Number;

    if-nez v15, :cond_2

    const/4 v15, 0x0

    aget-object v15, p3, v15

    instance-of v15, v15, Ljava/lang/String;

    if-eqz v15, :cond_3

    .line 114
    :cond_2
    const/4 v15, 0x0

    aget-object v15, p3, v15

    invoke-static {v15}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v9

    .line 115
    .local v9, "length":I
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v15

    mul-int/2addr v15, v9

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    move-result-object v3

    .line 116
    .local v3, "buffer":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v15, v9}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v14

    goto :goto_0

    .line 118
    .end local v3    # "buffer":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .end local v9    # "length":I
    :cond_3
    const/4 v15, 0x0

    aget-object v15, p3, v15

    instance-of v15, v15, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    if-eqz v15, :cond_4

    .line 120
    const/4 v15, 0x0

    aget-object v13, p3, v15

    check-cast v13, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    .line 121
    .local v13, "src":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    iget v15, v13, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v16

    mul-int v15, v15, v16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    move-result-object v10

    .line 122
    .local v10, "na":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    const/4 v15, 0x0

    iget v0, v13, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v10, v15, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v14

    .line 124
    .local v14, "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    iget v15, v13, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v6, v15, :cond_0

    .line 125
    invoke-virtual {v13, v6}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v6, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 124
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 129
    .end local v6    # "i":I
    .end local v10    # "na":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .end local v13    # "src":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .end local v14    # "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    :cond_4
    const/4 v15, 0x0

    aget-object v15, p3, v15

    instance-of v15, v15, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    if-eqz v15, :cond_d

    .line 131
    const/4 v15, 0x0

    aget-object v10, p3, v15

    check-cast v10, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    .line 132
    .restart local v10    # "na":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    const/4 v15, 0x1

    move-object/from16 v0, p3

    invoke-static {v0, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v15

    if-eqz v15, :cond_6

    const/4 v15, 0x1

    aget-object v15, p3, v15

    invoke-static {v15}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v5

    .line 135
    .local v5, "byteOff":I
    :goto_2
    const/4 v15, 0x2

    move-object/from16 v0, p3

    invoke-static {v0, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 136
    const/4 v15, 0x2

    aget-object v15, p3, v15

    invoke-static {v15}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v16

    mul-int v4, v15, v16

    .line 141
    .local v4, "byteLen":I
    :goto_3
    if-ltz v5, :cond_5

    iget-object v15, v10, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v15, v15

    if-le v5, v15, :cond_8

    .line 142
    :cond_5
    const-string v15, "RangeError"

    const-string v16, "offset out of range"

    invoke-static/range {v15 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15

    .line 132
    .end local v4    # "byteLen":I
    .end local v5    # "byteOff":I
    :cond_6
    const/4 v5, 0x0

    goto :goto_2

    .line 138
    .restart local v5    # "byteOff":I
    :cond_7
    invoke-virtual {v10}, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v15

    sub-int v4, v15, v5

    .restart local v4    # "byteLen":I
    goto :goto_3

    .line 144
    :cond_8
    if-ltz v4, :cond_9

    add-int v15, v5, v4

    iget-object v0, v10, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v15, v0, :cond_a

    .line 145
    :cond_9
    const-string v15, "RangeError"

    const-string v16, "length out of range"

    invoke-static/range {v15 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15

    .line 147
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v15

    rem-int v15, v5, v15

    if-eqz v15, :cond_b

    .line 148
    const-string v15, "RangeError"

    const-string v16, "offset must be a multiple of the byte size"

    invoke-static/range {v15 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15

    .line 150
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v15

    rem-int v15, v4, v15

    if-eqz v15, :cond_c

    .line 151
    const-string v15, "RangeError"

    const-string v16, "offset and buffer must be a multiple of the byte size"

    invoke-static/range {v15 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15

    .line 154
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v15

    div-int v15, v4, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v5, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v14

    goto/16 :goto_0

    .line 156
    .end local v4    # "byteLen":I
    .end local v5    # "byteOff":I
    .end local v10    # "na":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    :cond_d
    const/4 v15, 0x0

    aget-object v15, p3, v15

    instance-of v15, v15, Lorg/mozilla/javascript/NativeArray;

    if-eqz v15, :cond_e

    .line 158
    const/4 v15, 0x0

    aget-object v8, p3, v15

    check-cast v8, Ljava/util/List;

    .line 159
    .local v8, "l":Ljava/util/List;
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v16

    mul-int v15, v15, v16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v15}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    move-result-object v10

    .line 160
    .restart local v10    # "na":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    const/4 v15, 0x0

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v10, v15, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v14

    .line 161
    .restart local v14    # "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    const/4 v12, 0x0

    .line 162
    .local v12, "p":I
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 163
    .local v11, "o":Ljava/lang/Object;
    invoke-virtual {v14, v12, v11}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 164
    add-int/lit8 v12, v12, 0x1

    .line 165
    goto :goto_4

    .line 169
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "l":Ljava/util/List;
    .end local v10    # "na":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .end local v11    # "o":Ljava/lang/Object;
    .end local v12    # "p":I
    .end local v14    # "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    :cond_e
    const-string v15, "Error"

    const-string v16, "invalid argument"

    invoke-static/range {v15 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15
.end method

.method private js_subarray(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;II)Ljava/lang/Object;
    .locals 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "s"    # I
    .param p4, "e"    # I

    .prologue
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v7, 0x0

    .line 217
    if-gez p3, :cond_0

    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    add-int v3, v4, p3

    .line 218
    .local v3, "start":I
    :goto_0
    if-gez p4, :cond_1

    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    add-int v1, v4, p4

    .line 221
    .local v1, "end":I
    :goto_1
    invoke-static {v7, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 222
    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 223
    sub-int v4, v1, v3

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 224
    .local v2, "len":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    mul-int/2addr v4, v3

    iget-object v5, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    invoke-virtual {v5}, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 226
    .local v0, "byteOff":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    aput-object v6, v5, v7

    const/4 v6, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {p1, p2, v4, v5}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    return-object v4

    .end local v0    # "byteOff":I
    .end local v1    # "end":I
    .end local v2    # "len":I
    .end local v3    # "start":I
    :cond_0
    move v3, p3

    .line 217
    goto :goto_0

    .restart local v3    # "start":I
    :cond_1
    move v1, p4

    .line 218
    goto :goto_1
.end method

.method private makeArrayBuffer(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "length"    # I

    .prologue
    .line 103
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const-string v0, "ArrayBuffer"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p1, p2, v0, v1}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    return-object v0
.end method

.method private setRange(Lorg/mozilla/javascript/NativeArray;I)V
    .locals 5
    .param p1, "a"    # Lorg/mozilla/javascript/NativeArray;
    .param p2, "off"    # I

    .prologue
    .line 201
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v3, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-le p2, v3, :cond_0

    .line 202
    const-string v3, "RangeError"

    const-string v4, "offset out of range"

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 204
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeArray;->size()I

    move-result v3

    add-int/2addr v3, p2

    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-le v3, v4, :cond_1

    .line 205
    const-string v3, "RangeError"

    const-string v4, "offset + length out of range"

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 208
    :cond_1
    move v1, p2

    .line 209
    .local v1, "pos":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeArray;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 210
    .local v2, "val":Ljava/lang/Object;
    invoke-virtual {p0, v1, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 211
    add-int/lit8 v1, v1, 0x1

    .line 212
    goto :goto_0

    .line 213
    .end local v2    # "val":Ljava/lang/Object;
    :cond_2
    return-void
.end method

.method private setRange(Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;I)V
    .locals 4
    .param p1, "v"    # Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .param p2, "off"    # I

    .prologue
    .line 175
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-lt p2, v2, :cond_0

    .line 176
    const-string v2, "RangeError"

    const-string v3, "offset out of range"

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 179
    :cond_0
    iget v2, p1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    iget v3, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    sub-int/2addr v3, p2

    if-le v2, v3, :cond_1

    .line 180
    const-string v2, "RangeError"

    const-string v3, "source array too long"

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 183
    :cond_1
    iget-object v2, p1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    if-ne v2, v3, :cond_3

    .line 185
    iget v2, p1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    new-array v1, v2, [Ljava/lang/Object;

    .line 186
    .local v1, "tmp":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v2, :cond_2

    .line 187
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v1, v0

    .line 186
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    :cond_2
    const/4 v0, 0x0

    :goto_1
    iget v2, p1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v2, :cond_4

    .line 190
    add-int v2, v0, p2

    aget-object v3, v1, v0

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 193
    .end local v0    # "i":I
    .end local v1    # "tmp":[Ljava/lang/Object;
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    iget v2, p1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v2, :cond_4

    .line 194
    add-int v2, v0, p2

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 197
    :cond_4
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .line 576
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p2, "aByte":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 570
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "aByte":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 588
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p2, "bytes":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 582
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "bytes":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected checkIndex(I)Z
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 87
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-lt p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 594
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected abstract construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 444
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 450
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "objects":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 451
    .local v1, "o":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 452
    const/4 v2, 0x0

    .line 455
    .end local v1    # "o":Ljava/lang/Object;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public delete(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 71
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v4, 0x0

    .line 515
    :try_start_0
    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-object v3, v0

    .line 516
    .local v3, "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v5, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    iget v6, v3, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-eq v5, v6, :cond_1

    .line 526
    .end local v3    # "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    :cond_0
    :goto_0
    return v4

    .line 519
    .restart local v3    # "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v5, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v2, v5, :cond_2

    .line 520
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    .line 519
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 524
    :cond_2
    const/4 v4, 0x1

    goto :goto_0

    .line 525
    .end local v2    # "i":I
    .end local v3    # "v":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    :catch_0
    move-exception v1

    .line 526
    .local v1, "cce":Ljava/lang/ClassCastException;
    goto :goto_0
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v7, 0x1

    const/4 v5, 0x0

    .line 237
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 238
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 280
    :goto_0
    return-object v5

    .line 240
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    .line 241
    .local v1, "id":I
    packed-switch v1, :pswitch_data_0

    .line 285
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 243
    :pswitch_0
    invoke-direct {p0, p2, p3, p5}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_constructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v5

    goto :goto_0

    .line 246
    :pswitch_1
    array-length v6, p5

    if-lez v6, :cond_1

    .line 247
    invoke-virtual {p0, p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v6

    aget-object v5, p5, v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v5

    invoke-virtual {v6, v5}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v5

    goto :goto_0

    .line 249
    :cond_1
    const-string v5, "Error"

    const-string v6, "invalid arguments"

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v5

    throw v5

    .line 253
    :pswitch_2
    array-length v6, p5

    if-lez v6, :cond_7

    .line 254
    invoke-virtual {p0, p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v3

    .line 255
    .local v3, "self":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    aget-object v6, p5, v5

    instance-of v6, v6, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    if-eqz v6, :cond_3

    .line 256
    invoke-static {p5, v7}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_2

    aget-object v6, p5, v7

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    .line 257
    .local v2, "offset":I
    :goto_1
    aget-object v5, p5, v5

    check-cast v5, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    invoke-direct {v3, v5, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->setRange(Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;I)V

    .line 258
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .end local v2    # "offset":I
    :cond_2
    move v2, v5

    .line 256
    goto :goto_1

    .line 260
    :cond_3
    aget-object v6, p5, v5

    instance-of v6, v6, Lorg/mozilla/javascript/NativeArray;

    if-eqz v6, :cond_5

    .line 261
    invoke-static {p5, v7}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_4

    aget-object v6, p5, v7

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    .line 262
    .restart local v2    # "offset":I
    :goto_2
    aget-object v5, p5, v5

    check-cast v5, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v3, v5, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->setRange(Lorg/mozilla/javascript/NativeArray;I)V

    .line 263
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .end local v2    # "offset":I
    :cond_4
    move v2, v5

    .line 261
    goto :goto_2

    .line 265
    :cond_5
    aget-object v6, p5, v5

    instance-of v6, v6, Lorg/mozilla/javascript/Scriptable;

    if-eqz v6, :cond_6

    .line 267
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 269
    :cond_6
    const/4 v6, 0x2

    invoke-static {p5, v6}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 270
    aget-object v5, p5, v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v5

    aget-object v6, p5, v7

    invoke-virtual {v3, v5, v6}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto/16 :goto_0

    .line 273
    .end local v3    # "self":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    :cond_7
    const-string v5, "Error"

    const-string v6, "invalid arguments"

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v5

    throw v5

    .line 276
    :pswitch_3
    array-length v6, p5

    if-lez v6, :cond_9

    .line 277
    invoke-virtual {p0, p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    move-result-object v3

    .line 278
    .restart local v3    # "self":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    aget-object v5, p5, v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v4

    .line 279
    .local v4, "start":I
    invoke-static {p5, v7}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_8

    aget-object v5, p5, v7

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    .line 280
    .local v0, "end":I
    :goto_3
    invoke-direct {v3, p2, p3, v4, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_subarray(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;II)Ljava/lang/Object;

    move-result-object v5

    goto/16 :goto_0

    .line 279
    .end local v0    # "end":I
    :cond_8
    iget v0, v3, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    goto :goto_3

    .line 282
    .end local v3    # "self":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .end local v4    # "start":I
    :cond_9
    const-string v5, "Error"

    const-string v6, "invalid arguments"

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v5

    throw v5

    .line 241
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .locals 2
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 343
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const-string v0, "BYTES_PER_ELEMENT"

    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, p1, v1}, Lorg/mozilla/javascript/IdFunctionObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 344
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 384
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v0, 0x0

    .line 385
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 386
    .local v2, "s_length":I
    const/4 v3, 0x6

    if-ne v2, v3, :cond_2

    const-string v0, "length"

    const/16 v1, 0xa

    .line 388
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v1, 0x0

    .line 392
    :cond_1
    if-nez v1, :cond_3

    .line 393
    invoke-super {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v3

    .line 395
    :goto_1
    return v3

    .line 387
    :cond_2
    const/16 v3, 0x11

    if-ne v2, v3, :cond_0

    const-string v0, "BYTES_PER_ELEMENT"

    const/16 v1, 0xb

    goto :goto_0

    .line 395
    :cond_3
    const/4 v3, 0x5

    invoke-static {v3, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->instanceIdInfo(II)I

    move-result v3

    goto :goto_1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/16 v8, 0x74

    const/16 v7, 0x65

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 310
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 311
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 312
    .local v3, "s_length":I
    const/4 v4, 0x3

    if-ne v3, v4, :cond_2

    .line 313
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 314
    .local v1, "c":I
    const/16 v4, 0x67

    if-ne v1, v4, :cond_1

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v8, :cond_3

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v7, :cond_3

    const/4 v2, 0x2

    .line 323
    .end local v1    # "c":I
    :cond_0
    :goto_0
    return v2

    .line 315
    .restart local v1    # "c":I
    :cond_1
    const/16 v4, 0x73

    if-ne v1, v4, :cond_3

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v8, :cond_3

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v7, :cond_3

    const/4 v2, 0x3

    goto :goto_0

    .line 317
    .end local v1    # "c":I
    :cond_2
    const/16 v4, 0x8

    if-ne v3, v4, :cond_4

    const-string v0, "subarray"

    const/4 v2, 0x4

    .line 319
    :cond_3
    :goto_1
    if-eqz v0, :cond_0

    if-eq v0, p1, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 318
    :cond_4
    const/16 v4, 0xb

    if-ne v3, v4, :cond_3

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_1
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 53
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getArrayElement(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 413
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getArrayLength()I
    .locals 1

    .prologue
    .line 424
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    return v0
.end method

.method public abstract getBytesPerElement()I
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 3

    .prologue
    .line 76
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    new-array v1, v2, [Ljava/lang/Object;

    .line 77
    .local v1, "ret":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v2, :cond_0

    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    .line 77
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    :cond_0
    return-object v1
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 357
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    packed-switch p1, :pswitch_data_0

    .line 360
    invoke-super {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 358
    :pswitch_0
    const-string v0, "length"

    goto :goto_0

    .line 359
    :pswitch_1
    const-string v0, "BYTES_PER_ELEMENT"

    goto :goto_0

    .line 357
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 367
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    packed-switch p1, :pswitch_data_0

    .line 373
    invoke-super {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    .line 369
    :pswitch_0
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 371
    :pswitch_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 367
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .prologue
    .line 351
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/16 v0, 0xb

    return v0
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 59
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    if-lez p1, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 533
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    .line 534
    .local v0, "hc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_0

    .line 535
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 534
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 537
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 461
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v1, :cond_1

    .line 462
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 461
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 466
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 293
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    packed-switch p1, :pswitch_data_0

    .line 298
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 294
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 300
    .local v1, "s":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 301
    return-void

    .line 295
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "get"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 296
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "set"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 297
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "subarray"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 293
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 438
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 543
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;-><init>(Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;I)V

    return-object v0
.end method

.method protected abstract js_get(I)Ljava/lang/Object;
.end method

.method protected abstract js_set(ILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 472
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 473
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 477
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 472
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 477
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 549
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;-><init>(Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;I)V

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 1
    .param p1, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 555
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 556
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 558
    :cond_0
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;

    invoke-direct {v0, p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;-><init>(Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;I)V

    return-object v0
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "val"    # Ljava/lang/Object;

    .prologue
    .line 65
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 66
    return-void
.end method

.method protected abstract realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 600
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 606
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 612
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "objects":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 618
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "objects":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setArrayElement(ILjava/lang/Object;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 419
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 420
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 432
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .locals 1
    .param p1, "i"    # I
    .param p2, "i2"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 564
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 3

    .prologue
    .line 483
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    new-array v0, v2, [Ljava/lang/Object;

    .line 484
    .local v0, "a":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_0

    .line 485
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    .line 484
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 487
    :cond_0
    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">([TU;)[TU;"
        }
    .end annotation

    .prologue
    .line 495
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "ts":[Ljava/lang/Object;, "[TU;"
    array-length v3, p1

    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-lt v3, v4, :cond_0

    .line 496
    move-object v0, p1

    .line 501
    .local v0, "a":[Ljava/lang/Object;, "[TU;"
    :goto_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v3, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v2, v3, :cond_1

    .line 503
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 501
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 498
    .end local v0    # "a":[Ljava/lang/Object;, "[TU;"
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Ljava/lang/Object;

    .restart local v0    # "a":[Ljava/lang/Object;, "[TU;"
    goto :goto_0

    .line 504
    .restart local v2    # "i":I
    :catch_0
    move-exception v1

    .line 505
    .local v1, "cce":Ljava/lang/ClassCastException;
    new-instance v3, Ljava/lang/ArrayStoreException;

    invoke-direct {v3}, Ljava/lang/ArrayStoreException;-><init>()V

    throw v3

    .line 508
    .end local v1    # "cce":Ljava/lang/ClassCastException;
    :cond_1
    return-object v0
.end method
