.class public Lorg/mozilla/javascript/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
.super Ljava/lang/Object;
.source "CachingModuleScriptProviderBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/commonjs/module/provider/CachingModuleScriptProviderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedModuleScript"
.end annotation


# instance fields
.field private final moduleScript:Lorg/mozilla/javascript/commonjs/module/ModuleScript;

.field private final validator:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/commonjs/module/ModuleScript;Ljava/lang/Object;)V
    .locals 0
    .param p1, "moduleScript"    # Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    .param p2, "validator"    # Ljava/lang/Object;

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iput-object p1, p0, Lorg/mozilla/javascript/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->moduleScript:Lorg/mozilla/javascript/commonjs/module/ModuleScript;

    .line 138
    iput-object p2, p0, Lorg/mozilla/javascript/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->validator:Ljava/lang/Object;

    .line 139
    return-void
.end method


# virtual methods
.method getModule()Lorg/mozilla/javascript/commonjs/module/ModuleScript;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->moduleScript:Lorg/mozilla/javascript/commonjs/module/ModuleScript;

    return-object v0
.end method

.method getValidator()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->validator:Ljava/lang/Object;

    return-object v0
.end method
