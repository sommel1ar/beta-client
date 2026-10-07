.class Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction$1;
.super Ljava/lang/Object;
.source "NativeGenerator.java"

# interfaces
.implements Lorg/mozilla/javascript/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;->run(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;)V
    .locals 0

    .prologue
    .line 84
    iput-object p1, p0, Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction$1;->this$0:Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 87
    check-cast p3, Lorg/mozilla/javascript/NativeGenerator;

    .end local p3    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    const/4 v0, 0x2

    new-instance v1, Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;

    invoke-direct {v1}, Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;-><init>()V

    invoke-static {p3, p1, p2, v0, v1}, Lorg/mozilla/javascript/NativeGenerator;->access$000(Lorg/mozilla/javascript/NativeGenerator;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
