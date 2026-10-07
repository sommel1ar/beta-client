.class public Lio/mrarm/msa/UserAccount;
.super Ljava/lang/Object;
.source "UserAccount.java"


# instance fields
.field private cachedTokens:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/msa/Token;",
            ">;"
        }
    .end annotation
.end field

.field private daToken:Lio/mrarm/msa/LegacyToken;

.field private email:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V
    .locals 1
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "daToken"    # Lio/mrarm/msa/LegacyToken;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mrarm/msa/UserAccount;->cachedTokens:Ljava/util/ArrayList;

    .line 15
    iput-object p1, p0, Lio/mrarm/msa/UserAccount;->email:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lio/mrarm/msa/UserAccount;->daToken:Lio/mrarm/msa/LegacyToken;

    .line 17
    return-void
.end method

.method public static fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/UserAccount;
    .locals 5
    .param p0, "obj"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 76
    const-string v3, "email"

    invoke-virtual {p0, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/lang/String;

    if-eqz v3, :cond_1

    const-string v3, "da_token"

    invoke-virtual {p0, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lorg/json/simple/JSONObject;

    if-eqz v3, :cond_1

    .line 77
    new-instance v0, Lio/mrarm/msa/UserAccount;

    const-string v3, "email"

    invoke-virtual {p0, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "da_token"

    invoke-virtual {p0, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/simple/JSONObject;

    invoke-static {v4}, Lio/mrarm/msa/LegacyToken;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/LegacyToken;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Lio/mrarm/msa/UserAccount;-><init>(Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V

    .line 78
    .local v0, "ret":Lio/mrarm/msa/UserAccount;
    const-string v3, "cached_tokens"

    invoke-virtual {p0, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lorg/json/simple/JSONArray;

    if-eqz v3, :cond_2

    .line 79
    const-string v3, "cached_tokens"

    invoke-virtual {p0, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/simple/JSONArray;

    invoke-virtual {v3}, Lorg/json/simple/JSONArray;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 80
    .local v2, "val":Ljava/lang/Object;
    instance-of v4, v2, Lorg/json/simple/JSONObject;

    if-eqz v4, :cond_0

    .line 81
    check-cast v2, Lorg/json/simple/JSONObject;

    .end local v2    # "val":Ljava/lang/Object;
    invoke-static {v2}, Lio/mrarm/msa/Token;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/Token;

    move-result-object v1

    .line 82
    .local v1, "token":Lio/mrarm/msa/Token;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lio/mrarm/msa/Token;->isExpired()Z

    move-result v4

    if-nez v4, :cond_0

    .line 83
    iget-object v4, v0, Lio/mrarm/msa/UserAccount;->cachedTokens:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    .end local v0    # "ret":Lio/mrarm/msa/UserAccount;
    .end local v1    # "token":Lio/mrarm/msa/Token;
    :cond_1
    const/4 v0, 0x0

    :cond_2
    return-object v0
.end method


# virtual methods
.method public getDaToken()Lio/mrarm/msa/LegacyToken;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lio/mrarm/msa/UserAccount;->daToken:Lio/mrarm/msa/LegacyToken;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lio/mrarm/msa/UserAccount;->email:Ljava/lang/String;

    return-object v0
.end method

.method public requestTokens(Lio/mrarm/msa/MSA;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;
    .locals 11
    .param p1, "msa"    # Lio/mrarm/msa/MSA;
    .param p2, "scopes"    # [Lio/mrarm/msa/SecurityScope;

    .prologue
    .line 28
    array-length v7, p2

    new-array v6, v7, [Lio/mrarm/msa/Token;

    .line 29
    .local v6, "tokens":[Lio/mrarm/msa/Token;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .local v2, "requestTokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lio/mrarm/msa/SecurityScope;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, p2

    if-ge v1, v7, :cond_3

    .line 31
    const/4 v0, 0x0

    .line 32
    .local v0, "found":Z
    iget-object v7, p0, Lio/mrarm/msa/UserAccount;->cachedTokens:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mrarm/msa/Token;

    .line 33
    .local v5, "token":Lio/mrarm/msa/Token;
    invoke-virtual {v5}, Lio/mrarm/msa/Token;->getSecurityScope()Lio/mrarm/msa/SecurityScope;

    move-result-object v8

    invoke-virtual {v8}, Lio/mrarm/msa/SecurityScope;->getAddress()Ljava/lang/String;

    move-result-object v8

    aget-object v9, p2, v1

    invoke-virtual {v9}, Lio/mrarm/msa/SecurityScope;->getAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v5}, Lio/mrarm/msa/Token;->isExpired()Z

    move-result v8

    if-nez v8, :cond_0

    .line 34
    aput-object v5, v6, v1

    .line 35
    const/4 v0, 0x1

    .line 39
    .end local v5    # "token":Lio/mrarm/msa/Token;
    :cond_1
    if-nez v0, :cond_2

    .line 40
    aget-object v7, p2, v1

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v0    # "found":Z
    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_6

    .line 44
    :try_start_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Lio/mrarm/msa/SecurityScope;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lio/mrarm/msa/SecurityScope;

    invoke-static {p1, p0, v7}, Lio/mrarm/msa/Network;->requestTokens(Lio/mrarm/msa/MSA;Lio/mrarm/msa/UserAccount;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;

    move-result-object v4

    .line 45
    .local v4, "tkns":[Lio/mrarm/msa/Token;
    array-length v8, v4

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v8, :cond_8

    aget-object v5, v4, v7

    .line 46
    .restart local v5    # "token":Lio/mrarm/msa/Token;
    if-nez v5, :cond_5

    .line 45
    :cond_4
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 48
    :cond_5
    iget-object v9, p0, Lio/mrarm/msa/UserAccount;->cachedTokens:Ljava/util/ArrayList;

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    const/4 v1, 0x0

    :goto_3
    array-length v9, p2

    if-ge v1, v9, :cond_4

    .line 50
    aget-object v9, p2, v1

    invoke-virtual {v9}, Lio/mrarm/msa/SecurityScope;->getAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5}, Lio/mrarm/msa/Token;->getSecurityScope()Lio/mrarm/msa/SecurityScope;

    move-result-object v10

    invoke-virtual {v10}, Lio/mrarm/msa/SecurityScope;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 51
    aput-object v5, v6, v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 57
    .end local v4    # "tkns":[Lio/mrarm/msa/Token;
    .end local v5    # "token":Lio/mrarm/msa/Token;
    :catch_0
    move-exception v3

    .line 58
    .local v3, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 61
    .end local v3    # "throwable":Ljava/lang/Throwable;
    :cond_6
    :goto_4
    return-object v6

    .line 49
    .restart local v4    # "tkns":[Lio/mrarm/msa/Token;
    .restart local v5    # "token":Lio/mrarm/msa/Token;
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 56
    .end local v5    # "token":Lio/mrarm/msa/Token;
    :cond_8
    :try_start_1
    invoke-virtual {p1}, Lio/mrarm/msa/MSA;->saveAccounts()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4
.end method

.method public toJSON()Lorg/json/simple/JSONObject;
    .locals 5

    .prologue
    .line 65
    new-instance v0, Lorg/json/simple/JSONObject;

    invoke-direct {v0}, Lorg/json/simple/JSONObject;-><init>()V

    .line 66
    .local v0, "ret":Lorg/json/simple/JSONObject;
    const-string v3, "email"

    iget-object v4, p0, Lio/mrarm/msa/UserAccount;->email:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v3, "da_token"

    iget-object v4, p0, Lio/mrarm/msa/UserAccount;->daToken:Lio/mrarm/msa/LegacyToken;

    invoke-virtual {v4}, Lio/mrarm/msa/LegacyToken;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v2, Lorg/json/simple/JSONArray;

    invoke-direct {v2}, Lorg/json/simple/JSONArray;-><init>()V

    .line 69
    .local v2, "tokens":Lorg/json/simple/JSONArray;
    iget-object v3, p0, Lio/mrarm/msa/UserAccount;->cachedTokens:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/msa/Token;

    .line 70
    .local v1, "token":Lio/mrarm/msa/Token;
    invoke-virtual {v1}, Lio/mrarm/msa/Token;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/simple/JSONArray;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 71
    .end local v1    # "token":Lio/mrarm/msa/Token;
    :cond_0
    const-string v3, "cached_tokens"

    invoke-virtual {v0, v3, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    return-object v0
.end method
