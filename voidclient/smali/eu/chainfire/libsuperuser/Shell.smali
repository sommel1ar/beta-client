.class public Leu/chainfire/libsuperuser/Shell;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Leu/chainfire/libsuperuser/Shell$Interactive;,
        Leu/chainfire/libsuperuser/Shell$Builder;,
        Leu/chainfire/libsuperuser/Shell$Command;,
        Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;,
        Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;,
        Leu/chainfire/libsuperuser/Shell$OnResult;,
        Leu/chainfire/libsuperuser/Shell$SU;,
        Leu/chainfire/libsuperuser/Shell$SH;
    }
.end annotation


# static fields
.field protected static availableTestCommands:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 203
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "echo -BOC-"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "id"

    aput-object v2, v0, v1

    sput-object v0, Leu/chainfire/libsuperuser/Shell;->availableTestCommands:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static parseAvailableResult(Ljava/util/List;Z)Z
    .locals 5
    .param p1, "checkForRoot"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)Z"
        }
    .end annotation

    .prologue
    .local p0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 217
    if-nez p0, :cond_1

    .line 235
    :cond_0
    :goto_0
    return v2

    .line 221
    :cond_1
    const/4 v0, 0x0

    .line 223
    .local v0, "echo_seen":Z
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 224
    .local v1, "line":Ljava/lang/String;
    const-string v4, "uid="

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 226
    if-eqz p1, :cond_3

    const-string v3, "uid=0"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_3
    const/4 v2, 0x1

    goto :goto_0

    .line 227
    :cond_4
    const-string v4, "-BOC-"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 231
    const/4 v0, 0x1

    goto :goto_1

    .end local v1    # "line":Ljava/lang/String;
    :cond_5
    move v2, v0

    .line 235
    goto :goto_0
.end method

