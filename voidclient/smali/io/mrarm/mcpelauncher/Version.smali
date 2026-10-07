.class public Lio/mrarm/mcpelauncher/Version;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/Version$InvalidVersionException;
    }
.end annotation


# instance fields
.field public betaNumber:I

.field public build:I

.field public major:I

.field public minor:I


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "build"    # I

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, -0x1

    iput v0, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    .line 18
    iput p1, p0, Lio/mrarm/mcpelauncher/Version;->major:I

    .line 19
    iput p2, p0, Lio/mrarm/mcpelauncher/Version;->minor:I

    .line 20
    iput p3, p0, Lio/mrarm/mcpelauncher/Version;->build:I

    .line 21
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 1
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "build"    # I
    .param p4, "betaNumber"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, -0x1

    iput v0, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    .line 11
    iput p1, p0, Lio/mrarm/mcpelauncher/Version;->major:I

    .line 12
    iput p2, p0, Lio/mrarm/mcpelauncher/Version;->minor:I

    .line 13
    iput p3, p0, Lio/mrarm/mcpelauncher/Version;->build:I

    .line 14
    iput p4, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1, "ver"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/mrarm/mcpelauncher/Version$InvalidVersionException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v2, -0x1

    iput v2, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    .line 24
    move-object v1, p1

    .line 25
    .local v1, "string":Ljava/lang/String;
    const-string v2, "\\."

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "split":[Ljava/lang/String;
    array-length v2, v0

    if-eq v2, v4, :cond_0

    array-length v2, v0

    if-eq v2, v6, :cond_0

    .line 27
    new-instance v2, Lio/mrarm/mcpelauncher/Version$InvalidVersionException;

    invoke-direct {v2, p1}, Lio/mrarm/mcpelauncher/Version$InvalidVersionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 28
    :cond_0
    aget-object v2, v0, v3

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lio/mrarm/mcpelauncher/Version;->major:I

    .line 29
    aget-object v2, v0, v5

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lio/mrarm/mcpelauncher/Version;->minor:I

    .line 30
    const/4 v2, 0x2

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lio/mrarm/mcpelauncher/Version;->build:I

    .line 31
    array-length v2, v0

    if-lt v2, v6, :cond_1

    aget-object v2, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x62

    if-ne v2, v3, :cond_1

    .line 32
    aget-object v2, v0, v4

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    .line 34
    :cond_1
    return-void
.end method


# virtual methods
.method public isNewerThan(Lio/mrarm/mcpelauncher/Version;)Z
    .locals 5
    .param p1, "ver"    # Lio/mrarm/mcpelauncher/Version;

    .prologue
    const/4 v4, -0x1

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 37
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->major:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->major:I

    if-le v2, v3, :cond_1

    .line 53
    :cond_0
    :goto_0
    return v0

    .line 39
    :cond_1
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->major:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->major:I

    if-ge v2, v3, :cond_2

    move v0, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->minor:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->minor:I

    if-gt v2, v3, :cond_0

    .line 43
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->minor:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->minor:I

    if-ge v2, v3, :cond_3

    move v0, v1

    .line 44
    goto :goto_0

    .line 45
    :cond_3
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->build:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->build:I

    if-gt v2, v3, :cond_0

    .line 47
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->build:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->build:I

    if-ge v2, v3, :cond_4

    move v0, v1

    .line 48
    goto :goto_0

    .line 49
    :cond_4
    iget v2, p1, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    if-ne v2, v4, :cond_5

    move v0, v1

    .line 50
    goto :goto_0

    .line 51
    :cond_5
    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    if-eq v2, v4, :cond_0

    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    iget v3, p1, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    if-gt v2, v3, :cond_0

    move v0, v1

    .line 53
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lio/mrarm/mcpelauncher/Version;->major:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lio/mrarm/mcpelauncher/Version;->minor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lio/mrarm/mcpelauncher/Version;->build:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "b"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lio/mrarm/mcpelauncher/Version;->betaNumber:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
