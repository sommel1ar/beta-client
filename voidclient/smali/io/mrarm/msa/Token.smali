.class public Lio/mrarm/msa/Token;
.super Ljava/lang/Object;
.source "Token.java"


# instance fields
.field protected expires:Ljava/util/Date;

.field protected scope:Lio/mrarm/msa/SecurityScope;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/Token;
    .locals 6
    .param p0, "obj"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 36
    const-string v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_1

    .line 37
    const/4 v0, 0x0

    .line 51
    :cond_0
    :goto_0
    return-object v0

    .line 38
    :cond_1
    const-string v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 39
    .local v1, "type":Ljava/lang/String;
    const/4 v0, 0x0

    .line 40
    .local v0, "token":Lio/mrarm/msa/Token;
    const-string v2, "urn:passport:legacy"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 41
    invoke-static {p0}, Lio/mrarm/msa/LegacyToken;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/LegacyToken;

    move-result-object v0

    .line 45
    :cond_2
    :goto_1
    if-eqz v0, :cond_0

    .line 46
    const-string v2, "scope"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lorg/json/simple/JSONObject;

    if-eqz v2, :cond_3

    .line 47
    const-string v2, "scope"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/simple/JSONObject;

    invoke-static {v2}, Lio/mrarm/msa/SecurityScope;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/SecurityScope;

    move-result-object v2

    iput-object v2, v0, Lio/mrarm/msa/Token;->scope:Lio/mrarm/msa/SecurityScope;

    .line 48
    :cond_3
    const-string v2, "expires"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Long;

    if-eqz v2, :cond_0

    .line 49
    new-instance v3, Ljava/util/Date;

    const-string v2, "expires"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    iput-object v3, v0, Lio/mrarm/msa/Token;->expires:Ljava/util/Date;

    goto :goto_0

    .line 42
    :cond_4
    const-string v2, "urn:passport:compact"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 43
    invoke-static {p0}, Lio/mrarm/msa/CompactToken;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/CompactToken;

    move-result-object v0

    goto :goto_1
.end method

.method public static fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/Token;
    .locals 7
    .param p0, "xml"    # Lorg/w3c/dom/Element;

    .prologue
    .line 56
    :try_start_0
    const-string v5, "wst:TokenType"

    invoke-interface {p0, v5}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v4

    .line 57
    .local v4, "tokenType":Ljava/lang/String;
    const/4 v3, 0x0

    .line 58
    .local v3, "token":Lio/mrarm/msa/Token;
    const-string v5, "urn:passport:legacy"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 59
    invoke-static {p0}, Lio/mrarm/msa/LegacyToken;->fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/LegacyToken;

    move-result-object v3

    .line 63
    :cond_0
    :goto_0
    if-eqz v3, :cond_2

    .line 64
    const-string v5, "wsa:Address"

    invoke-interface {p0, v5}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 65
    .local v1, "nodeList":Lorg/w3c/dom/NodeList;
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-lez v5, :cond_1

    .line 66
    new-instance v5, Lio/mrarm/msa/SecurityScope;

    const/4 v6, 0x0

    invoke-interface {v1, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lio/mrarm/msa/SecurityScope;-><init>(Ljava/lang/String;)V

    iput-object v5, v3, Lio/mrarm/msa/Token;->scope:Lio/mrarm/msa/SecurityScope;

    .line 68
    :cond_1
    const-string v5, "wsu:Expires"

    invoke-interface {p0, v5}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 69
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-lez v5, :cond_2

    .line 70
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 71
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, v3, Lio/mrarm/msa/Token;->expires:Ljava/util/Date;

    .line 78
    .end local v0    # "dateFormat":Ljava/text/SimpleDateFormat;
    .end local v1    # "nodeList":Lorg/w3c/dom/NodeList;
    .end local v3    # "token":Lio/mrarm/msa/Token;
    .end local v4    # "tokenType":Ljava/lang/String;
    :cond_2
    :goto_1
    return-object v3

    .line 60
    .restart local v3    # "token":Lio/mrarm/msa/Token;
    .restart local v4    # "tokenType":Ljava/lang/String;
    :cond_3
    const-string v5, "urn:passport:compact"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 61
    invoke-static {p0}, Lio/mrarm/msa/CompactToken;->fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/CompactToken;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 75
    .end local v3    # "token":Lio/mrarm/msa/Token;
    .end local v4    # "tokenType":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 76
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 78
    const/4 v3, 0x0

    goto :goto_1
.end method


# virtual methods
.method public getSecurityScope()Lio/mrarm/msa/SecurityScope;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lio/mrarm/msa/Token;->scope:Lio/mrarm/msa/SecurityScope;

    return-object v0
.end method

.method public isExpired()Z
    .locals 2

    .prologue
    .line 21
    iget-object v0, p0, Lio/mrarm/msa/Token;->expires:Ljava/util/Date;

    if-nez v0, :cond_0

    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    return v0

    :cond_0
    invoke-static {}, Lio/mrarm/msa/Network;->getServerTime()Ljava/util/Date;

    move-result-object v0

    iget-object v1, p0, Lio/mrarm/msa/Token;->expires:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    goto :goto_0
.end method

.method public toJSON()Lorg/json/simple/JSONObject;
    .locals 4

    .prologue
    .line 27
    new-instance v0, Lorg/json/simple/JSONObject;

    invoke-direct {v0}, Lorg/json/simple/JSONObject;-><init>()V

    .line 28
    .local v0, "ret":Lorg/json/simple/JSONObject;
    iget-object v1, p0, Lio/mrarm/msa/Token;->scope:Lio/mrarm/msa/SecurityScope;

    if-eqz v1, :cond_0

    .line 29
    const-string v1, "scope"

    iget-object v2, p0, Lio/mrarm/msa/Token;->scope:Lio/mrarm/msa/SecurityScope;

    invoke-virtual {v2}, Lio/mrarm/msa/SecurityScope;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    :cond_0
    iget-object v1, p0, Lio/mrarm/msa/Token;->expires:Ljava/util/Date;

    if-eqz v1, :cond_1

    .line 31
    const-string v1, "expires"

    iget-object v2, p0, Lio/mrarm/msa/Token;->expires:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    :cond_1
    return-object v0
.end method
