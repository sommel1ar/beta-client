.class public final Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
.super Lcom/google/protobuf/GeneratedMessage;
.source "WorldDataProtobuf.java"

# interfaces
.implements Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMetaOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "EntityMeta"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;,
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

.field public static final MODPEDATA_FIELD_NUMBER:I = 0x1

.field private static final PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation
.end field

.field public static final RENDERTYPE_FIELD_NUMBER:I = 0x3

.field public static final SKIN_FIELD_NUMBER:I = 0x2

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

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

.field private volatile skin_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 632
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .line 640
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$1;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$1;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 208
    const/4 v0, -0x1

    iput-byte v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->memoizedIsInitialized:B

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    .line 50
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 9
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;

    .prologue
    .line 60
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;-><init>()V

    .line 61
    const/4 v3, 0x0

    .line 63
    .local v3, "mutable_bitField0_":I
    const/4 v0, 0x0

    .line 64
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 65
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v5

    .line 66
    .local v5, "tag":I
    sparse-switch v5, :sswitch_data_0

    .line 71
    invoke-virtual {p1, v5}, Lcom/google/protobuf/CodedInputStream;->skipField(I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 72
    const/4 v0, 0x1

    goto :goto_0

    .line 68
    :sswitch_0
    const/4 v0, 0x1

    .line 69
    goto :goto_0

    .line 77
    :sswitch_1
    and-int/lit8 v6, v3, 0x1

    const/4 v7, 0x1

    if-eq v6, v7, :cond_1

    .line 78
    sget-object v6, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v6}, Lcom/google/protobuf/MapField;->newMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v6

    iput-object v6, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->modpeData_:Lcom/google/protobuf/MapField;

    .line 80
    or-int/lit8 v3, v3, 0x1

    .line 83
    :cond_1
    sget-object v6, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    .line 84
    invoke-virtual {v6}, Lcom/google/protobuf/MapEntry;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v6

    .line 83
    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/MapEntry;

    .line 85
    .local v2, "modpeData":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v6, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->modpeData_:Lcom/google/protobuf/MapField;

    invoke-virtual {v6}, Lcom/google/protobuf/MapField;->getMutableMap()Ljava/util/Map;

    move-result-object v6

    invoke-virtual {v2}, Lcom/google/protobuf/MapEntry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2}, Lcom/google/protobuf/MapEntry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 101
    .end local v2    # "modpeData":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "tag":I
    :catch_0
    move-exception v1

    .line 102
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->makeExtensionsImmutable()V

    throw v6

    .line 89
    .restart local v5    # "tag":I
    :sswitch_2
    :try_start_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readStringRequireUtf8()Ljava/lang/String;

    move-result-object v4

    .line 91
    .local v4, "s":Ljava/lang/String;
    iput-object v4, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 103
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "tag":I
    :catch_1
    move-exception v1

    .line 104
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 106
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 96
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v5    # "tag":I
    :sswitch_3
    :try_start_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v6

    iput v6, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 108
    .end local v5    # "tag":I
    :cond_2
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->makeExtensionsImmutable()V

    .line 110
    return-void

    .line 66
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
        0x18 -> :sswitch_3
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "x1"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .param p3, "x2"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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
    .line 45
    .local p1, "builder":Lcom/google/protobuf/GeneratedMessage$Builder;, "Lcom/google/protobuf/GeneratedMessage$Builder<*>;"
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 208
    const/4 v0, -0x1

    iput-byte v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->memoizedIsInitialized:B

    .line 46
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/GeneratedMessage$Builder;
    .param p2, "x1"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method static synthetic access$1002(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;I)I
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .param p1, "x1"    # I

    .prologue
    .line 39
    iput p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->bitField0_:I

    return p1
.end method

