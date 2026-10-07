.class public Lio/mrarm/msa/DeviceAuth;
.super Ljava/lang/Object;
.source "DeviceAuth.java"


# instance fields
.field private membername:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private puid:Ljava/lang/String;

.field private token:Lio/mrarm/msa/LegacyToken;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 17
    .local v0, "random":Ljava/security/SecureRandom;
    const-string v1, "abcdefghijklmnopqrstuvwxyz"

    const/16 v2, 0x12

    invoke-static {v0, v1, v2}, Lio/mrarm/msa/DeviceAuth;->generateRandomCredential(Ljava/security/SecureRandom;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/msa/DeviceAuth;->membername:Ljava/lang/String;

    .line 18
    const-string v1, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}/?;:\'\\\",.<>`~"

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Lio/mrarm/msa/DeviceAuth;->generateRandomCredential(Ljava/security/SecureRandom;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/msa/DeviceAuth;->password:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "membername"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "puid"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lio/mrarm/msa/DeviceAuth;->membername:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lio/mrarm/msa/DeviceAuth;->password:Ljava/lang/String;

    .line 24
    iput-object p3, p0, Lio/mrarm/msa/DeviceAuth;->puid:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V
    .locals 1
    .param p1, "membername"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "puid"    # Ljava/lang/String;
    .param p4, "token"    # Lio/mrarm/msa/LegacyToken;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lio/mrarm/msa/DeviceAuth;->membername:Ljava/lang/String;

    .line 29
    iput-object p2, p0, Lio/mrarm/msa/DeviceAuth;->password:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lio/mrarm/msa/DeviceAuth;->puid:Ljava/lang/String;

    .line 31
    if-eqz p4, :cond_0

    invoke-virtual {p4}, Lio/mrarm/msa/LegacyToken;->isExpired()Z

    move-result v0

    if-nez v0, :cond_0

    .line 32
    iput-object p4, p0, Lio/mrarm/msa/DeviceAuth;->token:Lio/mrarm/msa/LegacyToken;

    .line 33
    :cond_0
    return-void
.end method

.method public static fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/DeviceAuth;
    .locals 5
    .param p0, "obj"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 80
    const-string v2, "membername"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_2

    const-string v2, "password"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "puid":Ljava/lang/String;
    const-string v2, "puid"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 83
    const-string v2, "puid"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "puid":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 84
    .restart local v0    # "puid":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    .line 85
    .local v1, "token":Lio/mrarm/msa/LegacyToken;
    const-string v2, "token"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lorg/json/simple/JSONObject;

    if-eqz v2, :cond_1

    .line 86
    const-string v2, "token"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/simple/JSONObject;

    invoke-static {v2}, Lio/mrarm/msa/LegacyToken;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/LegacyToken;

    move-result-object v1

    .line 87
    :cond_1
    new-instance v4, Lio/mrarm/msa/DeviceAuth;

    const-string v2, "membername"

    invoke-virtual {p0, v2}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "password"

    invoke-virtual {p0, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-direct {v4, v2, v3, v0, v1}, Lio/mrarm/msa/DeviceAuth;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V

    move-object v2, v4

    .line 89
    .end local v0    # "puid":Ljava/lang/String;
    .end local v1    # "token":Lio/mrarm/msa/LegacyToken;
    :goto_0
    return-object v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static generateRandomCredential(Ljava/security/SecureRandom;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p0, "random"    # Ljava/security/SecureRandom;
    .param p1, "chars"    # Ljava/lang/String;
    .param p2, "len"    # I

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v0, "b":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 62
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public getMembername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lio/mrarm/msa/DeviceAuth;->membername:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lio/mrarm/msa/DeviceAuth;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lio/mrarm/msa/DeviceAuth;->puid:Ljava/lang/String;

    return-object v0
.end method

.method public getToken()Lio/mrarm/msa/LegacyToken;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lio/mrarm/msa/DeviceAuth;->token:Lio/mrarm/msa/LegacyToken;

    return-object v0
.end method

.method public setPuid(Ljava/lang/String;)V
    .locals 0
    .param p1, "puid"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lio/mrarm/msa/DeviceAuth;->puid:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setToken(Lio/mrarm/msa/LegacyToken;)V
    .locals 0
    .param p1, "token"    # Lio/mrarm/msa/LegacyToken;

    .prologue
    .line 56
    iput-object p1, p0, Lio/mrarm/msa/DeviceAuth;->token:Lio/mrarm/msa/LegacyToken;

    .line 57
    return-void
.end method

.method public toJSON()Lorg/json/simple/JSONObject;
    .locals 3

    .prologue
    .line 69
    new-instance v0, Lorg/json/simple/JSONObject;

    invoke-direct {v0}, Lorg/json/simple/JSONObject;-><init>()V

    .line 70
    .local v0, "obj":Lorg/json/simple/JSONObject;
    const-string v1, "membername"

    iget-object v2, p0, Lio/mrarm/msa/DeviceAuth;->membername:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v1, "password"

    iget-object v2, p0, Lio/mrarm/msa/DeviceAuth;->password:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    iget-object v1, p0, Lio/mrarm/msa/DeviceAuth;->puid:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 73
    const-string v1, "puid"

    iget-object v2, p0, Lio/mrarm/msa/DeviceAuth;->puid:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :cond_0
    iget-object v1, p0, Lio/mrarm/msa/DeviceAuth;->token:Lio/mrarm/msa/LegacyToken;

    if-eqz v1, :cond_1

    .line 75
    const-string v1, "token"

    iget-object v2, p0, Lio/mrarm/msa/DeviceAuth;->token:Lio/mrarm/msa/LegacyToken;

    invoke-virtual {v2}, Lio/mrarm/msa/LegacyToken;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    :cond_1
    return-object v0
.end method
