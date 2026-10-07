.class public Lorg/mozilla/javascript/typedarrays/NativeDataView;
.super Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;
.source "NativeDataView.java"


# static fields
.field public static final CLASS_NAME:Ljava/lang/String; = "DataView"

.field private static final Id_constructor:I = 0x1

.field private static final Id_getFloat32:I = 0x8

.field private static final Id_getFloat64:I = 0x9

.field private static final Id_getInt16:I = 0x4

.field private static final Id_getInt32:I = 0x6

.field private static final Id_getInt8:I = 0x2

.field private static final Id_getUint16:I = 0x5

.field private static final Id_getUint32:I = 0x7

.field private static final Id_getUint8:I = 0x3

.field private static final Id_setFloat32:I = 0x10

.field private static final Id_setFloat64:I = 0x11

.field private static final Id_setInt16:I = 0xc

.field private static final Id_setInt32:I = 0xe

.field private static final Id_setInt8:I = 0xa

.field private static final Id_setUint16:I = 0xd

.field private static final Id_setUint32:I = 0xf

.field private static final Id_setUint8:I = 0xb

.field private static final MAX_PROTOTYPE_ID:I = 0x11

.field private static final serialVersionUID:J = 0x13d128f92f39bdf8L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V
    .locals 0
    .param p1, "ab"    # Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;-><init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V

    .line 36
    return-void
.end method

