.class public Lorg/mozilla/javascript/commonjs/module/provider/MultiModuleScriptProvider;
.super Ljava/lang/Object;
.source "MultiModuleScriptProvider.java"

# interfaces
.implements Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;


# instance fields
.field private final providers:[Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "providers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    .line 33
    .local v2, "provider":Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 35
    .end local v2    # "provider":Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    iput-object v3, p0, Lorg/mozilla/javascript/commonjs/module/provider/MultiModuleScriptProvider;->providers:[Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    .line 36
    return-void
.end method


# virtual methods
.method public getModuleScript(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    .locals 10
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "moduleId"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/net/URI;
    .param p4, "base"    # Ljava/net/URI;
    .param p5, "paths"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v6, p0, Lorg/mozilla/javascript/commonjs/module/provider/MultiModuleScriptProvider;->providers:[Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;

    .local v6, "arr$":[Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    array-length v8, v6

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_0
    if-ge v7, v8, :cond_1

    aget-object v0, v6, v7

    .local v0, "provider":Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 41
    invoke-interface/range {v0 .. v5}, Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;->getModuleScript(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/commonjs/module/ModuleScript;

    move-result-object v9

    .line 43
    .local v9, "script":Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    if-eqz v9, :cond_0

    .line 47
    .end local v0    # "provider":Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    .end local v9    # "script":Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    :goto_1
    return-object v9

    .line 40
    .restart local v0    # "provider":Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    .restart local v9    # "script":Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 47
    .end local v0    # "provider":Lorg/mozilla/javascript/commonjs/module/ModuleScriptProvider;
    .end local v9    # "script":Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    :cond_1
    const/4 v9, 0x0

    goto :goto_1
.end method
