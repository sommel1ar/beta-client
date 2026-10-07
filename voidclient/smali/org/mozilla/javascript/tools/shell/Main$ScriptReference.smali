.class Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;
.super Ljava/lang/ref/SoftReference;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/shell/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ScriptReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/SoftReference",
        "<",
        "Lorg/mozilla/javascript/Script;",
        ">;"
    }
.end annotation


# instance fields
.field digest:[B

.field path:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;[BLorg/mozilla/javascript/Script;Ljava/lang/ref/ReferenceQueue;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "digest"    # [B
    .param p3, "script"    # Lorg/mozilla/javascript/Script;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Lorg/mozilla/javascript/Script;",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lorg/mozilla/javascript/Script;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 711
    .local p4, "queue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Lorg/mozilla/javascript/Script;>;"
    invoke-direct {p0, p3, p4}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 712
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;->path:Ljava/lang/String;

    .line 713
    iput-object p2, p0, Lorg/mozilla/javascript/tools/shell/Main$ScriptReference;->digest:[B

    .line 714
    return-void
.end method
