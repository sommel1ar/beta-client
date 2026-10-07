.class public final Lnet/npe/tga/TGAReader$Order;
.super Ljava/lang/Object;
.source "TGAReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/npe/tga/TGAReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Order"
.end annotation


# instance fields
.field public alphaShift:I

.field public blueShift:I

.field public greenShift:I

.field public redShift:I


# direct methods
.method constructor <init>(IIII)V
    .locals 0
    .param p1, "redShift"    # I
    .param p2, "greenShift"    # I
    .param p3, "blueShift"    # I
    .param p4, "alphaShift"    # I

    .prologue
    .line 535
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 536
    iput p1, p0, Lnet/npe/tga/TGAReader$Order;->redShift:I

    .line 537
    iput p2, p0, Lnet/npe/tga/TGAReader$Order;->greenShift:I

    .line 538
    iput p3, p0, Lnet/npe/tga/TGAReader$Order;->blueShift:I

    .line 539
    iput p4, p0, Lnet/npe/tga/TGAReader$Order;->alphaShift:I

    .line 540
    return-void
.end method
