.class public Lorg/mozilla/javascript/NativeJavaMethod;
.super Lorg/mozilla/javascript/BaseFunction;
.source "NativeJavaMethod.java"


# static fields
.field private static final PREFERENCE_AMBIGUOUS:I = 0x3

.field private static final PREFERENCE_EQUAL:I = 0x0

.field private static final PREFERENCE_FIRST_ARG:I = 0x1

.field private static final PREFERENCE_SECOND_ARG:I = 0x2

.field private static final debug:Z = false

.field static final serialVersionUID:J = -0x2fbeb1018d019700L


# instance fields
.field private functionName:Ljava/lang/String;

.field methods:[Lorg/mozilla/javascript/MemberBox;

.field private transient overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lorg/mozilla/javascript/ResolvedOverload;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    new-instance v0, Lorg/mozilla/javascript/MemberBox;

    invoke-direct {v0, p1}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    invoke-direct {p0, v0, p2}, Lorg/mozilla/javascript/NativeJavaMethod;-><init>(Lorg/mozilla/javascript/MemberBox;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method constructor <init>(Lorg/mozilla/javascript/MemberBox;Ljava/lang/String;)V
    .locals 2
    .param p1, "method"    # Lorg/mozilla/javascript/MemberBox;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 41
    iput-object p2, p0, Lorg/mozilla/javascript/NativeJavaMethod;->functionName:Ljava/lang/String;

    .line 42
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/mozilla/javascript/MemberBox;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    .line 43
    return-void
.end method

.method constructor <init>([Lorg/mozilla/javascript/MemberBox;)V
    .locals 1
    .param p1, "methods"    # [Lorg/mozilla/javascript/MemberBox;

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 29
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/MemberBox;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/NativeJavaMethod;->functionName:Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    .line 31
    return-void
.end method

.method constructor <init>([Lorg/mozilla/javascript/MemberBox;Ljava/lang/String;)V
    .locals 0
    .param p1, "methods"    # [Lorg/mozilla/javascript/MemberBox;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 35
    iput-object p2, p0, Lorg/mozilla/javascript/NativeJavaMethod;->functionName:Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    .line 37
    return-void
.end method

.method static findFunction(Lorg/mozilla/javascript/Context;[Lorg/mozilla/javascript/MemberBox;[Ljava/lang/Object;)I
    .locals 25
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "methodsOrCtors"    # [Lorg/mozilla/javascript/MemberBox;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 286
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    if-nez v22, :cond_1

    .line 287
    const/4 v13, -0x1

    .line 443
    :cond_0
    :goto_0
    return v13

    .line 288
    :cond_1
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_6

    .line 289
    const/16 v22, 0x0

    aget-object v17, p1, v22

    .line 290
    .local v17, "member":Lorg/mozilla/javascript/MemberBox;
    move-object/from16 v0, v17

    iget-object v6, v0, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 291
    .local v6, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v5, v6

    .line 293
    .local v5, "alength":I
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/mozilla/javascript/MemberBox;->vararg:Z

    move/from16 v22, v0

    if-eqz v22, :cond_2

    .line 294
    add-int/lit8 v5, v5, -0x1

    .line 295
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-le v5, v0, :cond_3

    .line 296
    const/4 v13, -0x1

    goto :goto_0

    .line 299
    :cond_2
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-eq v5, v0, :cond_3

    .line 300
    const/4 v13, -0x1

    goto :goto_0

    .line 303
    :cond_3
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_1
    move/from16 v0, v16

    if-eq v0, v5, :cond_5

    .line 304
    aget-object v22, p2, v16

    aget-object v23, v6, v16

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/NativeJavaObject;->canConvert(Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v22

    if-nez v22, :cond_4

    .line 307
    const/4 v13, -0x1

    goto :goto_0

    .line 303
    :cond_4
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 311
    :cond_5
    const/4 v13, 0x0

    goto :goto_0

    .line 314
    .end local v5    # "alength":I
    .end local v6    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v16    # "j":I
    .end local v17    # "member":Lorg/mozilla/javascript/MemberBox;
    :cond_6
    const/4 v13, -0x1

    .line 315
    .local v13, "firstBestFit":I
    const/4 v11, 0x0

    .line 316
    .local v11, "extraBestFits":[I
    const/4 v12, 0x0

    .line 319
    .local v12, "extraBestFitsCount":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_2
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v15, v0, :cond_17

    .line 320
    aget-object v17, p1, v15

    .line 321
    .restart local v17    # "member":Lorg/mozilla/javascript/MemberBox;
    move-object/from16 v0, v17

    iget-object v6, v0, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 322
    .restart local v6    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v5, v6

    .line 323
    .restart local v5    # "alength":I
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/mozilla/javascript/MemberBox;->vararg:Z

    move/from16 v22, v0

    if-eqz v22, :cond_8

    .line 324
    add-int/lit8 v5, v5, -0x1

    .line 325
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-le v5, v0, :cond_9

    .line 319
    :cond_7
    :goto_3
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 329
    :cond_8
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ne v5, v0, :cond_7

    .line 333
    :cond_9
    const/16 v16, 0x0

    .restart local v16    # "j":I
    :goto_4
    move/from16 v0, v16

    if-ge v0, v5, :cond_a

    .line 334
    aget-object v22, p2, v16

    aget-object v23, v6, v16

    invoke-static/range {v22 .. v23}, Lorg/mozilla/javascript/NativeJavaObject;->canConvert(Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v22

    if-eqz v22, :cond_7

    .line 333
    add-int/lit8 v16, v16, 0x1

    goto :goto_4

    .line 340
    :cond_a
    if-gez v13, :cond_b

    .line 342
    move v13, v15

    goto :goto_3

    .line 348
    :cond_b
    const/4 v9, 0x0

    .line 350
    .local v9, "betterCount":I
    const/16 v21, 0x0

    .line 352
    .local v21, "worseCount":I
    const/16 v16, -0x1

    :goto_5
    move/from16 v0, v16

    if-eq v0, v12, :cond_f

    .line 354
    const/16 v22, -0x1

    move/from16 v0, v16

    move/from16 v1, v22

    if-ne v0, v1, :cond_c

    .line 355
    move v8, v13

    .line 359
    .local v8, "bestFitIndex":I
    :goto_6
    aget-object v7, p1, v8

    .line 360
    .local v7, "bestFit":Lorg/mozilla/javascript/MemberBox;
    const/16 v22, 0xd

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v22

    if-eqz v22, :cond_e

    invoke-virtual {v7}, Lorg/mozilla/javascript/MemberBox;->member()Ljava/lang/reflect/Member;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v22

    and-int/lit8 v22, v22, 0x1

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/MemberBox;->member()Ljava/lang/reflect/Member;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v23

    and-int/lit8 v23, v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_e

    .line 367
    invoke-virtual {v7}, Lorg/mozilla/javascript/MemberBox;->member()Ljava/lang/reflect/Member;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v22

    and-int/lit8 v22, v22, 0x1

    if-nez v22, :cond_d

    .line 368
    add-int/lit8 v9, v9, 0x1

    .line 352
    :goto_7
    add-int/lit8 v16, v16, 0x1

    goto :goto_5

    .line 357
    .end local v7    # "bestFit":Lorg/mozilla/javascript/MemberBox;
    .end local v8    # "bestFitIndex":I
    :cond_c
    aget v8, v11, v16

    .restart local v8    # "bestFitIndex":I
    goto :goto_6

    .line 370
    .restart local v7    # "bestFit":Lorg/mozilla/javascript/MemberBox;
    :cond_d
    add-int/lit8 v21, v21, 0x1

    goto :goto_7

    .line 372
    :cond_e
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lorg/mozilla/javascript/MemberBox;->vararg:Z

    move/from16 v22, v0

    iget-object v0, v7, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    move-object/from16 v23, v0

    iget-boolean v0, v7, Lorg/mozilla/javascript/MemberBox;->vararg:Z

    move/from16 v24, v0

    move-object/from16 v0, p2

    move/from16 v1, v22

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v6, v1, v2, v3}, Lorg/mozilla/javascript/NativeJavaMethod;->preferSignature([Ljava/lang/Object;[Ljava/lang/Class;Z[Ljava/lang/Class;Z)I

    move-result v20

    .line 376
    .local v20, "preference":I
    const/16 v22, 0x3

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_10

    .line 414
    .end local v7    # "bestFit":Lorg/mozilla/javascript/MemberBox;
    .end local v8    # "bestFitIndex":I
    .end local v20    # "preference":I
    :cond_f
    add-int/lit8 v22, v12, 0x1

    move/from16 v0, v22

    if-ne v9, v0, :cond_15

    .line 418
    move v13, v15

    .line 419
    const/4 v12, 0x0

    goto/16 :goto_3

    .line 378
    .restart local v7    # "bestFit":Lorg/mozilla/javascript/MemberBox;
    .restart local v8    # "bestFitIndex":I
    .restart local v20    # "preference":I
    :cond_10
    const/16 v22, 0x1

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_11

    .line 379
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 380
    :cond_11
    const/16 v22, 0x2

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_12

    .line 381
    add-int/lit8 v21, v21, 0x1

    goto :goto_7

    .line 383
    :cond_12
    if-eqz v20, :cond_13

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 389
    :cond_13
    invoke-virtual {v7}, Lorg/mozilla/javascript/MemberBox;->isStatic()Z

    move-result v22

    if-eqz v22, :cond_7

    invoke-virtual {v7}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v22

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v22

    if-eqz v22, :cond_7

    .line 400
    const/16 v22, -0x1

    move/from16 v0, v16

    move/from16 v1, v22

    if-ne v0, v1, :cond_14

    .line 401
    move v13, v15

    goto/16 :goto_3

    .line 403
    :cond_14
    aput v15, v11, v16

    goto/16 :goto_3

    .line 420
    .end local v7    # "bestFit":Lorg/mozilla/javascript/MemberBox;
    .end local v8    # "bestFitIndex":I
    .end local v20    # "preference":I
    :cond_15
    add-int/lit8 v22, v12, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_7

    .line 428
    if-nez v11, :cond_16

    .line 430
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    new-array v11, v0, [I

    .line 432
    :cond_16
    aput v15, v11, v12

    .line 433
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_3

    .line 438
    .end local v5    # "alength":I
    .end local v6    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v9    # "betterCount":I
    .end local v16    # "j":I
    .end local v17    # "member":Lorg/mozilla/javascript/MemberBox;
    .end local v21    # "worseCount":I
    :cond_17
    if-gez v13, :cond_18

    .line 440
    const/4 v13, -0x1

    goto/16 :goto_0

    .line 441
    :cond_18
    if-eqz v12, :cond_0

    .line 447
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 448
    .local v10, "buf":Ljava/lang/StringBuilder;
    const/16 v16, -0x1

    .restart local v16    # "j":I
    :goto_8
    move/from16 v0, v16

    if-eq v0, v12, :cond_1a

    .line 450
    const/16 v22, -0x1

    move/from16 v0, v16

    move/from16 v1, v22

    if-ne v0, v1, :cond_19

    .line 451
    move v8, v13

    .line 455
    .restart local v8    # "bestFitIndex":I
    :goto_9
    const-string v22, "\n    "

    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    aget-object v22, p1, v8

    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/javascript/MemberBox;->toJavaDeclaration()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    add-int/lit8 v16, v16, 0x1

    goto :goto_8

    .line 453
    .end local v8    # "bestFitIndex":I
    :cond_19
    aget v8, v11, v16

    .restart local v8    # "bestFitIndex":I
    goto :goto_9

    .line 459
    .end local v8    # "bestFitIndex":I
    :cond_1a
    aget-object v14, p1, v13

    .line 460
    .local v14, "firstFitMember":Lorg/mozilla/javascript/MemberBox;
    invoke-virtual {v14}, Lorg/mozilla/javascript/MemberBox;->getName()Ljava/lang/String;

    move-result-object v19

    .line 461
    .local v19, "memberName":Ljava/lang/String;
    invoke-virtual {v14}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    .line 463
    .local v18, "memberClass":Ljava/lang/String;
    const/16 v22, 0x0

    aget-object v22, p1, v22

    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/javascript/MemberBox;->isCtor()Z

    move-result v22

    if-eqz v22, :cond_1b

    .line 464
    const-string v22, "msg.constructor.ambiguous"

    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Context;->reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v22

    throw v22

    .line 468
    :cond_1b
    const-string v22, "msg.method.ambiguous"

    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v23

    move-object/from16 v4, v24

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError4(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v22

    throw v22
.end method

.method private static preferSignature([Ljava/lang/Object;[Ljava/lang/Class;Z[Ljava/lang/Class;Z)I
    .locals 9
    .param p0, "args"    # [Ljava/lang/Object;
    .param p2, "vararg1"    # Z
    .param p4, "vararg2"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Class",
            "<*>;Z[",
            "Ljava/lang/Class",
            "<*>;Z)I"
        }
    .end annotation

    .prologue
    .line 492
    .local p1, "sig1":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p3, "sig2":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 493
    .local v5, "totalPreference":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    array-length v8, p0

    if-ge v1, v8, :cond_4

    .line 494
    if-eqz p2, :cond_1

    array-length v8, p1

    if-lt v1, v8, :cond_1

    array-length v8, p1

    add-int/lit8 v8, v8, -0x1

    aget-object v6, p1, v8

    .line 495
    .local v6, "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz p4, :cond_2

    array-length v8, p3

    if-lt v1, v8, :cond_2

    array-length v8, p3

    add-int/lit8 v8, v8, -0x1

    aget-object v7, p3, v8

    .line 496
    .local v7, "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    if-ne v6, v7, :cond_3

    .line 493
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 494
    .end local v6    # "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    aget-object v6, p1, v1

    goto :goto_1

    .line 495
    .restart local v6    # "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    aget-object v7, p3, v1

    goto :goto_2

    .line 499
    .restart local v7    # "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    aget-object v0, p0, v1

    .line 503
    .local v0, "arg":Ljava/lang/Object;
    invoke-static {v0, v6}, Lorg/mozilla/javascript/NativeJavaObject;->getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I

    move-result v3

    .line 504
    .local v3, "rank1":I
    invoke-static {v0, v7}, Lorg/mozilla/javascript/NativeJavaObject;->getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I

    move-result v4

    .line 507
    .local v4, "rank2":I
    if-ge v3, v4, :cond_5

    .line 508
    const/4 v2, 0x1

    .line 526
    .local v2, "preference":I
    :goto_3
    or-int/2addr v5, v2

    .line 528
    const/4 v8, 0x3

    if-ne v5, v8, :cond_0

    .line 532
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v2    # "preference":I
    .end local v3    # "rank1":I
    .end local v4    # "rank2":I
    .end local v6    # "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    return v5

    .line 509
    .restart local v0    # "arg":Ljava/lang/Object;
    .restart local v3    # "rank1":I
    .restart local v4    # "rank2":I
    .restart local v6    # "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5
    if-le v3, v4, :cond_6

    .line 510
    const/4 v2, 0x2

    .restart local v2    # "preference":I
    goto :goto_3

    .line 513
    .end local v2    # "preference":I
    :cond_6
    if-nez v3, :cond_9

    .line 514
    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 515
    const/4 v2, 0x2

    .restart local v2    # "preference":I
    goto :goto_3

    .line 516
    .end local v2    # "preference":I
    :cond_7
    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 517
    const/4 v2, 0x1

    .restart local v2    # "preference":I
    goto :goto_3

    .line 519
    .end local v2    # "preference":I
    :cond_8
    const/4 v2, 0x3

    .restart local v2    # "preference":I
    goto :goto_3

    .line 522
    .end local v2    # "preference":I
    :cond_9
    const/4 v2, 0x3

    .restart local v2    # "preference":I
    goto :goto_3
.end method

.method private static printDebug(Ljava/lang/String;Lorg/mozilla/javascript/MemberBox;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "member"    # Lorg/mozilla/javascript/MemberBox;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 556
    return-void
.end method

.method static scriptSignature([Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .param p0, "values"    # [Ljava/lang/Object;

    .prologue
    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v2, "sig":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p0

    if-eq v0, v5, :cond_9

    .line 60
    aget-object v3, p0, v0

    .line 63
    .local v3, "value":Ljava/lang/Object;
    if-nez v3, :cond_1

    .line 64
    const-string v1, "null"

    .line 86
    .end local v3    # "value":Ljava/lang/Object;
    .local v1, "s":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_0

    .line 87
    const/16 v5, 0x2c

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    :cond_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    .end local v1    # "s":Ljava/lang/String;
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v5, v3, Ljava/lang/Boolean;

    if-eqz v5, :cond_2

    .line 66
    const-string v1, "boolean"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 67
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    instance-of v5, v3, Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 68
    const-string v1, "string"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 69
    .end local v1    # "s":Ljava/lang/String;
    :cond_3
    instance-of v5, v3, Ljava/lang/Number;

    if-eqz v5, :cond_4

    .line 70
    const-string v1, "number"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 71
    .end local v1    # "s":Ljava/lang/String;
    :cond_4
    instance-of v5, v3, Lorg/mozilla/javascript/Scriptable;

    if-eqz v5, :cond_8

    .line 72
    instance-of v5, v3, Lorg/mozilla/javascript/Undefined;

    if-eqz v5, :cond_5

    .line 73
    const-string v1, "undefined"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 74
    .end local v1    # "s":Ljava/lang/String;
    :cond_5
    instance-of v5, v3, Lorg/mozilla/javascript/Wrapper;

    if-eqz v5, :cond_6

    .line 75
    check-cast v3, Lorg/mozilla/javascript/Wrapper;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-interface {v3}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v4

    .line 76
    .local v4, "wrapped":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 77
    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .end local v1    # "s":Ljava/lang/String;
    .end local v4    # "wrapped":Ljava/lang/Object;
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_6
    instance-of v5, v3, Lorg/mozilla/javascript/Function;

    if-eqz v5, :cond_7

    .line 78
    const-string v1, "function"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 80
    .end local v1    # "s":Ljava/lang/String;
    :cond_7
    const-string v1, "object"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 83
    .end local v1    # "s":Ljava/lang/String;
    :cond_8
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lorg/mozilla/javascript/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_1

    .line 91
    .end local v1    # "s":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    :cond_9
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 27
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    if-nez v23, :cond_0

    .line 136
    new-instance v23, Ljava/lang/RuntimeException;

    const-string v24, "No methods defined for call"

    invoke-direct/range {v23 .. v24}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 139
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/NativeJavaMethod;->findCachedFunction(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;)I

    move-result v11

    .line 140
    .local v11, "index":I
    if-gez v11, :cond_1

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aget-object v23, v23, v24

    invoke-virtual/range {v23 .. v23}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    .line 142
    .local v7, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x2e

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeJavaMethod;->getFunctionName()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x28

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x29

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 144
    .local v18, "sig":Ljava/lang/String;
    const-string v23, "msg.java.no_such_method"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v23

    throw v23

    .line 147
    .end local v7    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v18    # "sig":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v23, v0

    aget-object v13, v23, v11

    .line 148
    .local v13, "meth":Lorg/mozilla/javascript/MemberBox;
    iget-object v6, v13, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 150
    .local v6, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget-boolean v0, v13, Lorg/mozilla/javascript/MemberBox;->vararg:Z

    move/from16 v23, v0

    if-eqz v23, :cond_9

    .line 152
    array-length v0, v6

    move/from16 v23, v0

    move/from16 v0, v23

    new-array v14, v0, [Ljava/lang/Object;

    .line 153
    .local v14, "newArgs":[Ljava/lang/Object;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    array-length v0, v6

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    if-ge v10, v0, :cond_2

    .line 154
    aget-object v23, p4, v10

    aget-object v24, v6, v10

    invoke-static/range {v23 .. v24}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v23

    aput-object v23, v14, v10

    .line 153
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 161
    :cond_2
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    array-length v0, v6

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_8

    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-object v23, p4, v23

    if-eqz v23, :cond_3

    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-object v23, p4, v23

    move-object/from16 v0, v23

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v23, v0

    if-nez v23, :cond_3

    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-object v23, p4, v23

    move-object/from16 v0, v23

    instance-of v0, v0, Lorg/mozilla/javascript/NativeJavaArray;

    move/from16 v23, v0

    if-eqz v23, :cond_8

    .line 167
    :cond_3
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-object v23, p4, v23

    array-length v0, v6

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x1

    aget-object v24, v6, v24

    invoke-static/range {v23 .. v24}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v21

    .line 183
    .local v21, "varArgs":Ljava/lang/Object;
    :cond_4
    array-length v0, v6

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aput-object v21, v14, v23

    .line 185
    move-object/from16 p4, v14

    .line 201
    .end local v14    # "newArgs":[Ljava/lang/Object;
    .end local v21    # "varArgs":Ljava/lang/Object;
    :cond_5
    invoke-virtual {v13}, Lorg/mozilla/javascript/MemberBox;->isStatic()Z

    move-result v23

    if-eqz v23, :cond_c

    .line 202
    const/4 v12, 0x0

    .line 225
    :cond_6
    move-object/from16 v0, p4

    invoke-virtual {v13, v12, v0}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    .line 226
    .local v17, "retval":Ljava/lang/Object;
    invoke-virtual {v13}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v19

    .line 236
    .local v19, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v17

    move-object/from16 v4, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v22

    .line 245
    .local v22, "wrapped":Ljava/lang/Object;
    if-nez v22, :cond_7

    sget-object v23, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_7

    .line 246
    sget-object v22, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 248
    :cond_7
    return-object v22

    .line 171
    .end local v17    # "retval":Ljava/lang/Object;
    .end local v19    # "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v22    # "wrapped":Ljava/lang/Object;
    .restart local v14    # "newArgs":[Ljava/lang/Object;
    :cond_8
    array-length v0, v6

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-object v23, v6, v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v9

    .line 173
    .local v9, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    array-length v0, v6

    move/from16 v24, v0

    sub-int v23, v23, v24

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    invoke-static {v9, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v21

    .line 175
    .restart local v21    # "varArgs":Ljava/lang/Object;
    const/4 v10, 0x0

    :goto_1
    invoke-static/range {v21 .. v21}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v23

    move/from16 v0, v23

    if-ge v10, v0, :cond_4

    .line 176
    array-length v0, v6

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    add-int v23, v23, v10

    aget-object v23, p4, v23

    move-object/from16 v0, v23

    invoke-static {v0, v9}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v20

    .line 178
    .local v20, "value":Ljava/lang/Object;
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-static {v0, v10, v1}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 175
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 188
    .end local v9    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "i":I
    .end local v14    # "newArgs":[Ljava/lang/Object;
    .end local v20    # "value":Ljava/lang/Object;
    .end local v21    # "varArgs":Ljava/lang/Object;
    :cond_9
    move-object/from16 v16, p4

    .line 189
    .local v16, "origArgs":[Ljava/lang/Object;
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_2
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v10, v0, :cond_5

    .line 190
    aget-object v5, p4, v10

    .line 191
    .local v5, "arg":Ljava/lang/Object;
    aget-object v23, v6, v10

    move-object/from16 v0, v23

    invoke-static {v5, v0}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    .line 192
    .local v8, "coerced":Ljava/lang/Object;
    if-eq v8, v5, :cond_b

    .line 193
    move-object/from16 v0, v16

    move-object/from16 v1, p4

    if-ne v0, v1, :cond_a

    .line 194
    invoke-virtual/range {p4 .. p4}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p4

    .end local p4    # "args":[Ljava/lang/Object;
    check-cast p4, [Ljava/lang/Object;

    .line 196
    .restart local p4    # "args":[Ljava/lang/Object;
    :cond_a
    aput-object v8, p4, v10

    .line 189
    :cond_b
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 204
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v8    # "coerced":Ljava/lang/Object;
    .end local v16    # "origArgs":[Ljava/lang/Object;
    :cond_c
    move-object/from16 v15, p3

    .line 205
    .local v15, "o":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v13}, Lorg/mozilla/javascript/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    .line 207
    .restart local v7    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_3
    if-nez v15, :cond_d

    .line 208
    const-string v23, "msg.nonjava.method"

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeJavaMethod;->getFunctionName()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {p3 .. p3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v23 .. v26}, Lorg/mozilla/javascript/Context;->reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v23

    throw v23

    .line 212
    :cond_d
    instance-of v0, v15, Lorg/mozilla/javascript/Wrapper;

    move/from16 v23, v0

    if-eqz v23, :cond_e

    move-object/from16 v23, v15

    .line 213
    check-cast v23, Lorg/mozilla/javascript/Wrapper;

    invoke-interface/range {v23 .. v23}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v12

    .line 214
    .local v12, "javaObject":Ljava/lang/Object;
    invoke-virtual {v7, v12}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_6

    .line 218
    .end local v12    # "javaObject":Ljava/lang/Object;
    :cond_e
    invoke-interface {v15}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v15

    goto :goto_3
.end method

.method decompile(II)Ljava/lang/String;
    .locals 3
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .prologue
    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .local v1, "sb":Ljava/lang/StringBuilder;
    and-int/lit8 v2, p2, 0x1

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    .line 99
    .local v0, "justbody":Z
    :goto_0
    if-nez v0, :cond_0

    .line 100
    const-string v2, "function "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaMethod;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    const-string v2, "() {"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    :cond_0
    const-string v2, "/*\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaMethod;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    if-eqz v0, :cond_2

    const-string v2, "*/\n"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 98
    .end local v0    # "justbody":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 106
    .restart local v0    # "justbody":Z
    :cond_2
    const-string v2, "*/}\n"

    goto :goto_1
.end method

.method findCachedFunction(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;)I
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 252
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    array-length v3, v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_5

    .line 253
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    if-eqz v3, :cond_2

    .line 254
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/ResolvedOverload;

    .line 255
    .local v2, "ovl":Lorg/mozilla/javascript/ResolvedOverload;
    invoke-virtual {v2, p2}, Lorg/mozilla/javascript/ResolvedOverload;->matches([Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 256
    iget v1, v2, Lorg/mozilla/javascript/ResolvedOverload;->index:I

    .line 275
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "ovl":Lorg/mozilla/javascript/ResolvedOverload;
    :cond_1
    :goto_0
    return v1

    .line 260
    :cond_2
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 262
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    invoke-static {p1, v3, p2}, Lorg/mozilla/javascript/NativeJavaMethod;->findFunction(Lorg/mozilla/javascript/Context;[Lorg/mozilla/javascript/MemberBox;[Ljava/lang/Object;)I

    move-result v1

    .line 265
    .local v1, "index":I
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v3

    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    array-length v4, v4

    mul-int/lit8 v4, v4, 0x2

    if-ge v3, v4, :cond_1

    .line 266
    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    monitor-enter v4

    .line 267
    :try_start_0
    new-instance v2, Lorg/mozilla/javascript/ResolvedOverload;

    invoke-direct {v2, p2, v1}, Lorg/mozilla/javascript/ResolvedOverload;-><init>([Ljava/lang/Object;I)V

    .line 268
    .restart local v2    # "ovl":Lorg/mozilla/javascript/ResolvedOverload;
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 269
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(ILjava/lang/Object;)V

    .line 271
    :cond_4
    monitor-exit v4

    goto :goto_0

    .end local v2    # "ovl":Lorg/mozilla/javascript/ResolvedOverload;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 275
    .end local v1    # "index":I
    :cond_5
    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    invoke-static {p1, v3, p2}, Lorg/mozilla/javascript/NativeJavaMethod;->findFunction(Lorg/mozilla/javascript/Context;[Lorg/mozilla/javascript/MemberBox;[Ljava/lang/Object;)I

    move-result v1

    goto :goto_0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaMethod;->functionName:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 113
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    array-length v0, v4

    .local v0, "N":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 116
    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lorg/mozilla/javascript/MemberBox;->isMethod()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 117
    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v2

    .line 118
    .local v2, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :goto_1
    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    aget-object v4, v4, v1

    iget-object v4, v4, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    invoke-static {v4}, Lorg/mozilla/javascript/JavaMembers;->liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lorg/mozilla/javascript/MemberBox;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 127
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
