.class public Lio/mrarm/msa/MSA;
.super Ljava/lang/Object;
.source "MSA.java"


# instance fields
.field private accounts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/msa/UserAccount;",
            ">;"
        }
    .end annotation
.end field

.field private deviceAuth:Lio/mrarm/msa/DeviceAuth;

.field private storage:Lio/mrarm/msa/AuthStorage;


# direct methods
.method public constructor <init>(Lio/mrarm/msa/AuthStorage;)V
    .locals 0
    .param p1, "storage"    # Lio/mrarm/msa/AuthStorage;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    .line 14
    return-void
.end method


# virtual methods
.method public addAccount(Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V
    .locals 4
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "daToken"    # Lio/mrarm/msa/LegacyToken;

    .prologue
    .line 43
    iget-object v2, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    .line 44
    iget-object v2, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    invoke-virtual {v2}, Lio/mrarm/msa/AuthStorage;->getUserAccounts()Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    .line 45
    :cond_0
    iget-object v2, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/msa/UserAccount;

    .line 46
    .local v0, "a":Lio/mrarm/msa/UserAccount;
    invoke-virtual {v0}, Lio/mrarm/msa/UserAccount;->getEmail()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 47
    invoke-virtual {v0}, Lio/mrarm/msa/UserAccount;->getDaToken()Lio/mrarm/msa/LegacyToken;

    move-result-object v2

    invoke-virtual {p2, v2}, Lio/mrarm/msa/LegacyToken;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 56
    .end local v0    # "a":Lio/mrarm/msa/UserAccount;
    :goto_0
    return-void

    .line 49
    .restart local v0    # "a":Lio/mrarm/msa/UserAccount;
    :cond_2
    iget-object v2, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 53
    .end local v0    # "a":Lio/mrarm/msa/UserAccount;
    :cond_3
    new-instance v1, Lio/mrarm/msa/UserAccount;

    invoke-direct {v1, p1, p2}, Lio/mrarm/msa/UserAccount;-><init>(Ljava/lang/String;Lio/mrarm/msa/LegacyToken;)V

    .line 54
    .local v1, "account":Lio/mrarm/msa/UserAccount;
    iget-object v2, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    iget-object v2, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    iget-object v3, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Lio/mrarm/msa/AuthStorage;->saveUserAccounts(Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method public getAccountByEmail(Ljava/lang/String;)Lio/mrarm/msa/UserAccount;
    .locals 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 27
    iget-object v1, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    if-nez v1, :cond_0

    .line 28
    iget-object v1, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    invoke-virtual {v1}, Lio/mrarm/msa/AuthStorage;->getUserAccounts()Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    .line 29
    :cond_0
    iget-object v1, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/msa/UserAccount;

    .line 30
    .local v0, "acc":Lio/mrarm/msa/UserAccount;
    invoke-virtual {v0}, Lio/mrarm/msa/UserAccount;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 33
    .end local v0    # "acc":Lio/mrarm/msa/UserAccount;
    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAccounts()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/msa/UserAccount;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 38
    iget-object v0, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    invoke-virtual {v0}, Lio/mrarm/msa/AuthStorage;->getUserAccounts()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    .line 39
    :cond_0
    iget-object v0, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDeviceAuth()Lio/mrarm/msa/DeviceAuth;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lio/mrarm/msa/MSA;->deviceAuth:Lio/mrarm/msa/DeviceAuth;

    if-nez v0, :cond_0

    .line 18
    iget-object v0, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    invoke-virtual {v0}, Lio/mrarm/msa/AuthStorage;->getDeviceAuth()Lio/mrarm/msa/DeviceAuth;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/msa/MSA;->deviceAuth:Lio/mrarm/msa/DeviceAuth;

    .line 19
    :cond_0
    iget-object v0, p0, Lio/mrarm/msa/MSA;->deviceAuth:Lio/mrarm/msa/DeviceAuth;

    return-object v0
.end method

.method protected saveAccounts()V
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    iget-object v1, p0, Lio/mrarm/msa/MSA;->accounts:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lio/mrarm/msa/AuthStorage;->saveUserAccounts(Ljava/util/ArrayList;)V

    .line 61
    :cond_0
    return-void
.end method

.method protected saveDeviceAuth()V
    .locals 2

    .prologue
    .line 23
    iget-object v0, p0, Lio/mrarm/msa/MSA;->storage:Lio/mrarm/msa/AuthStorage;

    iget-object v1, p0, Lio/mrarm/msa/MSA;->deviceAuth:Lio/mrarm/msa/DeviceAuth;

    invoke-virtual {v0, v1}, Lio/mrarm/msa/AuthStorage;->saveDeviceAuth(Lio/mrarm/msa/DeviceAuth;)V

    .line 24
    return-void
.end method
