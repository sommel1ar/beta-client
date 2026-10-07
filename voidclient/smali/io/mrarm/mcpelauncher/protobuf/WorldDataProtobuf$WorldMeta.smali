.class public final Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
.super Lcom/google/protobuf/GeneratedMessage;
.source "WorldDataProtobuf.java"

# interfaces
.implements Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMetaOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WorldMeta"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;,
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

.field public static final META_FIELD_NUMBER:I = 0x1

.field private static final PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J


# instance fields
.field private memoizedIsInitialized:B

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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1099
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    .line 1107
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$1;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$1;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 694
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 798
    const/4 v0, -0x1

    iput-byte v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->memoizedIsInitialized:B

    .line 695
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 8
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;

    .prologue
    .line 705
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;-><init>()V

    .line 706
    const/4 v3, 0x0

    .line 708
    .local v3, "mutable_bitField0_":I
    const/4 v0, 0x0

    .line 709
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 710
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 711
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 716
    invoke-virtual {p1, v4}, Lcom/google/protobuf/CodedInputStream;->skipField(I)Z

    move-result v5

    if-nez v5, :cond_0

    .line 717
    const/4 v0, 0x1

    goto :goto_0

    .line 713
    :sswitch_0
    const/4 v0, 0x1

    .line 714
    goto :goto_0

    .line 722
    :sswitch_1
    and-int/lit8 v5, v3, 0x1

    const/4 v6, 0x1

    if-eq v5, v6, :cond_1

    .line 723
    sget-object v5, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v5}, Lcom/google/protobuf/MapField;->newMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v5

    iput-object v5, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->meta_:Lcom/google/protobuf/MapField;

    .line 725
    or-int/lit8 v3, v3, 0x1

    .line 728
    :cond_1
    sget-object v5, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    .line 729
    invoke-virtual {v5}, Lcom/google/protobuf/MapEntry;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v5

    .line 728
    invoke-virtual {p1, v5, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/MapEntry;

    .line 730
    .local v2, "meta":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    iget-object v5, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->meta_:Lcom/google/protobuf/MapField;

    invoke-virtual {v5}, Lcom/google/protobuf/MapField;->getMutableMap()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v2}, Lcom/google/protobuf/MapEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2}, Lcom/google/protobuf/MapEntry;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 735
    .end local v2    # "meta":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 736
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 742
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->makeExtensionsImmutable()V

    throw v5

    :cond_2
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->makeExtensionsImmutable()V

    .line 744
    return-void

    .line 737
    :catch_1
    move-exception v1

    .line 738
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 740
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 711
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "x1"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .param p3, "x2"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 686
    invoke-direct {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/GeneratedMessage$Builder",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 692
    .local p1, "builder":Lcom/google/protobuf/GeneratedMessage$Builder;, "Lcom/google/protobuf/GeneratedMessage$Builder<*>;"
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 798
    const/4 v0, -0x1

    iput-byte v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->memoizedIsInitialized:B

    .line 693
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/GeneratedMessage$Builder;
    .param p2, "x1"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 686
    invoke-direct {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method static synthetic access$2000()Z
    .locals 1

    .prologue
    .line 686
    sget-boolean v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method static synthetic access$2200(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lcom/google/protobuf/MapField;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    .prologue
    .line 686
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->meta_:Lcom/google/protobuf/MapField;

    return-object v0
.end method

.method static synthetic access$2202(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;Lcom/google/protobuf/MapField;)Lcom/google/protobuf/MapField;
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .param p1, "x1"    # Lcom/google/protobuf/MapField;

    .prologue
    .line 686
    iput-object p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->meta_:Lcom/google/protobuf/MapField;

    return-object p1
.end method

.method static synthetic access$2300(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lcom/google/protobuf/MapField;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    .prologue
    .line 686
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2400()Lcom/google/protobuf/Parser;
    .locals 1

    .prologue
    .line 686
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public static getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1

    .prologue
    .line 1103
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 747
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
    .line 784
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->meta_:Lcom/google/protobuf/MapField;

    if-nez v0, :cond_0

    .line 785
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v0}, Lcom/google/protobuf/MapField;->emptyMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v0

    .line 788
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->meta_:Lcom/google/protobuf/MapField;

    goto :goto_0
.end method

.method public static newBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 1

    .prologue
    .line 896
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 1
    .param p0, "prototype"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    .prologue
    .line 899
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 874
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 880
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 844
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 850
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 885
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 891
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 864
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 870
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom([B)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 854
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 860
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    return-object v0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1126
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
    .locals 1

    .prologue
    .line 1135
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

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
    .line 795
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1131
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 7

    .prologue
    .line 822
    iget v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->memoizedSize:I

    .line 823
    .local v2, "size":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    move v3, v2

    .line 837
    .end local v2    # "size":I
    .local v3, "size":I
    :goto_0
    return v3

    .line 825
    .end local v3    # "size":I
    .restart local v2    # "size":I
    :cond_0
    const/4 v2, 0x0

    .line 827
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 829
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    sget-object v5, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-virtual {v5}, Lcom/google/protobuf/MapEntry;->newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v5

    .line 830
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/protobuf/MapEntry$Builder;->setKey(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v5

    .line 831
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/protobuf/MapEntry$Builder;->setValue(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v5

    .line 832
    invoke-virtual {v5}, Lcom/google/protobuf/MapEntry$Builder;->build()Lcom/google/protobuf/MapEntry;

    move-result-object v1

    .line 833
    .local v1, "meta":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    const/4 v5, 0x1

    .line 834
    invoke-static {v5, v1}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v5

    add-int/2addr v2, v5

    .line 835
    goto :goto_1

    .line 836
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    .end local v1    # "meta":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    :cond_1
    iput v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->memoizedSize:I

    move v3, v2

    .line 837
    .end local v2    # "size":I
    .restart local v3    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 700
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 763
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$1600()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    const-class v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    .line 764
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetMapField(I)Lcom/google/protobuf/MapField;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 753
    packed-switch p1, :pswitch_data_0

    .line 757
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

    .line 755
    :pswitch_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0

    .line 753
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final isInitialized()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 800
    iget-byte v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->memoizedIsInitialized:B

    .line 801
    .local v0, "isInitialized":B
    if-ne v0, v1, :cond_0

    .line 805
    :goto_0
    return v1

    .line 802
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 804
    :cond_1
    iput-byte v1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->newBuilderForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->newBuilderForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 1

    .prologue
    .line 894
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->newBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 909
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 910
    .local v0, "builder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 686
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 902
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;

    if-ne p0, v0, :cond_0

    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;-><init>(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 903
    :goto_0
    return-object v0

    .line 902
    :cond_0
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;-><init>(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 903
    invoke-virtual {v0, p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$Builder;

    move-result-object v0

    goto :goto_0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 811
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;->internalGetMeta()Lcom/google/protobuf/MapField;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 813
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    sget-object v3, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-virtual {v3}, Lcom/google/protobuf/MapEntry;->newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v3

    .line 814
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/protobuf/MapEntry$Builder;->setKey(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v3

    .line 815
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/protobuf/MapEntry$Builder;->setValue(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v3

    .line 816
    invoke-virtual {v3}, Lcom/google/protobuf/MapEntry$Builder;->build()Lcom/google/protobuf/MapEntry;

    move-result-object v1

    .line 817
    .local v1, "meta":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    const/4 v3, 0x1

    invoke-virtual {p1, v3, v1}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    goto :goto_0

    .line 819
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    .end local v1    # "meta":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/Long;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;>;"
    :cond_0
    return-void
.end method
