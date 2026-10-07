.class public Lio/mrarm/msa/LegacyToken;
.super Lio/mrarm/msa/Token;
.source "LegacyToken.java"


# instance fields
.field private key:[B

.field private xml:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "xml"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Lio/mrarm/msa/Token;-><init>()V

    .line 20
    iput-object p1, p0, Lio/mrarm/msa/LegacyToken;->xml:Ljava/lang/String;

    .line 21
    invoke-static {p2}, Lio/mrarm/msa/Network;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/msa/LegacyToken;->key:[B

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lio/mrarm/msa/SecurityScope;Ljava/util/Date;)V
    .locals 1
    .param p1, "xml"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "scope"    # Lio/mrarm/msa/SecurityScope;
    .param p4, "expires"    # Ljava/util/Date;

    .prologue
    .line 24
    invoke-direct {p0}, Lio/mrarm/msa/Token;-><init>()V

    .line 25
    iput-object p1, p0, Lio/mrarm/msa/LegacyToken;->xml:Ljava/lang/String;

    .line 26
    invoke-static {p2}, Lio/mrarm/msa/Network;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/msa/LegacyToken;->key:[B

    .line 27
    iput-object p3, p0, Lio/mrarm/msa/LegacyToken;->scope:Lio/mrarm/msa/SecurityScope;

    .line 28
    iput-object p4, p0, Lio/mrarm/msa/LegacyToken;->expires:Ljava/util/Date;

    .line 29
    return-void
.end method

.method public static fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/LegacyToken;
    .locals 3
    .param p0, "obj"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 56
    const-string v0, "xml_data"

    invoke-virtual {p0, v0}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "key"

    invoke-virtual {p0, v0}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 57
    new-instance v2, Lio/mrarm/msa/LegacyToken;

    const-string v0, "xml_data"

    invoke-virtual {p0, v0}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "key"

    invoke-virtual {p0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v0, v1}, Lio/mrarm/msa/LegacyToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v2

    .line 58
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/LegacyToken;
    .locals 7
    .param p0, "xml"    # Lorg/w3c/dom/Element;

    .prologue
    .line 63
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 64
    .local v1, "tr":Ljavax/xml/transform/Transformer;
    const-string v3, "method"

    const-string v4, "html"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string v3, "indent"

    const-string v4, "no"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 67
    .local v2, "writer":Ljava/io/StringWriter;
    new-instance v3, Ljavax/xml/transform/dom/DOMSource;

    const-string v4, "EncryptedData"

    invoke-interface {p0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    new-instance v4, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v4, v2}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 68
    new-instance v3, Lio/mrarm/msa/LegacyToken;

    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "wst:BinarySecret"

    invoke-interface {p0, v5}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lio/mrarm/msa/LegacyToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v1    # "tr":Ljavax/xml/transform/Transformer;
    .end local v2    # "writer":Ljava/io/StringWriter;
    :goto_0
    return-object v3

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 71
    const/4 v3, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 49
    instance-of v2, p1, Lio/mrarm/msa/LegacyToken;

    if-nez v2, :cond_1

    .line 52
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 51
    check-cast v0, Lio/mrarm/msa/LegacyToken;

    .line 52
    .local v0, "l":Lio/mrarm/msa/LegacyToken;
    iget-object v2, p0, Lio/mrarm/msa/LegacyToken;->xml:Ljava/lang/String;

    iget-object v3, v0, Lio/mrarm/msa/LegacyToken;->xml:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lio/mrarm/msa/LegacyToken;->key:[B

    iget-object v3, v0, Lio/mrarm/msa/LegacyToken;->key:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getKey()[B
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lio/mrarm/msa/LegacyToken;->key:[B

    return-object v0
.end method

.method public getXml()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lio/mrarm/msa/LegacyToken;->xml:Ljava/lang/String;

    return-object v0
.end method

.method public toJSON()Lorg/json/simple/JSONObject;
    .locals 3

    .prologue
    .line 40
    invoke-super {p0}, Lio/mrarm/msa/Token;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v0

    .line 41
    .local v0, "ret":Lorg/json/simple/JSONObject;
    const-string v1, "type"

    const-string v2, "urn:passport:legacy"

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    const-string v1, "xml_data"

    iget-object v2, p0, Lio/mrarm/msa/LegacyToken;->xml:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    const-string v1, "key"

    iget-object v2, p0, Lio/mrarm/msa/LegacyToken;->key:[B

    invoke-static {v2}, Lio/mrarm/msa/Network;->encodeBase64([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-object v0
.end method
