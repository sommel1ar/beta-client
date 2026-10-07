.class public Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;
.super Ljava/lang/Object;
.source "ResourceJSONBuilder.java"


# instance fields
.field private built:Ljava/lang/String;

.field private texturesOwners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lio/mrarm/mcpelauncher/MinecraftAssets;",
            ">;"
        }
    .end annotation
.end field

.field private val:Lorg/json/simple/JSONObject;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->texturesOwners:Ljava/util/HashMap;

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->built:Ljava/lang/String;

    .line 27
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/simple/JSONObject;

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->val:Lorg/json/simple/JSONObject;

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/json/simple/JSONObject;)V
    .locals 1
    .param p1, "val"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->texturesOwners:Ljava/util/HashMap;

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->built:Ljava/lang/String;

    .line 23
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->val:Lorg/json/simple/JSONObject;

    .line 24
    return-void
.end method


# virtual methods
.method public addTexture(Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/util/List;)V
    .locals 6
    .param p1, "assets"    # Lio/mrarm/mcpelauncher/MinecraftAssets;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/mrarm/mcpelauncher/MinecraftAssets;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 37
    .local v0, "e":Ljava/lang/String;
    move-object v1, v0

    .line 38
    .local v1, "fn":Ljava/lang/String;
    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 39
    .local v2, "io":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    .line 40
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 41
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "modpe."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, p1, v0}, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->addTexture(Ljava/lang/String;Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/lang/String;)V

    goto :goto_0

    .line 43
    .end local v0    # "e":Ljava/lang/String;
    .end local v1    # "fn":Ljava/lang/String;
    .end local v2    # "io":I
    :cond_1
    return-void
.end method

.method public addTexture(Ljava/lang/String;Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "assets"    # Lio/mrarm/mcpelauncher/MinecraftAssets;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 31
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->texturesOwners:Ljava/util/HashMap;

    invoke-virtual {v0, p3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->val:Lorg/json/simple/JSONObject;

    const-string v1, "resources"

    invoke-virtual {v0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/simple/JSONObject;

    const-string v1, "textures"

    invoke-virtual {v0, v1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/simple/JSONObject;

    invoke-virtual {v0, p1, p3}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public getBuiltJSON()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->built:Ljava/lang/String;

    return-object v0
.end method

.method public getTexture(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p1, "tex"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->texturesOwners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 51
    const/4 v0, 0x0

    .line 52
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->texturesOwners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftAssets;

    invoke-interface {v0, p1}, Lio/mrarm/mcpelauncher/MinecraftAssets;->getFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0
.end method

.method public hasTexture(Ljava/lang/String;)Z
    .locals 1
    .param p1, "tex"    # Ljava/lang/String;

    .prologue
    .line 46
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->texturesOwners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public rebuildJSON()V
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->val:Lorg/json/simple/JSONObject;

    invoke-virtual {v0}, Lorg/json/simple/JSONObject;->toJSONString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/ResourceJSONBuilder;->built:Ljava/lang/String;

    .line 61
    return-void
.end method
