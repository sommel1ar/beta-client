.class public Lio/mrarm/mcpelauncher/BackupVersionManager;
.super Ljava/lang/Object;
.source "BackupVersionManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createBackupVersion(Landroid/content/Context;ILandroid/content/res/AssetManager;[Ljava/io/File;)V
    .locals 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mcpeVersion"    # I
    .param p2, "assets"    # Landroid/content/res/AssetManager;
    .param p3, "libs"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    const-string v11, "BackupVersionManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Creating backup version for version "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    invoke-static {}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v4

    .line 126
    .local v4, "digest":Ljava/security/MessageDigest;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 127
    .local v8, "fileStream":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/security/DigestOutputStream;

    invoke-direct {v5, v8, v4}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 128
    .local v5, "digestStream":Ljava/security/DigestOutputStream;
    new-instance v10, Ljava/util/zip/ZipOutputStream;

    new-instance v11, Ljava/io/BufferedOutputStream;

    invoke-direct {v11, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v10, v11}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 129
    .local v10, "zipStream":Ljava/util/zip/ZipOutputStream;
    const-string v11, "BackupVersionManager"

    const-string v12, "Writing libs..."

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    move-object/from16 v0, p3

    array-length v12, v0

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v12, :cond_1

    aget-object v7, p3, v11

    .line 132
    .local v7, "file":Ljava/io/File;
    :try_start_0
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 133
    .local v9, "input":Ljava/io/FileInputStream;
    new-instance v6, Ljava/util/zip/ZipEntry;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "libs/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 134
    .local v6, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v10, v6}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 136
    const/high16 v13, 0x100000

    new-array v1, v13, [B

    .line 137
    .local v1, "buffer":[B
    :goto_1
    const/4 v13, 0x0

    const/high16 v14, 0x100000

    invoke-virtual {v9, v1, v13, v14}, Ljava/io/FileInputStream;->read([BII)I

    move-result v2

    .local v2, "count":I
    const/4 v13, -0x1

    if-eq v2, v13, :cond_0

    .line 138
    const/4 v13, 0x0

    invoke-virtual {v10, v1, v13, v2}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_1

    .line 141
    .end local v1    # "buffer":[B
    .end local v2    # "count":I
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v9    # "input":Ljava/io/FileInputStream;
    :catch_0
    move-exception v13

    .line 130
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 140
    .restart local v1    # "buffer":[B
    .restart local v2    # "count":I
    .restart local v6    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v9    # "input":Ljava/io/FileInputStream;
    :cond_0
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 145
    .end local v1    # "buffer":[B
    .end local v2    # "count":I
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "file":Ljava/io/File;
    .end local v9    # "input":Ljava/io/FileInputStream;
    :cond_1
    if-eqz p2, :cond_2

    .line 146
    const-string v11, "BackupVersionManager"

    const-string v12, "Writing assets..."

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    const-string v11, ""

    move-object/from16 v0, p2

    invoke-static {v10, v0, v11}, Lio/mrarm/mcpelauncher/BackupVersionManager;->storeAssetFiles(Ljava/util/zip/ZipOutputStream;Landroid/content/res/AssetManager;Ljava/lang/String;)V

    .line 149
    :cond_2
    invoke-virtual {v10}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 150
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 152
    const-string v11, "BackupVersionManager"

    const-string v12, "Writing meta/hash file..."

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    new-instance v8, Ljava/io/FileOutputStream;

    .end local v8    # "fileStream":Ljava/io/FileOutputStream;
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionHashFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 155
    .restart local v8    # "fileStream":Ljava/io/FileOutputStream;
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v8}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 156
    .local v3, "dataStream":Ljava/io/DataOutputStream;
    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 157
    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 158
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/io/DataOutputStream;->write([B)V

    .line 159
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 161
    const-string v11, "BackupVersionManager"

    const-string v12, "Wrote backup!"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    return-void
.end method

.method public static createBackupVersion(Landroid/content/Context;ILjava/lang/String;)V
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mcpeVersion"    # I
    .param p2, "apkPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    const-string v10, "BackupVersionManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Creating backup version for version "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-static {}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v5

    .line 97
    .local v5, "digest":Ljava/security/MessageDigest;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v10

    invoke-direct {v8, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 98
    .local v8, "fileOutput":Ljava/io/FileOutputStream;
    new-instance v6, Ljava/security/DigestOutputStream;

    invoke-direct {v6, v8, v5}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 99
    .local v6, "digestStream":Ljava/security/DigestOutputStream;
    new-instance v2, Ljava/io/BufferedOutputStream;

    invoke-direct {v2, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 100
    .local v2, "bufferedOutput":Ljava/io/BufferedOutputStream;
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, p2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 101
    .local v7, "fileInput":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 102
    .local v1, "bufferedInput":Ljava/io/BufferedInputStream;
    const/high16 v10, 0x100000

    new-array v0, v10, [B

    .line 104
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v3

    .local v3, "c":I
    const/4 v10, -0x1

    if-eq v3, v10, :cond_0

    .line 105
    const/4 v10, 0x0

    invoke-virtual {v2, v0, v10, v3}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_0

    .line 107
    :cond_0
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 108
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V

    .line 110
    const-string v10, "BackupVersionManager"

    const-string v11, "Writing meta/hash file..."

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionHashFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 113
    .local v9, "fileStream":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/DataOutputStream;

    invoke-direct {v4, v9}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 114
    .local v4, "dataStream":Ljava/io/DataOutputStream;
    const/4 v10, 0x0

    invoke-virtual {v4, v10}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 115
    invoke-virtual {v4, p1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 116
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/io/DataOutputStream;->write([B)V

    .line 117
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 119
    const-string v10, "BackupVersionManager"

    const-string v11, "Wrote backup!"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    return-void
.end method

.method public static deleteBackupLibraries(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 228
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getTemporaryLibrariesDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 229
    .local v0, "outputDirectory":Ljava/io/File;
    invoke-static {v0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->deleteRecursively(Ljava/io/File;)V

    .line 230
    return-void
.end method

.method private static deleteRecursively(Ljava/io/File;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 219
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 220
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 221
    .local v0, "f":Ljava/io/File;
    invoke-static {v0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->deleteRecursively(Ljava/io/File;)V

    .line 220
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 224
    .end local v0    # "f":Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 225
    return-void
.end method

.method public static extractBackupLibraries(Landroid/content/Context;Ljava/util/zip/ZipFile;)V
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "file"    # Ljava/util/zip/ZipFile;

    .prologue
    .line 190
    const-string v9, "BackupVersionManager"

    const-string v10, "Extracting libraries..."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    const-string v7, "libs/"

    .line 193
    .local v7, "prefix":Ljava/lang/String;
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getTemporaryLibrariesDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v6

    .line 195
    .local v6, "outputDirectory":Ljava/io/File;
    const/high16 v9, 0x100000

    new-array v0, v9, [B

    .line 197
    .local v0, "buffer":[B
    invoke-virtual {p1}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v2

    .line 198
    .local v2, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 199
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/zip/ZipEntry;

    .line 200
    .local v3, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 202
    :try_start_0
    invoke-virtual {p1, v3}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v4

    .line 203
    .local v4, "input":Ljava/io/InputStream;
    new-instance v8, Ljava/io/FileOutputStream;

    new-instance v9, Ljava/io/File;

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v6, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 205
    .local v8, "stream":Ljava/io/FileOutputStream;
    :goto_1
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .local v5, "n":I
    if-lez v5, :cond_1

    .line 206
    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v5}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 210
    .end local v4    # "input":Ljava/io/InputStream;
    .end local v5    # "n":I
    .end local v8    # "stream":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v1

    .line 211
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 208
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "input":Ljava/io/InputStream;
    .restart local v5    # "n":I
    .restart local v8    # "stream":Ljava/io/FileOutputStream;
    :cond_1
    :try_start_1
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 209
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 215
    .end local v3    # "entry":Ljava/util/zip/ZipEntry;
    .end local v4    # "input":Ljava/io/InputStream;
    .end local v5    # "n":I
    .end local v8    # "stream":Ljava/io/FileOutputStream;
    :cond_2
    const-string v9, "BackupVersionManager"

    const-string v10, "Extracted libraries!"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    return-void
.end method

.method private static getBackupFileChecksum(Landroid/content/Context;)[B
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v2, Ljava/io/FileInputStream;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 81
    .local v2, "input":Ljava/io/InputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 82
    .local v0, "buffer":[B
    invoke-static {}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    .line 85
    .local v1, "digest":Ljava/security/MessageDigest;
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "n":I
    if-lez v3, :cond_0

    .line 86
    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 90
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    return-object v4
.end method

.method public static getBackupVersionFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, "failsafe_version.data"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getBackupVersionHashFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, "failsafe_version.meta"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getMessageDigest()Ljava/security/MessageDigest;
    .locals 3

    .prologue
    .line 71
    :try_start_0
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "ex":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "MessageDigest does not support MD5!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getTemporaryLibrariesDirectory(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "failsafe_libs"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 39
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 41
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 42
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 43
    :cond_1
    return-object v0
.end method

.method public static hasBackupVersion(Landroid/content/Context;I)Z
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mcpeVersion"    # I

    .prologue
    const/4 v6, 0x0

    .line 48
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionHashFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 49
    .local v5, "input":Ljava/io/FileInputStream;
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, v5}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 50
    .local v2, "dataInput":Ljava/io/DataInputStream;
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 51
    .local v4, "fileVersion":I
    if-eqz v4, :cond_1

    .line 52
    const-string v7, "BackupVersionManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Internal hash file version: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .end local v2    # "dataInput":Ljava/io/DataInputStream;
    .end local v4    # "fileVersion":I
    .end local v5    # "input":Ljava/io/FileInputStream;
    :cond_0
    :goto_0
    return v6

    .line 55
    .restart local v2    # "dataInput":Ljava/io/DataInputStream;
    .restart local v4    # "fileVersion":I
    .restart local v5    # "input":Ljava/io/FileInputStream;
    :cond_1
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 56
    .local v3, "fileMcpeVersion":I
    if-eq v3, p1, :cond_2

    const/4 v7, -0x1

    if-ne p1, v7, :cond_0

    .line 58
    :cond_2
    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupFileChecksum(Landroid/content/Context;)[B

    move-result-object v0

    .line 59
    .local v0, "checksumActual":[B
    array-length v7, v0

    new-array v1, v7, [B

    .line 60
    .local v1, "checksumFile":[B
    invoke-virtual {v2, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 61
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    .line 62
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    goto :goto_0

    .line 63
    .end local v0    # "checksumActual":[B
    .end local v1    # "checksumFile":[B
    .end local v2    # "dataInput":Ljava/io/DataInputStream;
    .end local v3    # "fileMcpeVersion":I
    .end local v4    # "fileVersion":I
    .end local v5    # "input":Ljava/io/FileInputStream;
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method public static openBackupFile(Landroid/content/Context;)Ljava/util/zip/ZipFile;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    new-instance v0, Ljava/util/zip/ZipFile;

    invoke-static {p0}, Lio/mrarm/mcpelauncher/BackupVersionManager;->getBackupVersionFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method private static storeAssetFiles(Ljava/util/zip/ZipOutputStream;Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 12
    .param p0, "stream"    # Ljava/util/zip/ZipOutputStream;
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v8, 0x10000

    const/4 v7, 0x0

    .line 165
    new-array v0, v8, [B

    .line 167
    .local v0, "buffer":[B
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    array-length v10, v9

    move v8, v7

    :goto_0
    if-ge v8, v10, :cond_2

    aget-object v4, v9, v8

    .line 168
    .local v4, "file":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    const-string v7, "/"

    :goto_1
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 169
    .local v5, "fullPath":Ljava/lang/String;
    invoke-static {p0, p1, v5}, Lio/mrarm/mcpelauncher/BackupVersionManager;->storeAssetFiles(Ljava/util/zip/ZipOutputStream;Landroid/content/res/AssetManager;Ljava/lang/String;)V

    .line 171
    :try_start_0
    invoke-virtual {p1, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 172
    .local v6, "input":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 173
    .local v1, "buffered":Ljava/io/BufferedInputStream;
    new-instance v3, Ljava/util/zip/ZipEntry;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "assets/"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 174
    .local v3, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {p0, v3}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 176
    :goto_2
    const/4 v7, 0x0

    const/high16 v11, 0x10000

    invoke-virtual {v1, v0, v7, v11}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v2

    .local v2, "count":I
    const/4 v7, -0x1

    if-eq v2, v7, :cond_0

    .line 177
    const/4 v7, 0x0

    invoke-virtual {p0, v0, v7, v2}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 179
    .end local v1    # "buffered":Ljava/io/BufferedInputStream;
    .end local v2    # "count":I
    .end local v3    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "input":Ljava/io/InputStream;
    :catch_0
    move-exception v7

    .line 167
    :cond_0
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    goto :goto_0

    .line 168
    .end local v5    # "fullPath":Ljava/lang/String;
    :cond_1
    const-string v7, ""

    goto :goto_1

    .line 183
    .end local v4    # "file":Ljava/lang/String;
    :cond_2
    return-void
.end method
