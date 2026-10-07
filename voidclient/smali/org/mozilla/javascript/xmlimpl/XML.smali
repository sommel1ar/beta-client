.class Lorg/mozilla/javascript/xmlimpl/XML;
.super Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
.source "XML.java"


# static fields
.field static final serialVersionUID:J = -0x8c1a7cc631ad1c4L


# instance fields
.field private node:Lorg/mozilla/javascript/xmlimpl/XmlNode;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;Lorg/mozilla/javascript/xmlimpl/XmlNode;)V
    .locals 0
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;
    .param p4, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    .line 19
    invoke-virtual {p0, p4}, Lorg/mozilla/javascript/xmlimpl/XML;->initialize(Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 20
    return-void
.end method

.method private adapt(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .locals 2
    .param p1, "ns"    # Lorg/mozilla/javascript/xmlimpl/Namespace;

    .prologue
    .line 576
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 577
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 579
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    goto :goto_0
.end method

.method private addInScopeNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)V
    .locals 3
    .param p1, "ns"    # Lorg/mozilla/javascript/xmlimpl/Namespace;

    .prologue
    .line 552
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_1

    .line 568
    :cond_0
    :goto_0
    return-void

    .line 557
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 558
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 561
    :cond_2
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 562
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->invalidateNamespacePrefix()V

    .line 564
    :cond_3
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->declareNamespace(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private ecmaToString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 676
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isAttribute()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isText()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 677
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->ecmaValue()Ljava/lang/String;

    move-result-object v4

    .line 695
    :goto_0
    return-object v4

    .line 679
    :cond_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->hasSimpleContent()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 680
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 681
    .local v2, "rv":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 682
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v4, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChild(I)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 683
    .local v0, "child":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isCommentType()Z

    move-result v4

    if-nez v4, :cond_2

    .line 688
    new-instance v3, Lorg/mozilla/javascript/xmlimpl/XML;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getLib()Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-result-object v5

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/xml/XMLObject;

    invoke-direct {v3, v5, v6, v4, v0}, Lorg/mozilla/javascript/xmlimpl/XML;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 690
    .local v3, "x":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 681
    .end local v3    # "x":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 693
    .end local v0    # "child":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 695
    .end local v1    # "i":I
    .end local v2    # "rv":Ljava/lang/StringBuilder;
    :cond_4
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->toXMLString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method private ecmaValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 671
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->ecmaValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getChildIndexOf(Lorg/mozilla/javascript/xmlimpl/XML;)I
    .locals 3
    .param p1, "child"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 495
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 496
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChild(I)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    iget-object v2, p1, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isSameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 500
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 495
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 500
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private getNodesForInsert(Ljava/lang/Object;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .locals 6
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 452
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v3, :cond_1

    .line 453
    new-array v2, v4, [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    check-cast p1, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local p1    # "value":Ljava/lang/Object;
    iget-object v3, p1, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    aput-object v3, v2, v5

    .line 462
    :cond_0
    :goto_0
    return-object v2

    .line 454
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v3, :cond_2

    move-object v1, p1

    .line 455
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 456
    .local v1, "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    new-array v2, v3, [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .line 457
    .local v2, "rv":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 458
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    iget-object v3, v3, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    aput-object v3, v2, v0

    .line 457
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 462
    .end local v0    # "i":I
    .end local v1    # "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    .end local v2    # "rv":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    :cond_2
    new-array v2, v4, [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v3

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v3

    aput-object v3, v2, v5

    goto :goto_0
.end method

.method private toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 218
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    if-nez v0, :cond_0

    .line 219
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setXml(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 221
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V
    .locals 0
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 239
    invoke-virtual {p2, p1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 240
    return-void
.end method

.method addNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 0
    .param p1, "ns"    # Lorg/mozilla/javascript/xmlimpl/Namespace;

    .prologue
    .line 590
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->addInScopeNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)V

    .line 591
    return-object p0
.end method

.method appendChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 3
    .param p1, "xml"    # Ljava/lang/Object;

    .prologue
    .line 487
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isParentType()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 488
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 489
    .local v0, "nodes":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildCount()I

    move-result v2

    invoke-virtual {v1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->insertChildrenAt(I[Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 491
    .end local v0    # "nodes":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    :cond_0
    return-object p0
.end method

.method child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 295
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 296
    .local v0, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 297
    if-ltz p1, :cond_0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildCount()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 298
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getXmlChild(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 300
    :cond_0
    return-object v0
.end method

.method child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 5
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 260
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    .line 265
    .local v2, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    sget-object v4, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->ELEMENT:Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 266
    .local v0, "elements":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 267
    aget-object v3, v0, v1

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matchesElement(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 268
    aget-object v3, v0, v1

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 266
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 271
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 272
    return-object v2
.end method

.method childIndex()I
    .locals 1

    .prologue
    .line 319
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildIndex()I

    move-result v0

    return v0
.end method

.method children()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 6

    .prologue
    .line 282
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    .line 283
    .local v3, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-static {}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    .line 284
    .local v0, "all":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v4

    invoke-virtual {v3, p0, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 285
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    sget-object v5, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->TRUE:Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    .line 286
    .local v1, "children":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 287
    aget-object v4, v1, v2

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/xmlimpl/XML;->toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 286
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 289
    :cond_0
    return-object v3
.end method

.method comments()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 3

    .prologue
    .line 422
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 423
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    sget-object v2, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->COMMENT:Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    invoke-virtual {v1, v0, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->addMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)V

    .line 424
    return-object v0
.end method

.method contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "xml"    # Ljava/lang/Object;

    .prologue
    .line 324
    instance-of v0, p1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v0, :cond_0

    .line 325
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    .line 327
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->copy()Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method public delete(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 96
    if-nez p1, :cond_0

    .line 97
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->remove()V

    .line 99
    :cond_0
    return-void
.end method

.method deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V
    .locals 3
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 152
    .local v1, "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 153
    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    iget-object v2, v2, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->deleteMe()V

    .line 152
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 155
    :cond_0
    return-void
.end method

.method final ecmaClass()Ljava/lang/String;
    .locals 3

    .prologue
    .line 647
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isTextType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 648
    const-string v0, "text"

    .line 656
    :goto_0
    return-object v0

    .line 649
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 650
    const-string v0, "attribute"

    goto :goto_0

    .line 651
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isCommentType()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 652
    const-string v0, "comment"

    goto :goto_0

    .line 653
    :cond_2
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 654
    const-string v0, "processing-instruction"

    goto :goto_0

    .line 655
    :cond_3
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 656
    const-string v0, "element"

    goto :goto_0

    .line 658
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 5
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    .line 245
    .local v2, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 247
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    sget-object v4, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->ELEMENT:Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 248
    .local v0, "elements":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    .line 249
    aget-object v3, v0, v1

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matches(Lorg/mozilla/javascript/xmlimpl/XML;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 250
    aget-object v3, v0, v1

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 248
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 253
    :cond_1
    return-object v2
.end method

.method equivalentXml(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 334
    const/4 v2, 0x0

    .line 336
    .local v2, "result":Z
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v3, :cond_0

    .line 338
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->toXmlString(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Ljava/lang/String;

    move-result-object v3

    check-cast p1, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local p1    # "target":Ljava/lang/Object;
    iget-object v4, p1, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->toXmlString(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 352
    :goto_0
    return v3

    .line 339
    .restart local p1    # "target":Ljava/lang/Object;
    :cond_0
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v3, :cond_2

    move-object v0, p1

    .line 341
    check-cast v0, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 343
    .local v0, "otherList":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 344
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v2

    .end local v0    # "otherList":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_1
    :goto_1
    move v3, v2

    .line 352
    goto :goto_0

    .line 346
    :cond_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->hasSimpleContent()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 347
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 349
    .local v1, "otherStr":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_1
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 0
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 65
    if-nez p1, :cond_0

    .line 68
    .end local p0    # "this":Lorg/mozilla/javascript/xmlimpl/XML;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_0
    sget-object p0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_0
.end method

.method getAnnotation()Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    return-object v0
.end method

.method getAttributes()[Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 4

    .prologue
    .line 136
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getAttributes()[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 137
    .local v0, "attributes":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    array-length v3, v0

    new-array v2, v3, [Lorg/mozilla/javascript/xmlimpl/XML;

    .line 138
    .local v2, "rv":[Lorg/mozilla/javascript/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 139
    aget-object v3, v0, v1

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    aput-object v3, v2, v1

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    :cond_0
    return-object v2
.end method

.method getChildren()[Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 5

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 132
    :cond_0
    return-object v2

    .line 127
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    sget-object v4, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->TRUE:Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 128
    .local v0, "children":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    array-length v3, v0

    new-array v2, v3, [Lorg/mozilla/javascript/xmlimpl/XML;

    .line 129
    .local v2, "rv":[Lorg/mozilla/javascript/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 130
    aget-object v3, v0, v1

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    aput-object v3, v2, v1

    .line 129
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 667
    const-string v0, "XML"

    return-object v0
.end method

.method public getExtraMethodSource(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->hasSimpleContent()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 198
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "src":Ljava/lang/String;
    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 201
    .end local v0    # "src":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 86
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isPrototype()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    new-array v0, v2, [Ljava/lang/Object;

    .line 89
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    goto :goto_0
.end method

.method getLastXmlChild()Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 2

    .prologue
    .line 313
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildCount()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 314
    .local v0, "pos":I
    if-gez v0, :cond_0

    const/4 v1, 0x0

    .line 315
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->getXmlChild(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    goto :goto_0
.end method

.method getNodeQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v0

    return-object v0
.end method

.method getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 1
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 146
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->getMyValueOn(Lorg/mozilla/javascript/xmlimpl/XML;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method final getXML()Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 0

    .prologue
    .line 29
    return-object p0
.end method

.method getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;
    .locals 1
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 112
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method getXmlChild(I)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 304
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChild(I)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 305
    .local v0, "child":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    if-nez v1, :cond_0

    .line 306
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setXml(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 308
    :cond_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    return-object v1
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 74
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasComplexContent()Z
    .locals 1

    .prologue
    .line 369
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->hasSimpleContent()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasOwnProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
    .locals 5
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 168
    const/4 v0, 0x0

    .line 170
    .local v0, "hasProperty":Z
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isPrototype()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 171
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v1

    .line 172
    .local v1, "property":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->findPrototypeId(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_0

    move v0, v2

    .line 177
    .end local v1    # "property":Ljava/lang/String;
    :goto_0
    return v0

    .restart local v1    # "property":Ljava/lang/String;
    :cond_0
    move v0, v3

    .line 172
    goto :goto_0

    .line 174
    .end local v1    # "property":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v4

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-lez v4, :cond_2

    move v0, v2

    :goto_1
    goto :goto_0

    :cond_2
    move v0, v3

    goto :goto_1
.end method

.method hasSimpleContent()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 362
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isComment()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    move v0, v1

    .line 364
    :cond_1
    :goto_0
    return v0

    .line 363
    :cond_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isText()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v2

    if-nez v2, :cond_1

    .line 364
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->hasChildElement()Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    goto :goto_0
.end method

.method hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
    .locals 1
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method inScopeNamespaces()[Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 2

    .prologue
    .line 571
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getInScopeNamespaces()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 572
    .local v0, "inScope":[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    return-object v1
.end method

.method initialize(Lorg/mozilla/javascript/xmlimpl/XmlNode;)V
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 23
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .line 24
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setXml(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 25
    return-void
.end method

.method insertChildAfter(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 4
    .param p1, "child"    # Lorg/mozilla/javascript/xmlimpl/XML;
    .param p2, "xml"    # Ljava/lang/Object;

    .prologue
    .line 519
    if-nez p1, :cond_1

    .line 521
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->prependChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    .line 530
    :cond_0
    :goto_0
    return-object p0

    .line 523
    :cond_1
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    .line 524
    .local v1, "toInsert":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getChildIndexOf(Lorg/mozilla/javascript/xmlimpl/XML;)I

    move-result v0

    .line 525
    .local v0, "index":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 526
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->insertChildrenAt(I[Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    goto :goto_0
.end method

.method insertChildBefore(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 3
    .param p1, "child"    # Lorg/mozilla/javascript/xmlimpl/XML;
    .param p2, "xml"    # Ljava/lang/Object;

    .prologue
    .line 504
    if-nez p1, :cond_1

    .line 506
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    .line 515
    :cond_0
    :goto_0
    return-object p0

    .line 508
    :cond_1
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    .line 509
    .local v1, "toInsert":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getChildIndexOf(Lorg/mozilla/javascript/xmlimpl/XML;)I

    move-result v0

    .line 510
    .local v0, "index":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 511
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v2, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->insertChildrenAt(I[Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    goto :goto_0
.end method

.method is(Lorg/mozilla/javascript/xmlimpl/XML;)Z
    .locals 2
    .param p1, "other"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 381
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    iget-object v1, p1, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isSameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Z

    move-result v0

    return v0
.end method

.method final isAttribute()Z
    .locals 1

    .prologue
    .line 714
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    return v0
.end method

.method final isComment()Z
    .locals 1

    .prologue
    .line 718
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isCommentType()Z

    move-result v0

    return v0
.end method

.method final isElement()Z
    .locals 1

    .prologue
    .line 726
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    return v0
.end method

.method final isProcessingInstruction()Z
    .locals 1

    .prologue
    .line 730
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v0

    return v0
.end method

.method final isText()Z
    .locals 1

    .prologue
    .line 722
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isTextType()Z

    move-result v0

    return v0
.end method

.method protected jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 182
    array-length v1, p3

    if-eqz v1, :cond_0

    aget-object v1, p3, v3

    if-eqz v1, :cond_0

    aget-object v1, p3, v3

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v2, :cond_1

    .line 183
    :cond_0
    const/4 v1, 0x1

    new-array p3, v1, [Ljava/lang/Object;

    .end local p3    # "args":[Ljava/lang/Object;
    const-string v1, ""

    aput-object v1, p3, v3

    .line 186
    .restart local p3    # "args":[Ljava/lang/Object;
    :cond_1
    aget-object v1, p3, v3

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->ecmaToXml(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 187
    .local v0, "toXml":Lorg/mozilla/javascript/xmlimpl/XML;
    if-eqz p2, :cond_2

    .line 188
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XML;->copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move-result-object v0

    .line 190
    .end local v0    # "toXml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_2
    return-object v0
.end method

.method length()I
    .locals 1

    .prologue
    .line 376
    const/4 v0, 0x1

    return v0
.end method

.method localName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 614
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->name()Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 615
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->name()Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method makeXmlFromString(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 3
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 46
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    invoke-virtual {p0, v1, v2, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method name()Lorg/mozilla/javascript/xmlimpl/QName;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 595
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isText()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isComment()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 597
    :cond_0
    :goto_0
    return-object v0

    .line 596
    :cond_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, ""

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    goto :goto_0

    .line 597
    :cond_2
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->newQName(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    goto :goto_0
.end method

.method namespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 606
    if-nez p1, :cond_0

    .line 607
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNamespaceDeclaration()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->createNamespace(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    .line 609
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNamespaceDeclaration(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->createNamespace(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    goto :goto_0
.end method

.method namespaceDeclarations()[Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 2

    .prologue
    .line 601
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNamespaceDeclarations()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 602
    .local v0, "declarations":[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    return-object v1
.end method

.method nodeKind()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 385
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->ecmaClass()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method normalize()V
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->normalize()V

    .line 215
    return-void
.end method

.method parent()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 390
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->parent()Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 391
    .local v0, "parent":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 392
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->parent()Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    goto :goto_0
.end method

.method prependChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 3
    .param p1, "xml"    # Ljava/lang/Object;

    .prologue
    .line 480
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isParentType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 481
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->insertChildrenAt(I[Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 483
    :cond_0
    return-object p0
.end method

.method processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 3
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 436
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 437
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-static {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->PROCESSING_INSTRUCTION(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->addMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)V

    .line 438
    return-object v0
.end method

.method propertyIsEnumerable(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "name"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide/16 v6, 0x0

    .line 399
    instance-of v4, p1, Ljava/lang/Integer;

    if-eqz v4, :cond_1

    .line 400
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "name":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-nez v4, :cond_0

    .line 408
    .local v0, "result":Z
    :goto_0
    return v0

    .end local v0    # "result":Z
    :cond_0
    move v0, v1

    .line 400
    goto :goto_0

    .line 401
    .restart local p1    # "name":Ljava/lang/Object;
    :cond_1
    instance-of v4, p1, Ljava/lang/Number;

    if-eqz v4, :cond_3

    .line 402
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "name":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 404
    .local v2, "x":D
    cmpl-double v4, v2, v6

    if-nez v4, :cond_2

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    div-double/2addr v4, v2

    cmpl-double v4, v4, v6

    if-lez v4, :cond_2

    .line 405
    .restart local v0    # "result":Z
    :goto_1
    goto :goto_0

    .end local v0    # "result":Z
    :cond_2
    move v0, v1

    .line 404
    goto :goto_1

    .line 406
    .end local v2    # "x":D
    .restart local p1    # "name":Ljava/lang/Object;
    :cond_3
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "0"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .restart local v0    # "result":Z
    goto :goto_0
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 81
    const-string v0, "Assignment to indexed XML is not allowed"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V
    .locals 1
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 159
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isPrototype()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    invoke-virtual {p1, p0, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->setMyValueOn(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method remove()V
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->deleteMe()V

    .line 235
    return-void
.end method

.method removeChild(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 209
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->removeChild(I)V

    .line 210
    return-void
.end method

.method removeNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 2
    .param p1, "ns"    # Lorg/mozilla/javascript/xmlimpl/Namespace;

    .prologue
    .line 584
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_0

    .line 586
    :goto_0
    return-object p0

    .line 585
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->adapt(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->removeNamespace(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)V

    goto :goto_0
.end method

.method replace(ILjava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 3
    .param p1, "index"    # I
    .param p2, "xml"    # Ljava/lang/Object;

    .prologue
    .line 469
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 470
    .local v1, "xlChildToReplace":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 472
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 473
    .local v0, "childToReplace":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {p0, v0, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->insertChildAfter(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    .line 474
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->removeChild(I)V

    .line 476
    .end local v0    # "childToReplace":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_0
    return-object p0
.end method

.method replace(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 0
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p2, "xml"    # Ljava/lang/Object;

    .prologue
    .line 276
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 277
    return-object p0
.end method

.method replaceWith(Lorg/mozilla/javascript/xmlimpl/XML;)V
    .locals 2
    .param p1, "value"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 36
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->parent()Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    if-nez v0, :cond_0

    .line 39
    iget-object v0, p1, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->initialize(Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 41
    :goto_0
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    iget-object v1, p1, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->replaceWith(Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    goto :goto_0
.end method

.method setAttribute(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V
    .locals 3
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 225
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only set attributes on elements."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 228
    const-string v0, "@* assignment not supported."

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 230
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setAttribute(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)V

    .line 231
    return-void
.end method

.method setChildren(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 3
    .param p1, "xml"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 535
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v1

    if-nez v1, :cond_0

    .line 544
    :goto_0
    return-object p0

    .line 537
    :cond_0
    :goto_1
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 538
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->removeChild(I)V

    goto :goto_1

    .line 540
    :cond_1
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 542
    .local v0, "toInsert":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->insertChildrenAt(I[Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    goto :goto_0
.end method

.method setLocalName(Ljava/lang/String;)V
    .locals 1
    .param p1, "localName"    # Ljava/lang/String;

    .prologue
    .line 620
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isText()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isComment()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 622
    :cond_0
    :goto_0
    return-void

    .line 621
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setLocalName(Ljava/lang/String;)V

    goto :goto_0
.end method

.method setName(Lorg/mozilla/javascript/xmlimpl/QName;)V
    .locals 2
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/QName;

    .prologue
    .line 626
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isText()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isComment()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 634
    :cond_0
    :goto_0
    return-void

    .line 627
    :cond_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 630
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setLocalName(Ljava/lang/String;)V

    goto :goto_0

    .line 633
    :cond_2
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/QName;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->renameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    goto :goto_0
.end method

.method setNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)V
    .locals 3
    .param p1, "ns"    # Lorg/mozilla/javascript/xmlimpl/Namespace;

    .prologue
    .line 638
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isText()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isComment()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 640
    :cond_0
    :goto_0
    return-void

    .line 639
    :cond_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XML;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XML;->setName(Lorg/mozilla/javascript/xmlimpl/QName;)V

    goto :goto_0
.end method

.method text()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 3

    .prologue
    .line 429
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 430
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    sget-object v2, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->TEXT:Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    invoke-virtual {v1, v0, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->addMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)V

    .line 431
    return-object v0
.end method

.method toDomNode()Lorg/w3c/dom/Node;
    .locals 1

    .prologue
    .line 735
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->toDomNode()Lorg/w3c/dom/Node;

    move-result-object v0

    return-object v0
.end method

.method toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "indent"    # I

    .prologue
    .line 705
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 700
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->ecmaToString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXMLString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 710
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;->node:Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->ecmaToXMLString(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method valueOf()Ljava/lang/Object;
    .locals 0

    .prologue
    .line 413
    return-object p0
.end method
