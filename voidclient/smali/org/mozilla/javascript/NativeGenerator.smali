.class public final Lorg/mozilla/javascript/NativeGenerator;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;,
        Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;
    }
.end annotation


# static fields
.field public static final GENERATOR_CLOSE:I = 0x2

.field public static final GENERATOR_SEND:I = 0x0

.field private static final GENERATOR_TAG:Ljava/lang/Object;

.field public static final GENERATOR_THROW:I = 0x1

.field private static final Id___iterator__:I = 0x5

.field private static final Id_close:I = 0x1

.field private static final Id_next:I = 0x2

.field private static final Id_send:I = 0x3

.field private static final Id_throw:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0x5

.field private static final serialVersionUID:J = 0x16d762746ec522c9L


# instance fields
.field private firstTime:Z

.field private function:Lorg/mozilla/javascript/NativeFunction;

.field private lineNumber:I

.field private lineSource:Ljava/lang/String;

.field private locked:Z

.field private savedState:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, "Generator"

    sput-object v0, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;Ljava/lang/Object;)V
    .locals 3
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "function"    # Lorg/mozilla/javascript/NativeFunction;
    .param p3, "savedState"    # Ljava/lang/Object;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 241
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    .line 54
    iput-object p2, p0, Lorg/mozilla/javascript/NativeGenerator;->function:Lorg/mozilla/javascript/NativeFunction;

    .line 55
    iput-object p3, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 59
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 60
    .local v1, "top":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/NativeGenerator;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 61
    sget-object v2, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getTopScopeValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/NativeGenerator;

    .line 63
    .local v0, "prototype":Lorg/mozilla/javascript/NativeGenerator;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeGenerator;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/NativeGenerator;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/NativeGenerator;
    .param p1, "x1"    # Lorg/mozilla/javascript/Context;
    .param p2, "x2"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "x3"    # I
    .param p4, "x4"    # Ljava/lang/Object;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static init(Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/NativeGenerator;
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p1, "sealed"    # Z

    .prologue
    .line 25
    new-instance v0, Lorg/mozilla/javascript/NativeGenerator;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeGenerator;-><init>()V

    .line 26
    .local v0, "prototype":Lorg/mozilla/javascript/NativeGenerator;
    if-eqz p0, :cond_0

    .line 27
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeGenerator;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 28
    invoke-static {p0}, Lorg/mozilla/javascript/NativeGenerator;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeGenerator;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 30
    :cond_0
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeGenerator;->activatePrototypeMap(I)V

    .line 31
    if-eqz p1, :cond_1

    .line 32
    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeGenerator;->sealObject()V

    .line 39
    :cond_1
    if-eqz p0, :cond_2

    .line 40
    sget-object v1, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lorg/mozilla/javascript/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_2
    return-object v0
.end method