.method public static run(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;
    .locals 1
    .param p0, "shell"    # Ljava/lang/String;
    .param p1, "commands"    # [Ljava/lang/String;
    .param p2, "wantSTDERR"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;
    .locals 20
    .param p0, "shell"    # Ljava/lang/String;
    .param p1, "commands"    # [Ljava/lang/String;
    .param p2, "environment"    # [Ljava/lang/String;
    .param p3, "wantSTDERR"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    sget-object v15, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    .line 105
    .local v12, "shellUpper":Ljava/lang/String;
    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v15

    if-eqz v15, :cond_0

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->onMainThread()Z

    move-result v15

    if-eqz v15, :cond_0

    .line 110
    const-string v15, "Application attempted to run a shell command from the main thread"

    invoke-static {v15}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 111
    new-instance v15, Leu/chainfire/libsuperuser/ShellOnMainThreadException;

    const-string v16, "Application attempted to run a shell command from the main thread"

    invoke-direct/range {v15 .. v16}, Leu/chainfire/libsuperuser/ShellOnMainThreadException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 113
    :cond_0
    const-string v15, "[%s%%] START"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v12, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Leu/chainfire/libsuperuser/Debug;->logCommand(Ljava/lang/String;)V

    .line 115
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v15}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v11

    .line 119
    .local v11, "res":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p2, :cond_3

    .line 120
    :try_start_0
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 121
    .local v9, "newEnvironment":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Ljava/lang/System;->getenv()Ljava/util/Map;

    move-result-object v15

    invoke-interface {v9, v15}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 123
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v16, v0

    const/4 v15, 0x0

    :goto_0
    move/from16 v0, v16

    if-ge v15, v0, :cond_2

    aget-object v6, p2, v15

    .line 124
    .local v6, "entry":Ljava/lang/String;
    const-string v17, "="

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    .local v13, "split":I
    if-ltz v13, :cond_1

    .line 125
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v6, v0, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    add-int/lit8 v18, v13, 0x1

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :cond_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 128
    .end local v6    # "entry":Ljava/lang/String;
    .end local v13    # "split":I
    :cond_2
    const/4 v8, 0x0

    .line 129
    .local v8, "i":I
    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v15

    new-array v0, v15, [Ljava/lang/String;

    move-object/from16 p2, v0

    .line 130
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 131
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v17, "="

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    aput-object v15, p2, v8

    .line 132
    add-int/lit8 v8, v8, 0x1

    .line 133
    goto :goto_1

    .line 138
    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "i":I
    .end local v9    # "newEnvironment":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v15

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v15, v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v10

    .line 139
    .local v10, "process":Ljava/lang/Process;
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-virtual {v10}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v15

    invoke-direct {v3, v15}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 140
    .local v3, "STDIN":Ljava/io/DataOutputStream;
    new-instance v4, Leu/chainfire/libsuperuser/StreamGobbler;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "-"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v10}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v4, v15, v0, v11}, Leu/chainfire/libsuperuser/StreamGobbler;-><init>(Ljava/lang/String;Ljava/io/InputStream;Ljava/util/List;)V

    .line 142
    .local v4, "STDOUT":Leu/chainfire/libsuperuser/StreamGobbler;
    new-instance v2, Leu/chainfire/libsuperuser/StreamGobbler;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "*"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v10}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v17

    if-eqz p3, :cond_4

    move-object v15, v11

    :goto_2
    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v2, v0, v1, v15}, Leu/chainfire/libsuperuser/StreamGobbler;-><init>(Ljava/lang/String;Ljava/io/InputStream;Ljava/util/List;)V

    .line 146
    .local v2, "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    invoke-virtual {v4}, Leu/chainfire/libsuperuser/StreamGobbler;->start()V

    .line 147
    invoke-virtual {v2}, Leu/chainfire/libsuperuser/StreamGobbler;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2

    .line 149
    :try_start_1
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v16, v0

    const/4 v15, 0x0

    :goto_3
    move/from16 v0, v16

    if-ge v15, v0, :cond_5

    aget-object v14, p1, v15

    .line 150
    .local v14, "write":Ljava/lang/String;
    const-string v17, "[%s+] %s"

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v12, v18, v19

    const/16 v19, 0x1

    aput-object v14, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Leu/chainfire/libsuperuser/Debug;->logCommand(Ljava/lang/String;)V

    .line 151
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "\n"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const-string v18, "UTF-8"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 152
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V

    .line 149
    add-int/lit8 v15, v15, 0x1

    goto :goto_3

    .line 142
    .end local v2    # "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    .end local v14    # "write":Ljava/lang/String;
    :cond_4
    const/4 v15, 0x0

    goto :goto_2

    .line 154
    .restart local v2    # "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    :cond_5
    const-string v15, "exit\n"

    const-string v16, "UTF-8"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/io/DataOutputStream;->write([B)V

    .line 155
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2

    .line 171
    :cond_6
    :try_start_2
    invoke-virtual {v10}, Ljava/lang/Process;->waitFor()I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 179
    :try_start_3
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    .line 183
    :goto_4
    :try_start_4
    invoke-virtual {v4}, Leu/chainfire/libsuperuser/StreamGobbler;->join()V

    .line 184
    invoke-virtual {v2}, Leu/chainfire/libsuperuser/StreamGobbler;->join()V

    .line 185
    invoke-virtual {v10}, Ljava/lang/Process;->destroy()V

    .line 188
    invoke-static/range {p0 .. p0}, Leu/chainfire/libsuperuser/Shell$SU;->isSU(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-virtual {v10}, Ljava/lang/Process;->exitValue()I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2

    move-result v15

    const/16 v16, 0xff

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    .line 189
    const/4 v11, 0x0

    .line 199
    .end local v2    # "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    .end local v3    # "STDIN":Ljava/io/DataOutputStream;
    .end local v4    # "STDOUT":Leu/chainfire/libsuperuser/StreamGobbler;
    .end local v10    # "process":Ljava/lang/Process;
    :cond_7
    :goto_5
    const-string v15, "[%s%%] END"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget-object v18, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Leu/chainfire/libsuperuser/Debug;->logCommand(Ljava/lang/String;)V

    .line 200
    return-object v11

    .line 156
    .restart local v2    # "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    .restart local v3    # "STDIN":Ljava/io/DataOutputStream;
    .restart local v4    # "STDOUT":Leu/chainfire/libsuperuser/StreamGobbler;
    .restart local v10    # "process":Ljava/lang/Process;
    :catch_0
    move-exception v5

    .line 157
    .local v5, "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    const-string v16, "EPIPE"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_6

    .line 165
    throw v5
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2

    .line 191
    .end local v2    # "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    .end local v3    # "STDIN":Ljava/io/DataOutputStream;
    .end local v4    # "STDOUT":Leu/chainfire/libsuperuser/StreamGobbler;
    .end local v5    # "e":Ljava/io/IOException;
    .end local v10    # "process":Ljava/lang/Process;
    :catch_1
    move-exception v5

    .line 193
    .restart local v5    # "e":Ljava/io/IOException;
    const/4 v11, 0x0

    .line 197
    goto :goto_5

    .line 194
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 196
    .local v5, "e":Ljava/lang/InterruptedException;
    const/4 v11, 0x0

    goto :goto_5

    .line 180
    .end local v5    # "e":Ljava/lang/InterruptedException;
    .restart local v2    # "STDERR":Leu/chainfire/libsuperuser/StreamGobbler;
    .restart local v3    # "STDIN":Ljava/io/DataOutputStream;
    .restart local v4    # "STDOUT":Leu/chainfire/libsuperuser/StreamGobbler;
    .restart local v10    # "process":Ljava/lang/Process;
    :catch_3
    move-exception v15

    goto :goto_4
.end method
