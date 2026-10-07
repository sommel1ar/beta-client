.class abstract Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
.super Lorg/mozilla/javascript/xml/XMLObject;
.source "XMLObjectImpl.java"


# static fields
.field private static final Id_addNamespace:I = 0x2

.field private static final Id_appendChild:I = 0x3

.field private static final Id_attribute:I = 0x4

.field private static final Id_attributes:I = 0x5

.field private static final Id_child:I = 0x6

.field private static final Id_childIndex:I = 0x7

.field private static final Id_children:I = 0x8

.field private static final Id_comments:I = 0x9

.field private static final Id_constructor:I = 0x1

.field private static final Id_contains:I = 0xa

.field private static final Id_copy:I = 0xb

.field private static final Id_descendants:I = 0xc

.field private static final Id_elements:I = 0xd

.field private static final Id_hasComplexContent:I = 0x12

.field private static final Id_hasOwnProperty:I = 0x11

.field private static final Id_hasSimpleContent:I = 0x13

.field private static final Id_inScopeNamespaces:I = 0xe

.field private static final Id_insertChildAfter:I = 0xf

.field private static final Id_insertChildBefore:I = 0x10

.field private static final Id_length:I = 0x14

.field private static final Id_localName:I = 0x15

.field private static final Id_name:I = 0x16

.field private static final Id_namespace:I = 0x17

.field private static final Id_namespaceDeclarations:I = 0x18

.field private static final Id_nodeKind:I = 0x19

.field private static final Id_normalize:I = 0x1a

.field private static final Id_parent:I = 0x1b

.field private static final Id_prependChild:I = 0x1c

.field private static final Id_processingInstructions:I = 0x1d

.field private static final Id_propertyIsEnumerable:I = 0x1e

.field private static final Id_removeNamespace:I = 0x1f

.field private static final Id_replace:I = 0x20

.field private static final Id_setChildren:I = 0x21

.field private static final Id_setLocalName:I = 0x22

.field private static final Id_setName:I = 0x23

.field private static final Id_setNamespace:I = 0x24

.field private static final Id_text:I = 0x25

.field private static final Id_toSource:I = 0x27

.field private static final Id_toString:I = 0x26

.field private static final Id_toXMLString:I = 0x28

.field private static final Id_valueOf:I = 0x29

.field private static final MAX_PROTOTYPE_ID:I = 0x29

.field private static final XMLOBJECT_TAG:Ljava/lang/Object;


# instance fields
.field private lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

