.class Lorg/mozilla/javascript/InterfaceAdapter$1;
.super Ljava/lang/Object;
.source "InterfaceAdapter.java"

# interfaces
.implements Lorg/mozilla/javascript/ContextAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/InterfaceAdapter;->invoke(Lorg/mozilla/javascript/ContextFactory;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/InterfaceAdapter;

.field final synthetic val$args:[Ljava/lang/Object;

.field final synthetic val$method:Ljava/lang/reflect/Method;

.field final synthetic val$target:Ljava/lang/Object;

.field final synthetic val$thisObject:Ljava/lang/Object;

.field final synthetic val$topScope:Lorg/mozilla/javascript/Scriptable;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/InterfaceAdapter;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 80
    iput-object p1, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->this$0:Lorg/mozilla/javascript/InterfaceAdapter;

    iput-object p2, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$target:Ljava/lang/Object;

    iput-object p3, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$topScope:Lorg/mozilla/javascript/Scriptable;

    iput-object p4, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$thisObject:Ljava/lang/Object;

    iput-object p5, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$method:Ljava/lang/reflect/Method;

    iput-object p6, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 83
    iget-object v0, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->this$0:Lorg/mozilla/javascript/InterfaceAdapter;

    iget-object v2, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$target:Ljava/lang/Object;

    iget-object v3, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$topScope:Lorg/mozilla/javascript/Scriptable;

    iget-object v4, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$thisObject:Ljava/lang/Object;

    iget-object v5, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$method:Ljava/lang/reflect/Method;

    iget-object v6, p0, Lorg/mozilla/javascript/InterfaceAdapter$1;->val$args:[Ljava/lang/Object;

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lorg/mozilla/javascript/InterfaceAdapter;->invokeImpl(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
