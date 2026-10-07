.class Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;
.super Ljava/lang/Object;
.source "Block.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/modpe/api/Block;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextureDef"
.end annotation


# instance fields
.field public textureIds:[I

.field public textures:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;[I)V
    .locals 0
    .param p1, "textures"    # [Ljava/lang/String;
    .param p2, "textureIds"    # [I

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;->textures:[Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lio/mrarm/mcpelauncher/modpe/api/Block$TextureDef;->textureIds:[I

    .line 19
    return-void
.end method
