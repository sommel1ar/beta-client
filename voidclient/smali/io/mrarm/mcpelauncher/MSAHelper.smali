.class public Lio/mrarm/mcpelauncher/MSAHelper;
.super Ljava/lang/Object;
.source "MSAHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/MSAHelper$AndroidAuthStorage;
    }
.end annotation


# static fields
.field private static lastAccount:Ljava/lang/String;

.field private static lastAccountRead:Z

.field private static msa:Lio/mrarm/msa/MSA;

.field private static msaContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-boolean v0, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccountRead:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLastAccount(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 32
    sget-boolean v4, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccountRead:Z

    if-eqz v4, :cond_0

    .line 33
    sget-object v3, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccount:Ljava/lang/String;

    .line 46
    :goto_0
    return-object v3

    .line 34
    :cond_0
    invoke-static {p0}, Lio/mrarm/mcpelauncher/MSAHelper;->getLastAccountFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 35
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 36
    sput-boolean v5, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccountRead:Z

    .line 37
    sput-object v3, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccount:Ljava/lang/String;

    goto :goto_0

    .line 41
    :cond_1
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 42
    .local v1, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccount:Ljava/lang/String;

    .line 43
    const/4 v4, 0x1

    sput-boolean v4, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccountRead:Z

    .line 44
    sget-object v3, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccount:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 45
    .end local v1    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 46
    .local v2, "t":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method private static getLastAccountFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 28
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "xbox_live_account.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getMSA(Landroid/content/Context;)Lio/mrarm/msa/MSA;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    sget-object v0, Lio/mrarm/mcpelauncher/MSAHelper;->msa:Lio/mrarm/msa/MSA;

    if-eqz v0, :cond_0

    sget-object v0, Lio/mrarm/mcpelauncher/MSAHelper;->msaContext:Landroid/content/Context;

    if-eq v0, p0, :cond_1

    .line 23
    :cond_0
    new-instance v0, Lio/mrarm/msa/MSA;

    new-instance v1, Lio/mrarm/mcpelauncher/MSAHelper$AndroidAuthStorage;

    invoke-direct {v1, p0}, Lio/mrarm/mcpelauncher/MSAHelper$AndroidAuthStorage;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v1}, Lio/mrarm/msa/MSA;-><init>(Lio/mrarm/msa/AuthStorage;)V

    sput-object v0, Lio/mrarm/mcpelauncher/MSAHelper;->msa:Lio/mrarm/msa/MSA;

    .line 24
    :cond_1
    sget-object v0, Lio/mrarm/mcpelauncher/MSAHelper;->msa:Lio/mrarm/msa/MSA;

    return-object v0
.end method

.method public static setLastAccount(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "acc"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-static {p0}, Lio/mrarm/mcpelauncher/MSAHelper;->getLastAccountFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 52
    .local v0, "f":Ljava/io/File;
    sput-object p1, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccount:Ljava/lang/String;

    .line 53
    const/4 v2, 0x1

    sput-boolean v2, Lio/mrarm/mcpelauncher/MSAHelper;->lastAccountRead:Z

    .line 54
    if-nez p1, :cond_0

    .line 55
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 65
    :goto_0
    return-void

    .line 58
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 59
    .local v1, "writer":Ljava/io/BufferedWriter;
    invoke-virtual {v1, p1}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 60
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/io/BufferedWriter;->append(C)Ljava/io/Writer;

    .line 61
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 62
    .end local v1    # "writer":Ljava/io/BufferedWriter;
    :catch_0
    move-exception v2

    goto :goto_0
.end method
