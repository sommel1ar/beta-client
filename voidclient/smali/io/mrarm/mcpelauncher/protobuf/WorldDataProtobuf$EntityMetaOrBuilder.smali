.class public interface abstract Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMetaOrBuilder;
.super Ljava/lang/Object;
.source "WorldDataProtobuf.java"

# interfaces
.implements Lcom/google/protobuf/MessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EntityMetaOrBuilder"
.end annotation


# virtual methods
.method public abstract getModpeData()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRenderType()I
.end method

.method public abstract getSkin()Ljava/lang/String;
.end method

.method public abstract getSkinBytes()Lcom/google/protobuf/ByteString;
.end method
