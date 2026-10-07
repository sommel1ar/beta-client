.class public Lorg/mozilla/javascript/NativeJavaTopPackage;
.super Lorg/mozilla/javascript/NativeJavaPackage;
.source "NativeJavaTopPackage.java"

# interfaces
.implements Lorg/mozilla/javascript/Function;
.implements Lorg/mozilla/javascript/IdFunctionCall;


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final Id_getClass:I = 0x1

.field private static final commonPackages:[[Ljava/lang/String;

.field static final serialVersionUID:J = -0x1433fecca5b554afL


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 29
    const/16 v0, 0x8

    new-array v0, v0, [[Ljava/lang/String;

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "java"

    aput-object v2, v1, v4

    const-string v2, "lang"

    aput-object v2, v1, v5

    const-string v2, "reflect"

    aput-object v2, v1, v6

    aput-object v1, v0, v4

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "java"

    aput-object v2, v1, v4

    const-string v2, "io"

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "java"

    aput-object v2, v1, v4

    const-string v2, "math"

    aput-object v2, v1, v5

    aput-object v1, v0, v6

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "java"

    aput-object v2, v1, v4

    const-string v2, "net"

    aput-object v2, v1, v5

    aput-object v1, v0, v7

    const/4 v1, 0x4

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "java"

    aput-object v3, v2, v4

    const-string v3, "util"

    aput-object v3, v2, v5

    const-string v3, "zip"

    aput-object v3, v2, v6

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "java"

    aput-object v3, v2, v4

    const-string v3, "text"

    aput-object v3, v2, v5

    const-string v3, "resources"

    aput-object v3, v2, v6

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "java"

    aput-object v3, v2, v4

    const-string v3, "applet"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "javax"

    aput-object v3, v2, v4

    const-string v3, "swing"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    sput-object v0, Lorg/mozilla/javascript/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    .line 151
    const-string v0, "JavaTopPackage"

    sput-object v0, Lorg/mozilla/javascript/NativeJavaTopPackage;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 42
    const/4 v0, 0x1

    const-string v1, ""

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/javascript/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 43
    return-void
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 14
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    .line 75
    .local v10, "loader":Ljava/lang/ClassLoader;
    new-instance v1, Lorg/mozilla/javascript/NativeJavaTopPackage;

    invoke-direct {v1, v10}, Lorg/mozilla/javascript/NativeJavaTopPackage;-><init>(Ljava/lang/ClassLoader;)V

    .line 76
    .local v1, "top":Lorg/mozilla/javascript/NativeJavaTopPackage;
    invoke-static {p1}, Lorg/mozilla/javascript/NativeJavaTopPackage;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/NativeJavaTopPackage;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 77
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/NativeJavaTopPackage;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 79
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    array-length v2, v2

    if-eq v8, v2, :cond_1

    .line 80
    move-object v11, v1

    .line 81
    .local v11, "parent":Lorg/mozilla/javascript/NativeJavaPackage;
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    sget-object v2, Lorg/mozilla/javascript/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    aget-object v2, v2, v8

    array-length v2, v2

    if-eq v9, v2, :cond_0

    .line 82
    sget-object v2, Lorg/mozilla/javascript/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    aget-object v2, v2, v8

    aget-object v2, v2, v9

    invoke-virtual {v11, v2, p1}, Lorg/mozilla/javascript/NativeJavaPackage;->forcePackage(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeJavaPackage;

    move-result-object v11

    .line 81
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 79
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 87
    .end local v9    # "j":I
    .end local v11    # "parent":Lorg/mozilla/javascript/NativeJavaPackage;
    :cond_1
    new-instance v0, Lorg/mozilla/javascript/IdFunctionObject;

    sget-object v2, Lorg/mozilla/javascript/NativeJavaTopPackage;->FTAG:Ljava/lang/Object;

    const/4 v3, 0x1

    const-string v4, "getClass"

    const/4 v5, 0x1

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)V

    .line 93
    .local v0, "getClass":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-static {}, Lorg/mozilla/javascript/ScriptRuntime;->getTopPackageNames()[Ljava/lang/String;

    move-result-object v12

    .line 94
    .local v12, "topNames":[Ljava/lang/String;
    array-length v2, v12

    new-array v13, v2, [Lorg/mozilla/javascript/NativeJavaPackage;

    .line 95
    .local v13, "topPackages":[Lorg/mozilla/javascript/NativeJavaPackage;
    const/4 v8, 0x0

    :goto_2
    array-length v2, v12

    if-ge v8, v2, :cond_2

    .line 96
    aget-object v2, v12, v8

    invoke-virtual {v1, v2, v1}, Lorg/mozilla/javascript/NativeJavaTopPackage;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/NativeJavaPackage;

    aput-object v2, v13, v8

    .line 95
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_2
    move-object v7, p1

    .line 101
    check-cast v7, Lorg/mozilla/javascript/ScriptableObject;

    .line 103
    .local v7, "global":Lorg/mozilla/javascript/ScriptableObject;
    if-eqz p2, :cond_3

    .line 104
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 106
    :cond_3
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->exportAsScopeProperty()V

    .line 107
    const-string v2, "Packages"

    const/4 v3, 0x2

    invoke-virtual {v7, v2, v1, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 108
    const/4 v8, 0x0

    :goto_3
    array-length v2, v12

    if-ge v8, v2, :cond_4

    .line 109
    aget-object v2, v12, v8

    aget-object v3, v13, v8

    const/4 v4, 0x2

    invoke-virtual {v7, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 108
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 112
    :cond_4
    return-void
.end method

.method private js_getClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 10
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 127
    array-length v7, p3

    if-lez v7, :cond_0

    aget-object v7, p3, v9

    instance-of v7, v7, Lorg/mozilla/javascript/Wrapper;

    if-eqz v7, :cond_0

    .line 128
    move-object v6, p0

    .line 129
    .local v6, "result":Lorg/mozilla/javascript/Scriptable;
    aget-object v7, p3, v9

    check-cast v7, Lorg/mozilla/javascript/Wrapper;

    invoke-interface {v7}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 132
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 135
    .local v3, "offset":I
    :goto_0
    const/16 v7, 0x2e

    invoke-virtual {v2, v7, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 136
    .local v1, "index":I
    if-ne v1, v8, :cond_1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 139
    .local v5, "propName":Ljava/lang/String;
    :goto_1
    invoke-interface {v6, v5, v6}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 140
    .local v4, "prop":Ljava/lang/Object;
    instance-of v7, v4, Lorg/mozilla/javascript/Scriptable;

    if-nez v7, :cond_2

    .line 148
    .end local v0    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "index":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "offset":I
    .end local v4    # "prop":Ljava/lang/Object;
    .end local v5    # "propName":Ljava/lang/String;
    .end local v6    # "result":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    const-string v7, "msg.not.java.obj"

    invoke-static {v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v7

    throw v7

    .line 136
    .restart local v0    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "index":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "offset":I
    .restart local v6    # "result":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .restart local v4    # "prop":Ljava/lang/Object;
    .restart local v5    # "propName":Ljava/lang/String;
    :cond_2
    move-object v6, v4

    .line 142
    check-cast v6, Lorg/mozilla/javascript/Scriptable;

    .line 143
    if-ne v1, v8, :cond_3

    .line 144
    return-object v6

    .line 145
    :cond_3
    add-int/lit8 v3, v1, 0x1

    .line 146
    goto :goto_0
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 48
    invoke-virtual {p0, p1, p2, p4}, Lorg/mozilla/javascript/NativeJavaTopPackage;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 53
    const/4 v1, 0x0

    .line 54
    .local v1, "loader":Ljava/lang/ClassLoader;
    array-length v3, p3

    if-eqz v3, :cond_1

    .line 55
    const/4 v3, 0x0

    aget-object v0, p3, v3

    .line 56
    .local v0, "arg":Ljava/lang/Object;
    instance-of v3, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v3, :cond_0

    .line 57
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 59
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_0
    instance-of v3, v0, Ljava/lang/ClassLoader;

    if-eqz v3, :cond_1

    move-object v1, v0

    .line 60
    check-cast v1, Ljava/lang/ClassLoader;

    .line 63
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_1
    if-nez v1, :cond_2

    .line 64
    const-string v3, "msg.not.classloader"

    invoke-static {v3}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    .line 65
    const/4 v2, 0x0

    .line 69
    :goto_0
    return-object v2

    .line 67
    :cond_2
    new-instance v2, Lorg/mozilla/javascript/NativeJavaPackage;

    const/4 v3, 0x1

    const-string v4, ""

    invoke-direct {v2, v3, v4, v1}, Lorg/mozilla/javascript/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 68
    .local v2, "pkg":Lorg/mozilla/javascript/NativeJavaPackage;
    invoke-static {v2, p2}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_0
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 117
    sget-object v0, Lorg/mozilla/javascript/NativeJavaTopPackage;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 119
    invoke-direct {p0, p2, p3, p5}, Lorg/mozilla/javascript/NativeJavaTopPackage;->js_getClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0

    .line 122
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
