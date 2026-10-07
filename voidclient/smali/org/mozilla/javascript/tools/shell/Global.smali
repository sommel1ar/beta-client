.class public Lorg/mozilla/javascript/tools/shell/Global;
.super Lorg/mozilla/javascript/ImporterTopLevel;
.source "Global.java"


# static fields
.field static final serialVersionUID:J = 0x37ea591919c223d5L


# instance fields
.field attemptedJLineLoad:Z

.field private console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

.field private doctestCanonicalizations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private errStream:Ljava/io/PrintStream;

.field history:Lorg/mozilla/javascript/NativeArray;

.field private inStream:Ljava/io/InputStream;

.field initialized:Z

.field private outStream:Ljava/io/PrintStream;

.field private prompts:[Ljava/lang/String;

.field private quitAction:Lorg/mozilla/javascript/tools/shell/QuitAction;

.field private sealedStdLib:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 50
    invoke-direct {p0}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>()V

    .line 43
    iput-boolean v2, p0, Lorg/mozilla/javascript/tools/shell/Global;->sealedStdLib:Z

    .line 46
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "js> "

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "  > "

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Context;)V
    .locals 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v2, 0x0

    .line 54
    invoke-direct {p0}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>()V

    .line 43
    iput-boolean v2, p0, Lorg/mozilla/javascript/tools/shell/Global;->sealedStdLib:Z

    .line 46
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "js> "

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "  > "

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    .line 55
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/shell/Global;->init(Lorg/mozilla/javascript/Context;)V

    .line 56
    return-void
.end method