.method private checkOffset([Ljava/lang/Object;I)V
    .locals 2
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "pos"    # I

    .prologue
    .line 59
    array-length v0, p1

    if-gt v0, p2, :cond_0

    .line 60
    const-string v0, "TypeError"

    const-string v1, "missing required offset parameter"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 62
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p1, p2

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    const-string v0, "RangeError"

    const-string v1, "invalid offset"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 65
    :cond_1
    return-void
.end method

.method private checkValue([Ljava/lang/Object;I)V
    .locals 2
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "pos"    # I

    .prologue
    .line 69
    array-length v0, p1

    if-gt v0, p2, :cond_0

    .line 70
    const-string v0, "TypeError"

    const-string v1, "missing required value parameter"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 72
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p1, p2

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    const-string v0, "RangeError"

    const-string v1, "invalid value parameter"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 75
    :cond_1
    return-void
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    .line 46
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeDataView;

    invoke-direct {v0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;-><init>()V

    .line 47
    .local v0, "dv":Lorg/mozilla/javascript/typedarrays/NativeDataView;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, p1, p2}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 48
    return-void
.end method

.method private js_constructor(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeDataView;
    .locals 2
    .param p1, "ab"    # Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 86
    if-gez p3, :cond_0

    .line 87
    const-string v0, "RangeError"

    const-string v1, "length out of range"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 89
    :cond_0
    if-ltz p2, :cond_1

    add-int v0, p2, p3

    invoke-virtual {p1}, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v1

    if-le v0, v1, :cond_2

    .line 90
    :cond_1
    const-string v0, "RangeError"

    const-string v1, "offset out of range"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 92
    :cond_2
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeDataView;

    invoke-direct {v0, p1, p2, p3}, Lorg/mozilla/javascript/typedarrays/NativeDataView;-><init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V

    return-object v0
.end method

.method private js_getFloat(I[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "bytes"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    .line 122
    invoke-direct {p0, p2, v2}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->checkOffset([Ljava/lang/Object;I)V

    .line 124
    aget-object v3, p2, v2

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    .line 125
    .local v1, "offset":I
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->rangeCheck(II)V

    .line 127
    invoke-static {p2, v0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    if-le p1, v0, :cond_0

    aget-object v3, p2, v0

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 130
    .local v0, "littleEndian":Z
    :goto_0
    sparse-switch p1, :sswitch_data_0

    .line 136
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .end local v0    # "littleEndian":Z
    :cond_0
    move v0, v2

    .line 127
    goto :goto_0

    .line 132
    .restart local v0    # "littleEndian":Z
    :sswitch_0
    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readFloat32([BIZ)Ljava/lang/Object;

    move-result-object v2

    .line 134
    :goto_1
    return-object v2

    :sswitch_1
    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readFloat64([BIZ)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 130
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method private js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "bytes"    # I
    .param p2, "signed"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    .line 97
    invoke-direct {p0, p3, v2}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->checkOffset([Ljava/lang/Object;I)V

    .line 99
    aget-object v3, p3, v2

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    .line 100
    .local v1, "offset":I
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->rangeCheck(II)V

    .line 102
    invoke-static {p3, v0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    if-le p1, v0, :cond_0

    aget-object v3, p3, v0

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 105
    .local v0, "littleEndian":Z
    :goto_0
    packed-switch p1, :pswitch_data_0

    .line 116
    :pswitch_0
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .end local v0    # "littleEndian":Z
    :cond_0
    move v0, v2

    .line 102
    goto :goto_0

    .line 107
    .restart local v0    # "littleEndian":Z
    :pswitch_1
    if-eqz p2, :cond_1

    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readInt8([BI)Ljava/lang/Object;

    move-result-object v2

    .line 113
    :goto_1
    return-object v2

    .line 107
    :cond_1
    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readUint8([BI)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 110
    :pswitch_2
    if-eqz p2, :cond_2

    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readInt16([BIZ)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readUint16([BIZ)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 113
    :pswitch_3
    if-eqz p2, :cond_3

    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readInt32([BIZ)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v2, v1, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readUint32([BIZ)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 105
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private js_setFloat(I[Ljava/lang/Object;)V
    .locals 7
    .param p1, "bytes"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v6, 0x2

    const/4 v0, 0x0

    const/4 v4, 0x1

    .line 180
    invoke-direct {p0, p2, v0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->checkOffset([Ljava/lang/Object;I)V

    .line 181
    invoke-direct {p0, p2, v4}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->checkValue([Ljava/lang/Object;I)V

    .line 183
    aget-object v5, p2, v0

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    .line 184
    .local v1, "offset":I
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->rangeCheck(II)V

    .line 186
    invoke-static {p2, v6}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_0

    if-le p1, v4, :cond_0

    aget-object v5, p2, v6

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v0, v4

    .line 188
    .local v0, "littleEndian":Z
    :cond_0
    aget-object v4, p2, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 190
    .local v2, "val":D
    sparse-switch p1, :sswitch_data_0

    .line 198
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 192
    :sswitch_0
    iget-object v4, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v4, v4, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v4, v1, v2, v3, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeFloat32([BIDZ)V

    .line 200
    :goto_0
    return-void

    .line 195
    :sswitch_1
    iget-object v4, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v4, v4, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    invoke-static {v4, v1, v2, v3, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeFloat64([BIDZ)V

    goto :goto_0

    .line 190
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method private js_setInt(IZ[Ljava/lang/Object;)V
    .locals 6
    .param p1, "bytes"    # I
    .param p2, "signed"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x2

    const/4 v0, 0x0

    const/4 v2, 0x1

    .line 142
    invoke-direct {p0, p3, v0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->checkOffset([Ljava/lang/Object;I)V

    .line 143
    invoke-direct {p0, p3, v2}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->checkValue([Ljava/lang/Object;I)V

    .line 145
    aget-object v3, p3, v0

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    .line 146
    .local v1, "offset":I
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->rangeCheck(II)V

    .line 148
    invoke-static {p3, v4}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v3

    if-eqz v3, :cond_0

    if-le p1, v2, :cond_0

    aget-object v3, p3, v4

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v0, v2

    .line 151
    .local v0, "littleEndian":Z
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 174
    :pswitch_0
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 153
    :pswitch_1
    if-eqz p2, :cond_1

    .line 154
    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, v3, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    aget-object v2, p3, v2

    invoke-static {v2}, Lorg/mozilla/javascript/typedarrays/Conversions;->toInt8(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v3, v1, v2}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeInt8([BII)V

    .line 176
    :goto_0
    return-void

    .line 156
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, v3, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    aget-object v2, p3, v2

    invoke-static {v2}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint8(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v3, v1, v2}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeUint8([BII)V

    goto :goto_0

    .line 160
    :pswitch_2
    if-eqz p2, :cond_2

    .line 161
    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, v3, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    aget-object v2, p3, v2

    invoke-static {v2}, Lorg/mozilla/javascript/typedarrays/Conversions;->toInt16(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v3, v1, v2, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeInt16([BIIZ)V

    goto :goto_0

    .line 163
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, v3, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    aget-object v2, p3, v2

    invoke-static {v2}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint16(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v3, v1, v2, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeUint16([BIIZ)V

    goto :goto_0

    .line 167
    :pswitch_3
    if-eqz p2, :cond_3

    .line 168
    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, v3, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    aget-object v2, p3, v2

    invoke-static {v2}, Lorg/mozilla/javascript/typedarrays/Conversions;->toInt32(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v3, v1, v2, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeInt32([BIIZ)V

    goto :goto_0

    .line 170
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v3, v3, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    aget-object v2, p3, v2

    invoke-static {v2}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint32(Ljava/lang/Object;)J

    move-result-wide v4

    invoke-static {v3, v1, v4, v5, v0}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeUint32([BIJZ)V

    goto :goto_0

    .line 151
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private rangeCheck(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .prologue
    .line 52
    if-ltz p1, :cond_0

    add-int v0, p1, p2

    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;->byteLength:I

    if-le v0, v1, :cond_1

    .line 53
    :cond_0
    const-string v0, "RangeError"

    const-string v1, "offset out of range"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 55
    :cond_1
    return-void
.end method

.method private static realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;
    .locals 1
    .param p0, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 79
    instance-of v0, p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;

    if-nez v0, :cond_0

    .line 80
    invoke-static {p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 81
    :cond_0
    check-cast p0, Lorg/mozilla/javascript/typedarrays/NativeDataView;

    .end local p0    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v3, 0x0

    const/4 v5, 0x1

    .line 208
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 209
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 261
    :goto_0
    return-object v4

    .line 211
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    .line 212
    .local v1, "id":I
    packed-switch v1, :pswitch_data_0

    .line 263
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 214
    :pswitch_0
    invoke-static {p5, v3}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_3

    aget-object v4, p5, v3

    instance-of v4, v4, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    if-eqz v4, :cond_3

    .line 215
    aget-object v0, p5, v3

    check-cast v0, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    .line 216
    .local v0, "ab":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    invoke-static {p5, v5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    aget-object v4, p5, v5

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v3

    .line 217
    .local v3, "off":I
    :cond_1
    invoke-static {p5, v6}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_2

    aget-object v4, p5, v6

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    .line 218
    .local v2, "len":I
    :goto_1
    invoke-direct {p0, v0, v3, v2}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_constructor(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    goto :goto_0

    .line 217
    .end local v2    # "len":I
    :cond_2
    invoke-virtual {v0}, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v4

    sub-int v2, v4, v3

    goto :goto_1

    .line 220
    .end local v0    # "ab":Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .end local v3    # "off":I
    :cond_3
    const-string v4, "TypeError"

    const-string v5, "Missing parameters"

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v4

    throw v4

    .line 223
    :pswitch_1
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v5, v5, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 225
    :pswitch_2
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v5, v3, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 227
    :pswitch_3
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v6, v5, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 229
    :pswitch_4
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v6, v3, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 231
    :pswitch_5
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v7, v5, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    .line 233
    :pswitch_6
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v7, v3, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 235
    :pswitch_7
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v7, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getFloat(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 237
    :pswitch_8
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v8, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_getFloat(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 239
    :pswitch_9
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v5, v5, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 240
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 242
    :pswitch_a
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v5, v3, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 243
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 245
    :pswitch_b
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v6, v5, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 246
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 248
    :pswitch_c
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v6, v3, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 249
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 251
    :pswitch_d
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v7, v5, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 252
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 254
    :pswitch_e
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v7, v3, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 255
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 257
    :pswitch_f
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v7, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setFloat(I[Ljava/lang/Object;)V

    .line 258
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 260
    :pswitch_10
    invoke-static {p4, p1}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeDataView;

    move-result-object v4

    invoke-direct {v4, v8, p5}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->js_setFloat(I[Ljava/lang/Object;)V

    .line 261
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 212
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
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x8

    const/16 v7, 0x32

    const/16 v6, 0x73

    const/16 v5, 0x67

    const/4 v4, 0x0

    .line 301
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 302
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 350
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 354
    :cond_1
    return v2

    .line 303
    :pswitch_0
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 304
    .local v1, "c":I
    if-ne v1, v5, :cond_2

    const-string v0, "getInt8"

    const/4 v2, 0x2

    goto :goto_0

    .line 305
    :cond_2
    if-ne v1, v6, :cond_0

    const-string v0, "setInt8"

    const/16 v2, 0xa

    goto :goto_0

    .line 307
    .end local v1    # "c":I
    :pswitch_1
    const/4 v3, 0x6

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 308
    .restart local v1    # "c":I
    const/16 v3, 0x31

    if-ne v1, v3, :cond_4

    .line 309
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 310
    if-ne v1, v5, :cond_3

    const-string v0, "getInt16"

    const/4 v2, 0x4

    goto :goto_0

    .line 311
    :cond_3
    if-ne v1, v6, :cond_0

    const-string v0, "setInt16"

    const/16 v2, 0xc

    goto :goto_0

    .line 313
    :cond_4
    const/16 v3, 0x33

    if-ne v1, v3, :cond_6

    .line 314
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 315
    if-ne v1, v5, :cond_5

    const-string v0, "getInt32"

    const/4 v2, 0x6

    goto :goto_0

    .line 316
    :cond_5
    if-ne v1, v6, :cond_0

    const-string v0, "setInt32"

    const/16 v2, 0xe

    goto :goto_0

    .line 318
    :cond_6
    const/16 v3, 0x74

    if-ne v1, v3, :cond_0

    .line 319
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 320
    if-ne v1, v5, :cond_7

    const-string v0, "getUint8"

    const/4 v2, 0x3

    goto :goto_0

    .line 321
    :cond_7
    if-ne v1, v6, :cond_0

    const-string v0, "setUint8"

    const/16 v2, 0xb

    goto :goto_0

    .line 324
    .end local v1    # "c":I
    :pswitch_2
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 325
    .restart local v1    # "c":I
    if-ne v1, v5, :cond_9

    .line 326
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 327
    if-ne v1, v7, :cond_8

    const-string v0, "getUint32"

    const/4 v2, 0x7

    goto :goto_0

    .line 328
    :cond_8
    const/16 v3, 0x36

    if-ne v1, v3, :cond_0

    const-string v0, "getUint16"

    const/4 v2, 0x5

    goto :goto_0

    .line 330
    :cond_9
    if-ne v1, v6, :cond_0

    .line 331
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 332
    if-ne v1, v7, :cond_a

    const-string v0, "setUint32"

    const/16 v2, 0xf

    goto/16 :goto_0

    .line 333
    :cond_a
    const/16 v3, 0x36

    if-ne v1, v3, :cond_0

    const-string v0, "setUint16"

    const/16 v2, 0xd

    goto/16 :goto_0

    .line 336
    .end local v1    # "c":I
    :pswitch_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 337
    .restart local v1    # "c":I
    if-ne v1, v5, :cond_c

    .line 338
    const/16 v3, 0x9

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 339
    if-ne v1, v7, :cond_b

    const-string v0, "getFloat32"

    const/16 v2, 0x8

    goto/16 :goto_0

    .line 340
    :cond_b
    const/16 v3, 0x34

    if-ne v1, v3, :cond_0

    const-string v0, "getFloat64"

    const/16 v2, 0x9

    goto/16 :goto_0

    .line 342
    :cond_c
    if-ne v1, v6, :cond_0

    .line 343
    const/16 v3, 0x9

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 344
    if-ne v1, v7, :cond_d

    const-string v0, "setFloat32"

    const/16 v2, 0x10

    goto/16 :goto_0

    .line 345
    :cond_d
    const/16 v3, 0x34

    if-ne v1, v3, :cond_0

    const-string v0, "setFloat64"

    const/16 v2, 0x11

    goto/16 :goto_0

    .line 348
    .end local v1    # "c":I
    :pswitch_4
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 302
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    const-string v0, "DataView"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 271
    packed-switch p1, :pswitch_data_0

    .line 289
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 272
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 291
    .local v1, "s":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/typedarrays/NativeDataView;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 292
    return-void

    .line 273
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getInt8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 274
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getUint8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 275
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getInt16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 276
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getUint16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 277
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getInt32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 278
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getUint32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 279
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getFloat32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 280
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getFloat64"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 281
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setInt8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 282
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUint8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 283
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setInt16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 284
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUint16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 285
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setInt32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 286
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUint32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 287
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setFloat32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 288
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setFloat64"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 271
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
    .end packed-switch
.end method
