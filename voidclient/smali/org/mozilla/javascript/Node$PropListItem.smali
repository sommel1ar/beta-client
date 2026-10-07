.class Lorg/mozilla/javascript/Node$PropListItem;
.super Ljava/lang/Object;
.source "Node.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/Node;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PropListItem"
.end annotation


# instance fields
.field intValue:I

.field next:Lorg/mozilla/javascript/Node$PropListItem;

.field objectValue:Ljava/lang/Object;

.field type:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/mozilla/javascript/Node$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/mozilla/javascript/Node$1;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/mozilla/javascript/Node$PropListItem;-><init>()V

    return-void
.end method
