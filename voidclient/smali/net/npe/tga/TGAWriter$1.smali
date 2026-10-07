.class synthetic Lnet/npe/tga/TGAWriter$1;
.super Ljava/lang/Object;
.source "TGAWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/npe/tga/TGAWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$net$npe$tga$TGAWriter$EncodeType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 40
    invoke-static {}, Lnet/npe/tga/TGAWriter$EncodeType;->values()[Lnet/npe/tga/TGAWriter$EncodeType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lnet/npe/tga/TGAWriter$1;->$SwitchMap$net$npe$tga$TGAWriter$EncodeType:[I

    :try_start_0
    sget-object v0, Lnet/npe/tga/TGAWriter$1;->$SwitchMap$net$npe$tga$TGAWriter$EncodeType:[I

    sget-object v1, Lnet/npe/tga/TGAWriter$EncodeType;->RLE:Lnet/npe/tga/TGAWriter$EncodeType;

    invoke-virtual {v1}, Lnet/npe/tga/TGAWriter$EncodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lnet/npe/tga/TGAWriter$1;->$SwitchMap$net$npe$tga$TGAWriter$EncodeType:[I

    sget-object v1, Lnet/npe/tga/TGAWriter$EncodeType;->AUTO:Lnet/npe/tga/TGAWriter$EncodeType;

    invoke-virtual {v1}, Lnet/npe/tga/TGAWriter$EncodeType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
