.class public Lorg/mozilla/javascript/tools/SourceReader;
.super Ljava/lang/Object;
.source "SourceReader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;
    .locals 14
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "convertToString"    # Z
    .param p2, "defaultEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-static {p0}, Lorg/mozilla/javascript/tools/SourceReader;->toUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v11

    .line 42
    .local v11, "url":Ljava/net/URL;
    const/4 v5, 0x0

    .line 43
    .local v5, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 48
    .local v0, "capacityHint":I
    if-nez v11, :cond_3

    .line 49
    :try_start_0
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .local v4, "file":Ljava/io/File;
    const/4 v3, 0x0

    .local v3, "encoding":Ljava/lang/String;
    move-object v1, v3

    .line 51
    .local v1, "contentType":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v12

    long-to-int v0, v12

    .line 52
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v5    # "is":Ljava/io/InputStream;
    .local v6, "is":Ljava/io/InputStream;
    move-object v5, v6

    .line 70
    .end local v1    # "contentType":Ljava/lang/Object;
    .end local v4    # "file":Ljava/io/File;
    .end local v6    # "is":Ljava/io/InputStream;
    .restart local v5    # "is":Ljava/io/InputStream;
    :cond_0
    :goto_0
    if-gtz v0, :cond_1

    .line 71
    const/16 v0, 0x1000

    .line 74
    :cond_1
    invoke-static {v5, v0}, Lorg/mozilla/javascript/Kit;->readStream(Ljava/io/InputStream;I)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 76
    .local v2, "data":[B
    if-eqz v5, :cond_2

    .line 77
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 82
    :cond_2
    if-nez p1, :cond_6

    .line 83
    move-object v8, v2

    .line 131
    :goto_1
    return-object v8

    .line 54
    .end local v2    # "data":[B
    .end local v3    # "encoding":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-virtual {v11}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v10

    .line 55
    .local v10, "uc":Ljava/net/URLConnection;
    invoke-virtual {v10}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 56
    if-eqz p1, :cond_4

    .line 57
    new-instance v7, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;

    invoke-virtual {v10}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v7, v12}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;-><init>(Ljava/lang/String;)V

    .line 58
    .local v7, "pct":Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;
    invoke-virtual {v7}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;->getContentType()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "contentType":Ljava/lang/String;
    invoke-virtual {v7}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;->getEncoding()Ljava/lang/String;

    move-result-object v3

    .line 64
    .end local v1    # "contentType":Ljava/lang/String;
    .end local v7    # "pct":Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;
    .restart local v3    # "encoding":Ljava/lang/String;
    :goto_2
    invoke-virtual {v10}, Ljava/net/URLConnection;->getContentLength()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    .line 66
    const/high16 v12, 0x100000

    if-le v0, v12, :cond_0

    .line 67
    const/4 v0, -0x1

    goto :goto_0

    .line 62
    .end local v3    # "encoding":Ljava/lang/String;
    :cond_4
    const/4 v3, 0x0

    .restart local v3    # "encoding":Ljava/lang/String;
    move-object v1, v3

    .local v1, "contentType":Ljava/lang/Object;
    goto :goto_2

    .line 76
    .end local v1    # "contentType":Ljava/lang/Object;
    .end local v3    # "encoding":Ljava/lang/String;
    .end local v10    # "uc":Ljava/net/URLConnection;
    :catchall_0
    move-exception v12

    if-eqz v5, :cond_5

    .line 77
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    :cond_5
    throw v12

    .line 85
    .restart local v2    # "data":[B
    .restart local v3    # "encoding":Ljava/lang/String;
    :cond_6
    if-nez v3, :cond_7

    .line 88
    array-length v12, v2

    const/4 v13, 0x3

    if-le v12, v13, :cond_9

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_9

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_9

    const/4 v12, 0x2

    aget-byte v12, v2, v12

    if-nez v12, :cond_9

    const/4 v12, 0x3

    aget-byte v12, v2, v12

    if-nez v12, :cond_9

    .line 89
    const-string v3, "UTF-32LE"

    .line 123
    :cond_7
    :goto_3
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 125
    .local v9, "strResult":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_8

    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const v13, 0xfeff

    if-ne v12, v13, :cond_8

    .line 127
    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 129
    :cond_8
    move-object v8, v9

    .local v8, "result":Ljava/lang/String;
    goto :goto_1

    .line 91
    .end local v8    # "result":Ljava/lang/String;
    .end local v9    # "strResult":Ljava/lang/String;
    :cond_9
    array-length v12, v2

    const/4 v13, 0x3

    if-le v12, v13, :cond_a

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    if-nez v12, :cond_a

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    if-nez v12, :cond_a

    const/4 v12, 0x2

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_a

    const/4 v12, 0x3

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_a

    .line 92
    const-string v3, "UTF-32BE"

    goto :goto_3

    .line 94
    :cond_a
    array-length v12, v2

    const/4 v13, 0x2

    if-le v12, v13, :cond_b

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/16 v13, -0x11

    if-ne v12, v13, :cond_b

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/16 v13, -0x45

    if-ne v12, v13, :cond_b

    const/4 v12, 0x2

    aget-byte v12, v2, v12

    const/16 v13, -0x41

    if-ne v12, v13, :cond_b

    .line 95
    const-string v3, "UTF-8"

    goto :goto_3

    .line 97
    :cond_b
    array-length v12, v2

    const/4 v13, 0x1

    if-le v12, v13, :cond_c

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_c

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_c

    .line 98
    const-string v3, "UTF-16LE"

    goto :goto_3

    .line 100
    :cond_c
    array-length v12, v2

    const/4 v13, 0x1

    if-le v12, v13, :cond_d

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_d

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_d

    .line 101
    const-string v3, "UTF-16BE"

    goto :goto_3

    .line 105
    :cond_d
    move-object/from16 v3, p2

    .line 106
    if-nez v3, :cond_7

    .line 108
    if-nez v11, :cond_e

    .line 110
    const-string v12, "file.encoding"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_3

    .line 112
    :cond_e
    if-eqz v1, :cond_f

    const-string v12, "application/"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_f

    .line 114
    const-string v3, "UTF-8"

    goto/16 :goto_3

    .line 118
    :cond_f
    const-string v3, "US-ASCII"

    goto/16 :goto_3
.end method

.method public static toUrl(Ljava/lang/String;)Ljava/net/URL;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 28
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 30
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    return-object v0

    .line 31
    :catch_0
    move-exception v0

    .line 35
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
