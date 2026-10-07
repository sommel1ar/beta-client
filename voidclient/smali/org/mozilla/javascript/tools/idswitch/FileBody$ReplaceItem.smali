.class Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;
.super Ljava/lang/Object;
.source "FileBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/idswitch/FileBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReplaceItem"
.end annotation


# instance fields
.field begin:I

.field end:I

.field next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

.field replacement:Ljava/lang/String;


# direct methods
.method constructor <init>(IILjava/lang/String;)V
    .locals 0
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput p1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->begin:I

    .line 22
    iput p2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->end:I

    .line 23
    iput-object p3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->replacement:Ljava/lang/String;

    .line 24
    return-void
.end method
