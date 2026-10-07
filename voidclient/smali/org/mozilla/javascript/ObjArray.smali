.class public Lorg/mozilla/javascript/ObjArray;
.super Ljava/lang/Object;
.source "ObjArray.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final FIELDS_STORE_SIZE:I = 0x5

.field static final serialVersionUID:J = 0x39f02f75d6f74578L


# instance fields
.field private transient data:[Ljava/lang/Object;

.field private transient f0:Ljava/lang/Object;

.field private transient f1:Ljava/lang/Object;

.field private transient f2:Ljava/lang/Object;

.field private transient f3:Ljava/lang/Object;

.field private transient f4:Ljava/lang/Object;

.field private sealed:Z

.field private size:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private ensureCapacity(I)V
    .locals 6
    .param p1, "minimalCapacity"    # I

    .prologue
    const/4 v4, 0x5

    const/4 v5, 0x0

    .line 278
    add-int/lit8 v1, p1, -0x5

    .line 279
    .local v1, "required":I
    if-gtz v1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 280
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    if-nez v3, :cond_3

    .line 281
    const/16 v0, 0xa

    .line 282
    .local v0, "alloc":I
    if-ge v0, v1, :cond_1

    .line 283
    move v0, v1

    .line 285
    :cond_1
    new-array v3, v0, [Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    .line 305
    :cond_2
    :goto_0
    return-void

    .line 287
    .end local v0    # "alloc":I
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    array-length v0, v3

    .line 288
    .restart local v0    # "alloc":I
    if-ge v0, v1, :cond_2

    .line 289
    if-gt v0, v4, :cond_6

    .line 290
    const/16 v0, 0xa

    .line 294
    :goto_1
    if-ge v0, v1, :cond_4

    .line 295
    move v0, v1

    .line 297
    :cond_4
    new-array v2, v0, [Ljava/lang/Object;

    .line 298
    .local v2, "tmp":[Ljava/lang/Object;
    iget v3, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-le v3, v4, :cond_5

    .line 299
    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    iget v4, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    add-int/lit8 v4, v4, -0x5

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 302
    :cond_5
    iput-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    goto :goto_0

    .line 292
    .end local v2    # "tmp":[Ljava/lang/Object;
    :cond_6
    mul-int/lit8 v0, v0, 0x2

    goto :goto_1
.end method

.method private getImpl(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 76
    packed-switch p1, :pswitch_data_0

    .line 83
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v1, p1, -0x5

    aget-object v0, v0, v1

    :goto_0
    return-object v0

    .line 77
    :pswitch_0
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_0

    .line 78
    :pswitch_1
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_0

    .line 79
    :pswitch_2
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_0

    .line 80
    :pswitch_3
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_0

    .line 81
    :pswitch_4
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_0

    .line 76
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private static onEmptyStackTopRead()Ljava/lang/RuntimeException;
    .locals 2

    .prologue
    .line 316
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Empty stack"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static onInvalidIndex(II)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "index"    # I
    .param p1, "upperBound"    # I

    .prologue
    .line 310
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u2209 [0, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static onSeledMutation()Ljava/lang/RuntimeException;
    .locals 2

    .prologue
    .line 321
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Attempt to modify sealed array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 4
    .param p1, "is"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 338
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 339
    .local v0, "N":I
    const/4 v3, 0x5

    if-le v0, v3, :cond_0

    .line 340
    add-int/lit8 v3, v0, -0x5

    new-array v3, v3, [Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    .line 342
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 343
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 344
    .local v2, "obj":Ljava/lang/Object;
    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 342
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 346
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_1
    return-void
.end method

.method private setImpl(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 88
    packed-switch p1, :pswitch_data_0

    .line 94
    iget-object v0, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v1, p1, -0x5

    aput-object p2, v0, v1

    .line 97
    :goto_0
    return-void

    .line 89
    :pswitch_0
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_0

    .line 90
    :pswitch_1
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_0

    .line 91
    :pswitch_2
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_0

    .line 92
    :pswitch_3
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_0

    .line 93
    :pswitch_4
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_0

    .line 88
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 3
    .param p1, "os"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 327
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 328
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 329
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v2

    .line 330
    .local v2, "obj":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 328
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 332
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_0
    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 169
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 170
    .local v0, "N":I
    if-ltz p1, :cond_0

    if-le p1, v0, :cond_1

    :cond_0
    add-int/lit8 v2, v0, 0x1

    invoke-static {p1, v2}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 171
    :cond_1
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 173
    :cond_2
    packed-switch p1, :pswitch_data_0

    .line 192
    :goto_0
    add-int/lit8 v2, v0, 0x1

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/ObjArray;->ensureCapacity(I)V

    .line 193
    if-eq p1, v0, :cond_3

    .line 194
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, p1, -0x5

    iget-object v4, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v5, p1, -0x5

    add-int/lit8 v5, v5, 0x1

    sub-int v6, v0, p1

    invoke-static {v2, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    :cond_3
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, p1, -0x5

    aput-object p2, v2, v3

    .line 200
    :goto_1
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 201
    return-void

    .line 175
    :pswitch_0
    if-nez v0, :cond_4

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_1

    .line 176
    :cond_4
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    .local v1, "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    move-object p2, v1

    .line 178
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_1
    const/4 v2, 0x1

    if-ne v0, v2, :cond_5

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_1

    .line 179
    :cond_5
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    move-object p2, v1

    .line 181
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_2
    const/4 v2, 0x2

    if-ne v0, v2, :cond_6

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_1

    .line 182
    :cond_6
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    move-object p2, v1

    .line 184
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_3
    const/4 v2, 0x3

    if-ne v0, v2, :cond_7

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_1

    .line 185
    :cond_7
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    move-object p2, v1

    .line 187
    .end local v1    # "tmp":Ljava/lang/Object;
    :pswitch_4
    const/4 v2, 0x4

    if-ne v0, v2, :cond_8

    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_1

    .line 188
    :cond_8
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    .restart local v1    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    move-object p2, v1

    .line 190
    const/4 p1, 0x5

    goto :goto_0

    .line 173
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public final add(Ljava/lang/Object;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 158
    iget-boolean v1, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 159
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 160
    .local v0, "N":I
    const/4 v1, 0x5

    if-lt v0, v1, :cond_1

    .line 161
    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->ensureCapacity(I)V

    .line 163
    :cond_1
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 164
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 165
    return-void
.end method

.method public final clear()V
    .locals 3

    .prologue
    .line 240
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 241
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 242
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 243
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 245
    :cond_1
    const/4 v2, 0x0

    iput v2, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 246
    return-void
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 63
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-lt p1, v0, :cond_1

    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 64
    :cond_1
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 101
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 102
    .local v0, "N":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_2

    .line 103
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v1

    .line 104
    .local v1, "current":Ljava/lang/Object;
    if-eq v1, p1, :cond_0

    if-eqz v1, :cond_1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 108
    .end local v1    # "current":Ljava/lang/Object;
    .end local v2    # "i":I
    :cond_0
    :goto_1
    return v2

    .line 102
    .restart local v1    # "current":Ljava/lang/Object;
    .restart local v2    # "i":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    .end local v1    # "current":Ljava/lang/Object;
    :cond_2
    const/4 v2, -0x1

    goto :goto_1
.end method

.method public final isEmpty()Z
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isSealed()Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    return v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 113
    iget v1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .local v1, "i":I
    :cond_0
    if-eqz v1, :cond_2

    .line 114
    add-int/lit8 v1, v1, -0x1

    .line 115
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v0

    .line 116
    .local v0, "current":Ljava/lang/Object;
    if-eq v0, p1, :cond_1

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_1
    move v2, v1

    .line 120
    .end local v0    # "current":Ljava/lang/Object;
    :goto_0
    return v2

    :cond_2
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public final peek()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 125
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 126
    .local v0, "N":I
    if-nez v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onEmptyStackTopRead()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 127
    :cond_0
    add-int/lit8 v1, v0, -0x1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final pop()Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 132
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 133
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 134
    .local v0, "N":I
    add-int/lit8 v0, v0, -0x1

    .line 136
    packed-switch v0, :pswitch_data_0

    .line 144
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, v0, -0x5

    aget-object v1, v2, v3

    .line 145
    .local v1, "top":Ljava/lang/Object;
    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, v0, -0x5

    aput-object v4, v2, v3

    .line 147
    :goto_0
    iput v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 148
    return-object v1

    .line 137
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_0
    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onEmptyStackTopRead()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 138
    :pswitch_1
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_0

    .line 139
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_2
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_0

    .line 140
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_3
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_0

    .line 141
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_4
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_0

    .line 142
    .end local v1    # "top":Ljava/lang/Object;
    :pswitch_5
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    .restart local v1    # "top":Ljava/lang/Object;
    iput-object v4, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_0

    .line 136
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public final push(Ljava/lang/Object;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 154
    return-void
.end method

.method public final remove(I)V
    .locals 7
    .param p1, "index"    # I

    .prologue
    const/4 v6, 0x0

    .line 205
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 206
    .local v0, "N":I
    if-ltz p1, :cond_0

    if-lt p1, v0, :cond_1

    :cond_0
    invoke-static {p1, v0}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 207
    :cond_1
    iget-boolean v1, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v1, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 208
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 209
    packed-switch p1, :pswitch_data_0

    .line 228
    :goto_0
    if-eq p1, v0, :cond_3

    .line 229
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, p1, -0x5

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v4, p1, -0x5

    sub-int v5, v0, p1

    invoke-static {v1, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    :cond_3
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, v0, -0x5

    aput-object v6, v1, v2

    .line 235
    :goto_1
    iput v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 236
    return-void

    .line 211
    :pswitch_0
    if-nez v0, :cond_4

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_1

    .line 212
    :cond_4
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    .line 214
    :pswitch_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_1

    .line 215
    :cond_5
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    .line 217
    :pswitch_2
    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_1

    .line 218
    :cond_6
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    .line 220
    :pswitch_3
    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_1

    .line 221
    :cond_7
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    .line 223
    :pswitch_4
    const/4 v1, 0x4

    if-ne v0, v1, :cond_8

    iput-object v6, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_1

    .line 224
    :cond_8
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iput-object v1, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    .line 226
    const/4 p1, 0x5

    goto :goto_0

    .line 209
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public final seal()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    .line 32
    return-void
.end method

.method public final set(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 69
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    if-lt p1, v0, :cond_1

    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 70
    :cond_1
    iget-boolean v0, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v0, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 71
    :cond_2
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 72
    return-void
.end method

.method public final setSize(I)V
    .locals 3
    .param p1, "newSize"    # I

    .prologue
    .line 46
    if-gez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 47
    :cond_0
    iget-boolean v2, p0, Lorg/mozilla/javascript/ObjArray;->sealed:Z

    if-eqz v2, :cond_1

    invoke-static {}, Lorg/mozilla/javascript/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 48
    :cond_1
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 49
    .local v0, "N":I
    if-ge p1, v0, :cond_2

    .line 50
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_3

    .line 51
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 53
    .end local v1    # "i":I
    :cond_2
    if-le p1, v0, :cond_3

    .line 54
    const/4 v2, 0x5

    if-le p1, v2, :cond_3

    .line 55
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ObjArray;->ensureCapacity(I)V

    .line 58
    :cond_3
    iput p1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 59
    return-void
.end method

.method public final size()I
    .locals 1

    .prologue
    .line 41
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    return v0
.end method

.method public final toArray([Ljava/lang/Object;)V
    .locals 1
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 257
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;I)V

    .line 258
    return-void
.end method

.method public final toArray([Ljava/lang/Object;I)V
    .locals 5
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "offset"    # I

    .prologue
    .line 262
    iget v0, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    .line 263
    .local v0, "N":I
    packed-switch v0, :pswitch_data_0

    .line 265
    iget-object v1, p0, Lorg/mozilla/javascript/ObjArray;->data:[Ljava/lang/Object;

    const/4 v2, 0x0

    add-int/lit8 v3, p2, 0x5

    add-int/lit8 v4, v0, -0x5

    invoke-static {v1, v2, p1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 267
    :pswitch_0
    add-int/lit8 v1, p2, 0x4

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f4:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 268
    :pswitch_1
    add-int/lit8 v1, p2, 0x3

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f3:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 269
    :pswitch_2
    add-int/lit8 v1, p2, 0x2

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f2:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 270
    :pswitch_3
    add-int/lit8 v1, p2, 0x1

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f1:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 271
    :pswitch_4
    add-int/lit8 v1, p2, 0x0

    iget-object v2, p0, Lorg/mozilla/javascript/ObjArray;->f0:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 274
    :pswitch_5
    return-void

    .line 263
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 2

    .prologue
    .line 250
    iget v1, p0, Lorg/mozilla/javascript/ObjArray;->size:I

    new-array v0, v1, [Ljava/lang/Object;

    .line 251
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;I)V

    .line 252
    return-object v0
.end method
