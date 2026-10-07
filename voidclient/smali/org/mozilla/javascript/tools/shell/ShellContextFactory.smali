.class public Lorg/mozilla/javascript/tools/shell/ShellContextFactory;
.super Lorg/mozilla/javascript/ContextFactory;
.source "ShellContextFactory.java"


# instance fields
.field private allowReservedKeywords:Z

.field private characterEncoding:Ljava/lang/String;

.field private errorReporter:Lorg/mozilla/javascript/ErrorReporter;

.field private generatingDebug:Z

.field private languageVersion:I

.field private optimizationLevel:I

.field private strictMode:Z

.field private warningAsError:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/mozilla/javascript/ContextFactory;-><init>()V

    .line 15
    const/16 v0, 0xb4

    iput v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->languageVersion:I

    .line 18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->allowReservedKeywords:Z

    return-void
.end method


# virtual methods
.method public getCharacterEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->characterEncoding:Ljava/lang/String;

    return-object v0
.end method

.method protected hasFeature(Lorg/mozilla/javascript/Context;I)Z
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "featureIndex"    # I

    .prologue
    .line 25
    packed-switch p2, :pswitch_data_0

    .line 40
    :pswitch_0
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ContextFactory;->hasFeature(Lorg/mozilla/javascript/Context;I)Z

    move-result v0

    :goto_0
    return v0

    .line 29
    :pswitch_1
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->strictMode:Z

    goto :goto_0

    .line 32
    :pswitch_2
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->allowReservedKeywords:Z

    goto :goto_0

    .line 35
    :pswitch_3
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->warningAsError:Z

    goto :goto_0

    .line 38
    :pswitch_4
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->generatingDebug:Z

    goto :goto_0

    .line 25
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_4
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method protected onContextCreated(Lorg/mozilla/javascript/Context;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 46
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->languageVersion:I

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/Context;->setLanguageVersion(I)V

    .line 47
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->optimizationLevel:I

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/Context;->setOptimizationLevel(I)V

    .line 48
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/Context;->setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    .line 51
    :cond_0
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->generatingDebug:Z

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/Context;->setGeneratingDebug(Z)V

    .line 52
    invoke-super {p0, p1}, Lorg/mozilla/javascript/ContextFactory;->onContextCreated(Lorg/mozilla/javascript/Context;)V

    .line 53
    return-void
.end method

.method public setAllowReservedKeywords(Z)V
    .locals 0
    .param p1, "allowReservedKeywords"    # Z

    .prologue
    .line 103
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->allowReservedKeywords:Z

    .line 104
    return-void
.end method

.method public setCharacterEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "characterEncoding"    # Ljava/lang/String;

    .prologue
    .line 99
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->characterEncoding:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setErrorReporter(Lorg/mozilla/javascript/ErrorReporter;)V
    .locals 1
    .param p1, "errorReporter"    # Lorg/mozilla/javascript/ErrorReporter;

    .prologue
    .line 83
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 84
    :cond_0
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    .line 85
    return-void
.end method

.method public setGeneratingDebug(Z)V
    .locals 0
    .param p1, "generatingDebug"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->generatingDebug:Z

    .line 90
    return-void
.end method

.method public setLanguageVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 69
    invoke-static {p1}, Lorg/mozilla/javascript/Context;->checkLanguageVersion(I)V

    .line 70
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 71
    iput p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->languageVersion:I

    .line 72
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0
    .param p1, "optimizationLevel"    # I

    .prologue
    .line 76
    invoke-static {p1}, Lorg/mozilla/javascript/Context;->checkOptimizationLevel(I)V

    .line 77
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 78
    iput p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->optimizationLevel:I

    .line 79
    return-void
.end method

.method public setStrictMode(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 58
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->strictMode:Z

    .line 59
    return-void
.end method

.method public setWarningAsError(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 64
    iput-boolean p1, p0, Lorg/mozilla/javascript/tools/shell/ShellContextFactory;->warningAsError:Z

    .line 65
    return-void
.end method
