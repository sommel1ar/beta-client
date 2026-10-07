.class public final Lorg/mozilla/javascript/LazilyLoadedCtor;
.super Ljava/lang/Object;
.source "LazilyLoadedCtor.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final STATE_BEFORE_INIT:I = 0x0

.field private static final STATE_INITIALIZING:I = 0x1

.field private static final STATE_WITH_VALUE:I = 0x2

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final className:Ljava/lang/String;

.field private initializedValue:Ljava/lang/Object;

.field private final privileged:Z

.field private final propertyName:Ljava/lang/String;

.field private final scope:Lorg/mozilla/javascript/ScriptableObject;

.field private final sealed:Z

.field private state:I


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "sealed"    # Z

    .prologue
    .line 36
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 37
    return-void
.end method

.method constructor <init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "sealed"    # Z
    .param p5, "privileged"    # Z

    .prologue
    const/4 v1, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->scope:Lorg/mozilla/javascript/ScriptableObject;

    .line 44
    iput-object p2, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->className:Ljava/lang/String;

    .line 46
    iput-boolean p4, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->sealed:Z

    .line 47
    iput-boolean p5, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->privileged:Z

    .line 48
    iput v1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    .line 50
    const/4 v0, 0x2

    invoke-virtual {p1, p2, v1, p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->addLazilyInitializedValue(Ljava/lang/String;ILorg/mozilla/javascript/LazilyLoadedCtor;I)V

    .line 52
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/LazilyLoadedCtor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/LazilyLoadedCtor;

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/mozilla/javascript/LazilyLoadedCtor;->buildValue0()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private buildValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 84
    iget-boolean v0, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->privileged:Z

    if-eqz v0, :cond_0

    .line 86
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/LazilyLoadedCtor$1;-><init>(Lorg/mozilla/javascript/LazilyLoadedCtor;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    .line 96
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/LazilyLoadedCtor;->buildValue0()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method private buildValue0()Ljava/lang/Object;
    .locals 7

    .prologue
    .line 102
    iget-object v4, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->className:Ljava/lang/String;

    invoke-static {v4}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/LazilyLoadedCtor;->cast(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 103
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/mozilla/javascript/Scriptable;>;"
    if-eqz v0, :cond_2

    .line 105
    :try_start_0
    iget-object v4, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->scope:Lorg/mozilla/javascript/ScriptableObject;

    iget-boolean v5, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->sealed:Z

    const/4 v6, 0x0

    invoke-static {v4, v0, v5, v6}, Lorg/mozilla/javascript/ScriptableObject;->buildClassCtor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v3

    .line 107
    .local v3, "value":Lorg/mozilla/javascript/BaseFunction;
    if-eqz v3, :cond_1

    .line 128
    .end local v3    # "value":Lorg/mozilla/javascript/BaseFunction;
    :cond_0
    :goto_0
    return-object v3

    .line 113
    .restart local v3    # "value":Lorg/mozilla/javascript/BaseFunction;
    :cond_1
    iget-object v4, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->scope:Lorg/mozilla/javascript/ScriptableObject;

    iget-object v5, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    iget-object v6, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->scope:Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v4, v5, v6}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    .line 114
    .local v3, "value":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    if-ne v3, v4, :cond_0

    .line 128
    .end local v3    # "value":Ljava/lang/Object;
    :cond_2
    :goto_1
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_0

    .line 117
    :catch_0
    move-exception v1

    .line 118
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    .line 119
    .local v2, "target":Ljava/lang/Throwable;
    instance-of v4, v2, Ljava/lang/RuntimeException;

    if-eqz v4, :cond_2

    .line 120
    check-cast v2, Ljava/lang/RuntimeException;

    .end local v2    # "target":Ljava/lang/Throwable;
    throw v2

    .line 125
    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v4

    goto :goto_1

    .line 124
    :catch_2
    move-exception v4

    goto :goto_1

    .line 123
    :catch_3
    move-exception v4

    goto :goto_1

    .line 122
    :catch_4
    move-exception v4

    goto :goto_1
.end method

.method private cast(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<+",
            "Lorg/mozilla/javascript/Scriptable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    return-object p1
.end method


# virtual methods
.method getValue()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 77
    iget v0, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 78
    new-instance v0, Ljava/lang/IllegalStateException;

    iget-object v1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->initializedValue:Ljava/lang/Object;

    return-object v0
.end method

.method init()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 56
    monitor-enter p0

    .line 57
    :try_start_0
    iget v1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    if-ne v1, v2, :cond_0

    .line 58
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Recursive initialization for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 72
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 60
    :cond_0
    :try_start_1
    iget v1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    if-nez v1, :cond_1

    .line 61
    const/4 v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    .line 64
    sget-object v0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .local v0, "value":Ljava/lang/Object;
    :try_start_2
    invoke-direct {p0}, Lorg/mozilla/javascript/LazilyLoadedCtor;->buildValue()Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v0

    .line 68
    :try_start_3
    iput-object v0, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->initializedValue:Ljava/lang/Object;

    .line 69
    const/4 v1, 0x2

    iput v1, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    .line 72
    .end local v0    # "value":Ljava/lang/Object;
    :cond_1
    monitor-exit p0

    .line 73
    return-void

    .line 68
    .restart local v0    # "value":Ljava/lang/Object;
    :catchall_1
    move-exception v1

    iput-object v0, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->initializedValue:Ljava/lang/Object;

    .line 69
    const/4 v2, 0x2

    iput v2, p0, Lorg/mozilla/javascript/LazilyLoadedCtor;->state:I

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method
