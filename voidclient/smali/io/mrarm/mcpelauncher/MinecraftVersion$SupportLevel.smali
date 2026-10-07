.class public final enum Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;
.super Ljava/lang/Enum;
.source "MinecraftVersion.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/MinecraftVersion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SupportLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

.field public static final enum FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

.field public static final enum NONE:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

.field public static final enum PARTIAL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->NONE:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    const-string v1, "PARTIAL"

    invoke-direct {v0, v1, v3}, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->PARTIAL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    new-instance v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    const-string v1, "FULL"

    invoke-direct {v0, v1, v4}, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    .line 68
    const/4 v0, 0x3

    new-array v0, v0, [Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->NONE:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    aput-object v1, v0, v2

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->PARTIAL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    aput-object v1, v0, v3

    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->FULL:Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    aput-object v1, v0, v4

    sput-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->$VALUES:[Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

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
    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    const-class v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    return-object v0
.end method

.method public static values()[Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->$VALUES:[Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    invoke-virtual {v0}, [Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/mrarm/mcpelauncher/MinecraftVersion$SupportLevel;

    return-object v0
.end method
