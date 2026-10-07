.class public Lorg/mozilla/javascript/TopLevel;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "TopLevel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/TopLevel$NativeErrors;,
        Lorg/mozilla/javascript/TopLevel$Builtins;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final serialVersionUID:J = -0x40812d88f46a4e44L


# instance fields
.field private ctors:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap",
            "<",
            "Lorg/mozilla/javascript/TopLevel$Builtins;",
            "Lorg/mozilla/javascript/BaseFunction;",
            ">;"
        }
    .end annotation
.end field

.field private errors:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap",
            "<",
            "Lorg/mozilla/javascript/TopLevel$NativeErrors;",
            "Lorg/mozilla/javascript/BaseFunction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lorg/mozilla/javascript/TopLevel;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/mozilla/javascript/TopLevel;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 67
    return-void
.end method

.method public static getBuiltinCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Function;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "type"    # Lorg/mozilla/javascript/TopLevel$Builtins;

    .prologue
    .line 136
    sget-boolean v1, Lorg/mozilla/javascript/TopLevel;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 137
    :cond_0
    instance-of v1, p1, Lorg/mozilla/javascript/TopLevel;

    if-eqz v1, :cond_1

    move-object v1, p1

    .line 138
    check-cast v1, Lorg/mozilla/javascript/TopLevel;

    invoke-virtual {v1, p2}, Lorg/mozilla/javascript/TopLevel;->getBuiltinCtor(Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v0

    .line 139
    .local v0, "result":Lorg/mozilla/javascript/Function;
    if-eqz v0, :cond_1

    .line 144
    .end local v0    # "result":Lorg/mozilla/javascript/Function;
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p2}, Lorg/mozilla/javascript/TopLevel$Builtins;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/mozilla/javascript/ScriptRuntime;->getExistingCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Function;

    move-result-object v0

    goto :goto_0
.end method

