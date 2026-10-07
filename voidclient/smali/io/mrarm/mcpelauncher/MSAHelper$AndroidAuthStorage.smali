.class Lio/mrarm/mcpelauncher/MSAHelper$AndroidAuthStorage;
.super Lio/mrarm/msa/AuthStorage;
.source "MSAHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/MSAHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AndroidAuthStorage"
.end annotation


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    invoke-direct {p0}, Lio/mrarm/msa/AuthStorage;-><init>()V

    .line 72
    iput-object p1, p0, Lio/mrarm/mcpelauncher/MSAHelper$AndroidAuthStorage;->context:Landroid/content/Context;

    .line 73
    return-void
.end method


# virtual methods
.method protected getFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 76
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lio/mrarm/mcpelauncher/MSAHelper$AndroidAuthStorage;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method
