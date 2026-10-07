.class final Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;
.super Ljava/lang/Object;
.source "IdScriptableObject.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/IdScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PrototypeValues"
.end annotation


# static fields
.field private static final NAME_SLOT:I = 0x1

.field private static final SLOT_SPAN:I = 0x2

.field static final serialVersionUID:J = 0x2a2b6fc82e6217a3L


# instance fields
.field private attributeArray:[S

.field private constructor:Lorg/mozilla/javascript/IdFunctionObject;

.field private constructorAttrs:S

.field constructorId:I

.field private maxId:I

.field private obj:Lorg/mozilla/javascript/IdScriptableObject;

.field private valueArray:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/IdScriptableObject;I)V
    .locals 1
    .param p1, "obj"    # Lorg/mozilla/javascript/IdScriptableObject;
    .param p2, "maxId"    # I

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 56
    :cond_0
    const/4 v0, 0x1

    if-ge p2, v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 57
    :cond_1
    iput-object p1, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    .line 58
    iput p2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    .line 59
    return-void
.end method

.method private ensureId(I)Ljava/lang/Object;
    .locals 7
    .param p1, "id"    # I

    .prologue
    .line 252
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 253
    .local v0, "array":[Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 254
    monitor-enter p0

    .line 255
    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 256
    if-nez v0, :cond_0

    .line 257
    iget v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    mul-int/lit8 v3, v3, 0x2

    new-array v0, v3, [Ljava/lang/Object;

    .line 258
    iput-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 259
    iget v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    new-array v3, v3, [S

    iput-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    .line 261
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    :cond_1
    add-int/lit8 v3, p1, -0x1

    mul-int/lit8 v2, v3, 0x2

    .line 264
    .local v2, "valueSlot":I
    aget-object v1, v0, v2

    .line 265
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_3

    .line 266
    iget v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    if-ne p1, v3, :cond_2

    .line 267
    iget v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    const-string v4, "constructor"

    iget-object v5, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    iget-short v6, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorAttrs:S

    invoke-direct {p0, v3, v4, v5, v6}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->initSlot(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 269
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    .line 273
    :goto_0
    aget-object v1, v0, v2

    .line 274
    if-nez v1, :cond_3

    .line 275
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".initPrototypeId(int id) "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "did not initialize id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 261
    .end local v1    # "value":Ljava/lang/Object;
    .end local v2    # "valueSlot":I
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 271
    .restart local v1    # "value":Ljava/lang/Object;
    .restart local v2    # "valueSlot":I
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject;->initPrototypeId(I)V

    goto :goto_0

    .line 280
    :cond_3
    return-object v1
.end method

.method private initSlot(ILjava/lang/String;Ljava/lang/Object;I)V
    .locals 6
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .prologue
    .line 93
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 94
    .local v0, "array":[Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 95
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 97
    :cond_0
    if-nez p3, :cond_1

    .line 98
    sget-object p3, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    .line 100
    .end local p3    # "value":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v3, p1, -0x1

    mul-int/lit8 v1, v3, 0x2

    .line 101
    .local v1, "index":I
    monitor-enter p0

    .line 102
    :try_start_0
    aget-object v2, v0, v1

    .line 103
    .local v2, "value2":Ljava/lang/Object;
    if-nez v2, :cond_3

    .line 104
    aput-object p3, v0, v1

    .line 105
    add-int/lit8 v3, v1, 0x1

    aput-object p2, v0, v3

    .line 106
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v4, p1, -0x1

    int-to-short v5, p4

    aput-short v5, v3, v4

    .line 111
    :cond_2
    monitor-exit p0

    .line 112
    return-void

    .line 108
    :cond_3
    add-int/lit8 v3, v1, 0x1

    aget-object v3, v0, v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 109
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 111
    .end local v2    # "value2":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method


# virtual methods
.method final createPrecachedConstructor()Lorg/mozilla/javascript/IdFunctionObject;
    .locals 3

    .prologue
    .line 116
    iget v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 117
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    const-string v1, "constructor"

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdScriptableObject;->findPrototypeId(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    .line 118
    iget v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    if-nez v0, :cond_1

    .line 119
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No id for constructor property"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    iget v1, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdScriptableObject;->initPrototypeId(I)V

    .line 123
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    if-nez v0, :cond_2

    .line 124
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".initPrototypeId() did not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "initialize id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_2
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v1}, Lorg/mozilla/javascript/IdScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/IdFunctionObject;->initFunction(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)V

    .line 130
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdFunctionObject;->markAsConstructor(Lorg/mozilla/javascript/Scriptable;)V

    .line 131
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    return-object v0
.end method

.method final delete(I)V
    .locals 5
    .param p1, "id"    # I

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 190
    iget-object v2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v3, p1, -0x1

    aget-short v0, v2, v3

    .line 191
    .local v0, "attr":I
    and-int/lit8 v2, v0, 0x4

    if-nez v2, :cond_0

    .line 192
    add-int/lit8 v2, p1, -0x1

    mul-int/lit8 v1, v2, 0x2

    .line 193
    .local v1, "valueSlot":I
    monitor-enter p0

    .line 194
    :try_start_0
    iget-object v2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    aput-object v3, v2, v1

    .line 195
    iget-object v2, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x0

    aput-short v4, v2, v3

    .line 196
    monitor-exit p0

    .line 198
    .end local v1    # "valueSlot":I
    :cond_0
    return-void

    .line 196
    .restart local v1    # "valueSlot":I
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method final findId(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findPrototypeId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method final get(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 157
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    move-result-object v0

    .line 158
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v1, :cond_0

    .line 159
    const/4 v0, 0x0

    .line 161
    .end local v0    # "value":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method final getAttributes(I)I
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 203
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v1, p1, -0x1

    aget-short v0, v0, v1

    return v0
.end method

.method final getMaxId()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    return v0
.end method

.method final getNames(Z[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 12
    .param p1, "getAll"    # Z
    .param p2, "extraEntries"    # [Ljava/lang/Object;

    .prologue
    const/4 v11, 0x0

    .line 217
    const/4 v6, 0x0

    .line 218
    .local v6, "names":[Ljava/lang/Object;
    const/4 v0, 0x0

    .line 219
    .local v0, "count":I
    const/4 v3, 0x1

    .local v3, "id":I
    :goto_0
    iget v9, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    if-gt v3, v9, :cond_3

    .line 220
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    move-result-object v8

    .line 221
    .local v8, "value":Ljava/lang/Object;
    if-nez p1, :cond_0

    iget-object v9, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v10, v3, -0x1

    aget-short v9, v9, v10

    and-int/lit8 v9, v9, 0x2

    if-nez v9, :cond_2

    .line 222
    :cond_0
    sget-object v9, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v8, v9, :cond_2

    .line 223
    add-int/lit8 v9, v3, -0x1

    mul-int/lit8 v9, v9, 0x2

    add-int/lit8 v5, v9, 0x1

    .line 224
    .local v5, "nameSlot":I
    iget-object v9, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aget-object v4, v9, v5

    check-cast v4, Ljava/lang/String;

    .line 225
    .local v4, "name":Ljava/lang/String;
    if-nez v6, :cond_1

    .line 226
    iget v9, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    new-array v6, v9, [Ljava/lang/Object;

    .line 228
    :cond_1
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "count":I
    .local v1, "count":I
    aput-object v4, v6, v0

    move v0, v1

    .line 219
    .end local v1    # "count":I
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "nameSlot":I
    .restart local v0    # "count":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 232
    .end local v8    # "value":Ljava/lang/Object;
    :cond_3
    if-nez v0, :cond_4

    .line 246
    .end local p2    # "extraEntries":[Ljava/lang/Object;
    :goto_1
    return-object p2

    .line 234
    .restart local p2    # "extraEntries":[Ljava/lang/Object;
    :cond_4
    if-eqz p2, :cond_5

    array-length v9, p2

    if-nez v9, :cond_7

    .line 235
    :cond_5
    array-length v9, v6

    if-eq v0, v9, :cond_6

    .line 236
    new-array v7, v0, [Ljava/lang/Object;

    .line 237
    .local v7, "tmp":[Ljava/lang/Object;
    invoke-static {v6, v11, v7, v11, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 238
    move-object v6, v7

    .end local v7    # "tmp":[Ljava/lang/Object;
    :cond_6
    move-object p2, v6

    .line 240
    goto :goto_1

    .line 242
    :cond_7
    array-length v2, p2

    .line 243
    .local v2, "extra":I
    add-int v9, v2, v0

    new-array v7, v9, [Ljava/lang/Object;

    .line 244
    .restart local v7    # "tmp":[Ljava/lang/Object;
    invoke-static {p2, v11, v7, v11, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 245
    invoke-static {v6, v11, v7, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p2, v7

    .line 246
    goto :goto_1
.end method

.method final has(I)Z
    .locals 5
    .param p1, "id"    # I

    .prologue
    const/4 v3, 0x1

    .line 141
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 142
    .local v0, "array":[Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 152
    :cond_0
    :goto_0
    return v3

    .line 146
    :cond_1
    add-int/lit8 v4, p1, -0x1

    mul-int/lit8 v2, v4, 0x2

    .line 147
    .local v2, "valueSlot":I
    aget-object v1, v0, v2

    .line 148
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 152
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v4, :cond_0

    const/4 v3, 0x0

    goto :goto_0
.end method

.method final initValue(ILjava/lang/String;Ljava/lang/Object;I)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .prologue
    .line 68
    const/4 v0, 0x1

    if-gt v0, p1, :cond_0

    iget v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->maxId:I

    if-le p1, v0, :cond_1

    .line 69
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 70
    :cond_1
    if-nez p2, :cond_2

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 72
    :cond_2
    sget-object v0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p3, v0, :cond_3

    .line 73
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 74
    :cond_3
    invoke-static {p4}, Lorg/mozilla/javascript/ScriptableObject;->checkValidAttributes(I)V

    .line 75
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/IdScriptableObject;->findPrototypeId(Ljava/lang/String;)I

    move-result v0

    if-eq v0, p1, :cond_4

    .line 76
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_4
    iget v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    if-ne p1, v0, :cond_6

    .line 79
    instance-of v0, p3, Lorg/mozilla/javascript/IdFunctionObject;

    if-nez v0, :cond_5

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "consructor should be initialized with IdFunctionObject"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_5
    check-cast p3, Lorg/mozilla/javascript/IdFunctionObject;

    .end local p3    # "value":Ljava/lang/Object;
    iput-object p3, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructor:Lorg/mozilla/javascript/IdFunctionObject;

    .line 83
    int-to-short v0, p4

    iput-short v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorAttrs:S

    .line 88
    :goto_0
    return-void

    .line 87
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_6
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->initSlot(ILjava/lang/String;Ljava/lang/Object;I)V

    goto :goto_0
.end method

.method final set(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 6
    .param p1, "id"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 166
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p3, v4, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 167
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 168
    iget-object v4, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v5, p1, -0x1

    aget-short v0, v4, v5

    .line 169
    .local v0, "attr":I
    and-int/lit8 v4, v0, 0x1

    if-nez v4, :cond_2

    .line 170
    iget-object v4, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->obj:Lorg/mozilla/javascript/IdScriptableObject;

    if-ne p2, v4, :cond_3

    .line 171
    if-nez p3, :cond_1

    .line 172
    sget-object p3, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    .line 174
    .end local p3    # "value":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v4, p1, -0x1

    mul-int/lit8 v3, v4, 0x2

    .line 175
    .local v3, "valueSlot":I
    monitor-enter p0

    .line 176
    :try_start_0
    iget-object v4, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aput-object p3, v4, v3

    .line 177
    monitor-exit p0

    .line 185
    .end local v3    # "valueSlot":I
    :cond_2
    :goto_0
    return-void

    .line 177
    .restart local v3    # "valueSlot":I
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 180
    .end local v3    # "valueSlot":I
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_3
    add-int/lit8 v4, p1, -0x1

    mul-int/lit8 v4, v4, 0x2

    add-int/lit8 v2, v4, 0x1

    .line 181
    .local v2, "nameSlot":I
    iget-object v4, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aget-object v1, v4, v2

    check-cast v1, Ljava/lang/String;

    .line 182
    .local v1, "name":Ljava/lang/String;
    invoke-interface {p2, v1, p2, p3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method final setAttributes(II)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "attributes"    # I

    .prologue
    .line 208
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptableObject;->checkValidAttributes(I)V

    .line 209
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 210
    monitor-enter p0

    .line 211
    :try_start_0
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v1, p1, -0x1

    int-to-short v2, p2

    aput-short v2, v0, v1

    .line 212
    monitor-exit p0

    .line 213
    return-void

    .line 212
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
