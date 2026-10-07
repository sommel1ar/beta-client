.class final Lorg/mozilla/javascript/regexp/GlobData;
.super Ljava/lang/Object;
.source "RegExpImpl.java"


# instance fields
.field arrayobj:Lorg/mozilla/javascript/Scriptable;

.field charBuf:Ljava/lang/StringBuilder;

.field dollar:I

.field global:Z

.field lambda:Lorg/mozilla/javascript/Function;

.field leftIndex:I

.field mode:I

.field repstr:Ljava/lang/String;

.field str:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 738
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 752
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/regexp/GlobData;->dollar:I

    return-void
.end method
