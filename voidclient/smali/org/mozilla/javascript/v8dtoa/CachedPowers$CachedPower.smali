.class Lorg/mozilla/javascript/v8dtoa/CachedPowers$CachedPower;
.super Ljava/lang/Object;
.source "CachedPowers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/v8dtoa/CachedPowers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CachedPower"
.end annotation


# instance fields
.field binaryExponent:S

.field decimalExponent:S

.field significand:J


# direct methods
.method constructor <init>(JSS)V
    .locals 1
    .param p1, "significand"    # J
    .param p3, "binaryExponent"    # S
    .param p4, "decimalExponent"    # S

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-wide p1, p0, Lorg/mozilla/javascript/v8dtoa/CachedPowers$CachedPower;->significand:J

    .line 45
    iput-short p3, p0, Lorg/mozilla/javascript/v8dtoa/CachedPowers$CachedPower;->binaryExponent:S

    .line 46
    iput-short p4, p0, Lorg/mozilla/javascript/v8dtoa/CachedPowers$CachedPower;->decimalExponent:S

    .line 47
    return-void
.end method
