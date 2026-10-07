.class public Lorg/mozilla/javascript/tools/ToolErrorReporter;
.super Ljava/lang/Object;
.source "ToolErrorReporter.java"

# interfaces
.implements Lorg/mozilla/javascript/ErrorReporter;


# static fields
.field private static final messagePrefix:Ljava/lang/String; = "js: "


# instance fields
.field private err:Ljava/io/PrintStream;

.field private hasReportedErrorFlag:Z

.field private reportWarnings:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "reportWarnings"    # Z

    .prologue
    .line 23
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    .line 24
    return-void
.end method

.method public constructor <init>(ZLjava/io/PrintStream;)V
    .locals 0
    .param p1, "reportWarnings"    # Z
    .param p2, "err"    # Ljava/io/PrintStream;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportWarnings:Z

    .line 28
    iput-object p2, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    .line 29
    return-void
.end method

.method private buildIndicator(I)Ljava/lang/String;
    .locals 3
    .param p1, "offset"    # I

    .prologue
    .line 181
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    add-int/lit8 v2, p1, -0x1

    if-ge v0, v2, :cond_0

    .line 183
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 184
    :cond_0
    const-string v2, "^"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getExceptionMessage(Lorg/mozilla/javascript/RhinoException;)Ljava/lang/String;
    .locals 3
    .param p0, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    .line 78
    instance-of v1, p0, Lorg/mozilla/javascript/JavaScriptException;

    if-eqz v1, :cond_0

    .line 79
    const-string v1, "msg.uncaughtJSException"

    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->details()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "msg":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 80
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    instance-of v1, p0, Lorg/mozilla/javascript/EcmaError;

    if-eqz v1, :cond_1

    .line 81
    const-string v1, "msg.uncaughtEcmaError"

    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->details()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 82
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    instance-of v1, p0, Lorg/mozilla/javascript/EvaluatorException;

    if-eqz v1, :cond_2

    .line 83
    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->details()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 85
    .end local v0    # "msg":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoException;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_0
.end method