.method static synthetic access$1100(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lcom/google/protobuf/MapField;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .prologue
    .line 39
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->internalGetModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200()Lcom/google/protobuf/Parser;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/google/protobuf/ByteString;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$500()Z
    .locals 1

    .prologue
    .line 39
    sget-boolean v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method static synthetic access$700(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lcom/google/protobuf/MapField;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .prologue
    .line 39
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->modpeData_:Lcom/google/protobuf/MapField;

    return-object v0
.end method

.method static synthetic access$702(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;Lcom/google/protobuf/MapField;)Lcom/google/protobuf/MapField;
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .param p1, "x1"    # Lcom/google/protobuf/MapField;

    .prologue
    .line 39
    iput-object p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->modpeData_:Lcom/google/protobuf/MapField;

    return-object p1
.end method

.method static synthetic access$800(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .prologue
    .line 39
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$802(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 39
    iput-object p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$902(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;I)I
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .param p1, "x1"    # I

    .prologue
    .line 39
    iput p1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    return p1
.end method

.method public static getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1

    .prologue
    .line 636
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 113
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
    .line 151
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->modpeData_:Lcom/google/protobuf/MapField;

    if-nez v0, :cond_0

    .line 152
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-static {v0}, Lcom/google/protobuf/MapField;->emptyMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;

    move-result-object v0

    .line 155
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->modpeData_:Lcom/google/protobuf/MapField;

    goto :goto_0
.end method

.method public static newBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1

    .prologue
    .line 319
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1
    .param p0, "prototype"    # Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    .prologue
    .line 322
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 303
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 267
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 273
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 314
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 287
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 293
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom([B)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 277
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 283
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    return-object v0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 659
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;
    .locals 1

    .prologue
    .line 668
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

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
    .line 162
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->internalGetModpeData()Lcom/google/protobuf/MapField;

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
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation

    .prologue
    .line 664
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getRenderType()I
    .locals 1

    .prologue
    .line 205
    iget v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 7

    .prologue
    .line 238
    iget v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->memoizedSize:I

    .line 239
    .local v2, "size":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    move v3, v2

    .line 260
    .end local v2    # "size":I
    .local v3, "size":I
    :goto_0
    return v3

    .line 241
    .end local v3    # "size":I
    .restart local v2    # "size":I
    :cond_0
    const/4 v2, 0x0

    .line 243
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->internalGetModpeData()Lcom/google/protobuf/MapField;

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

    .line 245
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v5, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-virtual {v5}, Lcom/google/protobuf/MapEntry;->newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v5

    .line 246
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/protobuf/MapEntry$Builder;->setKey(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v5

    .line 247
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/protobuf/MapEntry$Builder;->setValue(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v5

    .line 248
    invoke-virtual {v5}, Lcom/google/protobuf/MapEntry$Builder;->build()Lcom/google/protobuf/MapEntry;

    move-result-object v1

    .line 249
    .local v1, "modpeData":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x1

    .line 250
    invoke-static {v5, v1}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v5

    add-int/2addr v2, v5

    .line 251
    goto :goto_1

    .line 252
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "modpeData":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getSkinBytes()Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 253
    const/4 v4, 0x2

    iget-object v5, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/google/protobuf/GeneratedMessage;->computeStringSize(ILjava/lang/Object;)I

    move-result v4

    add-int/2addr v2, v4

    .line 255
    :cond_2
    iget v4, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    if-eqz v4, :cond_3

    .line 256
    const/4 v4, 0x3

    iget v5, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    .line 257
    invoke-static {v4, v5}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v4

    add-int/2addr v2, v4

    .line 259
    :cond_3
    iput v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->memoizedSize:I

    move v3, v2

    .line 260
    .end local v2    # "size":I
    .restart local v3    # "size":I
    goto :goto_0
.end method

.method public getSkin()Ljava/lang/String;
    .locals 4

    .prologue
    .line 171
    iget-object v1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    .line 172
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 173
    check-cast v1, Ljava/lang/String;

    .line 179
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 175
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 177
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 178
    .local v2, "s":Ljava/lang/String;
    iput-object v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    move-object v1, v2

    .line 179
    goto :goto_0
.end method

.method public getSkinBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 187
    iget-object v1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    .line 188
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 189
    check-cast v1, Ljava/lang/String;

    .line 190
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 192
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    .line 195
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

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 55
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 129
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$100()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    const-class v1, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    const-class v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    .line 130
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetMapField(I)Lcom/google/protobuf/MapField;
    .locals 3
    .param p1, "number"    # I

    .prologue
    .line 119
    packed-switch p1, :pswitch_data_0

    .line 123
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

    .line 121
    :pswitch_0
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->internalGetModpeData()Lcom/google/protobuf/MapField;

    move-result-object v0

    return-object v0

    .line 119
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

    .line 210
    iget-byte v0, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->memoizedIsInitialized:B

    .line 211
    .local v0, "isInitialized":B
    if-ne v0, v1, :cond_0

    .line 215
    :goto_0
    return v1

    .line 212
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 214
    :cond_1
    iput-byte v1, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->newBuilderForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->newBuilderForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 1

    .prologue
    .line 317
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->newBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 332
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 333
    .local v0, "builder":Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 325
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->DEFAULT_INSTANCE:Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    if-ne p0, v0, :cond_0

    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;-><init>(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 326
    :goto_0
    return-object v0

    .line 325
    :cond_0
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;-><init>(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;)V

    .line 326
    invoke-virtual {v0, p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;->mergeFrom(Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;)Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$Builder;

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
    .line 221
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->internalGetModpeData()Lcom/google/protobuf/MapField;

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

    .line 223
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v3, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta$ModpeDataDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    invoke-virtual {v3}, Lcom/google/protobuf/MapEntry;->newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v3

    .line 224
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/protobuf/MapEntry$Builder;->setKey(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v3

    .line 225
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/protobuf/MapEntry$Builder;->setValue(Ljava/lang/Object;)Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v3

    .line 226
    invoke-virtual {v3}, Lcom/google/protobuf/MapEntry$Builder;->build()Lcom/google/protobuf/MapEntry;

    move-result-object v1

    .line 227
    .local v1, "modpeData":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x1

    invoke-virtual {p1, v3, v1}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    goto :goto_0

    .line 229
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "modpeData":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getSkinBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 230
    const/4 v2, 0x2

    iget-object v3, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->skin_:Ljava/lang/Object;

    invoke-static {p1, v2, v3}, Lcom/google/protobuf/GeneratedMessage;->writeString(Lcom/google/protobuf/CodedOutputStream;ILjava/lang/Object;)V

    .line 232
    :cond_1
    iget v2, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    if-eqz v2, :cond_2

    .line 233
    const/4 v2, 0x3

    iget v3, p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->renderType_:I

    invoke-virtual {p1, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 235
    :cond_2
    return-void
.end method
