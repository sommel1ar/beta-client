.class final Lorg/mozilla/javascript/optimizer/OptRuntime$1;
.super Ljava/lang/Object;
.source "OptRuntime.java"

# interfaces
.implements Lorg/mozilla/javascript/ContextAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/optimizer/OptRuntime;->main(Lorg/mozilla/javascript/Script;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$args:[Ljava/lang/String;

.field final synthetic val$script:Lorg/mozilla/javascript/Script;


# direct methods
.method constructor <init>([Ljava/lang/String;Lorg/mozilla/javascript/Script;)V
    .locals 0

    .prologue
    .line 217
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/OptRuntime$1;->val$args:[Ljava/lang/String;

    iput-object p2, p0, Lorg/mozilla/javascript/optimizer/OptRuntime$1;->val$script:Lorg/mozilla/javascript/Script;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v5, 0x0

    .line 220
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getGlobal(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    .line 224
    .local v2, "global":Lorg/mozilla/javascript/ScriptableObject;
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/OptRuntime$1;->val$args:[Ljava/lang/String;

    array-length v3, v3

    new-array v0, v3, [Ljava/lang/Object;

    .line 225
    .local v0, "argsCopy":[Ljava/lang/Object;
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/OptRuntime$1;->val$args:[Ljava/lang/String;

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/OptRuntime$1;->val$args:[Ljava/lang/String;

    array-length v4, v4

    invoke-static {v3, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 226
    invoke-virtual {p1, v2, v0}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 227
    .local v1, "argsObj":Lorg/mozilla/javascript/Scriptable;
    const-string v3, "arguments"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v1, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 229
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/OptRuntime$1;->val$script:Lorg/mozilla/javascript/Script;

    invoke-interface {v3, p1, v2}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    .line 230
    const/4 v3, 0x0

    return-object v3
.end method
