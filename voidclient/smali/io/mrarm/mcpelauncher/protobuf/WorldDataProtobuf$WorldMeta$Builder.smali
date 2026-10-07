.class public final Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "WorldDataProtobuf.java"

# interfaces
.implements Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMetaOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;",
        ">;",
        "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMetaOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private meta_:Lcom/google/protobuf/MapField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapField",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 954
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 955
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->maybeForceBuilderInitialization()V

    .line 956
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 0
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 960
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 961
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->maybeForceBuilderInitialization()V

    .line 962
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;
    .param p2, "x1"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 915
    invoke-direct {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method synthetic constructor <init>(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 915
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;-><init>()V

    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 921
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$1500()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private internalGetMeta()Lcom/google/protobuf/MapField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapField",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1043
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    if-nez v0, :cond_0

    .line 1044
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v0}, Lcom/google/protobuf/MapField;->emptyMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v0

    .line 1047
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    goto :goto_0
.end method

.method private internalGetMutableMeta()Lcom/google/protobuf/MapField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapField",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1051
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->onChanged()V

    .line 1052
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    if-nez v0, :cond_0

    .line 1053
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v0}, Lcom/google/protobuf/MapField;->newMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    .line 1056
    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->isMutable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1057
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->copy()Lcom/google/protobuf/MapField;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    .line 1059
    :cond_1
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->meta_:Lcom/google/protobuf/MapField;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 964
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->access$2000()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 966
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 2

    .prologue
    .line 983
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    .line 984
    .local v0, "result":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 985
    invoke-static {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 987
    :cond_0
    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 3

    .prologue
    .line 991
    new-instance v1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 992
    .local v1, "result":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    iget v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->bitField0_:I

    .line 993
    .local v0, "from_bitField0_":I
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v2

    invoke-static {v1, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->access$2202(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;Lcom/google/protobuf/MapField;)Lcom/google/protobuf/MapField;

    .line 994
    invoke-static {v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->access$2200(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lcom/google/protobuf/MapField;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/MapField;->makeImmutable()V

    .line 995
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->onBuilt()V

    .line 996
    return-object v1
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 1

    .prologue
    .line 968
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 969
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMutableMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->clear()V

    .line 970
    return-object p0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1

    .prologue
    .line 979
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 975
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$1500()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getMeta()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1065
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getMutableMeta()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1072
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMutableMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->getMutableMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 948
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$1600()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    const-class v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    .line 949
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetMapField(I)Lcom/google/protobuf/MapField;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 927
    packed-switch p1, :pswitch_data_0

    .line 931
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid map field number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 929
    :pswitch_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0

    .line 927
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method protected internalGetMutableMapField(I)Lcom/google/protobuf/MapField;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 938
    packed-switch p1, :pswitch_data_0

    .line 942
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid map field number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 940
    :pswitch_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMutableMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0

    .line 938
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 1017
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 915
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 915
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 915
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 915
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1024
    const/4 v2, 0x0

    .line 1026
    .local v2, "parsedMessage":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    :try_start_0
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->access$2400()Lcom/google/protobuf/Parser;

    move-result-object v3

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1031
    if-eqz v2, :cond_0

    .line 1032
    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    .line 1035
    :cond_0
    return-object p0

    .line 1027
    :catch_0
    move-exception v1

    .line 1028
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-object v2, v0

    .line 1029
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1031
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_1

    .line 1032
    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 1000
    instance-of v0, p1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    if-eqz v0, :cond_0

    .line 1001
    check-cast p1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object p0

    .line 1004
    .end local p0    # "this":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    :goto_0
    return-object p0

    .line 1003
    .restart local p0    # "this":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .restart local p1    # "other":Lcom/google/protobuf/Message;
    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 2
    .param p1, "other"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    .prologue
    .line 1009
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 1013
    :goto_0
    return-object p0

    .line 1010
    :cond_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->internalGetMutableMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    .line 1011
    invoke-static {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->access$2300(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lcom/google/protobuf/MapField;

    move-result-object v1

    .line 1010
    invoke-virtual {v0, v1}, Lcom/google/protobuf/MapField;->mergeFrom(Lcom/google/protobuf/MapField;)V

    .line 1012
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->onChanged()V

    goto :goto_0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 0
    .param p1, "unknownFields"    # Lcom/google/protobuf/UnknownFieldSet;

    .prologue
    .line 1089
    return-object p0
.end method

.method public putAllMeta(Ljava/util/Map;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;)",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;"
        }
    .end annotation

    .prologue
    .line 1079
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->getMutableMeta()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1080
    return-object p0
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 0
    .param p1, "unknownFields"    # Lcom/google/protobuf/UnknownFieldSet;

    .prologue
    .line 1084
    return-object p0
.end method
