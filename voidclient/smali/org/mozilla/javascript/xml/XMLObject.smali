.class public abstract Lorg/mozilla/javascript/xml/XMLObject;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "XMLObject.java"


# static fields
.field static final serialVersionUID:J = 0x7556c007dcee0974L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 22
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .locals 0
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 27
    return-void
.end method


# virtual methods
.method public addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "thisIsLeft"    # Z
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 98
    sget-object v0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public abstract delete(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
.end method

.method public abstract enterDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;
.end method

.method public abstract enterWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;
.end method

.method public abstract get(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract getExtraMethodSource(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;
.end method

.method public abstract getFunctionProperty(Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
.end method

.method public abstract getFunctionProperty(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public getTypeOf()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    invoke-virtual {p0}, Lorg/mozilla/javascript/xml/XMLObject;->avoidObjectDetection()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "undefined"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "xml"

    goto :goto_0
.end method

.method public abstract has(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
.end method

.method public abstract memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;
.end method

.method public abstract memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;
.end method

.method public abstract put(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)V
.end method
