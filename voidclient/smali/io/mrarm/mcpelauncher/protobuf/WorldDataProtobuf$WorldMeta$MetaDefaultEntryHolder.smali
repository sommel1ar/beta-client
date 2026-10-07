.class final Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;
.super Ljava/lang/Object;
.source "WorldDataProtobuf.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MetaDefaultEntryHolder"
.end annotation


# static fields
.field static final defaultEntry:Lcom/google/protobuf/MapEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapEntry",
            "<",
            "Ljava/lang/Long;",
            "Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 774
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->access$1700()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    sget-object v1, Lcom/google/protobuf/WireFormat$FieldType;->INT64:Lcom/google/protobuf/WireFormat$FieldType;

    const-wide/16 v2, 0x0

    .line 776
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v3, Lcom/google/protobuf/WireFormat$FieldType;->MESSAGE:Lcom/google/protobuf/WireFormat$FieldType;

    .line 778
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;->getDefaultInstance()Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;

    move-result-object v4

    .line 773
    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/protobuf/MapEntry;->newDefaultInstance(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;)Lcom/google/protobuf/MapEntry;

    move-result-object v0

    sput-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta$MetaDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/MapEntry;

    .line 771
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 769
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
