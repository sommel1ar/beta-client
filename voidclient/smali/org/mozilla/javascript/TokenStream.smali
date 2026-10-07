.class Lorg/mozilla/javascript/TokenStream;
.super Ljava/lang/Object;
.source "TokenStream.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final BYTE_ORDER_MARK:C = '\ufeff'

.field private static final EOF_CHAR:I = -0x1


# instance fields
.field private allStrings:Lorg/mozilla/javascript/ObjToIntMap;

.field private commentCursor:I

.field private commentPrefix:Ljava/lang/String;

.field commentType:Lorg/mozilla/javascript/Token$CommentType;

.field cursor:I

.field private dirtyLine:Z

.field private hitEOF:Z

.field private isHex:Z

.field private isOctal:Z

.field private lineEndChar:I

.field private lineStart:I

.field lineno:I

.field private number:D

.field private parser:Lorg/mozilla/javascript/Parser;

.field private quoteChar:I

.field regExpFlags:Ljava/lang/String;

.field private sourceBuffer:[C

.field sourceCursor:I

.field private sourceEnd:I

.field private sourceReader:Ljava/io/Reader;

.field private sourceString:Ljava/lang/String;

.field private string:Ljava/lang/String;

.field private stringBuffer:[C

.field private stringBufferTop:I

.field tokenBeg:I

.field tokenEnd:I

.field private final ungetBuffer:[I

.field private ungetCursor:I

.field private xmlIsAttribute:Z

.field private xmlIsTagContent:Z

.field private xmlOpenTagsCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lorg/mozilla/javascript/TokenStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/mozilla/javascript/TokenStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/mozilla/javascript/Parser;Ljava/io/Reader;Ljava/lang/String;I)V
    .locals 4
    .param p1, "parser"    # Lorg/mozilla/javascript/Parser;
    .param p2, "sourceReader"    # Ljava/io/Reader;
    .param p3, "sourceString"    # Ljava/lang/String;
    .param p4, "lineno"    # I

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1614
    const-string v0, ""

    iput-object v0, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1622
    const/16 v0, 0x80

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    .line 1624
    new-instance v0, Lorg/mozilla/javascript/ObjToIntMap;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    iput-object v0, p0, Lorg/mozilla/javascript/TokenStream;->allStrings:Lorg/mozilla/javascript/ObjToIntMap;

    .line 1627
    const/4 v0, 0x3

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    .line 1630
    iput-boolean v2, p0, Lorg/mozilla/javascript/TokenStream;->hitEOF:Z

    .line 1632
    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    .line 1633
    iput v3, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1664
    const-string v0, ""

    iput-object v0, p0, Lorg/mozilla/javascript/TokenStream;->commentPrefix:Ljava/lang/String;

    .line 1665
    iput v3, p0, Lorg/mozilla/javascript/TokenStream;->commentCursor:I

    .line 38
    iput-object p1, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    .line 39
    iput p4, p0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 40
    if-eqz p2, :cond_1

    .line 41
    if-eqz p3, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 42
    :cond_0
    iput-object p2, p0, Lorg/mozilla/javascript/TokenStream;->sourceReader:Ljava/io/Reader;

    .line 43
    const/16 v0, 0x200

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    .line 44
    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    .line 50
    :goto_0
    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    .line 51
    return-void

    .line 46
    :cond_1
    if-nez p3, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 47
    :cond_2
    iput-object p3, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    .line 48
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    goto :goto_0
.end method

.method private addToString(I)V
    .locals 4
    .param p1, "c"    # I

    .prologue
    const/4 v3, 0x0

    .line 1229
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1230
    .local v0, "N":I
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    array-length v2, v2

    if-ne v0, v2, :cond_0

    .line 1231
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [C

    .line 1232
    .local v1, "tmp":[C
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1233
    iput-object v1, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    .line 1235
    .end local v1    # "tmp":[C
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    int-to-char v3, p1

    aput-char v3, v2, v0

    .line 1236
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1237
    return-void
.end method

.method private canUngetChar()Z
    .locals 2

    .prologue
    .line 1240
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    const/16 v1, 0xa

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private final charAt(I)I
    .locals 4
    .param p1, "index"    # I

    .prologue
    const/4 v2, -0x1

    .line 1404
    if-gez p1, :cond_1

    .line 1425
    :cond_0
    :goto_0
    return v2

    .line 1407
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 1408
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    if-ge p1, v3, :cond_0

    .line 1411
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    goto :goto_0

    .line 1413
    :cond_2
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    if-lt p1, v3, :cond_3

    .line 1414
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    .line 1416
    .local v1, "oldSourceCursor":I
    :try_start_0
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->fillSourceBuffer()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 1423
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    sub-int v2, v1, v2

    sub-int/2addr p1, v2

    .line 1425
    .end local v1    # "oldSourceCursor":I
    :cond_3
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    aget-char v2, v2, p1

    goto :goto_0

    .line 1417
    .restart local v1    # "oldSourceCursor":I
    :catch_0
    move-exception v0

    .line 1419
    .local v0, "ioe":Ljava/io/IOException;
    goto :goto_0
.end method

.method private convertLastCharToHex(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 1593
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 1594
    .local v3, "lastIndex":I
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v4, 0x0

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1596
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v4, "\\u"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1597
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 1598
    .local v1, "hexCode":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x4

    if-ge v2, v4, :cond_0

    .line 1599
    const/16 v4, 0x30

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1598
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1601
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1602
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private fillSourceBuffer()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1504
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v3, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1505
    :cond_0
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    iget-object v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    array-length v4, v4

    if-ne v3, v4, :cond_1

    .line 1506
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    if-eqz v3, :cond_2

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->isMarkingComment()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1507
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v4, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    iget-object v5, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v6, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    iget v7, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    sub-int/2addr v6, v7

    invoke-static {v3, v4, v5, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1509
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    iget v4, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    sub-int/2addr v3, v4

    iput v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    .line 1510
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    iget v4, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    sub-int/2addr v3, v4

    iput v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    .line 1511
    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    .line 1518
    :cond_1
    :goto_0
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceReader:Ljava/io/Reader;

    iget-object v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v5, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    iget-object v6, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    array-length v6, v6

    iget v7, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    sub-int/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/Reader;->read([CII)I

    move-result v0

    .line 1520
    .local v0, "n":I
    if-gez v0, :cond_3

    .line 1524
    :goto_1
    return v2

    .line 1513
    .end local v0    # "n":I
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    array-length v3, v3

    mul-int/lit8 v3, v3, 0x2

    new-array v1, v3, [C

    .line 1514
    .local v1, "tmp":[C
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    invoke-static {v3, v2, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1515
    iput-object v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    goto :goto_0

    .line 1523
    .end local v1    # "tmp":[C
    .restart local v0    # "n":I
    :cond_3
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    .line 1524
    const/4 v2, 0x1

    goto :goto_1
.end method

.method private getChar()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1273
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->getChar(Z)I

    move-result v0

    return v0
.end method

.method private getChar(Z)I
    .locals 8
    .param p1, "skipFormattingChars"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xd

    const/4 v6, 0x1

    const/16 v5, 0xa

    const/4 v1, -0x1

    .line 1278
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    if-eqz v2, :cond_2

    .line 1279
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1280
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    aget v0, v1, v2

    .line 1328
    :cond_0
    :goto_0
    return v0

    .line 1290
    :cond_1
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1291
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1303
    .local v0, "c":I
    :goto_1
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    if-ltz v2, :cond_6

    .line 1304
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    if-ne v2, v7, :cond_5

    if-ne v0, v5, :cond_5

    .line 1305
    iput v5, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1285
    .end local v0    # "c":I
    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 1286
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    if-ne v2, v3, :cond_1

    .line 1287
    iput-boolean v6, p0, Lorg/mozilla/javascript/TokenStream;->hitEOF:Z

    move v0, v1

    .line 1288
    goto :goto_0

    .line 1293
    :cond_3
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    if-ne v2, v3, :cond_4

    .line 1294
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->fillSourceBuffer()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1295
    iput-boolean v6, p0, Lorg/mozilla/javascript/TokenStream;->hitEOF:Z

    move v0, v1

    .line 1296
    goto :goto_0

    .line 1299
    :cond_4
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1300
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    aget-char v0, v2, v3

    .restart local v0    # "c":I
    goto :goto_1

    .line 1308
    :cond_5
    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1309
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    .line 1310
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    .line 1313
    :cond_6
    const/16 v2, 0x7f

    if-gt v0, v2, :cond_8

    .line 1314
    if-eq v0, v5, :cond_7

    if-ne v0, v7, :cond_0

    .line 1315
    :cond_7
    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1316
    const/16 v0, 0xa

    goto :goto_0

    .line 1319
    :cond_8
    const v2, 0xfeff

    if-eq v0, v2, :cond_0

    .line 1320
    if-eqz p1, :cond_9

    invoke-static {v0}, Lorg/mozilla/javascript/TokenStream;->isJSFormatChar(I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1323
    :cond_9
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1324
    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1325
    const/16 v0, 0xa

    goto :goto_0
.end method

.method private getCharIgnoreLineEnd()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v1, -0x1

    .line 1334
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    if-eqz v2, :cond_2

    .line 1335
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1336
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    aget v0, v1, v2

    .line 1374
    :cond_0
    :goto_0
    return v0

    .line 1366
    .local v0, "c":I
    :cond_1
    invoke-static {v0}, Lorg/mozilla/javascript/TokenStream;->isJSFormatChar(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1341
    .end local v0    # "c":I
    :cond_2
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 1342
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    if-ne v2, v3, :cond_3

    .line 1343
    iput-boolean v5, p0, Lorg/mozilla/javascript/TokenStream;->hitEOF:Z

    move v0, v1

    .line 1344
    goto :goto_0

    .line 1346
    :cond_3
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1347
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1359
    .restart local v0    # "c":I
    :goto_1
    const/16 v2, 0x7f

    if-gt v0, v2, :cond_7

    .line 1360
    const/16 v1, 0xa

    if-eq v0, v1, :cond_4

    const/16 v1, 0xd

    if-ne v0, v1, :cond_0

    .line 1361
    :cond_4
    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1362
    const/16 v0, 0xa

    goto :goto_0

    .line 1349
    .end local v0    # "c":I
    :cond_5
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceEnd:I

    if-ne v2, v3, :cond_6

    .line 1350
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->fillSourceBuffer()Z

    move-result v2

    if-nez v2, :cond_6

    .line 1351
    iput-boolean v5, p0, Lorg/mozilla/javascript/TokenStream;->hitEOF:Z

    move v0, v1

    .line 1352
    goto :goto_0

    .line 1355
    :cond_6
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1356
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    aget-char v0, v2, v3

    .restart local v0    # "c":I
    goto :goto_1

    .line 1365
    :cond_7
    const v2, 0xfeff

    if-ne v0, v2, :cond_1

    goto :goto_0

    .line 1369
    :cond_8
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1370
    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    .line 1371
    const/16 v0, 0xa

    goto :goto_0
.end method

.method private getStringFromBuffer()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1223
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1224
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method private static isAlpha(I)Z
    .locals 3
    .param p0, "c"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 841
    const/16 v2, 0x5a

    if-gt p0, v2, :cond_2

    .line 842
    const/16 v2, 0x41

    if-gt v2, p0, :cond_1

    .line 844
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 842
    goto :goto_0

    .line 844
    :cond_2
    const/16 v2, 0x61

    if-gt v2, p0, :cond_3

    const/16 v2, 0x7a

    if-le p0, v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method static isDigit(I)Z
    .locals 1
    .param p0, "c"    # I

    .prologue
    .line 850
    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isJSFormatChar(I)Z
    .locals 2
    .param p0, "c"    # I

    .prologue
    .line 869
    const/16 v0, 0x7f

    if-le p0, v0, :cond_0

    int-to-char v0, p0

    invoke-static {v0}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isJSSpace(I)Z
    .locals 4
    .param p0, "c"    # I

    .prologue
    const/16 v3, 0xc

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 859
    const/16 v2, 0x7f

    if-gt p0, v2, :cond_2

    .line 860
    const/16 v2, 0x20

    if-eq p0, v2, :cond_0

    const/16 v2, 0x9

    if-eq p0, v2, :cond_0

    if-eq p0, v3, :cond_0

    const/16 v2, 0xb

    if-ne p0, v2, :cond_1

    :cond_0
    move v0, v1

    .line 862
    :cond_1
    :goto_0
    return v0

    :cond_2
    const/16 v2, 0xa0

    if-eq p0, v2, :cond_3

    const v2, 0xfeff

    if-eq p0, v2, :cond_3

    int-to-char v2, p0

    invoke-static {v2}, Ljava/lang/Character;->getType(C)I

    move-result v2

    if-ne v2, v3, :cond_1

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method static isKeyword(Ljava/lang/String;)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-static {p0}, Lorg/mozilla/javascript/TokenStream;->stringToKeyword(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMarkingComment()Z
    .locals 2

    .prologue
    .line 1575
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->commentCursor:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private markCommentStart()V
    .locals 1

    .prologue
    .line 1564
    const-string v0, ""

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->markCommentStart(Ljava/lang/String;)V

    .line 1565
    return-void
.end method

.method private markCommentStart(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1568
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    invoke-virtual {v0}, Lorg/mozilla/javascript/CompilerEnvirons;->isRecordingComments()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->sourceReader:Ljava/io/Reader;

    if-eqz v0, :cond_0

    .line 1569
    iput-object p1, p0, Lorg/mozilla/javascript/TokenStream;->commentPrefix:Ljava/lang/String;

    .line 1570
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->commentCursor:I

    .line 1572
    :cond_0
    return-void
.end method

.method private matchChar(I)Z
    .locals 2
    .param p1, "test"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1254
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getCharIgnoreLineEnd()I

    move-result v0

    .line 1255
    .local v0, "c":I
    if-ne v0, p1, :cond_0

    .line 1256
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1257
    const/4 v1, 0x1

    .line 1260
    :goto_0
    return v1

    .line 1259
    :cond_0
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetCharIgnoreLineEnd(I)V

    .line 1260
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private peekChar()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1266
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1267
    .local v0, "c":I
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 1268
    return v0
.end method

.method private readCDATA()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x5d

    const/4 v1, 0x0

    .line 1154
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :cond_0
    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    .line 1155
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1156
    if-ne v0, v4, :cond_1

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v2

    if-ne v2, v4, :cond_1

    .line 1157
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1158
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1159
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    .line 1160
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1161
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1162
    const/4 v1, 0x1

    .line 1173
    :goto_1
    return v1

    .line 1167
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1170
    :cond_2
    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1171
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1172
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private readEntity()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1181
    const/4 v1, 0x1

    .line 1182
    .local v1, "declTags":I
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 1183
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1184
    packed-switch v0, :pswitch_data_0

    .line 1182
    :cond_0
    :goto_1
    :pswitch_0
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1186
    :pswitch_1
    add-int/lit8 v1, v1, 0x1

    .line 1187
    goto :goto_1

    .line 1189
    :pswitch_2
    add-int/lit8 v1, v1, -0x1

    .line 1190
    if-nez v1, :cond_0

    const/4 v2, 0x1

    .line 1198
    :goto_2
    return v2

    .line 1195
    :cond_1
    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1196
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1197
    iget-object v3, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v4, "msg.XML.bad.form"

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto :goto_2

    .line 1184
    :pswitch_data_0
    .packed-switch 0x3c
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private readPI()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1206
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 1207
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1208
    const/16 v2, 0x3f

    if-ne v0, v2, :cond_0

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    .line 1209
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1210
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1211
    const/4 v1, 0x1

    .line 1218
    :goto_1
    return v1

    .line 1206
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1215
    :cond_1
    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1216
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1217
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private readQuotedString(I)Z
    .locals 4
    .param p1, "quote"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1111
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 1112
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1113
    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    .line 1119
    :goto_1
    return v1

    .line 1111
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1116
    :cond_1
    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1117
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1118
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private readXmlComment()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2d

    const/4 v1, 0x0

    .line 1127
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :cond_0
    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    .line 1128
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1129
    if-ne v0, v4, :cond_1

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v2

    if-ne v2, v4, :cond_1

    .line 1130
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1131
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1132
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    .line 1133
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1134
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1135
    const/4 v1, 0x1

    .line 1146
    :goto_1
    return v1

    .line 1140
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1143
    :cond_2
    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1144
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1145
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private skipLine()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1388
    :cond_0
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 1389
    :cond_1
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 1390
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1391
    return-void
.end method

.method private static stringToKeyword(Ljava/lang/String;)I
    .locals 69
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 87
    const/16 v4, 0x78

    .line 88
    .local v4, "Id_break":I
    const/16 v6, 0x73

    .line 89
    .local v6, "Id_case":I
    const/16 v11, 0x79

    .line 90
    .local v11, "Id_continue":I
    const/16 v13, 0x74

    .line 91
    .local v13, "Id_default":I
    const/16 v14, 0x1f

    .line 92
    .local v14, "Id_delete":I
    const/16 v15, 0x76

    .line 93
    .local v15, "Id_do":I
    const/16 v17, 0x71

    .line 94
    .local v17, "Id_else":I
    const/16 v19, 0x7f

    .line 95
    .local v19, "Id_export":I
    const/16 v21, 0x2c

    .line 96
    .local v21, "Id_false":I
    const/16 v25, 0x77

    .line 97
    .local v25, "Id_for":I
    const/16 v26, 0x6d

    .line 98
    .local v26, "Id_function":I
    const/16 v28, 0x70

    .line 99
    .local v28, "Id_if":I
    const/16 v31, 0x34

    .line 100
    .local v31, "Id_in":I
    const/16 v35, 0x99

    .line 101
    .local v35, "Id_let":I
    const/16 v38, 0x1e

    .line 102
    .local v38, "Id_new":I
    const/16 v39, 0x2a

    .line 103
    .local v39, "Id_null":I
    const/16 v44, 0x4

    .line 104
    .local v44, "Id_return":I
    const/16 v48, 0x72

    .line 105
    .local v48, "Id_switch":I
    const/16 v50, 0x2b

    .line 106
    .local v50, "Id_this":I
    const/16 v54, 0x2d

    .line 107
    .local v54, "Id_true":I
    const/16 v56, 0x20

    .line 108
    .local v56, "Id_typeof":I
    const/16 v57, 0x7a

    .line 109
    .local v57, "Id_var":I
    const/16 v58, 0x7e

    .line 110
    .local v58, "Id_void":I
    const/16 v60, 0x75

    .line 111
    .local v60, "Id_while":I
    const/16 v61, 0x7b

    .line 112
    .local v61, "Id_with":I
    const/16 v62, 0x48

    .line 115
    .local v62, "Id_yield":I
    const/16 v2, 0x7f

    .line 116
    .local v2, "Id_abstract":I
    const/16 v3, 0x7f

    .line 117
    .local v3, "Id_boolean":I
    const/16 v5, 0x7f

    .line 118
    .local v5, "Id_byte":I
    const/16 v7, 0x7c

    .line 119
    .local v7, "Id_catch":I
    const/16 v8, 0x7f

    .line 120
    .local v8, "Id_char":I
    const/16 v9, 0x7f

    .line 121
    .local v9, "Id_class":I
    const/16 v10, 0x9a

    .line 122
    .local v10, "Id_const":I
    const/16 v12, 0xa0

    .line 123
    .local v12, "Id_debugger":I
    const/16 v16, 0x7f

    .line 124
    .local v16, "Id_double":I
    const/16 v18, 0x7f

    .line 125
    .local v18, "Id_enum":I
    const/16 v20, 0x7f

    .line 126
    .local v20, "Id_extends":I
    const/16 v22, 0x7f

    .line 127
    .local v22, "Id_final":I
    const/16 v23, 0x7d

    .line 128
    .local v23, "Id_finally":I
    const/16 v24, 0x7f

    .line 129
    .local v24, "Id_float":I
    const/16 v27, 0x7f

    .line 130
    .local v27, "Id_goto":I
    const/16 v29, 0x7f

    .line 131
    .local v29, "Id_implements":I
    const/16 v30, 0x7f

    .line 132
    .local v30, "Id_import":I
    const/16 v32, 0x35

    .line 133
    .local v32, "Id_instanceof":I
    const/16 v33, 0x7f

    .line 134
    .local v33, "Id_int":I
    const/16 v34, 0x7f

    .line 135
    .local v34, "Id_interface":I
    const/16 v36, 0x7f

    .line 136
    .local v36, "Id_long":I
    const/16 v37, 0x7f

    .line 137
    .local v37, "Id_native":I
    const/16 v40, 0x7f

    .line 138
    .local v40, "Id_package":I
    const/16 v41, 0x7f

    .line 139
    .local v41, "Id_private":I
    const/16 v42, 0x7f

    .line 140
    .local v42, "Id_protected":I
    const/16 v43, 0x7f

    .line 141
    .local v43, "Id_public":I
    const/16 v45, 0x7f

    .line 142
    .local v45, "Id_short":I
    const/16 v46, 0x7f

    .line 143
    .local v46, "Id_static":I
    const/16 v47, 0x7f

    .line 144
    .local v47, "Id_super":I
    const/16 v49, 0x7f

    .line 145
    .local v49, "Id_synchronized":I
    const/16 v51, 0x32

    .line 146
    .local v51, "Id_throw":I
    const/16 v52, 0x7f

    .line 147
    .local v52, "Id_throws":I
    const/16 v53, 0x7f

    .line 148
    .local v53, "Id_transient":I
    const/16 v55, 0x51

    .line 149
    .local v55, "Id_try":I
    const/16 v59, 0x7f

    .line 152
    .local v59, "Id_volatile":I
    move-object/from16 v66, p0

    .line 154
    .local v66, "s":Ljava/lang/String;
    const/16 v65, 0x0

    .local v65, "id":I
    const/16 v63, 0x0

    .line 155
    .local v63, "X":Ljava/lang/String;
    invoke-virtual/range {v66 .. v66}, Ljava/lang/String;->length()I

    move-result v67

    packed-switch v67, :pswitch_data_0

    .line 250
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v63, :cond_1

    move-object/from16 v0, v63

    move-object/from16 v1, v66

    if-eq v0, v1, :cond_1

    move-object/from16 v0, v63

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v67

    if-nez v67, :cond_1

    const/16 v65, 0x0

    .line 254
    :cond_1
    :goto_1
    if-nez v65, :cond_e

    const/16 v67, 0x0

    .line 255
    :goto_2
    return v67

    .line 156
    :pswitch_1
    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 157
    .local v64, "c":I
    const/16 v67, 0x66

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_2

    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x69

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x70

    goto :goto_1

    .line 158
    :cond_2
    const/16 v67, 0x6e

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_3

    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x69

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x34

    goto :goto_1

    .line 159
    :cond_3
    const/16 v67, 0x6f

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x64

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x76

    goto :goto_1

    .line 161
    .end local v64    # "c":I
    :pswitch_2
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    sparse-switch v67, :sswitch_data_0

    goto :goto_0

    .line 162
    :sswitch_0
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x72

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x6f

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x77

    goto :goto_1

    .line 163
    :sswitch_1
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x74

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x6e

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x7f

    goto/16 :goto_1

    .line 164
    :sswitch_2
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x74

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x65

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x99

    goto/16 :goto_1

    .line 165
    :sswitch_3
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x77

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x65

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x1e

    goto/16 :goto_1

    .line 166
    :sswitch_4
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x79

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x72

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x51

    goto/16 :goto_1

    .line 167
    :sswitch_5
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x72

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x61

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x7a

    goto/16 :goto_1

    .line 169
    :pswitch_3
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    sparse-switch v67, :sswitch_data_1

    goto/16 :goto_0

    .line 170
    :sswitch_6
    const-string v63, "byte"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 171
    :sswitch_7
    const/16 v67, 0x3

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 172
    .restart local v64    # "c":I
    const/16 v67, 0x65

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_4

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x73

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x61

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x73

    goto/16 :goto_1

    .line 173
    :cond_4
    const/16 v67, 0x72

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x61

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x68

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x7f

    goto/16 :goto_1

    .line 175
    .end local v64    # "c":I
    :sswitch_8
    const/16 v67, 0x3

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 176
    .restart local v64    # "c":I
    const/16 v67, 0x65

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_5

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x73

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x6c

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x71

    goto/16 :goto_1

    .line 177
    :cond_5
    const/16 v67, 0x6d

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x75

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x6e

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x7f

    goto/16 :goto_1

    .line 179
    .end local v64    # "c":I
    :sswitch_9
    const-string v63, "goto"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 180
    :sswitch_a
    const-string v63, "long"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 181
    :sswitch_b
    const-string v63, "null"

    const/16 v65, 0x2a

    goto/16 :goto_0

    .line 182
    :sswitch_c
    const/16 v67, 0x3

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 183
    .restart local v64    # "c":I
    const/16 v67, 0x65

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_6

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x75

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x72

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x2d

    goto/16 :goto_1

    .line 184
    :cond_6
    const/16 v67, 0x73

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x69

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    const/16 v68, 0x68

    move/from16 v0, v67

    move/from16 v1, v68

    if-ne v0, v1, :cond_0

    const/16 v65, 0x2b

    goto/16 :goto_1

    .line 186
    .end local v64    # "c":I
    :sswitch_d
    const-string v63, "void"

    const/16 v65, 0x7e

    goto/16 :goto_0

    .line 187
    :sswitch_e
    const-string v63, "with"

    const/16 v65, 0x7b

    goto/16 :goto_0

    .line 189
    :pswitch_4
    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    packed-switch v67, :pswitch_data_1

    :pswitch_5
    goto/16 :goto_0

    .line 190
    :pswitch_6
    const-string v63, "class"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 191
    :pswitch_7
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 192
    .restart local v64    # "c":I
    const/16 v67, 0x62

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_7

    const-string v63, "break"

    const/16 v65, 0x78

    goto/16 :goto_0

    .line 193
    :cond_7
    const/16 v67, 0x79

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const-string v63, "yield"

    const/16 v65, 0x48

    goto/16 :goto_0

    .line 195
    .end local v64    # "c":I
    :pswitch_8
    const-string v63, "while"

    const/16 v65, 0x75

    goto/16 :goto_0

    .line 196
    :pswitch_9
    const-string v63, "false"

    const/16 v65, 0x2c

    goto/16 :goto_0

    .line 197
    :pswitch_a
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 198
    .restart local v64    # "c":I
    const/16 v67, 0x63

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_8

    const-string v63, "const"

    const/16 v65, 0x9a

    goto/16 :goto_0

    .line 199
    :cond_8
    const/16 v67, 0x66

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const-string v63, "final"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 201
    .end local v64    # "c":I
    :pswitch_b
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 202
    .restart local v64    # "c":I
    const/16 v67, 0x66

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_9

    const-string v63, "float"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 203
    :cond_9
    const/16 v67, 0x73

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const-string v63, "short"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 205
    .end local v64    # "c":I
    :pswitch_c
    const-string v63, "super"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 206
    :pswitch_d
    const-string v63, "throw"

    const/16 v65, 0x32

    goto/16 :goto_0

    .line 207
    :pswitch_e
    const-string v63, "catch"

    const/16 v65, 0x7c

    goto/16 :goto_0

    .line 209
    :pswitch_f
    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    sparse-switch v67, :sswitch_data_2

    goto/16 :goto_0

    .line 210
    :sswitch_f
    const-string v63, "native"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 211
    :sswitch_10
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 212
    .restart local v64    # "c":I
    const/16 v67, 0x64

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_a

    const-string v63, "delete"

    const/16 v65, 0x1f

    goto/16 :goto_0

    .line 213
    :cond_a
    const/16 v67, 0x72

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const-string v63, "return"

    const/16 v65, 0x4

    goto/16 :goto_0

    .line 215
    .end local v64    # "c":I
    :sswitch_11
    const-string v63, "throws"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 216
    :sswitch_12
    const-string v63, "import"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 217
    :sswitch_13
    const-string v63, "double"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 218
    :sswitch_14
    const-string v63, "static"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 219
    :sswitch_15
    const-string v63, "public"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 220
    :sswitch_16
    const-string v63, "switch"

    const/16 v65, 0x72

    goto/16 :goto_0

    .line 221
    :sswitch_17
    const-string v63, "export"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 222
    :sswitch_18
    const-string v63, "typeof"

    const/16 v65, 0x20

    goto/16 :goto_0

    .line 224
    :pswitch_10
    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    sparse-switch v67, :sswitch_data_3

    goto/16 :goto_0

    .line 225
    :sswitch_19
    const-string v63, "package"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 226
    :sswitch_1a
    const-string v63, "default"

    const/16 v65, 0x74

    goto/16 :goto_0

    .line 227
    :sswitch_1b
    const-string v63, "finally"

    const/16 v65, 0x7d

    goto/16 :goto_0

    .line 228
    :sswitch_1c
    const-string v63, "boolean"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 229
    :sswitch_1d
    const-string v63, "private"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 230
    :sswitch_1e
    const-string v63, "extends"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 232
    :pswitch_11
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v67

    sparse-switch v67, :sswitch_data_4

    goto/16 :goto_0

    .line 233
    :sswitch_1f
    const-string v63, "abstract"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 234
    :sswitch_20
    const-string v63, "continue"

    const/16 v65, 0x79

    goto/16 :goto_0

    .line 235
    :sswitch_21
    const-string v63, "debugger"

    const/16 v65, 0xa0

    goto/16 :goto_0

    .line 236
    :sswitch_22
    const-string v63, "function"

    const/16 v65, 0x6d

    goto/16 :goto_0

    .line 237
    :sswitch_23
    const-string v63, "volatile"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 239
    :pswitch_12
    const/16 v67, 0x0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 240
    .restart local v64    # "c":I
    const/16 v67, 0x69

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_b

    const-string v63, "interface"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 241
    :cond_b
    const/16 v67, 0x70

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_c

    const-string v63, "protected"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 242
    :cond_c
    const/16 v67, 0x74

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const-string v63, "transient"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 244
    .end local v64    # "c":I
    :pswitch_13
    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Ljava/lang/String;->charAt(I)C

    move-result v64

    .line 245
    .restart local v64    # "c":I
    const/16 v67, 0x6d

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_d

    const-string v63, "implements"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 246
    :cond_d
    const/16 v67, 0x6e

    move/from16 v0, v64

    move/from16 v1, v67

    if-ne v0, v1, :cond_0

    const-string v63, "instanceof"

    const/16 v65, 0x35

    goto/16 :goto_0

    .line 248
    .end local v64    # "c":I
    :pswitch_14
    const-string v63, "synchronized"

    const/16 v65, 0x7f

    goto/16 :goto_0

    .line 255
    :cond_e
    move/from16 v0, v65

    and-int/lit16 v0, v0, 0xff

    move/from16 v67, v0

    goto/16 :goto_2

    .line 155
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_0
        :pswitch_14
    .end packed-switch

    .line 161
    :sswitch_data_0
    .sparse-switch
        0x66 -> :sswitch_0
        0x69 -> :sswitch_1
        0x6c -> :sswitch_2
        0x6e -> :sswitch_3
        0x74 -> :sswitch_4
        0x76 -> :sswitch_5
    .end sparse-switch

    .line 169
    :sswitch_data_1
    .sparse-switch
        0x62 -> :sswitch_6
        0x63 -> :sswitch_7
        0x65 -> :sswitch_8
        0x67 -> :sswitch_9
        0x6c -> :sswitch_a
        0x6e -> :sswitch_b
        0x74 -> :sswitch_c
        0x76 -> :sswitch_d
        0x77 -> :sswitch_e
    .end sparse-switch

    .line 189
    :pswitch_data_1
    .packed-switch 0x61
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_7
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_8
        :pswitch_5
        :pswitch_5
        :pswitch_9
        :pswitch_5
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_5
        :pswitch_d
        :pswitch_5
        :pswitch_e
    .end packed-switch

    .line 209
    :sswitch_data_2
    .sparse-switch
        0x61 -> :sswitch_f
        0x65 -> :sswitch_10
        0x68 -> :sswitch_11
        0x6d -> :sswitch_12
        0x6f -> :sswitch_13
        0x74 -> :sswitch_14
        0x75 -> :sswitch_15
        0x77 -> :sswitch_16
        0x78 -> :sswitch_17
        0x79 -> :sswitch_18
    .end sparse-switch

    .line 224
    :sswitch_data_3
    .sparse-switch
        0x61 -> :sswitch_19
        0x65 -> :sswitch_1a
        0x69 -> :sswitch_1b
        0x6f -> :sswitch_1c
        0x72 -> :sswitch_1d
        0x78 -> :sswitch_1e
    .end sparse-switch

    .line 232
    :sswitch_data_4
    .sparse-switch
        0x61 -> :sswitch_1f
        0x63 -> :sswitch_20
        0x64 -> :sswitch_21
        0x66 -> :sswitch_22
        0x76 -> :sswitch_23
    .end sparse-switch
.end method

.method private final substring(II)Ljava/lang/String;
    .locals 3
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 1430
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1431
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    invoke-virtual {v1, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1434
    :goto_0
    return-object v1

    .line 1433
    :cond_0
    sub-int v0, p2, p1

    .line 1434
    .local v0, "count":I
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    invoke-direct {v1, v2, p1, v0}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method private ungetChar(I)V
    .locals 3
    .param p1, "c"    # I

    .prologue
    .line 1246
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 1247
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1248
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    aput p1, v0, v1

    .line 1249
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1250
    return-void
.end method

.method private ungetCharIgnoreLineEnd(I)V
    .locals 3
    .param p1, "c"    # I

    .prologue
    .line 1380
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->ungetBuffer:[I

    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    aput p1, v0, v1

    .line 1381
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    .line 1382
    return-void
.end method


# virtual methods
.method final eof()Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lorg/mozilla/javascript/TokenStream;->hitEOF:Z

    return v0
.end method

.method final getAndResetCurrentComment()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1579
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 1580
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->isMarkingComment()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1581
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1588
    :goto_0
    return-object v1

    .line 1583
    :cond_1
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->isMarkingComment()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1584
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->commentPrefix:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1585
    .local v0, "comment":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceBuffer:[C

    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->commentCursor:I

    invoke-virtual {p0}, Lorg/mozilla/javascript/TokenStream;->getTokenLength()I

    move-result v3

    iget-object v4, p0, Lorg/mozilla/javascript/TokenStream;->commentPrefix:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1587
    const/4 v1, -0x1

    iput v1, p0, Lorg/mozilla/javascript/TokenStream;->commentCursor:I

    .line 1588
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getCommentType()Lorg/mozilla/javascript/Token$CommentType;
    .locals 1

    .prologue
    .line 1560
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    return-object v0
.end method

.method public getCursor()I
    .locals 1

    .prologue
    .line 1531
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    return v0
.end method

.method getFirstXMLToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 945
    iput v0, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    .line 946
    iput-boolean v0, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsAttribute:Z

    .line 947
    iput-boolean v0, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    .line 948
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->canUngetChar()Z

    move-result v0

    if-nez v0, :cond_0

    .line 949
    const/4 v0, -0x1

    .line 951
    :goto_0
    return v0

    .line 950
    :cond_0
    const/16 v0, 0x3c

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 951
    invoke-virtual {p0}, Lorg/mozilla/javascript/TokenStream;->getNextXMLToken()I

    move-result v0

    goto :goto_0
.end method

.method final getLine()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1439
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    .line 1440
    .local v1, "lineEnd":I
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    if-ltz v3, :cond_1

    .line 1442
    add-int/lit8 v1, v1, -0x1

    .line 1443
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    const/16 v4, 0xa

    if-ne v3, v4, :cond_0

    add-int/lit8 v3, v1, -0x1

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/TokenStream;->charAt(I)I

    move-result v3

    const/16 v4, 0xd

    if-ne v3, v4, :cond_0

    .line 1444
    add-int/lit8 v1, v1, -0x1

    .line 1457
    :cond_0
    :goto_0
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    invoke-direct {p0, v3, v1}, Lorg/mozilla/javascript/TokenStream;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1448
    :cond_1
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    sub-int v2, v1, v3

    .line 1450
    .local v2, "lineLength":I
    :goto_1
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    add-int/2addr v3, v2

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/TokenStream;->charAt(I)I

    move-result v0

    .line 1451
    .local v0, "c":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1455
    :cond_2
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    add-int v1, v3, v2

    goto :goto_0

    .line 1449
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method final getLine(I[I)Ljava/lang/String;
    .locals 11
    .param p1, "position"    # I
    .param p2, "linep"    # [I

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1461
    sget-boolean v7, Lorg/mozilla/javascript/TokenStream;->$assertionsDisabled:Z

    if-nez v7, :cond_1

    if-ltz p1, :cond_0

    iget v7, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    if-le p1, v7, :cond_1

    :cond_0
    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1462
    :cond_1
    sget-boolean v7, Lorg/mozilla/javascript/TokenStream;->$assertionsDisabled:Z

    if-nez v7, :cond_2

    array-length v7, p2

    const/4 v10, 0x2

    if-eq v7, v10, :cond_2

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1463
    :cond_2
    iget v7, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iget v10, p0, Lorg/mozilla/javascript/TokenStream;->ungetCursor:I

    add-int/2addr v7, v10

    sub-int v2, v7, p1

    .line 1464
    .local v2, "delta":I
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    .line 1465
    .local v1, "cur":I
    if-le v2, v1, :cond_3

    .line 1467
    const/4 v7, 0x0

    .line 1498
    :goto_0
    return-object v7

    .line 1470
    :cond_3
    const/4 v3, 0x0

    .local v3, "end":I
    const/4 v4, 0x0

    .line 1471
    .local v4, "lines":I
    :goto_1
    if-lez v2, :cond_7

    .line 1472
    sget-boolean v7, Lorg/mozilla/javascript/TokenStream;->$assertionsDisabled:Z

    if-nez v7, :cond_4

    if-gtz v1, :cond_4

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1473
    :cond_4
    add-int/lit8 v7, v1, -0x1

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/TokenStream;->charAt(I)I

    move-result v0

    .line 1474
    .local v0, "c":I
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1475
    const/16 v7, 0xa

    if-ne v0, v7, :cond_5

    add-int/lit8 v7, v1, -0x2

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/TokenStream;->charAt(I)I

    move-result v7

    const/16 v10, 0xd

    if-ne v7, v10, :cond_5

    .line 1477
    add-int/lit8 v2, v2, -0x1

    .line 1478
    add-int/lit8 v1, v1, -0x1

    .line 1480
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 1481
    add-int/lit8 v3, v1, -0x1

    .line 1471
    :cond_6
    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 1485
    .end local v0    # "c":I
    :cond_7
    const/4 v6, 0x0

    .local v6, "start":I
    const/4 v5, 0x0

    .line 1486
    .local v5, "offset":I
    :goto_2
    if-lez v1, :cond_8

    .line 1487
    add-int/lit8 v7, v1, -0x1

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/TokenStream;->charAt(I)I

    move-result v0

    .line 1488
    .restart local v0    # "c":I
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 1489
    move v6, v1

    .line 1493
    .end local v0    # "c":I
    :cond_8
    iget v7, p0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    sub-int v10, v7, v4

    iget v7, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    if-ltz v7, :cond_a

    move v7, v8

    :goto_3
    add-int/2addr v7, v10

    aput v7, p2, v9

    .line 1494
    aput v5, p2, v8

    .line 1495
    if-nez v4, :cond_b

    .line 1496
    invoke-virtual {p0}, Lorg/mozilla/javascript/TokenStream;->getLine()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 1486
    .restart local v0    # "c":I
    :cond_9
    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .end local v0    # "c":I
    :cond_a
    move v7, v9

    .line 1493
    goto :goto_3

    .line 1498
    :cond_b
    invoke-direct {p0, v6, v3}, Lorg/mozilla/javascript/TokenStream;->substring(II)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method

.method final getLineno()I
    .locals 1

    .prologue
    .line 260
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->lineno:I

    return v0
.end method

.method getNextXMLToken()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/16 v5, 0x41

    const/4 v4, 0x0

    const/4 v1, -0x1

    .line 956
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 957
    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 959
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :goto_0
    if-eq v0, v1, :cond_6

    .line 960
    iget-boolean v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    if-eqz v2, :cond_1

    .line 961
    sparse-switch v0, :sswitch_data_0

    .line 996
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 997
    iput-boolean v4, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsAttribute:Z

    .line 1001
    :cond_0
    :goto_1
    iget-boolean v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    if-nez v2, :cond_2

    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    if-nez v2, :cond_2

    .line 1002
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1003
    const/16 v1, 0x94

    .line 1103
    :goto_2
    return v1

    .line 963
    :sswitch_0
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 964
    iput-boolean v4, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    .line 965
    iput-boolean v4, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsAttribute:Z

    goto :goto_1

    .line 968
    :sswitch_1
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 969
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    .line 970
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 971
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 972
    iput-boolean v4, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    .line 973
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    goto :goto_1

    .line 977
    :sswitch_2
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 978
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 979
    const/16 v1, 0x91

    goto :goto_2

    .line 982
    :sswitch_3
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 983
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->readQuotedString(I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 986
    :sswitch_4
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 987
    iput-boolean v7, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsAttribute:Z

    goto :goto_1

    .line 993
    :sswitch_5
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_1

    .line 1006
    :cond_1
    sparse-switch v0, :sswitch_data_1

    .line 1093
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 959
    :cond_2
    :goto_3
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1008
    :sswitch_6
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1009
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v0

    .line 1010
    sparse-switch v0, :sswitch_data_2

    .line 1083
    iput-boolean v7, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    .line 1084
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    goto :goto_3

    .line 1012
    :sswitch_7
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1013
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1014
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v0

    .line 1015
    sparse-switch v0, :sswitch_data_3

    .line 1058
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->readEntity()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    .line 1017
    :sswitch_8
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1018
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1019
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1020
    const/16 v2, 0x2d

    if-ne v0, v2, :cond_3

    .line 1021
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1022
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->readXmlComment()Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_2

    .line 1025
    :cond_3
    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1026
    iput-object v6, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1027
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1032
    :sswitch_9
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1033
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1034
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v2

    const/16 v3, 0x43

    if-ne v2, v3, :cond_4

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v2

    const/16 v3, 0x44

    if-ne v2, v3, :cond_4

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v2

    if-ne v2, v5, :cond_4

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v2

    const/16 v3, 0x54

    if-ne v2, v3, :cond_4

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v2

    if-ne v2, v5, :cond_4

    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v2

    const/16 v3, 0x5b

    if-ne v2, v3, :cond_4

    .line 1041
    const/16 v2, 0x43

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1042
    const/16 v2, 0x44

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1043
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1044
    const/16 v2, 0x54

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1045
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1046
    const/16 v2, 0x5b

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1047
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->readCDATA()Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_2

    .line 1051
    :cond_4
    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1052
    iput-object v6, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1053
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1063
    :sswitch_a
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1064
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1065
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->readPI()Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_2

    .line 1069
    :sswitch_b
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 1070
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 1071
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    if-nez v2, :cond_5

    .line 1073
    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1074
    iput-object v6, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1075
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1078
    :cond_5
    iput-boolean v7, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsTagContent:Z

    .line 1079
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->xmlOpenTagsCount:I

    goto/16 :goto_3

    .line 1089
    :sswitch_c
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 1090
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1091
    const/16 v1, 0x91

    goto/16 :goto_2

    .line 1099
    :cond_6
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    iput v2, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 1100
    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 1101
    iput-object v6, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 1102
    iget-object v2, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 961
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_5
        0xa -> :sswitch_5
        0xd -> :sswitch_5
        0x20 -> :sswitch_5
        0x22 -> :sswitch_3
        0x27 -> :sswitch_3
        0x2f -> :sswitch_1
        0x3d -> :sswitch_4
        0x3e -> :sswitch_0
        0x7b -> :sswitch_2
    .end sparse-switch

    .line 1006
    :sswitch_data_1
    .sparse-switch
        0x3c -> :sswitch_6
        0x7b -> :sswitch_c
    .end sparse-switch

    .line 1010
    :sswitch_data_2
    .sparse-switch
        0x21 -> :sswitch_7
        0x2f -> :sswitch_b
        0x3f -> :sswitch_a
    .end sparse-switch

    .line 1015
    :sswitch_data_3
    .sparse-switch
        0x2d -> :sswitch_8
        0x5b -> :sswitch_9
    .end sparse-switch
.end method

.method final getNumber()D
    .locals 2

    .prologue
    .line 268
    iget-wide v0, p0, Lorg/mozilla/javascript/TokenStream;->number:D

    return-wide v0
.end method

.method final getOffset()I
    .locals 3

    .prologue
    .line 1398
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->sourceCursor:I

    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->lineStart:I

    sub-int v0, v1, v2

    .line 1399
    .local v0, "n":I
    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->lineEndChar:I

    if-ltz v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 1400
    :cond_0
    return v0
.end method

.method final getQuoteChar()C
    .locals 1

    .prologue
    .line 265
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->quoteChar:I

    int-to-char v0, v0

    return v0
.end method

.method final getSourceString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->sourceString:Ljava/lang/String;

    return-object v0
.end method

.method final getString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    return-object v0
.end method

.method final getToken()I
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 283
    .local v5, "c":I
    const/16 v22, -0x1

    move/from16 v0, v22

    if-ne v5, v0, :cond_2

    .line 284
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 285
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 286
    const/16 v19, 0x0

    .line 833
    :cond_1
    :goto_0
    return v19

    .line 287
    :cond_2
    const/16 v22, 0xa

    move/from16 v0, v22

    if-ne v5, v0, :cond_3

    .line 288
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->dirtyLine:Z

    .line 289
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 290
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 291
    const/16 v19, 0x1

    goto :goto_0

    .line 292
    :cond_3
    invoke-static {v5}, Lorg/mozilla/javascript/TokenStream;->isJSSpace(I)Z

    move-result v22

    if-nez v22, :cond_0

    .line 293
    const/16 v22, 0x2d

    move/from16 v0, v22

    if-eq v5, v0, :cond_4

    .line 294
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->dirtyLine:Z

    .line 301
    :cond_4
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 302
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 304
    const/16 v22, 0x40

    move/from16 v0, v22

    if-ne v5, v0, :cond_5

    const/16 v19, 0x93

    goto :goto_0

    .line 309
    :cond_5
    const/16 v16, 0x0

    .line 310
    .local v16, "isUnicodeEscapeStart":Z
    const/16 v22, 0x5c

    move/from16 v0, v22

    if-ne v5, v0, :cond_9

    .line 311
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 312
    const/16 v22, 0x75

    move/from16 v0, v22

    if-ne v5, v0, :cond_8

    .line 313
    const/4 v14, 0x1

    .line 314
    .local v14, "identifierStart":Z
    const/16 v16, 0x1

    .line 315
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 329
    :cond_6
    :goto_1
    if-eqz v14, :cond_16

    .line 330
    move/from16 v7, v16

    .line 332
    .local v7, "containsEscape":Z
    :goto_2
    if-eqz v16, :cond_c

    .line 339
    const/4 v11, 0x0

    .line 340
    .local v11, "escapeVal":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_3
    const/16 v22, 0x4

    move/from16 v0, v22

    if-eq v13, v0, :cond_7

    .line 341
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 342
    invoke-static {v5, v11}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v11

    .line 344
    if-gez v11, :cond_a

    .line 346
    :cond_7
    if-gez v11, :cond_b

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.invalid.escape"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 348
    const/16 v19, -0x1

    goto/16 :goto_0

    .line 317
    .end local v7    # "containsEscape":Z
    .end local v11    # "escapeVal":I
    .end local v13    # "i":I
    .end local v14    # "identifierStart":Z
    :cond_8
    const/4 v14, 0x0

    .line 318
    .restart local v14    # "identifierStart":Z
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 319
    const/16 v5, 0x5c

    goto :goto_1

    .line 322
    .end local v14    # "identifierStart":Z
    :cond_9
    int-to-char v0, v5

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v14

    .line 323
    .restart local v14    # "identifierStart":Z
    if-eqz v14, :cond_6

    .line 324
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 325
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_1

    .line 340
    .restart local v7    # "containsEscape":Z
    .restart local v11    # "escapeVal":I
    .restart local v13    # "i":I
    :cond_a
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 350
    :cond_b
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 351
    const/16 v16, 0x0

    .line 352
    goto :goto_2

    .line 353
    .end local v11    # "escapeVal":I
    .end local v13    # "i":I
    :cond_c
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 354
    const/16 v22, 0x5c

    move/from16 v0, v22

    if-ne v5, v0, :cond_e

    .line 355
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 356
    const/16 v22, 0x75

    move/from16 v0, v22

    if-ne v5, v0, :cond_d

    .line 357
    const/16 v16, 0x1

    .line 358
    const/4 v7, 0x1

    goto :goto_2

    .line 360
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.illegal.character"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 361
    const/16 v19, -0x1

    goto/16 :goto_0

    .line 364
    :cond_e
    const/16 v22, -0x1

    move/from16 v0, v22

    if-eq v5, v0, :cond_f

    const v22, 0xfeff

    move/from16 v0, v22

    if-eq v5, v0, :cond_f

    int-to-char v0, v5

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v22

    if-nez v22, :cond_13

    .line 373
    :cond_f
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 375
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v20

    .line 376
    .local v20, "str":Ljava/lang/String;
    if-nez v7, :cond_15

    .line 381
    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/TokenStream;->stringToKeyword(Ljava/lang/String;)I

    move-result v19

    .line 382
    .local v19, "result":I
    if-eqz v19, :cond_12

    .line 383
    const/16 v22, 0x99

    move/from16 v0, v19

    move/from16 v1, v22

    if-eq v0, v1, :cond_10

    const/16 v22, 0x48

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_11

    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v22

    const/16 v23, 0xaa

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_11

    .line 388
    const/16 v22, 0x99

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_14

    const-string v22, "let"

    :goto_4
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 389
    const/16 v19, 0x27

    .line 393
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->allStrings:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 394
    const/16 v22, 0x7f

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_1

    .line 396
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lorg/mozilla/javascript/Parser;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/mozilla/javascript/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v22

    if-eqz v22, :cond_1

    .line 407
    .end local v19    # "result":I
    :cond_12
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->allStrings:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 408
    const/16 v19, 0x27

    goto/16 :goto_0

    .line 369
    .end local v20    # "str":Ljava/lang/String;
    :cond_13
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto/16 :goto_2

    .line 388
    .restart local v19    # "result":I
    .restart local v20    # "str":Ljava/lang/String;
    :cond_14
    const-string v22, "yield"

    goto :goto_4

    .line 402
    .end local v19    # "result":I
    :cond_15
    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/TokenStream;->isKeyword(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_12

    .line 405
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->convertLastCharToHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    goto :goto_5

    .line 412
    .end local v7    # "containsEscape":Z
    .end local v20    # "str":Ljava/lang/String;
    :cond_16
    invoke-static {v5}, Lorg/mozilla/javascript/TokenStream;->isDigit(I)Z

    move-result v22

    if-nez v22, :cond_17

    const/16 v22, 0x2e

    move/from16 v0, v22

    if-ne v5, v0, :cond_29

    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v22

    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/TokenStream;->isDigit(I)Z

    move-result v22

    if-eqz v22, :cond_29

    .line 413
    :cond_17
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->isOctal:Z

    .line 414
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 415
    const/16 v4, 0xa

    .line 416
    .local v4, "base":I
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->isOctal:Z

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->isHex:Z

    .line 418
    const/16 v22, 0x30

    move/from16 v0, v22

    if-ne v5, v0, :cond_19

    .line 419
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 420
    const/16 v22, 0x78

    move/from16 v0, v22

    if-eq v5, v0, :cond_18

    const/16 v22, 0x58

    move/from16 v0, v22

    if-ne v5, v0, :cond_1a

    .line 421
    :cond_18
    const/16 v4, 0x10

    .line 422
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->isHex:Z

    .line 423
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 432
    :cond_19
    :goto_6
    const/16 v22, 0x10

    move/from16 v0, v22

    if-ne v4, v0, :cond_1c

    .line 433
    :goto_7
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-static {v5, v0}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v22

    if-ltz v22, :cond_1f

    .line 434
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 435
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    goto :goto_7

    .line 424
    :cond_1a
    invoke-static {v5}, Lorg/mozilla/javascript/TokenStream;->isDigit(I)Z

    move-result v22

    if-eqz v22, :cond_1b

    .line 425
    const/16 v4, 0x8

    .line 426
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->isOctal:Z

    goto :goto_6

    .line 428
    :cond_1b
    const/16 v22, 0x30

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_6

    .line 438
    :cond_1c
    :goto_8
    const/16 v22, 0x30

    move/from16 v0, v22

    if-gt v0, v5, :cond_1f

    const/16 v22, 0x39

    move/from16 v0, v22

    if-gt v5, v0, :cond_1f

    .line 445
    const/16 v22, 0x8

    move/from16 v0, v22

    if-ne v4, v0, :cond_1d

    const/16 v22, 0x38

    move/from16 v0, v22

    if-lt v5, v0, :cond_1d

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v23, v0

    const-string v24, "msg.bad.octal.literal"

    const/16 v22, 0x38

    move/from16 v0, v22

    if-ne v5, v0, :cond_1e

    const-string v22, "8"

    :goto_9
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    const/16 v4, 0xa

    .line 450
    :cond_1d
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 451
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    goto :goto_8

    .line 446
    :cond_1e
    const-string v22, "9"

    goto :goto_9

    .line 455
    :cond_1f
    const/4 v15, 0x1

    .line 457
    .local v15, "isInteger":Z
    const/16 v22, 0xa

    move/from16 v0, v22

    if-ne v4, v0, :cond_27

    const/16 v22, 0x2e

    move/from16 v0, v22

    if-eq v5, v0, :cond_20

    const/16 v22, 0x65

    move/from16 v0, v22

    if-eq v5, v0, :cond_20

    const/16 v22, 0x45

    move/from16 v0, v22

    if-ne v5, v0, :cond_27

    .line 458
    :cond_20
    const/4 v15, 0x0

    .line 459
    const/16 v22, 0x2e

    move/from16 v0, v22

    if-ne v5, v0, :cond_22

    .line 461
    :cond_21
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 462
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 463
    invoke-static {v5}, Lorg/mozilla/javascript/TokenStream;->isDigit(I)Z

    move-result v22

    if-nez v22, :cond_21

    .line 465
    :cond_22
    const/16 v22, 0x65

    move/from16 v0, v22

    if-eq v5, v0, :cond_23

    const/16 v22, 0x45

    move/from16 v0, v22

    if-ne v5, v0, :cond_27

    .line 466
    :cond_23
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 467
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 468
    const/16 v22, 0x2b

    move/from16 v0, v22

    if-eq v5, v0, :cond_24

    const/16 v22, 0x2d

    move/from16 v0, v22

    if-ne v5, v0, :cond_25

    .line 469
    :cond_24
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 470
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 472
    :cond_25
    invoke-static {v5}, Lorg/mozilla/javascript/TokenStream;->isDigit(I)Z

    move-result v22

    if-nez v22, :cond_26

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.missing.exponent"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 474
    const/16 v19, -0x1

    goto/16 :goto_0

    .line 477
    :cond_26
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 478
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 479
    invoke-static {v5}, Lorg/mozilla/javascript/TokenStream;->isDigit(I)Z

    move-result v22

    if-nez v22, :cond_26

    .line 482
    :cond_27
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 483
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v18

    .line 484
    .local v18, "numString":Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 487
    const/16 v22, 0xa

    move/from16 v0, v22

    if-ne v4, v0, :cond_28

    if-nez v15, :cond_28

    .line 490
    :try_start_0
    invoke-static/range {v18 .. v18}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v8

    .line 500
    .local v8, "dval":D
    :goto_a
    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/mozilla/javascript/TokenStream;->number:D

    .line 501
    const/16 v19, 0x28

    goto/16 :goto_0

    .line 492
    .end local v8    # "dval":D
    :catch_0
    move-exception v12

    .line 493
    .local v12, "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.caught.nfe"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 494
    const/16 v19, -0x1

    goto/16 :goto_0

    .line 497
    .end local v12    # "ex":Ljava/lang/NumberFormatException;
    :cond_28
    const/16 v22, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-static {v0, v1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->stringToNumber(Ljava/lang/String;II)D

    move-result-wide v8

    .restart local v8    # "dval":D
    goto :goto_a

    .line 505
    .end local v4    # "base":I
    .end local v8    # "dval":D
    .end local v15    # "isInteger":Z
    .end local v18    # "numString":Ljava/lang/String;
    :cond_29
    const/16 v22, 0x22

    move/from16 v0, v22

    if-eq v5, v0, :cond_2a

    const/16 v22, 0x27

    move/from16 v0, v22

    if-ne v5, v0, :cond_34

    .line 511
    :cond_2a
    move-object/from16 v0, p0

    iput v5, v0, Lorg/mozilla/javascript/TokenStream;->quoteChar:I

    .line 512
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 514
    const/16 v22, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->getChar(Z)I

    move-result v5

    .line 515
    :cond_2b
    :goto_b
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->quoteChar:I

    move/from16 v22, v0

    move/from16 v0, v22

    if-eq v5, v0, :cond_33

    .line 516
    const/16 v22, 0xa

    move/from16 v0, v22

    if-eq v5, v0, :cond_2c

    const/16 v22, -0x1

    move/from16 v0, v22

    if-ne v5, v0, :cond_2d

    .line 517
    :cond_2c
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 518
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 519
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.unterminated.string.lit"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 520
    const/16 v19, -0x1

    goto/16 :goto_0

    .line 523
    :cond_2d
    const/16 v22, 0x5c

    move/from16 v0, v22

    if-ne v5, v0, :cond_2f

    .line 527
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 528
    sparse-switch v5, :sswitch_data_0

    .line 589
    const/16 v22, 0x30

    move/from16 v0, v22

    if-gt v0, v5, :cond_2f

    const/16 v22, 0x38

    move/from16 v0, v22

    if-ge v5, v0, :cond_2f

    .line 590
    add-int/lit8 v21, v5, -0x30

    .line 591
    .local v21, "val":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 592
    const/16 v22, 0x30

    move/from16 v0, v22

    if-gt v0, v5, :cond_2e

    const/16 v22, 0x38

    move/from16 v0, v22

    if-ge v5, v0, :cond_2e

    .line 593
    mul-int/lit8 v22, v21, 0x8

    add-int v22, v22, v5

    add-int/lit8 v21, v22, -0x30

    .line 594
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 595
    const/16 v22, 0x30

    move/from16 v0, v22

    if-gt v0, v5, :cond_2e

    const/16 v22, 0x38

    move/from16 v0, v22

    if-ge v5, v0, :cond_2e

    const/16 v22, 0x1f

    move/from16 v0, v21

    move/from16 v1, v22

    if-gt v0, v1, :cond_2e

    .line 598
    mul-int/lit8 v22, v21, 0x8

    add-int v22, v22, v5

    add-int/lit8 v21, v22, -0x30

    .line 599
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 602
    :cond_2e
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 603
    move/from16 v5, v21

    .line 607
    .end local v21    # "val":I
    :cond_2f
    :goto_c
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 608
    const/16 v22, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->getChar(Z)I

    move-result v5

    goto/16 :goto_b

    .line 529
    :sswitch_0
    const/16 v5, 0x8

    goto :goto_c

    .line 530
    :sswitch_1
    const/16 v5, 0xc

    goto :goto_c

    .line 531
    :sswitch_2
    const/16 v5, 0xa

    goto :goto_c

    .line 532
    :sswitch_3
    const/16 v5, 0xd

    goto :goto_c

    .line 533
    :sswitch_4
    const/16 v5, 0x9

    goto :goto_c

    .line 537
    :sswitch_5
    const/16 v5, 0xb

    goto :goto_c

    .line 543
    :sswitch_6
    move-object/from16 v0, p0

    iget v10, v0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 544
    .local v10, "escapeStart":I
    const/16 v22, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 545
    const/4 v11, 0x0

    .line 546
    .restart local v11    # "escapeVal":I
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_d
    const/16 v22, 0x4

    move/from16 v0, v22

    if-eq v13, v0, :cond_30

    .line 547
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 548
    invoke-static {v5, v11}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v11

    .line 549
    if-ltz v11, :cond_2b

    .line 552
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 546
    add-int/lit8 v13, v13, 0x1

    goto :goto_d

    .line 556
    :cond_30
    move-object/from16 v0, p0

    iput v10, v0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 557
    move v5, v11

    .line 558
    goto :goto_c

    .line 562
    .end local v10    # "escapeStart":I
    .end local v11    # "escapeVal":I
    .end local v13    # "i":I
    :sswitch_7
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 563
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-static {v5, v0}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v11

    .line 564
    .restart local v11    # "escapeVal":I
    if-gez v11, :cond_31

    .line 565
    const/16 v22, 0x78

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto/16 :goto_b

    .line 568
    :cond_31
    move v6, v5

    .line 569
    .local v6, "c1":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 570
    invoke-static {v5, v11}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v11

    .line 571
    if-gez v11, :cond_32

    .line 572
    const/16 v22, 0x78

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 573
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto/16 :goto_b

    .line 577
    :cond_32
    move v5, v11

    .line 580
    goto/16 :goto_c

    .line 585
    .end local v6    # "c1":I
    .end local v11    # "escapeVal":I
    :sswitch_8
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 586
    goto/16 :goto_b

    .line 611
    :cond_33
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v20

    .line 612
    .restart local v20    # "str":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->allStrings:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 613
    const/16 v19, 0x29

    goto/16 :goto_0

    .line 616
    .end local v20    # "str":Ljava/lang/String;
    :cond_34
    sparse-switch v5, :sswitch_data_1

    .line 832
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.illegal.character"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 833
    const/16 v19, -0x1

    goto/16 :goto_0

    .line 617
    :sswitch_9
    const/16 v19, 0x52

    goto/16 :goto_0

    .line 618
    :sswitch_a
    const/16 v19, 0x53

    goto/16 :goto_0

    .line 619
    :sswitch_b
    const/16 v19, 0x54

    goto/16 :goto_0

    .line 620
    :sswitch_c
    const/16 v19, 0x55

    goto/16 :goto_0

    .line 621
    :sswitch_d
    const/16 v19, 0x56

    goto/16 :goto_0

    .line 622
    :sswitch_e
    const/16 v19, 0x57

    goto/16 :goto_0

    .line 623
    :sswitch_f
    const/16 v19, 0x58

    goto/16 :goto_0

    .line 624
    :sswitch_10
    const/16 v19, 0x59

    goto/16 :goto_0

    .line 625
    :sswitch_11
    const/16 v19, 0x66

    goto/16 :goto_0

    .line 627
    :sswitch_12
    const/16 v22, 0x3a

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_35

    .line 628
    const/16 v19, 0x90

    goto/16 :goto_0

    .line 630
    :cond_35
    const/16 v19, 0x67

    goto/16 :goto_0

    .line 633
    :sswitch_13
    const/16 v22, 0x2e

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_36

    .line 634
    const/16 v19, 0x8f

    goto/16 :goto_0

    .line 635
    :cond_36
    const/16 v22, 0x28

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_37

    .line 636
    const/16 v19, 0x92

    goto/16 :goto_0

    .line 638
    :cond_37
    const/16 v19, 0x6c

    goto/16 :goto_0

    .line 642
    :sswitch_14
    const/16 v22, 0x7c

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_38

    .line 643
    const/16 v19, 0x68

    goto/16 :goto_0

    .line 644
    :cond_38
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_39

    .line 645
    const/16 v19, 0x5b

    goto/16 :goto_0

    .line 647
    :cond_39
    const/16 v19, 0x9

    goto/16 :goto_0

    .line 651
    :sswitch_15
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_3a

    .line 652
    const/16 v19, 0x5c

    goto/16 :goto_0

    .line 654
    :cond_3a
    const/16 v19, 0xa

    goto/16 :goto_0

    .line 658
    :sswitch_16
    const/16 v22, 0x26

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_3b

    .line 659
    const/16 v19, 0x69

    goto/16 :goto_0

    .line 660
    :cond_3b
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_3c

    .line 661
    const/16 v19, 0x5d

    goto/16 :goto_0

    .line 663
    :cond_3c
    const/16 v19, 0xb

    goto/16 :goto_0

    .line 667
    :sswitch_17
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_3e

    .line 668
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_3d

    .line 669
    const/16 v19, 0x2e

    goto/16 :goto_0

    .line 671
    :cond_3d
    const/16 v19, 0xc

    goto/16 :goto_0

    .line 674
    :cond_3e
    const/16 v19, 0x5a

    goto/16 :goto_0

    .line 678
    :sswitch_18
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_40

    .line 679
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_3f

    .line 680
    const/16 v19, 0x2f

    goto/16 :goto_0

    .line 682
    :cond_3f
    const/16 v19, 0xd

    goto/16 :goto_0

    .line 685
    :cond_40
    const/16 v19, 0x1a

    goto/16 :goto_0

    .line 690
    :sswitch_19
    const/16 v22, 0x21

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_43

    .line 691
    const/16 v22, 0x2d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_42

    .line 692
    const/16 v22, 0x2d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_41

    .line 693
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x4

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 694
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->skipLine()V

    .line 695
    sget-object v22, Lorg/mozilla/javascript/Token$CommentType;->HTML:Lorg/mozilla/javascript/Token$CommentType;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    .line 696
    const/16 v19, 0xa1

    goto/16 :goto_0

    .line 698
    :cond_41
    const/16 v22, 0x2d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->ungetCharIgnoreLineEnd(I)V

    .line 700
    :cond_42
    const/16 v22, 0x21

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->ungetCharIgnoreLineEnd(I)V

    .line 702
    :cond_43
    const/16 v22, 0x3c

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_45

    .line 703
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_44

    .line 704
    const/16 v19, 0x5e

    goto/16 :goto_0

    .line 706
    :cond_44
    const/16 v19, 0x12

    goto/16 :goto_0

    .line 709
    :cond_45
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_46

    .line 710
    const/16 v19, 0xf

    goto/16 :goto_0

    .line 712
    :cond_46
    const/16 v19, 0xe

    goto/16 :goto_0

    .line 717
    :sswitch_1a
    const/16 v22, 0x3e

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_4a

    .line 718
    const/16 v22, 0x3e

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_48

    .line 719
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_47

    .line 720
    const/16 v19, 0x60

    goto/16 :goto_0

    .line 722
    :cond_47
    const/16 v19, 0x14

    goto/16 :goto_0

    .line 725
    :cond_48
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_49

    .line 726
    const/16 v19, 0x5f

    goto/16 :goto_0

    .line 728
    :cond_49
    const/16 v19, 0x13

    goto/16 :goto_0

    .line 732
    :cond_4a
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_4b

    .line 733
    const/16 v19, 0x11

    goto/16 :goto_0

    .line 735
    :cond_4b
    const/16 v19, 0x10

    goto/16 :goto_0

    .line 740
    :sswitch_1b
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_4c

    .line 741
    const/16 v19, 0x63

    goto/16 :goto_0

    .line 743
    :cond_4c
    const/16 v19, 0x17

    goto/16 :goto_0

    .line 747
    :sswitch_1c
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->markCommentStart()V

    .line 749
    const/16 v22, 0x2f

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_4d

    .line 750
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x2

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 751
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->skipLine()V

    .line 752
    sget-object v22, Lorg/mozilla/javascript/Token$CommentType;->LINE:Lorg/mozilla/javascript/Token$CommentType;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    .line 753
    const/16 v19, 0xa1

    goto/16 :goto_0

    .line 756
    :cond_4d
    const/16 v22, 0x2a

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_53

    .line 757
    const/16 v17, 0x0

    .line 758
    .local v17, "lookForSlash":Z
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x2

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 759
    const/16 v22, 0x2a

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_4f

    .line 760
    const/16 v17, 0x1

    .line 761
    sget-object v22, Lorg/mozilla/javascript/Token$CommentType;->JSDOC:Lorg/mozilla/javascript/Token$CommentType;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    .line 766
    :cond_4e
    :goto_e
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v5

    .line 767
    const/16 v22, -0x1

    move/from16 v0, v22

    if-ne v5, v0, :cond_50

    .line 768
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 769
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    move-object/from16 v22, v0

    const-string v23, "msg.unterminated.comment"

    invoke-virtual/range {v22 .. v23}, Lorg/mozilla/javascript/Parser;->addError(Ljava/lang/String;)V

    .line 770
    const/16 v19, 0xa1

    goto/16 :goto_0

    .line 763
    :cond_4f
    sget-object v22, Lorg/mozilla/javascript/Token$CommentType;->BLOCK_COMMENT:Lorg/mozilla/javascript/Token$CommentType;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    goto :goto_e

    .line 771
    :cond_50
    const/16 v22, 0x2a

    move/from16 v0, v22

    if-ne v5, v0, :cond_51

    .line 772
    const/16 v17, 0x1

    goto :goto_e

    .line 773
    :cond_51
    const/16 v22, 0x2f

    move/from16 v0, v22

    if-ne v5, v0, :cond_52

    .line 774
    if-eqz v17, :cond_4e

    .line 775
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 776
    const/16 v19, 0xa1

    goto/16 :goto_0

    .line 779
    :cond_52
    const/16 v17, 0x0

    .line 780
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    goto :goto_e

    .line 785
    .end local v17    # "lookForSlash":Z
    :cond_53
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_54

    .line 786
    const/16 v19, 0x64

    goto/16 :goto_0

    .line 788
    :cond_54
    const/16 v19, 0x18

    goto/16 :goto_0

    .line 792
    :sswitch_1d
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_55

    .line 793
    const/16 v19, 0x65

    goto/16 :goto_0

    .line 795
    :cond_55
    const/16 v19, 0x19

    goto/16 :goto_0

    .line 799
    :sswitch_1e
    const/16 v19, 0x1b

    goto/16 :goto_0

    .line 802
    :sswitch_1f
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_56

    .line 803
    const/16 v19, 0x61

    goto/16 :goto_0

    .line 804
    :cond_56
    const/16 v22, 0x2b

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_57

    .line 805
    const/16 v19, 0x6a

    goto/16 :goto_0

    .line 807
    :cond_57
    const/16 v19, 0x15

    goto/16 :goto_0

    .line 811
    :sswitch_20
    const/16 v22, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_58

    .line 812
    const/16 v5, 0x62

    .line 828
    :goto_f
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/TokenStream;->dirtyLine:Z

    move/from16 v19, v5

    .line 829
    goto/16 :goto_0

    .line 813
    :cond_58
    const/16 v22, 0x2d

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_5a

    .line 814
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/TokenStream;->dirtyLine:Z

    move/from16 v22, v0

    if-nez v22, :cond_59

    .line 817
    const/16 v22, 0x3e

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v22

    if-eqz v22, :cond_59

    .line 818
    const-string v22, "--"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/TokenStream;->markCommentStart(Ljava/lang/String;)V

    .line 819
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/TokenStream;->skipLine()V

    .line 820
    sget-object v22, Lorg/mozilla/javascript/Token$CommentType;->HTML:Lorg/mozilla/javascript/Token$CommentType;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/TokenStream;->commentType:Lorg/mozilla/javascript/Token$CommentType;

    .line 821
    const/16 v19, 0xa1

    goto/16 :goto_0

    .line 824
    :cond_59
    const/16 v5, 0x6b

    goto :goto_f

    .line 826
    :cond_5a
    const/16 v5, 0x16

    goto :goto_f

    .line 528
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_8
        0x62 -> :sswitch_0
        0x66 -> :sswitch_1
        0x6e -> :sswitch_2
        0x72 -> :sswitch_3
        0x74 -> :sswitch_4
        0x75 -> :sswitch_6
        0x76 -> :sswitch_5
        0x78 -> :sswitch_7
    .end sparse-switch

    .line 616
    :sswitch_data_1
    .sparse-switch
        0x21 -> :sswitch_18
        0x25 -> :sswitch_1d
        0x26 -> :sswitch_16
        0x28 -> :sswitch_e
        0x29 -> :sswitch_f
        0x2a -> :sswitch_1b
        0x2b -> :sswitch_1f
        0x2c -> :sswitch_10
        0x2d -> :sswitch_20
        0x2e -> :sswitch_13
        0x2f -> :sswitch_1c
        0x3a -> :sswitch_12
        0x3b -> :sswitch_9
        0x3c -> :sswitch_19
        0x3d -> :sswitch_17
        0x3e -> :sswitch_1a
        0x3f -> :sswitch_11
        0x5b -> :sswitch_a
        0x5d -> :sswitch_b
        0x5e -> :sswitch_15
        0x7b -> :sswitch_c
        0x7c -> :sswitch_14
        0x7d -> :sswitch_d
        0x7e -> :sswitch_1e
    .end sparse-switch
.end method

.method public getTokenBeg()I
    .locals 1

    .prologue
    .line 1538
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    return v0
.end method

.method public getTokenEnd()I
    .locals 1

    .prologue
    .line 1545
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    return v0
.end method

.method public getTokenLength()I
    .locals 2

    .prologue
    .line 1552
    iget v0, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    iget v1, p0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    sub-int/2addr v0, v1

    return v0
.end method

.method final isNumberHex()Z
    .locals 1

    .prologue
    .line 270
    iget-boolean v0, p0, Lorg/mozilla/javascript/TokenStream;->isHex:Z

    return v0
.end method

.method final isNumberOctal()Z
    .locals 1

    .prologue
    .line 269
    iget-boolean v0, p0, Lorg/mozilla/javascript/TokenStream;->isOctal:Z

    return v0
.end method

.method isXMLAttribute()Z
    .locals 1

    .prologue
    .line 940
    iget-boolean v0, p0, Lorg/mozilla/javascript/TokenStream;->xmlIsAttribute:Z

    return v0
.end method

.method readAndClearRegExpFlags()Ljava/lang/String;
    .locals 2

    .prologue
    .line 933
    iget-object v0, p0, Lorg/mozilla/javascript/TokenStream;->regExpFlags:Ljava/lang/String;

    .line 934
    .local v0, "flags":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/mozilla/javascript/TokenStream;->regExpFlags:Ljava/lang/String;

    .line 935
    return-object v0
.end method

.method readRegExp(I)V
    .locals 10
    .param p1, "startToken"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x79

    const/16 v8, 0x6d

    const/16 v6, 0x69

    const/16 v5, 0x67

    const/4 v7, 0x0

    .line 878
    iget v3, p0, Lorg/mozilla/javascript/TokenStream;->tokenBeg:I

    .line 879
    .local v3, "start":I
    iput v7, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 880
    const/16 v4, 0x64

    if-ne p1, v4, :cond_3

    .line 882
    const/16 v4, 0x3d

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 887
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 889
    .local v1, "inCharSet":Z
    :goto_1
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    const/16 v4, 0x2f

    if-ne v0, v4, :cond_1

    if-eqz v1, :cond_8

    .line 890
    :cond_1
    const/16 v4, 0xa

    if-eq v0, v4, :cond_2

    const/4 v4, -0x1

    if-ne v0, v4, :cond_4

    .line 891
    :cond_2
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->ungetChar(I)V

    .line 892
    iget v4, p0, Lorg/mozilla/javascript/TokenStream;->cursor:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 893
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    iget v6, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    invoke-direct {v4, v5, v7, v6}, Ljava/lang/String;-><init>([CII)V

    iput-object v4, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 894
    iget-object v4, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v5, "msg.unterminated.re.lit"

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 930
    :goto_2
    return-void

    .line 884
    .end local v0    # "c":I
    .end local v1    # "inCharSet":Z
    :cond_3
    const/16 v4, 0x18

    if-eq p1, v4, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_0

    .line 897
    .restart local v0    # "c":I
    .restart local v1    # "inCharSet":Z
    :cond_4
    const/16 v4, 0x5c

    if-ne v0, v4, :cond_6

    .line 898
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    .line 899
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->getChar()I

    move-result v0

    .line 905
    :cond_5
    :goto_3
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_1

    .line 900
    :cond_6
    const/16 v4, 0x5b

    if-ne v0, v4, :cond_7

    .line 901
    const/4 v1, 0x1

    goto :goto_3

    .line 902
    :cond_7
    const/16 v4, 0x5d

    if-ne v0, v4, :cond_5

    .line 903
    const/4 v1, 0x0

    goto :goto_3

    .line 907
    :cond_8
    iget v2, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    .line 910
    .local v2, "reEnd":I
    :goto_4
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 911
    invoke-direct {p0, v5}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_4

    .line 912
    :cond_9
    invoke-direct {p0, v6}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 913
    invoke-direct {p0, v6}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_4

    .line 914
    :cond_a
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 915
    invoke-direct {p0, v8}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_4

    .line 916
    :cond_b
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/TokenStream;->matchChar(I)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 917
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/TokenStream;->addToString(I)V

    goto :goto_4

    .line 921
    :cond_c
    iget v4, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    add-int/2addr v4, v3

    add-int/lit8 v4, v4, 0x2

    iput v4, p0, Lorg/mozilla/javascript/TokenStream;->tokenEnd:I

    .line 923
    invoke-direct {p0}, Lorg/mozilla/javascript/TokenStream;->peekChar()I

    move-result v4

    invoke-static {v4}, Lorg/mozilla/javascript/TokenStream;->isAlpha(I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 924
    iget-object v4, p0, Lorg/mozilla/javascript/TokenStream;->parser:Lorg/mozilla/javascript/Parser;

    const-string v5, "msg.invalid.re.flag"

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/Parser;->reportError(Ljava/lang/String;)V

    .line 927
    :cond_d
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    invoke-direct {v4, v5, v7, v2}, Ljava/lang/String;-><init>([CII)V

    iput-object v4, p0, Lorg/mozilla/javascript/TokenStream;->string:Ljava/lang/String;

    .line 928
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lorg/mozilla/javascript/TokenStream;->stringBuffer:[C

    iget v6, p0, Lorg/mozilla/javascript/TokenStream;->stringBufferTop:I

    sub-int/2addr v6, v2

    invoke-direct {v4, v5, v2, v6}, Ljava/lang/String;-><init>([CII)V

    iput-object v4, p0, Lorg/mozilla/javascript/TokenStream;->regExpFlags:Ljava/lang/String;

    goto :goto_2
.end method

.method tokenToString(I)Ljava/lang/String;
    .locals 1
    .param p1, "token"    # I

    .prologue
    .line 74
    const-string v0, ""

    return-object v0
.end method
