.class public Lorg/mozilla/javascript/tools/shell/Main;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;,
        Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;,
        Lorg/mozilla/javascript/tools/shell/Main$IProxy;
    }
.end annotation


# static fields
.field private static final EXITCODE_FILE_NOT_FOUND:I = 0x4

.field private static final EXITCODE_RUNTIME_ERROR:I = 0x3

.field protected static errorReporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

.field protected static exitCode:I

.field static fileList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static global:Lorg/mozilla/javascript/tools/shell/Global;

.field static mainModule:Ljava/lang/String;

.field static modulePath:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static processStdin:Z

.field static require:Lorg/mozilla/javascript/commonjs/module/Require;

.field static sandboxed:Z

.field private static final scriptCache:Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;

.field private static securityImpl:Lorg/mozilla/javascript/tools/shell/SecurityProxy;

.field public static shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

.field static useRequire:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 55
    new-instance v0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-direct {v0}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    .line 57
    new-instance v0, Lorg/mozilla/javascript/tools/shell/Global;

    invoke-direct {v0}, Lorg/mozilla/javascript/tools/shell/Global;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    .line 59
    sput v1, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    .line 62
    const/4 v0, 0x1

    sput-boolean v0, Lorg/mozilla/javascript/tools/shell/Main;->processStdin:Z

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/tools/shell/Main;->fileList:Ljava/util/List;

    .line 66
    sput-boolean v1, Lorg/mozilla/javascript/tools/shell/Main;->sandboxed:Z

    .line 67
    sput-boolean v1, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    .line 70
    new-instance v0, Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;-><init>(I)V

    sput-object v0, Lorg/mozilla/javascript/tools/shell/Main;->scriptCache:Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;

    .line 73
    sget-object v0, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    new-instance v1, Lorg/mozilla/javascript/tools/shell/Main$IProxy;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/tools/shell/Main$IProxy;-><init>(I)V

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->initQuitAction(Lorg/mozilla/javascript/tools/shell/QuitAction;)V

    .line 74
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 717
    return-void
.end method

.method static evalInlineScript(Lorg/mozilla/javascript/Context;Ljava/lang/String;)V
    .locals 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scriptText"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x3

    .line 201
    :try_start_0
    const-string v4, "<command>"

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-virtual {p0, p1, v4, v5, v6}, Lorg/mozilla/javascript/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v3

    .line 202
    .local v3, "script":Lorg/mozilla/javascript/Script;
    if-eqz v3, :cond_0

    .line 203
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getShellScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-interface {v3, p0, v4}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_1

    .line 217
    .end local v3    # "script":Lorg/mozilla/javascript/Script;
    :cond_0
    :goto_0
    return-void

    .line 205
    :catch_0
    move-exception v2

    .line 206
    .local v2, "rex":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v4

    invoke-static {v4, v2}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V

    .line 208
    sput v7, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0

    .line 209
    .end local v2    # "rex":Lorg/mozilla/javascript/RhinoException;
    :catch_1
    move-exception v0

    .line 211
    .local v0, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 212
    const-string v4, "msg.uncaughtJSException"

    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 214
    .local v1, "msg":Ljava/lang/String;
    invoke-static {v1}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 215
    sput v7, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0
.end method

