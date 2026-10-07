.class public final Lorg/mozilla/javascript/UniqueTag;
.super Ljava/lang/Object;
.source "UniqueTag.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

.field private static final ID_DOUBLE_MARK:I = 0x3

.field private static final ID_NOT_FOUND:I = 0x1

.field private static final ID_NULL_VALUE:I = 0x2

.field public static final NOT_FOUND:Lorg/mozilla/javascript/UniqueTag;

.field public static final NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

.field static final serialVersionUID:J = -0x3bf5b38ae836196bL


# instance fields
.field private final tagId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 32
    new-instance v0, Lorg/mozilla/javascript/UniqueTag;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/UniqueTag;-><init>(I)V

    sput-object v0, Lorg/mozilla/javascript/UniqueTag;->NOT_FOUND:Lorg/mozilla/javascript/UniqueTag;

    .line 38
    new-instance v0, Lorg/mozilla/javascript/UniqueTag;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/UniqueTag;-><init>(I)V

    sput-object v0, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    .line 45
    new-instance v0, Lorg/mozilla/javascript/UniqueTag;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/UniqueTag;-><init>(I)V

    sput-object v0, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 0
    .param p1, "tagId"    # I

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput p1, p0, Lorg/mozilla/javascript/UniqueTag;->tagId:I

    .line 52
    return-void
.end method


# virtual methods
.method public readResolve()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 56
    iget v0, p0, Lorg/mozilla/javascript/UniqueTag;->tagId:I

    packed-switch v0, :pswitch_data_0

    .line 64
    new-instance v0, Ljava/lang/IllegalStateException;

    iget v1, p0, Lorg/mozilla/javascript/UniqueTag;->tagId:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :pswitch_0
    sget-object v0, Lorg/mozilla/javascript/UniqueTag;->NOT_FOUND:Lorg/mozilla/javascript/UniqueTag;

    .line 62
    :goto_0
    return-object v0

    .line 60
    :pswitch_1
    sget-object v0, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    goto :goto_0

    .line 62
    :pswitch_2
    sget-object v0, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    goto :goto_0

    .line 56
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 72
    iget v1, p0, Lorg/mozilla/javascript/UniqueTag;->tagId:I

    packed-switch v1, :pswitch_data_0

    .line 83
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 74
    :pswitch_0
    const-string v0, "NOT_FOUND"

    .line 85
    .local v0, "name":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 77
    .end local v0    # "name":Ljava/lang/String;
    :pswitch_1
    const-string v0, "NULL_VALUE"

    .line 78
    .restart local v0    # "name":Ljava/lang/String;
    goto :goto_0

    .line 80
    .end local v0    # "name":Ljava/lang/String;
    :pswitch_2
    const-string v0, "DOUBLE_MARK"

    .line 81
    .restart local v0    # "name":Ljava/lang/String;
    goto :goto_0

    .line 72
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