.method private resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "operation"    # I
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 161
    iget-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    if-nez v0, :cond_3

    .line 162
    if-ne p3, v8, :cond_1

    .line 163
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 198
    :cond_0
    :goto_0
    return-object v0

    .line 165
    :cond_1
    if-ne p3, v1, :cond_2

    .line 166
    move-object v7, p4

    .line 170
    .local v7, "thrown":Ljava/lang/Object;
    :goto_1
    new-instance v0, Lorg/mozilla/javascript/JavaScriptException;

    iget-object v1, p0, Lorg/mozilla/javascript/NativeGenerator;->lineSource:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/NativeGenerator;->lineNumber:I

    invoke-direct {v0, v7, v1, v2}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0

    .line 168
    .end local v7    # "thrown":Ljava/lang/Object;
    :cond_2
    invoke-static {p2}, Lorg/mozilla/javascript/NativeIterator;->getStopIterationObject(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .restart local v7    # "thrown":Ljava/lang/Object;
    goto :goto_1

    .line 173
    .end local v7    # "thrown":Ljava/lang/Object;
    :cond_3
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 177
    :try_start_1
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    if-eqz v0, :cond_4

    .line 178
    const-string v0, "msg.already.exec.gen"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 180
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 183
    :catch_0
    move-exception v6

    .line 187
    .local v6, "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :try_start_3
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 194
    monitor-enter p0

    .line 195
    const/4 v1, 0x0

    :try_start_4
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 196
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 197
    if-ne p3, v8, :cond_0

    .line 198
    iput-object v9, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    goto :goto_0

    .line 179
    .end local v6    # "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :cond_4
    const/4 v0, 0x1

    :try_start_5
    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 180
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 181
    :try_start_6
    iget-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->function:Lorg/mozilla/javascript/NativeFunction;

    iget-object v4, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeFunction;->resumeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    move-result-object v0

    .line 194
    monitor-enter p0

    .line 195
    const/4 v1, 0x0

    :try_start_7
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 196
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 197
    if-ne p3, v8, :cond_0

    .line 198
    iput-object v9, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    goto :goto_0

    .line 196
    :catchall_1
    move-exception v0

    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v0

    .restart local v6    # "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :catchall_2
    move-exception v0

    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    throw v0

    .line 188
    .end local v6    # "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :catch_1
    move-exception v6

    .line 189
    .local v6, "e":Lorg/mozilla/javascript/RhinoException;
    :try_start_a
    invoke-virtual {v6}, Lorg/mozilla/javascript/RhinoException;->lineNumber()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/NativeGenerator;->lineNumber:I

    .line 190
    invoke-virtual {v6}, Lorg/mozilla/javascript/RhinoException;->lineSource()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->lineSource:Ljava/lang/String;

    .line 191
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 192
    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 194
    .end local v6    # "e":Lorg/mozilla/javascript/RhinoException;
    :catchall_3
    move-exception v0

    monitor-enter p0

    .line 195
    const/4 v1, 0x0

    :try_start_b
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 196
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 197
    if-ne p3, v8, :cond_5

    .line 198
    iput-object v9, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    :cond_5
    throw v0

    .line 196
    :catchall_4
    move-exception v0

    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    throw v0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 115
    sget-object v3, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 116
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    .line 151
    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    :pswitch_0
    return-object p4

    .line 118
    .restart local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v2

    .line 120
    .local v2, "id":I
    instance-of v3, p4, Lorg/mozilla/javascript/NativeGenerator;

    if-nez v3, :cond_1

    .line 121
    invoke-static {p1}, Lorg/mozilla/javascript/NativeGenerator;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    :cond_1
    move-object v1, p4

    .line 123
    check-cast v1, Lorg/mozilla/javascript/NativeGenerator;

    .line 125
    .local v1, "generator":Lorg/mozilla/javascript/NativeGenerator;
    packed-switch v2, :pswitch_data_0

    .line 154
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :pswitch_1
    const/4 v3, 0x2

    new-instance v4, Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;

    invoke-direct {v4}, Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;-><init>()V

    invoke-direct {v1, p2, p3, v3, v4}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_0

    .line 134
    :pswitch_2
    iput-boolean v5, v1, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    .line 135
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-direct {v1, p2, p3, v5, v3}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_0

    .line 139
    :pswitch_3
    array-length v3, p5

    if-lez v3, :cond_2

    aget-object v0, p5, v5

    .line 140
    .local v0, "arg":Ljava/lang/Object;
    :goto_1
    iget-boolean v3, v1, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    if-eqz v3, :cond_3

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 141
    const-string v3, "msg.send.newborn"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 139
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_2
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    .line 143
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_3
    invoke-direct {v1, p2, p3, v5, v0}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_0

    .line 147
    .end local v0    # "arg":Ljava/lang/Object;
    :pswitch_4
    const/4 v4, 0x1

    array-length v3, p5

    if-lez v3, :cond_4

    aget-object v3, p5, v5

    :goto_2
    invoke-direct {v1, p2, p3, v4, v3}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_0

    :cond_4
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_2

    .line 125
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 208
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 209
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 210
    .local v3, "s_length":I
    const/4 v4, 0x4

    if-ne v3, v4, :cond_3

    .line 211
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 212
    .local v1, "c":I
    const/16 v4, 0x6e

    if-ne v1, v4, :cond_2

    const-string v0, "next"

    const/4 v2, 0x2

    .line 221
    .end local v1    # "c":I
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v2, 0x0

    .line 225
    :cond_1
    return v2

    .line 213
    .restart local v1    # "c":I
    :cond_2
    const/16 v4, 0x73

    if-ne v1, v4, :cond_0

    const-string v0, "send"

    const/4 v2, 0x3

    goto :goto_0

    .line 215
    .end local v1    # "c":I
    :cond_3
    const/4 v4, 0x5

    if-ne v3, v4, :cond_5

    .line 216
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 217
    .restart local v1    # "c":I
    const/16 v4, 0x63

    if-ne v1, v4, :cond_4

    const-string v0, "close"

    const/4 v2, 0x1

    goto :goto_0

    .line 218
    :cond_4
    const/16 v4, 0x74

    if-ne v1, v4, :cond_0

    const-string v0, "throw"

    const/4 v2, 0x4

    goto :goto_0

    .line 220
    .end local v1    # "c":I
    :cond_5
    const/16 v4, 0xc

    if-ne v3, v4, :cond_0

    const-string v0, "__iterator__"

    const/4 v2, 0x5

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    const-string v0, "Generator"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 100
    packed-switch p1, :pswitch_data_0

    .line 106
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 101
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "close"

    .line 108
    .local v1, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeGenerator;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 109
    return-void

    .line 102
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "next"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 103
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "send"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 104
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "throw"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 105
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "__iterator__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 100
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
