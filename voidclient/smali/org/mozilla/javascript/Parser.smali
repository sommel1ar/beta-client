.class public Lorg/mozilla/javascript/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/Parser$1;,
        Lorg/mozilla/javascript/Parser$PerFunctionVariables;,
        Lorg/mozilla/javascript/Parser$ConditionData;,
        Lorg/mozilla/javascript/Parser$ParserException;
    }
.end annotation


# static fields
.field public static final ARGC_LIMIT:I = 0x10000

.field static final CLEAR_TI_MASK:I = 0xffff

.field private static final GET_ENTRY:I = 0x2

.field private static final METHOD_ENTRY:I = 0x8

.field private static final PROP_ENTRY:I = 0x1

.field private static final SET_ENTRY:I = 0x4

.field static final TI_AFTER_EOL:I = 0x10000

.field static final TI_CHECK_LABEL:I = 0x20000


# instance fields
.field calledByCompileFunction:Z

.field compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

.field private currentFlaggedToken:I

.field private currentJsDocComment:Lorg/mozilla/javascript/ast/Comment;

.field private currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

.field currentScope:Lorg/mozilla/javascript/ast/Scope;

.field currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

.field private currentToken:I

.field private endFlags:I

.field private errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

.field private errorReporter:Lorg/mozilla/javascript/ErrorReporter;

.field private inDestructuringAssignment:Z

.field private inForInit:Z

.field protected inUseStrictDirective:Z

.field private labelSet:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/ast/LabeledStatement;",
            ">;"
        }
    .end annotation
.end field

.field private loopAndSwitchSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/Jump;",
            ">;"
        }
    .end annotation
.end field

.field private loopSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/Loop;",
            ">;"
        }
    .end annotation
.end field

.field protected nestingOfFunction:I

.field private parseFinished:Z

.field private prevNameTokenLineno:I

.field private prevNameTokenStart:I

.field private prevNameTokenString:Ljava/lang/String;

.field private scannedComments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/Comment;",
            ">;"
        }
    .end annotation
.end field

