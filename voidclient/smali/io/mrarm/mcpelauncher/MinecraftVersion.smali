.class public Lio/mrarm/mcpelauncher/MinecraftVersion;
.super Lio/mrarm/mcpelauncher/Version;
.source "MinecraftVersion.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;,
        Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;
    }
.end annotation


# static fields
.field static final lastMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

.field static final oldestMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

.field static versions:[Lio/mrarm/mcpelauncher/MinecraftVersion;


# instance fields
.field checksum:Ljava/lang/String;

.field supported:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

.field variant:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .prologue
    const/4 v4, 0x1

    const/16 v10, 0xa

    const/4 v5, -0x1

    const/16 v3, 0xf

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lio/mrarm/mcpelauncher/Version;

    invoke-direct {v0, v2, v3, v10, v5}, Lio/mrarm/mcpelauncher/Version;-><init>(IIII)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion;->lastMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    .line 6
    new-instance v0, Lio/mrarm/mcpelauncher/Version;

    invoke-direct {v0, v2, v3, v4, v5}, Lio/mrarm/mcpelauncher/Version;-><init>(IIII)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion;->oldestMinecraftVersionSupported:Lio/mrarm/mcpelauncher/Version;

    .line 8
    const/16 v0, 0x1a

    new-array v8, v0, [Lio/mrarm/mcpelauncher/MinecraftVersion;

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "0a0325cf5ad65d920043f0d6ce9dae8f"

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v2

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "0cf1a192c67cf4762f13a410a2c01584"

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v4

    const/4 v9, 0x2

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "90a6dce997304f8607eca4aee5cc5950"

    const/4 v4, 0x2

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/4 v9, 0x3

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "104f01ba337fa81b5cb51d17bce42e8c"

    const/4 v4, 0x2

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/4 v9, 0x4

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "97add444852fadc9553ba1cdc70b5422"

    const/4 v4, 0x2

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/4 v9, 0x5

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "35913def17a6ec366c28fcdf50bc0ea7"

    const/4 v4, 0x3

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/4 v9, 0x6

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "b1603e432fc611fac0106c94f643e368"

    const/4 v4, 0x3

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/4 v9, 0x7

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "cfb0d02ca72b688e201cd374dfd5e8af"

    const/4 v4, 0x3

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x8

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "970ef31bfa1abeeeefa717c3407b5386"

    const/4 v4, 0x4

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x9

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "0ce7efb8c0df37525a404e78084dcc1f"

    const/4 v4, 0x4

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "d84c5dd9a0fb32edbe62b697130d23c6"

    const/4 v4, 0x4

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v10

    const/16 v9, 0xb

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "03241e08318e66fb39f390f5ec6953e9"

    const/4 v4, 0x6

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0xc

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "7c9b3d1e5e951388cf6fb016306353e0"

    const/4 v4, 0x6

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0xd

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "95cc2dc29c783e9f9a5e169a72c0b614"

    const/4 v4, 0x6

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0xe

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "4f6270c0ee4e67759652bf6f6adb47f2"

    const/4 v4, 0x7

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "235e7629fbdc1c0adbce72e90ae8e147"

    const/4 v4, 0x7

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v3

    const/16 v9, 0x10

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "11155e666d23dc87aa2b1a5a5f5df8af"

    const/4 v4, 0x7

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x11

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "46ff047496c833899092368d2a021fd9"

    const/16 v4, 0x8

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x12

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "a9f4aeaeef70b008738407c1c981da94"

    const/16 v4, 0x8

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x13

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "3984c723f334261e7c2a3789fdc02607"

    const/16 v4, 0x8

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x14

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "f4cf86a33c17681d65191cd660c01233"

    const/16 v4, 0x9

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x15

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "45cc61a883ceec824222bb60edef7a7c"

    const/16 v4, 0x9

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x16

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "c2d67e4c545ab40236b250d5b23f2674"

    const/16 v4, 0x9

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x17

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "8cb7d324ed6f387ced42ebc752bd64c3"

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    move v4, v10

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x18

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "1f898dbc9f1a1465e05f5e9f7dd8a1ff"

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    move v4, v10

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    const/16 v9, 0x19

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion;

    const-string v1, "7c200e44f86095aca143045e0dff5e3f"

    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v7, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    move v4, v10

    invoke-direct/range {v0 .. v7}, Lio/mrarm/mcpelauncher/MinecraftVersion;-><init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V

    aput-object v0, v8, v9

    sput-object v8, Lio/mrarm/mcpelauncher/MinecraftVersion;->versions:[Lio/mrarm/mcpelauncher/MinecraftVersion;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;IIIILio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;)V
    .locals 0
    .param p1, "checksum"    # Ljava/lang/String;
    .param p2, "major"    # I
    .param p3, "minor"    # I
    .param p4, "build"    # I
    .param p5, "betaNum"    # I
    .param p6, "supported"    # Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;
    .param p7, "variant"    # Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    .prologue
    .line 77
    invoke-direct {p0, p2, p3, p4, p5}, Lio/mrarm/mcpelauncher/Version;-><init>(IIII)V

    .line 78
    iput-object p1, p0, Lio/mrarm/mcpelauncher/MinecraftVersion;->checksum:Ljava/lang/String;

    .line 79
    iput-object p6, p0, Lio/mrarm/mcpelauncher/MinecraftVersion;->supported:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    .line 80
    iput-object p7, p0, Lio/mrarm/mcpelauncher/MinecraftVersion;->variant:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    .line 81
    return-void
.end method

.method static getVersionForMD5Sum(Ljava/lang/String;)Lio/mrarm/mcpelauncher/MinecraftVersion;
    .locals 2
    .param p0, "sum"    # Ljava/lang/String;

    .prologue
    .line 58
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion;->versions:[Lio/mrarm/mcpelauncher/MinecraftVersion;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 59
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion;->versions:[Lio/mrarm/mcpelauncher/MinecraftVersion;

    aget-object v1, v1, v0

    iget-object v1, v1, Lio/mrarm/mcpelauncher/MinecraftVersion;->checksum:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion;->versions:[Lio/mrarm/mcpelauncher/MinecraftVersion;

    aget-object v1, v1, v0

    .line 62
    :goto_1
    return-object v1

    .line 58
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method
