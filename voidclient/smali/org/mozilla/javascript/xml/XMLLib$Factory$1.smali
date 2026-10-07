.class final Lorg/mozilla/javascript/xml/XMLLib$Factory$1;
.super Lorg/mozilla/javascript/xml/XMLLib$Factory;
.source "XMLLib.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/xml/XMLLib$Factory;->create(Ljava/lang/String;)Lorg/mozilla/javascript/xml/XMLLib$Factory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$className:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lorg/mozilla/javascript/xml/XMLLib$Factory$1;->val$className:Ljava/lang/String;

    invoke-direct {p0}, Lorg/mozilla/javascript/xml/XMLLib$Factory;-><init>()V

    return-void
.end method


# virtual methods
.method public getImplementationClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lorg/mozilla/javascript/xml/XMLLib$Factory$1;->val$className:Ljava/lang/String;

    return-object v0
.end method