.field private sourceChars:[C

.field private sourceURI:Ljava/lang/String;

.field private syntaxErrorCount:I

.field private ts:Lorg/mozilla/javascript/TokenStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 103
    new-instance v0, Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-direct {v0}, Lorg/mozilla/javascript/CompilerEnvirons;-><init>()V

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;-><init>(Lorg/mozilla/javascript/CompilerEnvirons;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/CompilerEnvirons;)V
    .locals 1
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;

    .prologue
    .line 107
    invoke-virtual {p1}, Lorg/mozilla/javascript/CompilerEnvirons;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/Parser;-><init>(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ErrorReporter;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ErrorReporter;)V
    .locals 1
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;
    .param p2, "errorReporter"    # Lorg/mozilla/javascript/ErrorReporter;

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    .line 93
    const-string v0, ""

    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 111
    iput-object p1, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 112
    iput-object p2, p0, Lorg/mozilla/javascript/Parser;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    .line 113
    instance-of v0, p2, Lorg/mozilla/javascript/ast/IdeErrorReporter;

    if-eqz v0, :cond_0

    .line 114
    check-cast p2, Lorg/mozilla/javascript/ast/IdeErrorReporter;

    .end local p2    # "errorReporter":Lorg/mozilla/javascript/ErrorReporter;
    iput-object p2, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    .line 116
    :cond_0
    return-void
.end method

.method static synthetic access$200(Lorg/mozilla/javascript/Parser;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$202(Lorg/mozilla/javascript/Parser;Ljava/util/Map;)Ljava/util/Map;
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    return-object p1
.end method

.method static synthetic access$300(Lorg/mozilla/javascript/Parser;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$302(Lorg/mozilla/javascript/Parser;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$400(Lorg/mozilla/javascript/Parser;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$402(Lorg/mozilla/javascript/Parser;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$500(Lorg/mozilla/javascript/Parser;)I
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;

    .prologue
    .line 41
    iget v0, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    return v0
.end method

.method static synthetic access$502(Lorg/mozilla/javascript/Parser;I)I
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    return p1
.end method

.method static synthetic access$600(Lorg/mozilla/javascript/Parser;)Z
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;

    .prologue
    .line 41
    iget-boolean v0, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    return v0
.end method

.method static synthetic access$602(Lorg/mozilla/javascript/Parser;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/mozilla/javascript/Parser;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    return p1
.end method

.method private addError(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V
    .locals 6
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .param p5, "line"    # I
    .param p6, "lineSource"    # Ljava/lang/String;
    .param p7, "lineOffset"    # I

    .prologue
    .line 216
    iget v0, p0, Lorg/mozilla/javascript/Parser;->syntaxErrorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/mozilla/javascript/Parser;->syntaxErrorCount:I

    .line 217
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 218
    .local v1, "message":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p3, p4}, Lorg/mozilla/javascript/ast/IdeErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;II)V

    .line 223
    :goto_0
    return-void

    .line 221
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    move v3, p5

    move-object v4, p6

    move v5, p7

    invoke-interface/range {v0 .. v5}, Lorg/mozilla/javascript/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_0
.end method

.method private addExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2258
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->mulExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2260
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    .local v3, "tt":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2261
    .local v0, "opPos":I
    const/16 v4, 0x15

    if-eq v3, v4, :cond_0

    const/16 v4, 0x16

    if-ne v3, v4, :cond_1

    .line 2262
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2263
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->mulExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2264
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2268
    :cond_1
    return-object v1
.end method

.method private addStrictWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .param p5, "line"    # I
    .param p6, "lineSource"    # Ljava/lang/String;
    .param p7, "lineOffset"    # I

    .prologue
    .line 195
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isStrictMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    invoke-direct/range {p0 .. p7}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V

    .line 198
    :cond_0
    return-void
.end method

.method private addWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V
    .locals 6
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .param p5, "line"    # I
    .param p6, "lineSource"    # Ljava/lang/String;
    .param p7, "lineOffset"    # I

    .prologue
    .line 203
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "message":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->reportWarningAsError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    invoke-direct/range {p0 .. p7}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V

    .line 211
    :goto_0
    return-void

    .line 206
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    if-eqz v0, :cond_1

    .line 207
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p3, p4}, Lorg/mozilla/javascript/ast/IdeErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 209
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    move v3, p5

    move-object v4, p6

    move v5, p7

    invoke-interface/range {v0 .. v5}, Lorg/mozilla/javascript/ErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_0
.end method

.method private andExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x69

    .line 2142
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->bitOrExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2143
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2144
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2145
    .local v0, "opPos":I
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->andExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-direct {v2, v4, v1, v3, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2147
    .end local v0    # "opPos":I
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    return-object v1
.end method

.method private argumentList()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x58

    const/4 v4, 0x0

    .line 2407
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2408
    const/4 v1, 0x0

    .line 2436
    :goto_0
    return-object v1

    .line 2410
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2411
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    iget-boolean v2, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2412
    .local v2, "wasInForInit":Z
    iput-boolean v4, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2415
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x48

    if-ne v3, v4, :cond_2

    .line 2416
    const-string v3, "msg.yield.parenthesized"

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2418
    :cond_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 2419
    .local v0, "en":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    const/16 v4, 0x77

    if-ne v3, v4, :cond_3

    .line 2421
    const/4 v3, 0x0

    const/4 v4, 0x1

    :try_start_1
    invoke-direct {p0, v0, v3, v4}, Lorg/mozilla/javascript/Parser;->generatorExpression(Lorg/mozilla/javascript/ast/AstNode;IZ)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2430
    :goto_1
    const/16 v3, 0x59

    :try_start_2
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 2432
    iput-boolean v2, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2435
    const-string v3, "msg.no.paren.arg"

    invoke-direct {p0, v5, v3}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    goto :goto_0

    .line 2428
    :cond_3
    :try_start_3
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 2432
    .end local v0    # "en":Lorg/mozilla/javascript/ast/AstNode;
    :catchall_0
    move-exception v3

    iput-boolean v2, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    throw v3

    .line 2423
    .restart local v0    # "en":Lorg/mozilla/javascript/ast/AstNode;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private arrayComprehension(Lorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/AstNode;
    .locals 6
    .param p1, "result"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3002
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3004
    .local v2, "loops":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;>;"
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x77

    if-ne v4, v5, :cond_0

    .line 3005
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->arrayComprehensionLoop()Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3007
    :cond_0
    const/4 v1, -0x1

    .line 3008
    .local v1, "ifPos":I
    const/4 v0, 0x0

    .line 3009
    .local v0, "data":Lorg/mozilla/javascript/Parser$ConditionData;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x70

    if-ne v4, v5, :cond_1

    .line 3010
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 3011
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v1, v4, p2

    .line 3012
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->condition()Lorg/mozilla/javascript/Parser$ConditionData;

    move-result-object v0

    .line 3014
    :cond_1
    const/16 v4, 0x54

    const-string v5, "msg.no.bracket.arg"

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 3015
    new-instance v3, Lorg/mozilla/javascript/ast/ArrayComprehension;

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v4, p2

    invoke-direct {v3, p2, v4}, Lorg/mozilla/javascript/ast/ArrayComprehension;-><init>(II)V

    .line 3016
    .local v3, "pn":Lorg/mozilla/javascript/ast/ArrayComprehension;
    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/ast/ArrayComprehension;->setResult(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3017
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/ast/ArrayComprehension;->setLoops(Ljava/util/List;)V

    .line 3018
    if-eqz v0, :cond_2

    .line 3019
    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/ast/ArrayComprehension;->setIfPosition(I)V

    .line 3020
    iget-object v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/ArrayComprehension;->setFilter(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3021
    iget v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->lp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/ArrayComprehension;->setFilterLp(I)V

    .line 3022
    iget v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->rp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/ArrayComprehension;->setFilterRp(I)V

    .line 3024
    :cond_2
    return-object v3
.end method

.method private arrayComprehensionLoop()Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x27

    const/4 v8, 0x1

    .line 3030
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v9

    const/16 v10, 0x77

    if-eq v9, v10, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 3031
    :cond_0
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 3032
    .local v6, "pos":I
    const/4 v0, -0x1

    .local v0, "eachPos":I
    const/4 v3, -0x1

    .local v3, "lp":I
    const/4 v7, -0x1

    .local v7, "rp":I
    const/4 v1, -0x1

    .line 3033
    .local v1, "inPos":I
    new-instance v5, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;

    invoke-direct {v5, v6}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;-><init>(I)V

    .line 3035
    .local v5, "pn":Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;
    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 3037
    const/16 v9, 0x27

    :try_start_0
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 3038
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v9}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "each"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 3039
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v0, v9, v6

    .line 3044
    :cond_1
    :goto_0
    const/16 v9, 0x57

    const-string v10, "msg.no.paren.for"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 3045
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v3, v9, v6

    .line 3048
    :cond_2
    const/4 v2, 0x0

    .line 3049
    .local v2, "iter":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    .line 3061
    const-string v9, "msg.bad.var"

    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3066
    :goto_1
    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v9

    if-ne v9, v11, :cond_3

    .line 3067
    const/16 v9, 0x99

    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v10}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {p0, v9, v10, v11}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 3070
    :cond_3
    const/16 v9, 0x34

    const-string v10, "msg.in.after.for.name"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 3071
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v1, v9, v6

    .line 3072
    :cond_4
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 3073
    .local v4, "obj":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v9, 0x58

    const-string v10, "msg.no.paren.for.ctrl"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 3074
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v7, v9, v6

    .line 3076
    :cond_5
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v9, v6

    invoke-virtual {v5, v9}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setLength(I)V

    .line 3077
    invoke-virtual {v5, v2}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setIterator(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3078
    invoke-virtual {v5, v4}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setIteratedObject(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3079
    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setInPosition(I)V

    .line 3080
    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setEachPosition(I)V

    .line 3081
    const/4 v9, -0x1

    if-eq v0, v9, :cond_7

    :goto_2
    invoke-virtual {v5, v8}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setIsForEach(Z)V

    .line 3082
    invoke-virtual {v5, v3, v7}, Lorg/mozilla/javascript/ast/ArrayComprehensionLoop;->setParens(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3085
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    return-object v5

    .line 3041
    .end local v2    # "iter":Lorg/mozilla/javascript/ast/AstNode;
    .end local v4    # "obj":Lorg/mozilla/javascript/ast/AstNode;
    :cond_6
    :try_start_1
    const-string v9, "msg.no.paren.for"

    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 3085
    :catchall_0
    move-exception v8

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    throw v8

    .line 3053
    .restart local v2    # "iter":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_0
    :try_start_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->destructuringPrimaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 3054
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_1

    .line 3057
    :sswitch_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 3058
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 3059
    goto :goto_1

    .line 3081
    .restart local v4    # "obj":Lorg/mozilla/javascript/ast/AstNode;
    :cond_7
    const/4 v8, 0x0

    goto :goto_2

    .line 3049
    nop

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_1
        0x53 -> :sswitch_0
        0x55 -> :sswitch_0
    .end sparse-switch
.end method

.method private arrayLiteral()Lorg/mozilla/javascript/ast/AstNode;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 2939
    iget v12, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v13, 0x53

    if-eq v12, v13, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2940
    :cond_0
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v7, "pos":I
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v12, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2941
    .local v4, "end":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2942
    .local v3, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    new-instance v6, Lorg/mozilla/javascript/ast/ArrayLiteral;

    invoke-direct {v6, v7}, Lorg/mozilla/javascript/ast/ArrayLiteral;-><init>(I)V

    .line 2943
    .local v6, "pn":Lorg/mozilla/javascript/ast/ArrayLiteral;
    const/4 v1, 0x1

    .line 2944
    .local v1, "after_lb_or_comma":Z
    const/4 v0, -0x1

    .line 2945
    .local v0, "afterComma":I
    const/4 v8, 0x0

    .line 2947
    .local v8, "skipCount":I
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v9

    .line 2948
    .local v9, "tt":I
    const/16 v12, 0x59

    if-ne v9, v12, :cond_2

    .line 2949
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2950
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v12, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2951
    if-nez v1, :cond_1

    .line 2952
    const/4 v1, 0x1

    goto :goto_0

    .line 2954
    :cond_1
    new-instance v12, Lorg/mozilla/javascript/ast/EmptyExpression;

    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v13, v13, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {v12, v13, v10}, Lorg/mozilla/javascript/ast/EmptyExpression;-><init>(II)V

    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2955
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2957
    :cond_2
    const/16 v12, 0x54

    if-ne v9, v12, :cond_5

    .line 2958
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2964
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v12, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2965
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    if-eqz v1, :cond_4

    :goto_1
    add-int/2addr v10, v12

    invoke-virtual {v6, v10}, Lorg/mozilla/javascript/ast/ArrayLiteral;->setDestructuringLength(I)V

    .line 2967
    invoke-virtual {v6, v8}, Lorg/mozilla/javascript/ast/ArrayLiteral;->setSkipCount(I)V

    .line 2968
    const/4 v10, -0x1

    if-eq v0, v10, :cond_3

    .line 2969
    invoke-direct {p0, v7, v3, v0}, Lorg/mozilla/javascript/Parser;->warnTrailingComma(ILjava/util/List;I)V

    .line 2986
    :cond_3
    :goto_2
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/ast/AstNode;

    .line 2987
    .local v2, "e":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v6, v2}, Lorg/mozilla/javascript/ast/ArrayLiteral;->addElement(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_3

    .end local v2    # "e":Lorg/mozilla/javascript/ast/AstNode;
    .end local v5    # "i$":Ljava/util/Iterator;
    :cond_4
    move v10, v11

    .line 2965
    goto :goto_1

    .line 2971
    :cond_5
    const/16 v12, 0x77

    if-ne v9, v12, :cond_6

    if-nez v1, :cond_6

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    if-ne v12, v10, :cond_6

    .line 2973
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/mozilla/javascript/ast/AstNode;

    invoke-direct {p0, v10, v7}, Lorg/mozilla/javascript/Parser;->arrayComprehension(Lorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    .line 2990
    .end local v6    # "pn":Lorg/mozilla/javascript/ast/ArrayLiteral;
    :goto_4
    return-object v6

    .line 2974
    .restart local v6    # "pn":Lorg/mozilla/javascript/ast/ArrayLiteral;
    :cond_6
    if-nez v9, :cond_7

    .line 2975
    const-string v10, "msg.no.bracket.arg"

    invoke-virtual {p0, v10}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_2

    .line 2978
    :cond_7
    if-nez v1, :cond_8

    .line 2979
    const-string v12, "msg.no.bracket.arg"

    invoke-virtual {p0, v12}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2981
    :cond_8
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v12

    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2982
    const/4 v1, 0x0

    .line 2983
    const/4 v0, -0x1

    goto/16 :goto_0

    .line 2989
    .restart local v5    # "i$":Ljava/util/Iterator;
    :cond_9
    sub-int v10, v4, v7

    invoke-virtual {v6, v10}, Lorg/mozilla/javascript/ast/ArrayLiteral;->setLength(I)V

    goto :goto_4
.end method

.method private assignExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2062
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    .line 2063
    .local v4, "tt":I
    const/16 v5, 0x48

    if-ne v4, v5, :cond_1

    .line 2064
    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/Parser;->returnOrYield(IZ)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 2089
    :cond_0
    :goto_0
    return-object v2

    .line 2066
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->condExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 2067
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    .line 2068
    const/16 v5, 0x5a

    if-gt v5, v4, :cond_3

    const/16 v5, 0x65

    if-gt v4, v5, :cond_3

    .line 2069
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2072
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v0

    .line 2074
    .local v0, "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2075
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v5, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2077
    .local v1, "opPos":I
    new-instance v3, Lorg/mozilla/javascript/ast/Assignment;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v5

    invoke-direct {v3, v4, v2, v5, v1}, Lorg/mozilla/javascript/ast/Assignment;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .line 2079
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v3, "pn":Lorg/mozilla/javascript/ast/AstNode;
    if-eqz v0, :cond_2

    .line 2080
    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ast/AstNode;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    :cond_2
    move-object v2, v3

    .line 2082
    .end local v3    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .end local v0    # "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    .end local v1    # "opPos":I
    :cond_3
    const/16 v5, 0x52

    if-ne v4, v5, :cond_0

    .line 2085
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->currentJsDocComment:Lorg/mozilla/javascript/ast/Comment;

    if-eqz v5, :cond_0

    .line 2086
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/mozilla/javascript/ast/AstNode;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    goto :goto_0
.end method

.method private attributeAccess()Lorg/mozilla/javascript/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 2680
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2682
    .local v0, "atPos":I
    sparse-switch v1, :sswitch_data_0

    .line 2697
    const-string v2, "msg.no.name.after.xmlAttr"

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2698
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v2

    :goto_0
    return-object v2

    .line 2685
    :sswitch_0
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v2}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v2, v5}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_0

    .line 2689
    :sswitch_1
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    const-string v3, "*"

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-direct {p0, v2, v3, v4}, Lorg/mozilla/javascript/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2690
    const-string v2, "*"

    invoke-direct {p0, v0, v2, v5}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_0

    .line 2694
    :sswitch_2
    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-direct {p0, v0, v2, v3}, Lorg/mozilla/javascript/Parser;->xmlElemRef(ILorg/mozilla/javascript/ast/Name;I)Lorg/mozilla/javascript/ast/XmlElemRef;

    move-result-object v2

    goto :goto_0

    .line 2682
    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_1
        0x27 -> :sswitch_0
        0x53 -> :sswitch_2
    .end sparse-switch
.end method

.method private autoInsertSemicolon(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 3
    .param p1, "pn"    # Lorg/mozilla/javascript/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1082
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekFlaggedToken()I

    move-result v1

    .line 1083
    .local v1, "ttFlagged":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    .line 1084
    .local v0, "pos":I
    const v2, 0xffff

    and-int/2addr v2, v1

    sparse-switch v2, :sswitch_data_0

    .line 1098
    const/high16 v2, 0x10000

    and-int/2addr v2, v1

    if-nez v2, :cond_0

    .line 1100
    const-string v2, "msg.no.semi.stmt"

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1106
    :goto_0
    return-void

    .line 1087
    :sswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1089
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v2, v0

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/ast/AstNode;->setLength(I)V

    goto :goto_0

    .line 1095
    :sswitch_1
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Parser;->nodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    invoke-direct {p0, v0, v2}, Lorg/mozilla/javascript/Parser;->warnMissingSemi(II)V

    goto :goto_0

    .line 1102
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Parser;->nodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    invoke-direct {p0, v0, v2}, Lorg/mozilla/javascript/Parser;->warnMissingSemi(II)V

    goto :goto_0

    .line 1084
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_1
        0x0 -> :sswitch_1
        0x52 -> :sswitch_0
        0x56 -> :sswitch_1
    .end sparse-switch
.end method

.method private bitAndExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xb

    .line 2175
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->eqExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2176
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2177
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2178
    .local v0, "opPos":I
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->eqExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-direct {v2, v4, v1, v3, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2179
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2180
    .end local v0    # "opPos":I
    :cond_0
    return-object v1
.end method

.method private bitOrExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x9

    .line 2153
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->bitXorExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2154
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2155
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2156
    .local v0, "opPos":I
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->bitXorExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-direct {v2, v4, v1, v3, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2157
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2158
    .end local v0    # "opPos":I
    :cond_0
    return-object v1
.end method

.method private bitXorExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xa

    .line 2164
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->bitAndExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2165
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2166
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2167
    .local v0, "opPos":I
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->bitAndExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-direct {v2, v4, v1, v3, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2168
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2169
    .end local v0    # "opPos":I
    :cond_0
    return-object v1
.end method

.method private block()Lorg/mozilla/javascript/ast/AstNode;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1714
    iget v2, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v3, 0x55

    if-eq v2, v3, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1715
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1716
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1717
    .local v1, "pos":I
    new-instance v0, Lorg/mozilla/javascript/ast/Scope;

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ast/Scope;-><init>(I)V

    .line 1718
    .local v0, "block":Lorg/mozilla/javascript/ast/Scope;
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/ast/Scope;->setLineno(I)V

    .line 1719
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 1721
    :try_start_0
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->statements(Lorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    .line 1722
    const/16 v2, 0x56

    const-string v3, "msg.no.brace.block"

    invoke-direct {p0, v2, v3}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1723
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/ast/Scope;->setLength(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1726
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    return-object v0

    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    throw v2
.end method

.method private breakStatement()Lorg/mozilla/javascript/ast/BreakStatement;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1527
    iget v7, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v8, 0x78

    if-eq v7, v8, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1528
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1529
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v7, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v4, "lineno":I
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v6, "pos":I
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v7, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1530
    .local v2, "end":I
    const/4 v0, 0x0

    .line 1531
    .local v0, "breakLabel":Lorg/mozilla/javascript/ast/Name;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v7

    const/16 v8, 0x27

    if-ne v7, v8, :cond_1

    .line 1532
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    .line 1533
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    .line 1537
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->matchJumpLabelName()Lorg/mozilla/javascript/ast/LabeledStatement;

    move-result-object v3

    .line 1539
    .local v3, "labels":Lorg/mozilla/javascript/ast/LabeledStatement;
    if-nez v3, :cond_5

    const/4 v1, 0x0

    .line 1541
    .local v1, "breakTarget":Lorg/mozilla/javascript/ast/Jump;
    :goto_0
    if-nez v1, :cond_3

    if-nez v0, :cond_3

    .line 1542
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_6

    .line 1543
    :cond_2
    if-nez v0, :cond_3

    .line 1544
    const-string v7, "msg.bad.break"

    sub-int v8, v2, v6

    invoke-virtual {p0, v7, v6, v8}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;II)V

    .line 1551
    :cond_3
    :goto_1
    new-instance v5, Lorg/mozilla/javascript/ast/BreakStatement;

    sub-int v7, v2, v6

    invoke-direct {v5, v6, v7}, Lorg/mozilla/javascript/ast/BreakStatement;-><init>(II)V

    .line 1552
    .local v5, "pn":Lorg/mozilla/javascript/ast/BreakStatement;
    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/ast/BreakStatement;->setBreakLabel(Lorg/mozilla/javascript/ast/Name;)V

    .line 1554
    if-eqz v1, :cond_4

    .line 1555
    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/ast/BreakStatement;->setBreakTarget(Lorg/mozilla/javascript/ast/Jump;)V

    .line 1556
    :cond_4
    invoke-virtual {v5, v4}, Lorg/mozilla/javascript/ast/BreakStatement;->setLineno(I)V

    .line 1557
    return-object v5

    .line 1539
    .end local v1    # "breakTarget":Lorg/mozilla/javascript/ast/Jump;
    .end local v5    # "pn":Lorg/mozilla/javascript/ast/BreakStatement;
    :cond_5
    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/LabeledStatement;->getFirstLabel()Lorg/mozilla/javascript/ast/Label;

    move-result-object v1

    goto :goto_0

    .line 1547
    .restart local v1    # "breakTarget":Lorg/mozilla/javascript/ast/Jump;
    :cond_6
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "breakTarget":Lorg/mozilla/javascript/ast/Jump;
    check-cast v1, Lorg/mozilla/javascript/ast/Jump;

    .restart local v1    # "breakTarget":Lorg/mozilla/javascript/ast/Jump;
    goto :goto_1
.end method

.method private checkBadIncDec(Lorg/mozilla/javascript/ast/UnaryExpression;)V
    .locals 4
    .param p1, "expr"    # Lorg/mozilla/javascript/ast/UnaryExpression;

    .prologue
    .line 3486
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/UnaryExpression;->getOperand()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->removeParens(Lorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 3487
    .local v0, "op":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v1

    .line 3488
    .local v1, "tt":I
    const/16 v2, 0x27

    if-eq v1, v2, :cond_0

    const/16 v2, 0x21

    if-eq v1, v2, :cond_0

    const/16 v2, 0x24

    if-eq v1, v2, :cond_0

    const/16 v2, 0x43

    if-eq v1, v2, :cond_0

    const/16 v2, 0x26

    if-eq v1, v2, :cond_0

    .line 3493
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/UnaryExpression;->getType()I

    move-result v2

    const/16 v3, 0x6a

    if-ne v2, v3, :cond_1

    const-string v2, "msg.bad.incr"

    :goto_0
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3496
    :cond_0
    return-void

    .line 3493
    :cond_1
    const-string v2, "msg.bad.decr"

    goto :goto_0
.end method

.method private checkCallRequiresActivation(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 2
    .param p1, "pn"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 3472
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v0

    const/16 v1, 0x27

    if-ne v0, v1, :cond_0

    const-string v1, "eval"

    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v0

    const/16 v1, 0x21

    if-ne v0, v1, :cond_2

    const-string v0, "eval"

    check-cast p1, Lorg/mozilla/javascript/ast/PropertyGet;

    .end local p1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/PropertyGet;->getProperty()Lorg/mozilla/javascript/ast/Name;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3476
    :cond_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->setRequiresActivation()V

    .line 3477
    :cond_2
    return-void
.end method

.method private codeBug()Ljava/lang/RuntimeException;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 3945
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ts.cursor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->cursor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ts.tokenBeg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", currentToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private condExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2095
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->orExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    .line 2096
    .local v7, "pn":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v10, 0x66

    invoke-direct {p0, v10}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 2097
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v10, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2098
    .local v6, "line":I
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v8, v10, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v8, "qmarkPos":I
    const/4 v2, -0x1

    .line 2104
    .local v2, "colonPos":I
    iget-boolean v9, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2105
    .local v9, "wasInForInit":Z
    const/4 v10, 0x0

    iput-boolean v10, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2108
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 2110
    .local v4, "ifTrue":Lorg/mozilla/javascript/ast/AstNode;
    iput-boolean v9, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2112
    const/16 v10, 0x67

    const-string v11, "msg.no.colon.cond"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 2113
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v10, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2114
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 2115
    .local v3, "ifFalse":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    .local v0, "beg":I
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v10

    sub-int v5, v10, v0

    .line 2116
    .local v5, "len":I
    new-instance v1, Lorg/mozilla/javascript/ast/ConditionalExpression;

    invoke-direct {v1, v0, v5}, Lorg/mozilla/javascript/ast/ConditionalExpression;-><init>(II)V

    .line 2117
    .local v1, "ce":Lorg/mozilla/javascript/ast/ConditionalExpression;
    invoke-virtual {v1, v6}, Lorg/mozilla/javascript/ast/ConditionalExpression;->setLineno(I)V

    .line 2118
    invoke-virtual {v1, v7}, Lorg/mozilla/javascript/ast/ConditionalExpression;->setTestExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2119
    invoke-virtual {v1, v4}, Lorg/mozilla/javascript/ast/ConditionalExpression;->setTrueExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2120
    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/ast/ConditionalExpression;->setFalseExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2121
    sub-int v10, v8, v0

    invoke-virtual {v1, v10}, Lorg/mozilla/javascript/ast/ConditionalExpression;->setQuestionMarkPosition(I)V

    .line 2122
    sub-int v10, v2, v0

    invoke-virtual {v1, v10}, Lorg/mozilla/javascript/ast/ConditionalExpression;->setColonPosition(I)V

    .line 2123
    move-object v7, v1

    .line 2125
    .end local v0    # "beg":I
    .end local v1    # "ce":Lorg/mozilla/javascript/ast/ConditionalExpression;
    .end local v2    # "colonPos":I
    .end local v3    # "ifFalse":Lorg/mozilla/javascript/ast/AstNode;
    .end local v4    # "ifTrue":Lorg/mozilla/javascript/ast/AstNode;
    .end local v5    # "len":I
    .end local v6    # "line":I
    .end local v8    # "qmarkPos":I
    .end local v9    # "wasInForInit":Z
    :cond_1
    return-object v7

    .line 2110
    .restart local v2    # "colonPos":I
    .restart local v6    # "line":I
    .restart local v8    # "qmarkPos":I
    .restart local v9    # "wasInForInit":Z
    :catchall_0
    move-exception v10

    iput-boolean v9, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    throw v10
.end method

.method private condition()Lorg/mozilla/javascript/Parser$ConditionData;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 909
    new-instance v0, Lorg/mozilla/javascript/Parser$ConditionData;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser$ConditionData;-><init>(Lorg/mozilla/javascript/Parser$1;)V

    .line 911
    .local v0, "data":Lorg/mozilla/javascript/Parser$ConditionData;
    const/16 v1, 0x57

    const-string v2, "msg.no.paren.cond"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 912
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iput v1, v0, Lorg/mozilla/javascript/Parser$ConditionData;->lp:I

    .line 914
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    iput-object v1, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    .line 916
    const/16 v1, 0x58

    const-string v2, "msg.no.paren.after.cond"

    invoke-direct {p0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 917
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iput v1, v0, Lorg/mozilla/javascript/Parser$ConditionData;->rp:I

    .line 921
    :cond_1
    iget-object v1, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    instance-of v1, v1, Lorg/mozilla/javascript/ast/Assignment;

    if-eqz v1, :cond_2

    .line 922
    const-string v1, "msg.equal.as.assign"

    const-string v2, ""

    iget-object v3, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v3

    iget-object v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 926
    :cond_2
    return-object v0
.end method

.method private consumeToken()V
    .locals 1

    .prologue
    .line 362
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    .line 363
    return-void
.end method

.method private continueStatement()Lorg/mozilla/javascript/ast/ContinueStatement;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1563
    iget v7, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v8, 0x79

    if-eq v7, v8, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1564
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1565
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v7, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v3, "lineno":I
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v5, "pos":I
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v7, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1566
    .local v0, "end":I
    const/4 v1, 0x0

    .line 1567
    .local v1, "label":Lorg/mozilla/javascript/ast/Name;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v7

    const/16 v8, 0x27

    if-ne v7, v8, :cond_1

    .line 1568
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v1

    .line 1569
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v0

    .line 1573
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->matchJumpLabelName()Lorg/mozilla/javascript/ast/LabeledStatement;

    move-result-object v2

    .line 1574
    .local v2, "labels":Lorg/mozilla/javascript/ast/LabeledStatement;
    const/4 v6, 0x0

    .line 1575
    .local v6, "target":Lorg/mozilla/javascript/ast/Loop;
    if-nez v2, :cond_5

    if-nez v1, :cond_5

    .line 1576
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_4

    .line 1577
    :cond_2
    const-string v7, "msg.continue.outside"

    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1588
    :goto_0
    new-instance v4, Lorg/mozilla/javascript/ast/ContinueStatement;

    sub-int v7, v0, v5

    invoke-direct {v4, v5, v7}, Lorg/mozilla/javascript/ast/ContinueStatement;-><init>(II)V

    .line 1589
    .local v4, "pn":Lorg/mozilla/javascript/ast/ContinueStatement;
    if-eqz v6, :cond_3

    .line 1590
    invoke-virtual {v4, v6}, Lorg/mozilla/javascript/ast/ContinueStatement;->setTarget(Lorg/mozilla/javascript/ast/Loop;)V

    .line 1591
    :cond_3
    invoke-virtual {v4, v1}, Lorg/mozilla/javascript/ast/ContinueStatement;->setLabel(Lorg/mozilla/javascript/ast/Name;)V

    .line 1592
    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/ast/ContinueStatement;->setLineno(I)V

    .line 1593
    return-object v4

    .line 1579
    .end local v4    # "pn":Lorg/mozilla/javascript/ast/ContinueStatement;
    :cond_4
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "target":Lorg/mozilla/javascript/ast/Loop;
    check-cast v6, Lorg/mozilla/javascript/ast/Loop;

    .restart local v6    # "target":Lorg/mozilla/javascript/ast/Loop;
    goto :goto_0

    .line 1582
    :cond_5
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/LabeledStatement;->getStatement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    instance-of v7, v7, Lorg/mozilla/javascript/ast/Loop;

    if-nez v7, :cond_7

    .line 1583
    :cond_6
    const-string v7, "msg.continue.nonloop"

    sub-int v8, v0, v5

    invoke-virtual {p0, v7, v5, v8}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;II)V

    .line 1585
    :cond_7
    if-nez v2, :cond_8

    const/4 v6, 0x0

    :goto_1
    goto :goto_0

    :cond_8
    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/LabeledStatement;->getStatement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    check-cast v7, Lorg/mozilla/javascript/ast/Loop;

    move-object v6, v7

    goto :goto_1
.end method

.method private createNameNode()Lorg/mozilla/javascript/ast/Name;
    .locals 2

    .prologue
    .line 3396
    const/4 v0, 0x0

    const/16 v1, 0x27

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/Parser;->createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    return-object v0
.end method

.method private createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;
    .locals 7
    .param p1, "checkActivation"    # Z
    .param p2, "token"    # I

    .prologue
    const/4 v6, 0x0

    .line 3407
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 3408
    .local v0, "beg":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    .line 3409
    .local v3, "s":Ljava/lang/String;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 3410
    .local v1, "lineno":I
    const-string v4, ""

    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenString:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 3411
    iget v0, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenStart:I

    .line 3412
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 3413
    iget v1, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenLineno:I

    .line 3414
    iput v6, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenStart:I

    .line 3415
    const-string v4, ""

    iput-object v4, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 3416
    iput v6, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenLineno:I

    .line 3418
    :cond_0
    if-nez v3, :cond_1

    .line 3419
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v4}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3420
    const-string v3, ""

    .line 3425
    :cond_1
    :goto_0
    new-instance v2, Lorg/mozilla/javascript/ast/Name;

    invoke-direct {v2, v0, v3}, Lorg/mozilla/javascript/ast/Name;-><init>(ILjava/lang/String;)V

    .line 3426
    .local v2, "name":Lorg/mozilla/javascript/ast/Name;
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/Name;->setLineno(I)V

    .line 3427
    if-eqz p1, :cond_2

    .line 3428
    invoke-virtual {p0, v3, p2}, Lorg/mozilla/javascript/Parser;->checkActivationName(Ljava/lang/String;I)V

    .line 3430
    :cond_2
    return-object v2

    .line 3422
    .end local v2    # "name":Lorg/mozilla/javascript/ast/Name;
    :cond_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_0
.end method

.method private createStringLiteral()Lorg/mozilla/javascript/ast/StringLiteral;
    .locals 4

    .prologue
    .line 3434
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v1, "pos":I
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 3435
    .local v0, "end":I
    new-instance v2, Lorg/mozilla/javascript/ast/StringLiteral;

    sub-int v3, v0, v1

    invoke-direct {v2, v1, v3}, Lorg/mozilla/javascript/ast/StringLiteral;-><init>(II)V

    .line 3436
    .local v2, "s":Lorg/mozilla/javascript/ast/StringLiteral;
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/ast/StringLiteral;->setLineno(I)V

    .line 3437
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v3}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/ast/StringLiteral;->setValue(Ljava/lang/String;)V

    .line 3438
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v3}, Lorg/mozilla/javascript/TokenStream;->getQuoteChar()C

    move-result v3

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/ast/StringLiteral;->setQuoteCharacter(C)V

    .line 3439
    return-object v2
.end method

.method private defaultXmlNamespace()Lorg/mozilla/javascript/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x27

    .line 1733
    iget v5, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v6, 0x74

    if-eq v5, v6, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1734
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1735
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->mustHaveXML()V

    .line 1736
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->setRequiresActivation()V

    .line 1737
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v5, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v3, "lineno":I
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v5, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1739
    .local v4, "pos":I
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "xml"

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1740
    :cond_1
    const-string v5, "msg.bad.namespace"

    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1742
    :cond_2
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "namespace"

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 1743
    :cond_3
    const-string v5, "msg.bad.namespace"

    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1745
    :cond_4
    const/16 v5, 0x5a

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v5

    if-nez v5, :cond_5

    .line 1746
    const-string v5, "msg.bad.namespace"

    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1749
    :cond_5
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1750
    .local v1, "e":Lorg/mozilla/javascript/ast/AstNode;
    new-instance v0, Lorg/mozilla/javascript/ast/UnaryExpression;

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v5

    sub-int/2addr v5, v4

    invoke-direct {v0, v4, v5}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(II)V

    .line 1751
    .local v0, "dxmln":Lorg/mozilla/javascript/ast/UnaryExpression;
    const/16 v5, 0x4a

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/ast/UnaryExpression;->setOperator(I)V

    .line 1752
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/UnaryExpression;->setOperand(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1753
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/UnaryExpression;->setLineno(I)V

    .line 1755
    new-instance v2, Lorg/mozilla/javascript/ast/ExpressionStatement;

    const/4 v5, 0x1

    invoke-direct {v2, v0, v5}, Lorg/mozilla/javascript/ast/ExpressionStatement;-><init>(Lorg/mozilla/javascript/ast/AstNode;Z)V

    .line 1756
    .local v2, "es":Lorg/mozilla/javascript/ast/ExpressionStatement;
    return-object v2
.end method

.method private destructuringPrimaryExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/mozilla/javascript/Parser$ParserException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 2791
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/mozilla/javascript/Parser;->inDestructuringAssignment:Z

    .line 2792
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->primaryExpr()Lorg/mozilla/javascript/ast/AstNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 2794
    iput-boolean v1, p0, Lorg/mozilla/javascript/Parser;->inDestructuringAssignment:Z

    return-object v0

    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lorg/mozilla/javascript/Parser;->inDestructuringAssignment:Z

    throw v0
.end method

.method private doLoop()Lorg/mozilla/javascript/ast/DoLoop;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1229
    iget v5, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v6, 0x76

    if-eq v5, v6, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1230
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1231
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v5, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1232
    .local v4, "pos":I
    new-instance v3, Lorg/mozilla/javascript/ast/DoLoop;

    invoke-direct {v3, v4}, Lorg/mozilla/javascript/ast/DoLoop;-><init>(I)V

    .line 1233
    .local v3, "pn":Lorg/mozilla/javascript/ast/DoLoop;
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v5, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ast/DoLoop;->setLineno(I)V

    .line 1234
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/Parser;->enterLoop(Lorg/mozilla/javascript/ast/Loop;)V

    .line 1236
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 1237
    .local v0, "body":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v5, 0x75

    const-string v6, "msg.no.while.do"

    invoke-direct {p0, v5, v6}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1238
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v5, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v5, v4

    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ast/DoLoop;->setWhilePosition(I)V

    .line 1239
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->condition()Lorg/mozilla/javascript/Parser$ConditionData;

    move-result-object v1

    .line 1240
    .local v1, "data":Lorg/mozilla/javascript/Parser$ConditionData;
    iget-object v5, v1, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ast/DoLoop;->setCondition(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1241
    iget v5, v1, Lorg/mozilla/javascript/Parser$ConditionData;->lp:I

    sub-int/2addr v5, v4

    iget v6, v1, Lorg/mozilla/javascript/Parser$ConditionData;->rp:I

    sub-int/2addr v6, v4

    invoke-virtual {v3, v5, v6}, Lorg/mozilla/javascript/ast/DoLoop;->setParens(II)V

    .line 1242
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    .line 1243
    .local v2, "end":I
    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ast/DoLoop;->setBody(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1245
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->exitLoop()V

    .line 1250
    const/16 v5, 0x52

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1251
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v5, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1253
    :cond_1
    sub-int v5, v2, v4

    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ast/DoLoop;->setLength(I)V

    .line 1254
    return-object v3

    .line 1245
    .end local v0    # "body":Lorg/mozilla/javascript/ast/AstNode;
    .end local v1    # "data":Lorg/mozilla/javascript/Parser$ConditionData;
    .end local v2    # "end":I
    :catchall_0
    move-exception v5

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->exitLoop()V

    throw v5
.end method

.method private enterLoop(Lorg/mozilla/javascript/ast/Loop;)V
    .locals 1
    .param p1, "loop"    # Lorg/mozilla/javascript/ast/Loop;

    .prologue
    .line 457
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    if-nez v0, :cond_0

    .line 458
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    .line 459
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    if-nez v0, :cond_1

    .line 461
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    .line 462
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 463
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 464
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    if-eqz v0, :cond_2

    .line 465
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/LabeledStatement;->setStatement(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 466
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/LabeledStatement;->getFirstLabel()Lorg/mozilla/javascript/ast/Label;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/Label;->setLoop(Lorg/mozilla/javascript/ast/Jump;)V

    .line 471
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/LabeledStatement;->getPosition()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/ast/Loop;->setRelative(I)V

    .line 473
    :cond_2
    return-void
.end method

.method private enterSwitch(Lorg/mozilla/javascript/ast/SwitchStatement;)V
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/ast/SwitchStatement;

    .prologue
    .line 485
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    if-nez v0, :cond_0

    .line 486
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    .line 487
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 488
    return-void
.end method

.method private eqExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2186
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->relExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 2188
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    .local v4, "tt":I
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v5, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2189
    .local v0, "opPos":I
    sparse-switch v4, :sswitch_data_0

    .line 2208
    return-object v2

    .line 2194
    :sswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2195
    move v1, v4

    .line 2196
    .local v1, "parseToken":I
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v5}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v5

    const/16 v6, 0x78

    if-ne v5, v6, :cond_0

    .line 2198
    const/16 v5, 0xc

    if-ne v4, v5, :cond_1

    .line 2199
    const/16 v1, 0x2e

    .line 2203
    :cond_0
    :goto_1
    new-instance v3, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->relExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v5

    invoke-direct {v3, v1, v2, v5, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v3, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v2, v3

    .line 2204
    .end local v3    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2200
    :cond_1
    const/16 v5, 0xd

    if-ne v4, v5, :cond_0

    .line 2201
    const/16 v1, 0x2f

    goto :goto_1

    .line 2189
    :sswitch_data_0
    .sparse-switch
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x2e -> :sswitch_0
        0x2f -> :sswitch_0
    .end sparse-switch
.end method

.method private exitLoop()V
    .locals 3

    .prologue
    .line 476
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/Loop;

    .line 477
    .local v0, "loop":Lorg/mozilla/javascript/ast/Loop;
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 478
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Loop;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 479
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Loop;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Loop;->setRelative(I)V

    .line 481
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    .line 482
    return-void
.end method

.method private exitSwitch()V
    .locals 2

    .prologue
    .line 491
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 492
    return-void
.end method

.method private expr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x59

    .line 2045
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2046
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v3

    .line 2047
    .local v3, "pos":I
    :goto_0
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2048
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2049
    .local v0, "opPos":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v4}, Lorg/mozilla/javascript/CompilerEnvirons;->isStrictMode()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->hasSideEffects()Z

    move-result v4

    if-nez v4, :cond_0

    .line 2050
    const-string v4, "msg.no.side.effects"

    const-string v5, ""

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->nodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v6

    sub-int/2addr v6, v3

    invoke-virtual {p0, v4, v5, v3, v6}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 2052
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x48

    if-ne v4, v5, :cond_1

    .line 2053
    const-string v4, "msg.yield.parenthesized"

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2054
    :cond_1
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v7, v1, v4, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2055
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2056
    .end local v0    # "opPos":I
    :cond_2
    return-object v1
.end method

.method private forLoop()Lorg/mozilla/javascript/ast/Loop;
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1260
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/Parser;->currentToken:I

    move/from16 v23, v0

    const/16 v24, 0x77

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_0

    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1261
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1262
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v9, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v9, "forPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    move/from16 v16, v0

    .line 1263
    .local v16, "lineno":I
    const/4 v14, 0x0

    .local v14, "isForEach":Z
    const/4 v15, 0x0

    .line 1264
    .local v15, "isForIn":Z
    const/4 v6, -0x1

    .local v6, "eachPos":I
    const/4 v10, -0x1

    .local v10, "inPos":I
    const/16 v17, -0x1

    .local v17, "lp":I
    const/16 v19, -0x1

    .line 1265
    .local v19, "rp":I
    const/4 v13, 0x0

    .line 1266
    .local v13, "init":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v4, 0x0

    .line 1267
    .local v4, "cond":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v11, 0x0

    .line 1268
    .local v11, "incr":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v18, 0x0

    .line 1270
    .local v18, "pn":Lorg/mozilla/javascript/ast/Loop;
    new-instance v20, Lorg/mozilla/javascript/ast/Scope;

    invoke-direct/range {v20 .. v20}, Lorg/mozilla/javascript/ast/Scope;-><init>()V

    .line 1271
    .local v20, "tempScope":Lorg/mozilla/javascript/ast/Scope;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 1274
    const/16 v23, 0x27

    :try_start_0
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 1275
    const-string v23, "each"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_6

    .line 1276
    const/4 v14, 0x1

    .line 1277
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v23, v0

    sub-int v6, v23, v9

    .line 1283
    :cond_1
    :goto_0
    const/16 v23, 0x57

    const-string v24, "msg.no.paren.for"

    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_2

    .line 1284
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v23, v0

    sub-int v17, v23, v9

    .line 1285
    :cond_2
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v22

    .line 1287
    .local v22, "tt":I
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->forLoopInit(I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v13

    .line 1289
    const/16 v23, 0x34

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v23

    if-eqz v23, :cond_8

    .line 1290
    const/4 v15, 0x1

    .line 1291
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v23, v0

    sub-int v10, v23, v9

    .line 1292
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 1313
    :goto_1
    const/16 v23, 0x58

    const-string v24, "msg.no.paren.for.ctrl"

    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_3

    .line 1314
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v23, v0

    sub-int v19, v23, v9

    .line 1316
    :cond_3
    if-eqz v15, :cond_b

    .line 1317
    new-instance v7, Lorg/mozilla/javascript/ast/ForInLoop;

    invoke-direct {v7, v9}, Lorg/mozilla/javascript/ast/ForInLoop;-><init>(I)V

    .line 1318
    .local v7, "fis":Lorg/mozilla/javascript/ast/ForInLoop;
    instance-of v0, v13, Lorg/mozilla/javascript/ast/VariableDeclaration;

    move/from16 v23, v0

    if-eqz v23, :cond_4

    .line 1320
    move-object v0, v13

    check-cast v0, Lorg/mozilla/javascript/ast/VariableDeclaration;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/mozilla/javascript/ast/VariableDeclaration;->getVariables()Ljava/util/List;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v23

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_4

    .line 1321
    const-string v23, "msg.mult.index"

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1324
    :cond_4
    invoke-virtual {v7, v13}, Lorg/mozilla/javascript/ast/ForInLoop;->setIterator(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1325
    invoke-virtual {v7, v4}, Lorg/mozilla/javascript/ast/ForInLoop;->setIteratedObject(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1326
    invoke-virtual {v7, v10}, Lorg/mozilla/javascript/ast/ForInLoop;->setInPosition(I)V

    .line 1327
    invoke-virtual {v7, v14}, Lorg/mozilla/javascript/ast/ForInLoop;->setIsForEach(Z)V

    .line 1328
    invoke-virtual {v7, v6}, Lorg/mozilla/javascript/ast/ForInLoop;->setEachPosition(I)V

    .line 1329
    move-object/from16 v18, v7

    .line 1339
    .end local v7    # "fis":Lorg/mozilla/javascript/ast/ForInLoop;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Scope;->replaceWith(Lorg/mozilla/javascript/ast/Scope;)V

    .line 1340
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    .line 1345
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->enterLoop(Lorg/mozilla/javascript/ast/Loop;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1347
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 1348
    .local v3, "body":Lorg/mozilla/javascript/ast/AstNode;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v23

    sub-int v23, v23, v9

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Loop;->setLength(I)V

    .line 1349
    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Loop;->setBody(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1351
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->exitLoop()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1355
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_5

    .line 1356
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    .line 1359
    :cond_5
    move-object/from16 v0, v18

    move/from16 v1, v17

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ast/Loop;->setParens(II)V

    .line 1360
    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Loop;->setLineno(I)V

    .line 1361
    return-object v18

    .line 1279
    .end local v3    # "body":Lorg/mozilla/javascript/ast/AstNode;
    .end local v22    # "tt":I
    :cond_6
    :try_start_3
    const-string v23, "msg.no.paren.for"

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 1355
    :catchall_0
    move-exception v23

    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_7

    .line 1356
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    :cond_7
    throw v23

    .line 1294
    .restart local v22    # "tt":I
    :cond_8
    const/16 v23, 0x52

    :try_start_4
    const-string v24, "msg.no.semi.for"

    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1295
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v23

    const/16 v24, 0x52

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_9

    .line 1297
    new-instance v5, Lorg/mozilla/javascript/ast/EmptyExpression;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v5, v0, v1}, Lorg/mozilla/javascript/ast/EmptyExpression;-><init>(II)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1298
    .end local v4    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    .local v5, "cond":Lorg/mozilla/javascript/ast/AstNode;
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-object v4, v5

    .line 1303
    .end local v5    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v4    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    :goto_4
    const/16 v23, 0x52

    :try_start_6
    const-string v24, "msg.no.semi.for.cond"

    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1304
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    move/from16 v21, v0

    .line 1305
    .local v21, "tmpPos":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v23

    const/16 v24, 0x58

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_a

    .line 1306
    new-instance v12, Lorg/mozilla/javascript/ast/EmptyExpression;

    const/16 v23, 0x1

    move/from16 v0, v21

    move/from16 v1, v23

    invoke-direct {v12, v0, v1}, Lorg/mozilla/javascript/ast/EmptyExpression;-><init>(II)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1307
    .end local v11    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    .local v12, "incr":Lorg/mozilla/javascript/ast/AstNode;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-virtual {v12, v0}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move-object v11, v12

    .end local v12    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v11    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    goto/16 :goto_1

    .line 1300
    .end local v21    # "tmpPos":I
    :cond_9
    :try_start_8
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    goto :goto_4

    .line 1309
    .restart local v21    # "tmpPos":I
    :cond_a
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v11

    goto/16 :goto_1

    .line 1331
    .end local v21    # "tmpPos":I
    :cond_b
    new-instance v8, Lorg/mozilla/javascript/ast/ForLoop;

    invoke-direct {v8, v9}, Lorg/mozilla/javascript/ast/ForLoop;-><init>(I)V

    .line 1332
    .local v8, "fl":Lorg/mozilla/javascript/ast/ForLoop;
    invoke-virtual {v8, v13}, Lorg/mozilla/javascript/ast/ForLoop;->setInitializer(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1333
    invoke-virtual {v8, v4}, Lorg/mozilla/javascript/ast/ForLoop;->setCondition(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1334
    invoke-virtual {v8, v11}, Lorg/mozilla/javascript/ast/ForLoop;->setIncrement(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1335
    move-object/from16 v18, v8

    goto/16 :goto_2

    .line 1351
    .end local v8    # "fl":Lorg/mozilla/javascript/ast/ForLoop;
    :catchall_1
    move-exception v23

    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->exitLoop()V

    throw v23
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1355
    .end local v4    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v5    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    :catchall_2
    move-exception v23

    move-object v4, v5

    .end local v5    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v4    # "cond":Lorg/mozilla/javascript/ast/AstNode;
    goto/16 :goto_3

    .end local v11    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v12    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v21    # "tmpPos":I
    :catchall_3
    move-exception v23

    move-object v11, v12

    .end local v12    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v11    # "incr":Lorg/mozilla/javascript/ast/AstNode;
    goto/16 :goto_3
.end method

.method private forLoopInit(I)Lorg/mozilla/javascript/ast/AstNode;
    .locals 4
    .param p1, "tt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1366
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 1367
    const/4 v0, 0x0

    .line 1368
    .local v0, "init":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v1, 0x52

    if-ne p1, v1, :cond_0

    .line 1369
    new-instance v0, Lorg/mozilla/javascript/ast/EmptyExpression;

    .end local v0    # "init":Lorg/mozilla/javascript/ast/AstNode;
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/ast/EmptyExpression;-><init>(II)V

    .line 1370
    .restart local v0    # "init":Lorg/mozilla/javascript/ast/AstNode;
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1380
    :goto_0
    iput-boolean v3, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    return-object v0

    .line 1371
    :cond_0
    const/16 v1, 0x7a

    if-eq p1, v1, :cond_1

    const/16 v1, 0x99

    if-ne p1, v1, :cond_2

    .line 1372
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1373
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v2}, Lorg/mozilla/javascript/Parser;->variables(IIZ)Lorg/mozilla/javascript/ast/VariableDeclaration;

    move-result-object v0

    goto :goto_0

    .line 1375
    :cond_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 1376
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1380
    .end local v0    # "init":Lorg/mozilla/javascript/ast/AstNode;
    :catchall_0
    move-exception v1

    iput-boolean v3, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    throw v1
.end method

.method private function(I)Lorg/mozilla/javascript/ast/FunctionNode;
    .locals 13
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 773
    move v10, p1

    .line 774
    .local v10, "syntheticType":I
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v11, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 775
    .local v0, "baseLineno":I
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v11, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 776
    .local v2, "functionSourceStart":I
    const/4 v8, 0x0

    .line 777
    .local v8, "name":Lorg/mozilla/javascript/ast/Name;
    const/4 v6, 0x0

    .line 779
    .local v6, "memberExprNode":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v11, 0x27

    invoke-direct {p0, v11}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 780
    const/4 v11, 0x1

    const/16 v12, 0x27

    invoke-direct {p0, v11, v12}, Lorg/mozilla/javascript/Parser;->createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;

    move-result-object v8

    .line 781
    iget-boolean v11, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    if-eqz v11, :cond_1

    .line 782
    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    .line 783
    .local v3, "id":Ljava/lang/String;
    const-string v11, "eval"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    const-string v11, "arguments"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 784
    :cond_0
    const-string v11, "msg.bad.id.strict"

    invoke-virtual {p0, v11, v3}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 787
    .end local v3    # "id":Ljava/lang/String;
    :cond_1
    const/16 v11, 0x57

    invoke-direct {p0, v11}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v11

    if-nez v11, :cond_3

    .line 788
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v11}, Lorg/mozilla/javascript/CompilerEnvirons;->isAllowMemberExprAsFunctionName()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 789
    move-object v5, v8

    .line 790
    .local v5, "memberExprHead":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v8, 0x0

    .line 791
    const/4 v11, 0x0

    invoke-direct {p0, v11, v5}, Lorg/mozilla/javascript/Parser;->memberExprTail(ZLorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    .line 793
    .end local v5    # "memberExprHead":Lorg/mozilla/javascript/ast/AstNode;
    :cond_2
    const/16 v11, 0x57

    const-string v12, "msg.no.paren.parms"

    invoke-direct {p0, v11, v12}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 806
    :cond_3
    :goto_0
    iget v11, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v12, 0x57

    if-ne v11, v12, :cond_c

    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v11, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 808
    .local v4, "lpPos":I
    :goto_1
    if-eqz v6, :cond_4

    .line 809
    const/4 v10, 0x2

    .line 812
    :cond_4
    const/4 v11, 0x2

    if-eq v10, v11, :cond_5

    if-eqz v8, :cond_5

    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/Name;->length()I

    move-result v11

    if-lez v11, :cond_5

    .line 815
    const/16 v11, 0x6d

    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v11, v12}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;)V

    .line 818
    :cond_5
    new-instance v1, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-direct {v1, v2, v8}, Lorg/mozilla/javascript/ast/FunctionNode;-><init>(ILorg/mozilla/javascript/ast/Name;)V

    .line 819
    .local v1, "fnNode":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/FunctionNode;->setFunctionType(I)V

    .line 820
    const/4 v11, -0x1

    if-eq v4, v11, :cond_6

    .line 821
    sub-int v11, v4, v2

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setLp(I)V

    .line 823
    :cond_6
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v11

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 825
    new-instance v9, Lorg/mozilla/javascript/Parser$PerFunctionVariables;

    invoke-direct {v9, p0, v1}, Lorg/mozilla/javascript/Parser$PerFunctionVariables;-><init>(Lorg/mozilla/javascript/Parser;Lorg/mozilla/javascript/ast/FunctionNode;)V

    .line 827
    .local v9, "savedVars":Lorg/mozilla/javascript/Parser$PerFunctionVariables;
    :try_start_0
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->parseFunctionParams(Lorg/mozilla/javascript/ast/FunctionNode;)V

    .line 828
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->parseFunctionBody()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v11

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setBody(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 829
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v11, v11, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    invoke-virtual {v1, v2, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 830
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v11, v11, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v11, v2

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setLength(I)V

    .line 832
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v11}, Lorg/mozilla/javascript/CompilerEnvirons;->isStrictMode()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getBody()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v11

    invoke-virtual {v11}, Lorg/mozilla/javascript/ast/AstNode;->hasConsistentReturnUsage()Z

    move-result v11

    if-nez v11, :cond_7

    .line 834
    if-eqz v8, :cond_d

    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/Name;->length()I

    move-result v11

    if-lez v11, :cond_d

    const-string v7, "msg.no.return.value"

    .line 837
    .local v7, "msg":Ljava/lang/String;
    :goto_2
    if-nez v8, :cond_e

    const-string v11, ""

    :goto_3
    invoke-virtual {p0, v7, v11}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 840
    .end local v7    # "msg":Ljava/lang/String;
    :cond_7
    invoke-virtual {v9}, Lorg/mozilla/javascript/Parser$PerFunctionVariables;->restore()V

    .line 843
    if-eqz v6, :cond_8

    .line 845
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 846
    invoke-virtual {v1, v6}, Lorg/mozilla/javascript/ast/FunctionNode;->setMemberExprNode(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 858
    :cond_8
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setSourceName(Ljava/lang/String;)V

    .line 859
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/ast/FunctionNode;->setBaseLineno(I)V

    .line 860
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v11, v11, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setEndLineno(I)V

    .line 866
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v11}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v11

    if-eqz v11, :cond_9

    .line 867
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual {v1, v11}, Lorg/mozilla/javascript/ast/FunctionNode;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 869
    :cond_9
    return-object v1

    .line 795
    .end local v1    # "fnNode":Lorg/mozilla/javascript/ast/FunctionNode;
    .end local v4    # "lpPos":I
    .end local v9    # "savedVars":Lorg/mozilla/javascript/Parser$PerFunctionVariables;
    :cond_a
    const/16 v11, 0x57

    invoke-direct {p0, v11}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v11

    if-nez v11, :cond_3

    .line 798
    iget-object v11, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v11}, Lorg/mozilla/javascript/CompilerEnvirons;->isAllowMemberExprAsFunctionName()Z

    move-result v11

    if-eqz v11, :cond_b

    .line 802
    const/4 v11, 0x0

    invoke-direct {p0, v11}, Lorg/mozilla/javascript/Parser;->memberExpr(Z)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    .line 804
    :cond_b
    const/16 v11, 0x57

    const-string v12, "msg.no.paren.parms"

    invoke-direct {p0, v11, v12}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    goto/16 :goto_0

    .line 806
    :cond_c
    const/4 v4, -0x1

    goto/16 :goto_1

    .line 834
    .restart local v1    # "fnNode":Lorg/mozilla/javascript/ast/FunctionNode;
    .restart local v4    # "lpPos":I
    .restart local v9    # "savedVars":Lorg/mozilla/javascript/Parser$PerFunctionVariables;
    :cond_d
    :try_start_1
    const-string v7, "msg.anon.no.return.value"

    goto :goto_2

    .line 837
    .restart local v7    # "msg":Ljava/lang/String;
    :cond_e
    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v11

    goto :goto_3

    .line 840
    .end local v7    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v11

    invoke-virtual {v9}, Lorg/mozilla/javascript/Parser$PerFunctionVariables;->restore()V

    throw v11
.end method

.method private generatorExpression(Lorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/AstNode;
    .locals 1
    .param p1, "result"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3092
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/Parser;->generatorExpression(Lorg/mozilla/javascript/ast/AstNode;IZ)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method private generatorExpression(Lorg/mozilla/javascript/ast/AstNode;IZ)Lorg/mozilla/javascript/ast/AstNode;
    .locals 6
    .param p1, "result"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "pos"    # I
    .param p3, "inFunctionParams"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3099
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3101
    .local v2, "loops":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;>;"
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x77

    if-ne v4, v5, :cond_0

    .line 3102
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->generatorExpressionLoop()Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3104
    :cond_0
    const/4 v1, -0x1

    .line 3105
    .local v1, "ifPos":I
    const/4 v0, 0x0

    .line 3106
    .local v0, "data":Lorg/mozilla/javascript/Parser$ConditionData;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x70

    if-ne v4, v5, :cond_1

    .line 3107
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 3108
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v1, v4, p2

    .line 3109
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->condition()Lorg/mozilla/javascript/Parser$ConditionData;

    move-result-object v0

    .line 3111
    :cond_1
    if-nez p3, :cond_2

    .line 3112
    const/16 v4, 0x58

    const-string v5, "msg.no.paren.let"

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 3114
    :cond_2
    new-instance v3, Lorg/mozilla/javascript/ast/GeneratorExpression;

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v4, p2

    invoke-direct {v3, p2, v4}, Lorg/mozilla/javascript/ast/GeneratorExpression;-><init>(II)V

    .line 3115
    .local v3, "pn":Lorg/mozilla/javascript/ast/GeneratorExpression;
    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/ast/GeneratorExpression;->setResult(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3116
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/ast/GeneratorExpression;->setLoops(Ljava/util/List;)V

    .line 3117
    if-eqz v0, :cond_3

    .line 3118
    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/ast/GeneratorExpression;->setIfPosition(I)V

    .line 3119
    iget-object v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/GeneratorExpression;->setFilter(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3120
    iget v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->lp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/GeneratorExpression;->setFilterLp(I)V

    .line 3121
    iget v4, v0, Lorg/mozilla/javascript/Parser$ConditionData;->rp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/GeneratorExpression;->setFilterRp(I)V

    .line 3123
    :cond_3
    return-object v3
.end method

.method private generatorExpressionLoop()Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3129
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v7

    const/16 v8, 0x77

    if-eq v7, v8, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 3130
    :cond_0
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 3131
    .local v5, "pos":I
    const/4 v2, -0x1

    .local v2, "lp":I
    const/4 v6, -0x1

    .local v6, "rp":I
    const/4 v0, -0x1

    .line 3132
    .local v0, "inPos":I
    new-instance v4, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;-><init>(I)V

    .line 3134
    .local v4, "pn":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 3136
    const/16 v7, 0x57

    :try_start_0
    const-string v8, "msg.no.paren.for"

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 3137
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v2, v7, v5

    .line 3140
    :cond_1
    const/4 v1, 0x0

    .line 3141
    .local v1, "iter":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    .line 3153
    const-string v7, "msg.bad.var"

    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3158
    :goto_0
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v7

    const/16 v8, 0x27

    if-ne v7, v8, :cond_2

    .line 3159
    const/16 v7, 0x99

    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v8}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {p0, v7, v8, v9}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 3162
    :cond_2
    const/16 v7, 0x34

    const-string v8, "msg.in.after.for.name"

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 3163
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v0, v7, v5

    .line 3164
    :cond_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 3165
    .local v3, "obj":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v7, 0x58

    const-string v8, "msg.no.paren.for.ctrl"

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 3166
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v6, v7, v5

    .line 3168
    :cond_4
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v7, v5

    invoke-virtual {v4, v7}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->setLength(I)V

    .line 3169
    invoke-virtual {v4, v1}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->setIterator(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3170
    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->setIteratedObject(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3171
    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->setInPosition(I)V

    .line 3172
    invoke-virtual {v4, v2, v6}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->setParens(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3175
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    return-object v4

    .line 3145
    .end local v3    # "obj":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_0
    :try_start_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->destructuringPrimaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 3146
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 3175
    .end local v1    # "iter":Lorg/mozilla/javascript/ast/AstNode;
    :catchall_0
    move-exception v7

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    throw v7

    .line 3149
    .restart local v1    # "iter":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_1
    :try_start_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 3150
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v1

    .line 3151
    goto :goto_0

    .line 3141
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_1
        0x53 -> :sswitch_0
        0x55 -> :sswitch_0
    .end sparse-switch
.end method

.method private getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;
    .locals 2

    .prologue
    .line 287
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentJsDocComment:Lorg/mozilla/javascript/ast/Comment;

    .line 288
    .local v0, "saved":Lorg/mozilla/javascript/ast/Comment;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/mozilla/javascript/Parser;->currentJsDocComment:Lorg/mozilla/javascript/ast/Comment;

    .line 289
    return-object v0
.end method

.method private getDirective(Lorg/mozilla/javascript/ast/AstNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 697
    instance-of v1, p1, Lorg/mozilla/javascript/ast/ExpressionStatement;

    if-eqz v1, :cond_0

    .line 698
    check-cast p1, Lorg/mozilla/javascript/ast/ExpressionStatement;

    .end local p1    # "n":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ExpressionStatement;->getExpression()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 699
    .local v0, "e":Lorg/mozilla/javascript/ast/AstNode;
    instance-of v1, v0, Lorg/mozilla/javascript/ast/StringLiteral;

    if-eqz v1, :cond_0

    .line 700
    check-cast v0, Lorg/mozilla/javascript/ast/StringLiteral;

    .end local v0    # "e":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 703
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I
    .locals 2
    .param p1, "n"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 267
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private getNumberOfEols(Ljava/lang/String;)I
    .locals 4
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 294
    const/4 v1, 0x0

    .line 295
    .local v1, "lines":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 296
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 297
    add-int/lit8 v1, v1, 0x1

    .line 295
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 300
    :cond_1
    return v1
.end method

.method private ifStatement()Lorg/mozilla/javascript/ast/IfStatement;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1111
    iget v8, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v9, 0x70

    if-eq v8, v9, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1112
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1113
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v8, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v7, "pos":I
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v8, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v5, "lineno":I
    const/4 v1, -0x1

    .line 1114
    .local v1, "elsePos":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->condition()Lorg/mozilla/javascript/Parser$ConditionData;

    move-result-object v0

    .line 1115
    .local v0, "data":Lorg/mozilla/javascript/Parser$ConditionData;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .local v4, "ifTrue":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v3, 0x0

    .line 1116
    .local v3, "ifFalse":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v8, 0x71

    invoke-direct {p0, v8}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1117
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v8, v8, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v1, v8, v7

    .line 1118
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 1120
    :cond_1
    if-eqz v3, :cond_2

    move-object v8, v3

    :goto_0
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    .line 1121
    .local v2, "end":I
    new-instance v6, Lorg/mozilla/javascript/ast/IfStatement;

    sub-int v8, v2, v7

    invoke-direct {v6, v7, v8}, Lorg/mozilla/javascript/ast/IfStatement;-><init>(II)V

    .line 1122
    .local v6, "pn":Lorg/mozilla/javascript/ast/IfStatement;
    iget-object v8, v0, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v6, v8}, Lorg/mozilla/javascript/ast/IfStatement;->setCondition(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1123
    iget v8, v0, Lorg/mozilla/javascript/Parser$ConditionData;->lp:I

    sub-int/2addr v8, v7

    iget v9, v0, Lorg/mozilla/javascript/Parser$ConditionData;->rp:I

    sub-int/2addr v9, v7

    invoke-virtual {v6, v8, v9}, Lorg/mozilla/javascript/ast/IfStatement;->setParens(II)V

    .line 1124
    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/ast/IfStatement;->setThenPart(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1125
    invoke-virtual {v6, v3}, Lorg/mozilla/javascript/ast/IfStatement;->setElsePart(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1126
    invoke-virtual {v6, v1}, Lorg/mozilla/javascript/ast/IfStatement;->setElsePosition(I)V

    .line 1127
    invoke-virtual {v6, v5}, Lorg/mozilla/javascript/ast/IfStatement;->setLineno(I)V

    .line 1128
    return-object v6

    .end local v2    # "end":I
    .end local v6    # "pn":Lorg/mozilla/javascript/ast/IfStatement;
    :cond_2
    move-object v8, v4

    .line 1120
    goto :goto_0
.end method

.method private let(ZI)Lorg/mozilla/javascript/ast/AstNode;
    .locals 8
    .param p1, "isStatement"    # Z
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1934
    new-instance v3, Lorg/mozilla/javascript/ast/LetNode;

    invoke-direct {v3, p2}, Lorg/mozilla/javascript/ast/LetNode;-><init>(I)V

    .line 1935
    .local v3, "pn":Lorg/mozilla/javascript/ast/LetNode;
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/ast/LetNode;->setLineno(I)V

    .line 1936
    const/16 v6, 0x57

    const-string v7, "msg.no.paren.after.let"

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1937
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v6, p2

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/ast/LetNode;->setLp(I)V

    .line 1938
    :cond_0
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 1940
    const/16 v6, 0x99

    :try_start_0
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0, v6, v7, p1}, Lorg/mozilla/javascript/Parser;->variables(IIZ)Lorg/mozilla/javascript/ast/VariableDeclaration;

    move-result-object v5

    .line 1941
    .local v5, "vars":Lorg/mozilla/javascript/ast/VariableDeclaration;
    invoke-virtual {v3, v5}, Lorg/mozilla/javascript/ast/LetNode;->setVariables(Lorg/mozilla/javascript/ast/VariableDeclaration;)V

    .line 1942
    const/16 v6, 0x58

    const-string v7, "msg.no.paren.let"

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1943
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v6, p2

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/ast/LetNode;->setRp(I)V

    .line 1945
    :cond_1
    if-eqz p1, :cond_3

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v6

    const/16 v7, 0x55

    if-ne v6, v7, :cond_3

    .line 1947
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1948
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1949
    .local v0, "beg":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statements()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 1950
    .local v4, "stmt":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v6, 0x56

    const-string v7, "msg.no.curly.let"

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1951
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v6, v0

    invoke-virtual {v4, v6}, Lorg/mozilla/javascript/ast/AstNode;->setLength(I)V

    .line 1952
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v6, p2

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/ast/LetNode;->setLength(I)V

    .line 1953
    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/LetNode;->setBody(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1954
    const/16 v6, 0x99

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/ast/LetNode;->setType(I)Lorg/mozilla/javascript/Node;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1969
    .end local v0    # "beg":I
    .end local v4    # "stmt":Lorg/mozilla/javascript/ast/AstNode;
    :cond_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    .line 1971
    .end local v3    # "pn":Lorg/mozilla/javascript/ast/LetNode;
    :goto_0
    return-object v3

    .line 1957
    .restart local v3    # "pn":Lorg/mozilla/javascript/ast/LetNode;
    :cond_3
    :try_start_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 1958
    .local v2, "expr":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v6

    sub-int/2addr v6, p2

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/ast/LetNode;->setLength(I)V

    .line 1959
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/ast/LetNode;->setBody(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1960
    if-eqz p1, :cond_2

    .line 1962
    new-instance v1, Lorg/mozilla/javascript/ast/ExpressionStatement;

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v6

    if-nez v6, :cond_4

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v1, v3, v6}, Lorg/mozilla/javascript/ast/ExpressionStatement;-><init>(Lorg/mozilla/javascript/ast/AstNode;Z)V

    .line 1964
    .local v1, "es":Lorg/mozilla/javascript/ast/ExpressionStatement;
    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/LetNode;->getLineno()I

    move-result v6

    invoke-virtual {v1, v6}, Lorg/mozilla/javascript/ast/ExpressionStatement;->setLineno(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1969
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    move-object v3, v1

    goto :goto_0

    .line 1962
    .end local v1    # "es":Lorg/mozilla/javascript/ast/ExpressionStatement;
    :cond_4
    const/4 v6, 0x0

    goto :goto_1

    .line 1969
    .end local v2    # "expr":Lorg/mozilla/javascript/ast/AstNode;
    .end local v5    # "vars":Lorg/mozilla/javascript/ast/VariableDeclaration;
    :catchall_0
    move-exception v6

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    throw v6
.end method

.method private letStatement()Lorg/mozilla/javascript/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x99

    const/4 v5, 0x1

    .line 1627
    iget v3, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    if-eq v3, v6, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1628
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1629
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v0, "lineno":I
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1631
    .local v2, "pos":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x57

    if-ne v3, v4, :cond_1

    .line 1632
    invoke-direct {p0, v5, v2}, Lorg/mozilla/javascript/Parser;->let(ZI)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1636
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    .line 1637
    return-object v1

    .line 1634
    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    invoke-direct {p0, v6, v2, v5}, Lorg/mozilla/javascript/Parser;->variables(IIZ)Lorg/mozilla/javascript/ast/VariableDeclaration;

    move-result-object v1

    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0
.end method

.method private lineBeginningFor(I)I
    .locals 4
    .param p1, "pos"    # I

    .prologue
    const/4 v2, 0x0

    .line 3529
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->sourceChars:[C

    if-nez v3, :cond_1

    .line 3530
    const/4 v2, -0x1

    .line 3545
    :cond_0
    :goto_0
    return v2

    .line 3532
    :cond_1
    if-lez p1, :cond_0

    .line 3535
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->sourceChars:[C

    .line 3536
    .local v0, "buf":[C
    array-length v3, v0

    if-lt p1, v3, :cond_2

    .line 3537
    array-length v3, v0

    add-int/lit8 p1, v3, -0x1

    .line 3539
    :cond_2
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_0

    .line 3540
    aget-char v1, v0, p1

    .line 3541
    .local v1, "c":C
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3542
    add-int/lit8 v2, p1, 0x1

    goto :goto_0
.end method

.method private makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;
    .locals 4

    .prologue
    .line 3499
    new-instance v0, Lorg/mozilla/javascript/ast/ErrorNode;

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v2, v3

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/ast/ErrorNode;-><init>(II)V

    .line 3500
    .local v0, "pn":Lorg/mozilla/javascript/ast/ErrorNode;
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/ErrorNode;->setLineno(I)V

    .line 3501
    return-object v0
.end method

.method private matchJumpLabelName()Lorg/mozilla/javascript/ast/LabeledStatement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1509
    const/4 v0, 0x0

    .line 1511
    .local v0, "label":Lorg/mozilla/javascript/ast/LabeledStatement;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v1

    const/16 v2, 0x27

    if-ne v1, v2, :cond_1

    .line 1512
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1513
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 1514
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v2}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "label":Lorg/mozilla/javascript/ast/LabeledStatement;
    check-cast v0, Lorg/mozilla/javascript/ast/LabeledStatement;

    .line 1516
    .restart local v0    # "label":Lorg/mozilla/javascript/ast/LabeledStatement;
    :cond_0
    if-nez v0, :cond_1

    .line 1517
    const-string v1, "msg.undef.label"

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1521
    :cond_1
    return-object v0
.end method

.method private matchToken(I)Z
    .locals 1
    .param p1, "toMatch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 386
    const/4 v0, 0x0

    .line 389
    :goto_0
    return v0

    .line 388
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 389
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private memberExpr(Z)Lorg/mozilla/javascript/ast/AstNode;
    .locals 14
    .param p1, "allowCallSyntax"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2447
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v11

    .local v11, "tt":I
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v12, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2450
    .local v3, "lineno":I
    const/16 v12, 0x1e

    if-eq v11, v12, :cond_0

    .line 2451
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->primaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    .line 2486
    .local v6, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-virtual {v6, v3}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    .line 2487
    invoke-direct {p0, p1, v6}, Lorg/mozilla/javascript/Parser;->memberExprTail(ZLorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v9

    .line 2488
    .local v9, "tail":Lorg/mozilla/javascript/ast/AstNode;
    return-object v9

    .line 2453
    .end local v6    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .end local v9    # "tail":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2454
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2455
    .local v7, "pos":I
    new-instance v5, Lorg/mozilla/javascript/ast/NewExpression;

    invoke-direct {v5, v7}, Lorg/mozilla/javascript/ast/NewExpression;-><init>(I)V

    .line 2457
    .local v5, "nx":Lorg/mozilla/javascript/ast/NewExpression;
    const/4 v12, 0x0

    invoke-direct {p0, v12}, Lorg/mozilla/javascript/Parser;->memberExpr(Z)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v10

    .line 2458
    .local v10, "target":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v10}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v1

    .line 2459
    .local v1, "end":I
    invoke-virtual {v5, v10}, Lorg/mozilla/javascript/ast/NewExpression;->setTarget(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2461
    const/4 v4, -0x1

    .line 2462
    .local v4, "lp":I
    const/16 v12, 0x57

    invoke-direct {p0, v12}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 2463
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2464
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->argumentList()Ljava/util/List;

    move-result-object v0

    .line 2465
    .local v0, "args":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v12

    const/high16 v13, 0x10000

    if-le v12, v13, :cond_1

    .line 2466
    const-string v12, "msg.too.many.constructor.args"

    invoke-virtual {p0, v12}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2467
    :cond_1
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v8, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2468
    .local v8, "rp":I
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v12, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2469
    if-eqz v0, :cond_2

    .line 2470
    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/ast/NewExpression;->setArguments(Ljava/util/List;)V

    .line 2471
    :cond_2
    sub-int v12, v4, v7

    sub-int v13, v8, v7

    invoke-virtual {v5, v12, v13}, Lorg/mozilla/javascript/ast/NewExpression;->setParens(II)V

    .line 2478
    .end local v0    # "args":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    .end local v8    # "rp":I
    :cond_3
    const/16 v12, 0x55

    invoke-direct {p0, v12}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 2479
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->objectLiteral()Lorg/mozilla/javascript/ast/ObjectLiteral;

    move-result-object v2

    .line 2480
    .local v2, "initializer":Lorg/mozilla/javascript/ast/ObjectLiteral;
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v1

    .line 2481
    invoke-virtual {v5, v2}, Lorg/mozilla/javascript/ast/NewExpression;->setInitializer(Lorg/mozilla/javascript/ast/ObjectLiteral;)V

    .line 2483
    .end local v2    # "initializer":Lorg/mozilla/javascript/ast/ObjectLiteral;
    :cond_4
    sub-int v12, v1, v7

    invoke-virtual {v5, v12}, Lorg/mozilla/javascript/ast/NewExpression;->setLength(I)V

    .line 2484
    move-object v6, v5

    .restart local v6    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0
.end method

.method private memberExprTail(ZLorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;
    .locals 19
    .param p1, "allowCallSyntax"    # Z
    .param p2, "pn"    # Lorg/mozilla/javascript/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2502
    if-nez p2, :cond_0

    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2503
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v12

    .line 2507
    .local v12, "pos":I
    :goto_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v16

    .line 2508
    .local v16, "tt":I
    sparse-switch v16, :sswitch_data_0

    .line 2581
    :cond_1
    return-object p2

    .line 2511
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v10, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2512
    .local v10, "lineno":I
    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->propertyAccess(ILorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object p2

    .line 2513
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto :goto_0

    .line 2517
    .end local v10    # "lineno":I
    :sswitch_1
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2518
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v11, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v11, "opPos":I
    const/4 v15, -0x1

    .line 2519
    .local v15, "rp":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v10, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2520
    .restart local v10    # "lineno":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->mustHaveXML()V

    .line 2521
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->setRequiresActivation()V

    .line 2522
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    .line 2523
    .local v7, "filter":Lorg/mozilla/javascript/ast/AstNode;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v4

    .line 2524
    .local v4, "end":I
    const/16 v17, 0x58

    const-string v18, "msg.no.paren"

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 2525
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v15, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2526
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v4, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2528
    :cond_2
    new-instance v13, Lorg/mozilla/javascript/ast/XmlDotQuery;

    sub-int v17, v4, v12

    move/from16 v0, v17

    invoke-direct {v13, v12, v0}, Lorg/mozilla/javascript/ast/XmlDotQuery;-><init>(II)V

    .line 2529
    .local v13, "q":Lorg/mozilla/javascript/ast/XmlDotQuery;
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Lorg/mozilla/javascript/ast/XmlDotQuery;->setLeft(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2530
    invoke-virtual {v13, v7}, Lorg/mozilla/javascript/ast/XmlDotQuery;->setRight(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2531
    invoke-virtual {v13, v11}, Lorg/mozilla/javascript/ast/XmlDotQuery;->setOperatorPosition(I)V

    .line 2532
    sub-int v17, v15, v12

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Lorg/mozilla/javascript/ast/XmlDotQuery;->setRp(I)V

    .line 2533
    invoke-virtual {v13, v10}, Lorg/mozilla/javascript/ast/XmlDotQuery;->setLineno(I)V

    .line 2534
    move-object/from16 p2, v13

    .line 2535
    goto/16 :goto_0

    .line 2538
    .end local v4    # "end":I
    .end local v7    # "filter":Lorg/mozilla/javascript/ast/AstNode;
    .end local v10    # "lineno":I
    .end local v11    # "opPos":I
    .end local v13    # "q":Lorg/mozilla/javascript/ast/XmlDotQuery;
    .end local v15    # "rp":I
    :sswitch_2
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2539
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v9, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v9, "lb":I
    const/4 v14, -0x1

    .line 2540
    .local v14, "rb":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v10, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2541
    .restart local v10    # "lineno":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v5

    .line 2542
    .local v5, "expr":Lorg/mozilla/javascript/ast/AstNode;
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v4

    .line 2543
    .restart local v4    # "end":I
    const/16 v17, 0x54

    const-string v18, "msg.no.bracket.index"

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 2544
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v14, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2545
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v4, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2547
    :cond_3
    new-instance v8, Lorg/mozilla/javascript/ast/ElementGet;

    sub-int v17, v4, v12

    move/from16 v0, v17

    invoke-direct {v8, v12, v0}, Lorg/mozilla/javascript/ast/ElementGet;-><init>(II)V

    .line 2548
    .local v8, "g":Lorg/mozilla/javascript/ast/ElementGet;
    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Lorg/mozilla/javascript/ast/ElementGet;->setTarget(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2549
    invoke-virtual {v8, v5}, Lorg/mozilla/javascript/ast/ElementGet;->setElement(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2550
    invoke-virtual {v8, v9, v14}, Lorg/mozilla/javascript/ast/ElementGet;->setParens(II)V

    .line 2551
    invoke-virtual {v8, v10}, Lorg/mozilla/javascript/ast/ElementGet;->setLineno(I)V

    .line 2552
    move-object/from16 p2, v8

    .line 2553
    goto/16 :goto_0

    .line 2556
    .end local v4    # "end":I
    .end local v5    # "expr":Lorg/mozilla/javascript/ast/AstNode;
    .end local v8    # "g":Lorg/mozilla/javascript/ast/ElementGet;
    .end local v9    # "lb":I
    .end local v10    # "lineno":I
    .end local v14    # "rb":I
    :sswitch_3
    if-eqz p1, :cond_1

    .line 2559
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v10, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2560
    .restart local v10    # "lineno":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2561
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->checkCallRequiresActivation(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2562
    new-instance v6, Lorg/mozilla/javascript/ast/FunctionCall;

    invoke-direct {v6, v12}, Lorg/mozilla/javascript/ast/FunctionCall;-><init>(I)V

    .line 2563
    .local v6, "f":Lorg/mozilla/javascript/ast/FunctionCall;
    move-object/from16 v0, p2

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/FunctionCall;->setTarget(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2566
    invoke-virtual {v6, v10}, Lorg/mozilla/javascript/ast/FunctionCall;->setLineno(I)V

    .line 2567
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v17, v0

    sub-int v17, v17, v12

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/FunctionCall;->setLp(I)V

    .line 2568
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->argumentList()Ljava/util/List;

    move-result-object v3

    .line 2569
    .local v3, "args":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    if-eqz v3, :cond_4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v17

    const/high16 v18, 0x10000

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_4

    .line 2570
    const-string v17, "msg.too.many.function.args"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2571
    :cond_4
    invoke-virtual {v6, v3}, Lorg/mozilla/javascript/ast/FunctionCall;->setArguments(Ljava/util/List;)V

    .line 2572
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v17, v0

    sub-int v17, v17, v12

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/FunctionCall;->setRp(I)V

    .line 2573
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    move/from16 v17, v0

    sub-int v17, v17, v12

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/FunctionCall;->setLength(I)V

    .line 2574
    move-object/from16 p2, v6

    .line 2575
    goto/16 :goto_0

    .line 2508
    :sswitch_data_0
    .sparse-switch
        0x53 -> :sswitch_2
        0x57 -> :sswitch_3
        0x6c -> :sswitch_0
        0x8f -> :sswitch_0
        0x92 -> :sswitch_1
    .end sparse-switch
.end method

.method private methodDefinition(ILorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/ObjectProperty;
    .locals 5
    .param p1, "pos"    # I
    .param p2, "propName"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p3, "entryKind"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3367
    const/4 v4, 0x2

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->function(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v1

    .line 3369
    .local v1, "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionName()Lorg/mozilla/javascript/ast/Name;

    move-result-object v2

    .line 3370
    .local v2, "name":Lorg/mozilla/javascript/ast/Name;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/Name;->length()I

    move-result v4

    if-eqz v4, :cond_0

    .line 3371
    const-string v4, "msg.bad.prop"

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3373
    :cond_0
    new-instance v3, Lorg/mozilla/javascript/ast/ObjectProperty;

    invoke-direct {v3, p1}, Lorg/mozilla/javascript/ast/ObjectProperty;-><init>(I)V

    .line 3374
    .local v3, "pn":Lorg/mozilla/javascript/ast/ObjectProperty;
    sparse-switch p3, :sswitch_data_0

    .line 3388
    :goto_0
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v0

    .line 3389
    .local v0, "end":I
    invoke-virtual {v3, p2}, Lorg/mozilla/javascript/ast/ObjectProperty;->setLeft(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3390
    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/ast/ObjectProperty;->setRight(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3391
    sub-int v4, v0, p1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/ObjectProperty;->setLength(I)V

    .line 3392
    return-object v3

    .line 3376
    .end local v0    # "end":I
    :sswitch_0
    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ObjectProperty;->setIsGetterMethod()V

    .line 3377
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->setFunctionIsGetterMethod()V

    goto :goto_0

    .line 3380
    :sswitch_1
    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ObjectProperty;->setIsSetterMethod()V

    .line 3381
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->setFunctionIsSetterMethod()V

    goto :goto_0

    .line 3384
    :sswitch_2
    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ObjectProperty;->setIsNormalMethod()V

    .line 3385
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/FunctionNode;->setFunctionIsNormalMethod()V

    goto :goto_0

    .line 3374
    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x4 -> :sswitch_1
        0x8 -> :sswitch_2
    .end sparse-switch
.end method

.method private mulExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2274
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->unaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2276
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    .local v3, "tt":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2277
    .local v0, "opPos":I
    packed-switch v3, :pswitch_data_0

    .line 2287
    return-object v1

    .line 2281
    :pswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2282
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->unaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2283
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2277
    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private mustHaveXML()V
    .locals 1

    .prologue
    .line 426
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isXmlAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 427
    const-string v0, "msg.XML.not.available"

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 429
    :cond_0
    return-void
.end method

.method private mustMatchToken(ILjava/lang/String;)Z
    .locals 3
    .param p1, "toMatch"    # I
    .param p2, "messageId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 411
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;II)Z

    move-result v0

    return v0
.end method

.method private mustMatchToken(ILjava/lang/String;II)Z
    .locals 1
    .param p1, "toMatch"    # I
    .param p2, "msgId"    # Ljava/lang/String;
    .param p3, "pos"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 418
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    const/4 v0, 0x1

    .line 422
    :goto_0
    return v0

    .line 421
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;II)V

    .line 422
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private name(II)Lorg/mozilla/javascript/ast/AstNode;
    .locals 6
    .param p1, "ttFlagged"    # I
    .param p2, "tt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2911
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    .line 2912
    .local v3, "nameString":Ljava/lang/String;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v2, "namePos":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2913
    .local v1, "nameLineno":I
    const/high16 v4, 0x20000

    and-int/2addr v4, p1

    if-eqz v4, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x67

    if-ne v4, v5, :cond_0

    .line 2916
    new-instance v0, Lorg/mozilla/javascript/ast/Label;

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v4, v2

    invoke-direct {v0, v2, v4}, Lorg/mozilla/javascript/ast/Label;-><init>(II)V

    .line 2917
    .local v0, "label":Lorg/mozilla/javascript/ast/Label;
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Label;->setName(Ljava/lang/String;)V

    .line 2918
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/ast/Label;->setLineno(I)V

    .line 2929
    .end local v0    # "label":Lorg/mozilla/javascript/ast/Label;
    :goto_0
    return-object v0

    .line 2924
    :cond_0
    invoke-direct {p0, v2, v3, v1}, Lorg/mozilla/javascript/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2926
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v4}, Lorg/mozilla/javascript/CompilerEnvirons;->isXmlAvailable()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2927
    const/4 v4, -0x1

    const/4 v5, 0x0

    invoke-direct {p0, v4, v3, v5}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    goto :goto_0

    .line 2929
    :cond_1
    const/4 v4, 0x1

    const/16 v5, 0x27

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/Parser;->createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    goto :goto_0
.end method

.method private nameOrLabel()Lorg/mozilla/javascript/ast/AstNode;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v12, 0x20000

    const/16 v11, 0x82

    const/16 v10, 0x27

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1793
    iget v7, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    if-eq v7, v10, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 1794
    :cond_0
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1797
    .local v5, "pos":I
    iget v7, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    or-int/2addr v7, v12

    iput v7, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    .line 1798
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1800
    .local v1, "expr":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v7

    if-eq v7, v11, :cond_2

    .line 1801
    new-instance v4, Lorg/mozilla/javascript/ast/ExpressionStatement;

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v7

    if-nez v7, :cond_1

    move v7, v8

    :goto_0
    invoke-direct {v4, v1, v7}, Lorg/mozilla/javascript/ast/ExpressionStatement;-><init>(Lorg/mozilla/javascript/ast/AstNode;Z)V

    .line 1802
    .local v4, "n":Lorg/mozilla/javascript/ast/AstNode;
    iget v7, v1, Lorg/mozilla/javascript/ast/AstNode;->lineno:I

    iput v7, v4, Lorg/mozilla/javascript/ast/AstNode;->lineno:I

    .line 1842
    .end local v4    # "n":Lorg/mozilla/javascript/ast/AstNode;
    :goto_1
    return-object v4

    :cond_1
    move v7, v9

    .line 1801
    goto :goto_0

    .line 1806
    :cond_2
    new-instance v0, Lorg/mozilla/javascript/ast/LabeledStatement;

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/ast/LabeledStatement;-><init>(I)V

    .local v0, "bundle":Lorg/mozilla/javascript/ast/LabeledStatement;
    move-object v7, v1

    .line 1807
    check-cast v7, Lorg/mozilla/javascript/ast/Label;

    invoke-direct {p0, v7, v0}, Lorg/mozilla/javascript/Parser;->recordLabel(Lorg/mozilla/javascript/ast/Label;Lorg/mozilla/javascript/ast/LabeledStatement;)V

    .line 1808
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v0, v7}, Lorg/mozilla/javascript/ast/LabeledStatement;->setLineno(I)V

    .line 1810
    const/4 v6, 0x0

    .line 1811
    .local v6, "stmt":Lorg/mozilla/javascript/ast/AstNode;
    :goto_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v7

    if-ne v7, v10, :cond_3

    .line 1812
    iget v7, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    or-int/2addr v7, v12

    iput v7, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    .line 1813
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1814
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v7

    if-eq v7, v11, :cond_6

    .line 1815
    new-instance v6, Lorg/mozilla/javascript/ast/ExpressionStatement;

    .end local v6    # "stmt":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v7

    if-nez v7, :cond_5

    :goto_3
    invoke-direct {v6, v1, v8}, Lorg/mozilla/javascript/ast/ExpressionStatement;-><init>(Lorg/mozilla/javascript/ast/AstNode;Z)V

    .line 1816
    .restart local v6    # "stmt":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v6}, Lorg/mozilla/javascript/Parser;->autoInsertSemicolon(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1824
    :cond_3
    :try_start_0
    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    .line 1825
    if-nez v6, :cond_4

    .line 1826
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statementHelper()Lorg/mozilla/javascript/ast/AstNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    .line 1829
    :cond_4
    const/4 v7, 0x0

    iput-object v7, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    .line 1831
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/LabeledStatement;->getLabels()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/ast/Label;

    .line 1832
    .local v3, "lb":Lorg/mozilla/javascript/ast/Label;
    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/Label;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "lb":Lorg/mozilla/javascript/ast/Label;
    .end local v6    # "stmt":Lorg/mozilla/javascript/ast/AstNode;
    :cond_5
    move v8, v9

    .line 1815
    goto :goto_3

    .restart local v6    # "stmt":Lorg/mozilla/javascript/ast/AstNode;
    :cond_6
    move-object v7, v1

    .line 1819
    check-cast v7, Lorg/mozilla/javascript/ast/Label;

    invoke-direct {p0, v7, v0}, Lorg/mozilla/javascript/Parser;->recordLabel(Lorg/mozilla/javascript/ast/Label;Lorg/mozilla/javascript/ast/LabeledStatement;)V

    goto :goto_2

    .line 1829
    :catchall_0
    move-exception v7

    const/4 v8, 0x0

    iput-object v8, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    .line 1831
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/LabeledStatement;->getLabels()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/ast/Label;

    .line 1832
    .restart local v3    # "lb":Lorg/mozilla/javascript/ast/Label;
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/Label;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 1833
    .end local v3    # "lb":Lorg/mozilla/javascript/ast/Label;
    :cond_7
    throw v7

    .line 1838
    :cond_8
    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/AstNode;->getParent()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    if-nez v7, :cond_9

    invoke-direct {p0, v6}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v7

    sub-int/2addr v7, v5

    :goto_6
    invoke-virtual {v0, v7}, Lorg/mozilla/javascript/ast/LabeledStatement;->setLength(I)V

    .line 1841
    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/ast/LabeledStatement;->setStatement(Lorg/mozilla/javascript/ast/AstNode;)V

    move-object v4, v0

    .line 1842
    goto/16 :goto_1

    .line 1838
    :cond_9
    invoke-direct {p0, v6}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v7

    goto :goto_6
.end method

.method private nextFlaggedToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 376
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    .line 377
    iget v0, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    .line 378
    .local v0, "ttFlagged":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 379
    return v0
.end method

.method private nextToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 368
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v0

    .line 369
    .local v0, "tt":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 370
    return v0
.end method

.method private nodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I
    .locals 2
    .param p1, "node"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 3506
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static final nowAllSet(III)Z
    .locals 1
    .param p0, "before"    # I
    .param p1, "after"    # I
    .param p2, "mask"    # I

    .prologue
    .line 1649
    and-int v0, p0, p2

    if-eq v0, p2, :cond_0

    and-int v0, p1, p2

    if-ne v0, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private objectLiteral()Lorg/mozilla/javascript/ast/ObjectLiteral;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3187
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v14, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v14, "pos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v8, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 3188
    .local v8, "lineno":I
    const/4 v3, -0x1

    .line 3189
    .local v3, "afterComma":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 3190
    .local v4, "elems":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/ObjectProperty;>;"
    const/4 v6, 0x0

    .line 3191
    .local v6, "getterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/16 v17, 0x0

    .line 3192
    .local v17, "setterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    move/from16 v19, v0

    if-eqz v19, :cond_0

    .line 3193
    new-instance v6, Ljava/util/HashSet;

    .end local v6    # "getterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 3194
    .restart local v6    # "getterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v17, Ljava/util/HashSet;

    .end local v17    # "setterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct/range {v17 .. v17}, Ljava/util/HashSet;-><init>()V

    .line 3196
    .restart local v17    # "setterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v9

    .line 3200
    .local v9, "objJsdocNode":Lorg/mozilla/javascript/ast/Comment;
    :goto_0
    const/16 v16, 0x0

    .line 3201
    .local v16, "propertyName":Ljava/lang/String;
    const/4 v5, 0x1

    .line 3202
    .local v5, "entryKind":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v18

    .line 3203
    .local v18, "tt":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v7

    .line 3205
    .local v7, "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    const/16 v19, 0x56

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 3206
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v3, v0, :cond_1

    .line 3207
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v4, v3}, Lorg/mozilla/javascript/Parser;->warnTrailingComma(ILjava/util/List;I)V

    .line 3300
    :cond_1
    const/16 v19, 0x56

    const-string v20, "msg.no.brace.prop"

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 3301
    new-instance v12, Lorg/mozilla/javascript/ast/ObjectLiteral;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    move/from16 v19, v0

    sub-int v19, v19, v14

    move/from16 v0, v19

    invoke-direct {v12, v14, v0}, Lorg/mozilla/javascript/ast/ObjectLiteral;-><init>(II)V

    .line 3302
    .local v12, "pn":Lorg/mozilla/javascript/ast/ObjectLiteral;
    if-eqz v9, :cond_2

    .line 3303
    invoke-virtual {v12, v9}, Lorg/mozilla/javascript/ast/ObjectLiteral;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 3305
    :cond_2
    invoke-virtual {v12, v4}, Lorg/mozilla/javascript/ast/ObjectLiteral;->setElements(Ljava/util/List;)V

    .line 3306
    invoke-virtual {v12, v8}, Lorg/mozilla/javascript/ast/ObjectLiteral;->setLineno(I)V

    .line 3307
    return-object v12

    .line 3210
    .end local v12    # "pn":Lorg/mozilla/javascript/ast/ObjectLiteral;
    :cond_3
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->objliteralProperty()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v13

    .line 3211
    .local v13, "pname":Lorg/mozilla/javascript/ast/AstNode;
    if-nez v13, :cond_5

    .line 3212
    const/16 v16, 0x0

    .line 3213
    const-string v19, "msg.bad.prop"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3264
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    move/from16 v19, v0

    if-eqz v19, :cond_4

    if-eqz v16, :cond_4

    .line 3265
    packed-switch v5, :pswitch_data_0

    .line 3291
    :cond_4
    :goto_2
    :pswitch_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    .line 3293
    const/16 v19, 0x59

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3294
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v3, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 3298
    goto/16 :goto_0

    .line 3215
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v16

    .line 3216
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v15, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 3217
    .local v15, "ppos":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 3227
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v11

    .line 3228
    .local v11, "peeked":I
    const/16 v19, 0x59

    move/from16 v0, v19

    if-eq v11, v0, :cond_d

    const/16 v19, 0x67

    move/from16 v0, v19

    if-eq v11, v0, :cond_d

    const/16 v19, 0x56

    move/from16 v0, v19

    if-eq v11, v0, :cond_d

    .line 3232
    const/16 v19, 0x57

    move/from16 v0, v19

    if-ne v11, v0, :cond_a

    .line 3233
    const/16 v5, 0x8

    .line 3241
    :cond_6
    :goto_3
    const/16 v19, 0x2

    move/from16 v0, v19

    if-eq v5, v0, :cond_7

    const/16 v19, 0x4

    move/from16 v0, v19

    if-ne v5, v0, :cond_9

    .line 3242
    :cond_7
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->objliteralProperty()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v13

    .line 3243
    if-nez v13, :cond_8

    .line 3244
    const-string v19, "msg.bad.prop"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3246
    :cond_8
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 3248
    :cond_9
    if-nez v13, :cond_c

    .line 3249
    const/16 v16, 0x0

    goto :goto_1

    .line 3234
    :cond_a
    invoke-virtual {v13}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v19

    const/16 v20, 0x27

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_6

    .line 3235
    const-string v19, "get"

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_b

    .line 3236
    const/4 v5, 0x2

    goto :goto_3

    .line 3237
    :cond_b
    const-string v19, "set"

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 3238
    const/4 v5, 0x4

    goto :goto_3

    .line 3251
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v16

    .line 3252
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v13, v5}, Lorg/mozilla/javascript/Parser;->methodDefinition(ILorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/ObjectProperty;

    move-result-object v10

    .line 3254
    .local v10, "objectProp":Lorg/mozilla/javascript/ast/ObjectProperty;
    invoke-virtual {v13, v7}, Lorg/mozilla/javascript/ast/AstNode;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 3255
    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 3258
    .end local v10    # "objectProp":Lorg/mozilla/javascript/ast/ObjectProperty;
    :cond_d
    invoke-virtual {v13, v7}, Lorg/mozilla/javascript/ast/AstNode;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 3259
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v13, v1}, Lorg/mozilla/javascript/Parser;->plainProperty(Lorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/ObjectProperty;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 3268
    .end local v11    # "peeked":I
    .end local v15    # "ppos":I
    :pswitch_1
    move-object/from16 v0, v16

    invoke-interface {v6, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_e

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_f

    .line 3270
    :cond_e
    const-string v19, "msg.dup.obj.lit.prop.strict"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3272
    :cond_f
    move-object/from16 v0, v16

    invoke-interface {v6, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 3273
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 3276
    :pswitch_2
    move-object/from16 v0, v16

    invoke-interface {v6, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_10

    .line 3277
    const-string v19, "msg.dup.obj.lit.prop.strict"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3279
    :cond_10
    move-object/from16 v0, v16

    invoke-interface {v6, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 3282
    :pswitch_3
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_11

    .line 3283
    const-string v19, "msg.dup.obj.lit.prop.strict"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3285
    :cond_11
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 3265
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private objliteralProperty()Lorg/mozilla/javascript/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3312
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v1

    .line 3313
    .local v1, "tt":I
    packed-switch v1, :pswitch_data_0

    .line 3328
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v2}, Lorg/mozilla/javascript/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v2}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/TokenStream;->isKeyword(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3331
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    .line 3337
    :goto_0
    return-object v0

    .line 3315
    :pswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    .line 3316
    .local v0, "pname":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 3319
    .end local v0    # "pname":Lorg/mozilla/javascript/ast/AstNode;
    :pswitch_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createStringLiteral()Lorg/mozilla/javascript/ast/StringLiteral;

    move-result-object v0

    .line 3320
    .restart local v0    # "pname":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 3323
    .end local v0    # "pname":Lorg/mozilla/javascript/ast/AstNode;
    :pswitch_2
    new-instance v0, Lorg/mozilla/javascript/ast/NumberLiteral;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v3}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getNumber()D

    move-result-wide v4

    invoke-direct {v0, v2, v3, v4, v5}, Lorg/mozilla/javascript/ast/NumberLiteral;-><init>(ILjava/lang/String;D)V

    .line 3325
    .restart local v0    # "pname":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 3334
    .end local v0    # "pname":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 3313
    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private orExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x68

    .line 2131
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->andExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2132
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2133
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2134
    .local v0, "opPos":I
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->orExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-direct {v2, v4, v1, v3, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2136
    .end local v0    # "opPos":I
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    return-object v1
.end method

.method private parenExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2884
    iget-boolean v5, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2885
    .local v5, "wasInForInit":Z
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    .line 2887
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v2

    .line 2888
    .local v2, "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v6, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2889
    .local v3, "lineno":I
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2890
    .local v0, "begin":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2891
    .local v1, "e":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v6

    const/16 v7, 0x77

    if-ne v6, v7, :cond_0

    .line 2892
    invoke-direct {p0, v1, v0}, Lorg/mozilla/javascript/Parser;->generatorExpression(Lorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/AstNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 2906
    iput-boolean v5, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    :goto_0
    return-object v4

    .line 2894
    :cond_0
    :try_start_1
    new-instance v4, Lorg/mozilla/javascript/ast/ParenthesizedExpression;

    invoke-direct {v4, v1}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;-><init>(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2895
    .local v4, "pn":Lorg/mozilla/javascript/ast/ParenthesizedExpression;
    if-nez v2, :cond_1

    .line 2896
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v2

    .line 2898
    :cond_1
    if-eqz v2, :cond_2

    .line 2899
    invoke-virtual {v4, v2}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 2901
    :cond_2
    const/16 v6, 0x58

    const-string v7, "msg.no.paren"

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 2902
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;->getPosition()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v4, v6}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;->setLength(I)V

    .line 2903
    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;->setLineno(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2906
    iput-boolean v5, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    goto :goto_0

    .end local v0    # "begin":I
    .end local v1    # "e":Lorg/mozilla/javascript/ast/AstNode;
    .end local v2    # "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    .end local v3    # "lineno":I
    .end local v4    # "pn":Lorg/mozilla/javascript/ast/ParenthesizedExpression;
    :catchall_0
    move-exception v6

    iput-boolean v5, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    throw v6
.end method

.method private parse()Lorg/mozilla/javascript/ast/AstRoot;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 543
    const/16 v17, 0x0

    .line 544
    .local v17, "pos":I
    new-instance v18, Lorg/mozilla/javascript/ast/AstRoot;

    move-object/from16 v0, v18

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ast/AstRoot;-><init>(I)V

    .line 545
    .local v18, "root":Lorg/mozilla/javascript/ast/AstRoot;
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    .line 547
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v2, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 548
    .local v5, "baseLineno":I
    move/from16 v11, v17

    .line 550
    .local v11, "end":I
    const/4 v14, 0x1

    .line 551
    .local v14, "inDirectivePrologue":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    move/from16 v19, v0

    .line 553
    .local v19, "savedStrictMode":Z
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    .line 557
    :goto_0
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I
    :try_end_0
    .catch Ljava/lang/StackOverflowError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v20

    .line 558
    .local v20, "tt":I
    if-gtz v20, :cond_0

    .line 595
    :goto_1
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    .line 598
    .end local v20    # "tt":I
    :goto_2
    move-object/from16 v0, p0

    iget v2, v0, Lorg/mozilla/javascript/Parser;->syntaxErrorCount:I

    if-eqz v2, :cond_6

    .line 599
    move-object/from16 v0, p0

    iget v2, v0, Lorg/mozilla/javascript/Parser;->syntaxErrorCount:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .line 600
    .local v3, "msg":Ljava/lang/String;
    const-string v2, "msg.got.syntax.errors"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 601
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v2}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v2

    if-nez v2, :cond_6

    .line 602
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface/range {v2 .. v7}, Lorg/mozilla/javascript/ErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 563
    .end local v3    # "msg":Ljava/lang/String;
    .restart local v20    # "tt":I
    :cond_0
    const/16 v2, 0x6d

    move/from16 v0, v20

    if-ne v0, v2, :cond_3

    .line 564
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V
    :try_end_1
    .catch Ljava/lang/StackOverflowError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 566
    :try_start_2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/mozilla/javascript/Parser;->calledByCompileFunction:Z

    if-eqz v2, :cond_2

    const/4 v2, 0x2

    :goto_3
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/mozilla/javascript/Parser;->function(I)Lorg/mozilla/javascript/ast/FunctionNode;
    :try_end_2
    .catch Lorg/mozilla/javascript/Parser$ParserException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/StackOverflowError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v16

    .line 585
    .local v16, "n":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    :goto_4
    :try_start_3
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v11

    .line 586
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/AstRoot;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 587
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_3
    .catch Ljava/lang/StackOverflowError; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 589
    .end local v16    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .end local v20    # "tt":I
    :catch_0
    move-exception v12

    .line 590
    .local v12, "ex":Ljava/lang/StackOverflowError;
    :try_start_4
    const-string v2, "msg.too.deep.parser.recursion"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 591
    .restart local v3    # "msg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v2}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v2

    if-nez v2, :cond_5

    .line 592
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v3, v2, v4, v6, v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 595
    .end local v3    # "msg":Ljava/lang/String;
    .end local v12    # "ex":Ljava/lang/StackOverflowError;
    :catchall_0
    move-exception v2

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    throw v2

    .line 566
    .restart local v20    # "tt":I
    :cond_2
    const/4 v2, 0x1

    goto :goto_3

    .line 569
    :catch_1
    move-exception v10

    .line 570
    .local v10, "e":Lorg/mozilla/javascript/Parser$ParserException;
    goto/16 :goto_1

    .line 573
    .end local v10    # "e":Lorg/mozilla/javascript/Parser$ParserException;
    :cond_3
    :try_start_5
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v16

    .line 574
    .restart local v16    # "n":Lorg/mozilla/javascript/ast/AstNode;
    if-eqz v14, :cond_1

    .line 575
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->getDirective(Lorg/mozilla/javascript/ast/AstNode;)Ljava/lang/String;

    move-result-object v9

    .line 576
    .local v9, "directive":Ljava/lang/String;
    if-nez v9, :cond_4

    .line 577
    const/4 v14, 0x0

    goto :goto_4

    .line 578
    :cond_4
    const-string v2, "use strict"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 579
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    .line 580
    const/4 v2, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/ast/AstRoot;->setInStrictMode(Z)V
    :try_end_5
    .catch Ljava/lang/StackOverflowError; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_4

    .line 595
    .end local v9    # "directive":Ljava/lang/String;
    .end local v16    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .end local v20    # "tt":I
    .restart local v3    # "msg":Ljava/lang/String;
    .restart local v12    # "ex":Ljava/lang/StackOverflowError;
    :cond_5
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    goto/16 :goto_2

    .line 607
    .end local v3    # "msg":Ljava/lang/String;
    .end local v12    # "ex":Ljava/lang/StackOverflowError;
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    if-eqz v2, :cond_7

    .line 610
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v15, v2, -0x1

    .line 611
    .local v15, "last":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/ast/AstNode;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    invoke-static {v11, v2}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 612
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/mozilla/javascript/ast/Comment;

    .line 613
    .local v8, "c":Lorg/mozilla/javascript/ast/Comment;
    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/ast/AstRoot;->addComment(Lorg/mozilla/javascript/ast/Comment;)V

    goto :goto_5

    .line 617
    .end local v8    # "c":Lorg/mozilla/javascript/ast/Comment;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v15    # "last":I
    :cond_7
    sub-int v2, v11, v17

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/ast/AstRoot;->setLength(I)V

    .line 618
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/ast/AstRoot;->setSourceName(Ljava/lang/String;)V

    .line 619
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/ast/AstRoot;->setBaseLineno(I)V

    .line 620
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->lineno:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/ast/AstRoot;->setEndLineno(I)V

    .line 621
    return-object v18
.end method

.method private parseFunctionBody()Lorg/mozilla/javascript/ast/AstNode;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 627
    const/4 v3, 0x0

    .line 628
    .local v3, "isExpressionClosure":Z
    const/16 v9, 0x55

    invoke-direct {p0, v9}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v9

    if-nez v9, :cond_0

    .line 629
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v9}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v9

    const/16 v10, 0xb4

    if-ge v9, v10, :cond_2

    .line 630
    const-string v9, "msg.no.brace.body"

    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 635
    :cond_0
    :goto_0
    iget v9, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    .line 636
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 637
    .local v6, "pos":I
    new-instance v5, Lorg/mozilla/javascript/ast/Block;

    invoke-direct {v5, v6}, Lorg/mozilla/javascript/ast/Block;-><init>(I)V

    .line 639
    .local v5, "pn":Lorg/mozilla/javascript/ast/Block;
    const/4 v2, 0x1

    .line 640
    .local v2, "inDirectivePrologue":Z
    iget-boolean v7, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    .line 643
    .local v7, "savedStrictMode":Z
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v5, v9}, Lorg/mozilla/javascript/ast/Block;->setLineno(I)V

    .line 645
    if-eqz v3, :cond_4

    .line 646
    :try_start_0
    new-instance v4, Lorg/mozilla/javascript/ast/ReturnStatement;

    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-direct {v4, v9}, Lorg/mozilla/javascript/ast/ReturnStatement;-><init>(I)V

    .line 647
    .local v4, "n":Lorg/mozilla/javascript/ast/ReturnStatement;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v9

    invoke-virtual {v4, v9}, Lorg/mozilla/javascript/ast/ReturnStatement;->setReturnValue(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 649
    const/16 v9, 0x19

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v9, v10}, Lorg/mozilla/javascript/ast/ReturnStatement;->putProp(ILjava/lang/Object;)V

    .line 650
    const/16 v9, 0x19

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5, v9, v10}, Lorg/mozilla/javascript/ast/Block;->putProp(ILjava/lang/Object;)V

    .line 651
    invoke-virtual {v5, v4}, Lorg/mozilla/javascript/ast/Block;->addStatement(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_0
    .catch Lorg/mozilla/javascript/Parser$ParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 684
    .end local v4    # "n":Lorg/mozilla/javascript/ast/ReturnStatement;
    :sswitch_0
    iget v9, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    .line 685
    iput-boolean v7, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    .line 688
    :goto_1
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v9, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 689
    .local v1, "end":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    .line 690
    if-nez v3, :cond_1

    const/16 v9, 0x56

    const-string v10, "msg.no.brace.after.body"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 691
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v9, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 692
    :cond_1
    sub-int v9, v1, v6

    invoke-virtual {v5, v9}, Lorg/mozilla/javascript/ast/Block;->setLength(I)V

    .line 693
    return-object v5

    .line 632
    .end local v1    # "end":I
    .end local v2    # "inDirectivePrologue":Z
    .end local v5    # "pn":Lorg/mozilla/javascript/ast/Block;
    .end local v6    # "pos":I
    .end local v7    # "savedStrictMode":Z
    :cond_2
    const/4 v3, 0x1

    goto :goto_0

    .line 663
    .restart local v2    # "inDirectivePrologue":Z
    .restart local v5    # "pn":Lorg/mozilla/javascript/ast/Block;
    .restart local v6    # "pos":I
    .restart local v7    # "savedStrictMode":Z
    .local v8, "tt":I
    :sswitch_1
    :try_start_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 664
    const/4 v9, 0x1

    invoke-direct {p0, v9}, Lorg/mozilla/javascript/Parser;->function(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v4

    .line 678
    .local v4, "n":Lorg/mozilla/javascript/ast/AstNode;
    :cond_3
    :goto_2
    invoke-virtual {v5, v4}, Lorg/mozilla/javascript/ast/Block;->addStatement(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 655
    .end local v4    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .end local v8    # "tt":I
    :cond_4
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v8

    .line 656
    .restart local v8    # "tt":I
    sparse-switch v8, :sswitch_data_0

    .line 667
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 668
    .restart local v4    # "n":Lorg/mozilla/javascript/ast/AstNode;
    if-eqz v2, :cond_3

    .line 669
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->getDirective(Lorg/mozilla/javascript/ast/AstNode;)Ljava/lang/String;

    move-result-object v0

    .line 670
    .local v0, "directive":Ljava/lang/String;
    if-nez v0, :cond_5

    .line 671
    const/4 v2, 0x0

    goto :goto_2

    .line 672
    :cond_5
    const-string v9, "use strict"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 673
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z
    :try_end_1
    .catch Lorg/mozilla/javascript/Parser$ParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 681
    .end local v0    # "directive":Ljava/lang/String;
    .end local v4    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .end local v8    # "tt":I
    :catch_0
    move-exception v9

    .line 684
    iget v9, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    .line 685
    iput-boolean v7, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    goto :goto_1

    .line 684
    :catchall_0
    move-exception v9

    iget v10, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    add-int/lit8 v10, v10, -0x1

    iput v10, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    .line 685
    iput-boolean v7, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    throw v9

    .line 656
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x0 -> :sswitch_0
        0x56 -> :sswitch_0
        0x6d -> :sswitch_1
    .end sparse-switch
.end method

.method private parseFunctionParams(Lorg/mozilla/javascript/ast/FunctionNode;)V
    .locals 13
    .param p1, "fnNode"    # Lorg/mozilla/javascript/ast/FunctionNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 709
    const/16 v10, 0x58

    invoke-direct {p0, v10}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 710
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v10, v10, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/FunctionNode;->getPosition()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {p1, v10}, Lorg/mozilla/javascript/ast/FunctionNode;->setRp(I)V

    .line 768
    :cond_0
    :goto_0
    return-void

    .line 715
    :cond_1
    const/4 v1, 0x0

    .line 716
    .local v1, "destructuring":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/Node;>;"
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 718
    .local v7, "paramNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v9

    .line 719
    .local v9, "tt":I
    const/16 v10, 0x53

    if-eq v9, v10, :cond_3

    const/16 v10, 0x55

    if-ne v9, v10, :cond_6

    .line 720
    :cond_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->destructuringPrimaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 721
    .local v3, "expr":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 722
    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/ast/FunctionNode;->addParam(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 726
    if-nez v1, :cond_4

    .line 727
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "destructuring":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/Node;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 729
    .restart local v1    # "destructuring":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/Node;>;"
    :cond_4
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v10}, Lorg/mozilla/javascript/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v8

    .line 730
    .local v8, "pname":Ljava/lang/String;
    const/16 v10, 0x57

    const/4 v11, 0x0

    invoke-virtual {p0, v10, v8, v11}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 731
    invoke-interface {v1, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 751
    .end local v3    # "expr":Lorg/mozilla/javascript/ast/AstNode;
    .end local v8    # "pname":Ljava/lang/String;
    :cond_5
    :goto_1
    const/16 v10, 0x59

    invoke-direct {p0, v10}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v10

    if-nez v10, :cond_2

    .line 753
    if-eqz v1, :cond_c

    .line 754
    new-instance v2, Lorg/mozilla/javascript/Node;

    const/16 v10, 0x59

    invoke-direct {v2, v10}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 756
    .local v2, "destructuringNode":Lorg/mozilla/javascript/Node;
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 757
    .local v5, "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/mozilla/javascript/Node;>;"
    const/16 v12, 0x7a

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/mozilla/javascript/Node;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {p0, v11}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v11

    invoke-virtual {p0, v12, v10, v11}, Lorg/mozilla/javascript/Parser;->createDestructuringAssignment(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 759
    .local v0, "assign":Lorg/mozilla/javascript/Node;
    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_2

    .line 733
    .end local v0    # "assign":Lorg/mozilla/javascript/Node;
    .end local v2    # "destructuringNode":Lorg/mozilla/javascript/Node;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/mozilla/javascript/Node;>;"
    :cond_6
    const/16 v10, 0x27

    const-string v11, "msg.no.parm"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 734
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v10

    invoke-virtual {p1, v10}, Lorg/mozilla/javascript/ast/FunctionNode;->addParam(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 735
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v10}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v6

    .line 736
    .local v6, "paramName":Ljava/lang/String;
    const/16 v10, 0x57

    invoke-virtual {p0, v10, v6}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;)V

    .line 737
    iget-boolean v10, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    if-eqz v10, :cond_5

    .line 738
    const-string v10, "eval"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7

    const-string v10, "arguments"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 741
    :cond_7
    const-string v10, "msg.bad.id.strict"

    invoke-virtual {p0, v10, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    :cond_8
    invoke-interface {v7, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 744
    const-string v10, "msg.dup.param.strict"

    invoke-virtual {p0, v10, v6}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 745
    :cond_9
    invoke-interface {v7, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 748
    .end local v6    # "paramName":Ljava/lang/String;
    :cond_a
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v10

    invoke-virtual {p1, v10}, Lorg/mozilla/javascript/ast/FunctionNode;->addParam(Lorg/mozilla/javascript/ast/AstNode;)V

    goto/16 :goto_1

    .line 762
    .restart local v2    # "destructuringNode":Lorg/mozilla/javascript/Node;
    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_b
    const/16 v10, 0x17

    invoke-virtual {p1, v10, v2}, Lorg/mozilla/javascript/ast/FunctionNode;->putProp(ILjava/lang/Object;)V

    .line 765
    .end local v2    # "destructuringNode":Lorg/mozilla/javascript/Node;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_c
    const/16 v10, 0x58

    const-string v11, "msg.no.paren.after.parms"

    invoke-direct {p0, v10, v11}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 766
    iget-object v10, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v10, v10, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/FunctionNode;->getPosition()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {p1, v10}, Lorg/mozilla/javascript/ast/FunctionNode;->setRp(I)V

    goto/16 :goto_0
.end method

.method private peekFlaggedToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    .line 358
    iget v0, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    return v0
.end method

.method private peekToken()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 324
    iget v4, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    if-eqz v4, :cond_0

    .line 325
    iget v4, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    .line 351
    :goto_0
    return v4

    .line 328
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getLineno()I

    move-result v1

    .line 329
    .local v1, "lineno":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getToken()I

    move-result v3

    .line 330
    .local v3, "tt":I
    const/4 v2, 0x0

    .line 333
    .local v2, "sawEOL":Z
    :goto_1
    if-eq v3, v5, :cond_1

    const/16 v4, 0xa1

    if-ne v3, v4, :cond_4

    .line 334
    :cond_1
    if-ne v3, v5, :cond_3

    .line 335
    add-int/lit8 v1, v1, 0x1

    .line 336
    const/4 v2, 0x1

    .line 346
    :cond_2
    :goto_2
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getToken()I

    move-result v3

    goto :goto_1

    .line 338
    :cond_3
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v4}, Lorg/mozilla/javascript/CompilerEnvirons;->isRecordingComments()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 339
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getAndResetCurrentComment()Ljava/lang/String;

    move-result-object v0

    .line 340
    .local v0, "comment":Ljava/lang/String;
    invoke-direct {p0, v1, v0}, Lorg/mozilla/javascript/Parser;->recordComment(ILjava/lang/String;)V

    .line 343
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->getNumberOfEols(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v1, v4

    goto :goto_2

    .line 349
    .end local v0    # "comment":Ljava/lang/String;
    :cond_4
    iput v3, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    .line 350
    if-eqz v2, :cond_5

    const/high16 v4, 0x10000

    :goto_3
    or-int/2addr v4, v3

    iput v4, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    .line 351
    iget v4, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    goto :goto_0

    .line 350
    :cond_5
    const/4 v4, 0x0

    goto :goto_3
.end method

.method private peekTokenOrEOL()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v0

    .line 402
    .local v0, "tt":I
    iget v1, p0, Lorg/mozilla/javascript/Parser;->currentFlaggedToken:I

    const/high16 v2, 0x10000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    .line 403
    const/4 v0, 0x1

    .line 405
    :cond_0
    return v0
.end method

.method private plainProperty(Lorg/mozilla/javascript/ast/AstNode;I)Lorg/mozilla/javascript/ast/ObjectProperty;
    .locals 5
    .param p1, "property"    # Lorg/mozilla/javascript/ast/AstNode;
    .param p2, "ptt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3345
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v2

    .line 3346
    .local v2, "tt":I
    const/16 v3, 0x59

    if-eq v2, v3, :cond_0

    const/16 v3, 0x56

    if-ne v2, v3, :cond_2

    :cond_0
    const/16 v3, 0x27

    if-ne p2, v3, :cond_2

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v3}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v3

    const/16 v4, 0xb4

    if-lt v3, v4, :cond_2

    .line 3348
    iget-boolean v3, p0, Lorg/mozilla/javascript/Parser;->inDestructuringAssignment:Z

    if-nez v3, :cond_1

    .line 3349
    const-string v3, "msg.bad.object.init"

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3351
    :cond_1
    new-instance v0, Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v3

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Lorg/mozilla/javascript/ast/Name;-><init>(ILjava/lang/String;)V

    .line 3352
    .local v0, "nn":Lorg/mozilla/javascript/ast/AstNode;
    new-instance v1, Lorg/mozilla/javascript/ast/ObjectProperty;

    invoke-direct {v1}, Lorg/mozilla/javascript/ast/ObjectProperty;-><init>()V

    .line 3353
    .local v1, "pn":Lorg/mozilla/javascript/ast/ObjectProperty;
    const/16 v3, 0x1a

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v3, v4}, Lorg/mozilla/javascript/ast/ObjectProperty;->putProp(ILjava/lang/Object;)V

    .line 3354
    invoke-virtual {v1, p1, v0}, Lorg/mozilla/javascript/ast/ObjectProperty;->setLeftAndRight(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    .line 3361
    .end local v0    # "nn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    return-object v1

    .line 3357
    .end local v1    # "pn":Lorg/mozilla/javascript/ast/ObjectProperty;
    :cond_2
    const/16 v3, 0x67

    const-string v4, "msg.no.colon.prop"

    invoke-direct {p0, v3, v4}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 3358
    new-instance v1, Lorg/mozilla/javascript/ast/ObjectProperty;

    invoke-direct {v1}, Lorg/mozilla/javascript/ast/ObjectProperty;-><init>()V

    .line 3359
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/ObjectProperty;
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/ast/ObjectProperty;->setOperatorPosition(I)V

    .line 3360
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-virtual {v1, p1, v3}, Lorg/mozilla/javascript/ast/ObjectProperty;->setLeftAndRight(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_0
.end method

.method private primaryExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2801
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextFlaggedToken()I

    move-result v5

    .line 2802
    .local v5, "ttFlagged":I
    const v6, 0xffff

    and-int v4, v5, v6

    .line 2804
    .local v4, "tt":I
    sparse-switch v4, :sswitch_data_0

    .line 2876
    const-string v6, "msg.syntax"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2880
    :goto_0
    :sswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v2

    :goto_1
    return-object v2

    .line 2806
    :sswitch_1
    const/4 v6, 0x2

    invoke-direct {p0, v6}, Lorg/mozilla/javascript/Parser;->function(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v2

    goto :goto_1

    .line 2809
    :sswitch_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->arrayLiteral()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_1

    .line 2812
    :sswitch_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->objectLiteral()Lorg/mozilla/javascript/ast/ObjectLiteral;

    move-result-object v2

    goto :goto_1

    .line 2815
    :sswitch_4
    const/4 v6, 0x0

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->let(ZI)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_1

    .line 2818
    :sswitch_5
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->parenExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_1

    .line 2821
    :sswitch_6
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->mustHaveXML()V

    .line 2822
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->attributeAccess()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_1

    .line 2825
    :sswitch_7
    invoke-direct {p0, v5, v4}, Lorg/mozilla/javascript/Parser;->name(II)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto :goto_1

    .line 2828
    :sswitch_8
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    .line 2829
    .local v3, "s":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->isNumberOctal()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2830
    const-string v6, "msg.no.octal.strict"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2832
    :cond_0
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->isNumberOctal()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2833
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2835
    :cond_1
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->isNumberHex()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2836
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "0x"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2838
    :cond_2
    new-instance v2, Lorg/mozilla/javascript/ast/NumberLiteral;

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v7}, Lorg/mozilla/javascript/TokenStream;->getNumber()D

    move-result-wide v8

    invoke-direct {v2, v6, v3, v8, v9}, Lorg/mozilla/javascript/ast/NumberLiteral;-><init>(ILjava/lang/String;D)V

    goto/16 :goto_1

    .line 2844
    .end local v3    # "s":Ljava/lang/String;
    :sswitch_9
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createStringLiteral()Lorg/mozilla/javascript/ast/StringLiteral;

    move-result-object v2

    goto/16 :goto_1

    .line 2849
    :sswitch_a
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/TokenStream;->readRegExp(I)V

    .line 2850
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v1, "pos":I
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2851
    .local v0, "end":I
    new-instance v2, Lorg/mozilla/javascript/ast/RegExpLiteral;

    sub-int v6, v0, v1

    invoke-direct {v2, v1, v6}, Lorg/mozilla/javascript/ast/RegExpLiteral;-><init>(II)V

    .line 2852
    .local v2, "re":Lorg/mozilla/javascript/ast/RegExpLiteral;
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/mozilla/javascript/ast/RegExpLiteral;->setValue(Ljava/lang/String;)V

    .line 2853
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->readAndClearRegExpFlags()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/mozilla/javascript/ast/RegExpLiteral;->setFlags(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 2860
    .end local v0    # "end":I
    .end local v1    # "pos":I
    .end local v2    # "re":Lorg/mozilla/javascript/ast/RegExpLiteral;
    :sswitch_b
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .restart local v1    # "pos":I
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2861
    .restart local v0    # "end":I
    new-instance v2, Lorg/mozilla/javascript/ast/KeywordLiteral;

    sub-int v6, v0, v1

    invoke-direct {v2, v1, v6, v4}, Lorg/mozilla/javascript/ast/KeywordLiteral;-><init>(III)V

    goto/16 :goto_1

    .line 2864
    .end local v0    # "end":I
    .end local v1    # "pos":I
    :sswitch_c
    const-string v6, "msg.reserved.id"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2872
    :sswitch_d
    const-string v6, "msg.unexpected.eof"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2804
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x0 -> :sswitch_d
        0x18 -> :sswitch_a
        0x27 -> :sswitch_7
        0x28 -> :sswitch_8
        0x29 -> :sswitch_9
        0x2a -> :sswitch_b
        0x2b -> :sswitch_b
        0x2c -> :sswitch_b
        0x2d -> :sswitch_b
        0x53 -> :sswitch_2
        0x55 -> :sswitch_3
        0x57 -> :sswitch_5
        0x64 -> :sswitch_a
        0x6d -> :sswitch_1
        0x7f -> :sswitch_c
        0x93 -> :sswitch_6
        0x99 -> :sswitch_4
    .end sparse-switch
.end method

.method private propertyAccess(ILorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;
    .locals 15
    .param p1, "tt"    # I
    .param p2, "pn"    # Lorg/mozilla/javascript/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2592
    if-nez p2, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2593
    :cond_0
    const/4 v4, 0x0

    .local v4, "memberTypeFlags":I
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v12, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v2, "lineno":I
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2594
    .local v1, "dotPos":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2596
    const/16 v12, 0x8f

    move/from16 v0, p1

    if-ne v0, v12, :cond_1

    .line 2597
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->mustHaveXML()V

    .line 2598
    const/4 v4, 0x4

    .line 2601
    :cond_1
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v12}, Lorg/mozilla/javascript/CompilerEnvirons;->isXmlAvailable()Z

    move-result v12

    if-nez v12, :cond_4

    .line 2602
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v3

    .line 2603
    .local v3, "maybeName":I
    const/16 v12, 0x27

    if-eq v3, v12, :cond_3

    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v12}, Lorg/mozilla/javascript/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v12

    if-eqz v12, :cond_2

    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v12}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/mozilla/javascript/TokenStream;->isKeyword(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 2606
    :cond_2
    const-string v12, "msg.no.name.after.dot"

    invoke-virtual {p0, v12}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2609
    :cond_3
    const/4 v12, 0x1

    const/16 v13, 0x21

    invoke-direct {p0, v12, v13}, Lorg/mozilla/javascript/Parser;->createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;

    move-result-object v5

    .line 2610
    .local v5, "name":Lorg/mozilla/javascript/ast/Name;
    new-instance v6, Lorg/mozilla/javascript/ast/PropertyGet;

    move-object/from16 v0, p2

    invoke-direct {v6, v0, v5, v1}, Lorg/mozilla/javascript/ast/PropertyGet;-><init>(Lorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/Name;I)V

    .line 2611
    .local v6, "pg":Lorg/mozilla/javascript/ast/PropertyGet;
    invoke-virtual {v6, v2}, Lorg/mozilla/javascript/ast/PropertyGet;->setLineno(I)V

    .line 2667
    .end local v3    # "maybeName":I
    .end local v5    # "name":Lorg/mozilla/javascript/ast/Name;
    .end local v6    # "pg":Lorg/mozilla/javascript/ast/PropertyGet;
    :goto_0
    return-object v6

    .line 2615
    :cond_4
    const/4 v8, 0x0

    .line 2617
    .local v8, "ref":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v10

    .line 2618
    .local v10, "token":I
    sparse-switch v10, :sswitch_data_0

    .line 2643
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v12}, Lorg/mozilla/javascript/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 2645
    invoke-static {v10}, Lorg/mozilla/javascript/Token;->keywordToName(I)Ljava/lang/String;

    move-result-object v5

    .line 2646
    .local v5, "name":Ljava/lang/String;
    if-eqz v5, :cond_6

    .line 2647
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v12, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v13, v13, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-direct {p0, v12, v5, v13}, Lorg/mozilla/javascript/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2648
    const/4 v12, -0x1

    invoke-direct {p0, v12, v5, v4}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    .line 2656
    .end local v5    # "name":Ljava/lang/String;
    :goto_1
    instance-of v11, v8, Lorg/mozilla/javascript/ast/XmlRef;

    .line 2657
    .local v11, "xml":Z
    if-eqz v11, :cond_7

    new-instance v9, Lorg/mozilla/javascript/ast/XmlMemberGet;

    invoke-direct {v9}, Lorg/mozilla/javascript/ast/XmlMemberGet;-><init>()V

    .line 2658
    .local v9, "result":Lorg/mozilla/javascript/ast/InfixExpression;
    :goto_2
    if-eqz v11, :cond_5

    const/16 v12, 0x6c

    move/from16 v0, p1

    if-ne v0, v12, :cond_5

    .line 2659
    const/16 v12, 0x6c

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/ast/InfixExpression;->setType(I)Lorg/mozilla/javascript/Node;

    .line 2660
    :cond_5
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v7

    .line 2661
    .local v7, "pos":I
    invoke-virtual {v9, v7}, Lorg/mozilla/javascript/ast/InfixExpression;->setPosition(I)V

    .line 2662
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v12

    sub-int/2addr v12, v7

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/ast/InfixExpression;->setLength(I)V

    .line 2663
    sub-int v12, v1, v7

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/ast/InfixExpression;->setOperatorPosition(I)V

    .line 2664
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/ast/AstNode;->getLineno()I

    move-result v12

    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/ast/InfixExpression;->setLineno(I)V

    .line 2665
    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Lorg/mozilla/javascript/ast/InfixExpression;->setLeft(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2666
    invoke-virtual {v9, v8}, Lorg/mozilla/javascript/ast/InfixExpression;->setRight(Lorg/mozilla/javascript/ast/AstNode;)V

    move-object v6, v9

    .line 2667
    goto :goto_0

    .line 2621
    .end local v7    # "pos":I
    .end local v9    # "result":Lorg/mozilla/javascript/ast/InfixExpression;
    .end local v11    # "xml":Z
    :sswitch_0
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v12, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    const-string v13, "throw"

    iget-object v14, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v14, v14, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-direct {p0, v12, v13, v14}, Lorg/mozilla/javascript/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2622
    const/4 v12, -0x1

    const-string v13, "throw"

    invoke-direct {p0, v12, v13, v4}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    .line 2623
    goto :goto_1

    .line 2627
    :sswitch_1
    const/4 v12, -0x1

    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v13}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v12, v13, v4}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    .line 2628
    goto :goto_1

    .line 2632
    :sswitch_2
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v12, v12, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    const-string v13, "*"

    iget-object v14, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v14, v14, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-direct {p0, v12, v13, v14}, Lorg/mozilla/javascript/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2633
    const/4 v12, -0x1

    const-string v13, "*"

    invoke-direct {p0, v12, v13, v4}, Lorg/mozilla/javascript/Parser;->propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    .line 2634
    goto :goto_1

    .line 2639
    :sswitch_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->attributeAccess()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    .line 2640
    goto :goto_1

    .line 2652
    :cond_6
    const-string v12, "msg.no.name.after.dot"

    invoke-virtual {p0, v12}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2653
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v6

    goto/16 :goto_0

    .line 2657
    .restart local v11    # "xml":Z
    :cond_7
    new-instance v9, Lorg/mozilla/javascript/ast/PropertyGet;

    invoke-direct {v9}, Lorg/mozilla/javascript/ast/PropertyGet;-><init>()V

    goto :goto_2

    .line 2618
    nop

    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_2
        0x27 -> :sswitch_1
        0x32 -> :sswitch_0
        0x93 -> :sswitch_3
    .end sparse-switch
.end method

.method private propertyName(ILjava/lang/String;I)Lorg/mozilla/javascript/ast/AstNode;
    .locals 10
    .param p1, "atPos"    # I
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "memberTypeFlags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 2720
    if-eq p1, v9, :cond_0

    move v4, p1

    .local v4, "pos":I
    :goto_0
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v6, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2721
    .local v1, "lineno":I
    const/4 v0, -0x1

    .line 2722
    .local v0, "colonPos":I
    const/4 v6, 0x1

    iget v7, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;

    move-result-object v2

    .line 2723
    .local v2, "name":Lorg/mozilla/javascript/ast/Name;
    const/4 v3, 0x0

    .line 2725
    .local v3, "ns":Lorg/mozilla/javascript/ast/Name;
    const/16 v6, 0x90

    invoke-direct {p0, v6}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2726
    move-object v3, v2

    .line 2727
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2729
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 2746
    const-string v6, "msg.no.name.after.coloncolon"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2747
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v5

    .line 2761
    :goto_1
    return-object v5

    .line 2720
    .end local v0    # "colonPos":I
    .end local v1    # "lineno":I
    .end local v2    # "name":Lorg/mozilla/javascript/ast/Name;
    .end local v3    # "ns":Lorg/mozilla/javascript/ast/Name;
    .end local v4    # "pos":I
    :cond_0
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    goto :goto_0

    .line 2732
    .restart local v0    # "colonPos":I
    .restart local v1    # "lineno":I
    .restart local v2    # "name":Lorg/mozilla/javascript/ast/Name;
    .restart local v3    # "ns":Lorg/mozilla/javascript/ast/Name;
    .restart local v4    # "pos":I
    :sswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v2

    .line 2751
    :cond_1
    :goto_2
    if-nez v3, :cond_2

    if-nez p3, :cond_2

    if-ne p1, v9, :cond_2

    move-object v5, v2

    .line 2752
    goto :goto_1

    .line 2737
    :sswitch_1
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    const-string v7, "*"

    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v8, v8, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-direct {p0, v6, v7, v8}, Lorg/mozilla/javascript/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2738
    const/4 v6, 0x0

    invoke-direct {p0, v6, v9}, Lorg/mozilla/javascript/Parser;->createNameNode(ZI)Lorg/mozilla/javascript/ast/Name;

    move-result-object v2

    .line 2739
    goto :goto_2

    .line 2743
    :sswitch_2
    invoke-direct {p0, p1, v3, v0}, Lorg/mozilla/javascript/Parser;->xmlElemRef(ILorg/mozilla/javascript/ast/Name;I)Lorg/mozilla/javascript/ast/XmlElemRef;

    move-result-object v5

    goto :goto_1

    .line 2755
    :cond_2
    new-instance v5, Lorg/mozilla/javascript/ast/XmlPropRef;

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v6

    sub-int/2addr v6, v4

    invoke-direct {v5, v4, v6}, Lorg/mozilla/javascript/ast/XmlPropRef;-><init>(II)V

    .line 2756
    .local v5, "ref":Lorg/mozilla/javascript/ast/XmlPropRef;
    invoke-virtual {v5, p1}, Lorg/mozilla/javascript/ast/XmlPropRef;->setAtPos(I)V

    .line 2757
    invoke-virtual {v5, v3}, Lorg/mozilla/javascript/ast/XmlPropRef;->setNamespace(Lorg/mozilla/javascript/ast/Name;)V

    .line 2758
    invoke-virtual {v5, v0}, Lorg/mozilla/javascript/ast/XmlPropRef;->setColonPos(I)V

    .line 2759
    invoke-virtual {v5, v2}, Lorg/mozilla/javascript/ast/XmlPropRef;->setPropName(Lorg/mozilla/javascript/ast/Name;)V

    .line 2760
    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/ast/XmlPropRef;->setLineno(I)V

    goto :goto_1

    .line 2729
    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_1
        0x27 -> :sswitch_0
        0x53 -> :sswitch_2
    .end sparse-switch
.end method

.method private readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 6
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3584
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 3586
    .local v2, "in":Ljava/io/BufferedReader;
    const/16 v4, 0x400

    :try_start_0
    new-array v1, v4, [C

    .line 3587
    .local v1, "cbuf":[C
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x400

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3589
    .local v3, "sb":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v4, 0x0

    const/16 v5, 0x400

    invoke-virtual {v2, v1, v4, v5}, Ljava/io/BufferedReader;->read([CII)I

    move-result v0

    .local v0, "bytes_read":I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_0

    .line 3590
    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, v0}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 3594
    .end local v0    # "bytes_read":I
    .end local v1    # "cbuf":[C
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v4

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v4

    .line 3592
    .restart local v0    # "bytes_read":I
    .restart local v1    # "cbuf":[C
    .restart local v3    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 3594
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    return-object v4
.end method

.method private recordComment(ILjava/lang/String;)V
    .locals 4
    .param p1, "lineno"    # I
    .param p2, "comment"    # Ljava/lang/String;

    .prologue
    .line 271
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    if-nez v1, :cond_0

    .line 272
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    .line 274
    :cond_0
    new-instance v0, Lorg/mozilla/javascript/ast/Comment;

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v2}, Lorg/mozilla/javascript/TokenStream;->getTokenLength()I

    move-result v2

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget-object v3, v3, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    invoke-direct {v0, v1, v2, v3, p2}, Lorg/mozilla/javascript/ast/Comment;-><init>(IILorg/mozilla/javascript/Token$CommentType;Ljava/lang/String;)V

    .line 278
    .local v0, "commentNode":Lorg/mozilla/javascript/ast/Comment;
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget-object v1, v1, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    sget-object v2, Lorg/mozilla/javascript/Token$CommentType;->JSDOC:Lorg/mozilla/javascript/Token$CommentType;

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v1}, Lorg/mozilla/javascript/CompilerEnvirons;->isRecordingLocalJsDocComments()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 280
    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->currentJsDocComment:Lorg/mozilla/javascript/ast/Comment;

    .line 282
    :cond_1
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/Comment;->setLineno(I)V

    .line 283
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 284
    return-void
.end method

.method private recordLabel(Lorg/mozilla/javascript/ast/Label;Lorg/mozilla/javascript/ast/LabeledStatement;)V
    .locals 6
    .param p1, "label"    # Lorg/mozilla/javascript/ast/Label;
    .param p2, "bundle"    # Lorg/mozilla/javascript/ast/LabeledStatement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1763
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x67

    if-eq v3, v4, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1764
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1765
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/Label;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1766
    .local v2, "name":Ljava/lang/String;
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    if-nez v3, :cond_2

    .line 1767
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    .line 1780
    :cond_1
    :goto_0
    invoke-virtual {p2, p1}, Lorg/mozilla/javascript/ast/LabeledStatement;->addLabel(Lorg/mozilla/javascript/ast/Label;)V

    .line 1781
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    invoke-interface {v3, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1782
    return-void

    .line 1769
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->labelSet:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/LabeledStatement;

    .line 1770
    .local v1, "ls":Lorg/mozilla/javascript/ast/LabeledStatement;
    if-eqz v1, :cond_1

    .line 1771
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v3}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1772
    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/LabeledStatement;->getLabelByName(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Label;

    move-result-object v0

    .line 1773
    .local v0, "dup":Lorg/mozilla/javascript/ast/Label;
    const-string v3, "msg.dup.label"

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Label;->getAbsolutePosition()I

    move-result v4

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Label;->getLength()I

    move-result v5

    invoke-virtual {p0, v3, v4, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;II)V

    .line 1776
    .end local v0    # "dup":Lorg/mozilla/javascript/ast/Label;
    :cond_3
    const-string v3, "msg.dup.label"

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/Label;->getPosition()I

    move-result v4

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/Label;->getLength()I

    move-result v5

    invoke-virtual {p0, v3, v4, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;II)V

    goto :goto_0
.end method

.method private relExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2214
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->shiftExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2216
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    .local v3, "tt":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2217
    .local v0, "opPos":I
    sparse-switch v3, :sswitch_data_0

    .line 2233
    :cond_0
    return-object v1

    .line 2219
    :sswitch_0
    iget-boolean v4, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    if-nez v4, :cond_0

    .line 2227
    :sswitch_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2228
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->shiftExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2229
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2217
    :sswitch_data_0
    .sparse-switch
        0xe -> :sswitch_1
        0xf -> :sswitch_1
        0x10 -> :sswitch_1
        0x11 -> :sswitch_1
        0x34 -> :sswitch_0
        0x35 -> :sswitch_1
    .end sparse-switch
.end method

.method private returnOrYield(IZ)Lorg/mozilla/javascript/ast/AstNode;
    .locals 11
    .param p1, "tt"    # I
    .param p2, "exprContext"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 1655
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v8

    if-nez v8, :cond_0

    .line 1656
    if-ne p1, v9, :cond_4

    const-string v8, "msg.bad.return"

    :goto_0
    invoke-virtual {p0, v8}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1659
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1660
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v8, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v3, "lineno":I
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v8, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v5, "pos":I
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v8, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1662
    .local v2, "end":I
    const/4 v1, 0x0

    .line 1664
    .local v1, "e":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    .line 1669
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1670
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    .line 1673
    :sswitch_0
    iget v0, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    .line 1676
    .local v0, "before":I
    if-ne p1, v9, :cond_6

    .line 1677
    iget v10, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    if-nez v1, :cond_5

    const/4 v8, 0x2

    :goto_1
    or-int/2addr v8, v10

    iput v8, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    .line 1678
    new-instance v6, Lorg/mozilla/javascript/ast/ReturnStatement;

    sub-int v8, v2, v5

    invoke-direct {v6, v5, v8, v1}, Lorg/mozilla/javascript/ast/ReturnStatement;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 1681
    .local v6, "ret":Lorg/mozilla/javascript/ast/AstNode;
    iget v8, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    const/4 v9, 0x6

    invoke-static {v0, v8, v9}, Lorg/mozilla/javascript/Parser;->nowAllSet(III)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1683
    const-string v8, "msg.return.inconsistent"

    const-string v9, ""

    sub-int v10, v2, v5

    invoke-virtual {p0, v8, v9, v5, v10}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1697
    :cond_1
    :goto_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v8

    if-eqz v8, :cond_3

    iget v8, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    const/16 v9, 0xc

    invoke-static {v0, v8, v9}, Lorg/mozilla/javascript/Parser;->nowAllSet(III)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1700
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v8, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionName()Lorg/mozilla/javascript/ast/Name;

    move-result-object v4

    .line 1701
    .local v4, "name":Lorg/mozilla/javascript/ast/Name;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/Name;->length()I

    move-result v8

    if-nez v8, :cond_8

    .line 1702
    :cond_2
    const-string v8, "msg.anon.generator.returns"

    const-string v9, ""

    invoke-virtual {p0, v8, v9}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1707
    .end local v4    # "name":Lorg/mozilla/javascript/ast/Name;
    :cond_3
    :goto_3
    invoke-virtual {v6, v3}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    .line 1708
    return-object v6

    .line 1656
    .end local v0    # "before":I
    .end local v1    # "e":Lorg/mozilla/javascript/ast/AstNode;
    .end local v2    # "end":I
    .end local v3    # "lineno":I
    .end local v5    # "pos":I
    .end local v6    # "ret":Lorg/mozilla/javascript/ast/AstNode;
    :cond_4
    const-string v8, "msg.bad.yield"

    goto :goto_0

    .restart local v0    # "before":I
    .restart local v1    # "e":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v2    # "end":I
    .restart local v3    # "lineno":I
    .restart local v5    # "pos":I
    :cond_5
    move v8, v9

    .line 1677
    goto :goto_1

    .line 1685
    :cond_6
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v8

    if-nez v8, :cond_7

    .line 1686
    const-string v8, "msg.bad.yield"

    invoke-virtual {p0, v8}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1687
    :cond_7
    iget v8, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    or-int/lit8 v8, v8, 0x8

    iput v8, p0, Lorg/mozilla/javascript/Parser;->endFlags:I

    .line 1688
    new-instance v6, Lorg/mozilla/javascript/ast/Yield;

    sub-int v8, v2, v5

    invoke-direct {v6, v5, v8, v1}, Lorg/mozilla/javascript/ast/Yield;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 1689
    .restart local v6    # "ret":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->setRequiresActivation()V

    .line 1690
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->setIsGenerator()V

    .line 1691
    if-nez p2, :cond_1

    .line 1692
    new-instance v7, Lorg/mozilla/javascript/ast/ExpressionStatement;

    invoke-direct {v7, v6}, Lorg/mozilla/javascript/ast/ExpressionStatement;-><init>(Lorg/mozilla/javascript/ast/AstNode;)V

    .end local v6    # "ret":Lorg/mozilla/javascript/ast/AstNode;
    .local v7, "ret":Lorg/mozilla/javascript/ast/AstNode;
    move-object v6, v7

    .end local v7    # "ret":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v6    # "ret":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_2

    .line 1704
    .restart local v4    # "name":Lorg/mozilla/javascript/ast/Name;
    :cond_8
    const-string v8, "msg.generator.returns"

    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 1664
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x0 -> :sswitch_0
        0x1 -> :sswitch_0
        0x48 -> :sswitch_0
        0x52 -> :sswitch_0
        0x54 -> :sswitch_0
        0x56 -> :sswitch_0
        0x58 -> :sswitch_0
    .end sparse-switch
.end method

.method private saveNameTokenData(ILjava/lang/String;I)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "lineno"    # I

    .prologue
    .line 3510
    iput p1, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenStart:I

    .line 3511
    iput-object p2, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 3512
    iput p3, p0, Lorg/mozilla/javascript/Parser;->prevNameTokenLineno:I

    .line 3513
    return-void
.end method

.method private shiftExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2239
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->addExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2241
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    .local v3, "tt":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2242
    .local v0, "opPos":I
    packed-switch v3, :pswitch_data_0

    .line 2252
    return-object v1

    .line 2246
    :pswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2247
    new-instance v2, Lorg/mozilla/javascript/ast/InfixExpression;

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->addExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4, v0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;Lorg/mozilla/javascript/ast/AstNode;I)V

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .local v2, "pn":Lorg/mozilla/javascript/ast/AstNode;
    move-object v1, v2

    .line 2248
    .end local v2    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 2242
    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private statement()Lorg/mozilla/javascript/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 932
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 934
    .local v2, "pos":I
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statementHelper()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 935
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    if-eqz v1, :cond_2

    .line 936
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v4}, Lorg/mozilla/javascript/CompilerEnvirons;->isStrictMode()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->hasSideEffects()Z

    move-result v4

    if-nez v4, :cond_0

    .line 937
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v0

    .line 938
    .local v0, "beg":I
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->lineBeginningFor(I)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 939
    instance-of v4, v1, Lorg/mozilla/javascript/ast/EmptyStatement;

    if-eqz v4, :cond_1

    const-string v4, "msg.extra.trailing.semi"

    :goto_0
    const-string v5, ""

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->nodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v6

    sub-int/2addr v6, v0

    invoke-virtual {p0, v4, v5, v0, v6}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 965
    .end local v0    # "beg":I
    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_0
    :goto_1
    return-object v1

    .line 939
    .restart local v0    # "beg":I
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    const-string v4, "msg.no.side.effects"
    :try_end_0
    .catch Lorg/mozilla/javascript/Parser$ParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 952
    .end local v0    # "beg":I
    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_2
    :goto_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v3

    .line 953
    .local v3, "tt":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 954
    sparse-switch v3, :sswitch_data_0

    goto :goto_2

    .line 965
    :sswitch_0
    new-instance v1, Lorg/mozilla/javascript/ast/EmptyStatement;

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v4, v2

    invoke-direct {v1, v2, v4}, Lorg/mozilla/javascript/ast/EmptyStatement;-><init>(II)V

    goto :goto_1

    .line 946
    .end local v3    # "tt":I
    :catch_0
    move-exception v4

    goto :goto_2

    .line 954
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x0 -> :sswitch_0
        0x1 -> :sswitch_0
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method private statementHelper()Lorg/mozilla/javascript/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 972
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/LabeledStatement;->getStatement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 973
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/mozilla/javascript/Parser;->currentLabel:Lorg/mozilla/javascript/ast/LabeledStatement;

    .line 975
    :cond_0
    const/4 v1, 0x0

    .line 976
    .local v1, "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v3

    .local v3, "tt":I
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 978
    .local v2, "pos":I
    sparse-switch v3, :sswitch_data_0

    .line 1071
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1072
    .local v0, "lineno":I
    new-instance v1, Lorg/mozilla/javascript/ast/ExpressionStatement;

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v7

    if-nez v7, :cond_4

    :goto_0
    invoke-direct {v1, v6, v4}, Lorg/mozilla/javascript/ast/ExpressionStatement;-><init>(Lorg/mozilla/javascript/ast/AstNode;Z)V

    .line 1073
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    .line 1077
    .end local v0    # "lineno":I
    :cond_1
    :goto_1
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->autoInsertSemicolon(Lorg/mozilla/javascript/ast/AstNode;)V

    move-object v4, v1

    .line 1078
    :goto_2
    return-object v4

    .line 980
    :sswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->ifStatement()Lorg/mozilla/javascript/ast/IfStatement;

    move-result-object v4

    goto :goto_2

    .line 983
    :sswitch_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->switchStatement()Lorg/mozilla/javascript/ast/SwitchStatement;

    move-result-object v4

    goto :goto_2

    .line 986
    :sswitch_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->whileLoop()Lorg/mozilla/javascript/ast/WhileLoop;

    move-result-object v4

    goto :goto_2

    .line 989
    :sswitch_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->doLoop()Lorg/mozilla/javascript/ast/DoLoop;

    move-result-object v4

    goto :goto_2

    .line 992
    :sswitch_4
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->forLoop()Lorg/mozilla/javascript/ast/Loop;

    move-result-object v4

    goto :goto_2

    .line 995
    :sswitch_5
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->tryStatement()Lorg/mozilla/javascript/ast/TryStatement;

    move-result-object v4

    goto :goto_2

    .line 998
    :sswitch_6
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->throwStatement()Lorg/mozilla/javascript/ast/ThrowStatement;

    move-result-object v1

    .line 999
    goto :goto_1

    .line 1002
    :sswitch_7
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->breakStatement()Lorg/mozilla/javascript/ast/BreakStatement;

    move-result-object v1

    .line 1003
    goto :goto_1

    .line 1006
    :sswitch_8
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->continueStatement()Lorg/mozilla/javascript/ast/ContinueStatement;

    move-result-object v1

    .line 1007
    goto :goto_1

    .line 1010
    :sswitch_9
    iget-boolean v4, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    if-eqz v4, :cond_2

    .line 1011
    const-string v4, "msg.no.with.strict"

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1013
    :cond_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->withStatement()Lorg/mozilla/javascript/ast/WithStatement;

    move-result-object v4

    goto :goto_2

    .line 1017
    :sswitch_a
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1018
    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v5, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1019
    .restart local v0    # "lineno":I
    iget v5, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0, v5, v6, v4}, Lorg/mozilla/javascript/Parser;->variables(IIZ)Lorg/mozilla/javascript/ast/VariableDeclaration;

    move-result-object v1

    .line 1020
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto :goto_1

    .line 1024
    .end local v0    # "lineno":I
    :sswitch_b
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->letStatement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1025
    instance-of v4, v1, Lorg/mozilla/javascript/ast/VariableDeclaration;

    if-eqz v4, :cond_3

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x52

    if-eq v4, v5, :cond_1

    :cond_3
    move-object v4, v1

    .line 1028
    goto :goto_2

    .line 1032
    :sswitch_c
    invoke-direct {p0, v3, v5}, Lorg/mozilla/javascript/Parser;->returnOrYield(IZ)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1033
    goto :goto_1

    .line 1036
    :sswitch_d
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1037
    new-instance v1, Lorg/mozilla/javascript/ast/KeywordLiteral;

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v5, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v5, v6

    invoke-direct {v1, v4, v5, v3}, Lorg/mozilla/javascript/ast/KeywordLiteral;-><init>(III)V

    .line 1039
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v1, v4}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto/16 :goto_1

    .line 1043
    :sswitch_e
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->block()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    goto/16 :goto_2

    .line 1046
    :sswitch_f
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1047
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v4

    goto/16 :goto_2

    .line 1050
    :sswitch_10
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1051
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1052
    new-instance v1, Lorg/mozilla/javascript/ast/EmptyStatement;

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v4, v2

    invoke-direct {v1, v2, v4}, Lorg/mozilla/javascript/ast/EmptyStatement;-><init>(II)V

    .line 1053
    .restart local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v1, v4}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    move-object v4, v1

    .line 1054
    goto/16 :goto_2

    .line 1057
    :sswitch_11
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1058
    const/4 v4, 0x3

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->function(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v4

    goto/16 :goto_2

    .line 1061
    :sswitch_12
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->defaultXmlNamespace()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1062
    goto/16 :goto_1

    .line 1065
    :sswitch_13
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nameOrLabel()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1066
    instance-of v4, v1, Lorg/mozilla/javascript/ast/ExpressionStatement;

    if-nez v4, :cond_1

    move-object v4, v1

    .line 1068
    goto/16 :goto_2

    .end local v1    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v0    # "lineno":I
    :cond_4
    move v4, v5

    .line 1072
    goto/16 :goto_0

    .line 978
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_f
        0x4 -> :sswitch_c
        0x27 -> :sswitch_13
        0x32 -> :sswitch_6
        0x48 -> :sswitch_c
        0x51 -> :sswitch_5
        0x52 -> :sswitch_10
        0x55 -> :sswitch_e
        0x6d -> :sswitch_11
        0x70 -> :sswitch_0
        0x72 -> :sswitch_1
        0x74 -> :sswitch_12
        0x75 -> :sswitch_2
        0x76 -> :sswitch_3
        0x77 -> :sswitch_4
        0x78 -> :sswitch_7
        0x79 -> :sswitch_8
        0x7a -> :sswitch_a
        0x7b -> :sswitch_9
        0x99 -> :sswitch_b
        0x9a -> :sswitch_a
        0xa0 -> :sswitch_d
    .end sparse-switch
.end method

.method private statements()Lorg/mozilla/javascript/ast/AstNode;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 896
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->statements(Lorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method private statements(Lorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;
    .locals 5
    .param p1, "parent"    # Lorg/mozilla/javascript/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 881
    iget v3, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v4, 0x55

    if-eq v3, v4, :cond_0

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v3}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v3

    if-nez v3, :cond_0

    .line 882
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 883
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 884
    .local v1, "pos":I
    if-eqz p1, :cond_1

    move-object v0, p1

    .line 885
    .local v0, "block":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    .line 888
    :goto_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v2

    .local v2, "tt":I
    if-lez v2, :cond_2

    const/16 v3, 0x56

    if-eq v2, v3, :cond_2

    .line 889
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/AstNode;->addChild(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_1

    .line 884
    .end local v0    # "block":Lorg/mozilla/javascript/ast/AstNode;
    .end local v2    # "tt":I
    :cond_1
    new-instance v0, Lorg/mozilla/javascript/ast/Block;

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ast/Block;-><init>(I)V

    goto :goto_0

    .line 891
    .restart local v0    # "block":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v2    # "tt":I
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v3, v1

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/AstNode;->setLength(I)V

    .line 892
    return-object v0
.end method

.method private switchStatement()Lorg/mozilla/javascript/ast/SwitchStatement;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1134
    iget v9, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v10, 0x72

    if-eq v9, v10, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1135
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1136
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1138
    .local v7, "pos":I
    new-instance v6, Lorg/mozilla/javascript/ast/SwitchStatement;

    invoke-direct {v6, v7}, Lorg/mozilla/javascript/ast/SwitchStatement;-><init>(I)V

    .line 1139
    .local v6, "pn":Lorg/mozilla/javascript/ast/SwitchStatement;
    const/16 v9, 0x57

    const-string v10, "msg.no.paren.switch"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1140
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v9, v7

    invoke-virtual {v6, v9}, Lorg/mozilla/javascript/ast/SwitchStatement;->setLp(I)V

    .line 1141
    :cond_1
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v6, v9}, Lorg/mozilla/javascript/ast/SwitchStatement;->setLineno(I)V

    .line 1143
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 1144
    .local v4, "discriminant":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/ast/SwitchStatement;->setExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1145
    invoke-direct {p0, v6}, Lorg/mozilla/javascript/Parser;->enterSwitch(Lorg/mozilla/javascript/ast/SwitchStatement;)V

    .line 1148
    const/16 v9, 0x58

    :try_start_0
    const-string v10, "msg.no.paren.after.switch"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1149
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v9, v7

    invoke-virtual {v6, v9}, Lorg/mozilla/javascript/ast/SwitchStatement;->setRp(I)V

    .line 1151
    :cond_2
    const/16 v9, 0x55

    const-string v10, "msg.no.brace.switch"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1153
    const/4 v5, 0x0

    .line 1156
    .local v5, "hasDefault":Z
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->nextToken()I

    move-result v8

    .line 1157
    .local v8, "tt":I
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v9, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1158
    .local v3, "casePos":I
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v9, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1159
    .local v1, "caseLineno":I
    const/4 v0, 0x0

    .line 1160
    .local v0, "caseExpression":Lorg/mozilla/javascript/ast/AstNode;
    sparse-switch v8, :sswitch_data_0

    .line 1180
    const-string v9, "msg.bad.switch"

    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1199
    :goto_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->exitSwitch()V

    .line 1201
    return-object v6

    .line 1162
    :sswitch_0
    :try_start_1
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v9, v7

    invoke-virtual {v6, v9}, Lorg/mozilla/javascript/ast/SwitchStatement;->setLength(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1199
    .end local v0    # "caseExpression":Lorg/mozilla/javascript/ast/AstNode;
    .end local v1    # "caseLineno":I
    .end local v3    # "casePos":I
    .end local v5    # "hasDefault":Z
    .end local v8    # "tt":I
    :catchall_0
    move-exception v9

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->exitSwitch()V

    throw v9

    .line 1166
    .restart local v0    # "caseExpression":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v1    # "caseLineno":I
    .restart local v3    # "casePos":I
    .restart local v5    # "hasDefault":Z
    .restart local v8    # "tt":I
    :sswitch_1
    :try_start_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 1167
    const/16 v9, 0x67

    const-string v10, "msg.no.colon.case"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1184
    :goto_2
    new-instance v2, Lorg/mozilla/javascript/ast/SwitchCase;

    invoke-direct {v2, v3}, Lorg/mozilla/javascript/ast/SwitchCase;-><init>(I)V

    .line 1185
    .local v2, "caseNode":Lorg/mozilla/javascript/ast/SwitchCase;
    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/ast/SwitchCase;->setExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1186
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v9, v9, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v9, v7

    invoke-virtual {v2, v9}, Lorg/mozilla/javascript/ast/SwitchCase;->setLength(I)V

    .line 1187
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/SwitchCase;->setLineno(I)V

    .line 1192
    :goto_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v8

    const/16 v9, 0x56

    if-eq v8, v9, :cond_4

    const/16 v9, 0x73

    if-eq v8, v9, :cond_4

    const/16 v9, 0x74

    if-eq v8, v9, :cond_4

    if-eqz v8, :cond_4

    .line 1194
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v9

    invoke-virtual {v2, v9}, Lorg/mozilla/javascript/ast/SwitchCase;->addStatement(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_3

    .line 1171
    .end local v2    # "caseNode":Lorg/mozilla/javascript/ast/SwitchCase;
    :sswitch_2
    if-eqz v5, :cond_3

    .line 1172
    const-string v9, "msg.double.switch.default"

    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1174
    :cond_3
    const/4 v5, 0x1

    .line 1175
    const/4 v0, 0x0

    .line 1176
    const/16 v9, 0x67

    const-string v10, "msg.no.colon.case"

    invoke-direct {p0, v9, v10}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    goto :goto_2

    .line 1196
    .restart local v2    # "caseNode":Lorg/mozilla/javascript/ast/SwitchCase;
    :cond_4
    invoke-virtual {v6, v2}, Lorg/mozilla/javascript/ast/SwitchStatement;->addCase(Lorg/mozilla/javascript/ast/SwitchCase;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1160
    :sswitch_data_0
    .sparse-switch
        0x56 -> :sswitch_0
        0x73 -> :sswitch_1
        0x74 -> :sswitch_2
    .end sparse-switch
.end method

.method private throwStatement()Lorg/mozilla/javascript/ast/ThrowStatement;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1486
    iget v4, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v5, 0x32

    if-eq v4, v5, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1487
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1488
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v3, "pos":I
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1489
    .local v1, "lineno":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 1492
    const-string v4, "msg.bad.throw.eol"

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1494
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 1495
    .local v0, "expr":Lorg/mozilla/javascript/ast/AstNode;
    new-instance v2, Lorg/mozilla/javascript/ast/ThrowStatement;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v4

    invoke-direct {v2, v3, v4, v0}, Lorg/mozilla/javascript/ast/ThrowStatement;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 1496
    .local v2, "pn":Lorg/mozilla/javascript/ast/ThrowStatement;
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/ThrowStatement;->setLineno(I)V

    .line 1497
    return-object v2
.end method

.method private tryStatement()Lorg/mozilla/javascript/ast/TryStatement;
    .locals 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1387
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/Parser;->currentToken:I

    move/from16 v24, v0

    const/16 v25, 0x51

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_0

    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1388
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1391
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v12

    .line 1393
    .local v12, "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v21, v0

    .local v21, "tryPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v13, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v13, "lineno":I
    const/4 v10, -0x1

    .line 1394
    .local v10, "finallyPos":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v24

    const/16 v25, 0x55

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_1

    .line 1395
    const-string v24, "msg.no.brace.try"

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1397
    :cond_1
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v19

    .line 1398
    .local v19, "tryBlock":Lorg/mozilla/javascript/ast/AstNode;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v20

    .line 1400
    .local v20, "tryEnd":I
    const/4 v8, 0x0

    .line 1402
    .local v8, "clauses":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/CatchClause;>;"
    const/16 v18, 0x0

    .line 1403
    .local v18, "sawDefaultCatch":Z
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v15

    .line 1404
    .local v15, "peek":I
    const/16 v24, 0x7c

    move/from16 v0, v24

    if-ne v15, v0, :cond_b

    .line 1405
    :goto_0
    const/16 v24, 0x7c

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v24

    if-eqz v24, :cond_c

    .line 1406
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v5, v0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1407
    .local v5, "catchLineNum":I
    if-eqz v18, :cond_2

    .line 1408
    const-string v24, "msg.catch.unreachable"

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1410
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v7, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v7, "catchPos":I
    const/4 v14, -0x1

    .local v14, "lp":I
    const/16 v17, -0x1

    .local v17, "rp":I
    const/4 v11, -0x1

    .line 1411
    .local v11, "guardPos":I
    const/16 v24, 0x57

    const-string v25, "msg.no.paren.catch"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 1412
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v14, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1414
    :cond_3
    const/16 v24, 0x27

    const-string v25, "msg.bad.catchcond"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1415
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v22

    .line 1416
    .local v22, "varName":Lorg/mozilla/javascript/ast/Name;
    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v23

    .line 1417
    .local v23, "varNameString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    move/from16 v24, v0

    if-eqz v24, :cond_5

    .line 1418
    const-string v24, "eval"

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_4

    const-string v24, "arguments"

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_5

    .line 1421
    :cond_4
    const-string v24, "msg.bad.id.strict"

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1425
    :cond_5
    const/4 v4, 0x0

    .line 1426
    .local v4, "catchCond":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v24, 0x70

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v24

    if-eqz v24, :cond_a

    .line 1427
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v11, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1428
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 1433
    :goto_1
    const/16 v24, 0x58

    const-string v25, "msg.bad.catchcond"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 1434
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    move/from16 v17, v0

    .line 1435
    :cond_6
    const/16 v24, 0x55

    const-string v25, "msg.no.brace.catchblock"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1437
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->statements()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/ast/Block;

    .line 1438
    .local v3, "catchBlock":Lorg/mozilla/javascript/ast/Block;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v20

    .line 1439
    new-instance v6, Lorg/mozilla/javascript/ast/CatchClause;

    invoke-direct {v6, v7}, Lorg/mozilla/javascript/ast/CatchClause;-><init>(I)V

    .line 1440
    .local v6, "catchNode":Lorg/mozilla/javascript/ast/CatchClause;
    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/CatchClause;->setVarName(Lorg/mozilla/javascript/ast/Name;)V

    .line 1441
    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/ast/CatchClause;->setCatchCondition(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1442
    invoke-virtual {v6, v3}, Lorg/mozilla/javascript/ast/CatchClause;->setBody(Lorg/mozilla/javascript/ast/Block;)V

    .line 1443
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v11, v0, :cond_7

    .line 1444
    sub-int v24, v11, v7

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/CatchClause;->setIfPosition(I)V

    .line 1446
    :cond_7
    move/from16 v0, v17

    invoke-virtual {v6, v14, v0}, Lorg/mozilla/javascript/ast/CatchClause;->setParens(II)V

    .line 1447
    invoke-virtual {v6, v5}, Lorg/mozilla/javascript/ast/CatchClause;->setLineno(I)V

    .line 1449
    const/16 v24, 0x56

    const-string v25, "msg.no.brace.after.body"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_8

    .line 1450
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    move/from16 v20, v0

    .line 1451
    :cond_8
    sub-int v24, v20, v7

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/ast/CatchClause;->setLength(I)V

    .line 1452
    if-nez v8, :cond_9

    .line 1453
    new-instance v8, Ljava/util/ArrayList;

    .end local v8    # "clauses":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/CatchClause;>;"
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1454
    .restart local v8    # "clauses":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/CatchClause;>;"
    :cond_9
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1430
    .end local v3    # "catchBlock":Lorg/mozilla/javascript/ast/Block;
    .end local v6    # "catchNode":Lorg/mozilla/javascript/ast/CatchClause;
    :cond_a
    const/16 v18, 0x1

    goto/16 :goto_1

    .line 1456
    .end local v4    # "catchCond":Lorg/mozilla/javascript/ast/AstNode;
    .end local v5    # "catchLineNum":I
    .end local v7    # "catchPos":I
    .end local v11    # "guardPos":I
    .end local v14    # "lp":I
    .end local v17    # "rp":I
    .end local v22    # "varName":Lorg/mozilla/javascript/ast/Name;
    .end local v23    # "varNameString":Ljava/lang/String;
    :cond_b
    const/16 v24, 0x7d

    move/from16 v0, v24

    if-eq v15, v0, :cond_c

    .line 1457
    const/16 v24, 0x7d

    const-string v25, "msg.try.no.catchfinally"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1460
    :cond_c
    const/4 v9, 0x0

    .line 1461
    .local v9, "finallyBlock":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v24, 0x7d

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v24

    if-eqz v24, :cond_d

    .line 1462
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v10, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1463
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v9

    .line 1464
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v20

    .line 1467
    :cond_d
    new-instance v16, Lorg/mozilla/javascript/ast/TryStatement;

    sub-int v24, v20, v21

    move-object/from16 v0, v16

    move/from16 v1, v21

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/ast/TryStatement;-><init>(II)V

    .line 1468
    .local v16, "pn":Lorg/mozilla/javascript/ast/TryStatement;
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/TryStatement;->setTryBlock(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1469
    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/ast/TryStatement;->setCatchClauses(Ljava/util/List;)V

    .line 1470
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lorg/mozilla/javascript/ast/TryStatement;->setFinallyBlock(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1471
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v10, v0, :cond_e

    .line 1472
    sub-int v24, v10, v21

    move-object/from16 v0, v16

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/TryStatement;->setFinallyPosition(I)V

    .line 1474
    :cond_e
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/ast/TryStatement;->setLineno(I)V

    .line 1476
    if-eqz v12, :cond_f

    .line 1477
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/ast/TryStatement;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 1480
    :cond_f
    return-object v16
.end method

.method private unaryExpr()Lorg/mozilla/javascript/ast/AstNode;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 2294
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v4

    .line 2295
    .local v4, "tt":I
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v6, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 2297
    .local v1, "line":I
    sparse-switch v4, :sswitch_data_0

    .line 2349
    :cond_0
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/Parser;->memberExpr(Z)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 2351
    .local v3, "pn":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekTokenOrEOL()I

    move-result v4

    .line 2352
    const/16 v6, 0x6a

    if-eq v4, v6, :cond_1

    const/16 v6, 0x6b

    if-eq v4, v6, :cond_1

    move-object v2, v3

    .line 2360
    .end local v3    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :goto_0
    return-object v2

    .line 2302
    :sswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2303
    new-instance v2, Lorg/mozilla/javascript/ast/UnaryExpression;

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->unaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    invoke-direct {v2, v4, v6, v7}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 2304
    .local v2, "node":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto :goto_0

    .line 2308
    .end local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2310
    new-instance v2, Lorg/mozilla/javascript/ast/UnaryExpression;

    const/16 v6, 0x1c

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->unaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    invoke-direct {v2, v6, v7, v8}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 2311
    .restart local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto :goto_0

    .line 2315
    .end local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2317
    new-instance v2, Lorg/mozilla/javascript/ast/UnaryExpression;

    const/16 v6, 0x1d

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->unaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v8

    invoke-direct {v2, v6, v7, v8}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 2318
    .restart local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto :goto_0

    .line 2323
    .end local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_3
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2324
    new-instance v0, Lorg/mozilla/javascript/ast/UnaryExpression;

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/Parser;->memberExpr(Z)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    invoke-direct {v0, v4, v6, v7}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 2326
    .local v0, "expr":Lorg/mozilla/javascript/ast/UnaryExpression;
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/UnaryExpression;->setLineno(I)V

    .line 2327
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->checkBadIncDec(Lorg/mozilla/javascript/ast/UnaryExpression;)V

    move-object v2, v0

    .line 2328
    goto :goto_0

    .line 2331
    .end local v0    # "expr":Lorg/mozilla/javascript/ast/UnaryExpression;
    :sswitch_4
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2332
    new-instance v2, Lorg/mozilla/javascript/ast/UnaryExpression;

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->unaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v7

    invoke-direct {v2, v4, v6, v7}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;)V

    .line 2333
    .restart local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ast/AstNode;->setLineno(I)V

    goto :goto_0

    .line 2337
    .end local v2    # "node":Lorg/mozilla/javascript/ast/AstNode;
    :sswitch_5
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2338
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v2

    goto :goto_0

    .line 2342
    :sswitch_6
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v6}, Lorg/mozilla/javascript/CompilerEnvirons;->isXmlAvailable()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2343
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2344
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->xmlInitializer()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v6

    invoke-direct {p0, v7, v6}, Lorg/mozilla/javascript/Parser;->memberExprTail(ZLorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    goto/16 :goto_0

    .line 2355
    .restart local v3    # "pn":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 2356
    new-instance v5, Lorg/mozilla/javascript/ast/UnaryExpression;

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    invoke-direct {v5, v4, v6, v3, v7}, Lorg/mozilla/javascript/ast/UnaryExpression;-><init>(IILorg/mozilla/javascript/ast/AstNode;Z)V

    .line 2358
    .local v5, "uexpr":Lorg/mozilla/javascript/ast/UnaryExpression;
    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/ast/UnaryExpression;->setLineno(I)V

    .line 2359
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/Parser;->checkBadIncDec(Lorg/mozilla/javascript/ast/UnaryExpression;)V

    move-object v2, v5

    .line 2360
    goto/16 :goto_0

    .line 2297
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_5
        0xe -> :sswitch_6
        0x15 -> :sswitch_1
        0x16 -> :sswitch_2
        0x1a -> :sswitch_0
        0x1b -> :sswitch_0
        0x1f -> :sswitch_4
        0x20 -> :sswitch_0
        0x6a -> :sswitch_3
        0x6b -> :sswitch_3
        0x7e -> :sswitch_0
    .end sparse-switch
.end method

.method private variables(IIZ)Lorg/mozilla/javascript/ast/VariableDeclaration;
    .locals 15
    .param p1, "declType"    # I
    .param p2, "pos"    # I
    .param p3, "isStatement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1859
    new-instance v9, Lorg/mozilla/javascript/ast/VariableDeclaration;

    move/from16 v0, p2

    invoke-direct {v9, v0}, Lorg/mozilla/javascript/ast/VariableDeclaration;-><init>(I)V

    .line 1860
    .local v9, "pn":Lorg/mozilla/javascript/ast/VariableDeclaration;
    move/from16 v0, p1

    invoke-virtual {v9, v0}, Lorg/mozilla/javascript/ast/VariableDeclaration;->setType(I)Lorg/mozilla/javascript/Node;

    .line 1861
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v13, v13, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v9, v13}, Lorg/mozilla/javascript/ast/VariableDeclaration;->setLineno(I)V

    .line 1862
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v11

    .line 1863
    .local v11, "varjsdocNode":Lorg/mozilla/javascript/ast/Comment;
    if-eqz v11, :cond_0

    .line 1864
    invoke-virtual {v9, v11}, Lorg/mozilla/javascript/ast/VariableDeclaration;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 1870
    :cond_0
    const/4 v1, 0x0

    .line 1871
    .local v1, "destructuring":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v8, 0x0

    .line 1872
    .local v8, "name":Lorg/mozilla/javascript/ast/Name;
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v10

    .local v10, "tt":I
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v13, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1873
    .local v6, "kidPos":I
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v13, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1875
    .local v2, "end":I
    const/16 v13, 0x53

    if-eq v10, v13, :cond_1

    const/16 v13, 0x55

    if-ne v10, v13, :cond_5

    .line 1877
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->destructuringPrimaryExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 1878
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    .line 1879
    instance-of v13, v1, Lorg/mozilla/javascript/ast/DestructuringForm;

    if-nez v13, :cond_2

    .line 1880
    const-string v13, "msg.bad.assign.left"

    sub-int v14, v2, v6

    invoke-virtual {p0, v13, v6, v14}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;II)V

    .line 1881
    :cond_2
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1897
    :goto_0
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v13, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1899
    .local v7, "lineno":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v5

    .line 1901
    .local v5, "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    const/4 v4, 0x0

    .line 1902
    .local v4, "init":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v13, 0x5a

    invoke-direct {p0, v13}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 1903
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->assignExpr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 1904
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v2

    .line 1907
    :cond_3
    new-instance v12, Lorg/mozilla/javascript/ast/VariableInitializer;

    sub-int v13, v2, v6

    invoke-direct {v12, v6, v13}, Lorg/mozilla/javascript/ast/VariableInitializer;-><init>(II)V

    .line 1908
    .local v12, "vi":Lorg/mozilla/javascript/ast/VariableInitializer;
    if-eqz v1, :cond_8

    .line 1909
    if-nez v4, :cond_4

    iget-boolean v13, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    if-nez v13, :cond_4

    .line 1910
    const-string v13, "msg.destruct.assign.no.init"

    invoke-virtual {p0, v13}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 1912
    :cond_4
    invoke-virtual {v12, v1}, Lorg/mozilla/javascript/ast/VariableInitializer;->setTarget(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1916
    :goto_1
    invoke-virtual {v12, v4}, Lorg/mozilla/javascript/ast/VariableInitializer;->setInitializer(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1917
    move/from16 v0, p1

    invoke-virtual {v12, v0}, Lorg/mozilla/javascript/ast/VariableInitializer;->setType(I)Lorg/mozilla/javascript/Node;

    .line 1918
    invoke-virtual {v12, v5}, Lorg/mozilla/javascript/ast/VariableInitializer;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 1919
    invoke-virtual {v12, v7}, Lorg/mozilla/javascript/ast/VariableInitializer;->setLineno(I)V

    .line 1920
    invoke-virtual {v9, v12}, Lorg/mozilla/javascript/ast/VariableDeclaration;->addVariable(Lorg/mozilla/javascript/ast/VariableInitializer;)V

    .line 1922
    const/16 v13, 0x59

    invoke-direct {p0, v13}, Lorg/mozilla/javascript/Parser;->matchToken(I)Z

    move-result v13

    if-nez v13, :cond_0

    .line 1925
    sub-int v13, v2, p2

    invoke-virtual {v9, v13}, Lorg/mozilla/javascript/ast/VariableDeclaration;->setLength(I)V

    .line 1926
    move/from16 v0, p3

    invoke-virtual {v9, v0}, Lorg/mozilla/javascript/ast/VariableDeclaration;->setIsStatement(Z)V

    .line 1927
    return-object v9

    .line 1884
    .end local v4    # "init":Lorg/mozilla/javascript/ast/AstNode;
    .end local v5    # "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    .end local v7    # "lineno":I
    .end local v12    # "vi":Lorg/mozilla/javascript/ast/VariableInitializer;
    :cond_5
    const/16 v13, 0x27

    const-string v14, "msg.bad.var"

    invoke-direct {p0, v13, v14}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 1885
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->createNameNode()Lorg/mozilla/javascript/ast/Name;

    move-result-object v8

    .line 1886
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v13}, Lorg/mozilla/javascript/TokenStream;->getLineno()I

    move-result v13

    invoke-virtual {v8, v13}, Lorg/mozilla/javascript/ast/Name;->setLineno(I)V

    .line 1887
    iget-boolean v13, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    if-eqz v13, :cond_7

    .line 1888
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v13}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    .line 1889
    .local v3, "id":Ljava/lang/String;
    const-string v13, "eval"

    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_6

    const-string v13, "arguments"

    iget-object v14, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v14}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 1891
    :cond_6
    const-string v13, "msg.bad.id.strict"

    invoke-virtual {p0, v13, v3}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1894
    .end local v3    # "id":Ljava/lang/String;
    :cond_7
    iget-object v13, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v13}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v13

    iget-boolean v14, p0, Lorg/mozilla/javascript/Parser;->inForInit:Z

    move/from16 v0, p1

    invoke-virtual {p0, v0, v13, v14}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    goto/16 :goto_0

    .line 1914
    .restart local v4    # "init":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v5    # "jsdocNode":Lorg/mozilla/javascript/ast/Comment;
    .restart local v7    # "lineno":I
    .restart local v12    # "vi":Lorg/mozilla/javascript/ast/VariableInitializer;
    :cond_8
    invoke-virtual {v12, v8}, Lorg/mozilla/javascript/ast/VariableInitializer;->setTarget(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_1
.end method

.method private warnMissingSemi(II)V
    .locals 9
    .param p1, "pos"    # I
    .param p2, "end"    # I

    .prologue
    const/4 v7, 0x1

    .line 3552
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isStrictMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3553
    const/4 v0, 0x2

    new-array v8, v0, [I

    .line 3554
    .local v8, "linep":[I
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v0, p2, v8}, Lorg/mozilla/javascript/TokenStream;->getLine(I[I)Ljava/lang/String;

    move-result-object v6

    .line 3558
    .local v6, "line":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v0

    if-eqz v0, :cond_1

    aget v0, v8, v7

    sub-int v0, p2, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 3561
    .local v3, "beg":I
    :goto_0
    if-eqz v6, :cond_2

    .line 3562
    const-string v1, "msg.missing.semi"

    const-string v2, ""

    sub-int v4, p2, v3

    const/4 v0, 0x0

    aget v5, v8, v0

    aget v7, v8, v7

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V

    .line 3569
    .end local v3    # "beg":I
    .end local v6    # "line":Ljava/lang/String;
    .end local v8    # "linep":[I
    :cond_0
    :goto_1
    return-void

    .restart local v6    # "line":Ljava/lang/String;
    .restart local v8    # "linep":[I
    :cond_1
    move v3, p1

    .line 3558
    goto :goto_0

    .line 3566
    .restart local v3    # "beg":I
    :cond_2
    const-string v0, "msg.missing.semi"

    const-string v1, ""

    sub-int v2, p2, v3

    invoke-virtual {p0, v0, v1, v3, v2}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_1
.end method

.method private warnTrailingComma(ILjava/util/List;I)V
    .locals 2
    .param p1, "pos"    # I
    .param p3, "commaPos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 3572
    .local p2, "elems":Ljava/util/List;, "Ljava/util/List<*>;"
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->getWarnTrailingComma()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3574
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3575
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result p1

    .line 3577
    :cond_0
    invoke-direct {p0, p3}, Lorg/mozilla/javascript/Parser;->lineBeginningFor(I)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 3578
    const-string v0, "msg.extra.trailing.comma"

    sub-int v1, p3, p1

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;II)V

    .line 3580
    :cond_1
    return-void
.end method

.method private whileLoop()Lorg/mozilla/javascript/ast/WhileLoop;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1207
    iget v4, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v5, 0x75

    if-eq v4, v5, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1208
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1209
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v4, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1210
    .local v3, "pos":I
    new-instance v2, Lorg/mozilla/javascript/ast/WhileLoop;

    invoke-direct {v2, v3}, Lorg/mozilla/javascript/ast/WhileLoop;-><init>(I)V

    .line 1211
    .local v2, "pn":Lorg/mozilla/javascript/ast/WhileLoop;
    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v4, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/ast/WhileLoop;->setLineno(I)V

    .line 1212
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Parser;->enterLoop(Lorg/mozilla/javascript/ast/Loop;)V

    .line 1214
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->condition()Lorg/mozilla/javascript/Parser$ConditionData;

    move-result-object v1

    .line 1215
    .local v1, "data":Lorg/mozilla/javascript/Parser$ConditionData;
    iget-object v4, v1, Lorg/mozilla/javascript/Parser$ConditionData;->condition:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/ast/WhileLoop;->setCondition(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1216
    iget v4, v1, Lorg/mozilla/javascript/Parser$ConditionData;->lp:I

    sub-int/2addr v4, v3

    iget v5, v1, Lorg/mozilla/javascript/Parser$ConditionData;->rp:I

    sub-int/2addr v5, v3

    invoke-virtual {v2, v4, v5}, Lorg/mozilla/javascript/ast/WhileLoop;->setParens(II)V

    .line 1217
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 1218
    .local v0, "body":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/ast/WhileLoop;->setLength(I)V

    .line 1219
    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/ast/WhileLoop;->setBody(Lorg/mozilla/javascript/ast/AstNode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1221
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->exitLoop()V

    .line 1223
    return-object v2

    .line 1221
    .end local v0    # "body":Lorg/mozilla/javascript/ast/AstNode;
    .end local v1    # "data":Lorg/mozilla/javascript/Parser$ConditionData;
    :catchall_0
    move-exception v4

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->exitLoop()V

    throw v4
.end method

.method private withStatement()Lorg/mozilla/javascript/ast/WithStatement;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1599
    iget v8, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v9, 0x7b

    if-eq v8, v9, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1600
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->consumeToken()V

    .line 1602
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->getAndResetJsDoc()Lorg/mozilla/javascript/ast/Comment;

    move-result-object v7

    .line 1604
    .local v7, "withComment":Lorg/mozilla/javascript/ast/Comment;
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v8, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .local v1, "lineno":I
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v8, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v5, "pos":I
    const/4 v2, -0x1

    .local v2, "lp":I
    const/4 v6, -0x1

    .line 1605
    .local v6, "rp":I
    const/16 v8, 0x57

    const-string v9, "msg.no.paren.with"

    invoke-direct {p0, v8, v9}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1606
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v8, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1608
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v3

    .line 1610
    .local v3, "obj":Lorg/mozilla/javascript/ast/AstNode;
    const/16 v8, 0x58

    const-string v9, "msg.no.paren.after.with"

    invoke-direct {p0, v8, v9}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1611
    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v8, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 1613
    :cond_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->statement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 1615
    .local v0, "body":Lorg/mozilla/javascript/ast/AstNode;
    new-instance v4, Lorg/mozilla/javascript/ast/WithStatement;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v8

    sub-int/2addr v8, v5

    invoke-direct {v4, v5, v8}, Lorg/mozilla/javascript/ast/WithStatement;-><init>(II)V

    .line 1616
    .local v4, "pn":Lorg/mozilla/javascript/ast/WithStatement;
    invoke-virtual {v4, v7}, Lorg/mozilla/javascript/ast/WithStatement;->setJsDocNode(Lorg/mozilla/javascript/ast/Comment;)V

    .line 1617
    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/ast/WithStatement;->setExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1618
    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/ast/WithStatement;->setStatement(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 1619
    invoke-virtual {v4, v2, v6}, Lorg/mozilla/javascript/ast/WithStatement;->setParens(II)V

    .line 1620
    invoke-virtual {v4, v1}, Lorg/mozilla/javascript/ast/WithStatement;->setLineno(I)V

    .line 1621
    return-object v4
.end method

.method private xmlElemRef(ILorg/mozilla/javascript/ast/Name;I)Lorg/mozilla/javascript/ast/XmlElemRef;
    .locals 8
    .param p1, "atPos"    # I
    .param p2, "namespace"    # Lorg/mozilla/javascript/ast/Name;
    .param p3, "colonPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2771
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v2, "lb":I
    const/4 v4, -0x1

    .local v4, "rb":I
    const/4 v6, -0x1

    if-eq p1, v6, :cond_1

    move v3, p1

    .line 2772
    .local v3, "pos":I
    :goto_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    .line 2773
    .local v1, "expr":Lorg/mozilla/javascript/ast/AstNode;
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Parser;->getNodeEnd(Lorg/mozilla/javascript/ast/AstNode;)I

    move-result v0

    .line 2774
    .local v0, "end":I
    const/16 v6, 0x54

    const-string v7, "msg.no.bracket.index"

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2775
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v4, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2776
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 2778
    :cond_0
    new-instance v5, Lorg/mozilla/javascript/ast/XmlElemRef;

    sub-int v6, v0, v3

    invoke-direct {v5, v3, v6}, Lorg/mozilla/javascript/ast/XmlElemRef;-><init>(II)V

    .line 2779
    .local v5, "ref":Lorg/mozilla/javascript/ast/XmlElemRef;
    invoke-virtual {v5, p2}, Lorg/mozilla/javascript/ast/XmlElemRef;->setNamespace(Lorg/mozilla/javascript/ast/Name;)V

    .line 2780
    invoke-virtual {v5, p3}, Lorg/mozilla/javascript/ast/XmlElemRef;->setColonPos(I)V

    .line 2781
    invoke-virtual {v5, p1}, Lorg/mozilla/javascript/ast/XmlElemRef;->setAtPos(I)V

    .line 2782
    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/ast/XmlElemRef;->setExpression(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 2783
    invoke-virtual {v5, v2, v4}, Lorg/mozilla/javascript/ast/XmlElemRef;->setBrackets(II)V

    .line 2784
    return-object v5

    .end local v0    # "end":I
    .end local v1    # "expr":Lorg/mozilla/javascript/ast/AstNode;
    .end local v3    # "pos":I
    .end local v5    # "ref":Lorg/mozilla/javascript/ast/XmlElemRef;
    :cond_1
    move v3, v2

    .line 2771
    goto :goto_0
.end method

.method private xmlInitializer()Lorg/mozilla/javascript/ast/AstNode;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x56

    .line 2367
    iget v6, p0, Lorg/mozilla/javascript/Parser;->currentToken:I

    const/16 v7, 0xe

    if-eq v6, v7, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2368
    :cond_0
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .local v3, "pos":I
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->getFirstXMLToken()I

    move-result v4

    .line 2369
    .local v4, "tt":I
    const/16 v6, 0x91

    if-eq v4, v6, :cond_1

    const/16 v6, 0x94

    if-eq v4, v6, :cond_1

    .line 2370
    const-string v6, "msg.syntax"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2371
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v2

    .line 2399
    :goto_0
    return-object v2

    .line 2374
    :cond_1
    new-instance v2, Lorg/mozilla/javascript/ast/XmlLiteral;

    invoke-direct {v2, v3}, Lorg/mozilla/javascript/ast/XmlLiteral;-><init>(I)V

    .line 2375
    .local v2, "pn":Lorg/mozilla/javascript/ast/XmlLiteral;
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->lineno:I

    invoke-virtual {v2, v6}, Lorg/mozilla/javascript/ast/XmlLiteral;->setLineno(I)V

    .line 2378
    :goto_1
    packed-switch v4, :pswitch_data_0

    .line 2398
    :pswitch_0
    const-string v6, "msg.syntax"

    invoke-virtual {p0, v6}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 2399
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->makeErrorNode()Lorg/mozilla/javascript/ast/ErrorNode;

    move-result-object v2

    goto :goto_0

    .line 2380
    :pswitch_1
    new-instance v6, Lorg/mozilla/javascript/ast/XmlString;

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v8}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/mozilla/javascript/ast/XmlString;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v6}, Lorg/mozilla/javascript/ast/XmlLiteral;->addFragment(Lorg/mozilla/javascript/ast/XmlFragment;)V

    .line 2381
    const/16 v6, 0x55

    const-string v7, "msg.syntax"

    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 2382
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v6, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 2383
    .local v0, "beg":I
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->peekToken()I

    move-result v6

    if-ne v6, v9, :cond_2

    new-instance v1, Lorg/mozilla/javascript/ast/EmptyExpression;

    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v6, v0

    invoke-direct {v1, v0, v6}, Lorg/mozilla/javascript/ast/EmptyExpression;-><init>(II)V

    .line 2386
    .local v1, "expr":Lorg/mozilla/javascript/ast/AstNode;
    :goto_2
    const-string v6, "msg.syntax"

    invoke-direct {p0, v9, v6}, Lorg/mozilla/javascript/Parser;->mustMatchToken(ILjava/lang/String;)Z

    .line 2387
    new-instance v5, Lorg/mozilla/javascript/ast/XmlExpression;

    invoke-direct {v5, v0, v1}, Lorg/mozilla/javascript/ast/XmlExpression;-><init>(ILorg/mozilla/javascript/ast/AstNode;)V

    .line 2388
    .local v5, "xexpr":Lorg/mozilla/javascript/ast/XmlExpression;
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->isXMLAttribute()Z

    move-result v6

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/ast/XmlExpression;->setIsXmlAttribute(Z)V

    .line 2389
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v6, v6, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    sub-int/2addr v6, v0

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/ast/XmlExpression;->setLength(I)V

    .line 2390
    invoke-virtual {v2, v5}, Lorg/mozilla/javascript/ast/XmlLiteral;->addFragment(Lorg/mozilla/javascript/ast/XmlFragment;)V

    .line 2377
    iget-object v6, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v6}, Lorg/mozilla/javascript/TokenStream;->getNextXMLToken()I

    move-result v4

    goto :goto_1

    .line 2383
    .end local v1    # "expr":Lorg/mozilla/javascript/ast/AstNode;
    .end local v5    # "xexpr":Lorg/mozilla/javascript/ast/XmlExpression;
    :cond_2
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->expr()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v1

    goto :goto_2

    .line 2394
    .end local v0    # "beg":I
    :pswitch_2
    new-instance v6, Lorg/mozilla/javascript/ast/XmlString;

    iget-object v7, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v7, v7, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v8, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v8}, Lorg/mozilla/javascript/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/mozilla/javascript/ast/XmlString;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v6}, Lorg/mozilla/javascript/ast/XmlLiteral;->addFragment(Lorg/mozilla/javascript/ast/XmlFragment;)V

    goto/16 :goto_0

    .line 2378
    nop

    :pswitch_data_0
    .packed-switch 0x91
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method addError(Ljava/lang/String;)V
    .locals 3
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 162
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, v0, v1}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;II)V

    .line 163
    return-void
.end method

.method addError(Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "length"    # I

    .prologue
    .line 166
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 167
    return-void
.end method

.method addError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .prologue
    .line 170
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 172
    return-void
.end method

.method addError(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 6
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .prologue
    .line 176
    iget v0, p0, Lorg/mozilla/javascript/Parser;->syntaxErrorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/mozilla/javascript/Parser;->syntaxErrorCount:I

    .line 177
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 178
    .local v1, "message":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p3, p4}, Lorg/mozilla/javascript/ast/IdeErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;II)V

    .line 190
    :goto_0
    return-void

    .line 181
    :cond_0
    const/4 v3, 0x1

    .local v3, "lineno":I
    const/4 v5, 0x1

    .line 182
    .local v5, "offset":I
    const-string v4, ""

    .line 183
    .local v4, "line":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    if-eqz v0, :cond_1

    .line 184
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v0}, Lorg/mozilla/javascript/TokenStream;->getLineno()I

    move-result v3

    .line 185
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v0}, Lorg/mozilla/javascript/TokenStream;->getLine()Ljava/lang/String;

    move-result-object v4

    .line 186
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v0}, Lorg/mozilla/javascript/TokenStream;->getOffset()I

    move-result v5

    .line 188
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface/range {v0 .. v5}, Lorg/mozilla/javascript/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_0
.end method

.method addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .prologue
    .line 120
    const/4 v0, -0x1

    .local v0, "beg":I
    const/4 v1, -0x1

    .line 121
    .local v1, "end":I
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    if-eqz v2, :cond_0

    .line 122
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 123
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v1, v2, v3

    .line 125
    :cond_0
    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 126
    return-void
.end method

.method addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isStrictMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 132
    :cond_0
    return-void
.end method

.method addWarning(Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "length"    # I

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 145
    return-void
.end method

.method addWarning(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .prologue
    .line 135
    const/4 v0, -0x1

    .local v0, "beg":I
    const/4 v1, -0x1

    .line 136
    .local v1, "end":I
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    if-eqz v2, :cond_0

    .line 137
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 138
    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v3, v3, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int v1, v2, v3

    .line 140
    :cond_0
    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 141
    return-void
.end method

.method addWarning(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 6
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .prologue
    .line 150
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, "message":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->reportWarningAsError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 159
    :goto_0
    return-void

    .line 153
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    if-eqz v0, :cond_1

    .line 154
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorCollector:Lorg/mozilla/javascript/ast/IdeErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p3, p4}, Lorg/mozilla/javascript/ast/IdeErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 156
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->errorReporter:Lorg/mozilla/javascript/ErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v3}, Lorg/mozilla/javascript/TokenStream;->getLineno()I

    move-result v3

    iget-object v4, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v4}, Lorg/mozilla/javascript/TokenStream;->getLine()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v5}, Lorg/mozilla/javascript/TokenStream;->getOffset()I

    move-result v5

    invoke-interface/range {v0 .. v5}, Lorg/mozilla/javascript/ErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_0
.end method

.method protected checkActivationName(Ljava/lang/String;I)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "token"    # I

    .prologue
    .line 3443
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3463
    :cond_0
    :goto_0
    return-void

    .line 3446
    :cond_1
    const/4 v0, 0x0

    .line 3447
    .local v0, "activation":Z
    const-string v1, "arguments"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v1}, Lorg/mozilla/javascript/CompilerEnvirons;->getActivationNames()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v1}, Lorg/mozilla/javascript/CompilerEnvirons;->getActivationNames()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 3451
    :cond_2
    const/4 v0, 0x1

    .line 3460
    :cond_3
    :goto_1
    if-eqz v0, :cond_0

    .line 3461
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->setRequiresActivation()V

    goto :goto_0

    .line 3452
    :cond_4
    const-string v1, "length"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3453
    const/16 v1, 0x21

    if-ne p2, v1, :cond_3

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v1}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_3

    .line 3457
    const/4 v0, 0x1

    goto :goto_1
.end method

.method protected checkMutableReference(Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "n"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3919
    const/16 v1, 0x10

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v0

    .line 3920
    .local v0, "memberTypeFlags":I
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_0

    .line 3921
    const-string v1, "msg.bad.assign.left"

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3923
    :cond_0
    return-void
.end method

.method createDestructuringAssignment(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 4
    .param p1, "type"    # I
    .param p2, "left"    # Lorg/mozilla/javascript/Node;
    .param p3, "right"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3657
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v2

    .line 3658
    .local v2, "tempName":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, p3, v2}, Lorg/mozilla/javascript/Parser;->destructuringAssignmentHelper(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 3660
    .local v1, "result":Lorg/mozilla/javascript/Node;
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3661
    .local v0, "comma":Lorg/mozilla/javascript/Node;
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 3662
    return-object v1
.end method

.method protected createName(ILjava/lang/String;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 1
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3815
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 3816
    .local v0, "result":Lorg/mozilla/javascript/Node;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 3817
    if-eqz p3, :cond_0

    .line 3818
    invoke-virtual {v0, p3}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 3819
    :cond_0
    return-object v0
.end method

.method protected createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x27

    .line 3810
    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/Parser;->checkActivationName(Ljava/lang/String;I)V

    .line 3811
    invoke-static {v0, p1}, Lorg/mozilla/javascript/Node;->newString(ILjava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v0

    return-object v0
.end method

.method protected createNumber(D)Lorg/mozilla/javascript/Node;
    .locals 1
    .param p1, "number"    # D

    .prologue
    .line 3823
    invoke-static {p1, p2}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v0

    return-object v0
.end method

.method protected createScopeNode(II)Lorg/mozilla/javascript/ast/Scope;
    .locals 1
    .param p1, "token"    # I
    .param p2, "lineno"    # I

    .prologue
    .line 3835
    new-instance v0, Lorg/mozilla/javascript/ast/Scope;

    invoke-direct {v0}, Lorg/mozilla/javascript/ast/Scope;-><init>()V

    .line 3836
    .local v0, "scope":Lorg/mozilla/javascript/ast/Scope;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/Scope;->setType(I)Lorg/mozilla/javascript/Node;

    .line 3837
    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/ast/Scope;->setLineno(I)V

    .line 3838
    return-object v0
.end method

.method defineSymbol(ILjava/lang/String;)V
    .locals 1
    .param p1, "declType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1975
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 1976
    return-void
.end method

.method defineSymbol(ILjava/lang/String;Z)V
    .locals 7
    .param p1, "declType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "ignoreNotInBlock"    # Z

    .prologue
    const/16 v6, 0x99

    const/16 v5, 0x7a

    const/16 v4, 0x9a

    .line 1979
    if-nez p2, :cond_2

    .line 1980
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v3}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2035
    :cond_0
    :goto_0
    return-void

    .line 1983
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1986
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual {v3, p2}, Lorg/mozilla/javascript/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v0

    .line 1987
    .local v0, "definingScope":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v0, :cond_4

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/ast/Scope;->getSymbol(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Symbol;

    move-result-object v2

    .line 1990
    .local v2, "symbol":Lorg/mozilla/javascript/ast/Symbol;
    :goto_1
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/Symbol;->getDeclType()I

    move-result v1

    .line 1991
    .local v1, "symDeclType":I
    :goto_2
    if-eqz v2, :cond_a

    if-eq v1, v4, :cond_3

    if-eq p1, v4, :cond_3

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    if-ne v0, v3, :cond_a

    if-ne v1, v6, :cond_a

    .line 1996
    :cond_3
    if-ne v1, v4, :cond_6

    const-string v3, "msg.const.redecl"

    :goto_3
    invoke-virtual {p0, v3, p2}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1987
    .end local v1    # "symDeclType":I
    .end local v2    # "symbol":Lorg/mozilla/javascript/ast/Symbol;
    :cond_4
    const/4 v2, 0x0

    goto :goto_1

    .line 1990
    .restart local v2    # "symbol":Lorg/mozilla/javascript/ast/Symbol;
    :cond_5
    const/4 v1, -0x1

    goto :goto_2

    .line 1996
    .restart local v1    # "symDeclType":I
    :cond_6
    if-ne v1, v6, :cond_7

    const-string v3, "msg.let.redecl"

    goto :goto_3

    :cond_7
    if-ne v1, v5, :cond_8

    const-string v3, "msg.var.redecl"

    goto :goto_3

    :cond_8
    const/16 v3, 0x6d

    if-ne v1, v3, :cond_9

    const-string v3, "msg.fn.redecl"

    goto :goto_3

    :cond_9
    const-string v3, "msg.parm.redecl"

    goto :goto_3

    .line 2003
    :cond_a
    sparse-switch p1, :sswitch_data_0

    .line 2038
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2005
    :sswitch_0
    if-nez p3, :cond_c

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/Scope;->getType()I

    move-result v3

    const/16 v4, 0x70

    if-eq v3, v4, :cond_b

    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    instance-of v3, v3, Lorg/mozilla/javascript/ast/Loop;

    if-eqz v3, :cond_c

    .line 2008
    :cond_b
    const-string v3, "msg.let.decl.not.in.block"

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto :goto_0

    .line 2011
    :cond_c
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    new-instance v4, Lorg/mozilla/javascript/ast/Symbol;

    invoke-direct {v4, p1, p2}, Lorg/mozilla/javascript/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/Scope;->putSymbol(Lorg/mozilla/javascript/ast/Symbol;)V

    goto :goto_0

    .line 2017
    :sswitch_1
    if-eqz v2, :cond_e

    .line 2018
    if-ne v1, v5, :cond_d

    .line 2019
    const-string v3, "msg.var.redecl"

    invoke-virtual {p0, v3, p2}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2020
    :cond_d
    const/16 v3, 0x57

    if-ne v1, v3, :cond_0

    .line 2021
    const-string v3, "msg.var.hides.arg"

    invoke-virtual {p0, v3, p2}, Lorg/mozilla/javascript/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2024
    :cond_e
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    new-instance v4, Lorg/mozilla/javascript/ast/Symbol;

    invoke-direct {v4, p1, p2}, Lorg/mozilla/javascript/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/ScriptNode;->putSymbol(Lorg/mozilla/javascript/ast/Symbol;)V

    goto/16 :goto_0

    .line 2029
    :sswitch_2
    if-eqz v2, :cond_f

    .line 2032
    const-string v3, "msg.dup.parms"

    invoke-virtual {p0, v3, p2}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;)V

    .line 2034
    :cond_f
    iget-object v3, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    new-instance v4, Lorg/mozilla/javascript/ast/Symbol;

    invoke-direct {v4, p1, p2}, Lorg/mozilla/javascript/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/ScriptNode;->putSymbol(Lorg/mozilla/javascript/ast/Symbol;)V

    goto/16 :goto_0

    .line 2003
    :sswitch_data_0
    .sparse-switch
        0x57 -> :sswitch_2
        0x6d -> :sswitch_1
        0x7a -> :sswitch_1
        0x99 -> :sswitch_0
        0x9a -> :sswitch_1
    .end sparse-switch
.end method

.method destructuringArray(Lorg/mozilla/javascript/ast/ArrayLiteral;ILjava/lang/String;Lorg/mozilla/javascript/Node;Ljava/util/List;)Z
    .locals 14
    .param p1, "array"    # Lorg/mozilla/javascript/ast/ArrayLiteral;
    .param p2, "variableType"    # I
    .param p3, "tempName"    # Ljava/lang/String;
    .param p4, "parent"    # Lorg/mozilla/javascript/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/ast/ArrayLiteral;",
            "I",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/Node;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 3719
    .local p5, "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 3720
    .local v2, "empty":Z
    const/16 v9, 0x9a

    move/from16 v0, p2

    if-ne v0, v9, :cond_0

    const/16 v8, 0x9b

    .line 3722
    .local v8, "setOp":I
    :goto_0
    const/4 v4, 0x0

    .line 3723
    .local v4, "index":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ArrayLiteral;->getElements()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/mozilla/javascript/ast/AstNode;

    .line 3724
    .local v5, "n":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v9

    const/16 v10, 0x80

    if-ne v9, v10, :cond_1

    .line 3725
    add-int/lit8 v4, v4, 0x1

    .line 3726
    goto :goto_1

    .line 3720
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "index":I
    .end local v5    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .end local v8    # "setOp":I
    :cond_0
    const/16 v8, 0x8

    goto :goto_0

    .line 3728
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "index":I
    .restart local v5    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v8    # "setOp":I
    :cond_1
    new-instance v7, Lorg/mozilla/javascript/Node;

    const/16 v9, 0x24

    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v10

    int-to-double v12, v4

    invoke-virtual {p0, v12, v13}, Lorg/mozilla/javascript/Parser;->createNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v11

    invoke-direct {v7, v9, v10, v11}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3731
    .local v7, "rightElem":Lorg/mozilla/javascript/Node;
    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v9

    const/16 v10, 0x27

    if-ne v9, v10, :cond_3

    .line 3732
    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/AstNode;->getString()Ljava/lang/String;

    move-result-object v6

    .line 3733
    .local v6, "name":Ljava/lang/String;
    new-instance v9, Lorg/mozilla/javascript/Node;

    const/16 v10, 0x31

    const/4 v11, 0x0

    invoke-virtual {p0, v10, v6, v11}, Lorg/mozilla/javascript/Parser;->createName(ILjava/lang/String;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v10

    invoke-direct {v9, v8, v10, v7}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 3737
    const/4 v9, -0x1

    move/from16 v0, p2

    if-eq v0, v9, :cond_2

    .line 3738
    const/4 v9, 0x1

    move/from16 v0, p2

    invoke-virtual {p0, v0, v6, v9}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 3739
    move-object/from16 v0, p5

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3748
    .end local v6    # "name":Ljava/lang/String;
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 3749
    const/4 v2, 0x0

    .line 3750
    goto :goto_1

    .line 3742
    :cond_3
    iget-object v9, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v9}, Lorg/mozilla/javascript/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v9

    move/from16 v0, p2

    invoke-virtual {p0, v0, v5, v7, v9}, Lorg/mozilla/javascript/Parser;->destructuringAssignmentHelper(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v9

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_2

    .line 3751
    .end local v5    # "n":Lorg/mozilla/javascript/ast/AstNode;
    .end local v7    # "rightElem":Lorg/mozilla/javascript/Node;
    :cond_4
    return v2
.end method

.method destructuringAssignmentHelper(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Ljava/lang/String;)Lorg/mozilla/javascript/Node;
    .locals 8
    .param p1, "variableType"    # I
    .param p2, "left"    # Lorg/mozilla/javascript/Node;
    .param p3, "right"    # Lorg/mozilla/javascript/Node;
    .param p4, "tempName"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x99

    .line 3668
    const/16 v0, 0x9e

    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/Parser;->createScopeNode(II)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v7

    .line 3669
    .local v7, "result":Lorg/mozilla/javascript/ast/Scope;
    new-instance v0, Lorg/mozilla/javascript/Node;

    const/16 v1, 0x27

    invoke-virtual {p0, v1, p4, p3}, Lorg/mozilla/javascript/Parser;->createName(ILjava/lang/String;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    invoke-virtual {v7, v0}, Lorg/mozilla/javascript/ast/Scope;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 3672
    :try_start_0
    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/Parser;->pushScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 3673
    const/16 v0, 0x99

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p4, v1}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3675
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    .line 3677
    new-instance v4, Lorg/mozilla/javascript/Node;

    const/16 v0, 0x59

    invoke-direct {v4, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 3678
    .local v4, "comma":Lorg/mozilla/javascript/Node;
    invoke-virtual {v7, v4}, Lorg/mozilla/javascript/ast/Scope;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 3679
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 3680
    .local v5, "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x1

    .line 3681
    .local v6, "empty":Z
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 3703
    const-string v0, "msg.bad.assign.left"

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 3705
    :goto_0
    if-eqz v6, :cond_0

    .line 3707
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/Parser;->createNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v0

    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 3709
    :cond_0
    const/16 v0, 0x16

    invoke-virtual {v7, v0, v5}, Lorg/mozilla/javascript/ast/Scope;->putProp(ILjava/lang/Object;)V

    .line 3710
    return-object v7

    .line 3675
    .end local v4    # "comma":Lorg/mozilla/javascript/Node;
    .end local v5    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "empty":Z
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->popScope()V

    throw v0

    .restart local v4    # "comma":Lorg/mozilla/javascript/Node;
    .restart local v5    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v6    # "empty":Z
    :sswitch_0
    move-object v1, p2

    .line 3683
    check-cast v1, Lorg/mozilla/javascript/ast/ArrayLiteral;

    move-object v0, p0

    move v2, p1

    move-object v3, p4

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/Parser;->destructuringArray(Lorg/mozilla/javascript/ast/ArrayLiteral;ILjava/lang/String;Lorg/mozilla/javascript/Node;Ljava/util/List;)Z

    move-result v6

    .line 3686
    goto :goto_0

    :sswitch_1
    move-object v1, p2

    .line 3688
    check-cast v1, Lorg/mozilla/javascript/ast/ObjectLiteral;

    move-object v0, p0

    move v2, p1

    move-object v3, p4

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/Parser;->destructuringObject(Lorg/mozilla/javascript/ast/ObjectLiteral;ILjava/lang/String;Lorg/mozilla/javascript/Node;Ljava/util/List;)Z

    move-result v6

    .line 3691
    goto :goto_0

    .line 3694
    :sswitch_2
    sparse-switch p1, :sswitch_data_1

    .line 3700
    :goto_1
    invoke-virtual {p0, p4}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lorg/mozilla/javascript/Parser;->simpleAssignment(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v0

    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 3698
    :sswitch_3
    const-string v0, "msg.bad.assign.left"

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_1

    .line 3681
    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_2
        0x24 -> :sswitch_2
        0x41 -> :sswitch_0
        0x42 -> :sswitch_1
    .end sparse-switch

    .line 3694
    :sswitch_data_1
    .sparse-switch
        0x7a -> :sswitch_3
        0x99 -> :sswitch_3
        0x9a -> :sswitch_3
    .end sparse-switch
.end method

.method destructuringObject(Lorg/mozilla/javascript/ast/ObjectLiteral;ILjava/lang/String;Lorg/mozilla/javascript/Node;Ljava/util/List;)Z
    .locals 15
    .param p1, "node"    # Lorg/mozilla/javascript/ast/ObjectLiteral;
    .param p2, "variableType"    # I
    .param p3, "tempName"    # Ljava/lang/String;
    .param p4, "parent"    # Lorg/mozilla/javascript/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/ast/ObjectLiteral;",
            "I",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/Node;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 3760
    .local p5, "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 3761
    .local v2, "empty":Z
    const/16 v12, 0x9a

    move/from16 v0, p2

    if-ne v0, v12, :cond_2

    const/16 v10, 0x9b

    .line 3764
    .local v10, "setOp":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/ast/ObjectLiteral;->getElements()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/mozilla/javascript/ast/ObjectProperty;

    .line 3765
    .local v7, "prop":Lorg/mozilla/javascript/ast/ObjectProperty;
    const/4 v5, 0x0

    .line 3769
    .local v5, "lineno":I
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    if-eqz v12, :cond_0

    .line 3770
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v5, v12, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 3772
    :cond_0
    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/ObjectProperty;->getLeft()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v4

    .line 3773
    .local v4, "id":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v8, 0x0

    .line 3774
    .local v8, "rightElem":Lorg/mozilla/javascript/Node;
    instance-of v12, v4, Lorg/mozilla/javascript/ast/Name;

    if-eqz v12, :cond_3

    .line 3775
    check-cast v4, Lorg/mozilla/javascript/ast/Name;

    .end local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/mozilla/javascript/Node;->newString(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v9

    .line 3776
    .local v9, "s":Lorg/mozilla/javascript/Node;
    new-instance v8, Lorg/mozilla/javascript/Node;

    .end local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    const/16 v12, 0x21

    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v13

    invoke-direct {v8, v12, v13, v9}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3786
    .restart local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    :goto_2
    invoke-virtual {v8, v5}, Lorg/mozilla/javascript/Node;->setLineno(I)V

    .line 3787
    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/ObjectProperty;->getRight()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v11

    .line 3788
    .local v11, "value":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v11}, Lorg/mozilla/javascript/ast/AstNode;->getType()I

    move-result v12

    const/16 v13, 0x27

    if-ne v12, v13, :cond_6

    .line 3789
    check-cast v11, Lorg/mozilla/javascript/ast/Name;

    .end local v11    # "value":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v11}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    .line 3790
    .local v6, "name":Ljava/lang/String;
    new-instance v12, Lorg/mozilla/javascript/Node;

    const/16 v13, 0x31

    const/4 v14, 0x0

    invoke-virtual {p0, v13, v6, v14}, Lorg/mozilla/javascript/Parser;->createName(ILjava/lang/String;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v13

    invoke-direct {v12, v10, v13, v8}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 3794
    const/4 v12, -0x1

    move/from16 v0, p2

    if-eq v0, v12, :cond_1

    .line 3795
    const/4 v12, 0x1

    move/from16 v0, p2

    invoke-virtual {p0, v0, v6, v12}, Lorg/mozilla/javascript/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 3796
    move-object/from16 v0, p5

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3804
    .end local v6    # "name":Ljava/lang/String;
    :cond_1
    :goto_3
    const/4 v2, 0x0

    .line 3805
    goto :goto_1

    .line 3761
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "lineno":I
    .end local v7    # "prop":Lorg/mozilla/javascript/ast/ObjectProperty;
    .end local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    .end local v9    # "s":Lorg/mozilla/javascript/Node;
    .end local v10    # "setOp":I
    :cond_2
    const/16 v10, 0x8

    goto :goto_0

    .line 3777
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v5    # "lineno":I
    .restart local v7    # "prop":Lorg/mozilla/javascript/ast/ObjectProperty;
    .restart local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    .restart local v10    # "setOp":I
    :cond_3
    instance-of v12, v4, Lorg/mozilla/javascript/ast/StringLiteral;

    if-eqz v12, :cond_4

    .line 3778
    check-cast v4, Lorg/mozilla/javascript/ast/StringLiteral;

    .end local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/mozilla/javascript/Node;->newString(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v9

    .line 3779
    .restart local v9    # "s":Lorg/mozilla/javascript/Node;
    new-instance v8, Lorg/mozilla/javascript/Node;

    .end local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    const/16 v12, 0x21

    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v13

    invoke-direct {v8, v12, v13, v9}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3780
    .restart local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    goto :goto_2

    .end local v9    # "s":Lorg/mozilla/javascript/Node;
    .restart local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    :cond_4
    instance-of v12, v4, Lorg/mozilla/javascript/ast/NumberLiteral;

    if-eqz v12, :cond_5

    .line 3781
    check-cast v4, Lorg/mozilla/javascript/ast/NumberLiteral;

    .end local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v4}, Lorg/mozilla/javascript/ast/NumberLiteral;->getNumber()D

    move-result-wide v12

    double-to-int v12, v12

    int-to-double v12, v12

    invoke-virtual {p0, v12, v13}, Lorg/mozilla/javascript/Parser;->createNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v9

    .line 3782
    .restart local v9    # "s":Lorg/mozilla/javascript/Node;
    new-instance v8, Lorg/mozilla/javascript/Node;

    .end local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    const/16 v12, 0x24

    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->createName(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v13

    invoke-direct {v8, v12, v13, v9}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3783
    .restart local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    goto :goto_2

    .line 3784
    .end local v9    # "s":Lorg/mozilla/javascript/Node;
    .restart local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    :cond_5
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v12

    throw v12

    .line 3799
    .end local v4    # "id":Lorg/mozilla/javascript/ast/AstNode;
    .restart local v9    # "s":Lorg/mozilla/javascript/Node;
    .restart local v11    # "value":Lorg/mozilla/javascript/ast/AstNode;
    :cond_6
    iget-object v12, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v12}, Lorg/mozilla/javascript/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {p0, v0, v11, v8, v12}, Lorg/mozilla/javascript/Parser;->destructuringAssignmentHelper(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v12

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_3

    .line 3806
    .end local v5    # "lineno":I
    .end local v7    # "prop":Lorg/mozilla/javascript/ast/ObjectProperty;
    .end local v8    # "rightElem":Lorg/mozilla/javascript/Node;
    .end local v9    # "s":Lorg/mozilla/javascript/Node;
    .end local v11    # "value":Lorg/mozilla/javascript/ast/AstNode;
    :cond_7
    return v2
.end method

.method public eof()Z
    .locals 1

    .prologue
    .line 432
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v0}, Lorg/mozilla/javascript/TokenStream;->eof()Z

    move-result v0

    return v0
.end method

.method insideFunction()Z
    .locals 1

    .prologue
    .line 436
    iget v0, p0, Lorg/mozilla/javascript/Parser;->nestingOfFunction:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method lookupMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 226
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .prologue
    .line 230
    if-nez p2, :cond_0

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 3934
    instance-of v0, p1, Lorg/mozilla/javascript/ast/DestructuringForm;

    if-eqz v0, :cond_1

    .line 3935
    check-cast p1, Lorg/mozilla/javascript/ast/DestructuringForm;

    .end local p1    # "node":Lorg/mozilla/javascript/ast/AstNode;
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lorg/mozilla/javascript/ast/DestructuringForm;->setIsDestructuring(Z)V

    .line 3939
    :cond_0
    :goto_0
    return-void

    .line 3936
    .restart local p1    # "node":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1
    instance-of v0, p1, Lorg/mozilla/javascript/ast/ParenthesizedExpression;

    if-eqz v0, :cond_0

    .line 3937
    check-cast p1, Lorg/mozilla/javascript/ast/ParenthesizedExpression;

    .end local p1    # "node":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;->getExpression()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Parser;->markDestructuring(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_0
.end method

.method public parse(Ljava/io/Reader;Ljava/lang/String;I)Lorg/mozilla/javascript/ast/AstRoot;
    .locals 3
    .param p1, "sourceReader"    # Ljava/io/Reader;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "lineno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 528
    iget-boolean v0, p0, Lorg/mozilla/javascript/Parser;->parseFinished:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "parser reused"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 529
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 530
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Parser;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/mozilla/javascript/Parser;->parse(Ljava/lang/String;Ljava/lang/String;I)Lorg/mozilla/javascript/ast/AstRoot;

    move-result-object v0

    .line 537
    :goto_0
    return-object v0

    .line 533
    :cond_1
    :try_start_0
    iput-object p2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    .line 534
    new-instance v0, Lorg/mozilla/javascript/TokenStream;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1, p3}, Lorg/mozilla/javascript/TokenStream;-><init>(Lorg/mozilla/javascript/Parser;Ljava/io/Reader;Ljava/lang/String;I)V

    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    .line 535
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->parse()Lorg/mozilla/javascript/ast/AstRoot;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 537
    iput-boolean v2, p0, Lorg/mozilla/javascript/Parser;->parseFinished:Z

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-boolean v2, p0, Lorg/mozilla/javascript/Parser;->parseFinished:Z

    throw v0
.end method

.method public parse(Ljava/lang/String;Ljava/lang/String;I)Lorg/mozilla/javascript/ast/AstRoot;
    .locals 4
    .param p1, "sourceString"    # Ljava/lang/String;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "lineno"    # I

    .prologue
    const/4 v3, 0x1

    .line 504
    iget-boolean v1, p0, Lorg/mozilla/javascript/Parser;->parseFinished:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "parser reused"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 505
    :cond_0
    iput-object p2, p0, Lorg/mozilla/javascript/Parser;->sourceURI:Ljava/lang/String;

    .line 506
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v1}, Lorg/mozilla/javascript/CompilerEnvirons;->isIdeMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 507
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/Parser;->sourceChars:[C

    .line 509
    :cond_1
    new-instance v1, Lorg/mozilla/javascript/TokenStream;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, p1, p3}, Lorg/mozilla/javascript/TokenStream;-><init>(Lorg/mozilla/javascript/Parser;Ljava/io/Reader;Ljava/lang/String;I)V

    iput-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    .line 511
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->parse()Lorg/mozilla/javascript/ast/AstRoot;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 516
    iput-boolean v3, p0, Lorg/mozilla/javascript/Parser;->parseFinished:Z

    return-object v1

    .line 512
    :catch_0
    move-exception v0

    .line 514
    .local v0, "iox":Ljava/io/IOException;
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 516
    .end local v0    # "iox":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    iput-boolean v3, p0, Lorg/mozilla/javascript/Parser;->parseFinished:Z

    throw v1
.end method

.method popScope()V
    .locals 1

    .prologue
    .line 453
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    .line 454
    return-void
.end method

.method pushScope(Lorg/mozilla/javascript/ast/Scope;)V
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/ast/Scope;

    .prologue
    .line 440
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v0

    .line 443
    .local v0, "parent":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v0, :cond_1

    .line 444
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    if-eq v0, v1, :cond_0

    .line 445
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 449
    :cond_0
    :goto_0
    iput-object p1, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    .line 450
    return-void

    .line 447
    :cond_1
    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->currentScope:Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/Scope;->addChildScope(Lorg/mozilla/javascript/ast/Scope;)V

    goto :goto_0
.end method

.method protected removeParens(Lorg/mozilla/javascript/ast/AstNode;)Lorg/mozilla/javascript/ast/AstNode;
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 3927
    :goto_0
    instance-of v0, p1, Lorg/mozilla/javascript/ast/ParenthesizedExpression;

    if-eqz v0, :cond_0

    .line 3928
    check-cast p1, Lorg/mozilla/javascript/ast/ParenthesizedExpression;

    .end local p1    # "node":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ParenthesizedExpression;->getExpression()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object p1

    .restart local p1    # "node":Lorg/mozilla/javascript/ast/AstNode;
    goto :goto_0

    .line 3930
    :cond_0
    return-object p1
.end method

.method reportError(Ljava/lang/String;)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 236
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    return-void
.end method

.method reportError(Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "length"    # I

    .prologue
    .line 250
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 251
    return-void
.end method

.method reportError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 240
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    if-nez v0, :cond_0

    .line 241
    invoke-virtual {p0, p1, p2, v1, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 246
    :goto_0
    return-void

    .line 243
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v1, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lorg/mozilla/javascript/Parser;->ts:Lorg/mozilla/javascript/TokenStream;

    iget v2, v2, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0
.end method

.method reportError(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 2
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .prologue
    .line 256
    invoke-virtual {p0, p1, p3, p4}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;II)V

    .line 258
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->recoverFromErrors()Z

    move-result v0

    if-nez v0, :cond_0

    .line 259
    new-instance v0, Lorg/mozilla/javascript/Parser$ParserException;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/Parser$ParserException;-><init>(Lorg/mozilla/javascript/Parser$1;)V

    throw v0

    .line 261
    :cond_0
    return-void
.end method

.method protected setIsGenerator()V
    .locals 1

    .prologue
    .line 3480
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3481
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v0, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->setIsGenerator()V

    .line 3483
    :cond_0
    return-void
.end method

.method protected setRequiresActivation()V
    .locals 1

    .prologue
    .line 3466
    invoke-virtual {p0}, Lorg/mozilla/javascript/Parser;->insideFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3467
    iget-object v0, p0, Lorg/mozilla/javascript/Parser;->currentScriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v0, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->setRequiresActivation()V

    .line 3469
    :cond_0
    return-void
.end method

.method protected simpleAssignment(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .locals 7
    .param p1, "left"    # Lorg/mozilla/javascript/Node;
    .param p2, "right"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 3864
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v1

    .line 3865
    .local v1, "nodeType":I
    sparse-switch v1, :sswitch_data_0

    .line 3915
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 3867
    :sswitch_0
    iget-boolean v5, p0, Lorg/mozilla/javascript/Parser;->inUseStrictDirective:Z

    if-eqz v5, :cond_0

    const-string v6, "eval"

    move-object v5, p1

    check-cast v5, Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 3870
    const-string v6, "msg.bad.id.strict"

    move-object v5, p1

    check-cast v5, Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v6, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3873
    :cond_0
    const/16 v5, 0x31

    invoke-virtual {p1, v5}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 3874
    new-instance v5, Lorg/mozilla/javascript/Node;

    const/16 v6, 0x8

    invoke-direct {v5, v6, p1, p2}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 3911
    .end local p1    # "left":Lorg/mozilla/javascript/Node;
    :goto_0
    return-object v5

    .line 3883
    .restart local p1    # "left":Lorg/mozilla/javascript/Node;
    :sswitch_1
    instance-of v5, p1, Lorg/mozilla/javascript/ast/PropertyGet;

    if-eqz v5, :cond_1

    move-object v5, p1

    .line 3884
    check-cast v5, Lorg/mozilla/javascript/ast/PropertyGet;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/PropertyGet;->getTarget()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 3885
    .local v2, "obj":Lorg/mozilla/javascript/Node;
    check-cast p1, Lorg/mozilla/javascript/ast/PropertyGet;

    .end local p1    # "left":Lorg/mozilla/javascript/Node;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/PropertyGet;->getProperty()Lorg/mozilla/javascript/ast/Name;

    move-result-object v0

    .line 3895
    .local v0, "id":Lorg/mozilla/javascript/Node;
    :goto_1
    const/16 v5, 0x21

    if-ne v1, v5, :cond_3

    .line 3896
    const/16 v4, 0x23

    .line 3902
    .local v4, "type":I
    const/16 v5, 0x29

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 3906
    :goto_2
    new-instance v5, Lorg/mozilla/javascript/Node;

    invoke-direct {v5, v4, v2, v0, p2}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 3886
    .end local v0    # "id":Lorg/mozilla/javascript/Node;
    .end local v2    # "obj":Lorg/mozilla/javascript/Node;
    .end local v4    # "type":I
    .restart local p1    # "left":Lorg/mozilla/javascript/Node;
    :cond_1
    instance-of v5, p1, Lorg/mozilla/javascript/ast/ElementGet;

    if-eqz v5, :cond_2

    move-object v5, p1

    .line 3887
    check-cast v5, Lorg/mozilla/javascript/ast/ElementGet;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ElementGet;->getTarget()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    .line 3888
    .restart local v2    # "obj":Lorg/mozilla/javascript/Node;
    check-cast p1, Lorg/mozilla/javascript/ast/ElementGet;

    .end local p1    # "left":Lorg/mozilla/javascript/Node;
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ElementGet;->getElement()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .restart local v0    # "id":Lorg/mozilla/javascript/Node;
    goto :goto_1

    .line 3891
    .end local v0    # "id":Lorg/mozilla/javascript/Node;
    .end local v2    # "obj":Lorg/mozilla/javascript/Node;
    .restart local p1    # "left":Lorg/mozilla/javascript/Node;
    :cond_2
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 3892
    .restart local v2    # "obj":Lorg/mozilla/javascript/Node;
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .restart local v0    # "id":Lorg/mozilla/javascript/Node;
    goto :goto_1

    .line 3904
    .end local p1    # "left":Lorg/mozilla/javascript/Node;
    :cond_3
    const/16 v4, 0x25

    .restart local v4    # "type":I
    goto :goto_2

    .line 3909
    .end local v0    # "id":Lorg/mozilla/javascript/Node;
    .end local v2    # "obj":Lorg/mozilla/javascript/Node;
    .end local v4    # "type":I
    .restart local p1    # "left":Lorg/mozilla/javascript/Node;
    :sswitch_2
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 3910
    .local v3, "ref":Lorg/mozilla/javascript/Node;
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/Parser;->checkMutableReference(Lorg/mozilla/javascript/Node;)V

    .line 3911
    new-instance v5, Lorg/mozilla/javascript/Node;

    const/16 v6, 0x44

    invoke-direct {v5, v6, v3, p2}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_0

    .line 3865
    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_1
        0x24 -> :sswitch_1
        0x27 -> :sswitch_0
        0x43 -> :sswitch_2
    .end sparse-switch
.end method
