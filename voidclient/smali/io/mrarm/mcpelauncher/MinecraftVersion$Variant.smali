.class public final enum Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;
.super Ljava/lang/Enum;
.source "MinecraftVersion.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/MinecraftVersion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Variant"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

.field public static final enum ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

.field public static final enum X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    const-string v1, "ARMv7"

    invoke-direct {v0, v1, v2}, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    const-string v1, "X86"

    invoke-direct {v0, v1, v3}, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    .line 65
    const/4 v0, 0x2

    new-array v0, v0, [Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->ARMv7:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    aput-object v1, v0, v2

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->X86:Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    aput-object v1, v0, v3

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->$VALUES:[Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 65
    const-class v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    return-object v0
.end method

.method public static values()[Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->$VALUES:[Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    invoke-virtual {v0}, [Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/mrarm/mcpelauncher/MinecraftVersion$Variant;

    return-object v0
.end method
