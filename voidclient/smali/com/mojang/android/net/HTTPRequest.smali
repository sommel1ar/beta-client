.class public Lcom/mojang/android/net/HTTPRequest;
.super Ljava/lang/Object;
.source "HTTPRequest.java"


# instance fields
.field body:Ljava/lang/String;

.field contentType:Ljava/lang/String;

.field cookieData:Ljava/lang/String;

.field url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abort()V
    .locals 2

    .prologue
    .line 32
    const-string v0, "HTTPRequest/Stub"

    const-string v1, "abort"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    return-void
.end method

.method public send(Ljava/lang/String;)Lcom/mojang/android/net/HTTPResponse;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 26
    const-string v0, "HTTPRequest/Stub"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    new-instance v0, Lcom/mojang/android/net/HTTPResponse;

    invoke-direct {v0}, Lcom/mojang/android/net/HTTPResponse;-><init>()V

    return-object v0
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/mojang/android/net/HTTPRequest;->contentType:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setCookieData(Ljava/lang/String;)V
    .locals 0
    .param p1, "cookieData"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/mojang/android/net/HTTPRequest;->cookieData:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setRequestBody(Ljava/lang/String;)V
    .locals 0
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/mojang/android/net/HTTPRequest;->body:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public setURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/mojang/android/net/HTTPRequest;->url:Ljava/lang/String;

    .line 11
    return-void
.end method
