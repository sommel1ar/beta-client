.class public Lorg/mozilla/javascript/Kit;
.super Ljava/lang/Object;
.source "Kit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/Kit$ComplexKey;
    }
.end annotation


# static fields
.field private static Throwable_initCause:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 25
    const/4 v2, 0x0

    sput-object v2, Lorg/mozilla/javascript/Kit;->Throwable_initCause:Ljava/lang/reflect/Method;

    .line 30
    :try_start_0
    const-string v2, "java.lang.Throwable"

    invoke-static {v2}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 31
    .local v0, "ThrowableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    new-array v1, v2, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 32
    .local v1, "signature":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v2, "initCause"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/mozilla/javascript/Kit;->Throwable_initCause:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v1    # "signature":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_0
    return-void

    .line 34
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    return-void
.end method

.method public static addListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "bag"    # Ljava/lang/Object;
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    .line 197
    if-nez p1, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 198
    :cond_0
    instance-of v4, p1, [Ljava/lang/Object;

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 200
    :cond_1
    if-nez p0, :cond_2

    .line 201
    move-object p0, p1

    .line 215
    .end local p0    # "bag":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 202
    .restart local p0    # "bag":Ljava/lang/Object;
    :cond_2
    instance-of v4, p0, [Ljava/lang/Object;

    if-nez v4, :cond_3

    .line 203
    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v5

    const/4 v4, 0x1

    aput-object p1, v2, v4

    .local v2, "bag":[Ljava/lang/Object;
    move-object p0, v2

    goto :goto_0

    .line 205
    .end local v2    # "bag":[Ljava/lang/Object;
    :cond_3
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "bag":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [Ljava/lang/Object;

    .line 206
    .local v1, "array":[Ljava/lang/Object;
    array-length v0, v1

    .line 208
    .local v0, "L":I
    if-ge v0, v6, :cond_4

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 209
    :cond_4
    add-int/lit8 v4, v0, 0x1

    new-array v3, v4, [Ljava/lang/Object;

    .line 210
    .local v3, "tmp":[Ljava/lang/Object;
    invoke-static {v1, v5, v3, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    aput-object p1, v3, v0

    .line 212
    move-object p0, v3

    .local p0, "bag":[Ljava/lang/Object;
    goto :goto_0
.end method

.method public static classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "loader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 60
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v0

    .line 68
    :goto_0
    return-object v0

    .line 61
    :catch_0
    move-exception v0

    .line 68
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 62
    :catch_1
    move-exception v0

    goto :goto_1

    .line 63
    :catch_2
    move-exception v0

    goto :goto_1

    .line 64
    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method public static classOrNull(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 42
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v0

    .line 50
    :goto_0
    return-object v0

    .line 43
    :catch_0
    move-exception v0

    .line 50
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 44
    :catch_1
    move-exception v0

    goto :goto_1

    .line 45
    :catch_2
    move-exception v0

    goto :goto_1

    .line 46
    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method public static codeBug()Ljava/lang/RuntimeException;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 417
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "FAILED ASSERTION"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 419
    .local v0, "ex":Ljava/lang/RuntimeException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 420
    throw v0
.end method

.method public static codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 432
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FAILED ASSERTION: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 433
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 435
    .local v0, "ex":Ljava/lang/RuntimeException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 436
    throw v0
.end method

.method public static getListener(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 5
    .param p0, "bag"    # Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 284
    if-nez p1, :cond_3

    .line 285
    if-nez p0, :cond_1

    move-object p0, v2

    .line 308
    .end local p0    # "bag":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object p0

    .line 287
    .restart local p0    # "bag":Ljava/lang/Object;
    :cond_1
    instance-of v2, p0, [Ljava/lang/Object;

    if-eqz v2, :cond_0

    .line 289
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "bag":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [Ljava/lang/Object;

    .line 291
    .local v1, "array":[Ljava/lang/Object;
    array-length v2, v1

    if-ge v2, v3, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 292
    :cond_2
    const/4 v2, 0x0

    aget-object p0, v1, v2

    goto :goto_0

    .line 293
    .end local v1    # "array":[Ljava/lang/Object;
    .restart local p0    # "bag":Ljava/lang/Object;
    :cond_3
    if-ne p1, v4, :cond_6

    .line 294
    instance-of v3, p0, [Ljava/lang/Object;

    if-nez v3, :cond_5

    .line 295
    if-nez p0, :cond_4

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    :cond_4
    move-object p0, v2

    .line 296
    goto :goto_0

    .line 298
    :cond_5
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "bag":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [Ljava/lang/Object;

    .line 300
    .restart local v1    # "array":[Ljava/lang/Object;
    aget-object p0, v1, v4

    goto :goto_0

    .line 303
    .end local v1    # "array":[Ljava/lang/Object;
    .restart local p0    # "bag":Ljava/lang/Object;
    :cond_6
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "bag":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [Ljava/lang/Object;

    .line 304
    .restart local v1    # "array":[Ljava/lang/Object;
    array-length v0, v1

    .line 305
    .local v0, "L":I
    if-ge v0, v3, :cond_7

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 306
    :cond_7
    if-ne p1, v0, :cond_8

    move-object p0, v2

    .line 307
    goto :goto_0

    .line 308
    :cond_8
    aget-object p0, v1, p1

    goto :goto_0
.end method

.method public static initCause(Ljava/lang/RuntimeException;Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "ex"    # Ljava/lang/RuntimeException;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    sget-object v1, Lorg/mozilla/javascript/Kit;->Throwable_initCause:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_0

    .line 109
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 111
    .local v0, "args":[Ljava/lang/Object;
    :try_start_0
    sget-object v1, Lorg/mozilla/javascript/Kit;->Throwable_initCause:Ljava/lang/reflect/Method;

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .end local v0    # "args":[Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object p0

    .line 112
    .restart local v0    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static initHash(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "initialValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 314
    .local p0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    monitor-enter p0

    .line 315
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 316
    .local v0, "current":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 317
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    :goto_0
    monitor-exit p0

    .line 322
    return-object p2

    .line 319
    :cond_0
    move-object p2, v0

    goto :goto_0

    .line 321
    .end local v0    # "current":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static makeHashKeyFromPair(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "key1"    # Ljava/lang/Object;
    .param p1, "key2"    # Ljava/lang/Object;

    .prologue
    .line 358
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 359
    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 360
    :cond_1
    new-instance v0, Lorg/mozilla/javascript/Kit$ComplexKey;

    invoke-direct {v0, p0, p1}, Lorg/mozilla/javascript/Kit$ComplexKey;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method static newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;
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
    .line 74
    .local p0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 75
    :catch_0
    move-exception v0

    .line 80
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 76
    :catch_1
    move-exception v0

    goto :goto_1

    .line 77
    :catch_2
    move-exception v0

    goto :goto_1

    .line 78
    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method public static readReader(Ljava/io/Reader;)Ljava/lang/String;
    .locals 6
    .param p0, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 366
    const/16 v4, 0x200

    new-array v0, v4, [C

    .line 367
    .local v0, "buffer":[C
    const/4 v1, 0x0

    .line 369
    .local v1, "cursor":I
    :cond_0
    :goto_0
    array-length v4, v0

    sub-int/2addr v4, v1

    invoke-virtual {p0, v0, v1, v4}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 370
    .local v2, "n":I
    if-gez v2, :cond_1

    .line 378
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0, v5, v1}, Ljava/lang/String;-><init>([CII)V

    return-object v4

    .line 371
    :cond_1
    add-int/2addr v1, v2

    .line 372
    array-length v4, v0

    if-ne v1, v4, :cond_0

    .line 373
    array-length v4, v0

    mul-int/lit8 v4, v4, 0x2

    new-array v3, v4, [C

    .line 374
    .local v3, "tmp":[C
    invoke-static {v0, v5, v3, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 375
    move-object v0, v3

    goto :goto_0
.end method

.method public static readStream(Ljava/io/InputStream;I)[B
    .locals 7
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "initialBufferCapacity"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 384
    if-gtz p1, :cond_0

    .line 385
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad initialBufferCapacity: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 388
    :cond_0
    new-array v0, p1, [B

    .line 389
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 391
    .local v1, "cursor":I
    :cond_1
    :goto_0
    array-length v4, v0

    sub-int/2addr v4, v1

    invoke-virtual {p0, v0, v1, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 392
    .local v2, "n":I
    if-gez v2, :cond_3

    .line 400
    array-length v4, v0

    if-eq v1, v4, :cond_2

    .line 401
    new-array v3, v1, [B

    .line 402
    .local v3, "tmp":[B
    invoke-static {v0, v5, v3, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 403
    move-object v0, v3

    .line 405
    .end local v3    # "tmp":[B
    :cond_2
    return-object v0

    .line 393
    :cond_3
    add-int/2addr v1, v2

    .line 394
    array-length v4, v0

    if-ne v1, v4, :cond_1

    .line 395
    array-length v4, v0

    mul-int/lit8 v4, v4, 0x2

    new-array v3, v4, [B

    .line 396
    .restart local v3    # "tmp":[B
    invoke-static {v0, v5, v3, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 397
    move-object v0, v3

    goto :goto_0
.end method

.method public static removeListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p0, "bag"    # Ljava/lang/Object;
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 236
    if-nez p1, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 237
    :cond_0
    instance-of v4, p1, [Ljava/lang/Object;

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 239
    :cond_1
    if-ne p0, p1, :cond_3

    .line 240
    const/4 p0, 0x0

    .line 267
    .end local p0    # "bag":Ljava/lang/Object;
    :cond_2
    :goto_0
    return-object p0

    .line 241
    .restart local p0    # "bag":Ljava/lang/Object;
    :cond_3
    instance-of v4, p0, [Ljava/lang/Object;

    if-eqz v4, :cond_2

    move-object v4, p0

    .line 242
    check-cast v4, [Ljava/lang/Object;

    move-object v1, v4

    check-cast v1, [Ljava/lang/Object;

    .line 243
    .local v1, "array":[Ljava/lang/Object;
    array-length v0, v1

    .line 245
    .local v0, "L":I
    if-ge v0, v7, :cond_4

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 246
    :cond_4
    if-ne v0, v7, :cond_6

    .line 247
    aget-object v4, v1, v6

    if-ne v4, p1, :cond_5

    .line 248
    aget-object p0, v1, v5

    goto :goto_0

    .line 249
    :cond_5
    aget-object v4, v1, v5

    if-ne v4, p1, :cond_2

    .line 250
    aget-object p0, v1, v6

    goto :goto_0

    .line 253
    :cond_6
    move v2, v0

    .line 255
    .local v2, "i":I
    :cond_7
    add-int/lit8 v2, v2, -0x1

    .line 256
    aget-object v4, v1, v2

    if-ne v4, p1, :cond_8

    .line 257
    add-int/lit8 v4, v0, -0x1

    new-array v3, v4, [Ljava/lang/Object;

    .line 258
    .local v3, "tmp":[Ljava/lang/Object;
    invoke-static {v1, v5, v3, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 259
    add-int/lit8 v4, v2, 0x1

    add-int/lit8 v5, v2, 0x1

    sub-int v5, v0, v5

    invoke-static {v1, v4, v3, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 260
    move-object p0, v3

    .line 261
    .local p0, "bag":[Ljava/lang/Object;
    goto :goto_0

    .line 263
    .end local v3    # "tmp":[Ljava/lang/Object;
    .local p0, "bag":Ljava/lang/Object;
    :cond_8
    if-nez v2, :cond_7

    goto :goto_0
.end method

.method static testIfCanLoadRhinoClasses(Ljava/lang/ClassLoader;)Z
    .locals 3
    .param p0, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 88
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    .line 89
    .local v0, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 90
    .local v1, "x":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq v1, v0, :cond_0

    .line 95
    const/4 v2, 0x0

    .line 97
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static xDigitToInt(II)I
    .locals 1
    .param p0, "c"    # I
    .param p1, "accumulator"    # I

    .prologue
    .line 128
    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    .line 129
    add-int/lit8 p0, p0, -0x30

    .line 130
    if-ltz p0, :cond_2

    .line 144
    :goto_0
    shl-int/lit8 v0, p1, 0x4

    or-int/2addr v0, p0

    :goto_1
    return v0

    .line 131
    :cond_0
    const/16 v0, 0x46

    if-gt p0, v0, :cond_1

    .line 132
    const/16 v0, 0x41

    if-gt v0, p0, :cond_2

    .line 133
    add-int/lit8 p0, p0, -0x37

    .line 134
    goto :goto_0

    .line 136
    :cond_1
    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    .line 137
    const/16 v0, 0x61

    if-gt v0, p0, :cond_2

    .line 138
    add-int/lit8 p0, p0, -0x57

    .line 139
    goto :goto_0

    .line 142
    :cond_2
    const/4 v0, -0x1

    goto :goto_1
.end method
