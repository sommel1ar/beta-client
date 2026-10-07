.class final Lorg/mozilla/javascript/xmlimpl/XMLWithScope;
.super Lorg/mozilla/javascript/NativeWith;
.source "XMLWithScope.java"


# static fields
.field private static final serialVersionUID:J = -0x9aa36be02768547L


# instance fields
.field private _currIndex:I

.field private _dqPrototype:Lorg/mozilla/javascript/xml/XMLObject;

.field private _xmlList:Lorg/mozilla/javascript/xmlimpl/XMLList;

.field private lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V
    .locals 0
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "parent"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    .line 23
    invoke-direct {p0, p2, p3}, Lorg/mozilla/javascript/NativeWith;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 24
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    .line 25
    return-void
.end method


# virtual methods
.method initAsDotQuery()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .line 37
    .local v0, "prototype":Lorg/mozilla/javascript/xml/XMLObject;
    iput v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_currIndex:I

    .line 38
    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_dqPrototype:Lorg/mozilla/javascript/xml/XMLObject;

    .line 39
    instance-of v2, v0, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 40
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 41
    .local v1, "xl":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 42
    const/4 v2, 0x0

    invoke-virtual {v1, v3, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 47
    .end local v1    # "xl":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    iput-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_xmlList:Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 48
    return-void
.end method

.method protected updateDotQuery(Z)Ljava/lang/Object;
    .locals 6
    .param p1, "value"    # Z

    .prologue
    const/4 v5, 0x0

    .line 55
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_dqPrototype:Lorg/mozilla/javascript/xml/XMLObject;

    .line 56
    .local v2, "seed":Lorg/mozilla/javascript/xml/XMLObject;
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_xmlList:Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 58
    .local v3, "xmlL":Lorg/mozilla/javascript/xmlimpl/XMLList;
    instance-of v4, v2, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v4, :cond_2

    move-object v1, v2

    .line 62
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 64
    .local v1, "orgXmlL":Lorg/mozilla/javascript/xmlimpl/XMLList;
    iget v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_currIndex:I

    .line 66
    .local v0, "idx":I
    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {v1, v0, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 71
    :cond_0
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 75
    iput v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->_currIndex:I

    .line 76
    invoke-virtual {v1, v0, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    move-object v3, v5

    .line 89
    .end local v0    # "idx":I
    .end local v1    # "orgXmlL":Lorg/mozilla/javascript/xmlimpl/XMLList;
    .end local v3    # "xmlL":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_1
    :goto_0
    return-object v3

    .line 84
    .restart local v3    # "xmlL":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_2
    if-eqz p1, :cond_1

    .line 85
    invoke-virtual {v3, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    goto :goto_0
.end method