.method public static exec([Ljava/lang/String;)I
    .locals 5
    .param p0, "origArgs"    # [Ljava/lang/String;

    .prologue
    .line 147
    new-instance v2, Lorg/mozilla/javascript/tools/ToolErrorReporter;

    const/4 v3, 0x0

    sget-object v4, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/mozilla/javascript/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    sput-object v2, Lorg/mozilla/javascript/tools/shell/Main;->errorReporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    .line 148
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    sget-object v3, Lorg/mozilla/javascript/tools/shell/Main;->errorReporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)V

    .line 149
    invoke-static {p0}, Lorg/mozilla/javascript/tools/shell/Main;->processOptions([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "args":[Ljava/lang/String;
    sget v2, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    if-lez v2, :cond_0

    .line 151
    sget v2, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    .line 163
    :goto_0
    return v2

    .line 153
    :cond_0
    sget-boolean v2, Lorg/mozilla/javascript/tools/shell/Main;->processStdin:Z

    if-eqz v2, :cond_1

    .line 154
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->fileList:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    :cond_1
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    iget-boolean v2, v2, Lorg/mozilla/javascript/tools/shell/Global;->initialized:Z

    if-nez v2, :cond_2

    .line 157
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    sget-object v3, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/shell/Global;->init(Lorg/mozilla/javascript/ContextFactory;)V

    .line 159
    :cond_2
    new-instance v1, Lorg/mozilla/javascript/tools/shell/Main$IProxy;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/tools/shell/Main$IProxy;-><init>(I)V

    .line 160
    .local v1, "iproxy":Lorg/mozilla/javascript/tools/shell/Main$IProxy;
    iput-object v0, v1, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->args:[Ljava/lang/String;

    .line 161
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->call(Lorg/mozilla/javascript/ContextAction;)Ljava/lang/Object;

    .line 163
    sget v2, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0
.end method

.method private static getDigest(Ljava/lang/Object;)[B
    .locals 8
    .param p0, "source"    # Ljava/lang/Object;

    .prologue
    .line 606
    const/4 v2, 0x0

    .line 608
    .local v2, "digest":[B
    if-eqz p0, :cond_0

    .line 609
    instance-of v6, p0, Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 611
    :try_start_0
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    move-object v6, v0

    const-string v7, "UTF-8"

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 619
    .end local p0    # "source":Ljava/lang/Object;
    .local v1, "bytes":[B
    :goto_0
    :try_start_1
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 620
    .local v3, "md":Ljava/security/MessageDigest;
    invoke-virtual {v3, v1}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 627
    .end local v1    # "bytes":[B
    .end local v3    # "md":Ljava/security/MessageDigest;
    :cond_0
    return-object v2

    .line 612
    .restart local p0    # "source":Ljava/lang/Object;
    :catch_0
    move-exception v5

    .line 613
    .local v5, "ue":Ljava/io/UnsupportedEncodingException;
    check-cast p0, Ljava/lang/String;

    .end local p0    # "source":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 614
    .restart local v1    # "bytes":[B
    goto :goto_0

    .line 616
    .end local v1    # "bytes":[B
    .end local v5    # "ue":Ljava/io/UnsupportedEncodingException;
    .restart local p0    # "source":Ljava/lang/Object;
    :cond_1
    check-cast p0, [B

    .end local p0    # "source":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [B

    .restart local v1    # "bytes":[B
    goto :goto_0

    .line 621
    :catch_1
    move-exception v4

    .line 623
    .local v4, "nsa":Ljava/security/NoSuchAlgorithmException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public static getErr()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 686
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public static getGlobal()Lorg/mozilla/javascript/tools/shell/Global;
    .locals 1

    .prologue
    .line 221
    sget-object v0, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    return-object v0
.end method

.method public static getIn()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 670
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/Global;->getIn()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static getOut()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 678
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method static getScope(Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 229
    sget-boolean v2, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    if-eqz v2, :cond_2

    .line 233
    if-nez p0, :cond_0

    .line 235
    new-instance v2, Ljava/io/File;

    const-string v3, "user.dir"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    .line 249
    .local v0, "uri":Ljava/net/URI;
    :goto_0
    new-instance v2, Lorg/mozilla/javascript/commonjs/module/ModuleScope;

    sget-object v3, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v4}, Lorg/mozilla/javascript/commonjs/module/ModuleScope;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/net/URI;Ljava/net/URI;)V

    .line 251
    .end local v0    # "uri":Ljava/net/URI;
    :goto_1
    return-object v2

    .line 238
    :cond_0
    invoke-static {p0}, Lorg/mozilla/javascript/tools/SourceReader;->toUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 240
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v0    # "uri":Ljava/net/URI;
    goto :goto_0

    .line 241
    .end local v0    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v1

    .line 243
    .local v1, "x":Ljava/net/URISyntaxException;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    .line 244
    .restart local v0    # "uri":Ljava/net/URI;
    goto :goto_0

    .line 246
    .end local v0    # "uri":Ljava/net/URI;
    .end local v1    # "x":Ljava/net/URISyntaxException;
    :cond_1
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    .restart local v0    # "uri":Ljava/net/URI;
    goto :goto_0

    .line 251
    .end local v0    # "uri":Ljava/net/URI;
    :cond_2
    sget-object v2, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    goto :goto_1
.end method

.method static getShellScope()Lorg/mozilla/javascript/Scriptable;
    .locals 1

    .prologue
    .line 225
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/mozilla/javascript/tools/shell/Main;->getScope(Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method private static initJavaPolicySecuritySupport()V
    .locals 6

    .prologue
    .line 419
    :try_start_0
    const-string v3, "org.mozilla.javascript.tools.shell.JavaPolicySecurity"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 421
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/tools/shell/SecurityProxy;

    sput-object v3, Lorg/mozilla/javascript/tools/shell/Main;->securityImpl:Lorg/mozilla/javascript/tools/shell/SecurityProxy;

    .line 422
    sget-object v3, Lorg/mozilla/javascript/tools/shell/Main;->securityImpl:Lorg/mozilla/javascript/tools/shell/SecurityProxy;

    invoke-static {v3}, Lorg/mozilla/javascript/SecurityController;->initGlobal(Lorg/mozilla/javascript/SecurityController;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_3

    .line 423
    return-void

    .line 424
    :catch_0
    move-exception v1

    .line 425
    .local v1, "ex":Ljava/lang/ClassNotFoundException;
    move-object v2, v1

    .line 433
    .end local v1    # "ex":Ljava/lang/ClassNotFoundException;
    .local v2, "exObj":Ljava/lang/Throwable;
    :goto_0
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can not load security support: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v2}, Lorg/mozilla/javascript/Kit;->initCause(Ljava/lang/RuntimeException;Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 426
    .end local v2    # "exObj":Ljava/lang/Throwable;
    :catch_1
    move-exception v1

    .line 427
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    move-object v2, v1

    .line 432
    .restart local v2    # "exObj":Ljava/lang/Throwable;
    goto :goto_0

    .line 428
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    .end local v2    # "exObj":Ljava/lang/Throwable;
    :catch_2
    move-exception v1

    .line 429
    .local v1, "ex":Ljava/lang/InstantiationException;
    move-object v2, v1

    .line 432
    .restart local v2    # "exObj":Ljava/lang/Throwable;
    goto :goto_0

    .line 430
    .end local v1    # "ex":Ljava/lang/InstantiationException;
    .end local v2    # "exObj":Ljava/lang/Throwable;
    :catch_3
    move-exception v1

    .line 431
    .local v1, "ex":Ljava/lang/LinkageError;
    move-object v2, v1

    .restart local v2    # "exObj":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method private static loadCompiledScript(Lorg/mozilla/javascript/Context;Ljava/lang/String;[BLjava/lang/Object;)Lorg/mozilla/javascript/Script;
    .locals 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 634
    if-nez p2, :cond_0

    .line 635
    new-instance v7, Ljava/io/FileNotFoundException;

    invoke-direct {v7, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 639
    :cond_0
    const/16 v7, 0x2f

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 640
    .local v6, "nameStart":I
    if-gez v6, :cond_2

    .line 641
    const/4 v6, 0x0

    .line 645
    :goto_0
    const/16 v7, 0x2e

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 646
    .local v5, "nameEnd":I
    if-ge v5, v6, :cond_1

    .line 649
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 651
    :cond_1
    invoke-virtual {p1, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 653
    .local v4, "name":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-static {v7, p3}, Lorg/mozilla/javascript/SecurityController;->createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lorg/mozilla/javascript/GeneratedClassLoader;

    move-result-object v3

    .line 654
    .local v3, "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    invoke-interface {v3, v4, p2}, Lorg/mozilla/javascript/GeneratedClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v0

    .line 655
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v3, v0}, Lorg/mozilla/javascript/GeneratedClassLoader;->linkClass(Ljava/lang/Class;)V

    .line 656
    const-class v7, Lorg/mozilla/javascript/Script;

    invoke-virtual {v7, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 657
    const-string v7, "msg.must.implement.Script"

    invoke-static {v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v7

    throw v7
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 660
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    :catch_0
    move-exception v1

    .line 661
    .local v1, "iaex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 662
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 643
    .end local v1    # "iaex":Ljava/lang/IllegalAccessException;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "nameEnd":I
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 659
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "nameEnd":I
    :cond_3
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/mozilla/javascript/Script;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v7

    .line 663
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "loader":Lorg/mozilla/javascript/GeneratedClassLoader;
    :catch_1
    move-exception v2

    .line 664
    .local v2, "inex":Ljava/lang/InstantiationException;
    invoke-virtual {v2}, Ljava/lang/InstantiationException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 665
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 129
    :try_start_0
    const-string v2, "rhino.use_java_policy_security"

    invoke-static {v2}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->initJavaPolicySecuritySupport()V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :cond_0
    :goto_0
    invoke-static {p0}, Lorg/mozilla/javascript/tools/shell/Main;->exec([Ljava/lang/String;)I

    move-result v1

    .line 137
    .local v1, "result":I
    if-eqz v1, :cond_1

    .line 138
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 140
    :cond_1
    return-void

    .line 132
    .end local v1    # "result":I
    :catch_0
    move-exception v0

    .line 133
    .local v0, "ex":Ljava/lang/SecurityException;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v2}, Ljava/lang/SecurityException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public static processFile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 559
    sget-object v0, Lorg/mozilla/javascript/tools/shell/Main;->securityImpl:Lorg/mozilla/javascript/tools/shell/SecurityProxy;

    if-nez v0, :cond_0

    .line 560
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/tools/shell/Main;->processFileSecure(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 564
    :goto_0
    return-void

    .line 562
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/tools/shell/Main;->securityImpl:Lorg/mozilla/javascript/tools/shell/SecurityProxy;

    invoke-virtual {v0, p0, p1, p2}, Lorg/mozilla/javascript/tools/shell/SecurityProxy;->callProcessFileSecure(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static processFileNoThrow(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x3

    .line 537
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/tools/shell/Main;->processFile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_2

    .line 554
    :goto_0
    return-void

    .line 538
    :catch_0
    move-exception v1

    .line 539
    .local v1, "ioex":Ljava/io/IOException;
    const-string v4, "msg.couldnt.read.source"

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, p2, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 541
    const/4 v4, 0x4

    sput v4, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0

    .line 542
    .end local v1    # "ioex":Ljava/io/IOException;
    :catch_1
    move-exception v3

    .line 543
    .local v3, "rex":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v4

    invoke-static {v4, v3}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V

    .line 545
    sput v6, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0

    .line 546
    .end local v3    # "rex":Lorg/mozilla/javascript/RhinoException;
    :catch_2
    move-exception v0

    .line 548
    .local v0, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 549
    const-string v4, "msg.uncaughtJSException"

    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 551
    .local v2, "msg":Ljava/lang/String;
    invoke-static {v2}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 552
    sput v6, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0
.end method

.method static processFileSecure(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 11
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 570
    const-string v9, ".class"

    invoke-virtual {p2, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    .line 571
    .local v3, "isClass":Z
    if-nez v3, :cond_2

    const/4 v9, 0x1

    :goto_0
    invoke-static {p2, v9}, Lorg/mozilla/javascript/tools/shell/Main;->readFileOrUrl(Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v7

    .line 573
    .local v7, "source":Ljava/lang/Object;
    invoke-static {v7}, Lorg/mozilla/javascript/tools/shell/Main;->getDigest(Ljava/lang/Object;)[B

    move-result-object v1

    .line 574
    .local v1, "digest":[B
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getOptimizationLevel()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 575
    .local v4, "key":Ljava/lang/String;
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->scriptCache:Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;

    invoke-virtual {v9, v4, v1}, Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;->get(Ljava/lang/String;[B)Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;

    move-result-object v5

    .line 576
    .local v5, "ref":Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/mozilla/javascript/Script;

    move-object v6, v9

    .line 578
    .local v6, "script":Lorg/mozilla/javascript/Script;
    :goto_1
    if-nez v6, :cond_0

    .line 579
    if-eqz v3, :cond_4

    .line 580
    check-cast v7, [B

    .end local v7    # "source":Ljava/lang/Object;
    check-cast v7, [B

    invoke-static {p0, p2, v7, p3}, Lorg/mozilla/javascript/tools/shell/Main;->loadCompiledScript(Lorg/mozilla/javascript/Context;Ljava/lang/String;[BLjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v6

    .line 597
    :goto_2
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->scriptCache:Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;

    invoke-virtual {v9, v4, v1, v6}, Lorg/mozilla/javascript/tools/shell/Main$ScriptCache;->put(Ljava/lang/String;[BLorg/mozilla/javascript/Script;)V

    .line 600
    :cond_0
    if-eqz v6, :cond_1

    .line 601
    invoke-interface {v6, p0, p1}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    .line 603
    :cond_1
    return-void

    .line 571
    .end local v1    # "digest":[B
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "ref":Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;
    .end local v6    # "script":Lorg/mozilla/javascript/Script;
    :cond_2
    const/4 v9, 0x0

    goto :goto_0

    .line 576
    .restart local v1    # "digest":[B
    .restart local v4    # "key":Ljava/lang/String;
    .restart local v5    # "ref":Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;
    .restart local v7    # "source":Ljava/lang/Object;
    :cond_3
    const/4 v6, 0x0

    goto :goto_1

    .restart local v6    # "script":Lorg/mozilla/javascript/Script;
    :cond_4
    move-object v8, v7

    .line 582
    check-cast v8, Ljava/lang/String;

    .line 586
    .local v8, "strSrc":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_6

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x23

    if-ne v9, v10, :cond_6

    .line 587
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_3
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v2, v9, :cond_6

    .line 588
    invoke-virtual {v8, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 589
    .local v0, "c":I
    const/16 v9, 0xa

    if-eq v0, v9, :cond_5

    const/16 v9, 0xd

    if-ne v0, v9, :cond_7

    .line 590
    :cond_5
    invoke-virtual {v8, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 595
    .end local v0    # "c":I
    .end local v2    # "i":I
    :cond_6
    const/4 v9, 0x1

    invoke-virtual {p0, v8, p2, v9, p3}, Lorg/mozilla/javascript/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v6

    goto :goto_2

    .line 587
    .restart local v0    # "c":I
    .restart local v2    # "i":I
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method static processFiles(Lorg/mozilla/javascript/Context;[Ljava/lang/String;)V
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v11, 0x3

    const/4 v9, 0x0

    .line 171
    array-length v8, p1

    new-array v1, v8, [Ljava/lang/Object;

    .line 172
    .local v1, "array":[Ljava/lang/Object;
    array-length v8, p1

    invoke-static {p1, v9, v1, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 173
    sget-object v8, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {p0, v8, v1}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 174
    .local v0, "argsObj":Lorg/mozilla/javascript/Scriptable;
    sget-object v8, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    const-string v9, "arguments"

    const/4 v10, 0x2

    invoke-virtual {v8, v9, v0, v10}, Lorg/mozilla/javascript/tools/shell/Global;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 177
    sget-object v8, Lorg/mozilla/javascript/tools/shell/Main;->fileList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 179
    .local v3, "file":Ljava/lang/String;
    :try_start_0
    invoke-static {p0, v3}, Lorg/mozilla/javascript/tools/shell/Main;->processSource(Lorg/mozilla/javascript/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 180
    :catch_0
    move-exception v5

    .line 181
    .local v5, "ioex":Ljava/io/IOException;
    const-string v8, "msg.couldnt.read.source"

    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v3, v9}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 183
    const/4 v8, 0x4

    sput v8, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0

    .line 184
    .end local v5    # "ioex":Ljava/io/IOException;
    :catch_1
    move-exception v7

    .line 185
    .local v7, "rex":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v8

    invoke-static {v8, v7}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V

    .line 187
    sput v11, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0

    .line 188
    .end local v7    # "rex":Lorg/mozilla/javascript/RhinoException;
    :catch_2
    move-exception v2

    .line 190
    .local v2, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v2}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 191
    const-string v8, "msg.uncaughtJSException"

    invoke-virtual {v2}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 193
    .local v6, "msg":Ljava/lang/String;
    invoke-static {v6}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 194
    sput v11, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_0

    .line 197
    .end local v2    # "ex":Ljava/lang/VirtualMachineError;
    .end local v3    # "file":Ljava/lang/String;
    .end local v6    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static processOptions([Ljava/lang/String;)[Ljava/lang/String;
    .locals 13
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    .line 261
    const/4 v3, 0x0

    .line 262
    .local v3, "i":I
    :goto_0
    array-length v9, p0

    if-ne v3, v9, :cond_0

    .line 263
    new-array v6, v11, [Ljava/lang/String;

    .line 412
    :goto_1
    return-object v6

    .line 265
    :cond_0
    aget-object v0, p0, v3

    .line 266
    .local v0, "arg":Ljava/lang/String;
    const-string v9, "-"

    invoke-virtual {v0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 267
    sput-boolean v11, Lorg/mozilla/javascript/tools/shell/Main;->processStdin:Z

    .line 268
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->fileList:Ljava/util/List;

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    sput-object v0, Lorg/mozilla/javascript/tools/shell/Main;->mainModule:Ljava/lang/String;

    .line 270
    array-length v9, p0

    sub-int/2addr v9, v3

    add-int/lit8 v9, v9, -0x1

    new-array v6, v9, [Ljava/lang/String;

    .line 271
    .local v6, "result":[Ljava/lang/String;
    add-int/lit8 v9, v3, 0x1

    array-length v10, p0

    sub-int/2addr v10, v3

    add-int/lit8 v10, v10, -0x1

    invoke-static {p0, v9, v6, v11, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 274
    .end local v6    # "result":[Ljava/lang/String;
    :cond_1
    const-string v9, "-version"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 275
    add-int/lit8 v3, v3, 0x1

    array-length v9, p0

    if-ne v3, v9, :cond_2

    .line 276
    move-object v7, v0

    .line 407
    .local v7, "usageError":Ljava/lang/String;
    :goto_2
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {v9}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v9

    const-string v10, "msg.shell.invalid"

    invoke-static {v10, v7}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 409
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {v9}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v9

    const-string v10, "msg.shell.usage"

    const-class v11, Lorg/mozilla/javascript/tools/shell/Main;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 411
    sput v12, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto :goto_1

    .line 281
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_2
    :try_start_0
    aget-object v9, p0, v3

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 286
    .local v8, "version":I
    invoke-static {v8}, Lorg/mozilla/javascript/Context;->isValidLanguageVersion(I)Z

    move-result v9

    if-nez v9, :cond_3

    .line 287
    aget-object v7, p0, v3

    .line 288
    .restart local v7    # "usageError":Ljava/lang/String;
    goto :goto_2

    .line 282
    .end local v7    # "usageError":Ljava/lang/String;
    .end local v8    # "version":I
    :catch_0
    move-exception v2

    .line 283
    .local v2, "ex":Ljava/lang/NumberFormatException;
    aget-object v7, p0, v3

    .line 284
    .restart local v7    # "usageError":Ljava/lang/String;
    goto :goto_2

    .line 290
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    .end local v7    # "usageError":Ljava/lang/String;
    .restart local v8    # "version":I
    :cond_3
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v8}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setLanguageVersion(I)V

    .line 261
    .end local v8    # "version":I
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 293
    :cond_4
    const-string v9, "-opt"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "-O"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 294
    :cond_5
    add-int/lit8 v3, v3, 0x1

    array-length v9, p0

    if-ne v3, v9, :cond_6

    .line 295
    move-object v7, v0

    .line 296
    .restart local v7    # "usageError":Ljava/lang/String;
    goto :goto_2

    .line 300
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_6
    :try_start_1
    aget-object v9, p0, v3

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v5

    .line 305
    .local v5, "opt":I
    const/4 v9, -0x2

    if-ne v5, v9, :cond_8

    .line 307
    const/4 v5, -0x1

    .line 312
    :cond_7
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v5}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setOptimizationLevel(I)V

    goto :goto_3

    .line 301
    .end local v5    # "opt":I
    :catch_1
    move-exception v2

    .line 302
    .restart local v2    # "ex":Ljava/lang/NumberFormatException;
    aget-object v7, p0, v3

    .line 303
    .restart local v7    # "usageError":Ljava/lang/String;
    goto :goto_2

    .line 308
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    .end local v7    # "usageError":Ljava/lang/String;
    .restart local v5    # "opt":I
    :cond_8
    invoke-static {v5}, Lorg/mozilla/javascript/Context;->isValidOptimizationLevel(I)Z

    move-result v9

    if-nez v9, :cond_7

    .line 309
    aget-object v7, p0, v3

    .line 310
    .restart local v7    # "usageError":Ljava/lang/String;
    goto :goto_2

    .line 315
    .end local v5    # "opt":I
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_9
    const-string v9, "-encoding"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 316
    add-int/lit8 v3, v3, 0x1

    array-length v9, p0

    if-ne v3, v9, :cond_a

    .line 317
    move-object v7, v0

    .line 318
    .restart local v7    # "usageError":Ljava/lang/String;
    goto/16 :goto_2

    .line 320
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_a
    aget-object v1, p0, v3

    .line 321
    .local v1, "enc":Ljava/lang/String;
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v1}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setCharacterEncoding(Ljava/lang/String;)V

    goto :goto_3

    .line 324
    .end local v1    # "enc":Ljava/lang/String;
    :cond_b
    const-string v9, "-strict"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 325
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setStrictMode(Z)V

    .line 326
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v11}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setAllowReservedKeywords(Z)V

    .line 327
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->errorReporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->setIsReportingWarnings(Z)V

    goto :goto_3

    .line 330
    :cond_c
    const-string v9, "-fatal-warnings"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 331
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setWarningAsError(Z)V

    goto :goto_3

    .line 334
    :cond_d
    const-string v9, "-e"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 335
    sput-boolean v11, Lorg/mozilla/javascript/tools/shell/Main;->processStdin:Z

    .line 336
    add-int/lit8 v3, v3, 0x1

    array-length v9, p0

    if-ne v3, v9, :cond_e

    .line 337
    move-object v7, v0

    .line 338
    .restart local v7    # "usageError":Ljava/lang/String;
    goto/16 :goto_2

    .line 340
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_e
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    iget-boolean v9, v9, Lorg/mozilla/javascript/tools/shell/Global;->initialized:Z

    if-nez v9, :cond_f

    .line 341
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    sget-object v10, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v10}, Lorg/mozilla/javascript/tools/shell/Global;->init(Lorg/mozilla/javascript/ContextFactory;)V

    .line 343
    :cond_f
    new-instance v4, Lorg/mozilla/javascript/tools/shell/Main$IProxy;

    const/4 v9, 0x2

    invoke-direct {v4, v9}, Lorg/mozilla/javascript/tools/shell/Main$IProxy;-><init>(I)V

    .line 344
    .local v4, "iproxy":Lorg/mozilla/javascript/tools/shell/Main$IProxy;
    aget-object v9, p0, v3

    iput-object v9, v4, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->scriptText:Ljava/lang/String;

    .line 345
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v4}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->call(Lorg/mozilla/javascript/ContextAction;)Ljava/lang/Object;

    goto/16 :goto_3

    .line 348
    .end local v4    # "iproxy":Lorg/mozilla/javascript/tools/shell/Main$IProxy;
    :cond_10
    const-string v9, "-require"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 349
    sput-boolean v12, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    goto/16 :goto_3

    .line 352
    :cond_11
    const-string v9, "-sandbox"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 353
    sput-boolean v12, Lorg/mozilla/javascript/tools/shell/Main;->sandboxed:Z

    .line 354
    sput-boolean v12, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    goto/16 :goto_3

    .line 357
    :cond_12
    const-string v9, "-modules"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 358
    add-int/lit8 v3, v3, 0x1

    array-length v9, p0

    if-ne v3, v9, :cond_13

    .line 359
    move-object v7, v0

    .line 360
    .restart local v7    # "usageError":Ljava/lang/String;
    goto/16 :goto_2

    .line 362
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_13
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->modulePath:Ljava/util/List;

    if-nez v9, :cond_14

    .line 363
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    sput-object v9, Lorg/mozilla/javascript/tools/shell/Main;->modulePath:Ljava/util/List;

    .line 365
    :cond_14
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->modulePath:Ljava/util/List;

    aget-object v10, p0, v3

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    sput-boolean v12, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    goto/16 :goto_3

    .line 369
    :cond_15
    const-string v9, "-w"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16

    .line 370
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->errorReporter:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->setIsReportingWarnings(Z)V

    goto/16 :goto_3

    .line 373
    :cond_16
    const-string v9, "-f"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19

    .line 374
    sput-boolean v11, Lorg/mozilla/javascript/tools/shell/Main;->processStdin:Z

    .line 375
    add-int/lit8 v3, v3, 0x1

    array-length v9, p0

    if-ne v3, v9, :cond_17

    .line 376
    move-object v7, v0

    .line 377
    .restart local v7    # "usageError":Ljava/lang/String;
    goto/16 :goto_2

    .line 379
    .end local v7    # "usageError":Ljava/lang/String;
    :cond_17
    aget-object v9, p0, v3

    const-string v10, "-"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18

    .line 380
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->fileList:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 382
    :cond_18
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->fileList:Ljava/util/List;

    aget-object v10, p0, v3

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    aget-object v9, p0, v3

    sput-object v9, Lorg/mozilla/javascript/tools/shell/Main;->mainModule:Ljava/lang/String;

    goto/16 :goto_3

    .line 387
    :cond_19
    const-string v9, "-sealedlib"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 388
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/tools/shell/Global;->setSealedStdLib(Z)V

    goto/16 :goto_3

    .line 391
    :cond_1a
    const-string v9, "-debug"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1b

    .line 392
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->setGeneratingDebug(Z)V

    goto/16 :goto_3

    .line 395
    :cond_1b
    const-string v9, "-?"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1c

    const-string v9, "-help"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1d

    .line 398
    :cond_1c
    sget-object v9, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {v9}, Lorg/mozilla/javascript/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v9

    const-string v10, "msg.shell.usage"

    const-class v11, Lorg/mozilla/javascript/tools/shell/Main;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 400
    sput v12, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto/16 :goto_1

    .line 403
    :cond_1d
    move-object v7, v0

    .line 404
    .restart local v7    # "usageError":Ljava/lang/String;
    goto/16 :goto_2
.end method

.method public static processSource(Lorg/mozilla/javascript/Context;Ljava/lang/String;)V
    .locals 24
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 449
    if-eqz p1, :cond_0

    const-string v21, "-"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 450
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getShellScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v18

    .line 452
    .local v18, "scope":Lorg/mozilla/javascript/Scriptable;
    sget-object v21, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual/range {v21 .. v21}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v4

    .line 453
    .local v4, "charEnc":Ljava/lang/String;
    if-eqz v4, :cond_7

    .line 454
    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    .line 458
    .local v6, "cs":Ljava/nio/charset/Charset;
    :goto_0
    sget-object v21, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/tools/shell/Global;->getConsole(Ljava/nio/charset/Charset;)Lorg/mozilla/javascript/tools/shell/ShellConsole;

    move-result-object v5

    .line 459
    .local v5, "console":Lorg/mozilla/javascript/tools/shell/ShellConsole;
    if-nez p1, :cond_1

    .line 461
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getImplementationVersion()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->println(Ljava/lang/String;)V

    .line 464
    :cond_1
    const/4 v11, 0x1

    .line 465
    .local v11, "lineno":I
    const/4 v9, 0x0

    .line 466
    .local v9, "hitEOF":Z
    :cond_2
    :goto_1
    if-nez v9, :cond_9

    .line 467
    sget-object v21, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/shell/Global;->getPrompts(Lorg/mozilla/javascript/Context;)[Ljava/lang/String;

    move-result-object v15

    .line 468
    .local v15, "prompts":[Ljava/lang/String;
    const/4 v14, 0x0

    .line 469
    .local v14, "prompt":Ljava/lang/String;
    if-nez p1, :cond_3

    .line 470
    const/16 v21, 0x0

    aget-object v14, v15, v21

    .line 471
    :cond_3
    invoke-virtual {v5}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->flush()V

    .line 472
    const-string v20, ""

    .line 478
    .local v20, "source":Ljava/lang/String;
    :goto_2
    :try_start_0
    invoke-virtual {v5, v14}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->readLine(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v13

    .line 484
    .local v13, "newline":Ljava/lang/String;
    if-nez v13, :cond_8

    .line 485
    const/4 v9, 0x1

    .line 495
    .end local v13    # "newline":Ljava/lang/String;
    :cond_4
    :goto_3
    :try_start_1
    const-string v21, "<stdin>"

    const/16 v22, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v11, v3}, Lorg/mozilla/javascript/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v19

    .line 496
    .local v19, "script":Lorg/mozilla/javascript/Script;
    if-eqz v19, :cond_2

    .line 497
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v16

    .line 499
    .local v16, "result":Ljava/lang/Object;
    invoke-static {}, Lorg/mozilla/javascript/Context;->getUndefinedValue()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_6

    move-object/from16 v0, v16

    instance-of v0, v0, Lorg/mozilla/javascript/Function;

    move/from16 v21, v0

    if-eqz v21, :cond_5

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v21

    const-string v22, "function"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_1
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/VirtualMachineError; {:try_start_1 .. :try_end_1} :catch_3

    move-result v21

    if-nez v21, :cond_6

    .line 504
    :cond_5
    :try_start_2
    invoke-static/range {v16 .. v16}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/VirtualMachineError; {:try_start_2 .. :try_end_2} :catch_3

    .line 510
    :cond_6
    :goto_4
    :try_start_3
    sget-object v21, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    move-object/from16 v0, v21

    iget-object v8, v0, Lorg/mozilla/javascript/tools/shell/Global;->history:Lorg/mozilla/javascript/NativeArray;

    .line 511
    .local v8, "h":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v8}, Lorg/mozilla/javascript/NativeArray;->getLength()J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v8, v1}, Lorg/mozilla/javascript/NativeArray;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    :try_end_3
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/VirtualMachineError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 513
    .end local v8    # "h":Lorg/mozilla/javascript/NativeArray;
    .end local v16    # "result":Ljava/lang/Object;
    .end local v19    # "script":Lorg/mozilla/javascript/Script;
    :catch_0
    move-exception v17

    .line 514
    .local v17, "rex":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V

    .line 516
    const/16 v21, 0x3

    sput v21, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto/16 :goto_1

    .line 456
    .end local v5    # "console":Lorg/mozilla/javascript/tools/shell/ShellConsole;
    .end local v6    # "cs":Ljava/nio/charset/Charset;
    .end local v9    # "hitEOF":Z
    .end local v11    # "lineno":I
    .end local v14    # "prompt":Ljava/lang/String;
    .end local v15    # "prompts":[Ljava/lang/String;
    .end local v17    # "rex":Lorg/mozilla/javascript/RhinoException;
    .end local v20    # "source":Ljava/lang/String;
    :cond_7
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v6

    .restart local v6    # "cs":Ljava/nio/charset/Charset;
    goto/16 :goto_0

    .line 480
    .restart local v5    # "console":Lorg/mozilla/javascript/tools/shell/ShellConsole;
    .restart local v9    # "hitEOF":Z
    .restart local v11    # "lineno":I
    .restart local v14    # "prompt":Ljava/lang/String;
    .restart local v15    # "prompts":[Ljava/lang/String;
    .restart local v20    # "source":Ljava/lang/String;
    :catch_1
    move-exception v10

    .line 481
    .local v10, "ioe":Ljava/io/IOException;
    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->println(Ljava/lang/String;)V

    goto :goto_3

    .line 488
    .end local v10    # "ioe":Ljava/io/IOException;
    .restart local v13    # "newline":Ljava/lang/String;
    :cond_8
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 489
    add-int/lit8 v11, v11, 0x1

    .line 490
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->stringIsCompilableUnit(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_4

    .line 492
    const/16 v21, 0x1

    aget-object v14, v15, v21

    .line 493
    goto/16 :goto_2

    .line 505
    .end local v13    # "newline":Ljava/lang/String;
    .restart local v16    # "result":Ljava/lang/Object;
    .restart local v19    # "script":Lorg/mozilla/javascript/Script;
    :catch_2
    move-exception v17

    .line 506
    .restart local v17    # "rex":Lorg/mozilla/javascript/RhinoException;
    :try_start_4
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V
    :try_end_4
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/VirtualMachineError; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_4

    .line 517
    .end local v16    # "result":Ljava/lang/Object;
    .end local v17    # "rex":Lorg/mozilla/javascript/RhinoException;
    .end local v19    # "script":Lorg/mozilla/javascript/Script;
    :catch_3
    move-exception v7

    .line 519
    .local v7, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v7}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 520
    const-string v21, "msg.uncaughtJSException"

    invoke-virtual {v7}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 522
    .local v12, "msg":Ljava/lang/String;
    invoke-static {v12}, Lorg/mozilla/javascript/Context;->reportError(Ljava/lang/String;)V

    .line 523
    const/16 v21, 0x3

    sput v21, Lorg/mozilla/javascript/tools/shell/Main;->exitCode:I

    goto/16 :goto_1

    .line 526
    .end local v7    # "ex":Ljava/lang/VirtualMachineError;
    .end local v12    # "msg":Ljava/lang/String;
    .end local v14    # "prompt":Ljava/lang/String;
    .end local v15    # "prompts":[Ljava/lang/String;
    .end local v20    # "source":Ljava/lang/String;
    :cond_9
    invoke-virtual {v5}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->println()V

    .line 527
    invoke-virtual {v5}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->flush()V

    .line 533
    .end local v4    # "charEnc":Ljava/lang/String;
    .end local v5    # "console":Lorg/mozilla/javascript/tools/shell/ShellConsole;
    .end local v6    # "cs":Ljava/nio/charset/Charset;
    .end local v9    # "hitEOF":Z
    .end local v11    # "lineno":I
    .end local v18    # "scope":Lorg/mozilla/javascript/Scriptable;
    :goto_5
    return-void

    .line 528
    :cond_a
    sget-boolean v21, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    if-eqz v21, :cond_b

    sget-object v21, Lorg/mozilla/javascript/tools/shell/Main;->mainModule:Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_b

    .line 529
    sget-object v21, Lorg/mozilla/javascript/tools/shell/Main;->require:Lorg/mozilla/javascript/commonjs/module/Require;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/commonjs/module/Require;->requireMain(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    goto :goto_5

    .line 531
    :cond_b
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/tools/shell/Main;->getScope(Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/tools/shell/Main;->processFile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V

    goto :goto_5
.end method

.method private static readFileOrUrl(Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "convertToString"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 701
    sget-object v0, Lorg/mozilla/javascript/tools/shell/Main;->shellContextFactory:Lorg/mozilla/javascript/tools/shell/ShellContextFactory;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/tools/SourceReader;->readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setErr(Ljava/io/PrintStream;)V
    .locals 1
    .param p0, "err"    # Ljava/io/PrintStream;

    .prologue
    .line 690
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 691
    return-void
.end method

.method public static setIn(Ljava/io/InputStream;)V
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 674
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/shell/Global;->setIn(Ljava/io/InputStream;)V

    .line 675
    return-void
.end method

.method public static setOut(Ljava/io/PrintStream;)V
    .locals 1
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 682
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/Main;->getGlobal()Lorg/mozilla/javascript/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 683
    return-void
.end method
