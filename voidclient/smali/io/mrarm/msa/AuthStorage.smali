.class public Lio/mrarm/msa/AuthStorage;
.super Ljava/lang/Object;
.source "AuthStorage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceAuth()Lio/mrarm/msa/DeviceAuth;
    .locals 4

    .prologue
    .line 28
    invoke-virtual {p0}, Lio/mrarm/msa/AuthStorage;->getDeviceAuthFile()Ljava/io/File;

    move-result-object v1

    .line 29
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 31
    :try_start_0
    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-static {v3}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/simple/JSONObject;

    .line 32
    .local v2, "obj":Lorg/json/simple/JSONObject;
    invoke-static {v2}, Lio/mrarm/msa/DeviceAuth;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/DeviceAuth;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 39
    .end local v2    # "obj":Lorg/json/simple/JSONObject;
    :goto_0
    return-object v0

    .line 33
    :catch_0
    move-exception v3

    .line 37
    :cond_0
    new-instance v0, Lio/mrarm/msa/DeviceAuth;

    invoke-direct {v0}, Lio/mrarm/msa/DeviceAuth;-><init>()V

    .line 38
    .local v0, "auth":Lio/mrarm/msa/DeviceAuth;
    invoke-virtual {p0, v0}, Lio/mrarm/msa/AuthStorage;->saveDeviceAuth(Lio/mrarm/msa/DeviceAuth;)V

    goto :goto_0
.end method

.method protected getDeviceAuthFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 19
    const-string v0, "msa_deviceid.json"

    invoke-virtual {p0, v0}, Lio/mrarm/msa/AuthStorage;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected getFile(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 15
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getUserAccounts()Ljava/util/ArrayList;
    .locals 7
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
    .line 55
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v4, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lio/mrarm/msa/UserAccount;>;"
    invoke-virtual {p0}, Lio/mrarm/msa/AuthStorage;->getUserAccountsFile()Ljava/io/File;

    move-result-object v2

    .line 57
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 59
    :try_start_0
    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-static {v5}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/simple/JSONObject;

    .line 60
    .local v3, "obj":Lorg/json/simple/JSONObject;
    const-string v5, "accounts"

    invoke-virtual {v3, v5}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/simple/JSONArray;

    .line 61
    .local v1, "accounts":Lorg/json/simple/JSONArray;
    invoke-virtual {v1}, Lorg/json/simple/JSONArray;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 62
    .local v0, "acc":Ljava/lang/Object;
    check-cast v0, Lorg/json/simple/JSONObject;

    .end local v0    # "acc":Ljava/lang/Object;
    invoke-static {v0}, Lio/mrarm/msa/UserAccount;->fromJSON(Lorg/json/simple/JSONObject;)Lio/mrarm/msa/UserAccount;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 64
    .end local v1    # "accounts":Lorg/json/simple/JSONArray;
    .end local v3    # "obj":Lorg/json/simple/JSONObject;
    :catch_0
    move-exception v5

    .line 68
    :cond_0
    return-object v4
.end method

.method protected getUserAccountsFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 23
    const-string v0, "msa_accounts.json"

    invoke-virtual {p0, v0}, Lio/mrarm/msa/AuthStorage;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public saveDeviceAuth(Lio/mrarm/msa/DeviceAuth;)V
    .locals 4
    .param p1, "auth"    # Lio/mrarm/msa/DeviceAuth;

    .prologue
    .line 44
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    invoke-virtual {p0}, Lio/mrarm/msa/AuthStorage;->getDeviceAuthFile()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 45
    .local v1, "writer":Ljava/io/FileWriter;
    invoke-virtual {p1}, Lio/mrarm/msa/DeviceAuth;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/json/simple/JSONObject;->writeJSONString(Ljava/io/Writer;)V

    .line 46
    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 47
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .end local v1    # "writer":Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "Failed to write device auth."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 50
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public saveUserAccounts(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/msa/UserAccount;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "accounts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lio/mrarm/msa/UserAccount;>;"
    :try_start_0
    new-instance v4, Ljava/io/FileWriter;

    invoke-virtual {p0}, Lio/mrarm/msa/AuthStorage;->getUserAccountsFile()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 74
    .local v4, "writer":Ljava/io/FileWriter;
    new-instance v2, Lorg/json/simple/JSONObject;

    invoke-direct {v2}, Lorg/json/simple/JSONObject;-><init>()V

    .line 75
    .local v2, "obj":Lorg/json/simple/JSONObject;
    new-instance v1, Lorg/json/simple/JSONArray;

    invoke-direct {v1}, Lorg/json/simple/JSONArray;-><init>()V

    .line 76
    .local v1, "arr":Lorg/json/simple/JSONArray;
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/msa/UserAccount;

    .line 77
    .local v0, "account":Lio/mrarm/msa/UserAccount;
    invoke-virtual {v0}, Lio/mrarm/msa/UserAccount;->toJSON()Lorg/json/simple/JSONObject;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/json/simple/JSONArray;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    .end local v0    # "account":Lio/mrarm/msa/UserAccount;
    .end local v1    # "arr":Lorg/json/simple/JSONArray;
    .end local v2    # "obj":Lorg/json/simple/JSONObject;
    .end local v4    # "writer":Ljava/io/FileWriter;
    :catch_0
    move-exception v3

    .line 84
    .local v3, "t":Ljava/lang/Throwable;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v6, "Failed to write user accounts."

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 87
    .end local v3    # "t":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 79
    .restart local v1    # "arr":Lorg/json/simple/JSONArray;
    .restart local v2    # "obj":Lorg/json/simple/JSONObject;
    .restart local v4    # "writer":Ljava/io/FileWriter;
    :cond_0
    :try_start_1
    const-string v5, "accounts"

    invoke-virtual {v2, v5, v1}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    invoke-virtual {v2, v4}, Lorg/json/simple/JSONObject;->writeJSONString(Ljava/io/Writer;)V

    .line 81
    invoke-virtual {v4}, Ljava/io/FileWriter;->flush()V

    .line 82
    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
