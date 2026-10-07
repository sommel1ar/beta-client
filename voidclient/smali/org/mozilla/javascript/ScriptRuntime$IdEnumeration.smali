.class Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;
.super Ljava/lang/Object;
.source "ScriptRuntime.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/ScriptRuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IdEnumeration"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field currentId:Ljava/lang/Object;

.field enumNumbers:Z

.field enumType:I

.field ids:[Ljava/lang/Object;

.field index:I

.field iterator:Lorg/mozilla/javascript/Scriptable;

.field obj:Lorg/mozilla/javascript/Scriptable;

.field used:Lorg/mozilla/javascript/ObjToIntMap;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 2087
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/mozilla/javascript/ScriptRuntime$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/mozilla/javascript/ScriptRuntime$1;

    .prologue
    .line 2087
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;-><init>()V

    return-void
.end method
