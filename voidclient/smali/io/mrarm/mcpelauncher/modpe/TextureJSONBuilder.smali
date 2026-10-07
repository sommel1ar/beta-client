.class public Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;
.super Ljava/lang/Object;
.source "TextureJSONBuilder.java"


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
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->built:Ljava/lang/String;

    .line 29
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/simple/JSONObject;

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->val:Lorg/json/simple/JSONObject;

    .line 30
    return-void
.end method

.method public constructor <init>(Lorg/json/simple/JSONObject;)V
    .locals 1
    .param p1, "val"    # Lorg/json/simple/JSONObject;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->built:Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->val:Lorg/json/simple/JSONObject;

    .line 26
    return-void
.end method


# virtual methods
.method public addTexture(Lio/mrarm/mcpelauncher/MinecraftAssets;Ljava/util/List;)V
    .locals 12
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
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v11, 0x2f

    const/4 v6, 0x0

    const/4 v10, -0x1

    .line 57
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 58
    .local v0, "e":Ljava/lang/String;
    move-object v1, v0

    .line 59
    .local v1, "fn":Ljava/lang/String;
    invoke-virtual {v0, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 60
    .local v2, "io":I
    if-eq v2, v10, :cond_0

    .line 61
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 63
    :cond_0
    move-object v5, v0

    .line 64
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v5, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 65
    .local v3, "iof":I
    if-eq v3, v10, :cond_1

    .line 66
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 67
    :cond_1
    const/16 v8, 0x2e

    invoke-virtual {v5, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 68
    if-eq v3, v10, :cond_2

    .line 69
    invoke-virtual {v5, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 70
    :cond_2
    const/16 v8, 0x5f

    invoke-virtual {v5, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 71
    if-ne v3, v10, :cond_4

    move v4, v6

    .line 72
    .local v4, "n":I
    :goto_1
    if-eq v3, v10, :cond_3

    .line 73
    invoke-virtual {v5, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 75
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "modpe."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v5, v4, v8}, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->addTexture(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    .line 71
    .end local v4    # "n":I
    :cond_4
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    goto :goto_1

    .line 77
    .end local v0    # "e":Ljava/lang/String;
    .end local v1    # "fn":Ljava/lang/String;
    .end local v2    # "io":I
    .end local v3    # "iof":I
    .end local v5    # "name":Ljava/lang/String;
    :cond_5
    return-void
.end method

.method public addTexture(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "num"    # I
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 34
    iget-object v3, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->val:Lorg/json/simple/JSONObject;

    const-string v4, "texture_data"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/simple/JSONObject;

    invoke-virtual {v3, p1}, Lorg/json/simple/JSONObject;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 35
    iget-object v3, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->val:Lorg/json/simple/JSONObject;

    const-string v4, "texture_data"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/simple/JSONObject;

    invoke-virtual {v3, p1}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/simple/JSONObject;

    .line 41
    .local v2, "val":Lorg/json/simple/JSONObject;
    :goto_0
    const-string v3, "textures"

    invoke-virtual {v2, v3}, Lorg/json/simple/JSONObject;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "textures"

    invoke-virtual {v2, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lorg/json/simple/JSONArray;

    if-eqz v3, :cond_1

    .line 42
    const-string v3, "textures"

    invoke-virtual {v2, v3}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/simple/JSONArray;

    .line 47
    .local v0, "arr":Lorg/json/simple/JSONArray;
    :goto_1
    invoke-virtual {v0}, Lorg/json/simple/JSONArray;->size()I

    move-result v3

    if-gt v3, p2, :cond_2

    .line 48
    invoke-virtual {v0}, Lorg/json/simple/JSONArray;->size()I

    move-result v1

    .local v1, "i":I
    :goto_2
    if-gt v1, p2, :cond_3

    .line 49
    invoke-virtual {v0, p3}, Lorg/json/simple/JSONArray;->add(Ljava/lang/Object;)Z

    .line 48
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 37
    .end local v0    # "arr":Lorg/json/simple/JSONArray;
    .end local v1    # "i":I
    .end local v2    # "val":Lorg/json/simple/JSONObject;
    :cond_0
    new-instance v2, Lorg/json/simple/JSONObject;

    invoke-direct {v2}, Lorg/json/simple/JSONObject;-><init>()V

    .line 38
    .restart local v2    # "val":Lorg/json/simple/JSONObject;
    iget-object v3, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->val:Lorg/json/simple/JSONObject;

    const-string v4, "texture_data"

    invoke-virtual {v3, v4}, Lorg/json/simple/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/simple/JSONObject;

    invoke-virtual {v3, p1, v2}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 44
    :cond_1
    new-instance v0, Lorg/json/simple/JSONArray;

    invoke-direct {v0}, Lorg/json/simple/JSONArray;-><init>()V

    .line 45
    .restart local v0    # "arr":Lorg/json/simple/JSONArray;
    const-string v3, "textures"

    invoke-virtual {v2, v3, v0}, Lorg/json/simple/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 52
    :cond_2
    invoke-virtual {v0, p2, p3}, Lorg/json/simple/JSONArray;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 54
    :cond_3
    return-void
.end method

.method public getBuiltJSON()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->built:Ljava/lang/String;

    return-object v0
.end method

.method public rebuildJSON()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->val:Lorg/json/simple/JSONObject;

    invoke-virtual {v0}, Lorg/json/simple/JSONObject;->toJSONString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/modpe/TextureJSONBuilder;->built:Ljava/lang/String;

    .line 85
    return-void
.end method