.method public static getMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "messageId"    # Ljava/lang/String;

    .prologue
    .line 37
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 47
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 48
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "argument"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 42
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 9
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 52
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 53
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    .line 56
    .local v3, "locale":Ljava/util/Locale;
    :goto_0
    const-string v6, "org.mozilla.javascript.tools.resources.Messages"

    invoke-static {v6, v3}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/ResourceBundle;

    move-result-object v5

    .line 61
    .local v5, "rb":Ljava/util/ResourceBundle;
    :try_start_0
    invoke-virtual {v5, p0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 67
    .local v1, "formatString":Ljava/lang/String;
    if-nez p1, :cond_1

    .line 71
    .end local v1    # "formatString":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 53
    .end local v3    # "locale":Ljava/util/Locale;
    .end local v5    # "rb":Ljava/util/ResourceBundle;
    :cond_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v3

    goto :goto_0

    .line 62
    .restart local v3    # "locale":Ljava/util/Locale;
    .restart local v5    # "rb":Ljava/util/ResourceBundle;
    :catch_0
    move-exception v4

    .line 63
    .local v4, "mre":Ljava/util/MissingResourceException;
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "no message resource found for message property "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 70
    .end local v4    # "mre":Ljava/util/MissingResourceException;
    .restart local v1    # "formatString":Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/text/MessageFormat;

    invoke-direct {v2, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 71
    .local v2, "formatter":Ljava/text/MessageFormat;
    invoke-virtual {v2, p1}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I
    .param p6, "justWarning"    # Z

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 157
    if-lez p3, :cond_3

    .line 158
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "lineStr":Ljava/lang/String;
    if-eqz p2, :cond_2

    .line 160
    const/4 v2, 0x3

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p2, v0, v3

    aput-object v1, v0, v4

    aput-object p1, v0, v5

    .line 161
    .local v0, "args":[Ljava/lang/Object;
    const-string v2, "msg.format3"

    invoke-static {v2, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 170
    .end local v1    # "lineStr":Ljava/lang/String;
    :goto_0
    if-eqz p6, :cond_0

    .line 171
    const-string v2, "msg.warning"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 173
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "js: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 174
    if-eqz p4, :cond_1

    .line 175
    iget-object v2, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "js: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 176
    iget-object v2, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "js: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, p5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->buildIndicator(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 178
    :cond_1
    return-void

    .line 163
    .end local v0    # "args":[Ljava/lang/Object;
    .restart local v1    # "lineStr":Ljava/lang/String;
    :cond_2
    new-array v0, v5, [Ljava/lang/Object;

    aput-object v1, v0, v3

    aput-object p1, v0, v4

    .line 164
    .restart local v0    # "args":[Ljava/lang/Object;
    const-string v2, "msg.format2"

    invoke-static {v2, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 167
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "lineStr":Ljava/lang/String;
    :cond_3
    new-array v0, v4, [Ljava/lang/Object;

    aput-object p1, v0, v3

    .line 168
    .restart local v0    # "args":[Ljava/lang/Object;
    const-string v2, "msg.format1"

    invoke-static {v2, v0}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static reportException(Lorg/mozilla/javascript/ErrorReporter;Lorg/mozilla/javascript/RhinoException;)V
    .locals 6
    .param p0, "er"    # Lorg/mozilla/javascript/ErrorReporter;
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    .line 129
    instance-of v0, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;

    if-eqz v0, :cond_0

    .line 130
    check-cast p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;

    .end local p0    # "er":Lorg/mozilla/javascript/ErrorReporter;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportException(Lorg/mozilla/javascript/RhinoException;)V

    .line 136
    :goto_0
    return-void

    .line 132
    .restart local p0    # "er":Lorg/mozilla/javascript/ErrorReporter;
    :cond_0
    invoke-static {p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getExceptionMessage(Lorg/mozilla/javascript/RhinoException;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->sourceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->lineNumber()I

    move-result v3

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->lineSource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->columnNumber()I

    move-result v5

    move-object v0, p0

    invoke-interface/range {v0 .. v5}, Lorg/mozilla/javascript/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_0
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .prologue
    .line 102
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->hasReportedErrorFlag:Z

    .line 103
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    .line 105
    return-void
.end method

.method public hasReportedError()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->hasReportedErrorFlag:Z

    return v0
.end method

.method public isReportingWarnings()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportWarnings:Z

    return v0
.end method

.method public reportException(Lorg/mozilla/javascript/RhinoException;)V
    .locals 9
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    .line 140
    instance-of v0, p1, Lorg/mozilla/javascript/WrappedException;

    if-eqz v0, :cond_0

    move-object v8, p1

    .line 141
    check-cast v8, Lorg/mozilla/javascript/WrappedException;

    .line 142
    .local v8, "we":Lorg/mozilla/javascript/WrappedException;
    iget-object v0, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    invoke-virtual {v8, v0}, Lorg/mozilla/javascript/WrappedException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 151
    .end local v8    # "we":Lorg/mozilla/javascript/WrappedException;
    :goto_0
    return-void

    .line 144
    :cond_0
    const-string v0, "line.separator"

    invoke-static {v0}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 146
    .local v7, "lineSeparator":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getExceptionMessage(Lorg/mozilla/javascript/RhinoException;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->getScriptStackTrace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->sourceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->lineNumber()I

    move-result v3

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->lineSource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lorg/mozilla/javascript/RhinoException;->columnNumber()I

    move-result v5

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    goto :goto_0
.end method

.method public runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;
    .locals 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .prologue
    .line 111
    new-instance v0, Lorg/mozilla/javascript/EvaluatorException;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/EvaluatorException;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    return-object v0
.end method

.method public setIsReportingWarnings(Z)V
    .locals 0
    .param p1, "reportWarnings"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportWarnings:Z

    .line 125
    return-void
.end method

.method public warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .prologue
    .line 93
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportWarnings:Z

    if-nez v0, :cond_0

    .line 97
    :goto_0
    return-void

    .line 95
    :cond_0
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    goto :goto_0
.end method
