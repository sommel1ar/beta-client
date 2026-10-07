.class Lorg/mozilla/javascript/xmlimpl/Namespace;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "Namespace.java"


# static fields
.field private static final Id_constructor:I = 0x1

.field private static final Id_prefix:I = 0x1

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_uri:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final NAMESPACE_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = -0x500413d73ea9fd70L


# instance fields
.field private ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

.field private prototype:Lorg/mozilla/javascript/xmlimpl/Namespace;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "Namespace"

    sput-object v0, Lorg/mozilla/javascript/xmlimpl/Namespace;->NAMESPACE_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 25
    return-void
.end method

.method private constructNamespace()Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 2

    .prologue
    .line 307
    const-string v0, ""

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method private constructNamespace(Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 5
    .param p1, "prefixValue"    # Ljava/lang/Object;
    .param p2, "uriValue"    # Ljava/lang/Object;

    .prologue
    .line 275
    instance-of v3, p2, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v3, :cond_2

    move-object v1, p2

    .line 276
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/QName;

    .line 277
    .local v1, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, "uri":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 279
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/QName;->toString()Ljava/lang/String;

    move-result-object v2

    .line 285
    .end local v1    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    :cond_0
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_4

    .line 286
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v3, :cond_3

    .line 287
    const-string v0, ""

    .line 303
    .local v0, "prefix":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-virtual {p0, v0, v2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v3

    return-object v3

    .line 282
    .end local v0    # "prefix":Ljava/lang/String;
    .end local v2    # "uri":Ljava/lang/String;
    :cond_2
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "uri":Ljava/lang/String;
    goto :goto_0

    .line 289
    :cond_3
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 290
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    .line 291
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Illegal prefix \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' for \'no namespace\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 295
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_4
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v3, :cond_5

    .line 296
    const-string v0, ""

    .restart local v0    # "prefix":Ljava/lang/String;
    goto :goto_1

    .line 297
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_5
    invoke-static {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->accept(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 298
    const-string v0, ""

    .restart local v0    # "prefix":Ljava/lang/String;
    goto :goto_1

    .line 300
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_6
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "prefix":Ljava/lang/String;
    goto :goto_1
.end method

.method static create(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xmlimpl/Namespace;Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 1
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "prototype"    # Lorg/mozilla/javascript/xmlimpl/Namespace;
    .param p2, "namespace"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/Namespace;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;-><init>()V

    .line 29
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/Namespace;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 30
    iput-object p1, v0, Lorg/mozilla/javascript/xmlimpl/Namespace;->prototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    .line 31
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 32
    iput-object p2, v0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .line 33
    return-object v0
.end method

.method private equals(Lorg/mozilla/javascript/xmlimpl/Namespace;)Z
    .locals 2
    .param p1, "n"    # Lorg/mozilla/javascript/xmlimpl/Namespace;

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 312
    if-nez p2, :cond_0

    array-length v0, p3

    if-ne v0, v2, :cond_0

    .line 313
    aget-object v0, p3, v1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->castToNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    .line 321
    :goto_0
    return-object v0

    .line 316
    :cond_0
    array-length v0, p3

    if-nez v0, :cond_1

    .line 317
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->constructNamespace()Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    goto :goto_0

    .line 318
    :cond_1
    array-length v0, p3

    if-ne v0, v2, :cond_2

    .line 319
    aget-object v0, p3, v1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    goto :goto_0

    .line 321
    :cond_2
    aget-object v0, p3, v1

    aget-object v1, p3, v2

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    goto :goto_0
.end method

.method private js_toSource()Ljava/lang/String;
    .locals 3

    .prologue
    .line 327
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 329
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 330
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 331
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 1
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 222
    instance-of v0, p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-nez v0, :cond_0

    .line 223
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 224
    :cond_0
    check-cast p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    .end local p1    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p1
.end method

.method static toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v1, 0x27

    .line 336
    const-string v0, "new Namespace("

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 338
    const-string v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_0
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 341
    if-eqz p0, :cond_1

    .line 342
    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    const-string v0, "\', \'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    :cond_1
    invoke-static {p1, v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 348
    :cond_2
    const/16 v0, 0x29

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 349
    return-void
.end method


# virtual methods
.method castToNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 1
    .param p1, "namespaceObj"    # Ljava/lang/Object;

    .prologue
    .line 265
    instance-of v0, p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-eqz v0, :cond_0

    .line 266
    check-cast p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    .line 268
    .end local p1    # "namespaceObj":Ljava/lang/Object;
    :goto_0
    return-object p1

    .restart local p1    # "namespaceObj":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object p1

    goto :goto_0
.end method

.method constructNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 5
    .param p1, "uriValue"    # Ljava/lang/Object;

    .prologue
    .line 242
    instance-of v4, p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-eqz v4, :cond_0

    move-object v0, p1

    .line 243
    check-cast v0, Lorg/mozilla/javascript/xmlimpl/Namespace;

    .line 244
    .local v0, "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v1

    .line 245
    .local v1, "prefix":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v3

    .line 261
    .end local v0    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    .local v3, "uri":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v1, v3}, Lorg/mozilla/javascript/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v4

    return-object v4

    .line 246
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v3    # "uri":Ljava/lang/String;
    :cond_0
    instance-of v4, p1, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v4, :cond_2

    move-object v2, p1

    .line 247
    check-cast v2, Lorg/mozilla/javascript/xmlimpl/QName;

    .line 248
    .local v2, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v3

    .line 249
    .restart local v3    # "uri":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 251
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/QName;->prefix()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "prefix":Ljava/lang/String;
    goto :goto_0

    .line 253
    .end local v1    # "prefix":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/QName;->toString()Ljava/lang/String;

    move-result-object v3

    .line 254
    const/4 v1, 0x0

    .restart local v1    # "prefix":Ljava/lang/String;
    goto :goto_0

    .line 257
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v2    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    .end local v3    # "uri":Ljava/lang/String;
    :cond_2
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 258
    .restart local v3    # "uri":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    const-string v1, ""

    .restart local v1    # "prefix":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .end local v1    # "prefix":Ljava/lang/String;
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 67
    instance-of v0, p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 68
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    check-cast p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->equals(Lorg/mozilla/javascript/xmlimpl/Namespace;)Z

    move-result v0

    goto :goto_0
.end method

.method protected equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 78
    instance-of v1, p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-nez v1, :cond_0

    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    .line 80
    .end local p1    # "value":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 79
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_0
    check-cast p1, Lorg/mozilla/javascript/xmlimpl/Namespace;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->equals(Lorg/mozilla/javascript/xmlimpl/Namespace;)Z

    move-result v0

    .line 80
    .local v0, "result":Z
    if-eqz v0, :cond_1

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 206
    sget-object v1, Lorg/mozilla/javascript/xmlimpl/Namespace;->NAMESPACE_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 207
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 216
    :goto_0
    return-object v1

    .line 209
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 210
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 218
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 212
    :pswitch_0
    if-nez p4, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-direct {p0, p2, v1, p5}, Lorg/mozilla/javascript/xmlimpl/Namespace;->jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 214
    :pswitch_1
    invoke-direct {p0, p4, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 216
    :pswitch_2
    invoke-direct {p0, p4, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    invoke-direct {v1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->js_toSource()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 210
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public exportAsJSClass(Z)V
    .locals 2
    .param p1, "sealed"    # Z

    .prologue
    .line 41
    const/4 v0, 0x3

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 42
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 110
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 111
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 112
    .local v3, "s_length":I
    const/4 v4, 0x3

    if-ne v3, v4, :cond_2

    const-string v0, "uri"

    const/4 v2, 0x2

    .line 114
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v2, 0x0

    .line 119
    :cond_1
    if-nez v2, :cond_3

    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v4

    .line 129
    :goto_1
    return v4

    .line 113
    :cond_2
    const/4 v4, 0x6

    if-ne v3, v4, :cond_0

    const-string v0, "prefix"

    const/4 v2, 0x1

    goto :goto_0

    .line 122
    :cond_3
    packed-switch v2, :pswitch_data_0

    .line 127
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 125
    :pswitch_0
    const/4 v1, 0x5

    .line 129
    .local v1, "attr":I
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getMaxInstanceId()I

    move-result v4

    add-int/2addr v4, v2

    invoke-static {v1, v4}, Lorg/mozilla/javascript/xmlimpl/Namespace;->instanceIdInfo(II)I

    move-result v4

    goto :goto_1

    .line 122
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 169
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 170
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 171
    .local v3, "s_length":I
    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 172
    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 173
    .local v1, "c":I
    const/16 v4, 0x6f

    if-ne v1, v4, :cond_2

    const-string v0, "toSource"

    const/4 v2, 0x3

    .line 177
    .end local v1    # "c":I
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v2, 0x0

    .line 181
    :cond_1
    return v2

    .line 174
    .restart local v1    # "c":I
    :cond_2
    const/16 v4, 0x74

    if-ne v1, v4, :cond_0

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_0

    .line 176
    .end local v1    # "c":I
    :cond_3
    const/16 v4, 0xb

    if-ne v3, v4, :cond_0

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    const-string v0, "Namespace"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
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
    .line 90
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 136
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    packed-switch v0, :pswitch_data_0

    .line 140
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 137
    :pswitch_0
    const-string v0, "prefix"

    goto :goto_0

    .line 138
    :pswitch_1
    const-string v0, "uri"

    goto :goto_0

    .line 136
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 146
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    packed-switch v0, :pswitch_data_0

    .line 153
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    .line 148
    :pswitch_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 149
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 151
    :pswitch_1
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .prologue
    .line 102
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 190
    packed-switch p1, :pswitch_data_0

    .line 194
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 191
    :pswitch_0
    const/4 v0, 0x2

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 196
    .local v1, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/xmlimpl/Namespace;->NAMESPACE_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 197
    return-void

    .line 192
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 193
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 190
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method newNamespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->prototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-nez v1, :cond_0

    move-object v0, p0

    .line 229
    .local v0, "prototype":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :goto_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->create(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xmlimpl/Namespace;Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    return-object v1

    .line 228
    .end local v0    # "prototype":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->prototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    goto :goto_0
.end method

.method newNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .locals 3
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 233
    if-nez p1, :cond_0

    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    .line 235
    :goto_0
    return-object v1

    .line 234
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->prototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-nez v1, :cond_1

    move-object v0, p0

    .line 235
    .local v0, "prototype":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :goto_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-static {p1, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->create(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xmlimpl/Namespace;Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    goto :goto_0

    .line 234
    .end local v0    # "prototype":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->prototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    goto :goto_1
.end method

.method public prefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toLocaleString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public uri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/Namespace;->ns:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
