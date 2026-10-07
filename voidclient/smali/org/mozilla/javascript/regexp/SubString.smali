.class public Lorg/mozilla/javascript/regexp/SubString;
.super Ljava/lang/Object;
.source "SubString.java"


# static fields
.field public static final emptySubString:Lorg/mozilla/javascript/regexp/SubString;


# instance fields
.field index:I

.field length:I

.field str:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    new-instance v0, Lorg/mozilla/javascript/regexp/SubString;

    invoke-direct {v0}, Lorg/mozilla/javascript/regexp/SubString;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/regexp/SubString;->emptySubString:Lorg/mozilla/javascript/regexp/SubString;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "len"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    .line 28
    iput p2, p0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 29
    iput p3, p0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    .line 30
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 34
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    iget v2, p0, Lorg/mozilla/javascript/regexp/SubString;->index:I

    iget v3, p0, Lorg/mozilla/javascript/regexp/SubString;->length:I

    add-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
