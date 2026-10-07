.class public abstract Lorg/mozilla/javascript/xml/XMLLib;
.super Ljava/lang/Object;
.source "XMLLib.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/xml/XMLLib$Factory;
    }
.end annotation


# static fields
.field private static final XML_LIB_KEY:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/xml/XMLLib;->XML_LIB_KEY:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static extractFromScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;
    .locals 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 54
    invoke-static {p0}, Lorg/mozilla/javascript/xml/XMLLib;->extractFromScopeOrNull(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .line 55
    .local v0, "lib":Lorg/mozilla/javascript/xml/XMLLib;
    if-eqz v0, :cond_0

    .line 56
    return-object v0

    .line 58
    :cond_0
    const-string v2, "msg.XML.not.available"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "msg":Ljava/lang/String;
    invoke-static {v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method public static extractFromScopeOrNull(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 39
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getLibraryScopeOrNull(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v0

    .line 40
    .local v0, "so":Lorg/mozilla/javascript/ScriptableObject;
    if-nez v0, :cond_0

    .line 42
    const/4 v1, 0x0

    .line 49
    :goto_0
    return-object v1

    .line 47
    :cond_0
    const-string v1, "XML"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    sget-object v1, Lorg/mozilla/javascript/xml/XMLLib;->XML_LIB_KEY:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/xml/XMLLib;

    goto :goto_0
.end method


# virtual methods
.method protected final bindToScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 64
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getLibraryScopeOrNull(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v0

    .line 65
    .local v0, "so":Lorg/mozilla/javascript/ScriptableObject;
    if-nez v0, :cond_0

    .line 67
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 69
    :cond_0
    sget-object v1, Lorg/mozilla/javascript/xml/XMLLib;->XML_LIB_KEY:Ljava/lang/Object;

    invoke-virtual {v0, v1, p0}, Lorg/mozilla/javascript/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/xml/XMLLib;

    return-object v1
.end method

.method public abstract escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public getPrettyIndent()I
    .locals 1

    .prologue
    .line 139
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreComments()Z
    .locals 1

    .prologue
    .line 123
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreProcessingInstructions()Z
    .locals 1

    .prologue
    .line 127
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreWhitespace()Z
    .locals 1

    .prologue
    .line 131
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isPrettyPrinting()Z
    .locals 1

    .prologue
    .line 135
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract isXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
.end method

.method public abstract nameRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;
.end method

.method public abstract nameRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;
.end method

.method public setIgnoreComments(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 103
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setIgnoreProcessingInstructions(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 111
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setIgnoreWhitespace(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setPrettyIndent(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 119
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setPrettyPrinting(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract toDefaultXmlNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
.end method
