.class public Lorg/mozilla/javascript/UintMap;
.super Ljava/lang/Object;
.source "UintMap.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final A:I = -0x61c88647

.field private static final DELETED:I = -0x2

.field private static final EMPTY:I = -0x1

.field private static final check:Z = false

.field static final serialVersionUID:J = 0x3ae1178bbc3ee17cL


# instance fields
.field private transient ivaluesShift:I

.field private keyCount:I

.field private transient keys:[I

.field private transient occupiedCount:I

.field private power:I

.field private transient values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/UintMap;-><init>(I)V

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "initialCapacity"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 38
    :cond_0
    mul-int/lit8 v2, p1, 0x4

    div-int/lit8 v1, v2, 0x3

    .line 40
    .local v1, "minimalCapacity":I
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_0
    const/4 v2, 0x1

    shl-int/2addr v2, v0

    if-ge v2, v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 41
    :cond_1
    iput v0, p0, Lorg/mozilla/javascript/UintMap;->power:I

    .line 43
    return-void
.end method

.method private ensureIndex(IZ)I
    .locals 12
    .param p1, "key"    # I
    .param p2, "intType"    # Z

    .prologue
    const/4 v11, 0x1

    const/4 v10, -0x1

    const/4 v9, -0x2

    .line 290
    const/4 v3, -0x1

    .line 291
    .local v3, "index":I
    const/4 v1, -0x1

    .line 292
    .local v1, "firstDeleted":I
    iget-object v4, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 293
    .local v4, "keys":[I
    if-eqz v4, :cond_5

    .line 294
    const v8, -0x61c88647

    mul-int v2, p1, v8

    .line 295
    .local v2, "fraction":I
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->power:I

    rsub-int/lit8 v8, v8, 0x20

    ushr-int v3, v2, v8

    .line 296
    aget v0, v4, v3

    .line 297
    .local v0, "entry":I
    if-ne v0, p1, :cond_0

    move v8, v3

    .line 335
    .end local v0    # "entry":I
    .end local v2    # "fraction":I
    :goto_0
    return v8

    .line 298
    .restart local v0    # "entry":I
    .restart local v2    # "fraction":I
    :cond_0
    if-eq v0, v10, :cond_5

    .line 299
    if-ne v0, v9, :cond_1

    move v1, v3

    .line 301
    :cond_1
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int v8, v11, v8

    add-int/lit8 v5, v8, -0x1

    .line 302
    .local v5, "mask":I
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->power:I

    invoke-static {v2, v5, v8}, Lorg/mozilla/javascript/UintMap;->tableLookupStep(III)I

    move-result v7

    .line 303
    .local v7, "step":I
    const/4 v6, 0x0

    .line 309
    .local v6, "n":I
    :cond_2
    add-int v8, v3, v7

    and-int v3, v8, v5

    .line 310
    aget v0, v4, v3

    .line 311
    if-ne v0, p1, :cond_3

    move v8, v3

    goto :goto_0

    .line 312
    :cond_3
    if-ne v0, v9, :cond_4

    if-gez v1, :cond_4

    .line 313
    move v1, v3

    .line 315
    :cond_4
    if-ne v0, v10, :cond_2

    .line 321
    .end local v0    # "entry":I
    .end local v2    # "fraction":I
    .end local v5    # "mask":I
    .end local v6    # "n":I
    .end local v7    # "step":I
    :cond_5
    if-ltz v1, :cond_6

    .line 322
    move v3, v1

    .line 333
    :goto_1
    aput p1, v4, v3

    .line 334
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    move v8, v3

    .line 335
    goto :goto_0

    .line 326
    :cond_6
    if-eqz v4, :cond_7

    iget v8, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    mul-int/lit8 v8, v8, 0x4

    iget v9, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int v9, v11, v9

    mul-int/lit8 v9, v9, 0x3

    if-lt v8, v9, :cond_8

    .line 328
    :cond_7
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/UintMap;->rehashTable(Z)V

    .line 329
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/UintMap;->insertNewKey(I)I

    move-result v8

    goto :goto_0

    .line 331
    :cond_8
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    goto :goto_1
.end method

.method private findIndex(I)I
    .locals 10
    .param p1, "key"    # I

    .prologue
    const/4 v7, -0x1

    .line 197
    iget-object v3, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 198
    .local v3, "keys":[I
    if-eqz v3, :cond_3

    .line 199
    const v8, -0x61c88647

    mul-int v1, p1, v8

    .line 200
    .local v1, "fraction":I
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->power:I

    rsub-int/lit8 v8, v8, 0x20

    ushr-int v2, v1, v8

    .line 201
    .local v2, "index":I
    aget v0, v3, v2

    .line 202
    .local v0, "entry":I
    if-ne v0, p1, :cond_1

    .line 219
    .end local v0    # "entry":I
    .end local v1    # "fraction":I
    .end local v2    # "index":I
    :cond_0
    :goto_0
    return v2

    .line 203
    .restart local v0    # "entry":I
    .restart local v1    # "fraction":I
    .restart local v2    # "index":I
    :cond_1
    if-eq v0, v7, :cond_3

    .line 205
    const/4 v8, 0x1

    iget v9, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int/2addr v8, v9

    add-int/lit8 v4, v8, -0x1

    .line 206
    .local v4, "mask":I
    iget v8, p0, Lorg/mozilla/javascript/UintMap;->power:I

    invoke-static {v1, v4, v8}, Lorg/mozilla/javascript/UintMap;->tableLookupStep(III)I

    move-result v6

    .line 207
    .local v6, "step":I
    const/4 v5, 0x0

    .line 213
    .local v5, "n":I
    :cond_2
    add-int v8, v2, v6

    and-int v2, v8, v4

    .line 214
    aget v0, v3, v2

    .line 215
    if-eq v0, p1, :cond_0

    .line 216
    if-ne v0, v7, :cond_2

    .end local v0    # "entry":I
    .end local v1    # "fraction":I
    .end local v2    # "index":I
    .end local v4    # "mask":I
    .end local v5    # "n":I
    .end local v6    # "step":I
    :cond_3
    move v2, v7

    .line 219
    goto :goto_0
.end method

.method private insertNewKey(I)I
    .locals 9
    .param p1, "key"    # I

    .prologue
    const/4 v8, -0x1

    .line 227
    iget-object v3, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 228
    .local v3, "keys":[I
    const v6, -0x61c88647

    mul-int v1, p1, v6

    .line 229
    .local v1, "fraction":I
    iget v6, p0, Lorg/mozilla/javascript/UintMap;->power:I

    rsub-int/lit8 v6, v6, 0x20

    ushr-int v2, v1, v6

    .line 230
    .local v2, "index":I
    aget v6, v3, v2

    if-eq v6, v8, :cond_1

    .line 231
    const/4 v6, 0x1

    iget v7, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int/2addr v6, v7

    add-int/lit8 v4, v6, -0x1

    .line 232
    .local v4, "mask":I
    iget v6, p0, Lorg/mozilla/javascript/UintMap;->power:I

    invoke-static {v1, v4, v6}, Lorg/mozilla/javascript/UintMap;->tableLookupStep(III)I

    move-result v5

    .line 233
    .local v5, "step":I
    move v0, v2

    .line 236
    .local v0, "firstIndex":I
    :cond_0
    add-int v6, v2, v5

    and-int v2, v6, v4

    .line 238
    aget v6, v3, v2

    if-ne v6, v8, :cond_0

    .line 240
    .end local v0    # "firstIndex":I
    .end local v4    # "mask":I
    .end local v5    # "step":I
    :cond_1
    aput p1, v3, v2

    .line 241
    iget v6, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    .line 242
    iget v6, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 243
    return v2
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 10
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 369
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 371
    iget v7, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 372
    .local v7, "writtenKeyCount":I
    if-eqz v7, :cond_5

    .line 373
    const/4 v8, 0x0

    iput v8, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 374
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v1

    .line 375
    .local v1, "hasIntValues":Z
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v2

    .line 377
    .local v2, "hasObjectValues":Z
    const/4 v8, 0x1

    iget v9, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int v0, v8, v9

    .line 378
    .local v0, "N":I
    if-eqz v1, :cond_0

    .line 379
    mul-int/lit8 v8, v0, 0x2

    new-array v8, v8, [I

    iput-object v8, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 380
    iput v0, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    .line 384
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-eq v3, v0, :cond_1

    .line 385
    iget-object v8, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    const/4 v9, -0x1

    aput v9, v8, v3

    .line 384
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 382
    .end local v3    # "i":I
    :cond_0
    new-array v8, v0, [I

    iput-object v8, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    goto :goto_0

    .line 387
    .restart local v3    # "i":I
    :cond_1
    if-eqz v2, :cond_2

    .line 388
    new-array v8, v0, [Ljava/lang/Object;

    iput-object v8, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    .line 390
    :cond_2
    const/4 v3, 0x0

    :goto_2
    if-eq v3, v7, :cond_5

    .line 391
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v6

    .line 392
    .local v6, "key":I
    invoke-direct {p0, v6}, Lorg/mozilla/javascript/UintMap;->insertNewKey(I)I

    move-result v4

    .line 393
    .local v4, "index":I
    if-eqz v1, :cond_3

    .line 394
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v5

    .line 395
    .local v5, "ivalue":I
    iget-object v8, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v9, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v9, v4

    aput v5, v8, v9

    .line 397
    .end local v5    # "ivalue":I
    :cond_3
    if-eqz v2, :cond_4

    .line 398
    iget-object v8, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v8, v4

    .line 390
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 402
    .end local v0    # "N":I
    .end local v1    # "hasIntValues":Z
    .end local v2    # "hasObjectValues":Z
    .end local v3    # "i":I
    .end local v4    # "index":I
    .end local v6    # "key":I
    :cond_5
    return-void
.end method

.method private rehashTable(Z)V
    .locals 13
    .param p1, "ensureIntSpace"    # Z

    .prologue
    const/4 v11, 0x0

    const/4 v12, -0x1

    .line 247
    iget-object v9, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    if-eqz v9, :cond_0

    .line 249
    iget v9, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    mul-int/lit8 v9, v9, 0x2

    iget v10, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    if-lt v9, v10, :cond_0

    .line 251
    iget v9, p0, Lorg/mozilla/javascript/UintMap;->power:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lorg/mozilla/javascript/UintMap;->power:I

    .line 254
    :cond_0
    const/4 v9, 0x1

    iget v10, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int v0, v9, v10

    .line 255
    .local v0, "N":I
    iget-object v4, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 256
    .local v4, "old":[I
    iget v6, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    .line 257
    .local v6, "oldShift":I
    if-nez v6, :cond_1

    if-nez p1, :cond_1

    .line 258
    new-array v9, v0, [I

    iput-object v9, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 263
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-eq v1, v0, :cond_2

    iget-object v9, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    aput v12, v9, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 261
    .end local v1    # "i":I
    :cond_1
    iput v0, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    mul-int/lit8 v9, v0, 0x2

    new-array v9, v9, [I

    iput-object v9, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    goto :goto_0

    .line 265
    .restart local v1    # "i":I
    :cond_2
    iget-object v7, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    .line 266
    .local v7, "oldValues":[Ljava/lang/Object;
    if-eqz v7, :cond_3

    new-array v9, v0, [Ljava/lang/Object;

    iput-object v9, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    .line 268
    :cond_3
    iget v5, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 269
    .local v5, "oldCount":I
    iput v11, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    .line 270
    if-eqz v5, :cond_7

    .line 271
    iput v11, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 272
    const/4 v1, 0x0

    move v8, v5

    .local v8, "remaining":I
    :goto_2
    if-eqz v8, :cond_7

    .line 273
    aget v3, v4, v1

    .line 274
    .local v3, "key":I
    if-eq v3, v12, :cond_6

    const/4 v9, -0x2

    if-eq v3, v9, :cond_6

    .line 275
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/UintMap;->insertNewKey(I)I

    move-result v2

    .line 276
    .local v2, "index":I
    if-eqz v7, :cond_4

    .line 277
    iget-object v9, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    aget-object v10, v7, v1

    aput-object v10, v9, v2

    .line 279
    :cond_4
    if-eqz v6, :cond_5

    .line 280
    iget-object v9, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v10, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v10, v2

    add-int v11, v6, v1

    aget v11, v4, v11

    aput v11, v9, v10

    .line 282
    :cond_5
    add-int/lit8 v8, v8, -0x1

    .line 272
    .end local v2    # "index":I
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 286
    .end local v3    # "key":I
    .end local v8    # "remaining":I
    :cond_7
    return-void
.end method

.method private static tableLookupStep(III)I
    .locals 2
    .param p0, "fraction"    # I
    .param p1, "mask"    # I
    .param p2, "power"    # I

    .prologue
    .line 187
    mul-int/lit8 v1, p2, 0x2

    rsub-int/lit8 v0, v1, 0x20

    .line 188
    .local v0, "shift":I
    if-ltz v0, :cond_0

    .line 189
    ushr-int v1, p0, v0

    and-int/2addr v1, p1

    or-int/lit8 v1, v1, 0x1

    .line 192
    :goto_0
    return v1

    :cond_0
    neg-int v1, v0

    ushr-int v1, p1, v1

    and-int/2addr v1, p0

    or-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 8
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 341
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 343
    iget v0, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 344
    .local v0, "count":I
    if-eqz v0, :cond_4

    .line 345
    iget v7, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    if-eqz v7, :cond_2

    move v1, v5

    .line 346
    .local v1, "hasIntValues":Z
    :goto_0
    iget-object v7, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    if-eqz v7, :cond_3

    move v2, v5

    .line 347
    .local v2, "hasObjectValues":Z
    :goto_1
    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 348
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 350
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-eqz v0, :cond_4

    .line 351
    iget-object v5, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    aget v4, v5, v3

    .line 352
    .local v4, "key":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    const/4 v5, -0x2

    if-eq v4, v5, :cond_1

    .line 353
    add-int/lit8 v0, v0, -0x1

    .line 354
    invoke-virtual {p1, v4}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 355
    if-eqz v1, :cond_0

    .line 356
    iget-object v5, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v6, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v6, v3

    aget v5, v5, v6

    invoke-virtual {p1, v5}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 358
    :cond_0
    if-eqz v2, :cond_1

    .line 359
    iget-object v5, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    aget-object v5, v5, v3

    invoke-virtual {p1, v5}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 350
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .end local v1    # "hasIntValues":Z
    .end local v2    # "hasObjectValues":Z
    .end local v3    # "i":I
    .end local v4    # "key":I
    :cond_2
    move v1, v6

    .line 345
    goto :goto_0

    .restart local v1    # "hasIntValues":Z
    :cond_3
    move v2, v6

    .line 346
    goto :goto_1

    .line 364
    .end local v1    # "hasIntValues":Z
    :cond_4
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 156
    const/4 v2, 0x1

    iget v3, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int v0, v2, v3

    .line 157
    .local v0, "N":I
    iget-object v2, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    if-eqz v2, :cond_1

    .line 158
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 159
    iget-object v2, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    const/4 v3, -0x1

    aput v3, v2, v1

    .line 158
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 161
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    if-eqz v2, :cond_1

    .line 162
    const/4 v1, 0x0

    :goto_1
    if-eq v1, v0, :cond_1

    .line 163
    iget-object v2, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v3, v2, v1

    .line 162
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 167
    .end local v1    # "i":I
    :cond_1
    iput v4, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    .line 168
    iput v4, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 169
    iput v4, p0, Lorg/mozilla/javascript/UintMap;->occupiedCount:I

    .line 170
    return-void
.end method

.method public getExistingInt(I)I
    .locals 3
    .param p1, "key"    # I

    .prologue
    const/4 v1, 0x0

    .line 96
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 97
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/UintMap;->findIndex(I)I

    move-result v0

    .line 98
    .local v0, "index":I
    if-ltz v0, :cond_2

    .line 99
    iget v2, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    if-eqz v2, :cond_1

    .line 100
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v2, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v2, v0

    aget v1, v1, v2

    .line 106
    :cond_1
    :goto_0
    return v1

    .line 105
    :cond_2
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_0
.end method

.method public getInt(II)I
    .locals 3
    .param p1, "key"    # I
    .param p2, "defaultValue"    # I

    .prologue
    .line 78
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 79
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/UintMap;->findIndex(I)I

    move-result v0

    .line 80
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 81
    iget v1, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    if-eqz v1, :cond_2

    .line 82
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v2, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v2, v0

    aget p2, v1, v2

    .line 86
    .end local p2    # "defaultValue":I
    :cond_1
    :goto_0
    return p2

    .line 84
    .restart local p2    # "defaultValue":I
    :cond_2
    const/4 p2, 0x0

    goto :goto_0
.end method

.method public getKeys()[I
    .locals 6

    .prologue
    .line 174
    iget-object v2, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 175
    .local v2, "keys":[I
    iget v3, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 176
    .local v3, "n":I
    new-array v4, v3, [I

    .line 177
    .local v4, "result":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eqz v3, :cond_1

    .line 178
    aget v0, v2, v1

    .line 179
    .local v0, "entry":I
    const/4 v5, -0x1

    if-eq v0, v5, :cond_0

    const/4 v5, -0x2

    if-eq v0, v5, :cond_0

    .line 180
    add-int/lit8 v3, v3, -0x1

    aput v0, v4, v3

    .line 177
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 183
    .end local v0    # "entry":I
    :cond_1
    return-object v4
.end method

.method public getObject(I)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # I

    .prologue
    .line 63
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 64
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    if-eqz v1, :cond_1

    .line 65
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/UintMap;->findIndex(I)I

    move-result v0

    .line 66
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 67
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    aget-object v1, v1, v0

    .line 70
    .end local v0    # "index":I
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public has(I)Z
    .locals 1
    .param p1, "key"    # I

    .prologue
    .line 54
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 55
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/UintMap;->findIndex(I)I

    move-result v0

    if-ltz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public put(II)V
    .locals 6
    .param p1, "key"    # I
    .param p2, "value"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 127
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 128
    :cond_0
    invoke-direct {p0, p1, v4}, Lorg/mozilla/javascript/UintMap;->ensureIndex(IZ)I

    move-result v1

    .line 129
    .local v1, "index":I
    iget v3, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    if-nez v3, :cond_2

    .line 130
    iget v3, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int v0, v4, v3

    .line 132
    .local v0, "N":I
    iget-object v3, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    array-length v3, v3

    mul-int/lit8 v4, v0, 0x2

    if-eq v3, v4, :cond_1

    .line 133
    mul-int/lit8 v3, v0, 0x2

    new-array v2, v3, [I

    .line 134
    .local v2, "tmp":[I
    iget-object v3, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    invoke-static {v3, v5, v2, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    iput-object v2, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    .line 137
    .end local v2    # "tmp":[I
    :cond_1
    iput v0, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    .line 139
    .end local v0    # "N":I
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v4, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v4, v1

    aput p2, v3, v4

    .line 140
    return-void
.end method

.method public put(ILjava/lang/Object;)V
    .locals 3
    .param p1, "key"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 114
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 115
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/mozilla/javascript/UintMap;->ensureIndex(IZ)I

    move-result v0

    .line 116
    .local v0, "index":I
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 117
    const/4 v1, 0x1

    iget v2, p0, Lorg/mozilla/javascript/UintMap;->power:I

    shl-int/2addr v1, v2

    new-array v1, v1, [Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    .line 119
    :cond_1
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    aput-object p2, v1, v0

    .line 120
    return-void
.end method

.method public remove(I)V
    .locals 4
    .param p1, "key"    # I

    .prologue
    .line 143
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 144
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/UintMap;->findIndex(I)I

    move-result v0

    .line 145
    .local v0, "index":I
    if-ltz v0, :cond_2

    .line 146
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    const/4 v2, -0x2

    aput v2, v1, v0

    .line 147
    iget v1, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    .line 150
    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->values:[Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 151
    :cond_1
    iget v1, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/mozilla/javascript/UintMap;->keys:[I

    iget v2, p0, Lorg/mozilla/javascript/UintMap;->ivaluesShift:I

    add-int/2addr v2, v0

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 153
    :cond_2
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lorg/mozilla/javascript/UintMap;->keyCount:I

    return v0
.end method
