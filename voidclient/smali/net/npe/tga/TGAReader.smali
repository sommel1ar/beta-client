.class public final Lnet/npe/tga/TGAReader;
.super Ljava/lang/Object;
.source "TGAReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/npe/tga/TGAReader$Order;
    }
.end annotation


# static fields
.field public static final ABGR:Lnet/npe/tga/TGAReader$Order;

.field public static final ARGB:Lnet/npe/tga/TGAReader$Order;

.field private static final COLORMAP:I = 0x1

.field private static final COLORMAP_RLE:I = 0x9

.field private static final GRAYSCALE:I = 0x3

.field private static final GRAYSCALE_RLE:I = 0xb

.field private static final RGB:I = 0x2

.field private static final RGB_RLE:I = 0xa

.field private static final RIGHT_ORIGIN:I = 0x10

.field private static final UPPER_ORIGIN:I = 0x20


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0x18

    const/16 v3, 0x10

    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 22
    new-instance v0, Lnet/npe/tga/TGAReader$Order;

    invoke-direct {v0, v3, v2, v1, v4}, Lnet/npe/tga/TGAReader$Order;-><init>(IIII)V

    sput-object v0, Lnet/npe/tga/TGAReader;->ARGB:Lnet/npe/tga/TGAReader$Order;

    .line 23
    new-instance v0, Lnet/npe/tga/TGAReader$Order;

    invoke-direct {v0, v1, v2, v3, v4}, Lnet/npe/tga/TGAReader$Order;-><init>(IIII)V

    sput-object v0, Lnet/npe/tga/TGAReader;->ABGR:Lnet/npe/tga/TGAReader$Order;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createPixelsFromColormap(III[BI[BIILnet/npe/tga/TGAReader$Order;)[I
    .locals 19
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "depth"    # I
    .param p3, "bytes"    # [B
    .param p4, "offset"    # I
    .param p5, "palette"    # [B
    .param p6, "colormapOrigin"    # I
    .param p7, "descriptor"    # I
    .param p8, "order"    # Lnet/npe/tga/TGAReader$Order;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const/4 v13, 0x0

    .line 125
    .local v13, "pixels":[I
    move-object/from16 v0, p8

    iget v15, v0, Lnet/npe/tga/TGAReader$Order;->redShift:I

    .line 126
    .local v15, "rs":I
    move-object/from16 v0, p8

    iget v9, v0, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    .line 127
    .local v9, "gs":I
    move-object/from16 v0, p8

    iget v5, v0, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    .line 128
    .local v5, "bs":I
    move-object/from16 v0, p8

    iget v3, v0, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    .line 129
    .local v3, "as":I
    sparse-switch p2, :sswitch_data_0

    .line 289
    new-instance v16, Ljava/io/IOException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Unsupported depth:"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 131
    :sswitch_0
    mul-int v16, p0, p1

    move/from16 v0, v16

    new-array v13, v0, [I

    .line 132
    and-int/lit8 v16, p7, 0x10

    if-eqz v16, :cond_5

    .line 133
    and-int/lit8 v16, p7, 0x20

    if-eqz v16, :cond_2

    .line 135
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 136
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_1
    move/from16 v0, p0

    if-ge v12, v0, :cond_1

    .line 137
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 138
    .local v7, "colormapIndex":I
    const/4 v6, -0x1

    .line 139
    .local v6, "color":I
    if-ltz v7, :cond_0

    .line 140
    mul-int/lit8 v16, v7, 0x3

    add-int/lit8 v11, v16, 0x12

    .line 141
    .local v11, "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 142
    .local v4, "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 143
    .local v8, "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 144
    .local v14, "r":I
    const/16 v2, 0xff

    .line 145
    .local v2, "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 147
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_0
    mul-int v16, p0, v10

    sub-int v17, p0, v12

    add-int/lit8 v17, v17, -0x1

    add-int v16, v16, v17

    aput v6, v13, v16

    .line 136
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 135
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 153
    .end local v10    # "i":I
    .end local v12    # "j":I
    :cond_2
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_2
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 154
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_3
    move/from16 v0, p0

    if-ge v12, v0, :cond_4

    .line 155
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 156
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 157
    .restart local v6    # "color":I
    if-ltz v7, :cond_3

    .line 158
    mul-int/lit8 v16, v7, 0x3

    add-int/lit8 v11, v16, 0x12

    .line 159
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 160
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 161
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 162
    .restart local v14    # "r":I
    const/16 v2, 0xff

    .line 163
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 165
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_3
    sub-int v16, p1, v10

    add-int/lit8 v16, v16, -0x1

    mul-int v16, v16, p0

    sub-int v17, p0, v12

    add-int/lit8 v17, v17, -0x1

    add-int v16, v16, v17

    aput v6, v13, v16

    .line 154
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 153
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 171
    .end local v10    # "i":I
    .end local v12    # "j":I
    :cond_5
    and-int/lit8 v16, p7, 0x20

    if-eqz v16, :cond_8

    .line 173
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_4
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 174
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_5
    move/from16 v0, p0

    if-ge v12, v0, :cond_7

    .line 175
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 176
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 177
    .restart local v6    # "color":I
    if-ltz v7, :cond_6

    .line 178
    mul-int/lit8 v16, v7, 0x3

    add-int/lit8 v11, v16, 0x12

    .line 179
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 180
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 181
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 182
    .restart local v14    # "r":I
    const/16 v2, 0xff

    .line 183
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 185
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_6
    mul-int v16, p0, v10

    add-int v16, v16, v12

    aput v6, v13, v16

    .line 174
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 173
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_7
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 191
    .end local v10    # "i":I
    .end local v12    # "j":I
    :cond_8
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_6
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 192
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_7
    move/from16 v0, p0

    if-ge v12, v0, :cond_a

    .line 193
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 194
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 195
    .restart local v6    # "color":I
    if-ltz v7, :cond_9

    .line 196
    mul-int/lit8 v16, v7, 0x3

    add-int/lit8 v11, v16, 0x12

    .line 197
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 198
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 199
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 200
    .restart local v14    # "r":I
    const/16 v2, 0xff

    .line 201
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 203
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_9
    sub-int v16, p1, v10

    add-int/lit8 v16, v16, -0x1

    mul-int v16, v16, p0

    add-int v16, v16, v12

    aput v6, v13, v16

    .line 192
    add-int/lit8 v12, v12, 0x1

    goto :goto_7

    .line 191
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 210
    .end local v10    # "i":I
    .end local v12    # "j":I
    :sswitch_1
    mul-int v16, p0, p1

    move/from16 v0, v16

    new-array v13, v0, [I

    .line 211
    and-int/lit8 v16, p7, 0x10

    if-eqz v16, :cond_10

    .line 212
    and-int/lit8 v16, p7, 0x20

    if-eqz v16, :cond_d

    .line 214
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_8
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 215
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_9
    move/from16 v0, p0

    if-ge v12, v0, :cond_c

    .line 216
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 217
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 218
    .restart local v6    # "color":I
    if-ltz v7, :cond_b

    .line 219
    mul-int/lit8 v16, v7, 0x4

    add-int/lit8 v11, v16, 0x12

    .line 220
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 221
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 222
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 223
    .restart local v14    # "r":I
    add-int/lit8 v16, v11, 0x3

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v2, v0, 0xff

    .line 224
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 226
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_b
    mul-int v16, p0, v10

    sub-int v17, p0, v12

    add-int/lit8 v17, v17, -0x1

    add-int v16, v16, v17

    aput v6, v13, v16

    .line 215
    add-int/lit8 v12, v12, 0x1

    goto :goto_9

    .line 214
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_c
    add-int/lit8 v10, v10, 0x1

    goto :goto_8

    .line 232
    .end local v10    # "i":I
    .end local v12    # "j":I
    :cond_d
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_a
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 233
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_b
    move/from16 v0, p0

    if-ge v12, v0, :cond_f

    .line 234
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 235
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 236
    .restart local v6    # "color":I
    if-ltz v7, :cond_e

    .line 237
    mul-int/lit8 v16, v7, 0x4

    add-int/lit8 v11, v16, 0x12

    .line 238
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 239
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 240
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 241
    .restart local v14    # "r":I
    add-int/lit8 v16, v11, 0x3

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v2, v0, 0xff

    .line 242
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 244
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_e
    sub-int v16, p1, v10

    add-int/lit8 v16, v16, -0x1

    mul-int v16, v16, p0

    sub-int v17, p0, v12

    add-int/lit8 v17, v17, -0x1

    add-int v16, v16, v17

    aput v6, v13, v16

    .line 233
    add-int/lit8 v12, v12, 0x1

    goto :goto_b

    .line 232
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_f
    add-int/lit8 v10, v10, 0x1

    goto :goto_a

    .line 250
    .end local v10    # "i":I
    .end local v12    # "j":I
    :cond_10
    and-int/lit8 v16, p7, 0x20

    if-eqz v16, :cond_13

    .line 252
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_c
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 253
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_d
    move/from16 v0, p0

    if-ge v12, v0, :cond_12

    .line 254
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 255
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 256
    .restart local v6    # "color":I
    if-ltz v7, :cond_11

    .line 257
    mul-int/lit8 v16, v7, 0x4

    add-int/lit8 v11, v16, 0x12

    .line 258
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 259
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 260
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 261
    .restart local v14    # "r":I
    add-int/lit8 v16, v11, 0x3

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v2, v0, 0xff

    .line 262
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 264
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_11
    mul-int v16, p0, v10

    add-int v16, v16, v12

    aput v6, v13, v16

    .line 253
    add-int/lit8 v12, v12, 0x1

    goto :goto_d

    .line 252
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_12
    add-int/lit8 v10, v10, 0x1

    goto :goto_c

    .line 270
    .end local v10    # "i":I
    .end local v12    # "j":I
    :cond_13
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_e
    move/from16 v0, p1

    if-ge v10, v0, :cond_16

    .line 271
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_f
    move/from16 v0, p0

    if-ge v12, v0, :cond_15

    .line 272
    mul-int v16, p0, v10

    add-int v16, v16, p4

    add-int v16, v16, v12

    aget-byte v16, p3, v16

    move/from16 v0, p6

    rsub-int v0, v0, 0xff

    move/from16 v17, v0

    and-int v7, v16, v17

    .line 273
    .restart local v7    # "colormapIndex":I
    const/4 v6, -0x1

    .line 274
    .restart local v6    # "color":I
    if-ltz v7, :cond_14

    .line 275
    mul-int/lit8 v16, v7, 0x4

    add-int/lit8 v11, v16, 0x12

    .line 276
    .restart local v11    # "index":I
    add-int/lit8 v16, v11, 0x0

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v4, v0, 0xff

    .line 277
    .restart local v4    # "b":I
    add-int/lit8 v16, v11, 0x1

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v8, v0, 0xff

    .line 278
    .restart local v8    # "g":I
    add-int/lit8 v16, v11, 0x2

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v14, v0, 0xff

    .line 279
    .restart local v14    # "r":I
    add-int/lit8 v16, v11, 0x3

    aget-byte v16, p5, v16

    move/from16 v0, v16

    and-int/lit16 v2, v0, 0xff

    .line 280
    .restart local v2    # "a":I
    shl-int v16, v14, v15

    shl-int v17, v8, v9

    or-int v16, v16, v17

    shl-int v17, v4, v5

    or-int v16, v16, v17

    shl-int v17, v2, v3

    or-int v6, v16, v17

    .line 282
    .end local v2    # "a":I
    .end local v4    # "b":I
    .end local v8    # "g":I
    .end local v11    # "index":I
    .end local v14    # "r":I
    :cond_14
    sub-int v16, p1, v10

    add-int/lit8 v16, v16, -0x1

    mul-int v16, v16, p0

    add-int v16, v16, v12

    aput v6, v13, v16

    .line 271
    add-int/lit8 v12, v12, 0x1

    goto :goto_f

    .line 270
    .end local v6    # "color":I
    .end local v7    # "colormapIndex":I
    :cond_15
    add-int/lit8 v10, v10, 0x1

    goto :goto_e

    .line 291
    .end local v12    # "j":I
    :cond_16
    return-object v13

    .line 129
    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_0
        0x20 -> :sswitch_1
    .end sparse-switch
.end method

.method private static createPixelsFromGrayscale(III[BIILnet/npe/tga/TGAReader$Order;)[I
    .locals 13
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "depth"    # I
    .param p3, "bytes"    # [B
    .param p4, "offset"    # I
    .param p5, "descriptor"    # I
    .param p6, "order"    # Lnet/npe/tga/TGAReader$Order;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    const/4 v8, 0x0

    .line 427
    .local v8, "pixels":[I
    move-object/from16 v0, p6

    iget v9, v0, Lnet/npe/tga/TGAReader$Order;->redShift:I

    .line 428
    .local v9, "rs":I
    move-object/from16 v0, p6

    iget v5, v0, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    .line 429
    .local v5, "gs":I
    move-object/from16 v0, p6

    iget v3, v0, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    .line 430
    .local v3, "bs":I
    move-object/from16 v0, p6

    iget v2, v0, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    .line 431
    .local v2, "as":I
    sparse-switch p2, :sswitch_data_0

    .line 527
    new-instance v10, Ljava/io/IOException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unsupported depth:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 433
    :sswitch_0
    mul-int v10, p0, p1

    new-array v8, v10, [I

    .line 434
    and-int/lit8 v10, p5, 0x10

    if-eqz v10, :cond_3

    .line 435
    and-int/lit8 v10, p5, 0x20

    if-eqz v10, :cond_1

    .line 437
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, p1, :cond_e

    .line 438
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_1
    if-ge v7, p0, :cond_0

    .line 439
    mul-int v10, p0, v6

    add-int v10, v10, p4

    add-int/2addr v10, v7

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 440
    .local v4, "e":I
    const/16 v1, 0xff

    .line 441
    .local v1, "a":I
    mul-int v10, p0, v6

    sub-int v11, p0, v7

    add-int/lit8 v11, v11, -0x1

    add-int/2addr v10, v11

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 438
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 437
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 447
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_1
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_2
    if-ge v6, p1, :cond_e

    .line 448
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_3
    if-ge v7, p0, :cond_2

    .line 449
    mul-int v10, p0, v6

    add-int v10, v10, p4

    add-int/2addr v10, v7

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 450
    .restart local v4    # "e":I
    const/16 v1, 0xff

    .line 451
    .restart local v1    # "a":I
    sub-int v10, p1, v6

    add-int/lit8 v10, v10, -0x1

    mul-int/2addr v10, p0

    sub-int v11, p0, v7

    add-int/lit8 v11, v11, -0x1

    add-int/2addr v10, v11

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 448
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 447
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 457
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_3
    and-int/lit8 v10, p5, 0x20

    if-eqz v10, :cond_5

    .line 459
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_4
    if-ge v6, p1, :cond_e

    .line 460
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_5
    if-ge v7, p0, :cond_4

    .line 461
    mul-int v10, p0, v6

    add-int v10, v10, p4

    add-int/2addr v10, v7

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 462
    .restart local v4    # "e":I
    const/16 v1, 0xff

    .line 463
    .restart local v1    # "a":I
    mul-int v10, p0, v6

    add-int/2addr v10, v7

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 460
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 459
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 469
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_5
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_6
    if-ge v6, p1, :cond_e

    .line 470
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_7
    if-ge v7, p0, :cond_6

    .line 471
    mul-int v10, p0, v6

    add-int v10, v10, p4

    add-int/2addr v10, v7

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 472
    .restart local v4    # "e":I
    const/16 v1, 0xff

    .line 473
    .restart local v1    # "a":I
    sub-int v10, p1, v6

    add-int/lit8 v10, v10, -0x1

    mul-int/2addr v10, p0

    add-int/2addr v10, v7

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 470
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 469
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 480
    .end local v6    # "i":I
    .end local v7    # "j":I
    :sswitch_1
    mul-int v10, p0, p1

    new-array v8, v10, [I

    .line 481
    and-int/lit8 v10, p5, 0x10

    if-eqz v10, :cond_a

    .line 482
    and-int/lit8 v10, p5, 0x20

    if-eqz v10, :cond_8

    .line 484
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_8
    if-ge v6, p1, :cond_e

    .line 485
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_9
    if-ge v7, p0, :cond_7

    .line 486
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x0

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 487
    .restart local v4    # "e":I
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x1

    aget-byte v10, p3, v10

    and-int/lit16 v1, v10, 0xff

    .line 488
    .restart local v1    # "a":I
    mul-int v10, p0, v6

    sub-int v11, p0, v7

    add-int/lit8 v11, v11, -0x1

    add-int/2addr v10, v11

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 485
    add-int/lit8 v7, v7, 0x1

    goto :goto_9

    .line 484
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 494
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_8
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_a
    if-ge v6, p1, :cond_e

    .line 495
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_b
    if-ge v7, p0, :cond_9

    .line 496
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x0

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 497
    .restart local v4    # "e":I
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x1

    aget-byte v10, p3, v10

    and-int/lit16 v1, v10, 0xff

    .line 498
    .restart local v1    # "a":I
    sub-int v10, p1, v6

    add-int/lit8 v10, v10, -0x1

    mul-int/2addr v10, p0

    sub-int v11, p0, v7

    add-int/lit8 v11, v11, -0x1

    add-int/2addr v10, v11

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 495
    add-int/lit8 v7, v7, 0x1

    goto :goto_b

    .line 494
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_a

    .line 504
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_a
    and-int/lit8 v10, p5, 0x20

    if-eqz v10, :cond_c

    .line 506
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_c
    if-ge v6, p1, :cond_e

    .line 507
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_d
    if-ge v7, p0, :cond_b

    .line 508
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x0

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 509
    .restart local v4    # "e":I
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x1

    aget-byte v10, p3, v10

    and-int/lit16 v1, v10, 0xff

    .line 510
    .restart local v1    # "a":I
    mul-int v10, p0, v6

    add-int/2addr v10, v7

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 507
    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    .line 506
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_b
    add-int/lit8 v6, v6, 0x1

    goto :goto_c

    .line 516
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_c
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_e
    if-ge v6, p1, :cond_e

    .line 517
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_f
    if-ge v7, p0, :cond_d

    .line 518
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x0

    aget-byte v10, p3, v10

    and-int/lit16 v4, v10, 0xff

    .line 519
    .restart local v4    # "e":I
    mul-int/lit8 v10, p0, 0x2

    mul-int/2addr v10, v6

    add-int v10, v10, p4

    mul-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x1

    aget-byte v10, p3, v10

    and-int/lit16 v1, v10, 0xff

    .line 520
    .restart local v1    # "a":I
    sub-int v10, p1, v6

    add-int/lit8 v10, v10, -0x1

    mul-int/2addr v10, p0

    add-int/2addr v10, v7

    shl-int v11, v4, v9

    shl-int v12, v4, v5

    or-int/2addr v11, v12

    shl-int v12, v4, v3

    or-int/2addr v11, v12

    shl-int v12, v1, v2

    or-int/2addr v11, v12

    aput v11, v8, v10

    .line 517
    add-int/lit8 v7, v7, 0x1

    goto :goto_f

    .line 516
    .end local v1    # "a":I
    .end local v4    # "e":I
    :cond_d
    add-int/lit8 v6, v6, 0x1

    goto :goto_e

    .line 529
    .end local v7    # "j":I
    :cond_e
    return-object v8

    .line 431
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_0
        0x10 -> :sswitch_1
    .end sparse-switch
.end method

.method private static createPixelsFromRGB(III[BIILnet/npe/tga/TGAReader$Order;)[I
    .locals 16
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "depth"    # I
    .param p3, "bytes"    # [B
    .param p4, "offset"    # I
    .param p5, "descriptor"    # I
    .param p6, "order"    # Lnet/npe/tga/TGAReader$Order;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 295
    const/4 v10, 0x0

    .line 296
    .local v10, "pixels":[I
    move-object/from16 v0, p6

    iget v12, v0, Lnet/npe/tga/TGAReader$Order;->redShift:I

    .line 297
    .local v12, "rs":I
    move-object/from16 v0, p6

    iget v6, v0, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    .line 298
    .local v6, "gs":I
    move-object/from16 v0, p6

    iget v4, v0, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    .line 299
    .local v4, "bs":I
    move-object/from16 v0, p6

    iget v2, v0, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    .line 300
    .local v2, "as":I
    sparse-switch p2, :sswitch_data_0

    .line 420
    new-instance v13, Ljava/io/IOException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unsupported depth:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 302
    :sswitch_0
    mul-int v13, p0, p1

    new-array v10, v13, [I

    .line 303
    and-int/lit8 v13, p5, 0x10

    if-eqz v13, :cond_3

    .line 304
    and-int/lit8 v13, p5, 0x20

    if-eqz v13, :cond_1

    .line 306
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 307
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    move/from16 v0, p0

    if-ge v9, v0, :cond_0

    .line 308
    mul-int/lit8 v13, p0, 0x3

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x3

    add-int v8, v13, v14

    .line 309
    .local v8, "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 310
    .local v3, "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 311
    .local v5, "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 312
    .local v11, "r":I
    const/16 v1, 0xff

    .line 313
    .local v1, "a":I
    mul-int v13, p0, v7

    sub-int v14, p0, v9

    add-int/lit8 v14, v14, -0x1

    add-int/2addr v13, v14

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 307
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 306
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 319
    .end local v7    # "i":I
    .end local v9    # "j":I
    :cond_1
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_2
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 320
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_3
    move/from16 v0, p0

    if-ge v9, v0, :cond_2

    .line 321
    mul-int/lit8 v13, p0, 0x3

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x3

    add-int v8, v13, v14

    .line 322
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 323
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 324
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 325
    .restart local v11    # "r":I
    const/16 v1, 0xff

    .line 326
    .restart local v1    # "a":I
    sub-int v13, p1, v7

    add-int/lit8 v13, v13, -0x1

    mul-int v13, v13, p0

    sub-int v14, p0, v9

    add-int/lit8 v14, v14, -0x1

    add-int/2addr v13, v14

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 320
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 319
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 332
    .end local v7    # "i":I
    .end local v9    # "j":I
    :cond_3
    and-int/lit8 v13, p5, 0x20

    if-eqz v13, :cond_5

    .line 334
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_4
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 335
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_5
    move/from16 v0, p0

    if-ge v9, v0, :cond_4

    .line 336
    mul-int/lit8 v13, p0, 0x3

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x3

    add-int v8, v13, v14

    .line 337
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 338
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 339
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 340
    .restart local v11    # "r":I
    const/16 v1, 0xff

    .line 341
    .restart local v1    # "a":I
    mul-int v13, p0, v7

    add-int/2addr v13, v9

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 335
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 334
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 347
    .end local v7    # "i":I
    .end local v9    # "j":I
    :cond_5
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_6
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 348
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_7
    move/from16 v0, p0

    if-ge v9, v0, :cond_6

    .line 349
    mul-int/lit8 v13, p0, 0x3

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x3

    add-int v8, v13, v14

    .line 350
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 351
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 352
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 353
    .restart local v11    # "r":I
    const/16 v1, 0xff

    .line 354
    .restart local v1    # "a":I
    sub-int v13, p1, v7

    add-int/lit8 v13, v13, -0x1

    mul-int v13, v13, p0

    add-int/2addr v13, v9

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 348
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 347
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 361
    .end local v7    # "i":I
    .end local v9    # "j":I
    :sswitch_1
    mul-int v13, p0, p1

    new-array v10, v13, [I

    .line 362
    and-int/lit8 v13, p5, 0x10

    if-eqz v13, :cond_a

    .line 363
    and-int/lit8 v13, p5, 0x20

    if-eqz v13, :cond_8

    .line 365
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_8
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 366
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_9
    move/from16 v0, p0

    if-ge v9, v0, :cond_7

    .line 367
    mul-int/lit8 v13, p0, 0x4

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x4

    add-int v8, v13, v14

    .line 368
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 369
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 370
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 371
    .restart local v11    # "r":I
    add-int/lit8 v13, v8, 0x3

    aget-byte v13, p3, v13

    and-int/lit16 v1, v13, 0xff

    .line 372
    .restart local v1    # "a":I
    mul-int v13, p0, v7

    sub-int v14, p0, v9

    add-int/lit8 v14, v14, -0x1

    add-int/2addr v13, v14

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 366
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 365
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 378
    .end local v7    # "i":I
    .end local v9    # "j":I
    :cond_8
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_a
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 379
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_b
    move/from16 v0, p0

    if-ge v9, v0, :cond_9

    .line 380
    mul-int/lit8 v13, p0, 0x4

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x4

    add-int v8, v13, v14

    .line 381
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 382
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 383
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 384
    .restart local v11    # "r":I
    add-int/lit8 v13, v8, 0x3

    aget-byte v13, p3, v13

    and-int/lit16 v1, v13, 0xff

    .line 385
    .restart local v1    # "a":I
    sub-int v13, p1, v7

    add-int/lit8 v13, v13, -0x1

    mul-int v13, v13, p0

    sub-int v14, p0, v9

    add-int/lit8 v14, v14, -0x1

    add-int/2addr v13, v14

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 379
    add-int/lit8 v9, v9, 0x1

    goto :goto_b

    .line 378
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_a

    .line 391
    .end local v7    # "i":I
    .end local v9    # "j":I
    :cond_a
    and-int/lit8 v13, p5, 0x20

    if-eqz v13, :cond_c

    .line 393
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_c
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 394
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_d
    move/from16 v0, p0

    if-ge v9, v0, :cond_b

    .line 395
    mul-int/lit8 v13, p0, 0x4

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x4

    add-int v8, v13, v14

    .line 396
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 397
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 398
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 399
    .restart local v11    # "r":I
    add-int/lit8 v13, v8, 0x3

    aget-byte v13, p3, v13

    and-int/lit16 v1, v13, 0xff

    .line 400
    .restart local v1    # "a":I
    mul-int v13, p0, v7

    add-int/2addr v13, v9

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 394
    add-int/lit8 v9, v9, 0x1

    goto :goto_d

    .line 393
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_b
    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    .line 406
    .end local v7    # "i":I
    .end local v9    # "j":I
    :cond_c
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_e
    move/from16 v0, p1

    if-ge v7, v0, :cond_e

    .line 407
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_f
    move/from16 v0, p0

    if-ge v9, v0, :cond_d

    .line 408
    mul-int/lit8 v13, p0, 0x4

    mul-int/2addr v13, v7

    add-int v13, v13, p4

    mul-int/lit8 v14, v9, 0x4

    add-int v8, v13, v14

    .line 409
    .restart local v8    # "index":I
    add-int/lit8 v13, v8, 0x0

    aget-byte v13, p3, v13

    and-int/lit16 v3, v13, 0xff

    .line 410
    .restart local v3    # "b":I
    add-int/lit8 v13, v8, 0x1

    aget-byte v13, p3, v13

    and-int/lit16 v5, v13, 0xff

    .line 411
    .restart local v5    # "g":I
    add-int/lit8 v13, v8, 0x2

    aget-byte v13, p3, v13

    and-int/lit16 v11, v13, 0xff

    .line 412
    .restart local v11    # "r":I
    add-int/lit8 v13, v8, 0x3

    aget-byte v13, p3, v13

    and-int/lit16 v1, v13, 0xff

    .line 413
    .restart local v1    # "a":I
    sub-int v13, p1, v7

    add-int/lit8 v13, v13, -0x1

    mul-int v13, v13, p0

    add-int/2addr v13, v9

    shl-int v14, v11, v12

    shl-int v15, v5, v6

    or-int/2addr v14, v15

    shl-int v15, v3, v4

    or-int/2addr v14, v15

    shl-int v15, v1, v2

    or-int/2addr v14, v15

    aput v14, v10, v13

    .line 407
    add-int/lit8 v9, v9, 0x1

    goto :goto_f

    .line 406
    .end local v1    # "a":I
    .end local v3    # "b":I
    .end local v5    # "g":I
    .end local v8    # "index":I
    .end local v11    # "r":I
    :cond_d
    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 422
    .end local v9    # "j":I
    :cond_e
    return-object v10

    .line 300
    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_0
        0x20 -> :sswitch_1
    .end sparse-switch
.end method

.method private static decodeRLE(III[BI)[B
    .locals 12
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "depth"    # I
    .param p3, "buffer"    # [B
    .param p4, "offset"    # I

    .prologue
    .line 95
    div-int/lit8 v5, p2, 0x8

    .line 96
    .local v5, "elementCount":I
    new-array v6, v5, [B

    .line 97
    .local v6, "elements":[B
    mul-int v11, v5, p0

    mul-int v2, v11, p1

    .line 98
    .local v2, "decodeBufferLength":I
    new-array v1, v2, [B

    .line 99
    .local v1, "decodeBuffer":[B
    const/4 v3, 0x0

    .local v3, "decoded":I
    move/from16 v9, p4

    .line 100
    .end local p4    # "offset":I
    .local v9, "offset":I
    :goto_0
    if-ge v3, v2, :cond_4

    .line 101
    add-int/lit8 p4, v9, 0x1

    .end local v9    # "offset":I
    .restart local p4    # "offset":I
    aget-byte v11, p3, v9

    and-int/lit16 v10, v11, 0xff

    .line 102
    .local v10, "packet":I
    and-int/lit16 v11, v10, 0x80

    if-eqz v11, :cond_3

    .line 103
    const/4 v7, 0x0

    .local v7, "i":I
    move/from16 v9, p4

    .end local p4    # "offset":I
    .restart local v9    # "offset":I
    :goto_1
    if-ge v7, v5, :cond_0

    .line 104
    add-int/lit8 p4, v9, 0x1

    .end local v9    # "offset":I
    .restart local p4    # "offset":I
    aget-byte v11, p3, v9

    aput-byte v11, v6, v7

    .line 103
    add-int/lit8 v7, v7, 0x1

    move/from16 v9, p4

    .end local p4    # "offset":I
    .restart local v9    # "offset":I
    goto :goto_1

    .line 106
    :cond_0
    and-int/lit8 v11, v10, 0x7f

    add-int/lit8 v0, v11, 0x1

    .line 107
    .local v0, "count":I
    const/4 v7, 0x0

    :goto_2
    if-ge v7, v0, :cond_2

    .line 108
    const/4 v8, 0x0

    .local v8, "j":I
    move v4, v3

    .end local v3    # "decoded":I
    .local v4, "decoded":I
    :goto_3
    if-ge v8, v5, :cond_1

    .line 109
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "decoded":I
    .restart local v3    # "decoded":I
    aget-byte v11, v6, v8

    aput-byte v11, v1, v4

    .line 108
    add-int/lit8 v8, v8, 0x1

    move v4, v3

    .end local v3    # "decoded":I
    .restart local v4    # "decoded":I
    goto :goto_3

    .line 107
    :cond_1
    add-int/lit8 v7, v7, 0x1

    move v3, v4

    .end local v4    # "decoded":I
    .restart local v3    # "decoded":I
    goto :goto_2

    .end local v8    # "j":I
    :cond_2
    move/from16 p4, v9

    .end local v9    # "offset":I
    .restart local p4    # "offset":I
    :goto_4
    move/from16 v9, p4

    .line 119
    .end local p4    # "offset":I
    .restart local v9    # "offset":I
    goto :goto_0

    .line 114
    .end local v0    # "count":I
    .end local v7    # "i":I
    .end local v9    # "offset":I
    .restart local p4    # "offset":I
    :cond_3
    add-int/lit8 v11, v10, 0x1

    mul-int v0, v11, v5

    .line 115
    .restart local v0    # "count":I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    move v4, v3

    .end local v3    # "decoded":I
    .restart local v4    # "decoded":I
    move/from16 v9, p4

    .end local p4    # "offset":I
    .restart local v9    # "offset":I
    :goto_5
    if-ge v7, v0, :cond_5

    .line 116
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "decoded":I
    .restart local v3    # "decoded":I
    add-int/lit8 p4, v9, 0x1

    .end local v9    # "offset":I
    .restart local p4    # "offset":I
    aget-byte v11, p3, v9

    aput-byte v11, v1, v4

    .line 115
    add-int/lit8 v7, v7, 0x1

    move v4, v3

    .end local v3    # "decoded":I
    .restart local v4    # "decoded":I
    move/from16 v9, p4

    .end local p4    # "offset":I
    .restart local v9    # "offset":I
    goto :goto_5

    .line 120
    .end local v0    # "count":I
    .end local v4    # "decoded":I
    .end local v7    # "i":I
    .end local v10    # "packet":I
    .restart local v3    # "decoded":I
    :cond_4
    return-object v1

    .end local v3    # "decoded":I
    .restart local v0    # "count":I
    .restart local v4    # "decoded":I
    .restart local v7    # "i":I
    .restart local v10    # "packet":I
    :cond_5
    move v3, v4

    .end local v4    # "decoded":I
    .restart local v3    # "decoded":I
    move/from16 p4, v9

    .end local v9    # "offset":I
    .restart local p4    # "offset":I
    goto :goto_4
.end method

.method public static getHeight([B)I
    .locals 2
    .param p0, "buffer"    # [B

    .prologue
    .line 30
    const/16 v0, 0xe

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xf

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method public static getWidth([B)I
    .locals 2
    .param p0, "buffer"    # [B

    .prologue
    .line 26
    const/16 v0, 0xc

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xd

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method public static read([BLnet/npe/tga/TGAReader$Order;)[I
    .locals 24
    .param p0, "buffer"    # [B
    .param p1, "order"    # Lnet/npe/tga/TGAReader$Order;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v4, 0x2

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    move/from16 v23, v0

    .line 39
    .local v23, "type":I
    const/4 v4, 0x3

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    const/4 v6, 0x4

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int v7, v4, v6

    .line 40
    .local v7, "colormapOrigin":I
    const/4 v4, 0x5

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    const/4 v6, 0x6

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int v21, v4, v6

    .line 41
    .local v21, "colormapLength":I
    const/4 v4, 0x7

    aget-byte v4, p0, v4

    and-int/lit16 v3, v4, 0xff

    .line 44
    .local v3, "colormapDepth":I
    invoke-static/range {p0 .. p0}, Lnet/npe/tga/TGAReader;->getWidth([B)I

    move-result v1

    .line 45
    .local v1, "width":I
    invoke-static/range {p0 .. p0}, Lnet/npe/tga/TGAReader;->getHeight([B)I

    move-result v2

    .line 46
    .local v2, "height":I
    const/16 v4, 0x10

    aget-byte v4, p0, v4

    and-int/lit16 v11, v4, 0xff

    .line 47
    .local v11, "depth":I
    const/16 v4, 0x11

    aget-byte v4, p0, v4

    and-int/lit16 v8, v4, 0xff

    .line 49
    .local v8, "descriptor":I
    const/16 v22, 0x0

    .line 52
    .local v22, "pixels":[I
    packed-switch v23, :pswitch_data_0

    .line 77
    :pswitch_0
    new-instance v4, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unsupported image type: "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v23

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 54
    :pswitch_1
    div-int/lit8 v4, v3, 0x8

    mul-int v4, v4, v21

    add-int/lit8 v5, v4, 0x12

    .local v5, "imageDataOffset":I
    move-object/from16 v4, p0

    move-object/from16 v6, p0

    move-object/from16 v9, p1

    .line 55
    invoke-static/range {v1 .. v9}, Lnet/npe/tga/TGAReader;->createPixelsFromColormap(III[BI[BIILnet/npe/tga/TGAReader$Order;)[I

    move-result-object v22

    .line 80
    .end local v5    # "imageDataOffset":I
    :goto_0
    return-object v22

    .line 58
    :pswitch_2
    const/16 v13, 0x12

    move v9, v1

    move v10, v2

    move-object/from16 v12, p0

    move v14, v8

    move-object/from16 v15, p1

    invoke-static/range {v9 .. v15}, Lnet/npe/tga/TGAReader;->createPixelsFromRGB(III[BIILnet/npe/tga/TGAReader$Order;)[I

    move-result-object v22

    .line 59
    goto :goto_0

    .line 61
    :pswitch_3
    const/16 v13, 0x12

    move v9, v1

    move v10, v2

    move-object/from16 v12, p0

    move v14, v8

    move-object/from16 v15, p1

    invoke-static/range {v9 .. v15}, Lnet/npe/tga/TGAReader;->createPixelsFromGrayscale(III[BIILnet/npe/tga/TGAReader$Order;)[I

    move-result-object v22

    .line 62
    goto :goto_0

    .line 64
    :pswitch_4
    div-int/lit8 v4, v3, 0x8

    mul-int v4, v4, v21

    add-int/lit8 v5, v4, 0x12

    .line 65
    .restart local v5    # "imageDataOffset":I
    move-object/from16 v0, p0

    invoke-static {v1, v2, v11, v0, v5}, Lnet/npe/tga/TGAReader;->decodeRLE(III[BI)[B

    move-result-object v15

    .line 66
    .local v15, "decodeBuffer":[B
    const/16 v16, 0x0

    move v12, v1

    move v13, v2

    move v14, v3

    move-object/from16 v17, p0

    move/from16 v18, v7

    move/from16 v19, v8

    move-object/from16 v20, p1

    invoke-static/range {v12 .. v20}, Lnet/npe/tga/TGAReader;->createPixelsFromColormap(III[BI[BIILnet/npe/tga/TGAReader$Order;)[I

    move-result-object v22

    .line 67
    goto :goto_0

    .line 69
    .end local v5    # "imageDataOffset":I
    .end local v15    # "decodeBuffer":[B
    :pswitch_5
    const/16 v4, 0x12

    move-object/from16 v0, p0

    invoke-static {v1, v2, v11, v0, v4}, Lnet/npe/tga/TGAReader;->decodeRLE(III[BI)[B

    move-result-object v15

    .line 70
    .restart local v15    # "decodeBuffer":[B
    const/16 v16, 0x0

    move v12, v1

    move v13, v2

    move v14, v11

    move/from16 v17, v8

    move-object/from16 v18, p1

    invoke-static/range {v12 .. v18}, Lnet/npe/tga/TGAReader;->createPixelsFromRGB(III[BIILnet/npe/tga/TGAReader$Order;)[I

    move-result-object v22

    .line 71
    goto :goto_0

    .line 73
    .end local v15    # "decodeBuffer":[B
    :pswitch_6
    const/16 v4, 0x12

    move-object/from16 v0, p0

    invoke-static {v1, v2, v11, v0, v4}, Lnet/npe/tga/TGAReader;->decodeRLE(III[BI)[B

    move-result-object v15

    .line 74
    .restart local v15    # "decodeBuffer":[B
    const/16 v16, 0x0

    move v12, v1

    move v13, v2

    move v14, v11

    move/from16 v17, v8

    move-object/from16 v18, p1

    invoke-static/range {v12 .. v18}, Lnet/npe/tga/TGAReader;->createPixelsFromGrayscale(III[BIILnet/npe/tga/TGAReader$Order;)[I

    move-result-object v22

    .line 75
    goto :goto_0

    .line 52
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
