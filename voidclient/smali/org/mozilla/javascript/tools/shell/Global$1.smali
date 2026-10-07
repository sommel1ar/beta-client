.class Lorg/mozilla/javascript/tools/shell/Global$1;
.super Ljava/lang/Object;
.source "Global.java"

# interfaces
.implements Lorg/mozilla/javascript/ContextAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/tools/shell/Global;->init(Lorg/mozilla/javascript/ContextFactory;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/shell/Global;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/shell/Global;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/Global$1;->this$0:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 80
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Global$1;->this$0:Lorg/mozilla/javascript/tools/shell/Global;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/shell/Global;->init(Lorg/mozilla/javascript/Context;)V

    .line 81
    const/4 v0, 0x0

    return-object v0
.end method
