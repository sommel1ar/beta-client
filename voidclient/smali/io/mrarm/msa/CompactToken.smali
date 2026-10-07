.class public Lio/mrarm/msa/CompactToken;
.super Lio/mrarm/msa/Token;
.source "CompactToken.java"


# instance fields
.field private token:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0}, Lio/mrarm/msa/Token;-><init>()V

    .line 13
    iput-object p1, p0, Lio/mrarm/msa/CompactToken;->token:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lio/mrarm/msa/SecurityScope;Ljava/util/Date;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "scope"    # Lio/mrarm/msa/SecurityScope;
    .param p3, "expires"    # Ljava/util/Date;

    .prologue
    .line 16
    invoke-direct {p0}, Lio/mrarm/msa/Token;-><init>()V

    .line 17
    iput-object p1, p0, Lio/mrarm/msa/CompactToken;->token:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lio/mrarm/msa/CompactToken;->scope:Lio/mrarm/msa/SecurityScope;

    .line 19
    iput-object p3, p0, Lio/mrarm/msa/CompactToken;->expires:Ljava/util/Date;

    .line 20
    return-void
.end method

.method public static fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/CompactToken;
    .locals 2
    .param p0, "obj"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 34
    const-string v0, "token"

    invoke-virtual {p0, v0}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 35
    new-instance v1, Lio/mrarm/msa/CompactToken;

    const-string v0, "token"

    invoke-virtual {p0, v0}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lio/mrarm/msa/CompactToken;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    .line 37
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/CompactToken;
    .locals 4
    .param p0, "xml"    # Lorg/w3c/dom/Element;

    .prologue
    .line 42
    :try_start_0
    new-instance v1, Lio/mrarm/msa/CompactToken;

    const-string v2, "wsse:BinarySecurityToken"

    invoke-interface {p0, v2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lio/mrarm/msa/CompactToken;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    :goto_0
    return-object v1

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 45
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getStringToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lio/mrarm/msa/CompactToken;->token:Ljava/lang/String;

    return-object v0
.end method

.method public toJSON()Lorg/json/simple/JSONObject;
    .locals 3

    .prologue
    .line 27
    invoke-super {p0}, Lio/mrarm/msa/Token;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v0

    .line 28
    .local v0, "ret":Lorg/json/simple/JSONObject;
    const-string v1, "type"

    const-string v2, "urn:passport:compact"

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    const-string v1, "token"

    iget-object v2, p0, Lio/mrarm/msa/CompactToken;->token:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    return-object v0
.end method
