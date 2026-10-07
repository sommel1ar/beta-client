.class public final Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "WorldDataProtobuf.java"

# interfaces
.implements Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMetaOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;",
        ">;",
        "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMetaOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private modpeData_:Lcom/google/protobuf/MapField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapField",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private renderType_:I

.field private skin_:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 377
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 521
    const-string v0, ""

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 378
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->maybeForceBuilderInitialization()V

    .line 379
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 383
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 521
    const-string v0, ""

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 384
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->maybeForceBuilderInitialization()V

    .line 385
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;
    .param p2, "x1"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 338
    invoke-direct {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method synthetic constructor <init>(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 338
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;-><init>()V

    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 344
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$000()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private internalGetModpeData()Lcom/google/protobuf/MapField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapField",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 481
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    if-nez v0, :cond_0

    .line 482
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v0}, Lcom/google/protobuf/MapField;->emptyMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v0

    .line 485
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    goto :goto_0
.end method

.method private internalGetMutableModpeData()Lcom/google/protobuf/MapField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapField",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 489
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 490
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    if-nez v0, :cond_0

    .line 491
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v0}, Lcom/google/protobuf/MapField;->newMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    .line 494
    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->isMutable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 495
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->copy()Lcom/google/protobuf/MapField;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    .line 497
    :cond_1
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->modpeData_:Lcom/google/protobuf/MapField;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 387
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$500()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public build()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 2

    .prologue
    .line 410
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    .line 411
    .local v0, "result":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 412
    invoke-static {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 414
    :cond_0
    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 4

    .prologue
    .line 418
    new-instance v1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 419
    .local v1, "result":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    iget v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->bitField0_:I

    .line 420
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 421
    .local v2, "to_bitField0_":I
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetModpeData()Lcom/google/protobuf/MapField;

    move-result-object v3

    invoke-static {v1, v3}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$702(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;Lcom/google/protobuf/MapField;)Lcom/google/protobuf/MapField;

    .line 422
    invoke-static {v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$700(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lcom/google/protobuf/MapField;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/protobuf/MapField;->makeImmutable()V

    .line 423
    iget-object v3, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$802(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    iget v3, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->renderType_:I

    invoke-static {v1, v3}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$902(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;I)I

    .line 425
    invoke-static {v1, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$1002(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;I)I

    .line 426
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onBuilt()V

    .line 427
    return-object v1
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1

    .prologue
    .line 391
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 392
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetMutableModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->clear()V

    .line 393
    const-string v0, ""

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 395
    const/4 v0, 0x0

    iput v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->renderType_:I

    .line 397
    return-object p0
.end method

.method public clearRenderType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1

    .prologue
    .line 611
    const/4 v0, 0x0

    iput v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->renderType_:I

    .line 612
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 613
    return-object p0
.end method

.method public clearSkin()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1

    .prologue
    .line 571
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getSkin()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 572
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 573
    return-object p0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1

    .prologue
    .line 406
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 402
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$000()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getModpeData()Ljava/util/Map;
    .locals 1
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

    .prologue
    .line 503
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getMutableModpeData()Ljava/util/Map;
    .locals 1
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

    .prologue
    .line 510
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetMutableModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->getMutableMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getRenderType()I
    .locals 1

    .prologue
    .line 595
    iget v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->renderType_:I

    return v0
.end method

.method public getSkin()Ljava/lang/String;
    .locals 4

    .prologue
    .line 526
    iget-object v1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 527
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-nez v3, :cond_0

    move-object v0, v1

    .line 528
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 530
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 531
    .local v2, "s":Ljava/lang/String;
    iput-object v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 534
    .end local v0    # "bs":Lcom/google/protobuf/ByteString;
    .end local v1    # "ref":Ljava/lang/Object;
    .end local v2    # "s":Ljava/lang/String;
    :goto_0
    return-object v2

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Ljava/lang/String;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v2, v1

    goto :goto_0
.end method

.method public getSkinBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 542
    iget-object v1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 543
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 544
    check-cast v1, Ljava/lang/String;

    .line 545
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 547
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 550
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 371
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$100()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    const-class v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 372
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetMapField(I)Lcom/google/protobuf/MapField;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 350
    packed-switch p1, :pswitch_data_0

    .line 354
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

    .line 352
    :pswitch_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0

    .line 350
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
    .line 361
    packed-switch p1, :pswitch_data_0

    .line 365
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

    .line 363
    :pswitch_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetMutableModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0

    .line 361
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 455
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
    .line 338
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

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
    .line 338
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

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
    .line 338
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

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
    .line 338
    invoke-virtual {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 462
    const/4 v2, 0x0

    .line 464
    .local v2, "parsedMessage":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    :try_start_0
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$1200()Lcom/google/protobuf/Parser;

    move-result-object v3

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    if-eqz v2, :cond_0

    .line 470
    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 473
    :cond_0
    return-object p0

    .line 465
    :catch_0
    move-exception v1

    .line 466
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-object v2, v0

    .line 467
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 469
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_1

    .line 470
    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 431
    instance-of v0, p1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    if-eqz v0, :cond_0

    .line 432
    check-cast p1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object p0

    .line 435
    .end local p0    # "this":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    :goto_0
    return-object p0

    .line 434
    .restart local p0    # "this":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .restart local p1    # "other":Lcom/google/protobuf/Message;
    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 2
    .param p1, "other"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .prologue
    .line 440
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 451
    :goto_0
    return-object p0

    .line 441
    :cond_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->internalGetMutableModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    .line 442
    invoke-static {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$1100(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lcom/google/protobuf/MapField;

    move-result-object v1

    .line 441
    invoke-virtual {v0, v1}, Lcom/google/protobuf/MapField;->mergeFrom(Lcom/google/protobuf/MapField;)V

    .line 443
    invoke-virtual {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getSkin()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 444
    invoke-static {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$800(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 445
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 447
    :cond_1
    invoke-virtual {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getRenderType()I

    move-result v0

    if-eqz v0, :cond_2

    .line 448
    invoke-virtual {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getRenderType()I

    move-result v0

    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->setRenderType(I)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 450
    :cond_2
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    goto :goto_0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 0
    .param p1, "unknownFields"    # Lcom/google/protobuf/UnknownFieldSet;

    .prologue
    .line 622
    return-object p0
.end method

.method public putAllModpeData(Ljava/util/Map;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;"
        }
    .end annotation

    .prologue
    .line 517
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->getMutableModpeData()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 518
    return-object p0
.end method

.method public setRenderType(I)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 602
    iput p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->renderType_:I

    .line 603
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 604
    return-object p0
.end method

.method public setSkin(Ljava/lang/String;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 558
    if-nez p1, :cond_0

    .line 559
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 562
    :cond_0
    iput-object p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 563
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 564
    return-object p0
.end method

.method public setSkinBytes(Lcom/google/protobuf/ByteString;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 580
    if-nez p1, :cond_0

    .line 581
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 583
    :cond_0
    invoke-static {p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->access$1300(Lcom/google/protobuf/ByteString;)V

    .line 585
    iput-object p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->skin_:Ljava/lang/Object;

    .line 586
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->onChanged()V

    .line 587
    return-object p0
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 338
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final setUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 0
    .param p1, "unknownFields"    # Lcom/google/protobuf/UnknownFieldSet;

    .prologue
    .line 617
    return-object p0
.end method
