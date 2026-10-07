.class Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;
.super Ljava/lang/Object;
.source "Codegen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/optimizer/BodyCodegen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FinallyReturnPoint"
.end annotation


# instance fields
.field public jsrPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public tableLabel:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 5491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5492
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    .line 5493
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    return-void
.end method
