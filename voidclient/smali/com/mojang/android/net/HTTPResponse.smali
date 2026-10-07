.class public Lcom/mojang/android/net/HTTPResponse;
.super Ljava/lang/Object;
.source "HTTPResponse.java"


# instance fields
.field body:Ljava/lang/String;

.field headers:[Lorg/apache/http/Header;

.field responseCode:I

.field status:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/4 v0, 0x0

    iput v0, p0, Lcom/mojang/android/net/HTTPResponse;->status:I

    .line 9
    const/16 v0, -0x64

    iput v0, p0, Lcom/mojang/android/net/HTTPResponse;->responseCode:I

    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mojang/android/net/HTTPResponse;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getHeaders()[Lorg/apache/http/Header;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mojang/android/net/HTTPResponse;->headers:[Lorg/apache/http/Header;

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    .prologue
    .line 21
    iget v0, p0, Lcom/mojang/android/net/HTTPResponse;->responseCode:I

    return v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 13
    iget v0, p0, Lcom/mojang/android/net/HTTPResponse;->status:I

    return v0
.end method
