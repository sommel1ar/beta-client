.class public Lio/mrarm/msa/SecurityScope;
.super Ljava/lang/Object;
.source "SecurityScope.java"


# instance fields
.field private address:Ljava/lang/String;

.field private policyRef:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lio/mrarm/msa/SecurityScope;->address:Ljava/lang/String;

    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "policyRef"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lio/mrarm/msa/SecurityScope;->address:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lio/mrarm/msa/SecurityScope;->policyRef:Ljava/lang/String;

    .line 17
    return-void
.end method

.method public static fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/SecurityScope;
    .locals 2
    .param p0, "obj"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 36
    const-string v1, "address"

    invoke-virtual {p0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 37
    new-instance v0, Lio/mrarm/msa/SecurityScope;

    const-string v1, "address"

    invoke-virtual {p0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Lio/mrarm/msa/SecurityScope;-><init>(Ljava/lang/String;)V

    .line 38
    .local v0, "ret":Lio/mrarm/msa/SecurityScope;
    const-string v1, "policy"

    invoke-virtual {p0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 39
    const-string v1, "policy"

    invoke-virtual {p0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lio/mrarm/msa/SecurityScope;->policyRef:Ljava/lang/String;

    .line 42
    .end local v0    # "ret":Lio/mrarm/msa/SecurityScope;
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lio/mrarm/msa/SecurityScope;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getPolicyReference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lio/mrarm/msa/SecurityScope;->policyRef:Ljava/lang/String;

    return-object v0
.end method

.method public toJSON()Lorg/json/simple/JSONObject;
    .locals 3

    .prologue
    .line 28
    new-instance v0, Lorg/json/simple/JSONObject;

    invoke-direct {v0}, Lorg/json/simple/JSONObject;-><init>()V

    .line 29
    .local v0, "ret":Lorg/json/simple/JSONObject;
    const-string v1, "address"

    iget-object v2, p0, Lio/mrarm/msa/SecurityScope;->address:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    iget-object v1, p0, Lio/mrarm/msa/SecurityScope;->policyRef:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 31
    const-string v1, "policy"

    iget-object v2, p0, Lio/mrarm/msa/SecurityScope;->policyRef:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    :cond_0
    return-object v0
.end method