.method public static defineClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 301
    invoke-static {p2}, Lorg/mozilla/javascript/tools/shell/Global;->getClass([Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 302
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lorg/mozilla/javascript/Scriptable;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 303
    const-string v1, "msg.must.implement.Scriptable"

    invoke-static {v1}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 305
    :cond_0
    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 306
    return-void
.end method

.method public static deserialize(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 375
    array-length v5, p2

    const/4 v6, 0x1

    if-ge v5, v6, :cond_0

    .line 376
    const-string v5, "Expected a filename to read the serialization from"

    invoke-static {v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v5

    throw v5

    .line 379
    :cond_0
    const/4 v5, 0x0

    aget-object v5, p2, v5

    invoke-static {v5}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 380
    .local v1, "filename":Ljava/lang/String;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 381
    .local v2, "fis":Ljava/io/FileInputStream;
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 382
    .local v4, "scope":Lorg/mozilla/javascript/Scriptable;
    new-instance v3, Lorg/mozilla/javascript/serialize/ScriptableInputStream;

    invoke-direct {v3, v2, v4}, Lorg/mozilla/javascript/serialize/ScriptableInputStream;-><init>(Ljava/io/InputStream;Lorg/mozilla/javascript/Scriptable;)V

    .line 383
    .local v3, "in":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    .line 384
    .local v0, "deserialized":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V

    .line 385
    invoke-static {v0, v4}, Lorg/mozilla/javascript/Context;->toObject(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    return-object v5
.end method

.method private static doPrint([Ljava/lang/Object;Lorg/mozilla/javascript/Function;Z)Ljava/lang/Object;
    .locals 4
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "funObj"    # Lorg/mozilla/javascript/Function;
    .param p2, "newline"    # Z

    .prologue
    .line 206
    invoke-static {p1}, Lorg/mozilla/javascript/tools/shell/Global;->getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v1

    .line 207
    .local v1, "out":Ljava/io/PrintStream;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p0

    if-ge v0, v3, :cond_1

    .line 208
    if-lez v0, :cond_0

    .line 209
    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 212
    :cond_0
    aget-object v3, p0, v0

    invoke-static {v3}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 214
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 207
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 216
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    if-eqz p2, :cond_2

    .line 217
    invoke-virtual {v1}, Ljava/io/PrintStream;->println()V

    .line 219
    :cond_2
    invoke-static {}, Lorg/mozilla/javascript/Context;->getUndefinedValue()Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static doctest(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    const/4 v5, 0x0

    .line 422
    array-length v1, p2

    if-nez v1, :cond_0

    .line 423
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 427
    :goto_0
    return-object v1

    .line 425
    :cond_0
    aget-object v1, p2, v5

    invoke-static {v1}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 426
    .local v3, "session":Ljava/lang/String;
    invoke-static {p3}, Lorg/mozilla/javascript/tools/shell/Global;->getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    .line 427
    .local v0, "global":Lorg/mozilla/javascript/tools/shell/Global;
    new-instance v6, Ljava/lang/Integer;

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, v0

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/tools/shell/Global;->runDoctest(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object v1, v6

    goto :goto_0
.end method

.method private doctestOutputMatches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p1, "expected"    # Ljava/lang/String;
    .param p2, "actual"    # Ljava/lang/String;

    .prologue
    .line 512
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 513
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    const-string v10, "\r\n"

    const-string v11, "\n"

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 514
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 515
    const/4 v9, 0x1

    .line 550
    :goto_0
    return v9

    .line 516
    :cond_0
    iget-object v9, p0, Lorg/mozilla/javascript/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 517
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/CharSequence;

    invoke-virtual {p1, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 518
    goto :goto_1

    .line 519
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 520
    const/4 v9, 0x1

    goto :goto_0

    .line 527
    :cond_2
    const-string v9, "@[0-9a-fA-F]+"

    invoke-static {v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 528
    .local v7, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v7, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 529
    .local v4, "expectedMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 531
    .local v1, "actualMatcher":Ljava/util/regex/Matcher;
    :cond_3
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-nez v9, :cond_4

    .line 532
    const/4 v9, 0x0

    goto :goto_0

    .line 533
    :cond_4
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-nez v9, :cond_5

    .line 534
    const/4 v9, 0x0

    goto :goto_0

    .line 535
    :cond_5
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v9

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    if-eq v9, v10, :cond_6

    .line 536
    const/4 v9, 0x0

    goto :goto_0

    .line 537
    :cond_6
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    .line 538
    .local v8, "start":I
    const/4 v9, 0x0

    invoke-virtual {p1, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {p2, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7

    .line 539
    const/4 v9, 0x0

    goto :goto_0

    .line 540
    :cond_7
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    .line 541
    .local v3, "expectedGroup":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    .line 542
    .local v0, "actualGroup":Ljava/lang/String;
    iget-object v9, p0, Lorg/mozilla/javascript/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    invoke-virtual {v9, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 543
    .local v6, "mapping":Ljava/lang/String;
    if-nez v6, :cond_9

    .line 544
    iget-object v9, p0, Lorg/mozilla/javascript/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    invoke-virtual {v9, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 549
    :cond_8
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 550
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 546
    :cond_9
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 547
    const/4 v9, 0x0

    goto/16 :goto_0
.end method

.method public static gc(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 0
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 176
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 177
    return-void
.end method

.method private static getCharCodingFromType(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x20

    .line 1154
    const/16 v1, 0x3b

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 1155
    .local v4, "i":I
    if-ltz v4, :cond_4

    .line 1156
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 1157
    .local v6, "end":I
    add-int/lit8 v4, v4, 0x1

    .line 1158
    :goto_0
    if-eq v4, v6, :cond_0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v7, :cond_0

    .line 1159
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1161
    :cond_0
    const-string v0, "charset"

    .line 1162
    .local v0, "charset":Ljava/lang/String;
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    move-object v3, p0

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1164
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v4, v1

    .line 1165
    :goto_1
    if-eq v4, v6, :cond_1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v7, :cond_1

    .line 1166
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1168
    :cond_1
    if-eq v4, v6, :cond_4

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x3d

    if-ne v1, v2, :cond_4

    .line 1169
    add-int/lit8 v4, v4, 0x1

    .line 1170
    :goto_2
    if-eq v4, v6, :cond_2

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v7, :cond_2

    .line 1171
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1173
    :cond_2
    if-eq v4, v6, :cond_4

    .line 1176
    :goto_3
    add-int/lit8 v1, v6, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v7, :cond_3

    .line 1177
    add-int/lit8 v6, v6, -0x1

    goto :goto_3

    .line 1179
    :cond_3
    invoke-virtual {p0, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1184
    .end local v0    # "charset":Ljava/lang/String;
    .end local v6    # "end":I
    :goto_4
    return-object v1

    :cond_4
    const/4 v1, 0x0

    goto :goto_4
.end method

.method private static getClass([Ljava/lang/Object;)Ljava/lang/Class;
    .locals 6
    .param p0, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 335
    array-length v4, p0

    if-nez v4, :cond_0

    .line 336
    const-string v4, "msg.expected.string.arg"

    invoke-static {v4}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 338
    :cond_0
    aget-object v0, p0, v5

    .line 339
    .local v0, "arg0":Ljava/lang/Object;
    instance-of v4, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v4, :cond_1

    .line 340
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "arg0":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    .line 341
    .local v3, "wrapped":Ljava/lang/Object;
    instance-of v4, v3, Ljava/lang/Class;

    if-eqz v4, :cond_1

    .line 342
    check-cast v3, Ljava/lang/Class;

    .line 346
    .end local v3    # "wrapped":Ljava/lang/Object;
    :goto_0
    return-object v3

    .line 344
    :cond_1
    aget-object v4, p0, v5

    invoke-static {v4}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 346
    .local v1, "className":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 348
    :catch_0
    move-exception v2

    .line 349
    .local v2, "cnfe":Ljava/lang/ClassNotFoundException;
    const-string v4, "msg.class.not.found"

    invoke-static {v4, v1}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method private static getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;
    .locals 3
    .param p0, "function"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 924
    invoke-interface {p0}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 925
    .local v0, "scope":Lorg/mozilla/javascript/Scriptable;
    instance-of v1, v0, Lorg/mozilla/javascript/tools/shell/Global;

    if-nez v1, :cond_0

    .line 926
    const-string v1, "msg.bad.shell.function.scope"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 928
    :cond_0
    check-cast v0, Lorg/mozilla/javascript/tools/shell/Global;

    .end local v0    # "scope":Lorg/mozilla/javascript/Scriptable;
    return-object v0
.end method

.method public static help(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 169
    invoke-static {p3}, Lorg/mozilla/javascript/tools/shell/Global;->getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    .line 170
    .local v0, "out":Ljava/io/PrintStream;
    const-string v1, "msg.help"

    invoke-static {v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public static load(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 264
    move-object v1, p2

    .local v1, "arr$":[Ljava/lang/Object;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v6, :cond_0

    aget-object v0, v1, v4

    .line 265
    .local v0, "arg":Ljava/lang/Object;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 267
    .local v3, "file":Ljava/lang/String;
    :try_start_0
    invoke-static {p0, p1, v3}, Lorg/mozilla/javascript/tools/shell/Main;->processFile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_1

    .line 264
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 268
    :catch_0
    move-exception v5

    .line 269
    .local v5, "ioex":Ljava/io/IOException;
    const-string v8, "msg.couldnt.read.source"

    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v3, v9}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 271
    .local v7, "msg":Ljava/lang/String;
    invoke-static {v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v8

    throw v8

    .line 272
    .end local v5    # "ioex":Ljava/io/IOException;
    .end local v7    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 274
    .local v2, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v2}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 275
    const-string v8, "msg.uncaughtJSException"

    invoke-virtual {v2}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 277
    .restart local v7    # "msg":Ljava/lang/String;
    invoke-static {v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v8

    throw v8

    .line 280
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v2    # "ex":Ljava/lang/VirtualMachineError;
    .end local v3    # "file":Ljava/lang/String;
    .end local v7    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static loadClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-static {p2}, Lorg/mozilla/javascript/tools/shell/Global;->getClass([Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 327
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/mozilla/javascript/Script;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 328
    const-string v2, "msg.must.implement.Script"

    invoke-static {v2}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 330
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/Script;

    .line 331
    .local v1, "script":Lorg/mozilla/javascript/Script;
    invoke-interface {v1, p0, p1}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    .line 332
    return-void
.end method

.method private loadJLine(Ljava/nio/charset/Charset;)Z
    .locals 2
    .param p1, "cs"    # Ljava/nio/charset/Charset;

    .prologue
    const/4 v0, 0x1

    .line 873
    iget-boolean v1, p0, Lorg/mozilla/javascript/tools/shell/Global;->attemptedJLineLoad:Z

    if-nez v1, :cond_0

    .line 875
    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->attemptedJLineLoad:Z

    .line 876
    invoke-static {p0, p1}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->getConsole(Lorg/mozilla/javascript/Scriptable;Ljava/nio/charset/Charset;)Lorg/mozilla/javascript/tools/shell/ShellConsole;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    .line 878
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    if-eqz v1, :cond_1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static pipe(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 6
    .param p0, "fromProcess"    # Z
    .param p1, "from"    # Ljava/io/InputStream;
    .param p2, "to"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1005
    const/16 v0, 0x1000

    .line 1006
    .local v0, "SIZE":I
    const/16 v4, 0x1000

    :try_start_0
    new-array v1, v4, [B

    .line 1009
    .local v1, "buffer":[B
    :goto_0
    if-nez p0, :cond_0

    .line 1010
    const/4 v4, 0x0

    const/16 v5, 0x1000

    invoke-virtual {p1, v1, v4, v5}, Ljava/io/InputStream;->read([BII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .line 1019
    .local v3, "n":I
    :goto_1
    if-gez v3, :cond_1

    .line 1035
    .end local v3    # "n":I
    :goto_2
    if-eqz p0, :cond_3

    .line 1036
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 1045
    :goto_3
    return-void

    .line 1013
    :cond_0
    const/4 v4, 0x0

    const/16 v5, 0x1000

    :try_start_2
    invoke-virtual {p1, v1, v4, v5}, Ljava/io/InputStream;->read([BII)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v3

    .restart local v3    # "n":I
    goto :goto_1

    .line 1014
    .end local v3    # "n":I
    :catch_0
    move-exception v2

    .line 1016
    .local v2, "ex":Ljava/io/IOException;
    goto :goto_2

    .line 1020
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v3    # "n":I
    :cond_1
    if-eqz p0, :cond_2

    .line 1021
    const/4 v4, 0x0

    :try_start_3
    invoke-virtual {p2, v1, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 1022
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1034
    .end local v1    # "buffer":[B
    .end local v3    # "n":I
    :catchall_0
    move-exception v4

    .line 1035
    if-eqz p0, :cond_4

    .line 1036
    :try_start_4
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 1043
    :goto_4
    throw v4

    .line 1025
    .restart local v1    # "buffer":[B
    .restart local v3    # "n":I
    :cond_2
    const/4 v4, 0x0

    :try_start_5
    invoke-virtual {p2, v1, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 1026
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 1027
    :catch_1
    move-exception v2

    .line 1029
    .restart local v2    # "ex":Ljava/io/IOException;
    goto :goto_2

    .line 1038
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v3    # "n":I
    :cond_3
    :try_start_6
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_3

    .line 1040
    :catch_2
    move-exception v4

    goto :goto_3

    .line 1038
    .end local v1    # "buffer":[B
    :cond_4
    :try_start_7
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_4

    .line 1040
    :catch_3
    move-exception v5

    goto :goto_4
.end method

.method public static print(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 192
    const/4 v0, 0x1

    invoke-static {p2, p3, v0}, Lorg/mozilla/javascript/tools/shell/Global;->doPrint([Ljava/lang/Object;Lorg/mozilla/javascript/Function;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static quit(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    const/4 v0, 0x0

    .line 231
    invoke-static {p3}, Lorg/mozilla/javascript/tools/shell/Global;->getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v1

    .line 232
    .local v1, "global":Lorg/mozilla/javascript/tools/shell/Global;
    iget-object v2, v1, Lorg/mozilla/javascript/tools/shell/Global;->quitAction:Lorg/mozilla/javascript/tools/shell/QuitAction;

    if-eqz v2, :cond_0

    .line 233
    array-length v2, p2

    if-nez v2, :cond_1

    .line 235
    .local v0, "exitCode":I
    :goto_0
    iget-object v2, v1, Lorg/mozilla/javascript/tools/shell/Global;->quitAction:Lorg/mozilla/javascript/tools/shell/QuitAction;

    invoke-interface {v2, p0, v0}, Lorg/mozilla/javascript/tools/shell/QuitAction;->quit(Lorg/mozilla/javascript/Context;I)V

    .line 237
    .end local v0    # "exitCode":I
    :cond_0
    return-void

    .line 233
    :cond_1
    aget-object v2, p2, v0

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public static readFile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 818
    array-length v2, p2

    if-nez v2, :cond_0

    .line 819
    const-string v2, "msg.shell.readFile.bad.args"

    invoke-static {v2}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 821
    :cond_0
    const/4 v2, 0x0

    aget-object v2, p2, v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 822
    .local v1, "path":Ljava/lang/String;
    const/4 v0, 0x0

    .line 823
    .local v0, "charCoding":Ljava/lang/String;
    array-length v2, p2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_1

    .line 824
    aget-object v2, p2, v4

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 827
    :cond_1
    invoke-static {v1, v0, v4}, Lorg/mozilla/javascript/tools/shell/Global;->readUrl(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static readReader(Ljava/io/Reader;)Ljava/lang/String;
    .locals 1
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1190
    const/16 v0, 0x1000

    invoke-static {p0, v0}, Lorg/mozilla/javascript/tools/shell/Global;->readReader(Ljava/io/Reader;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readReader(Ljava/io/Reader;I)Ljava/lang/String;
    .locals 6
    .param p0, "reader"    # Ljava/io/Reader;
    .param p1, "initialBufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1196
    new-array v0, p1, [C

    .line 1197
    .local v0, "buffer":[C
    const/4 v2, 0x0

    .line 1199
    .local v2, "offset":I
    :cond_0
    :goto_0
    array-length v4, v0

    sub-int/2addr v4, v2

    invoke-virtual {p0, v0, v2, v4}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .line 1200
    .local v1, "n":I
    if-gez v1, :cond_1

    .line 1208
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0, v5, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v4

    .line 1201
    :cond_1
    add-int/2addr v2, v1

    .line 1202
    array-length v4, v0

    if-ne v2, v4, :cond_0

    .line 1203
    array-length v4, v0

    mul-int/lit8 v4, v4, 0x2

    new-array v3, v4, [C

    .line 1204
    .local v3, "tmp":[C
    invoke-static {v0, v5, v3, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1205
    move-object v0, v3

    goto :goto_0
.end method

.method public static readUrl(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 848
    array-length v2, p2

    if-nez v2, :cond_0

    .line 849
    const-string v2, "msg.shell.readUrl.bad.args"

    invoke-static {v2}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 851
    :cond_0
    aget-object v2, p2, v4

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 852
    .local v1, "url":Ljava/lang/String;
    const/4 v0, 0x0

    .line 853
    .local v0, "charCoding":Ljava/lang/String;
    array-length v2, p2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_1

    .line 854
    const/4 v2, 0x1

    aget-object v2, p2, v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 857
    :cond_1
    invoke-static {v1, v0, v4}, Lorg/mozilla/javascript/tools/shell/Global;->readUrl(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static readUrl(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 13
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "charCoding"    # Ljava/lang/String;
    .param p2, "urlIsFile"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1087
    const/4 v2, 0x0

    .line 1089
    .local v2, "is":Ljava/io/InputStream;
    if-nez p2, :cond_3

    .line 1090
    :try_start_0
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1091
    .local v9, "urlObj":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v8

    .line 1092
    .local v8, "uc":Ljava/net/URLConnection;
    invoke-virtual {v8}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 1093
    invoke-virtual {v8}, Ljava/net/URLConnection;->getContentLength()I

    move-result v0

    .line 1094
    .local v0, "chunkLength":I
    if-gtz v0, :cond_0

    .line 1095
    const/16 v0, 0x400

    .line 1096
    :cond_0
    if-nez p1, :cond_1

    .line 1097
    invoke-virtual {v8}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v7

    .line 1098
    .local v7, "type":Ljava/lang/String;
    if-eqz v7, :cond_1

    .line 1099
    invoke-static {v7}, Lorg/mozilla/javascript/tools/shell/Global;->getCharCodingFromType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1120
    .end local v7    # "type":Ljava/lang/String;
    .end local v8    # "uc":Ljava/net/URLConnection;
    .end local v9    # "urlObj":Ljava/net/URL;
    :cond_1
    :goto_0
    if-nez p1, :cond_9

    .line 1121
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 1125
    .local v6, "r":Ljava/io/Reader;
    :goto_1
    invoke-static {v6, v0}, Lorg/mozilla/javascript/tools/shell/Global;->readReader(Ljava/io/Reader;I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 1128
    if-eqz v2, :cond_2

    .line 1129
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .end local v6    # "r":Ljava/io/Reader;
    :cond_2
    :goto_2
    return-object v10

    .line 1103
    .end local v0    # "chunkLength":I
    :cond_3
    :try_start_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1104
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_5

    .line 1105
    new-instance v10, Ljava/io/FileNotFoundException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "File not found: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1128
    .end local v1    # "f":Ljava/io/File;
    :catchall_0
    move-exception v10

    if-eqz v2, :cond_4

    .line 1129
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_4
    throw v10

    .line 1106
    .restart local v1    # "f":Ljava/io/File;
    :cond_5
    :try_start_2
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v10

    if-nez v10, :cond_6

    .line 1107
    new-instance v10, Ljava/io/IOException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Cannot read file: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1109
    :cond_6
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 1110
    .local v4, "length":J
    long-to-int v0, v4

    .line 1111
    .restart local v0    # "chunkLength":I
    int-to-long v10, v0

    cmp-long v10, v10, v4

    if-eqz v10, :cond_7

    .line 1112
    new-instance v10, Ljava/io/IOException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Too big file size: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1114
    :cond_7
    if-nez v0, :cond_8

    const-string v10, ""
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1128
    if-eqz v2, :cond_2

    .line 1129
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_2

    .line 1116
    :cond_8
    :try_start_3
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v2    # "is":Ljava/io/InputStream;
    .local v3, "is":Ljava/io/InputStream;
    move-object v2, v3

    .end local v3    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    goto/16 :goto_0

    .line 1123
    .end local v1    # "f":Ljava/io/File;
    .end local v4    # "length":J
    :cond_9
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .restart local v6    # "r":Ljava/io/Reader;
    goto/16 :goto_1
.end method

.method public static readline(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1144
    invoke-static {p3}, Lorg/mozilla/javascript/tools/shell/Global;->getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    .line 1146
    .local v0, "self":Lorg/mozilla/javascript/tools/shell/Global;
    array-length v1, p2

    if-lez v1, :cond_0

    .line 1147
    iget-object v1, v0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    const/4 v2, 0x0

    aget-object v2, p2, v2

    invoke-static {v2}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1149
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->readLine()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method static reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "msgId"    # Ljava/lang/String;

    .prologue
    .line 1212
    invoke-static {p0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1213
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "msgId"    # Ljava/lang/String;
    .param p1, "msgArg"    # Ljava/lang/String;

    .prologue
    .line 1218
    invoke-static {p0, p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1219
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method public static runCommand(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 32
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 665
    move-object/from16 v0, p2

    array-length v9, v0

    .line 666
    .local v9, "L":I
    if-eqz v9, :cond_0

    const/16 v30, 0x1

    move/from16 v0, v30

    if-ne v9, v0, :cond_1

    const/16 v30, 0x0

    aget-object v30, p2, v30

    move-object/from16 v0, v30

    instance-of v0, v0, Lorg/mozilla/javascript/Scriptable;

    move/from16 v30, v0

    if-eqz v30, :cond_1

    .line 667
    :cond_0
    const-string v30, "msg.runCommand.bad.args"

    invoke-static/range {v30 .. v30}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v30

    throw v30

    .line 669
    :cond_1
    const/4 v5, 0x0

    .line 670
    .local v5, "wd":Ljava/io/File;
    const/4 v6, 0x0

    .line 671
    .local v6, "in":Ljava/io/InputStream;
    const/4 v7, 0x0

    .local v7, "out":Ljava/io/OutputStream;
    const/4 v8, 0x0

    .line 672
    .local v8, "err":Ljava/io/OutputStream;
    const/16 v24, 0x0

    .local v24, "outBytes":Ljava/io/ByteArrayOutputStream;
    const/4 v14, 0x0

    .line 673
    .local v14, "errBytes":Ljava/io/ByteArrayOutputStream;
    const/16 v25, 0x0

    .local v25, "outObj":Ljava/lang/Object;
    const/4 v15, 0x0

    .line 674
    .local v15, "errObj":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 675
    .local v4, "environment":[Ljava/lang/String;
    const/16 v26, 0x0

    .line 676
    .local v26, "params":Lorg/mozilla/javascript/Scriptable;
    const/4 v10, 0x0

    .line 677
    .local v10, "addArgs":[Ljava/lang/Object;
    add-int/lit8 v30, v9, -0x1

    aget-object v30, p2, v30

    move-object/from16 v0, v30

    instance-of v0, v0, Lorg/mozilla/javascript/Scriptable;

    move/from16 v30, v0

    if-eqz v30, :cond_7

    .line 678
    add-int/lit8 v30, v9, -0x1

    aget-object v26, p2, v30

    .end local v26    # "params":Lorg/mozilla/javascript/Scriptable;
    check-cast v26, Lorg/mozilla/javascript/Scriptable;

    .line 679
    .restart local v26    # "params":Lorg/mozilla/javascript/Scriptable;
    add-int/lit8 v9, v9, -0x1

    .line 680
    const-string v30, "env"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 681
    .local v13, "envObj":Ljava/lang/Object;
    sget-object v30, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v30

    if-eq v13, v0, :cond_2

    .line 682
    if-nez v13, :cond_a

    .line 683
    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v4, v0, [Ljava/lang/String;

    .line 709
    :cond_2
    const-string v30, "dir"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v29

    .line 710
    .local v29, "wdObj":Ljava/lang/Object;
    sget-object v30, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_3

    .line 711
    new-instance v5, Ljava/io/File;

    .end local v5    # "wd":Ljava/io/File;
    invoke-static/range {v29 .. v29}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 714
    .restart local v5    # "wd":Ljava/io/File;
    :cond_3
    const-string v30, "input"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    .line 715
    .local v21, "inObj":Ljava/lang/Object;
    sget-object v30, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v21

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_4

    .line 716
    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/tools/shell/Global;->toInputStream(Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v6

    .line 718
    :cond_4
    const-string v30, "output"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    .line 719
    sget-object v30, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v25

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_5

    .line 720
    invoke-static/range {v25 .. v25}, Lorg/mozilla/javascript/tools/shell/Global;->toOutputStream(Ljava/lang/Object;)Ljava/io/OutputStream;

    move-result-object v7

    .line 721
    if-nez v7, :cond_5

    .line 722
    new-instance v24, Ljava/io/ByteArrayOutputStream;

    .end local v24    # "outBytes":Ljava/io/ByteArrayOutputStream;
    invoke-direct/range {v24 .. v24}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 723
    .restart local v24    # "outBytes":Ljava/io/ByteArrayOutputStream;
    move-object/from16 v7, v24

    .line 726
    :cond_5
    const-string v30, "err"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    .line 727
    sget-object v30, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v30

    if-eq v15, v0, :cond_6

    .line 728
    invoke-static {v15}, Lorg/mozilla/javascript/tools/shell/Global;->toOutputStream(Ljava/lang/Object;)Ljava/io/OutputStream;

    move-result-object v8

    .line 729
    if-nez v8, :cond_6

    .line 730
    new-instance v14, Ljava/io/ByteArrayOutputStream;

    .end local v14    # "errBytes":Ljava/io/ByteArrayOutputStream;
    invoke-direct {v14}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 731
    .restart local v14    # "errBytes":Ljava/io/ByteArrayOutputStream;
    move-object v8, v14

    .line 734
    :cond_6
    const-string v30, "args"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    .line 735
    .local v11, "addArgsObj":Ljava/lang/Object;
    sget-object v30, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v30

    if-eq v11, v0, :cond_7

    .line 736
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/tools/shell/Global;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-static {v11, v0}, Lorg/mozilla/javascript/Context;->toObject(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v27

    .line 738
    .local v27, "s":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->getElements(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;

    move-result-object v10

    .line 741
    .end local v11    # "addArgsObj":Ljava/lang/Object;
    .end local v13    # "envObj":Ljava/lang/Object;
    .end local v15    # "errObj":Ljava/lang/Object;
    .end local v21    # "inObj":Ljava/lang/Object;
    .end local v25    # "outObj":Ljava/lang/Object;
    .end local v27    # "s":Lorg/mozilla/javascript/Scriptable;
    .end local v29    # "wdObj":Ljava/lang/Object;
    :cond_7
    invoke-static/range {p3 .. p3}, Lorg/mozilla/javascript/tools/shell/Global;->getInstance(Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v17

    .line 742
    .local v17, "global":Lorg/mozilla/javascript/tools/shell/Global;
    if-nez v7, :cond_8

    .line 743
    if-eqz v17, :cond_e

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v7

    .line 745
    :cond_8
    :goto_0
    if-nez v8, :cond_9

    .line 746
    if-eqz v17, :cond_f

    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v8

    .line 753
    :cond_9
    :goto_1
    if-nez v10, :cond_10

    move/from16 v30, v9

    :goto_2
    move/from16 v0, v30

    new-array v3, v0, [Ljava/lang/String;

    .line 754
    .local v3, "cmd":[Ljava/lang/String;
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_3
    move/from16 v0, v18

    if-eq v0, v9, :cond_11

    .line 755
    aget-object v30, p2, v18

    invoke-static/range {v30 .. v30}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    aput-object v30, v3, v18

    .line 754
    add-int/lit8 v18, v18, 0x1

    goto :goto_3

    .line 685
    .end local v3    # "cmd":[Ljava/lang/String;
    .end local v17    # "global":Lorg/mozilla/javascript/tools/shell/Global;
    .end local v18    # "i":I
    .restart local v13    # "envObj":Ljava/lang/Object;
    .restart local v15    # "errObj":Ljava/lang/Object;
    .restart local v25    # "outObj":Ljava/lang/Object;
    :cond_a
    instance-of v0, v13, Lorg/mozilla/javascript/Scriptable;

    move/from16 v30, v0

    if-nez v30, :cond_b

    .line 686
    const-string v30, "msg.runCommand.bad.env"

    invoke-static/range {v30 .. v30}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v30

    throw v30

    :cond_b
    move-object v12, v13

    .line 688
    check-cast v12, Lorg/mozilla/javascript/Scriptable;

    .line 689
    .local v12, "envHash":Lorg/mozilla/javascript/Scriptable;
    invoke-static {v12}, Lorg/mozilla/javascript/ScriptableObject;->getPropertyIds(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;

    move-result-object v19

    .line 690
    .local v19, "ids":[Ljava/lang/Object;
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    new-array v4, v0, [Ljava/lang/String;

    .line 691
    const/16 v18, 0x0

    .restart local v18    # "i":I
    :goto_4
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v18

    move/from16 v1, v30

    if-eq v0, v1, :cond_2

    .line 692
    aget-object v23, v19, v18

    .line 694
    .local v23, "keyObj":Ljava/lang/Object;
    move-object/from16 v0, v23

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v30, v0

    if-eqz v30, :cond_d

    move-object/from16 v22, v23

    .line 695
    check-cast v22, Ljava/lang/String;

    .line 696
    .local v22, "key":Ljava/lang/String;
    move-object/from16 v0, v22

    invoke-static {v12, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    .line 702
    .end local v23    # "keyObj":Ljava/lang/Object;
    .local v28, "val":Ljava/lang/Object;
    :goto_5
    sget-object v30, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_c

    .line 703
    sget-object v28, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 705
    :cond_c
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const/16 v31, 0x3d

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-static/range {v28 .. v28}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    aput-object v30, v4, v18

    .line 691
    add-int/lit8 v18, v18, 0x1

    goto :goto_4

    .line 698
    .end local v22    # "key":Ljava/lang/String;
    .end local v28    # "val":Ljava/lang/Object;
    .restart local v23    # "keyObj":Ljava/lang/Object;
    :cond_d
    check-cast v23, Ljava/lang/Number;

    .end local v23    # "keyObj":Ljava/lang/Object;
    invoke-virtual/range {v23 .. v23}, Ljava/lang/Number;->intValue()I

    move-result v20

    .line 699
    .local v20, "ikey":I
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v22

    .line 700
    .restart local v22    # "key":Ljava/lang/String;
    move/from16 v0, v20

    invoke-static {v12, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v28

    .restart local v28    # "val":Ljava/lang/Object;
    goto :goto_5

    .line 743
    .end local v12    # "envHash":Lorg/mozilla/javascript/Scriptable;
    .end local v13    # "envObj":Ljava/lang/Object;
    .end local v15    # "errObj":Ljava/lang/Object;
    .end local v18    # "i":I
    .end local v19    # "ids":[Ljava/lang/Object;
    .end local v20    # "ikey":I
    .end local v22    # "key":Ljava/lang/String;
    .end local v25    # "outObj":Ljava/lang/Object;
    .end local v28    # "val":Ljava/lang/Object;
    .restart local v17    # "global":Lorg/mozilla/javascript/tools/shell/Global;
    :cond_e
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    goto/16 :goto_0

    .line 746
    :cond_f
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    goto/16 :goto_1

    .line 753
    :cond_10
    array-length v0, v10

    move/from16 v30, v0

    add-int v30, v30, v9

    goto/16 :goto_2

    .line 757
    .restart local v3    # "cmd":[Ljava/lang/String;
    .restart local v18    # "i":I
    :cond_11
    if-eqz v10, :cond_12

    .line 758
    const/16 v18, 0x0

    :goto_6
    array-length v0, v10

    move/from16 v30, v0

    move/from16 v0, v18

    move/from16 v1, v30

    if-eq v0, v1, :cond_12

    .line 759
    add-int v30, v9, v18

    aget-object v31, v10, v18

    invoke-static/range {v31 .. v31}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    aput-object v31, v3, v30

    .line 758
    add-int/lit8 v18, v18, 0x1

    goto :goto_6

    .line 763
    :cond_12
    invoke-static/range {v3 .. v8}, Lorg/mozilla/javascript/tools/shell/Global;->runProcess([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)I

    move-result v16

    .line 764
    .local v16, "exitCode":I
    if-eqz v24, :cond_13

    .line 765
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v24 .. v24}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 766
    .local v27, "s":Ljava/lang/String;
    const-string v30, "output"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 768
    .end local v27    # "s":Ljava/lang/String;
    :cond_13
    if-eqz v14, :cond_14

    .line 769
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v15}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual {v14}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 770
    .restart local v27    # "s":Ljava/lang/String;
    const-string v30, "err"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 773
    .end local v27    # "s":Ljava/lang/String;
    :cond_14
    new-instance v30, Ljava/lang/Integer;

    move-object/from16 v0, v30

    move/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    return-object v30
.end method

.method private static runProcess([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)I
    .locals 7
    .param p0, "cmd"    # [Ljava/lang/String;
    .param p1, "environment"    # [Ljava/lang/String;
    .param p2, "wd"    # Ljava/io/File;
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "out"    # Ljava/io/OutputStream;
    .param p5, "err"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 946
    if-nez p1, :cond_3

    .line 947
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, p0, v6, p2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v4

    .line 953
    .local v4, "p":Ljava/lang/Process;
    :goto_0
    const/4 v1, 0x0

    .line 954
    .local v1, "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    if-eqz p3, :cond_4

    .line 955
    :try_start_0
    new-instance v2, Lorg/mozilla/javascript/tools/shell/PipeThread;

    const/4 v5, 0x0

    invoke-virtual {v4}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v2, v5, p3, v6}, Lorg/mozilla/javascript/tools/shell/PipeThread;-><init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 956
    .end local v1    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .local v2, "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :try_start_1
    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/shell/PipeThread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v1, v2

    .line 961
    .end local v2    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .restart local v1    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :goto_1
    const/4 v3, 0x0

    .line 962
    .local v3, "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    if-eqz p4, :cond_5

    .line 963
    :try_start_2
    new-instance v3, Lorg/mozilla/javascript/tools/shell/PipeThread;

    .end local v3    # "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    const/4 v5, 0x1

    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v3, v5, v6, p4}, Lorg/mozilla/javascript/tools/shell/PipeThread;-><init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    .line 964
    .restart local v3    # "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/shell/PipeThread;->start()V

    .line 969
    :goto_2
    const/4 v0, 0x0

    .line 970
    .local v0, "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    if-eqz p5, :cond_6

    .line 971
    new-instance v0, Lorg/mozilla/javascript/tools/shell/PipeThread;

    .end local v0    # "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    const/4 v5, 0x1

    invoke-virtual {v4}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v0, v5, v6, p5}, Lorg/mozilla/javascript/tools/shell/PipeThread;-><init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    .line 972
    .restart local v0    # "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/PipeThread;->start()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 980
    :goto_3
    :try_start_3
    invoke-virtual {v4}, Ljava/lang/Process;->waitFor()I

    .line 981
    if-eqz v3, :cond_0

    .line 982
    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/shell/PipeThread;->join()V

    .line 984
    :cond_0
    if-eqz v1, :cond_1

    .line 985
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/shell/PipeThread;->join()V

    .line 987
    :cond_1
    if-eqz v0, :cond_2

    .line 988
    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/PipeThread;->join()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 995
    :cond_2
    :try_start_4
    invoke-virtual {v4}, Ljava/lang/Process;->exitValue()I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v5

    .line 997
    invoke-virtual {v4}, Ljava/lang/Process;->destroy()V

    return v5

    .line 949
    .end local v0    # "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .end local v1    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .end local v3    # "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .end local v4    # "p":Ljava/lang/Process;
    :cond_3
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    invoke-virtual {v5, p0, p1, p2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v4

    .restart local v4    # "p":Ljava/lang/Process;
    goto :goto_0

    .line 958
    .restart local v1    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :cond_4
    :try_start_5
    invoke-virtual {v4}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 997
    :catchall_0
    move-exception v5

    :goto_4
    invoke-virtual {v4}, Ljava/lang/Process;->destroy()V

    throw v5

    .line 966
    .restart local v3    # "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :cond_5
    :try_start_6
    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    goto :goto_2

    .line 974
    .restart local v0    # "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :cond_6
    invoke-virtual {v4}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    .line 997
    .end local v0    # "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .end local v1    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .end local v3    # "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .restart local v2    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :catchall_1
    move-exception v5

    move-object v1, v2

    .end local v2    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .restart local v1    # "inThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    goto :goto_4

    .line 991
    .restart local v0    # "errThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    .restart local v3    # "outThread":Lorg/mozilla/javascript/tools/shell/PipeThread;
    :catch_0
    move-exception v5

    goto :goto_3
.end method

.method public static seal(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 782
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 783
    aget-object v0, p2, v1

    .line 784
    .local v0, "arg":Ljava/lang/Object;
    instance-of v2, v0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v2, :cond_0

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v2, :cond_3

    .line 786
    :cond_0
    instance-of v2, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_1

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v2, :cond_2

    .line 788
    :cond_1
    const-string v2, "msg.shell.seal.not.object"

    invoke-static {v2}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 790
    :cond_2
    const-string v2, "msg.shell.seal.not.scriptable"

    invoke-static {v2}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 782
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 795
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_4
    const/4 v1, 0x0

    :goto_1
    array-length v2, p2

    if-eq v1, v2, :cond_5

    .line 796
    aget-object v0, p2, v1

    .line 797
    .restart local v0    # "arg":Ljava/lang/Object;
    check-cast v0, Lorg/mozilla/javascript/ScriptableObject;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptableObject;->sealObject()V

    .line 795
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 799
    :cond_5
    return-void
.end method

.method public static serialize(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    array-length v5, p2

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    .line 358
    const-string v5, "Expected an object to serialize and a filename to write the serialization to"

    invoke-static {v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v5

    throw v5

    .line 362
    :cond_0
    const/4 v5, 0x0

    aget-object v2, p2, v5

    .line 363
    .local v2, "obj":Ljava/lang/Object;
    const/4 v5, 0x1

    aget-object v5, p2, v5

    invoke-static {v5}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 364
    .local v0, "filename":Ljava/lang/String;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 365
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 366
    .local v4, "scope":Lorg/mozilla/javascript/Scriptable;
    new-instance v3, Lorg/mozilla/javascript/serialize/ScriptableOutputStream;

    invoke-direct {v3, v1, v4}, Lorg/mozilla/javascript/serialize/ScriptableOutputStream;-><init>(Ljava/io/OutputStream;Lorg/mozilla/javascript/Scriptable;)V

    .line 367
    .local v3, "out":Lorg/mozilla/javascript/serialize/ScriptableOutputStream;
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/serialize/ScriptableOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 368
    invoke-virtual {v3}, Lorg/mozilla/javascript/serialize/ScriptableOutputStream;->close()V

    .line 369
    return-void
.end method

.method public static spawn(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 569
    invoke-interface {p3}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 571
    .local v2, "scope":Lorg/mozilla/javascript/Scriptable;
    array-length v4, p2

    if-eqz v4, :cond_2

    aget-object v4, p2, v5

    instance-of v4, v4, Lorg/mozilla/javascript/Function;

    if-eqz v4, :cond_2

    .line 572
    const/4 v0, 0x0

    .line 573
    .local v0, "newArgs":[Ljava/lang/Object;
    array-length v4, p2

    if-le v4, v6, :cond_0

    aget-object v4, p2, v6

    instance-of v4, v4, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_0

    .line 574
    aget-object v4, p2, v6

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Context;->getElements(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    .line 576
    :cond_0
    if-nez v0, :cond_1

    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 577
    :cond_1
    new-instance v1, Lorg/mozilla/javascript/tools/shell/Runner;

    aget-object v4, p2, v5

    check-cast v4, Lorg/mozilla/javascript/Function;

    invoke-direct {v1, v2, v4, v0}, Lorg/mozilla/javascript/tools/shell/Runner;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Function;[Ljava/lang/Object;)V

    .line 583
    .end local v0    # "newArgs":[Ljava/lang/Object;
    .local v1, "runner":Lorg/mozilla/javascript/tools/shell/Runner;
    :goto_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getFactory()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v4

    iput-object v4, v1, Lorg/mozilla/javascript/tools/shell/Runner;->factory:Lorg/mozilla/javascript/ContextFactory;

    .line 584
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 585
    .local v3, "thread":Ljava/lang/Thread;
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 586
    return-object v3

    .line 578
    .end local v1    # "runner":Lorg/mozilla/javascript/tools/shell/Runner;
    .end local v3    # "thread":Ljava/lang/Thread;
    :cond_2
    array-length v4, p2

    if-eqz v4, :cond_3

    aget-object v4, p2, v5

    instance-of v4, v4, Lorg/mozilla/javascript/Script;

    if-eqz v4, :cond_3

    .line 579
    new-instance v1, Lorg/mozilla/javascript/tools/shell/Runner;

    aget-object v4, p2, v5

    check-cast v4, Lorg/mozilla/javascript/Script;

    invoke-direct {v1, v2, v4}, Lorg/mozilla/javascript/tools/shell/Runner;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Script;)V

    .restart local v1    # "runner":Lorg/mozilla/javascript/tools/shell/Runner;
    goto :goto_0

    .line 581
    .end local v1    # "runner":Lorg/mozilla/javascript/tools/shell/Runner;
    :cond_3
    const-string v4, "msg.spawn.args"

    invoke-static {v4}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method public static sync(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    const/4 v2, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 613
    array-length v1, p2

    if-lt v1, v3, :cond_1

    array-length v1, p2

    if-gt v1, v2, :cond_1

    aget-object v1, p2, v4

    instance-of v1, v1, Lorg/mozilla/javascript/Function;

    if-eqz v1, :cond_1

    .line 614
    const/4 v0, 0x0

    .line 615
    .local v0, "syncObject":Ljava/lang/Object;
    array-length v1, p2

    if-ne v1, v2, :cond_0

    aget-object v1, p2, v3

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v1, v2, :cond_0

    .line 616
    aget-object v0, p2, v3

    .line 618
    .end local v0    # "syncObject":Ljava/lang/Object;
    :cond_0
    new-instance v2, Lorg/mozilla/javascript/Synchronizer;

    aget-object v1, p2, v4

    check-cast v1, Lorg/mozilla/javascript/Function;

    invoke-direct {v2, v1, v0}, Lorg/mozilla/javascript/Synchronizer;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    return-object v2

    .line 621
    :cond_1
    const-string v1, "msg.sync.args"

    invoke-static {v1}, Lorg/mozilla/javascript/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private static toInputStream(Ljava/lang/Object;)Ljava/io/InputStream;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1050
    const/4 v0, 0x0

    .line 1051
    .local v0, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 1052
    .local v1, "s":Ljava/lang/String;
    instance-of v3, p0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v3, :cond_0

    move-object v3, p0

    .line 1053
    check-cast v3, Lorg/mozilla/javascript/Wrapper;

    invoke-interface {v3}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 1054
    .local v2, "unwrapped":Ljava/lang/Object;
    instance-of v3, v2, Ljava/io/InputStream;

    if-eqz v3, :cond_3

    move-object v0, v2

    .line 1055
    check-cast v0, Ljava/io/InputStream;

    .line 1064
    .end local v2    # "unwrapped":Ljava/lang/Object;
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 1065
    if-nez v1, :cond_1

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1066
    :cond_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .end local v0    # "is":Ljava/io/InputStream;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1068
    .restart local v0    # "is":Ljava/io/InputStream;
    :cond_2
    return-object v0

    .line 1056
    .restart local v2    # "unwrapped":Ljava/lang/Object;
    :cond_3
    instance-of v3, v2, [B

    if-eqz v3, :cond_4

    .line 1057
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .end local v0    # "is":Ljava/io/InputStream;
    check-cast v2, [B

    .end local v2    # "unwrapped":Ljava/lang/Object;
    check-cast v2, [B

    invoke-direct {v0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .restart local v0    # "is":Ljava/io/InputStream;
    goto :goto_0

    .line 1058
    .restart local v2    # "unwrapped":Ljava/lang/Object;
    :cond_4
    instance-of v3, v2, Ljava/io/Reader;

    if-eqz v3, :cond_5

    .line 1059
    check-cast v2, Ljava/io/Reader;

    .end local v2    # "unwrapped":Ljava/lang/Object;
    invoke-static {v2}, Lorg/mozilla/javascript/tools/shell/Global;->readReader(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1060
    .restart local v2    # "unwrapped":Ljava/lang/Object;
    :cond_5
    instance-of v3, v2, [C

    if-eqz v3, :cond_0

    .line 1061
    new-instance v1, Ljava/lang/String;

    .end local v1    # "s":Ljava/lang/String;
    check-cast v2, [C

    .end local v2    # "unwrapped":Ljava/lang/Object;
    check-cast v2, [C

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0
.end method

.method private static toOutputStream(Ljava/lang/Object;)Ljava/io/OutputStream;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 1072
    const/4 v0, 0x0

    .line 1073
    .local v0, "os":Ljava/io/OutputStream;
    instance-of v2, p0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v2, :cond_0

    .line 1074
    check-cast p0, Lorg/mozilla/javascript/Wrapper;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 1075
    .local v1, "unwrapped":Ljava/lang/Object;
    instance-of v2, v1, Ljava/io/OutputStream;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 1076
    check-cast v0, Ljava/io/OutputStream;

    .line 1079
    .end local v1    # "unwrapped":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method public static toint32(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 866
    array-length v1, p2

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    aget-object v0, p2, v1

    .line 867
    .local v0, "arg":Ljava/lang/Object;
    :goto_0
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 869
    .end local v0    # "arg":Ljava/lang/Object;
    :goto_1
    return-object v0

    .line 866
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 869
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_1
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_1
.end method

.method public static version(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)D
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 247
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v4

    int-to-double v2, v4

    .line 248
    .local v2, "result":D
    array-length v4, p2

    if-lez v4, :cond_0

    .line 249
    const/4 v4, 0x0

    aget-object v4, p2, v4

    invoke-static {v4}, Lorg/mozilla/javascript/Context;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 250
    .local v0, "d":D
    double-to-int v4, v0

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Context;->setLanguageVersion(I)V

    .line 252
    .end local v0    # "d":D
    :cond_0
    return-wide v2
.end method

.method public static write(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 201
    const/4 v0, 0x0

    invoke-static {p2, p3, v0}, Lorg/mozilla/javascript/tools/shell/Global;->doPrint([Ljava/lang/Object;Lorg/mozilla/javascript/Function;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getConsole(Ljava/nio/charset/Charset;)Lorg/mozilla/javascript/tools/shell/ShellConsole;
    .locals 2
    .param p1, "cs"    # Ljava/nio/charset/Charset;

    .prologue
    .line 882
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/shell/Global;->loadJLine(Ljava/nio/charset/Charset;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 883
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/Global;->getIn()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->getConsole(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/nio/charset/Charset;)Lorg/mozilla/javascript/tools/shell/ShellConsole;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    .line 885
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    return-object v0
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 910
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->errStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->errStream:Ljava/io/PrintStream;

    goto :goto_0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 889
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->attemptedJLineLoad:Z

    if-nez v0, :cond_0

    .line 890
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/shell/Global;->loadJLine(Ljava/nio/charset/Charset;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 891
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->getIn()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->inStream:Ljava/io/InputStream;

    .line 894
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    sget-object v0, Ljava/lang/System;->in:Ljava/io/InputStream;

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->inStream:Ljava/io/InputStream;

    goto :goto_0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 902
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->outStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->outStream:Ljava/io/PrintStream;

    goto :goto_0
.end method

.method public getPrompts(Lorg/mozilla/javascript/Context;)[Ljava/lang/String;
    .locals 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 389
    const-string v4, "prompts"

    invoke-static {p0, v4}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 390
    const-string v4, "prompts"

    invoke-static {p0, v4}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 392
    .local v2, "promptsJS":Ljava/lang/Object;
    instance-of v4, v2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_2

    move-object v3, v2

    .line 393
    check-cast v3, Lorg/mozilla/javascript/Scriptable;

    .line 394
    .local v3, "s":Lorg/mozilla/javascript/Scriptable;
    invoke-static {v3, v6}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-static {v3, v7}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 397
    invoke-static {v3, v6}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 398
    .local v0, "elem0":Ljava/lang/Object;
    instance-of v4, v0, Lorg/mozilla/javascript/Function;

    if-eqz v4, :cond_0

    .line 399
    check-cast v0, Lorg/mozilla/javascript/Function;

    .end local v0    # "elem0":Ljava/lang/Object;
    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {v0, p1, p0, v3, v4}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 402
    .restart local v0    # "elem0":Ljava/lang/Object;
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    .line 403
    invoke-static {v3, v7}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v1

    .line 404
    .local v1, "elem1":Ljava/lang/Object;
    instance-of v4, v1, Lorg/mozilla/javascript/Function;

    if-eqz v4, :cond_1

    .line 405
    check-cast v1, Lorg/mozilla/javascript/Function;

    .end local v1    # "elem1":Ljava/lang/Object;
    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {v1, p1, p0, v3, v4}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 408
    .restart local v1    # "elem1":Ljava/lang/Object;
    :cond_1
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    invoke-static {v1}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    .line 412
    .end local v0    # "elem0":Ljava/lang/Object;
    .end local v1    # "elem1":Ljava/lang/Object;
    .end local v2    # "promptsJS":Ljava/lang/Object;
    .end local v3    # "s":Lorg/mozilla/javascript/Scriptable;
    :cond_2
    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    return-object v4
.end method

.method public init(Lorg/mozilla/javascript/Context;)V
    .locals 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 90
    iget-boolean v2, p0, Lorg/mozilla/javascript/tools/shell/Global;->sealedStdLib:Z

    invoke-virtual {p0, p1, v2}, Lorg/mozilla/javascript/tools/shell/Global;->initStandardObjects(Lorg/mozilla/javascript/Context;Z)V

    .line 91
    const/16 v2, 0x14

    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "defineClass"

    aput-object v2, v1, v5

    const-string v2, "deserialize"

    aput-object v2, v1, v6

    const-string v2, "doctest"

    aput-object v2, v1, v4

    const/4 v2, 0x3

    const-string v3, "gc"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "help"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "load"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "loadClass"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "print"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "quit"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "readline"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "readFile"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "readUrl"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "runCommand"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "seal"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "serialize"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "spawn"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "sync"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "toint32"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "version"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "write"

    aput-object v3, v1, v2

    .line 113
    .local v1, "names":[Ljava/lang/String;
    const-class v2, Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {p0, v1, v2, v4}, Lorg/mozilla/javascript/tools/shell/Global;->defineFunctionProperties([Ljava/lang/String;Ljava/lang/Class;I)V

    .line 118
    invoke-static {p0}, Lorg/mozilla/javascript/tools/shell/Environment;->defineClass(Lorg/mozilla/javascript/ScriptableObject;)V

    .line 119
    new-instance v0, Lorg/mozilla/javascript/tools/shell/Environment;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/shell/Environment;-><init>(Lorg/mozilla/javascript/ScriptableObject;)V

    .line 120
    .local v0, "environment":Lorg/mozilla/javascript/tools/shell/Environment;
    const-string v2, "environment"

    invoke-virtual {p0, v2, v0, v4}, Lorg/mozilla/javascript/tools/shell/Global;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 123
    invoke-virtual {p1, p0, v5}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/NativeArray;

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/Global;->history:Lorg/mozilla/javascript/NativeArray;

    .line 124
    const-string v2, "history"

    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/Global;->history:Lorg/mozilla/javascript/NativeArray;

    invoke-virtual {p0, v2, v3, v4}, Lorg/mozilla/javascript/tools/shell/Global;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 126
    iput-boolean v6, p0, Lorg/mozilla/javascript/tools/shell/Global;->initialized:Z

    .line 127
    return-void
.end method

.method public init(Lorg/mozilla/javascript/ContextFactory;)V
    .locals 1
    .param p1, "factory"    # Lorg/mozilla/javascript/ContextFactory;

    .prologue
    .line 77
    new-instance v0, Lorg/mozilla/javascript/tools/shell/Global$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/shell/Global$1;-><init>(Lorg/mozilla/javascript/tools/shell/Global;)V

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/ContextFactory;->call(Lorg/mozilla/javascript/ContextAction;)Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public initQuitAction(Lorg/mozilla/javascript/tools/shell/QuitAction;)V
    .locals 2
    .param p1, "quitAction"    # Lorg/mozilla/javascript/tools/shell/QuitAction;

    .prologue
    .line 67
    if-nez p1, :cond_0

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "quitAction is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->quitAction:Lorg/mozilla/javascript/tools/shell/QuitAction;

    if-eqz v0, :cond_1

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The method is once-call."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/Global;->quitAction:Lorg/mozilla/javascript/tools/shell/QuitAction;

    .line 73
    return-void
.end method

.method public installRequire(Lorg/mozilla/javascript/Context;Ljava/util/List;Z)Lorg/mozilla/javascript/commonjs/module/Require;
    .locals 11
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "sandboxed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lorg/mozilla/javascript/commonjs/module/Require;"
        }
    .end annotation

    .prologue
    .line 131
    .local p2, "modulePath":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;

    invoke-direct {v2}, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;-><init>()V

    .line 132
    .local v2, "rb":Lorg/mozilla/javascript/commonjs/module/RequireBuilder;
    invoke-virtual {v2, p3}, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->setSandboxed(Z)Lorg/mozilla/javascript/commonjs/module/RequireBuilder;

    .line 133
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .local v6, "uris":Ljava/util/List;, "Ljava/util/List<Ljava/net/URI;>;"
    if-eqz p2, :cond_0

    .line 135
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 137
    .local v1, "path":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 138
    .local v4, "uri":Ljava/net/URI;
    invoke-virtual {v4}, Ljava/net/URI;->isAbsolute()Z

    move-result v8

    if-nez v8, :cond_2

    .line 140
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    move-object v5, v4

    .line 142
    .end local v4    # "uri":Ljava/net/URI;
    .local v5, "uri":Ljava/net/URI;
    :goto_1
    invoke-virtual {v5}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 145
    new-instance v4, Ljava/net/URI;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 147
    .end local v5    # "uri":Ljava/net/URI;
    .restart local v4    # "uri":Ljava/net/URI;
    :goto_2
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 148
    .end local v4    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v7

    .line 149
    .local v7, "usx":Ljava/net/URISyntaxException;
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 153
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "path":Ljava/lang/String;
    .end local v7    # "usx":Ljava/net/URISyntaxException;
    :cond_0
    new-instance v8, Lorg/mozilla/javascript/commonjs/module/provider/SoftCachingModuleScriptProvider;

    new-instance v9, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;

    const/4 v10, 0x0

    invoke-direct {v9, v6, v10}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;-><init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    invoke-direct {v8, v9}, Lorg/mozilla/javascript/commonjs/module/provider/SoftCachingModuleScriptProvider;-><init>(Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProvider;)V

    invoke-virtual {v2, v8}, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->setModuleScriptProvider(Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;)Lorg/mozilla/javascript/commonjs/module/RequireBuilder;

    .line 156
    invoke-virtual {v2, p1, p0}, Lorg/mozilla/javascript/commonjs/module/RequireBuilder;->createRequire(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/commonjs/module/Require;

    move-result-object v3

    .line 157
    .local v3, "require":Lorg/mozilla/javascript/commonjs/module/Require;
    invoke-virtual {v3, p0}, Lorg/mozilla/javascript/commonjs/module/Require;->install(Lorg/mozilla/javascript/Scriptable;)V

    .line 158
    return-object v3

    .end local v3    # "require":Lorg/mozilla/javascript/commonjs/module/Require;
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "path":Ljava/lang/String;
    .restart local v5    # "uri":Ljava/net/URI;
    :cond_1
    move-object v4, v5

    .end local v5    # "uri":Ljava/net/URI;
    .restart local v4    # "uri":Ljava/net/URI;
    goto :goto_2

    :cond_2
    move-object v5, v4

    .end local v4    # "uri":Ljava/net/URI;
    .restart local v5    # "uri":Ljava/net/URI;
    goto :goto_1
.end method

.method public isInitialized()Z
    .locals 1

    .prologue
    .line 59
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/Global;->initialized:Z

    return v0
.end method

.method public runDoctest(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;I)I
    .locals 23
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "session"    # Ljava/lang/String;
    .param p4, "sourceName"    # Ljava/lang/String;
    .param p5, "lineNumber"    # I

    .prologue
    .line 433
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/mozilla/javascript/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    .line 434
    const-string v2, "\r\n?|\n"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 435
    .local v12, "lines":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    .line 436
    .local v15, "prompt0":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/tools/shell/Global;->prompts:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    .line 437
    .local v16, "prompt1":Ljava/lang/String;
    const/16 v22, 0x0

    .line 438
    .local v22, "testCount":I
    const/4 v11, 0x0

    .line 439
    .local v11, "i":I
    :goto_0
    array-length v2, v12

    if-ge v11, v2, :cond_0

    aget-object v2, v12, v11

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 440
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 442
    :cond_0
    array-length v2, v12

    if-ge v11, v2, :cond_6

    .line 443
    aget-object v2, v12, v11

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 444
    .local v4, "inputString":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 445
    add-int/lit8 v11, v11, 0x1

    .line 446
    :goto_1
    array-length v2, v12

    if-ge v11, v2, :cond_1

    aget-object v2, v12, v11

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 447
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v12, v11

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 448
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 449
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 451
    :cond_1
    const-string v10, ""

    .line 452
    .local v10, "expectedString":Ljava/lang/String;
    :goto_2
    array-length v2, v12

    if-ge v11, v2, :cond_2

    aget-object v2, v12, v11

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 455
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v12, v11

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 456
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 458
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v21

    .line 459
    .local v21, "savedOut":Ljava/io/PrintStream;
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v19

    .line 460
    .local v19, "savedErr":Ljava/io/PrintStream;
    new-instance v14, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v14}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 461
    .local v14, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 462
    .local v9, "err":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/PrintStream;

    invoke-direct {v2, v14}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 463
    new-instance v2, Ljava/io/PrintStream;

    invoke-direct {v2, v9}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 464
    const-string v18, ""

    .line 465
    .local v18, "resultString":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v20

    .line 466
    .local v20, "savedErrorReporter":Lorg/mozilla/javascript/ErrorReporter;
    new-instance v2, Lorg/mozilla/javascript/tools/ToolErrorReporter;

    const/4 v3, 0x0

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/Context;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    .line 468
    add-int/lit8 v22, v22, 0x1

    .line 469
    :try_start_0
    const-string v5, "doctest input"

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-virtual/range {v2 .. v7}, Lorg/mozilla/javascript/Context;->evaluateString(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    .line 471
    .local v17, "result":Ljava/lang/Object;
    invoke-static {}, Lorg/mozilla/javascript/Context;->getUndefinedValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v17

    if-eq v0, v2, :cond_4

    move-object/from16 v0, v17

    instance-of v2, v0, Lorg/mozilla/javascript/Function;

    if-eqz v2, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "function"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 475
    :cond_3
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v18

    .line 480
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 481
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 482
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    .line 483
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v14}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 485
    .end local v17    # "result":Ljava/lang/Object;
    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v10, v1}, Lorg/mozilla/javascript/tools/shell/Global;->doctestOutputMatches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 486
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doctest failure running:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "expected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "actual: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 490
    .local v13, "message":Ljava/lang/String;
    if-eqz p4, :cond_5

    .line 491
    add-int v2, p5, v11

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v13, v0, v2, v3, v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 477
    .end local v13    # "message":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 478
    .local v8, "e":Lorg/mozilla/javascript/RhinoException;
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v2

    invoke-static {v2, v8}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 480
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 481
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 482
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    .line 483
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v14}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 484
    goto/16 :goto_3

    .line 480
    .end local v8    # "e":Lorg/mozilla/javascript/RhinoException;
    :catchall_0
    move-exception v2

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 481
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 482
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    .line 483
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v14}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    throw v2

    .line 494
    .restart local v13    # "message":Ljava/lang/String;
    :cond_5
    invoke-static {v13}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 497
    .end local v4    # "inputString":Ljava/lang/String;
    .end local v9    # "err":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "expectedString":Ljava/lang/String;
    .end local v13    # "message":Ljava/lang/String;
    .end local v14    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "resultString":Ljava/lang/String;
    .end local v19    # "savedErr":Ljava/io/PrintStream;
    .end local v20    # "savedErrorReporter":Lorg/mozilla/javascript/ErrorReporter;
    .end local v21    # "savedOut":Ljava/io/PrintStream;
    :cond_6
    return v22
.end method

.method public setErr(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "err"    # Ljava/io/PrintStream;

    .prologue
    .line 914
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/Global;->errStream:Ljava/io/PrintStream;

    .line 915
    return-void
.end method

.method public setIn(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 898
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/Global;->inStream:Ljava/io/InputStream;

    .line 899
    return-void
.end method

.method public setOut(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 906
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/Global;->outStream:Ljava/io/PrintStream;

    .line 907
    return-void
.end method

.method public setSealedStdLib(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 919
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/shell/Global;->sealedStdLib:Z

    .line 920
    return-void
.end method
