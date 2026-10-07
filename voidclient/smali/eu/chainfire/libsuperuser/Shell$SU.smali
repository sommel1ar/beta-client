.class public Leu/chainfire/libsuperuser/Shell$SU;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Leu/chainfire/libsuperuser/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SU"
.end annotation


# static fields
.field private static isSELinuxEnforcing:Ljava/lang/Boolean;

.field private static suVersion:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 281
    sput-object v2, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 282
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v2, v0, v1

    sput-object v0, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static available()Z
    .locals 2

    .prologue
    .line 331
    sget-object v1, Leu/chainfire/libsuperuser/Shell;->availableTestCommands:[Ljava/lang/String;

    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$SU;->run([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 332
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x1

    invoke-static {v0, v1}, Leu/chainfire/libsuperuser/Shell;->parseAvailableResult(Ljava/util/List;Z)Z

    move-result v1

    return v1
.end method

.method public static declared-synchronized clearCachedResults()V
    .locals 4

    .prologue
    .line 528
    const-class v1, Leu/chainfire/libsuperuser/Shell$SU;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    sput-object v0, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 529
    sget-object v0, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v0, v2

    .line 530
    sget-object v0, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 531
    monitor-exit v1

    return-void

    .line 528
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized isSELinuxEnforcing()Z
    .locals 11

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 472
    const-class v9, Leu/chainfire/libsuperuser/Shell$SU;

    monitor-enter v9

    :try_start_0
    sget-object v6, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    if-nez v6, :cond_3

    .line 473
    const/4 v1, 0x0

    .line 477
    .local v1, "enforcing":Ljava/lang/Boolean;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x11

    if-lt v6, v10, :cond_1

    .line 479
    new-instance v2, Ljava/io/File;

    const-string v6, "/sys/fs/selinux/enforce"

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 480
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v6

    if-eqz v6, :cond_0

    .line 482
    :try_start_1
    new-instance v3, Ljava/io/FileInputStream;

    const-string v6, "/sys/fs/selinux/enforce"

    invoke-direct {v3, v6}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 484
    .local v3, "is":Ljava/io/InputStream;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v6

    const/16 v10, 0x31

    if-ne v6, v10, :cond_4

    move v6, v7

    :goto_0
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v1

    .line 486
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 495
    .end local v3    # "is":Ljava/io/InputStream;
    :cond_0
    :goto_1
    if-nez v1, :cond_1

    .line 497
    :try_start_4
    const-string v6, "android.os.SELinux"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 498
    .local v5, "seLinux":Ljava/lang/Class;
    const-string v6, "isSELinuxEnforced"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 499
    .local v4, "isSELinuxEnforced":Ljava/lang/reflect/Method;
    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v4, v6, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "enforcing":Ljava/lang/Boolean;
    check-cast v1, Ljava/lang/Boolean;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 507
    .end local v2    # "f":Ljava/io/File;
    .end local v4    # "isSELinuxEnforced":Ljava/lang/reflect/Method;
    .end local v5    # "seLinux":Ljava/lang/Class;
    .restart local v1    # "enforcing":Ljava/lang/Boolean;
    :cond_1
    :goto_2
    if-nez v1, :cond_2

    .line 508
    const/4 v6, 0x0

    :try_start_5
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 511
    :cond_2
    sput-object v1, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    .line 513
    :cond_3
    sget-object v6, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v6

    monitor-exit v9

    return v6

    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "is":Ljava/io/InputStream;
    :cond_4
    move v6, v8

    .line 484
    goto :goto_0

    .line 486
    :catchall_0
    move-exception v6

    :try_start_6
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v6
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 488
    .end local v3    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v6

    goto :goto_1

    .line 500
    .end local v1    # "enforcing":Ljava/lang/Boolean;
    :catch_1
    move-exception v0

    .line 502
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x13

    if-lt v6, v10, :cond_5

    move v6, v7

    :goto_3
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move-result-object v1

    .restart local v1    # "enforcing":Ljava/lang/Boolean;
    goto :goto_2

    .end local v1    # "enforcing":Ljava/lang/Boolean;
    :cond_5
    move v6, v8

    goto :goto_3

    .line 472
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1
    move-exception v6

    monitor-exit v9

    throw v6
.end method

.method public static isSU(Ljava/lang/String;)Z
    .locals 2
    .param p0, "shell"    # Ljava/lang/String;

    .prologue
    .line 401
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 402
    .local v0, "pos":I
    if-ltz v0, :cond_0

    .line 403
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 407
    :cond_0
    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 408
    if-ltz v0, :cond_1

    .line 409
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 412
    :cond_1
    const-string v1, "su"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static run(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p0, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 294
    const-string v0, "su"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    aput-object p0, v1, v3

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static run(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 307
    .local p0, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "su"

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static run([Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p0, "commands"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 318
    const-string v0, "su"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, p0, v1, v2}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static shell(ILjava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "uid"    # I
    .param p1, "context"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 426
    const-string v2, "su"

    .line 428
    .local v2, "shell":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-static {}, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 429
    invoke-static {v6}, Leu/chainfire/libsuperuser/Shell$SU;->version(Z)Ljava/lang/String;

    move-result-object v0

    .line 430
    .local v0, "display":Ljava/lang/String;
    invoke-static {v7}, Leu/chainfire/libsuperuser/Shell$SU;->version(Z)Ljava/lang/String;

    move-result-object v1

    .line 434
    .local v1, "internal":Ljava/lang/String;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const-string v3, "SUPERSU"

    .line 436
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 437
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xbe

    if-lt v3, v4, :cond_0

    .line 438
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "%s --context %s"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v2, v5, v6

    aput-object p1, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 444
    .end local v0    # "display":Ljava/lang/String;
    .end local v1    # "internal":Ljava/lang/String;
    :cond_0
    if-lez p0, :cond_1

    .line 445
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "%s %d"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v2, v5, v6

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 448
    :cond_1
    return-object v2
.end method

.method public static shellMountMaster()Ljava/lang/String;
    .locals 2

    .prologue
    .line 459
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 460
    const-string v0, "su --mount-master"

    .line 462
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "su"

    goto :goto_0
.end method

.method public static declared-synchronized version(Z)Ljava/lang/String;
    .locals 9
    .param p0, "internal"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v0, 0x0

    .line 357
    const-class v5, Leu/chainfire/libsuperuser/Shell$SU;

    monitor-enter v5

    if-eqz p0, :cond_3

    .line 358
    .local v0, "idx":I
    :goto_0
    :try_start_0
    sget-object v4, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    aget-object v4, v4, v0

    if-nez v4, :cond_2

    .line 359
    const/4 v3, 0x0

    .line 361
    .local v3, "version":Ljava/lang/String;
    if-eqz p0, :cond_4

    const-string v4, "su -V"

    :goto_1
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "exit"

    aput-object v8, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v4, v6, v7, v8}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v2

    .line 368
    .local v2, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_1

    .line 369
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 370
    .local v1, "line":Ljava/lang/String;
    if-nez p0, :cond_5

    .line 371
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 372
    move-object v3, v1

    .line 388
    .end local v1    # "line":Ljava/lang/String;
    :cond_1
    :goto_3
    sget-object v4, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    aput-object v3, v4, v0

    .line 390
    .end local v2    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "version":Ljava/lang/String;
    :cond_2
    sget-object v4, Leu/chainfire/libsuperuser/Shell$SU;->suVersion:[Ljava/lang/String;

    aget-object v4, v4, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v5

    return-object v4

    .end local v0    # "idx":I
    :cond_3
    move v0, v4

    .line 357
    goto :goto_0

    .line 361
    .restart local v0    # "idx":I
    .restart local v3    # "version":Ljava/lang/String;
    :cond_4
    :try_start_1
    const-string v4, "su -v"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 377
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v2    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    :try_start_2
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v6

    if-lez v6, :cond_0

    .line 378
    move-object v3, v1

    goto :goto_3

    .line 381
    :catch_0
    move-exception v6

    goto :goto_2

    .line 357
    .end local v1    # "line":Ljava/lang/String;
    .end local v2    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "version":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4
.end method
