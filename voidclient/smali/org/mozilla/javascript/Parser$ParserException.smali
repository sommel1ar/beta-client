.class Lorg/mozilla/javascript/Parser$ParserException;
.super Ljava/lang/RuntimeException;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParserException"
.end annotation


# static fields
.field static final serialVersionUID:J = 0x51a321bffed3d5feL


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/mozilla/javascript/Parser$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/mozilla/javascript/Parser$1;

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/mozilla/javascript/Parser$ParserException;-><init>()V

    return-void
.end method
