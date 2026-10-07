.class public final Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;
.super Ljava/lang/Object;
.source "WorldDataProtobuf.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMeta;,
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$WorldMetaOrBuilder;,
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMeta;,
        Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$EntityMetaOrBuilder;
    }
.end annotation


# static fields
.field private static descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_ModpeDataEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_ModpeDataEntry_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_MetaEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_MetaEntry_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field private static internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1168
    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "\n\u0013world_data.protobuf\u0012\u001eio.mrarm.mcpelauncher.protobuf\"\u00ae\u0001\n\nEntityMeta\u0012L\n\tmodpeData\u0018\u0001 \u0003(\u000b29.io.mrarm.mcpelauncher.protobuf.EntityMeta.ModpeDataEntry\u0012\u000c\n\u0004skin\u0018\u0002 \u0001(\t\u0012\u0012\n\nrenderType\u0018\u0003 \u0001(\u0005\u001a0\n\u000eModpeDataEntry\u0012\u000b\n\u0003key\u0018\u0001 \u0001(\t\u0012\r\n\u0005value\u0018\u0002 \u0001(\t:\u00028\u0001\"\u00a7\u0001\n\tWorldMeta\u0012A\n\u0004meta\u0018\u0001 \u0003(\u000b23.io.mrarm.mcpelauncher.protobuf.WorldMeta.MetaEntry\u001aW\n\tMetaEntry\u0012\u000b\n\u0003key\u0018\u0001 \u0001(\u0003\u00129\n\u0005value\u0018\u0002 \u0001(\u000b2*.io.mrarm.mcpelauncher.protobuf.EntityMeta:\u00028\u0001"

    aput-object v2, v1, v6

    const-string v2, "b\u0006proto3"

    aput-object v2, v1, v7

    .line 1181
    .local v1, "descriptorData":[Ljava/lang/String;
    new-instance v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf$1;-><init>()V

    .line 1189
    .local v0, "assigner":Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;
    new-array v2, v6, [Lcom/google/protobuf/Descriptors$FileDescriptor;

    .line 1190
    invoke-static {v1, v2, v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->internalBuildGeneratedFileFrom([Ljava/lang/String;[Lcom/google/protobuf/Descriptors$FileDescriptor;Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;)V

    .line 1194
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 1195
    new-instance v2, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    sget-object v3, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "ModpeData"

    aput-object v5, v4, v6

    const-string v5, "Skin"

    aput-object v5, v4, v7

    const-string v5, "RenderType"

    aput-object v5, v4, v8

    invoke-direct {v2, v3, v4}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 1199
    sget-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 1200
    invoke-virtual {v2}, Lcom/google/protobuf/Descriptors$Descriptor;->getNestedTypes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_ModpeDataEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 1201
    new-instance v2, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    sget-object v3, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_ModpeDataEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    new-array v4, v8, [Ljava/lang/String;

    const-string v5, "Key"

    aput-object v5, v4, v6

    const-string v5, "Value"

    aput-object v5, v4, v7

    invoke-direct {v2, v3, v4}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_ModpeDataEntry_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 1206
    invoke-static {}, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 1207
    new-instance v2, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    sget-object v3, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "Meta"

    aput-object v5, v4, v6

    invoke-direct {v2, v3, v4}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 1211
    sget-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 1212
    invoke-virtual {v2}, Lcom/google/protobuf/Descriptors$Descriptor;->getNestedTypes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/Descriptors$Descriptor;

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_MetaEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 1213
    new-instance v2, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    sget-object v3, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_MetaEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    new-array v4, v8, [Ljava/lang/String;

    const-string v5, "Key"

    aput-object v5, v4, v6

    const-string v5, "Value"

    aput-object v5, v4, v7

    invoke-direct {v2, v3, v4}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    sput-object v2, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_MetaEntry_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 1217
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$100()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    return-object v0
.end method

.method static synthetic access$1500()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$1600()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    return-object v0
.end method

.method static synthetic access$1700()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_WorldMeta_MetaEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$200()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->internal_static_io_mrarm_mcpelauncher_protobuf_EntityMeta_ModpeDataEntry_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method static synthetic access$2602(Lcom/google/protobuf/Descriptors$FileDescriptor;)Lcom/google/protobuf/Descriptors$FileDescriptor;
    .locals 0
    .param p0, "x0"    # Lcom/google/protobuf/Descriptors$FileDescriptor;

    .prologue
    .line 6
    sput-object p0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

    return-object p0
.end method

.method public static getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;
    .locals 1

    .prologue
    .line 1163
    sget-object v0, Lio/mrarm/mcpelauncher/protobuf/WorldDataProtobuf;->descriptor:Lcom/google/protobuf/Descriptors$FileDescriptor;

    return-object v0
.end method

.method public static registerAllExtensions(Lcom/google/protobuf/ExtensionRegistry;)V
    .locals 0
    .param p0, "registry"    # Lcom/google/protobuf/ExtensionRegistry;

    .prologue
    .line 10
    return-void
.end method
