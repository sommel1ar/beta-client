.class final Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter$3;
.super Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;
.source "XmlNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->PROCESSING_INSTRUCTION(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$name:Lorg/mozilla/javascript/xmlimpl/XMLName;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/xmlimpl/XMLName;)V
    .locals 0

    .prologue
    .line 853
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter$3;->val$name:Lorg/mozilla/javascript/xmlimpl/XMLName;

    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;-><init>()V

    return-void
.end method


# virtual methods
.method accept(Lorg/w3c/dom/Node;)Z
    .locals 3
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 856
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    const/4 v2, 0x7

    if-ne v1, v2, :cond_0

    move-object v0, p1

    .line 857
    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    .line 858
    .local v0, "pi":Lorg/w3c/dom/ProcessingInstruction;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter$3;->val$name:Lorg/mozilla/javascript/xmlimpl/XMLName;

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matchesLocalName(Ljava/lang/String;)Z

    move-result v1

    .line 860
    .end local v0    # "pi":Lorg/w3c/dom/ProcessingInstruction;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