.field private prototypeFlag:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "XMLObject"

    sput-object v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V
    .locals 0
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/mozilla/javascript/xml/XMLObject;-><init>()V

    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->initialize(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    .line 27
    return-void
.end method

.method private static arg([Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "i"    # I

    .prologue
    .line 809
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0
.end method

.method private getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 1
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 150
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {p0, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 151
    return-object v0
.end method

.method private toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .param p1, "typed"    # [Ljava/lang/Object;

    .prologue
    .line 590
    array-length v2, p1

    new-array v1, v2, [Ljava/lang/Object;

    .line 591
    .local v1, "rv":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 592
    aget-object v2, p1, v0

    aput-object v2, v1, v0

    .line 591
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 594
    :cond_0
    return-object v1
.end method

.method private xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 598
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method abstract addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V
.end method

.method public final addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "thisIsLeft"    # Z
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 366
    instance-of v2, p3, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v2, :cond_1

    .line 368
    if-eqz p2, :cond_0

    .line 369
    move-object v0, p0

    .local v0, "v1":Lorg/mozilla/javascript/xml/XMLObject;
    move-object v1, p3

    .line 370
    check-cast v1, Lorg/mozilla/javascript/xml/XMLObject;

    .line 375
    .local v1, "v2":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_0
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v2, p1, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->addXMLObjects(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/xml/XMLObject;Lorg/mozilla/javascript/xml/XMLObject;)Ljava/lang/Object;

    move-result-object v2

    .line 382
    .end local v0    # "v1":Lorg/mozilla/javascript/xml/XMLObject;
    .end local v1    # "v2":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_1
    return-object v2

    :cond_0
    move-object v0, p3

    .line 372
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .line 373
    .restart local v0    # "v1":Lorg/mozilla/javascript/xml/XMLObject;
    move-object v1, p0

    .restart local v1    # "v2":Lorg/mozilla/javascript/xml/XMLObject;
    goto :goto_0

    .line 377
    .end local v0    # "v1":Lorg/mozilla/javascript/xml/XMLObject;
    .end local v1    # "v2":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_1
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p3, v2, :cond_2

    .line 379
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 382
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/xml/XMLObject;->addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1
.end method

.method abstract child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract children()Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract comments()Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract contains(Ljava/lang/Object;)Z
.end method

.method abstract copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
.end method

.method final createEmptyXML()Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1

    .prologue
    .line 832
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createEmpty(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final createNamespace(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 3
    .param p1, "declaration"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    const/4 v2, 0x0

    .line 78
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 79
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    const/4 v1, 0x1

    new-array v1, v1, [Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    aget-object v0, v0, v2

    goto :goto_0
.end method

.method final createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 1
    .param p1, "declarations"    # [Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 83
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 289
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 290
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 291
    return-void
.end method

.method public final delete(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 274
    if-nez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 275
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 276
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v2, :cond_1

    .line 277
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 279
    .local v0, "index":J
    long-to-int v3, v0

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->delete(I)V

    .line 283
    .end local v0    # "index":J
    :goto_0
    return v4

    .line 282
    :cond_1
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    goto :goto_0
.end method

.method abstract deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V
.end method

.method final ecmaEscapeAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 827
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 828
    .local v0, "quoted":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method final ecmaToXml(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 822
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->ecmaToXml(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method abstract elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method public enterDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 358
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-direct {v0, v1, p1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    .line 359
    .local v0, "xws":Lorg/mozilla/javascript/xmlimpl/XMLWithScope;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->initAsDotQuery()V

    .line 360
    return-object v0
.end method

.method public enterWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;
    .locals 2
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 353
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-direct {v0, v1, p1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    return-object v0
.end method

.method protected final equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 194
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    .line 195
    .local v0, "result":Z
    if-eqz v0, :cond_0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method abstract equivalentXml(Ljava/lang/Object;)Z
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 605
    sget-object v19, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 606
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/xml/XMLObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    .line 803
    :cond_0
    :goto_0
    return-object v16

    .line 608
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v8

    .line 609
    .local v8, "id":I
    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v8, v0, :cond_3

    .line 610
    if-nez p4, :cond_2

    const/16 v19, 0x1

    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v19

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    goto :goto_0

    :cond_2
    const/16 v19, 0x0

    goto :goto_1

    .line 614
    :cond_3
    move-object/from16 v0, p4

    instance-of v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move/from16 v19, v0

    if-nez v19, :cond_4

    .line 615
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v19

    throw v19

    :cond_4
    move-object/from16 v15, p4

    .line 616
    check-cast v15, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 618
    .local v15, "realThis":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v17

    .line 619
    .local v17, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    packed-switch v8, :pswitch_data_0

    .line 805
    new-instance v19, Ljava/lang/IllegalArgumentException;

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 621
    :pswitch_0
    if-nez v17, :cond_5

    const-string v19, "appendChild"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 622
    :cond_5
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto :goto_0

    .line 625
    :pswitch_1
    if-nez v17, :cond_6

    const-string v19, "addNamespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 626
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v12

    .line 627
    .local v12, "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/xmlimpl/XML;->addNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 630
    .end local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_2
    if-nez v17, :cond_7

    const-string v19, "childIndex"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 631
    :cond_7
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->childIndex()I

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v16

    goto/16 :goto_0

    .line 634
    :pswitch_3
    if-nez v17, :cond_8

    const-string v19, "inScopeNamespaces"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 635
    :cond_8
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->inScopeNamespaces()[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    goto/16 :goto_0

    .line 638
    :pswitch_4
    if-nez v17, :cond_9

    const-string v19, "insertChildAfter"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 639
    :cond_9
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    .line 640
    .local v5, "arg0":Ljava/lang/Object;
    if-eqz v5, :cond_a

    instance-of v0, v5, Lorg/mozilla/javascript/xmlimpl/XML;

    move/from16 v19, v0

    if-eqz v19, :cond_b

    .line 641
    :cond_a
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local v5    # "arg0":Ljava/lang/Object;
    const/16 v19, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v5, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->insertChildAfter(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 643
    .restart local v5    # "arg0":Ljava/lang/Object;
    :cond_b
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 646
    .end local v5    # "arg0":Ljava/lang/Object;
    :pswitch_5
    if-nez v17, :cond_c

    const-string v19, "insertChildBefore"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 647
    :cond_c
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    .line 648
    .restart local v5    # "arg0":Ljava/lang/Object;
    if-eqz v5, :cond_d

    instance-of v0, v5, Lorg/mozilla/javascript/xmlimpl/XML;

    move/from16 v19, v0

    if-eqz v19, :cond_e

    .line 649
    :cond_d
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local v5    # "arg0":Ljava/lang/Object;
    const/16 v19, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v5, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->insertChildBefore(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 651
    .restart local v5    # "arg0":Ljava/lang/Object;
    :cond_e
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 654
    .end local v5    # "arg0":Ljava/lang/Object;
    :pswitch_6
    if-nez v17, :cond_f

    const-string v19, "localName"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 655
    :cond_f
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->localName()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_0

    .line 658
    :pswitch_7
    if-nez v17, :cond_10

    const-string v19, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 659
    :cond_10
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->name()Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v16

    goto/16 :goto_0

    .line 662
    :pswitch_8
    if-nez v17, :cond_11

    const-string v19, "namespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 663
    :cond_11
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_12

    const/16 v19, 0x0

    aget-object v19, p5, v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 664
    .local v13, "prefix":Ljava/lang/String;
    :goto_2
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/xmlimpl/XML;->namespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v16

    .line 665
    .local v16, "rv":Lorg/mozilla/javascript/xmlimpl/Namespace;
    if-nez v16, :cond_0

    .line 666
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 663
    .end local v13    # "prefix":Ljava/lang/String;
    .end local v16    # "rv":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :cond_12
    const/4 v13, 0x0

    goto :goto_2

    .line 672
    :pswitch_9
    if-nez v17, :cond_13

    const-string v19, "namespaceDeclarations"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 673
    :cond_13
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->namespaceDeclarations()[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v7

    .line 674
    .local v7, "array":[Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    goto/16 :goto_0

    .line 677
    .end local v7    # "array":[Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_a
    if-nez v17, :cond_14

    const-string v19, "nodeKind"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 678
    :cond_14
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->nodeKind()Ljava/lang/Object;

    move-result-object v16

    goto/16 :goto_0

    .line 681
    :pswitch_b
    if-nez v17, :cond_15

    const-string v19, "prependChild"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 682
    :cond_15
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->prependChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 685
    :pswitch_c
    if-nez v17, :cond_16

    const-string v19, "removeNamespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 686
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v12

    .line 687
    .restart local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/xmlimpl/XML;->removeNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 690
    .end local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_d
    if-nez v17, :cond_17

    const-string v19, "replace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 691
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 692
    .local v18, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    const/16 v19, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v6

    .line 693
    .local v6, "arg1":Ljava/lang/Object;
    if-nez v18, :cond_18

    .line 695
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v10, v0

    .line 696
    .local v10, "index":I
    move-object/from16 v0, v17

    invoke-virtual {v0, v10, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->replace(ILjava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 698
    .end local v10    # "index":I
    :cond_18
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->replace(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 702
    .end local v6    # "arg1":Ljava/lang/Object;
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_e
    if-nez v17, :cond_19

    const-string v19, "setChildren"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 703
    :cond_19
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_0

    .line 706
    :pswitch_f
    if-nez v17, :cond_1a

    const-string v19, "setLocalName"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 708
    :cond_1a
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    .line 709
    .local v4, "arg":Ljava/lang/Object;
    instance-of v0, v4, Lorg/mozilla/javascript/xmlimpl/QName;

    move/from16 v19, v0

    if-eqz v19, :cond_1b

    .line 710
    check-cast v4, Lorg/mozilla/javascript/xmlimpl/QName;

    .end local v4    # "arg":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v11

    .line 714
    .local v11, "localName":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/mozilla/javascript/xmlimpl/XML;->setLocalName(Ljava/lang/String;)V

    .line 715
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 712
    .end local v11    # "localName":Ljava/lang/String;
    .restart local v4    # "arg":Ljava/lang/Object;
    :cond_1b
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .restart local v11    # "localName":Ljava/lang/String;
    goto :goto_3

    .line 718
    .end local v4    # "arg":Ljava/lang/Object;
    .end local v11    # "localName":Ljava/lang/String;
    :pswitch_10
    if-nez v17, :cond_1c

    const-string v19, "setName"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 719
    :cond_1c
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-eqz v19, :cond_1d

    const/16 v19, 0x0

    aget-object v4, p5, v19

    .line 720
    .restart local v4    # "arg":Ljava/lang/Object;
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v4}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->constructQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v14

    .line 721
    .local v14, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lorg/mozilla/javascript/xmlimpl/XML;->setName(Lorg/mozilla/javascript/xmlimpl/QName;)V

    .line 722
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 719
    .end local v4    # "arg":Ljava/lang/Object;
    .end local v14    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    :cond_1d
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_4

    .line 725
    :pswitch_11
    if-nez v17, :cond_1e

    const-string v19, "setNamespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 726
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v12

    .line 727
    .restart local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/xmlimpl/XML;->setNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)V

    .line 728
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 732
    .end local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    const/16 v21, 0x1

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v19

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-static/range {v19 .. v21}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 733
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    move-object/from16 v0, v18

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 736
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_13
    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v19

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-static/range {v19 .. v21}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 738
    :pswitch_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 739
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v18, :cond_1f

    .line 741
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v10, v0

    .line 742
    .restart local v10    # "index":I
    invoke-virtual {v15, v10}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 744
    .end local v10    # "index":I
    :cond_1f
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 748
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_15
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->children()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 750
    :pswitch_16
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->comments()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 752
    :pswitch_17
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->contains(Ljava/lang/Object;)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_0

    .line 755
    :pswitch_18
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move-result-object v16

    goto/16 :goto_0

    .line 757
    :pswitch_19
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-nez v19, :cond_20

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v14

    .line 758
    .local v14, "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    :goto_5
    const/16 v19, 0x0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v14, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 757
    .end local v14    # "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v20, p5, v20

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v14

    goto :goto_5

    .line 761
    :pswitch_1a
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-nez v19, :cond_21

    invoke-static {}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 764
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :goto_6
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 761
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v20, p5, v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    goto :goto_6

    .line 767
    :pswitch_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 768
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasOwnProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_0

    .line 772
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_1c
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasComplexContent()Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_0

    .line 774
    :pswitch_1d
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasSimpleContent()Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_0

    .line 776
    :pswitch_1e
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->length()I

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v16

    goto/16 :goto_0

    .line 778
    :pswitch_1f
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->normalize()V

    .line 779
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_0

    .line 781
    :pswitch_20
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->parent()Ljava/lang/Object;

    move-result-object v16

    goto/16 :goto_0

    .line 783
    :pswitch_21
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v20, p5, v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 786
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :goto_7
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 783
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_22
    invoke-static {}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    goto :goto_7

    .line 789
    :pswitch_22
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->propertyIsEnumerable(Ljava/lang/Object;)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_0

    .line 793
    :pswitch_23
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->text()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_0

    .line 795
    :pswitch_24
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_0

    .line 797
    :pswitch_25
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v9

    .line 798
    .local v9, "indent":I
    invoke-virtual {v15, v9}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toSource(I)Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_0

    .line 800
    .end local v9    # "indent":I
    :pswitch_26
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toXMLString()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_0

    .line 803
    :pswitch_27
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->valueOf()Ljava/lang/Object;

    move-result-object v16

    goto/16 :goto_0

    .line 619
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_2
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_1f
        :pswitch_20
        :pswitch_b
        :pswitch_21
        :pswitch_22
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
    .end packed-switch
.end method

.method final exportAsJSClass(Z)V
    .locals 2
    .param p1, "sealed"    # Z

    .prologue
    .line 392
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    .line 393
    const/16 v0, 0x29

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 394
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x61

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/16 v5, 0x63

    const/4 v4, 0x0

    .line 447
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 448
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 516
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 520
    :cond_1
    return v2

    .line 449
    :pswitch_1
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 450
    .local v1, "c":I
    if-ne v1, v5, :cond_2

    const-string v0, "copy"

    const/16 v2, 0xb

    goto :goto_0

    .line 451
    :cond_2
    const/16 v3, 0x6e

    if-ne v1, v3, :cond_3

    const-string v0, "name"

    const/16 v2, 0x16

    goto :goto_0

    .line 452
    :cond_3
    const/16 v3, 0x74

    if-ne v1, v3, :cond_0

    const-string v0, "text"

    const/16 v2, 0x25

    goto :goto_0

    .line 454
    .end local v1    # "c":I
    :pswitch_2
    const-string v0, "child"

    const/4 v2, 0x6

    goto :goto_0

    .line 455
    :pswitch_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 456
    .restart local v1    # "c":I
    const/16 v3, 0x6c

    if-ne v1, v3, :cond_4

    const-string v0, "length"

    const/16 v2, 0x14

    goto :goto_0

    .line 457
    :cond_4
    const/16 v3, 0x70

    if-ne v1, v3, :cond_0

    const-string v0, "parent"

    const/16 v2, 0x1b

    goto :goto_0

    .line 459
    .end local v1    # "c":I
    :pswitch_4
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 460
    .restart local v1    # "c":I
    const/16 v3, 0x72

    if-ne v1, v3, :cond_5

    const-string v0, "replace"

    const/16 v2, 0x20

    goto :goto_0

    .line 461
    :cond_5
    const/16 v3, 0x73

    if-ne v1, v3, :cond_6

    const-string v0, "setName"

    const/16 v2, 0x23

    goto :goto_0

    .line 462
    :cond_6
    const/16 v3, 0x76

    if-ne v1, v3, :cond_0

    const-string v0, "valueOf"

    const/16 v2, 0x29

    goto :goto_0

    .line 464
    .end local v1    # "c":I
    :pswitch_5
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 465
    :sswitch_0
    const/4 v3, 0x7

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 466
    .restart local v1    # "c":I
    const/16 v3, 0x65

    if-ne v1, v3, :cond_7

    const-string v0, "toSource"

    const/16 v2, 0x27

    goto :goto_0

    .line 467
    :cond_7
    const/16 v3, 0x67

    if-ne v1, v3, :cond_0

    const-string v0, "toString"

    const/16 v2, 0x26

    goto :goto_0

    .line 469
    .end local v1    # "c":I
    :sswitch_1
    const-string v0, "nodeKind"

    const/16 v2, 0x19

    goto/16 :goto_0

    .line 470
    :sswitch_2
    const-string v0, "elements"

    const/16 v2, 0xd

    goto/16 :goto_0

    .line 471
    :sswitch_3
    const-string v0, "children"

    const/16 v2, 0x8

    goto/16 :goto_0

    .line 472
    :sswitch_4
    const-string v0, "comments"

    const/16 v2, 0x9

    goto/16 :goto_0

    .line 473
    :sswitch_5
    const-string v0, "contains"

    const/16 v2, 0xa

    goto/16 :goto_0

    .line 475
    :pswitch_6
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1

    goto/16 :goto_0

    .line 476
    :sswitch_6
    const-string v0, "localName"

    const/16 v2, 0x15

    goto/16 :goto_0

    .line 477
    :sswitch_7
    const-string v0, "namespace"

    const/16 v2, 0x17

    goto/16 :goto_0

    .line 478
    :sswitch_8
    const-string v0, "normalize"

    const/16 v2, 0x1a

    goto/16 :goto_0

    .line 479
    :sswitch_9
    const-string v0, "attribute"

    const/4 v2, 0x4

    goto/16 :goto_0

    .line 481
    :pswitch_7
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 482
    .restart local v1    # "c":I
    if-ne v1, v8, :cond_8

    const-string v0, "attributes"

    const/4 v2, 0x5

    goto/16 :goto_0

    .line 483
    :cond_8
    if-ne v1, v5, :cond_0

    const-string v0, "childIndex"

    const/4 v2, 0x7

    goto/16 :goto_0

    .line 485
    .end local v1    # "c":I
    :pswitch_8
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_2

    goto/16 :goto_0

    .line 486
    :sswitch_a
    const-string v0, "appendChild"

    const/4 v2, 0x3

    goto/16 :goto_0

    .line 487
    :sswitch_b
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 488
    :sswitch_c
    const-string v0, "descendants"

    const/16 v2, 0xc

    goto/16 :goto_0

    .line 489
    :sswitch_d
    const-string v0, "setChildren"

    const/16 v2, 0x21

    goto/16 :goto_0

    .line 490
    :sswitch_e
    const-string v0, "toXMLString"

    const/16 v2, 0x28

    goto/16 :goto_0

    .line 492
    :pswitch_9
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 493
    .restart local v1    # "c":I
    if-ne v1, v8, :cond_9

    const-string v0, "addNamespace"

    const/4 v2, 0x2

    goto/16 :goto_0

    .line 494
    :cond_9
    const/16 v3, 0x70

    if-ne v1, v3, :cond_a

    const-string v0, "prependChild"

    const/16 v2, 0x1c

    goto/16 :goto_0

    .line 495
    :cond_a
    const/16 v3, 0x73

    if-ne v1, v3, :cond_0

    .line 496
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 497
    const/16 v3, 0x4c

    if-ne v1, v3, :cond_b

    const-string v0, "setLocalName"

    const/16 v2, 0x22

    goto/16 :goto_0

    .line 498
    :cond_b
    const/16 v3, 0x4e

    if-ne v1, v3, :cond_0

    const-string v0, "setNamespace"

    const/16 v2, 0x24

    goto/16 :goto_0

    .line 501
    .end local v1    # "c":I
    :pswitch_a
    const-string v0, "hasOwnProperty"

    const/16 v2, 0x11

    goto/16 :goto_0

    .line 502
    :pswitch_b
    const-string v0, "removeNamespace"

    const/16 v2, 0x1f

    goto/16 :goto_0

    .line 503
    :pswitch_c
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 504
    .restart local v1    # "c":I
    const/16 v3, 0x68

    if-ne v1, v3, :cond_c

    const-string v0, "hasSimpleContent"

    const/16 v2, 0x13

    goto/16 :goto_0

    .line 505
    :cond_c
    const/16 v3, 0x69

    if-ne v1, v3, :cond_0

    const-string v0, "insertChildAfter"

    const/16 v2, 0xf

    goto/16 :goto_0

    .line 507
    .end local v1    # "c":I
    :pswitch_d
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 508
    .restart local v1    # "c":I
    const/16 v3, 0x43

    if-ne v1, v3, :cond_d

    const-string v0, "hasComplexContent"

    const/16 v2, 0x12

    goto/16 :goto_0

    .line 509
    :cond_d
    if-ne v1, v5, :cond_e

    const-string v0, "inScopeNamespaces"

    const/16 v2, 0xe

    goto/16 :goto_0

    .line 510
    :cond_e
    const/16 v3, 0x65

    if-ne v1, v3, :cond_0

    const-string v0, "insertChildBefore"

    const/16 v2, 0x10

    goto/16 :goto_0

    .line 512
    .end local v1    # "c":I
    :pswitch_e
    const-string v0, "propertyIsEnumerable"

    const/16 v2, 0x1e

    goto/16 :goto_0

    .line 513
    :pswitch_f
    const-string v0, "namespaceDeclarations"

    const/16 v2, 0x18

    goto/16 :goto_0

    .line 514
    :pswitch_10
    const-string v0, "processingInstructions"

    const/16 v2, 0x1d

    goto/16 :goto_0

    .line 448
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_0
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_f
        :pswitch_10
    .end packed-switch

    .line 464
    :sswitch_data_0
    .sparse-switch
        0x53 -> :sswitch_0
        0x64 -> :sswitch_1
        0x65 -> :sswitch_2
        0x69 -> :sswitch_3
        0x6d -> :sswitch_4
        0x6e -> :sswitch_5
    .end sparse-switch

    .line 475
    :sswitch_data_1
    .sparse-switch
        0x63 -> :sswitch_6
        0x6d -> :sswitch_7
        0x72 -> :sswitch_8
        0x74 -> :sswitch_9
    .end sparse-switch

    .line 485
    :sswitch_data_2
    .sparse-switch
        0x61 -> :sswitch_a
        0x63 -> :sswitch_b
        0x64 -> :sswitch_c
        0x73 -> :sswitch_d
        0x74 -> :sswitch_e
    .end sparse-switch
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 245
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 246
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final get(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 229
    if-nez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 230
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v4, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v3

    .line 231
    .local v3, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v3, :cond_2

    .line 232
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 234
    .local v0, "index":J
    long-to-int v4, v0

    invoke-virtual {p0, v4, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 235
    .local v2, "result":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v4, :cond_1

    .line 236
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 240
    .end local v0    # "index":J
    .end local v2    # "result":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-object v2

    :cond_2
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_0
.end method

.method public final getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFunctionProperty(Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # I

    .prologue
    .line 295
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->isPrototype()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    invoke-super {p0, p2, p0}, Lorg/mozilla/javascript/xml/XMLObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 303
    :goto_0
    return-object v1

    .line 298
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 299
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    instance-of v1, v0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v1, :cond_1

    .line 300
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .end local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/xml/XMLObject;->getFunctionProperty(Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 303
    .restart local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    sget-object v1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_0
.end method

.method public getFunctionProperty(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->isPrototype()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 309
    invoke-super {p0, p2, p0}, Lorg/mozilla/javascript/xml/XMLObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 316
    :goto_0
    return-object v1

    .line 311
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 312
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    instance-of v1, v0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v1, :cond_1

    .line 313
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .end local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/xml/XMLObject;->getFunctionProperty(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 316
    .restart local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    sget-object v1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_0
.end method

.method getLib()Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    return-object v0
.end method

.method public final getParentScope()Lorg/mozilla/javascript/Scriptable;
    .locals 1

    .prologue
    .line 99
    invoke-super {p0}, Lorg/mozilla/javascript/xml/XMLObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method final getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v0

    return-object v0
.end method

.method public final getPrototype()Lorg/mozilla/javascript/Scriptable;
    .locals 1

    .prologue
    .line 89
    invoke-super {p0}, Lorg/mozilla/javascript/xml/XMLObject;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method abstract getXML()Lorg/mozilla/javascript/xmlimpl/XML;
.end method

.method abstract getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 221
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 222
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v1

    return v1
.end method

.method public final has(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 209
    if-nez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 210
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 211
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v2, :cond_1

    .line 212
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 214
    .local v0, "index":J
    long-to-int v3, v0

    invoke-virtual {p0, v3, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v3

    .line 216
    .end local v0    # "index":J
    :goto_0
    return v3

    :cond_1
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v3

    goto :goto_0
.end method

.method abstract hasComplexContent()Z
.end method

.method public final hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .locals 1
    .param p1, "scriptable"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 114
    invoke-super {p0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->hasInstance(Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    return v0
.end method

.method abstract hasOwnProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
.end method

.method abstract hasSimpleContent()Z
.end method

.method abstract hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
.end method

.method protected initPrototypeId(I)V
    .locals 6
    .param p1, "id"    # I

    .prologue
    const/4 v5, 0x1

    .line 528
    packed-switch p1, :pswitch_data_0

    .line 584
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 531
    :pswitch_0
    instance-of v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v3, :cond_0

    .line 532
    new-instance v1, Lorg/mozilla/javascript/xmlimpl/XMLCtor;

    move-object v3, p0

    check-cast v3, Lorg/mozilla/javascript/xmlimpl/XML;

    sget-object v4, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-direct {v1, v3, v4, p1, v5}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;-><init>(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;II)V

    .line 536
    .local v1, "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    :goto_0
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->initPrototypeConstructor(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 587
    .end local v1    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    :goto_1
    return-void

    .line 534
    :cond_0
    new-instance v1, Lorg/mozilla/javascript/IdFunctionObject;

    sget-object v3, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-direct {v1, p0, v3, p1, v5}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;II)V

    .restart local v1    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    goto :goto_0

    .line 540
    .end local v1    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    :pswitch_1
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v2, "addNamespace"

    .line 586
    .local v2, "s":Ljava/lang/String;
    :goto_2
    sget-object v3, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v3, p1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    goto :goto_1

    .line 541
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "appendChild"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 542
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "attribute"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 543
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "attributes"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 544
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "child"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 545
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "childIndex"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 546
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "children"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 547
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "comments"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 548
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "contains"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 549
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "copy"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 550
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "descendants"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 551
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "elements"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 552
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "hasComplexContent"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 553
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "hasOwnProperty"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 554
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "hasSimpleContent"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 555
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "inScopeNamespaces"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 556
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v2, "insertChildAfter"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 557
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v2, "insertChildBefore"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 558
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "length"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 559
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "localName"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 560
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "name"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 561
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "namespace"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 563
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "namespaceDeclarations"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 564
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "nodeKind"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 565
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_19
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "normalize"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 566
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "parent"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 567
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "prependChild"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 569
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "processingInstructions"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 571
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "propertyIsEnumerable"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 572
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "removeNamespace"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 573
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1f
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v2, "replace"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2

    .line 574
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_20
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setChildren"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 575
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_21
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setLocalName"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 576
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setName"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 577
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_23
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setNamespace"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 578
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_24
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "text"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 579
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_25
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "toString"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 580
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "toSource"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 581
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_27
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "toXMLString"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 582
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_28
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "valueOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2

    .line 528
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_e
        :pswitch_d
        :pswitch_f
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
    .end packed-switch
.end method

.method final initialize(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V
    .locals 1
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    .line 32
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 33
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 34
    if-nez p3, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    .line 35
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    .line 36
    return-void

    .line 34
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final isPrototype()Z
    .locals 1

    .prologue
    .line 39
    iget-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    return v0
.end method

.method protected abstract jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract length()I
.end method

.method public memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "elem"    # Ljava/lang/Object;
    .param p3, "memberTypeFlags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 322
    and-int/lit8 v5, p3, 0x2

    if-eqz v5, :cond_0

    move v0, v1

    .line 323
    .local v0, "attribute":Z
    :goto_0
    and-int/lit8 v5, p3, 0x4

    if-eqz v5, :cond_1

    .line 324
    .local v1, "descendants":Z
    :goto_1
    if-nez v0, :cond_2

    if-nez v1, :cond_2

    .line 328
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .end local v0    # "attribute":Z
    .end local v1    # "descendants":Z
    :cond_0
    move v0, v4

    .line 322
    goto :goto_0

    .restart local v0    # "attribute":Z
    :cond_1
    move v1, v4

    .line 323
    goto :goto_1

    .line 330
    .restart local v1    # "descendants":Z
    :cond_2
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v4, p1, p2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    .line 331
    .local v2, "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    invoke-static {v2, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v3

    .line 332
    .local v3, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v3, p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->initXMLObject(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;)V

    .line 333
    return-object v3
.end method

.method public memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;
    .locals 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "elem"    # Ljava/lang/Object;
    .param p4, "memberTypeFlags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 343
    and-int/lit8 v4, p4, 0x2

    if-eqz v4, :cond_0

    move v0, v1

    .line 344
    .local v0, "attribute":Z
    :goto_0
    and-int/lit8 v4, p4, 0x4

    if-eqz v4, :cond_1

    .line 345
    .local v1, "descendants":Z
    :goto_1
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-static {v3, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 347
    .local v2, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v2, p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->initXMLObject(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;)V

    .line 348
    return-object v2

    .end local v0    # "attribute":Z
    .end local v1    # "descendants":Z
    .end local v2    # "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_0
    move v0, v3

    .line 343
    goto :goto_0

    .restart local v0    # "attribute":Z
    :cond_1
    move v1, v3

    .line 344
    goto :goto_1
.end method

.method final newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newQName(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;
    .locals 1
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newQName(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1
    .param p1, "reference"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .param p2, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 813
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1
    .param p1, "inputObject"    # Ljava/lang/Object;

    .prologue
    .line 818
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method final newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method abstract normalize()V
.end method

.method abstract parent()Ljava/lang/Object;
.end method

.method abstract processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract propertyIsEnumerable(Ljava/lang/Object;)Z
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 266
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 267
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 268
    return-void
.end method

.method public final put(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 253
    if-nez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 254
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 255
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v2, :cond_1

    .line 256
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 258
    .local v0, "index":J
    long-to-int v3, v0

    invoke-virtual {p0, v3, p0, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 262
    .end local v0    # "index":J
    :goto_0
    return-void

    .line 261
    :cond_1
    invoke-virtual {p0, v2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method abstract putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V
.end method

.method public final setParentScope(Lorg/mozilla/javascript/Scriptable;)V
    .locals 0
    .param p1, "parent"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 104
    invoke-super {p0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 105
    return-void
.end method

.method public final setPrototype(Lorg/mozilla/javascript/Scriptable;)V
    .locals 0
    .param p1, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 94
    invoke-super {p0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 95
    return-void
.end method

.method abstract text()Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract toSource(I)Ljava/lang/String;
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method abstract toXMLString()Ljava/lang/String;
.end method

.method abstract valueOf()Ljava/lang/Object;
.end method

.method xmlFromNode(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 51
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    if-nez v0, :cond_0

    .line 52
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setXml(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 54
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method
