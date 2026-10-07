.class Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;
.super Ljava/lang/Object;
.source "NativeGenerator.java"

# interfaces
.implements Lorg/mozilla/javascript/ContextAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/NativeGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CloseGeneratorAction"
.end annotation


# instance fields
.field private generator:Lorg/mozilla/javascript/NativeGenerator;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/NativeGenerator;)V
    .locals 0
    .param p1, "generator"    # Lorg/mozilla/javascript/NativeGenerator;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;->generator:Lorg/mozilla/javascript/NativeGenerator;

    .line 80
    return-void
.end method


# virtual methods
.method public run(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 83
    iget-object v2, p0, Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;->generator:Lorg/mozilla/javascript/NativeGenerator;

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 84
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    new-instance v0, Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction$1;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction$1;-><init>(Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;)V

    .line 91
    .local v0, "closeGenerator":Lorg/mozilla/javascript/Callable;
    iget-object v2, p0, Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;->generator:Lorg/mozilla/javascript/NativeGenerator;

    const/4 v3, 0x0

    invoke-static {v0, p1, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->doTopCall(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method
