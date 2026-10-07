.class public Lnet/npe/tga/TGAWriter;
.super Ljava/lang/Object;
.source "TGAWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/npe/tga/TGAWriter$EncodeType;
    }
.end annotation


# static fields
.field private static final FOOTER:[B

.field private static final MODE_DIFFERENT_COLOR:I = 0x3

.field private static final MODE_RESET:I = 0x0

.field private static final MODE_SAME_COLOR:I = 0x2

.field private static final MODE_SELECT:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 287
    const/16 v0, 0x1a

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lnet/npe/tga/TGAWriter;->FOOTER:[B

    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x54t
        0x52t
        0x55t
        0x45t
        0x56t
        0x49t
        0x53t
        0x49t
        0x4ft
        0x4et
        0x2dt
        0x58t
        0x46t
        0x49t
        0x4ct
        0x45t
        0x2et
        0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encodeRLE([BIIIILnet/npe/tga/TGAReader$Order;)I
    .locals 2
    .param p0, "buffer"    # [B
    .param p1, "index"    # I
    .param p2, "color"    # I
    .param p3, "count"    # I
    .param p4, "elementCount"    # I
    .param p5, "order"    # Lnet/npe/tga/TGAReader$Order;

    .prologue
    .line 254
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .local v0, "index":I
    add-int/lit8 v1, p3, -0x1

    or-int/lit16 v1, v1, 0x80

    int-to-byte v1, v1

    aput-byte v1, p0, p1

    .line 255
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "index":I
    .restart local p1    # "index":I
    iget v1, p5, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    shr-int v1, p2, v1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 256
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .restart local v0    # "index":I
    iget v1, p5, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    shr-int v1, p2, v1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, p1

    .line 257
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "index":I
    .restart local p1    # "index":I
    iget v1, p5, Lnet/npe/tga/TGAReader$Order;->redShift:I

    shr-int v1, p2, v1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 258
    const/4 v1, 0x4

    if-ne p4, v1, :cond_0

    .line 259
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .restart local v0    # "index":I
    iget v1, p5, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    shr-int v1, p2, v1

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, p1

    move p1, v0

    .line 261
    .end local v0    # "index":I
    .restart local p1    # "index":I
    :cond_0
    return p1
.end method

.method private static encodeRLE([BI[IIIILnet/npe/tga/TGAReader$Order;)I
    .locals 4
    .param p0, "buffer"    # [B
    .param p1, "index"    # I
    .param p2, "pixels"    # [I
    .param p3, "start"    # I
    .param p4, "count"    # I
    .param p5, "elementCount"    # I
    .param p6, "order"    # Lnet/npe/tga/TGAReader$Order;

    .prologue
    .line 265
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "index":I
    .local v2, "index":I
    add-int/lit8 v3, p4, -0x1

    int-to-byte v3, v3

    aput-byte v3, p0, p1

    .line 266
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p4, :cond_1

    .line 267
    add-int v3, p3, v1

    aget v0, p2, v3

    .line 268
    .local v0, "color":I
    add-int/lit8 p1, v2, 0x1

    .end local v2    # "index":I
    .restart local p1    # "index":I
    iget v3, p6, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    shr-int v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 269
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "index":I
    .restart local v2    # "index":I
    iget v3, p6, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    shr-int v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, p1

    .line 270
    add-int/lit8 p1, v2, 0x1

    .end local v2    # "index":I
    .restart local p1    # "index":I
    iget v3, p6, Lnet/npe/tga/TGAReader$Order;->redShift:I

    shr-int v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 271
    const/4 v3, 0x4

    if-ne p5, v3, :cond_0

    .line 272
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "index":I
    .restart local v2    # "index":I
    iget v3, p6, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    shr-int v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, p1

    move p1, v2

    .line 266
    .end local v2    # "index":I
    .restart local p1    # "index":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    move v2, p1

    .end local p1    # "index":I
    .restart local v2    # "index":I
    goto :goto_0

    .line 275
    .end local v0    # "color":I
    :cond_1
    return v2
.end method

.method private static encodeRLE([IIILnet/npe/tga/TGAReader$Order;[BI)I
    .locals 12
    .param p0, "pixels"    # [I
    .param p1, "width"    # I
    .param p2, "elementCount"    # I
    .param p3, "order"    # Lnet/npe/tga/TGAReader$Order;
    .param p4, "buffer"    # [B
    .param p5, "index"    # I

    .prologue
    .line 189
    const/4 v2, 0x0

    .line 190
    .local v2, "color":I
    const/4 v11, 0x0

    .line 191
    .local v11, "mode":I
    const/4 v6, 0x0

    .line 193
    .local v6, "start":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    array-length v0, p0

    if-ge v10, v0, :cond_9

    .line 194
    if-nez v11, :cond_2

    .line 195
    aget v2, p0, v10

    .line 196
    const/4 v11, 0x1

    .line 197
    move v6, v10

    .line 230
    :cond_0
    :goto_1
    add-int/lit8 v0, v10, 0x1

    rem-int/2addr v0, p1

    if-nez v0, :cond_1

    if-eqz v11, :cond_1

    .line 231
    const/4 v0, 0x2

    if-ne v11, v0, :cond_8

    .line 232
    sub-int v0, v10, v6

    add-int/lit8 v3, v0, 0x1

    move-object/from16 v0, p4

    move/from16 v1, p5

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lnet/npe/tga/TGAWriter;->encodeRLE([BIIIILnet/npe/tga/TGAReader$Order;)I

    move-result p5

    .line 238
    :goto_2
    const/4 v11, 0x0

    .line 242
    :cond_1
    aget v2, p0, v10

    .line 193
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 199
    :cond_2
    const/4 v0, 0x1

    if-ne v11, v0, :cond_4

    .line 200
    aget v0, p0, v10

    if-ne v2, v0, :cond_3

    const/4 v11, 0x2

    .line 201
    :goto_3
    aget v2, p0, v10

    goto :goto_1

    .line 200
    :cond_3
    const/4 v11, 0x3

    goto :goto_3

    .line 203
    :cond_4
    const/4 v0, 0x2

    if-ne v11, v0, :cond_6

    .line 204
    aget v0, p0, v10

    if-eq v2, v0, :cond_5

    .line 206
    sub-int v3, v10, v6

    move-object/from16 v0, p4

    move/from16 v1, p5

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lnet/npe/tga/TGAWriter;->encodeRLE([BIIIILnet/npe/tga/TGAReader$Order;)I

    move-result p5

    .line 207
    const/4 v11, 0x1

    .line 208
    aget v2, p0, v10

    .line 209
    move v6, v10

    goto :goto_1

    .line 211
    :cond_5
    sub-int v0, v10, v6

    const/16 v1, 0x7f

    if-lt v0, v1, :cond_0

    .line 212
    const/16 v3, 0x80

    move-object/from16 v0, p4

    move/from16 v1, p5

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lnet/npe/tga/TGAWriter;->encodeRLE([BIIIILnet/npe/tga/TGAReader$Order;)I

    move-result p5

    .line 213
    const/4 v11, 0x0

    goto :goto_1

    .line 216
    :cond_6
    const/4 v0, 0x3

    if-ne v11, v0, :cond_0

    .line 217
    aget v0, p0, v10

    if-ne v2, v0, :cond_7

    .line 219
    add-int/lit8 v0, v10, -0x1

    sub-int v7, v0, v6

    move-object/from16 v3, p4

    move/from16 v4, p5

    move-object v5, p0

    move v8, p2

    move-object v9, p3

    invoke-static/range {v3 .. v9}, Lnet/npe/tga/TGAWriter;->encodeRLE([BI[IIIILnet/npe/tga/TGAReader$Order;)I

    move-result p5

    .line 220
    const/4 v11, 0x2

    .line 221
    aget v2, p0, v10

    .line 222
    add-int/lit8 v6, v10, -0x1

    goto :goto_1

    .line 224
    :cond_7
    sub-int v0, v10, v6

    const/16 v1, 0x7f

    if-lt v0, v1, :cond_0

    .line 225
    const/16 v7, 0x80

    move-object/from16 v3, p4

    move/from16 v4, p5

    move-object v5, p0

    move v8, p2

    move-object v9, p3

    invoke-static/range {v3 .. v9}, Lnet/npe/tga/TGAWriter;->encodeRLE([BI[IIIILnet/npe/tga/TGAReader$Order;)I

    move-result p5

    .line 226
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 236
    :cond_8
    sub-int v0, v10, v6

    add-int/lit8 v7, v0, 0x1

    move-object/from16 v3, p4

    move/from16 v4, p5

    move-object v5, p0

    move v8, p2

    move-object v9, p3

    invoke-static/range {v3 .. v9}, Lnet/npe/tga/TGAWriter;->encodeRLE([BI[IIIILnet/npe/tga/TGAReader$Order;)I

    move-result p5

    goto :goto_2

    .line 245
    :cond_9
    if-eqz v11, :cond_a

    .line 246
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Error!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 249
    :cond_a
    return p5
.end method

.method private static getEncodeSize([III)I
    .locals 9
    .param p0, "pixels"    # [I
    .param p1, "width"    # I
    .param p2, "elementCount"    # I

    .prologue
    const/16 v8, 0x7f

    const/4 v6, 0x3

    const/4 v5, 0x2

    .line 122
    const/4 v3, 0x0

    .line 123
    .local v3, "size":I
    const/4 v0, 0x0

    .line 124
    .local v0, "color":I
    const/4 v2, 0x0

    .line 125
    .local v2, "mode":I
    const/4 v4, 0x0

    .line 127
    .local v4, "start":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, p0

    if-ge v1, v7, :cond_9

    .line 128
    if-nez v2, :cond_2

    .line 129
    aget v0, p0, v1

    .line 130
    const/4 v2, 0x1

    .line 131
    move v4, v1

    .line 164
    :cond_0
    :goto_1
    add-int/lit8 v7, v1, 0x1

    rem-int/2addr v7, p1

    if-nez v7, :cond_1

    if-eqz v2, :cond_1

    .line 165
    if-ne v2, v5, :cond_8

    .line 166
    add-int/lit8 v7, p2, 0x1

    add-int/2addr v3, v7

    .line 172
    :goto_2
    const/4 v2, 0x0

    .line 176
    :cond_1
    aget v0, p0, v1

    .line 127
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 133
    :cond_2
    const/4 v7, 0x1

    if-ne v2, v7, :cond_4

    .line 134
    aget v7, p0, v1

    if-ne v0, v7, :cond_3

    move v2, v5

    .line 135
    :goto_3
    aget v0, p0, v1

    goto :goto_1

    :cond_3
    move v2, v6

    .line 134
    goto :goto_3

    .line 137
    :cond_4
    if-ne v2, v5, :cond_6

    .line 138
    aget v7, p0, v1

    if-eq v0, v7, :cond_5

    .line 140
    add-int/lit8 v7, p2, 0x1

    add-int/2addr v3, v7

    .line 141
    const/4 v2, 0x1

    .line 142
    aget v0, p0, v1

    .line 143
    move v4, v1

    goto :goto_1

    .line 145
    :cond_5
    sub-int v7, v1, v4

    if-lt v7, v8, :cond_0

    .line 146
    add-int/lit8 v7, p2, 0x1

    add-int/2addr v3, v7

    .line 147
    const/4 v2, 0x0

    goto :goto_1

    .line 150
    :cond_6
    if-ne v2, v6, :cond_0

    .line 151
    aget v7, p0, v1

    if-ne v0, v7, :cond_7

    .line 153
    add-int/lit8 v7, v1, -0x1

    sub-int/2addr v7, v4

    mul-int/2addr v7, p2

    add-int/lit8 v7, v7, 0x1

    add-int/2addr v3, v7

    .line 154
    const/4 v2, 0x2

    .line 155
    aget v0, p0, v1

    .line 156
    add-int/lit8 v4, v1, -0x1

    goto :goto_1

    .line 158
    :cond_7
    sub-int v7, v1, v4

    if-lt v7, v8, :cond_0

    .line 159
    mul-int/lit16 v7, p2, 0x80

    add-int/lit8 v7, v7, 0x1

    add-int/2addr v3, v7

    .line 160
    const/4 v2, 0x0

    goto :goto_1

    .line 170
    :cond_8
    sub-int v7, v1, v4

    add-int/lit8 v7, v7, 0x1

    mul-int/2addr v7, p2

    add-int/lit8 v7, v7, 0x1

    add-int/2addr v3, v7

    goto :goto_2

    .line 179
    :cond_9
    if-eqz v2, :cond_a

    .line 180
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Error!"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 183
    :cond_a
    return v3
.end method

.method private static hasAlpha([ILnet/npe/tga/TGAReader$Order;)Z
    .locals 4
    .param p0, "pixels"    # [I
    .param p1, "order"    # Lnet/npe/tga/TGAReader$Order;

    .prologue
    .line 279
    iget v1, p1, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    .line 280
    .local v1, "alphaShift":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_1

    .line 281
    aget v3, p0, v2

    shr-int/2addr v3, v1

    and-int/lit16 v0, v3, 0xff

    .line 282
    .local v0, "alpha":I
    const/16 v3, 0xff

    if-eq v0, v3, :cond_0

    const/4 v3, 0x1

    .line 284
    .end local v0    # "alpha":I
    :goto_1
    return v3

    .line 280
    .restart local v0    # "alpha":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 284
    .end local v0    # "alpha":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static write([IIILnet/npe/tga/TGAReader$Order;)[B
    .locals 1
    .param p0, "pixels"    # [I
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "order"    # Lnet/npe/tga/TGAReader$Order;

    .prologue
    .line 27
    sget-object v0, Lnet/npe/tga/TGAWriter$EncodeType;->AUTO:Lnet/npe/tga/TGAWriter$EncodeType;

    invoke-static {p0, p1, p2, p3, v0}, Lnet/npe/tga/TGAWriter;->write([IIILnet/npe/tga/TGAReader$Order;Lnet/npe/tga/TGAWriter$EncodeType;)[B

    move-result-object v0

    return-object v0
.end method

.method public static write([IIILnet/npe/tga/TGAReader$Order;Lnet/npe/tga/TGAWriter$EncodeType;)[B
    .locals 14
    .param p0, "pixels"    # [I
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "order"    # Lnet/npe/tga/TGAReader$Order;
    .param p4, "encodeType"    # Lnet/npe/tga/TGAWriter$EncodeType;

    .prologue
    .line 32
    move-object/from16 v0, p3

    invoke-static {p0, v0}, Lnet/npe/tga/TGAWriter;->hasAlpha([ILnet/npe/tga/TGAReader$Order;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v3, 0x4

    .line 34
    .local v3, "elementCount":I
    :goto_0
    array-length v1, p0

    mul-int v12, v3, v1

    .line 35
    .local v12, "rawSize":I
    invoke-static {p0, p1, v3}, Lnet/npe/tga/TGAWriter;->getEncodeSize([III)I

    move-result v13

    .line 40
    .local v13, "rleSize":I
    sget-object v1, Lnet/npe/tga/TGAWriter$1;->$SwitchMap$net$npe$tga$TGAWriter$EncodeType:[I

    invoke-virtual/range {p4 .. p4}, Lnet/npe/tga/TGAWriter$EncodeType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 51
    const/4 v8, 0x0

    .line 52
    .local v8, "encoding":Z
    move v7, v12

    .line 56
    .local v7, "dataSize":I
    :goto_1
    sget-object v1, Lnet/npe/tga/TGAWriter;->FOOTER:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x12

    add-int v11, v1, v7

    .line 58
    .local v11, "length":I
    new-array v5, v11, [B

    .line 60
    .local v5, "buffer":[B
    const/4 v6, 0x0

    .line 63
    .local v6, "index":I
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .local v10, "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v6

    .line 64
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v10

    .line 65
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    if-eqz v8, :cond_3

    const/16 v1, 0xa

    :goto_2
    int-to-byte v1, v1

    aput-byte v1, v5, v6

    .line 66
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v10

    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v6

    .line 67
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v10

    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v6

    .line 68
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v10

    .line 69
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v6

    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v10

    .line 70
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v6

    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/4 v1, 0x0

    aput-byte v1, v5, v10

    .line 71
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    shr-int/lit8 v1, p1, 0x0

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v5, v6

    .line 72
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v5, v10

    .line 73
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    shr-int/lit8 v1, p2, 0x0

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v5, v6

    .line 74
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    shr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v5, v10

    .line 75
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    mul-int/lit8 v1, v3, 0x8

    int-to-byte v1, v1

    aput-byte v1, v5, v6

    .line 76
    add-int/lit8 v6, v10, 0x1

    .end local v10    # "index":I
    .restart local v6    # "index":I
    const/16 v1, 0x20

    aput-byte v1, v5, v10

    .line 78
    if-eqz v8, :cond_4

    move-object v1, p0

    move v2, p1

    move-object/from16 v4, p3

    .line 79
    invoke-static/range {v1 .. v6}, Lnet/npe/tga/TGAWriter;->encodeRLE([IIILnet/npe/tga/TGAReader$Order;[BI)I

    move-result v6

    .line 86
    :goto_3
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4
    sget-object v1, Lnet/npe/tga/TGAWriter;->FOOTER:[B

    array-length v1, v1

    if-ge v9, v1, :cond_5

    .line 87
    add-int/lit8 v10, v6, 0x1

    .end local v6    # "index":I
    .restart local v10    # "index":I
    sget-object v1, Lnet/npe/tga/TGAWriter;->FOOTER:[B

    aget-byte v1, v1, v9

    aput-byte v1, v5, v6

    .line 86
    add-int/lit8 v9, v9, 0x1

    move v6, v10

    .end local v10    # "index":I
    .restart local v6    # "index":I
    goto :goto_4

    .line 32
    .end local v3    # "elementCount":I
    .end local v5    # "buffer":[B
    .end local v6    # "index":I
    .end local v7    # "dataSize":I
    .end local v8    # "encoding":Z
    .end local v9    # "i":I
    .end local v11    # "length":I
    .end local v12    # "rawSize":I
    .end local v13    # "rleSize":I
    :cond_0
    const/4 v3, 0x3

    goto/16 :goto_0

    .line 42
    .restart local v3    # "elementCount":I
    .restart local v12    # "rawSize":I
    .restart local v13    # "rleSize":I
    :pswitch_0
    const/4 v8, 0x1

    .line 43
    .restart local v8    # "encoding":Z
    move v7, v13

    .line 44
    .restart local v7    # "dataSize":I
    goto/16 :goto_1

    .line 46
    .end local v7    # "dataSize":I
    .end local v8    # "encoding":Z
    :pswitch_1
    if-ge v13, v12, :cond_1

    const/4 v8, 0x1

    .line 47
    .restart local v8    # "encoding":Z
    :goto_5
    if-eqz v8, :cond_2

    move v7, v13

    .line 48
    .restart local v7    # "dataSize":I
    :goto_6
    goto/16 :goto_1

    .line 46
    .end local v7    # "dataSize":I
    .end local v8    # "encoding":Z
    :cond_1
    const/4 v8, 0x0

    goto :goto_5

    .restart local v8    # "encoding":Z
    :cond_2
    move v7, v12

    .line 47
    goto :goto_6

    .line 65
    .restart local v5    # "buffer":[B
    .restart local v7    # "dataSize":I
    .restart local v10    # "index":I
    .restart local v11    # "length":I
    :cond_3
    const/4 v1, 0x2

    goto/16 :goto_2

    .line 82
    .end local v10    # "index":I
    .restart local v6    # "index":I
    :cond_4
    move-object/from16 v0, p3

    invoke-static {p0, v5, v6, v3, v0}, Lnet/npe/tga/TGAWriter;->writeRaw([I[BIILnet/npe/tga/TGAReader$Order;)I

    move-result v6

    goto :goto_3

    .line 90
    .restart local v9    # "i":I
    :cond_5
    return-object v5

    .line 40
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static writeRaw([I[BIILnet/npe/tga/TGAReader$Order;)I
    .locals 4
    .param p0, "pixels"    # [I
    .param p1, "buffer"    # [B
    .param p2, "index"    # I
    .param p3, "elementCount"    # I
    .param p4, "order"    # Lnet/npe/tga/TGAReader$Order;

    .prologue
    .line 95
    const/4 v2, 0x3

    if-ne p3, v2, :cond_0

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 98
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "index":I
    .local v1, "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 99
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "index":I
    .restart local p2    # "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, v1

    .line 100
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "index":I
    .restart local v1    # "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->redShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 97
    add-int/lit8 v0, v0, 0x1

    move p2, v1

    .end local v1    # "index":I
    .restart local p2    # "index":I
    goto :goto_0

    .line 105
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 106
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "index":I
    .restart local v1    # "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 107
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "index":I
    .restart local p2    # "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, v1

    .line 108
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "index":I
    .restart local v1    # "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->redShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 109
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "index":I
    .restart local p2    # "index":I
    aget v2, p0, v0

    iget v3, p4, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, v1

    .line 105
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 112
    :cond_1
    return p2
.end method