.method public static getBuiltinPrototype(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "type"    # Lorg/mozilla/javascript/TopLevel$Builtins;

    .prologue
    .line 185
    sget-boolean v1, Lorg/mozilla/javascript/TopLevel;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 186
    :cond_0
    instance-of v1, p0, Lorg/mozilla/javascript/TopLevel;

    if-eqz v1, :cond_1

    move-object v1, p0

    .line 187
    check-cast v1, Lorg/mozilla/javascript/TopLevel;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/TopLevel;->getBuiltinPrototype(Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 189
    .local v0, "result":Lorg/mozilla/javascript/Scriptable;
    if-eqz v0, :cond_1

    .line 194
    .end local v0    # "result":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/TopLevel$Builtins;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getClassPrototype(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_0
.end method

.method static getNativeErrorCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$NativeErrors;)Lorg/mozilla/javascript/Function;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "type"    # Lorg/mozilla/javascript/TopLevel$NativeErrors;

    .prologue
    .line 161
    sget-boolean v1, Lorg/mozilla/javascript/TopLevel;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 162
    :cond_0
    instance-of v1, p1, Lorg/mozilla/javascript/TopLevel;

    if-eqz v1, :cond_1

    move-object v1, p1

    .line 163
    check-cast v1, Lorg/mozilla/javascript/TopLevel;

    invoke-virtual {v1, p2}, Lorg/mozilla/javascript/TopLevel;->getNativeErrorCtor(Lorg/mozilla/javascript/TopLevel$NativeErrors;)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v0

    .line 164
    .local v0, "result":Lorg/mozilla/javascript/Function;
    if-eqz v0, :cond_1

    .line 169
    .end local v0    # "result":Lorg/mozilla/javascript/Function;
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p2}, Lorg/mozilla/javascript/TopLevel$NativeErrors;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/mozilla/javascript/ScriptRuntime;->getExistingCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Function;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public cacheBuiltins()V
    .locals 8

    .prologue
    .line 105
    new-instance v6, Ljava/util/EnumMap;

    const-class v7, Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-direct {v6, v7}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v6, p0, Lorg/mozilla/javascript/TopLevel;->ctors:Ljava/util/EnumMap;

    .line 106
    invoke-static {}, Lorg/mozilla/javascript/TopLevel$Builtins;->values()[Lorg/mozilla/javascript/TopLevel$Builtins;

    move-result-object v0

    .local v0, "arr$":[Lorg/mozilla/javascript/TopLevel$Builtins;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 107
    .local v1, "builtin":Lorg/mozilla/javascript/TopLevel$Builtins;
    invoke-virtual {v1}, Lorg/mozilla/javascript/TopLevel$Builtins;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 108
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Lorg/mozilla/javascript/BaseFunction;

    if-eqz v6, :cond_0

    .line 109
    iget-object v6, p0, Lorg/mozilla/javascript/TopLevel;->ctors:Ljava/util/EnumMap;

    check-cast v5, Lorg/mozilla/javascript/BaseFunction;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v6, v1, v5}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 112
    .end local v1    # "builtin":Lorg/mozilla/javascript/TopLevel$Builtins;
    :cond_1
    new-instance v6, Ljava/util/EnumMap;

    const-class v7, Lorg/mozilla/javascript/TopLevel$NativeErrors;

    invoke-direct {v6, v7}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v6, p0, Lorg/mozilla/javascript/TopLevel;->errors:Ljava/util/EnumMap;

    .line 113
    invoke-static {}, Lorg/mozilla/javascript/TopLevel$NativeErrors;->values()[Lorg/mozilla/javascript/TopLevel$NativeErrors;

    move-result-object v0

    .local v0, "arr$":[Lorg/mozilla/javascript/TopLevel$NativeErrors;
    array-length v4, v0

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v4, :cond_3

    aget-object v2, v0, v3

    .line 114
    .local v2, "error":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    invoke-virtual {v2}, Lorg/mozilla/javascript/TopLevel$NativeErrors;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 115
    .restart local v5    # "value":Ljava/lang/Object;
    instance-of v6, v5, Lorg/mozilla/javascript/BaseFunction;

    if-eqz v6, :cond_2

    .line 116
    iget-object v6, p0, Lorg/mozilla/javascript/TopLevel;->errors:Ljava/util/EnumMap;

    check-cast v5, Lorg/mozilla/javascript/BaseFunction;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v6, v2, v5}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 119
    .end local v2    # "error":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    :cond_3
    return-void
.end method

.method public getBuiltinCtor(Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/BaseFunction;
    .locals 1
    .param p1, "type"    # Lorg/mozilla/javascript/TopLevel$Builtins;

    .prologue
    .line 205
    iget-object v0, p0, Lorg/mozilla/javascript/TopLevel;->ctors:Ljava/util/EnumMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/TopLevel;->ctors:Ljava/util/EnumMap;

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/BaseFunction;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBuiltinPrototype(Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;
    .locals 4
    .param p1, "type"    # Lorg/mozilla/javascript/TopLevel$Builtins;

    .prologue
    const/4 v2, 0x0

    .line 227
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/TopLevel;->getBuiltinCtor(Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v0

    .line 228
    .local v0, "func":Lorg/mozilla/javascript/BaseFunction;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/mozilla/javascript/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v1

    .line 229
    .local v1, "proto":Ljava/lang/Object;
    :goto_0
    instance-of v3, v1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v3, :cond_1

    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .end local v1    # "proto":Ljava/lang/Object;
    :goto_1
    return-object v1

    :cond_0
    move-object v1, v2

    .line 228
    goto :goto_0

    .restart local v1    # "proto":Ljava/lang/Object;
    :cond_1
    move-object v1, v2

    .line 229
    goto :goto_1
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    const-string v0, "global"

    return-object v0
.end method

.method getNativeErrorCtor(Lorg/mozilla/javascript/TopLevel$NativeErrors;)Lorg/mozilla/javascript/BaseFunction;
    .locals 1
    .param p1, "type"    # Lorg/mozilla/javascript/TopLevel$NativeErrors;

    .prologue
    .line 216
    iget-object v0, p0, Lorg/mozilla/javascript/TopLevel;->errors:Ljava/util/EnumMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/TopLevel;->errors:Ljava/util/EnumMap;

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/BaseFunction;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
