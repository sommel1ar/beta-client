.class Lorg/mozilla/javascript/xmlimpl/XmlNode$XmlNodeUserDataHandler;
.super Ljava/lang/Object;
.source "XmlNode.java"

# interfaces
.implements Lorg/w3c/dom/UserDataHandler;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/xmlimpl/XmlNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "XmlNodeUserDataHandler"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x40c424bf87f15334L


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(SLjava/lang/String;Ljava/lang/Object;Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V
    .locals 0
    .param p1, "operation"    # S
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "data"    # Ljava/lang/Object;
    .param p4, "src"    # Lorg/w3c/dom/Node;
    .param p5, "dest"    # Lorg/w3c/dom/Node;

    .prologue
    .line 312
    return-void
.end method
