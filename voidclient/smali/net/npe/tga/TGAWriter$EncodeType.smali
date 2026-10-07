.class public final enum Lnet/npe/tga/TGAWriter$EncodeType;
.super Ljava/lang/Enum;
.source "TGAWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/npe/tga/TGAWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EncodeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lnet/npe/tga/TGAWriter$EncodeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnet/npe/tga/TGAWriter$EncodeType;

.field public static final enum AUTO:Lnet/npe/tga/TGAWriter$EncodeType;

.field public static final enum NONE:Lnet/npe/tga/TGAWriter$EncodeType;

.field public static final enum RLE:Lnet/npe/tga/TGAWriter$EncodeType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 21
    new-instance v0, Lnet/npe/tga/TGAWriter$EncodeType;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lnet/npe/tga/TGAWriter$EncodeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnet/npe/tga/TGAWriter$EncodeType;->NONE:Lnet/npe/tga/TGAWriter$EncodeType;

    .line 22
    new-instance v0, Lnet/npe/tga/TGAWriter$EncodeType;

    const-string v1, "RLE"

    invoke-direct {v0, v1, v3}, Lnet/npe/tga/TGAWriter$EncodeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnet/npe/tga/TGAWriter$EncodeType;->RLE:Lnet/npe/tga/TGAWriter$EncodeType;

    .line 23
    new-instance v0, Lnet/npe/tga/TGAWriter$EncodeType;

    const-string v1, "AUTO"

    invoke-direct {v0, v1, v4}, Lnet/npe/tga/TGAWriter$EncodeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnet/npe/tga/TGAWriter$EncodeType;->AUTO:Lnet/npe/tga/TGAWriter$EncodeType;

    .line 20
    const/4 v0, 0x3

    new-array v0, v0, [Lnet/npe/tga/TGAWriter$EncodeType;

    sget-object v1, Lnet/npe/tga/TGAWriter$EncodeType;->NONE:Lnet/npe/tga/TGAWriter$EncodeType;

    aput-object v1, v0, v2

    sget-object v1, Lnet/npe/tga/TGAWriter$EncodeType;->RLE:Lnet/npe/tga/TGAWriter$EncodeType;

    aput-object v1, v0, v3

    sget-object v1, Lnet/npe/tga/TGAWriter$EncodeType;->AUTO:Lnet/npe/tga/TGAWriter$EncodeType;

    aput-object v1, v0, v4

    sput-object v0, Lnet/npe/tga/TGAWriter$EncodeType;->$VALUES:[Lnet/npe/tga/TGAWriter$EncodeType;

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
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/npe/tga/TGAWriter$EncodeType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lnet/npe/tga/TGAWriter$EncodeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lnet/npe/tga/TGAWriter$EncodeType;

    return-object v0
.end method

.method public static values()[Lnet/npe/tga/TGAWriter$EncodeType;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lnet/npe/tga/TGAWriter$EncodeType;->$VALUES:[Lnet/npe/tga/TGAWriter$EncodeType;

    invoke-virtual {v0}, [Lnet/npe/tga/TGAWriter$EncodeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnet/npe/tga/TGAWriter$EncodeType;

    return-object v0
.end method
