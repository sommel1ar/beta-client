.class public interface abstract Lcom/microsoft/xbox/idp/util/HttpCall$CallbackWithHeaders;
.super Ljava/lang/Object;
.source "HttpCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/microsoft/xbox/idp/util/HttpCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CallbackWithHeaders"
.end annotation


# virtual methods
.method public abstract processHttpError(IILjava/lang/String;Lcom/microsoft/xbox/idp/util/HttpHeaders;)V
.end method

.method public abstract processResponse(IJLjava/io/InputStream;Lcom/microsoft/xbox/idp/util/HttpHeaders;)V
.end method
