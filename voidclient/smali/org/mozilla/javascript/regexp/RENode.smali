.class Lorg/mozilla/javascript/regexp/RENode;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field bmsize:I

.field chr:C

.field flatIndex:I

.field greedy:Z

.field index:I

.field kid:Lorg/mozilla/javascript/regexp/RENode;

.field kid2:Lorg/mozilla/javascript/regexp/RENode;

.field kidlen:I

.field length:I

.field max:I

.field min:I

.field next:Lorg/mozilla/javascript/regexp/RENode;

.field op:B

.field parenCount:I

.field parenIndex:I

.field sense:Z

.field startIndex:I


# direct methods
.method constructor <init>(B)V
    .locals 0
    .param p1, "op"    # B

    .prologue
    .line 2803
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2804
    iput-byte p1, p0, Lorg/mozilla/javascript/regexp/RENode;->op:B

    .line 2805
    return-void
.end method
