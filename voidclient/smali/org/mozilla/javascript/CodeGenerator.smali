.class Lorg/mozilla/javascript/CodeGenerator;
.super Lorg/mozilla/javascript/Icode;
.source "CodeGenerator.java"


# static fields
.field private static final ECF_TAIL:I = 0x1

.field private static final MIN_FIXUP_TABLE_SIZE:I = 0x28

.field private static final MIN_LABEL_TABLE_SIZE:I = 0x20


# instance fields
.field private compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

.field private doubleTableTop:I

.field private exceptionTableTop:I

.field private fixupTable:[J

.field private fixupTableTop:I

.field private iCodeTop:I

.field private itsData:Lorg/mozilla/javascript/InterpreterData;

.field private itsInFunctionFlag:Z

.field private itsInTryFlag:Z

.field private labelTable:[I

.field private labelTableTop:I

.field private lineNumber:I

.field private literalIds:Lorg/mozilla/javascript/ObjArray;

.field private localTop:I

.field private scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

.field private stackDepth:I

.field private strings:Lorg/mozilla/javascript/ObjToIntMap;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/mozilla/javascript/Icode;-><init>()V

    .line 35
    new-instance v0, Lorg/mozilla/javascript/ObjToIntMap;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    iput-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    .line 43
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    return-void
.end method

.method private addBackwardGoto(II)V
    .locals 2
    .param p1, "gotoOp"    # I
    .param p2, "jumpPC"    # I

    .prologue
    .line 1210
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1212
    .local v0, "fromPC":I
    if-gt v0, p2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1213
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addGotoOp(I)V

    .line 1214
    invoke-direct {p0, v0, p2}, Lorg/mozilla/javascript/CodeGenerator;->resolveGoto(II)V

    .line 1215
    return-void
.end method

.method private addExceptionHandler(IIIZII)V
    .locals 4
    .param p1, "icodeStart"    # I
    .param p2, "icodeEnd"    # I
    .param p3, "handlerStart"    # I
    .param p4, "isFinally"    # Z
    .param p5, "exceptionObjectLocal"    # I
    .param p6, "scopeLocal"    # I

    .prologue
    const/4 v2, 0x0

    .line 1409
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->exceptionTableTop:I

    .line 1410
    .local v1, "top":I
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v3, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 1411
    .local v0, "table":[I
    if-nez v0, :cond_3

    .line 1412
    if-eqz v1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1413
    :cond_0
    const/16 v3, 0xc

    new-array v0, v3, [I

    .line 1414
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v0, v3, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 1420
    :cond_1
    :goto_0
    add-int/lit8 v3, v1, 0x0

    aput p1, v0, v3

    .line 1421
    add-int/lit8 v3, v1, 0x1

    aput p2, v0, v3

    .line 1422
    add-int/lit8 v3, v1, 0x2

    aput p3, v0, v3

    .line 1423
    add-int/lit8 v3, v1, 0x3

    if-eqz p4, :cond_2

    const/4 v2, 0x1

    :cond_2
    aput v2, v0, v3

    .line 1424
    add-int/lit8 v2, v1, 0x4

    aput p5, v0, v2

    .line 1425
    add-int/lit8 v2, v1, 0x5

    aput p6, v0, v2

    .line 1427
    add-int/lit8 v2, v1, 0x6

    iput v2, p0, Lorg/mozilla/javascript/CodeGenerator;->exceptionTableTop:I

    .line 1428
    return-void

    .line 1415
    :cond_3
    array-length v3, v0

    if-ne v3, v1, :cond_1

    .line 1416
    array-length v3, v0

    mul-int/lit8 v3, v3, 0x2

    new-array v0, v3, [I

    .line 1417
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1418
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v0, v3, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    goto :goto_0
.end method

.method private addGoto(Lorg/mozilla/javascript/Node;I)V
    .locals 10
    .param p1, "target"    # Lorg/mozilla/javascript/Node;
    .param p2, "gotoOp"    # I

    .prologue
    const/4 v6, 0x0

    .line 1168
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 1169
    .local v1, "label":I
    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTableTop:I

    if-lt v1, v5, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1170
    :cond_0
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    aget v2, v5, v1

    .line 1172
    .local v2, "targetPC":I
    const/4 v5, -0x1

    if-eq v2, v5, :cond_1

    .line 1173
    invoke-direct {p0, p2, v2}, Lorg/mozilla/javascript/CodeGenerator;->addBackwardGoto(II)V

    .line 1190
    :goto_0
    return-void

    .line 1175
    :cond_1
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1176
    .local v0, "gotoPC":I
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/CodeGenerator;->addGotoOp(I)V

    .line 1177
    iget v4, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTableTop:I

    .line 1178
    .local v4, "top":I
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    if-eqz v5, :cond_2

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    array-length v5, v5

    if-ne v4, v5, :cond_3

    .line 1179
    :cond_2
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    if-nez v5, :cond_4

    .line 1180
    const/16 v5, 0x28

    new-array v5, v5, [J

    iput-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    .line 1187
    :cond_3
    :goto_1
    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTableTop:I

    .line 1188
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    int-to-long v6, v1

    const/16 v8, 0x20

    shl-long/2addr v6, v8

    int-to-long v8, v0

    or-long/2addr v6, v8

    aput-wide v6, v5, v4

    goto :goto_0

    .line 1182
    :cond_4
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x2

    new-array v3, v5, [J

    .line 1183
    .local v3, "tmp":[J
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    invoke-static {v5, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1184
    iput-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    goto :goto_1
.end method

.method private addGotoOp(I)V
    .locals 4
    .param p1, "gotoOp"    # I

    .prologue
    .line 1311
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v2, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 1312
    .local v0, "array":[B
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1313
    .local v1, "top":I
    add-int/lit8 v2, v1, 0x3

    array-length v3, v0

    if-le v2, v3, :cond_0

    .line 1314
    const/4 v2, 0x3

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1316
    :cond_0
    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 1318
    add-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1319
    return-void
.end method

.method private addIcode(I)V
    .locals 1
    .param p1, "icode"    # I

    .prologue
    .line 1250
    invoke-static {p1}, Lorg/mozilla/javascript/Icode;->validIcode(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1252
    :cond_0
    and-int/lit16 v0, p1, 0xff

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 1253
    return-void
.end method

.method private addIndexOp(II)V
    .locals 1
    .param p1, "op"    # I
    .param p2, "index"    # I

    .prologue
    .line 1359
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexPrefix(I)V

    .line 1360
    invoke-static {p1}, Lorg/mozilla/javascript/Icode;->validIcode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1361
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1365
    :goto_0
    return-void

    .line 1363
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto :goto_0
.end method

.method private addIndexPrefix(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 1390
    if-gez p1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1391
    :cond_0
    const/4 v0, 0x6

    if-ge p1, v0, :cond_1

    .line 1392
    rsub-int/lit8 v0, p1, -0x20

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1403
    :goto_0
    return-void

    .line 1393
    :cond_1
    const/16 v0, 0xff

    if-gt p1, v0, :cond_2

    .line 1394
    const/16 v0, -0x26

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1395
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1396
    :cond_2
    const v0, 0xffff

    if-gt p1, v0, :cond_3

    .line 1397
    const/16 v0, -0x27

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1398
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    goto :goto_0

    .line 1400
    :cond_3
    const/16 v0, -0x28

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1401
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addInt(I)V

    goto :goto_0
.end method

.method private addInt(I)V
    .locals 4
    .param p1, "i"    # I

    .prologue
    .line 1282
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v2, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 1283
    .local v0, "array":[B
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1284
    .local v1, "top":I
    add-int/lit8 v2, v1, 0x4

    array-length v3, v0

    if-le v2, v3, :cond_0

    .line 1285
    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1287
    :cond_0
    ushr-int/lit8 v2, p1, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1288
    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v3, p1, 0x10

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 1289
    add-int/lit8 v2, v1, 0x2

    ushr-int/lit8 v3, p1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 1290
    add-int/lit8 v2, v1, 0x3

    int-to-byte v3, p1

    aput-byte v3, v0, v2

    .line 1291
    add-int/lit8 v2, v1, 0x4

    iput v2, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1292
    return-void
.end method

.method private addStringOp(ILjava/lang/String;)V
    .locals 1
    .param p1, "op"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 1349
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/CodeGenerator;->addStringPrefix(Ljava/lang/String;)V

    .line 1350
    invoke-static {p1}, Lorg/mozilla/javascript/Icode;->validIcode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1351
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1355
    :goto_0
    return-void

    .line 1353
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto :goto_0
.end method

.method private addStringPrefix(Ljava/lang/String;)V
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 1369
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v1, p1, v2}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v0

    .line 1370
    .local v0, "index":I
    if-ne v0, v2, :cond_0

    .line 1371
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap;->size()I

    move-result v0

    .line 1372
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v1, p1, v0}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 1374
    :cond_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    .line 1375
    rsub-int/lit8 v1, v0, -0x29

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1386
    :goto_0
    return-void

    .line 1376
    :cond_1
    const/16 v1, 0xff

    if-gt v0, v1, :cond_2

    .line 1377
    const/16 v1, -0x2d

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1378
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1379
    :cond_2
    const v1, 0xffff

    if-gt v0, v1, :cond_3

    .line 1380
    const/16 v1, -0x2e

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1381
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    goto :goto_0

    .line 1383
    :cond_3
    const/16 v1, -0x2f

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1384
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addInt(I)V

    goto :goto_0
.end method

.method private addToken(I)V
    .locals 1
    .param p1, "token"    # I

    .prologue
    .line 1244
    invoke-static {p1}, Lorg/mozilla/javascript/Icode;->validTokenCode(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1245
    :cond_0
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 1246
    return-void
.end method

.method private addUint16(I)V
    .locals 4
    .param p1, "value"    # I

    .prologue
    .line 1269
    const/high16 v2, -0x10000

    and-int/2addr v2, p1

    if-eqz v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1270
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v2, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 1271
    .local v0, "array":[B
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1272
    .local v1, "top":I
    add-int/lit8 v2, v1, 0x2

    array-length v3, v0

    if-le v2, v3, :cond_1

    .line 1273
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1275
    :cond_1
    ushr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1276
    add-int/lit8 v2, v1, 0x1

    int-to-byte v3, p1

    aput-byte v3, v0, v2

    .line 1277
    add-int/lit8 v2, v1, 0x2

    iput v2, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1278
    return-void
.end method

.method private addUint8(I)V
    .locals 3
    .param p1, "value"    # I

    .prologue
    .line 1257
    and-int/lit16 v2, p1, -0x100

    if-eqz v2, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1258
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v2, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 1259
    .local v0, "array":[B
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1260
    .local v1, "top":I
    array-length v2, v0

    if-ne v1, v2, :cond_1

    .line 1261
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1263
    :cond_1
    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 1264
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1265
    return-void
.end method

.method private addVarOp(II)V
    .locals 1
    .param p1, "op"    # I
    .param p2, "varIndex"    # I

    .prologue
    const/16 v0, 0x80

    .line 1323
    sparse-switch p1, :sswitch_data_0

    .line 1344
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1325
    :sswitch_0
    if-ge p2, v0, :cond_0

    .line 1326
    const/16 v0, -0x3d

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1327
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 1342
    :goto_0
    return-void

    .line 1330
    :cond_0
    const/16 v0, -0x3c

    invoke-direct {p0, v0, p2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto :goto_0

    .line 1334
    :sswitch_1
    if-ge p2, v0, :cond_2

    .line 1335
    const/16 v0, 0x37

    if-ne p1, v0, :cond_1

    const/16 v0, -0x30

    :goto_1
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1336
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1335
    :cond_1
    const/16 v0, -0x31

    goto :goto_1

    .line 1341
    :cond_2
    :sswitch_2
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto :goto_0

    .line 1323
    nop

    :sswitch_data_0
    .sparse-switch
        -0x7 -> :sswitch_2
        0x37 -> :sswitch_1
        0x38 -> :sswitch_1
        0x9c -> :sswitch_0
    .end sparse-switch
.end method

.method private allocLocal()I
    .locals 3

    .prologue
    .line 1460
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    .line 1461
    .local v0, "localSlot":I
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    .line 1462
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v2, v2, Lorg/mozilla/javascript/InterpreterData;->itsMaxLocals:I

    if-le v1, v2, :cond_0

    .line 1463
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v2, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    iput v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsMaxLocals:I

    .line 1465
    :cond_0
    return v0
.end method

.method private badTree(Lorg/mozilla/javascript/Node;)Ljava/lang/RuntimeException;
    .locals 2
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 226
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private fixLabelGotos()V
    .locals 8

    .prologue
    .line 1194
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v6, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTableTop:I

    if-ge v2, v6, :cond_1

    .line 1195
    iget-object v6, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTable:[J

    aget-wide v0, v6, v2

    .line 1196
    .local v0, "fixup":J
    const/16 v6, 0x20

    shr-long v6, v0, v6

    long-to-int v4, v6

    .line 1197
    .local v4, "label":I
    long-to-int v3, v0

    .line 1198
    .local v3, "jumpSource":I
    iget-object v6, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    aget v5, v6, v4

    .line 1199
    .local v5, "pc":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    .line 1201
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 1203
    :cond_0
    invoke-direct {p0, v3, v5}, Lorg/mozilla/javascript/CodeGenerator;->resolveGoto(II)V

    .line 1194
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1205
    .end local v0    # "fixup":J
    .end local v3    # "jumpSource":I
    .end local v4    # "label":I
    .end local v5    # "pc":I
    :cond_1
    const/4 v6, 0x0

    iput v6, p0, Lorg/mozilla/javascript/CodeGenerator;->fixupTableTop:I

    .line 1206
    return-void
.end method

.method private generateCallFunAndThis(Lorg/mozilla/javascript/Node;)V
    .locals 8
    .param p1, "left"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 975
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v4

    .line 976
    .local v4, "type":I
    sparse-switch v4, :sswitch_data_0

    .line 1003
    invoke-direct {p0, p1, v6}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1005
    const/16 v5, -0x12

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1006
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 1009
    :goto_0
    return-void

    .line 978
    :sswitch_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 980
    .local v1, "name":Ljava/lang/String;
    const/16 v5, -0xf

    invoke-direct {p0, v5, v1}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 981
    const/4 v5, 0x2

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 986
    .end local v1    # "name":Ljava/lang/String;
    :sswitch_1
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 987
    .local v3, "target":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v3, v6}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 988
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 989
    .local v0, "id":Lorg/mozilla/javascript/Node;
    const/16 v5, 0x21

    if-ne v4, v5, :cond_0

    .line 990
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 992
    .local v2, "property":Ljava/lang/String;
    const/16 v5, -0x10

    invoke-direct {p0, v5, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 993
    invoke-direct {p0, v7}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 995
    .end local v2    # "property":Ljava/lang/String;
    :cond_0
    invoke-direct {p0, v0, v6}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 997
    const/16 v5, -0x11

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto :goto_0

    .line 976
    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_1
        0x24 -> :sswitch_1
        0x27 -> :sswitch_0
    .end sparse-switch
.end method

.method private generateFunctionICode()V
    .locals 3

    .prologue
    .line 90
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsInFunctionFlag:Z

    .line 92
    iget-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    check-cast v0, Lorg/mozilla/javascript/ast/FunctionNode;

    .line 94
    .local v0, "theFunction":Lorg/mozilla/javascript/ast/FunctionNode;
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v2

    iput v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    .line 95
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v2

    iput-boolean v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    .line 96
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionName()Lorg/mozilla/javascript/ast/Name;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 97
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    .line 99
    :cond_0
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->isGenerator()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 100
    const/16 v1, -0x3e

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 101
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getBaseLineno()I

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    .line 104
    :cond_1
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->generateICodeFromTree(Lorg/mozilla/javascript/Node;)V

    .line 105
    return-void
.end method

.method private generateICodeFromTree(Lorg/mozilla/javascript/Node;)V
    .locals 8
    .param p1, "tree"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 109
    invoke-direct {p0}, Lorg/mozilla/javascript/CodeGenerator;->generateNestedFunctions()V

    .line 111
    invoke-direct {p0}, Lorg/mozilla/javascript/CodeGenerator;->generateRegExpLiterals()V

    .line 113
    invoke-direct {p0, p1, v6}, Lorg/mozilla/javascript/CodeGenerator;->visitStatement(Lorg/mozilla/javascript/Node;I)V

    .line 114
    invoke-direct {p0}, Lorg/mozilla/javascript/CodeGenerator;->fixLabelGotos()V

    .line 116
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    if-nez v4, :cond_0

    .line 117
    const/16 v4, 0x40

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 120
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    array-length v4, v4

    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    if-eq v4, v5, :cond_1

    .line 123
    iget v4, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    new-array v3, v4, [B

    .line 124
    .local v3, "tmp":[B
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    invoke-static {v4, v6, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 125
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v3, v4, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 127
    .end local v3    # "tmp":[B
    :cond_1
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ObjToIntMap;->size()I

    move-result v4

    if-nez v4, :cond_6

    .line 128
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v7, v4, Lorg/mozilla/javascript/InterpreterData;->itsStringTable:[Ljava/lang/String;

    .line 139
    :cond_2
    iget v4, p0, Lorg/mozilla/javascript/CodeGenerator;->doubleTableTop:I

    if-nez v4, :cond_8

    .line 140
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v7, v4, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    .line 147
    :cond_3
    :goto_0
    iget v4, p0, Lorg/mozilla/javascript/CodeGenerator;->exceptionTableTop:I

    if-eqz v4, :cond_4

    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    array-length v4, v4

    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->exceptionTableTop:I

    if-eq v4, v5, :cond_4

    .line 150
    iget v4, p0, Lorg/mozilla/javascript/CodeGenerator;->exceptionTableTop:I

    new-array v3, v4, [I

    .line 151
    .local v3, "tmp":[I
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->exceptionTableTop:I

    invoke-static {v4, v6, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v3, v4, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 156
    .end local v3    # "tmp":[I
    :cond_4
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarCount()I

    move-result v5

    iput v5, v4, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    .line 159
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v5, v5, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    iget-object v6, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsMaxLocals:I

    add-int/2addr v5, v6

    iget-object v6, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsMaxStack:I

    add-int/2addr v5, v6

    iput v5, v4, Lorg/mozilla/javascript/InterpreterData;->itsMaxFrameArray:I

    .line 163
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarNames()[Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    .line 164
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamAndVarConst()[Z

    move-result-object v5

    iput-object v5, v4, Lorg/mozilla/javascript/InterpreterData;->argIsConst:[Z

    .line 165
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getParamCount()I

    move-result v5

    iput v5, v4, Lorg/mozilla/javascript/InterpreterData;->argCount:I

    .line 167
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getEncodedSourceStart()I

    move-result v5

    iput v5, v4, Lorg/mozilla/javascript/InterpreterData;->encodedSourceStart:I

    .line 168
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getEncodedSourceEnd()I

    move-result v5

    iput v5, v4, Lorg/mozilla/javascript/InterpreterData;->encodedSourceEnd:I

    .line 170
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v4

    if-eqz v4, :cond_5

    .line 171
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ObjArray;->toArray()[Ljava/lang/Object;

    move-result-object v5

    iput-object v5, v4, Lorg/mozilla/javascript/InterpreterData;->literalIds:[Ljava/lang/Object;

    .line 175
    :cond_5
    return-void

    .line 130
    :cond_6
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ObjToIntMap;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, v4, Lorg/mozilla/javascript/InterpreterData;->itsStringTable:[Ljava/lang/String;

    .line 131
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->strings:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v4}, Lorg/mozilla/javascript/ObjToIntMap;->newIterator()Lorg/mozilla/javascript/ObjToIntMap$Iterator;

    move-result-object v1

    .line 132
    .local v1, "iter":Lorg/mozilla/javascript/ObjToIntMap$Iterator;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->start()V

    :goto_1
    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->done()Z

    move-result v4

    if-nez v4, :cond_2

    .line 133
    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 134
    .local v2, "str":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->getValue()I

    move-result v0

    .line 135
    .local v0, "index":I
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsStringTable:[Ljava/lang/String;

    aget-object v4, v4, v0

    if-eqz v4, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 136
    :cond_7
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsStringTable:[Ljava/lang/String;

    aput-object v2, v4, v0

    .line 132
    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjToIntMap$Iterator;->next()V

    goto :goto_1

    .line 141
    .end local v0    # "index":I
    .end local v1    # "iter":Lorg/mozilla/javascript/ObjToIntMap$Iterator;
    .end local v2    # "str":Ljava/lang/String;
    :cond_8
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    array-length v4, v4

    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->doubleTableTop:I

    if-eq v4, v5, :cond_3

    .line 142
    iget v4, p0, Lorg/mozilla/javascript/CodeGenerator;->doubleTableTop:I

    new-array v3, v4, [D

    .line 143
    .local v3, "tmp":[D
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    iget v5, p0, Lorg/mozilla/javascript/CodeGenerator;->doubleTableTop:I

    invoke-static {v4, v6, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    iget-object v4, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v3, v4, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    goto/16 :goto_0
.end method

.method private generateNestedFunctions()V
    .locals 7

    .prologue
    .line 179
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v2

    .line 180
    .local v2, "functionCount":I
    if-nez v2, :cond_0

    .line 193
    :goto_0
    return-void

    .line 182
    :cond_0
    new-array v0, v2, [Lorg/mozilla/javascript/InterpreterData;

    .line 183
    .local v0, "array":[Lorg/mozilla/javascript/InterpreterData;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v2, :cond_1

    .line 184
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v5, v4}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v1

    .line 185
    .local v1, "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    new-instance v3, Lorg/mozilla/javascript/CodeGenerator;

    invoke-direct {v3}, Lorg/mozilla/javascript/CodeGenerator;-><init>()V

    .line 186
    .local v3, "gen":Lorg/mozilla/javascript/CodeGenerator;
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    iput-object v5, v3, Lorg/mozilla/javascript/CodeGenerator;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 187
    iput-object v1, v3, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    .line 188
    new-instance v5, Lorg/mozilla/javascript/InterpreterData;

    iget-object v6, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-direct {v5, v6}, Lorg/mozilla/javascript/InterpreterData;-><init>(Lorg/mozilla/javascript/InterpreterData;)V

    iput-object v5, v3, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    .line 189
    invoke-direct {v3}, Lorg/mozilla/javascript/CodeGenerator;->generateFunctionICode()V

    .line 190
    iget-object v5, v3, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    aput-object v5, v0, v4

    .line 183
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 192
    .end local v1    # "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    .end local v3    # "gen":Lorg/mozilla/javascript/CodeGenerator;
    :cond_1
    iget-object v5, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v0, v5, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    goto :goto_0
.end method

.method private generateRegExpLiterals()V
    .locals 8

    .prologue
    .line 197
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpCount()I

    move-result v0

    .line 198
    .local v0, "N":I
    if-nez v0, :cond_0

    .line 209
    :goto_0
    return-void

    .line 200
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    .line 201
    .local v2, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->checkRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v5

    .line 202
    .local v5, "rep":Lorg/mozilla/javascript/RegExpProxy;
    new-array v1, v0, [Ljava/lang/Object;

    .line 203
    .local v1, "array":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v0, :cond_1

    .line 204
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v7, v4}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpString(I)Ljava/lang/String;

    move-result-object v6

    .line 205
    .local v6, "string":Ljava/lang/String;
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v7, v4}, Lorg/mozilla/javascript/ast/ScriptNode;->getRegexpFlags(I)Ljava/lang/String;

    move-result-object v3

    .line 206
    .local v3, "flags":Ljava/lang/String;
    invoke-interface {v5, v2, v6, v3}, Lorg/mozilla/javascript/RegExpProxy;->compileRegExp(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v1, v4

    .line 203
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 208
    .end local v3    # "flags":Ljava/lang/String;
    .end local v6    # "string":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v1, v7, Lorg/mozilla/javascript/InterpreterData;->itsRegExpLiterals:[Ljava/lang/Object;

    goto :goto_0
.end method

.method private getDoubleIndex(D)I
    .locals 5
    .param p1, "num"    # D

    .prologue
    const/4 v3, 0x0

    .line 1296
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->doubleTableTop:I

    .line 1297
    .local v0, "index":I
    if-nez v0, :cond_1

    .line 1298
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    const/16 v3, 0x40

    new-array v3, v3, [D

    iput-object v3, v2, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    .line 1304
    :cond_0
    :goto_0
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v2, v2, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    aput-wide p1, v2, v0

    .line 1305
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/mozilla/javascript/CodeGenerator;->doubleTableTop:I

    .line 1306
    return v0

    .line 1299
    :cond_1
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v2, v2, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    array-length v2, v2

    if-ne v2, v0, :cond_0

    .line 1300
    mul-int/lit8 v2, v0, 0x2

    new-array v1, v2, [D

    .line 1301
    .local v1, "na":[D
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v2, v2, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1302
    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v1, v2, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    goto :goto_0
.end method

.method private getLocalBlockRef(Lorg/mozilla/javascript/Node;)I
    .locals 2
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 1129
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/Node;

    .line 1130
    .local v0, "localBlock":Lorg/mozilla/javascript/Node;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v1

    return v1
.end method

.method private getTargetLabel(Lorg/mozilla/javascript/Node;)I
    .locals 6
    .param p1, "target"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 1135
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->labelId()I

    move-result v0

    .line 1136
    .local v0, "label":I
    if-eq v0, v4, :cond_0

    move v1, v0

    .line 1153
    .end local v0    # "label":I
    .local v1, "label":I
    :goto_0
    return v1

    .line 1139
    .end local v1    # "label":I
    .restart local v0    # "label":I
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTableTop:I

    .line 1140
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    array-length v3, v3

    if-ne v0, v3, :cond_2

    .line 1141
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    if-nez v3, :cond_3

    .line 1142
    const/16 v3, 0x20

    new-array v3, v3, [I

    iput-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    .line 1149
    :cond_2
    :goto_1
    add-int/lit8 v3, v0, 0x1

    iput v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTableTop:I

    .line 1150
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    aput v4, v3, v0

    .line 1152
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/Node;->labelId(I)V

    move v1, v0

    .line 1153
    .end local v0    # "label":I
    .restart local v1    # "label":I
    goto :goto_0

    .line 1144
    .end local v1    # "label":I
    .restart local v0    # "label":I
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    array-length v3, v3

    mul-int/lit8 v3, v3, 0x2

    new-array v2, v3, [I

    .line 1145
    .local v2, "tmp":[I
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    invoke-static {v3, v5, v2, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1146
    iput-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    goto :goto_1
.end method

.method private increaseICodeCapacity(I)[B
    .locals 5
    .param p1, "extraSize"    # I

    .prologue
    const/4 v4, 0x0

    .line 1432
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    array-length v1, v3

    .line 1433
    .local v1, "capacity":I
    iget v2, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 1434
    .local v2, "top":I
    add-int v3, v2, p1

    if-gt v3, v1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1435
    :cond_0
    mul-int/lit8 v1, v1, 0x2

    .line 1436
    add-int v3, v2, p1

    if-le v3, v1, :cond_1

    .line 1437
    add-int v1, v2, p1

    .line 1439
    :cond_1
    new-array v0, v1, [B

    .line 1440
    .local v0, "array":[B
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    invoke-static {v3, v4, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1441
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput-object v0, v3, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 1442
    return-object v0
.end method

.method private markTargetLabel(Lorg/mozilla/javascript/Node;)V
    .locals 3
    .param p1, "target"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 1158
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v0

    .line 1159
    .local v0, "label":I
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    aget v1, v1, v0

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 1161
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1163
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    iget v2, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    aput v2, v1, v0

    .line 1164
    return-void
.end method

.method private releaseLocal(I)V
    .locals 1
    .param p1, "localSlot"    # I

    .prologue
    .line 1470
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    .line 1471
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->localTop:I

    if-eq p1, v0, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1472
    :cond_0
    return-void
.end method

.method private resolveForwardGoto(I)V
    .locals 2
    .param p1, "fromPC"    # I

    .prologue
    .line 1220
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    add-int/lit8 v1, p1, 0x3

    if-ge v0, v1, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1221
    :cond_0
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/CodeGenerator;->resolveGoto(II)V

    .line 1222
    return-void
.end method

.method private resolveGoto(II)V
    .locals 5
    .param p1, "fromPC"    # I
    .param p2, "jumpPC"    # I

    .prologue
    .line 1226
    sub-int v1, p2, p1

    .line 1228
    .local v1, "offset":I
    if-ltz v1, :cond_0

    const/4 v3, 0x2

    if-gt v1, v3, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1229
    :cond_0
    add-int/lit8 v2, p1, 0x1

    .line 1230
    .local v2, "offsetSite":I
    int-to-short v3, v1

    if-eq v1, v3, :cond_2

    .line 1231
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->longJumps:Lorg/mozilla/javascript/UintMap;

    if-nez v3, :cond_1

    .line 1232
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    new-instance v4, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v4}, Lorg/mozilla/javascript/UintMap;-><init>()V

    iput-object v4, v3, Lorg/mozilla/javascript/InterpreterData;->longJumps:Lorg/mozilla/javascript/UintMap;

    .line 1234
    :cond_1
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->longJumps:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v3, v2, p2}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 1235
    const/4 v1, 0x0

    .line 1237
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v3, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 1238
    .local v0, "array":[B
    shr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 1239
    add-int/lit8 v3, v2, 0x1

    int-to-byte v4, v1

    aput-byte v4, v0, v3

    .line 1240
    return-void
.end method

.method private stackChange(I)V
    .locals 2
    .param p1, "change"    # I

    .prologue
    .line 1447
    if-gtz p1, :cond_0

    .line 1448
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    .line 1456
    :goto_0
    return-void

    .line 1450
    :cond_0
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    add-int v0, v1, p1

    .line 1451
    .local v0, "newDepth":I
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v1, v1, Lorg/mozilla/javascript/InterpreterData;->itsMaxStack:I

    if-le v0, v1, :cond_1

    .line 1452
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput v0, v1, Lorg/mozilla/javascript/InterpreterData;->itsMaxStack:I

    .line 1454
    :cond_1
    iput v0, p0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    goto :goto_0
.end method

.method private updateLineNumber(Lorg/mozilla/javascript/Node;)V
    .locals 2
    .param p1, "node"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 213
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v0

    .line 214
    .local v0, "lineno":I
    iget v1, p0, Lorg/mozilla/javascript/CodeGenerator;->lineNumber:I

    if-eq v0, v1, :cond_1

    if-ltz v0, :cond_1

    .line 215
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget v1, v1, Lorg/mozilla/javascript/InterpreterData;->firstLinePC:I

    if-gez v1, :cond_0

    .line 216
    iget-object v1, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iput v0, v1, Lorg/mozilla/javascript/InterpreterData;->firstLinePC:I

    .line 218
    :cond_0
    iput v0, p0, Lorg/mozilla/javascript/CodeGenerator;->lineNumber:I

    .line 219
    const/16 v1, -0x1a

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 220
    const v1, 0xffff

    and-int/2addr v1, v0

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    .line 222
    :cond_1
    return-void
.end method

.method private visitArrayComprehension(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 1
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "initStmt"    # Lorg/mozilla/javascript/Node;
    .param p3, "expr"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 1123
    iget v0, p0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    invoke-direct {p0, p2, v0}, Lorg/mozilla/javascript/CodeGenerator;->visitStatement(Lorg/mozilla/javascript/Node;I)V

    .line 1124
    const/4 v0, 0x0

    invoke-direct {p0, p3, v0}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1125
    return-void
.end method

.method private visitExpression(Lorg/mozilla/javascript/Node;I)V
    .locals 36
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "contextFlags"    # I

    .prologue
    .line 497
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v29

    .line 498
    .local v29, "type":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 499
    .local v8, "child":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    move/from16 v28, v0

    .line 500
    .local v28, "savedStackDepth":I
    packed-switch v29, :pswitch_data_0

    .line 965
    :pswitch_0
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->badTree(Lorg/mozilla/javascript/Node;)Ljava/lang/RuntimeException;

    move-result-object v31

    throw v31

    .line 504
    :pswitch_1
    const/16 v31, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v13

    .line 505
    .local v13, "fnIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v12

    .line 507
    .local v12, "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual {v12}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v31

    const/16 v32, 0x2

    move/from16 v0, v31

    move/from16 v1, v32

    if-eq v0, v1, :cond_0

    .line 508
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v31

    throw v31

    .line 510
    :cond_0
    const/16 v31, -0x13

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1, v13}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 511
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 967
    .end local v12    # "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    .end local v13    # "fnIndex":I
    :cond_1
    :goto_0
    add-int/lit8 v31, v28, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    if-eq v0, v1, :cond_2

    .line 968
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 970
    :cond_2
    return-void

    .line 517
    :pswitch_2
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v21

    .line 518
    .local v21, "localIndex":I
    const/16 v31, 0x36

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 519
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 525
    .end local v21    # "localIndex":I
    :pswitch_3
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v20

    .line 526
    .local v20, "lastChild":Lorg/mozilla/javascript/Node;
    :goto_1
    move-object/from16 v0, v20

    if-eq v8, v0, :cond_3

    .line 527
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 528
    const/16 v31, -0x4

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 529
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 530
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    goto :goto_1

    .line 533
    :cond_3
    and-int/lit8 v31, p2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    goto :goto_0

    .line 540
    .end local v20    # "lastChild":Lorg/mozilla/javascript/Node;
    :pswitch_4
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 547
    :pswitch_5
    const/16 v31, 0x1e

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_4

    .line 548
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 552
    :goto_2
    const/4 v6, 0x0

    .line 553
    .local v6, "argCount":I
    :goto_3
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 554
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 555
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 550
    .end local v6    # "argCount":I
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/mozilla/javascript/CodeGenerator;->generateCallFunAndThis(Lorg/mozilla/javascript/Node;)V

    goto :goto_2

    .line 557
    .restart local v6    # "argCount":I
    :cond_5
    const/16 v31, 0xa

    const/16 v32, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v7

    .line 559
    .local v7, "callType":I
    const/16 v31, 0x46

    move/from16 v0, v29

    move/from16 v1, v31

    if-eq v0, v1, :cond_7

    if-eqz v7, :cond_7

    .line 561
    const/16 v31, -0x15

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 562
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 563
    const/16 v31, 0x1e

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_6

    const/16 v31, 0x1

    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 564
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/CodeGenerator;->lineNumber:I

    move/from16 v31, v0

    const v32, 0xffff

    and-int v31, v31, v32

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    .line 577
    :goto_5
    const/16 v31, 0x1e

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_9

    .line 579
    neg-int v0, v6

    move/from16 v31, v0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 585
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsMaxCalleeArgs:I

    move/from16 v31, v0

    move/from16 v0, v31

    if-le v6, v0, :cond_1

    .line 586
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iput v6, v0, Lorg/mozilla/javascript/InterpreterData;->itsMaxCalleeArgs:I

    goto/16 :goto_0

    .line 563
    :cond_6
    const/16 v31, 0x0

    goto :goto_4

    .line 569
    :cond_7
    const/16 v31, 0x26

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_8

    and-int/lit8 v31, p2, 0x1

    if-eqz v31, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/mozilla/javascript/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v31

    if-nez v31, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsInTryFlag:Z

    move/from16 v31, v0

    if-nez v31, :cond_8

    .line 572
    const/16 v29, -0x37

    .line 574
    :cond_8
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1, v6}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto :goto_5

    .line 583
    :cond_9
    rsub-int/lit8 v31, v6, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_6

    .line 594
    .end local v6    # "argCount":I
    .end local v7    # "callType":I
    :pswitch_6
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 595
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 596
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 597
    move-object/from16 v0, p0

    iget v5, v0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 598
    .local v5, "afterSecondJumpStart":I
    const/16 v31, 0x69

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_a

    const/16 v19, 0x7

    .line 599
    .local v19, "jump":I
    :goto_7
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addGotoOp(I)V

    .line 600
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 601
    const/16 v31, -0x4

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 602
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 603
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 605
    and-int/lit8 v31, p2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 606
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/CodeGenerator;->resolveForwardGoto(I)V

    goto/16 :goto_0

    .line 598
    .end local v19    # "jump":I
    :cond_a
    const/16 v19, 0x6

    goto :goto_7

    .line 612
    .end local v5    # "afterSecondJumpStart":I
    :pswitch_7
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v15

    .line 613
    .local v15, "ifThen":Lorg/mozilla/javascript/Node;
    invoke-virtual {v15}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v14

    .line 614
    .local v14, "ifElse":Lorg/mozilla/javascript/Node;
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 615
    move-object/from16 v0, p0

    iget v10, v0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 616
    .local v10, "elseJumpStart":I
    const/16 v31, 0x7

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addGotoOp(I)V

    .line 617
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 619
    and-int/lit8 v31, p2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 620
    move-object/from16 v0, p0

    iget v4, v0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 621
    .local v4, "afterElseJumpStart":I
    const/16 v31, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addGotoOp(I)V

    .line 622
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/mozilla/javascript/CodeGenerator;->resolveForwardGoto(I)V

    .line 623
    move/from16 v0, v28

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    .line 625
    and-int/lit8 v31, p2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v14, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 626
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/mozilla/javascript/CodeGenerator;->resolveForwardGoto(I)V

    goto/16 :goto_0

    .line 632
    .end local v4    # "afterElseJumpStart":I
    .end local v10    # "elseJumpStart":I
    .end local v14    # "ifElse":Lorg/mozilla/javascript/Node;
    .end local v15    # "ifThen":Lorg/mozilla/javascript/Node;
    :pswitch_8
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 633
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 634
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    move/from16 v1, v29

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 638
    :pswitch_9
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v31

    const/16 v32, 0x31

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_b

    const/16 v18, 0x1

    .line 639
    .local v18, "isName":Z
    :goto_8
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 640
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 641
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 642
    if-eqz v18, :cond_c

    .line 644
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 648
    :goto_9
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 638
    .end local v18    # "isName":Z
    :cond_b
    const/16 v18, 0x0

    goto :goto_8

    .line 646
    .restart local v18    # "isName":Z
    :cond_c
    const/16 v31, 0x1f

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto :goto_9

    .line 673
    .end local v18    # "isName":Z
    :pswitch_a
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 674
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 675
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 676
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 677
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 686
    :pswitch_b
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 687
    const/16 v31, 0x7e

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_d

    .line 688
    const/16 v31, -0x4

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 689
    const/16 v31, -0x32

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto/16 :goto_0

    .line 691
    :cond_d
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto/16 :goto_0

    .line 697
    :pswitch_c
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 698
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto/16 :goto_0

    .line 704
    :pswitch_d
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 705
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 706
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v26

    .line 707
    .local v26, "property":Ljava/lang/String;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 708
    const/16 v31, 0x8b

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_e

    .line 709
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 710
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 711
    const/16 v31, 0x21

    move-object/from16 v0, p0

    move/from16 v1, v31

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 713
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 715
    :cond_e
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 716
    const/16 v31, 0x23

    move-object/from16 v0, p0

    move/from16 v1, v31

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 717
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 723
    .end local v26    # "property":Ljava/lang/String;
    :pswitch_e
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 724
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 725
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 726
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 727
    const/16 v31, 0x8c

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_f

    .line 728
    const/16 v31, -0x2

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 729
    const/16 v31, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 730
    const/16 v31, 0x24

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 731
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 733
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 735
    :cond_f
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 736
    const/16 v31, 0x25

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 737
    const/16 v31, -0x2

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 742
    :pswitch_f
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 743
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 744
    const/16 v31, 0x8e

    move/from16 v0, v29

    move/from16 v1, v31

    if-ne v0, v1, :cond_10

    .line 745
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 746
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 747
    const/16 v31, 0x43

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 749
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 751
    :cond_10
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 752
    const/16 v31, 0x44

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 753
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 759
    :pswitch_10
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v23

    .line 760
    .local v23, "name":Ljava/lang/String;
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 761
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 762
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 763
    move-object/from16 v0, p0

    move/from16 v1, v29

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 764
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 770
    .end local v23    # "name":Ljava/lang/String;
    :pswitch_11
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v23

    .line 771
    .restart local v23    # "name":Ljava/lang/String;
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 772
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 773
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 774
    const/16 v31, -0x3b

    move-object/from16 v0, p0

    move/from16 v1, v31

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 775
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 781
    .end local v23    # "name":Ljava/lang/String;
    :pswitch_12
    const/16 v16, -0x1

    .line 784
    .local v16, "index":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsInFunctionFlag:Z

    move/from16 v31, v0

    if-eqz v31, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v31, v0

    if-nez v31, :cond_11

    .line 785
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v16

    .line 786
    :cond_11
    const/16 v31, -0x1

    move/from16 v0, v16

    move/from16 v1, v31

    if-ne v0, v1, :cond_12

    .line 787
    const/16 v31, -0xe

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p0

    move/from16 v1, v31

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 788
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 790
    :cond_12
    const/16 v31, 0x37

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addVarOp(II)V

    .line 791
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 792
    const/16 v31, 0x20

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto/16 :goto_0

    .line 800
    .end local v16    # "index":I
    :pswitch_13
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    move/from16 v1, v29

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 801
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 806
    :pswitch_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v8}, Lorg/mozilla/javascript/CodeGenerator;->visitIncDec(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 811
    :pswitch_15
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getDouble()D

    move-result-wide v24

    .line 812
    .local v24, "num":D
    move-wide/from16 v0, v24

    double-to-int v0, v0

    move/from16 v17, v0

    .line 813
    .local v17, "inum":I
    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v32, v0

    cmpl-double v31, v32, v24

    if-nez v31, :cond_17

    .line 814
    if-nez v17, :cond_14

    .line 815
    const/16 v31, -0x33

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 817
    const-wide/high16 v32, 0x3ff0000000000000L    # 1.0

    div-double v32, v32, v24

    const-wide/16 v34, 0x0

    cmpg-double v31, v32, v34

    if-gez v31, :cond_13

    .line 818
    const/16 v31, 0x1d

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 834
    :cond_13
    :goto_a
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 820
    :cond_14
    const/16 v31, 0x1

    move/from16 v0, v17

    move/from16 v1, v31

    if-ne v0, v1, :cond_15

    .line 821
    const/16 v31, -0x34

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto :goto_a

    .line 822
    :cond_15
    move/from16 v0, v17

    int-to-short v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    move/from16 v1, v17

    if-ne v0, v1, :cond_16

    .line 823
    const/16 v31, -0x1b

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 825
    const v31, 0xffff

    and-int v31, v31, v17

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    goto :goto_a

    .line 827
    :cond_16
    const/16 v31, -0x1c

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 828
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addInt(I)V

    goto :goto_a

    .line 831
    :cond_17
    move-object/from16 v0, p0

    move-wide/from16 v1, v24

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->getDoubleIndex(D)I

    move-result v16

    .line 832
    .restart local v16    # "index":I
    const/16 v31, 0x28

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto :goto_a

    .line 840
    .end local v16    # "index":I
    .end local v17    # "inum":I
    .end local v24    # "num":D
    :pswitch_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v31, v0

    if-eqz v31, :cond_18

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 841
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v16

    .line 842
    .restart local v16    # "index":I
    const/16 v31, 0x37

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addVarOp(II)V

    .line 843
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 849
    .end local v16    # "index":I
    :pswitch_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v31, v0

    if-eqz v31, :cond_19

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 850
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/ast/ScriptNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v16

    .line 851
    .restart local v16    # "index":I
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 852
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 853
    const/16 v31, 0x38

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addVarOp(II)V

    goto/16 :goto_0

    .line 859
    .end local v16    # "index":I
    :pswitch_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v31, v0

    if-eqz v31, :cond_1a

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 860
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/ast/ScriptNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v16

    .line 861
    .restart local v16    # "index":I
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 862
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 863
    const/16 v31, 0x9c

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addVarOp(II)V

    goto/16 :goto_0

    .line 872
    .end local v16    # "index":I
    :pswitch_19
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 873
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 878
    :pswitch_1a
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v31

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 879
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 884
    :pswitch_1b
    const/16 v31, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v16

    .line 885
    .restart local v16    # "index":I
    const/16 v31, 0x30

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 886
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 892
    .end local v16    # "index":I
    :pswitch_1c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v8}, Lorg/mozilla/javascript/CodeGenerator;->visitLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 896
    :pswitch_1d
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v31

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v8, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitArrayComprehension(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 900
    :pswitch_1e
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 901
    const/16 v31, 0x11

    move-object/from16 v0, p1

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    move-object/from16 v0, p0

    move/from16 v1, v29

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 909
    :pswitch_1f
    const/16 v31, 0x10

    const/16 v32, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v22

    .line 911
    .local v22, "memberTypeFlags":I
    const/4 v9, 0x0

    .line 913
    .local v9, "childCount":I
    :cond_1b
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 914
    add-int/lit8 v9, v9, 0x1

    .line 915
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 916
    if-nez v8, :cond_1b

    .line 917
    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 918
    rsub-int/lit8 v31, v9, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 925
    .end local v9    # "childCount":I
    .end local v22    # "memberTypeFlags":I
    :pswitch_20
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 926
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 927
    const/16 v31, -0x35

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 928
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 929
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    move/from16 v27, v0

    .line 930
    .local v27, "queryPC":I
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v31

    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 931
    const/16 v31, -0x36

    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addBackwardGoto(II)V

    goto/16 :goto_0

    .line 938
    .end local v27    # "queryPC":I
    :pswitch_21
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 939
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto/16 :goto_0

    .line 943
    :pswitch_22
    if-eqz v8, :cond_1c

    .line 944
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 949
    :goto_b
    const/16 v31, 0x48

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 950
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v31

    const v32, 0xffff

    and-int v31, v31, v32

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    goto/16 :goto_0

    .line 946
    :cond_1c
    const/16 v31, -0x32

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 947
    const/16 v31, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_b

    .line 954
    :pswitch_23
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v11

    .line 955
    .local v11, "enterWith":Lorg/mozilla/javascript/Node;
    invoke-virtual {v11}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v30

    .line 956
    .local v30, "with":Lorg/mozilla/javascript/Node;
    invoke-virtual {v11}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v31

    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 957
    const/16 v31, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 958
    const/16 v31, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 959
    invoke-virtual/range {v30 .. v30}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v31

    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 960
    const/16 v31, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto/16 :goto_0

    .line 500
    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_10
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_5
        :pswitch_9
        :pswitch_b
        :pswitch_8
        :pswitch_8
        :pswitch_d
        :pswitch_a
        :pswitch_e
        :pswitch_5
        :pswitch_13
        :pswitch_15
        :pswitch_13
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_a
        :pswitch_a
        :pswitch_1b
        :pswitch_13
        :pswitch_0
        :pswitch_0
        :pswitch_a
        :pswitch_a
        :pswitch_2
        :pswitch_16
        :pswitch_17
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1a
        :pswitch_1a
        :pswitch_19
        :pswitch_0
        :pswitch_1c
        :pswitch_1c
        :pswitch_c
        :pswitch_f
        :pswitch_c
        :pswitch_5
        :pswitch_1e
        :pswitch_22
        :pswitch_10
        :pswitch_21
        :pswitch_21
        :pswitch_21
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_6
        :pswitch_14
        :pswitch_14
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_12
        :pswitch_4
        :pswitch_d
        :pswitch_e
        :pswitch_0
        :pswitch_f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_20
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_11
        :pswitch_18
        :pswitch_1d
        :pswitch_0
        :pswitch_23
    .end packed-switch
.end method

.method private visitIncDec(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 11
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1014
    const/16 v8, 0xd

    invoke-virtual {p1, v8}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v2

    .line 1015
    .local v2, "incrDecrMask":I
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v0

    .line 1016
    .local v0, "childType":I
    sparse-switch v0, :sswitch_data_0

    .line 1058
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->badTree(Lorg/mozilla/javascript/Node;)Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 1018
    :sswitch_0
    iget-object v8, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v8, v8, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    if-eqz v8, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1019
    :cond_0
    iget-object v8, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v8, p2}, Lorg/mozilla/javascript/ast/ScriptNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 1020
    .local v1, "i":I
    const/4 v8, -0x7

    invoke-direct {p0, v8, v1}, Lorg/mozilla/javascript/CodeGenerator;->addVarOp(II)V

    .line 1021
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 1022
    invoke-direct {p0, v10}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 1061
    .end local v1    # "i":I
    :goto_0
    return-void

    .line 1026
    :sswitch_1
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v4

    .line 1027
    .local v4, "name":Ljava/lang/String;
    const/4 v8, -0x8

    invoke-direct {p0, v8, v4}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 1028
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 1029
    invoke-direct {p0, v10}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 1033
    .end local v4    # "name":Ljava/lang/String;
    :sswitch_2
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v5

    .line 1034
    .local v5, "object":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v5, v9}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1035
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v6

    .line 1036
    .local v6, "property":Ljava/lang/String;
    const/16 v8, -0x9

    invoke-direct {p0, v8, v6}, Lorg/mozilla/javascript/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 1037
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1041
    .end local v5    # "object":Lorg/mozilla/javascript/Node;
    .end local v6    # "property":Ljava/lang/String;
    :sswitch_3
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v5

    .line 1042
    .restart local v5    # "object":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v5, v9}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1043
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 1044
    .local v3, "index":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v3, v9}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1045
    const/16 v8, -0xa

    invoke-direct {p0, v8}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1046
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 1047
    const/4 v8, -0x1

    invoke-direct {p0, v8}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 1051
    .end local v3    # "index":Lorg/mozilla/javascript/Node;
    .end local v5    # "object":Lorg/mozilla/javascript/Node;
    :sswitch_4
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    .line 1052
    .local v7, "ref":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, v7, v9}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1053
    const/16 v8, -0xb

    invoke-direct {p0, v8}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1054
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1016
    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_2
        0x24 -> :sswitch_3
        0x27 -> :sswitch_1
        0x37 -> :sswitch_0
        0x43 -> :sswitch_4
    .end sparse-switch
.end method

.method private visitLiteral(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V
    .locals 13
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "child"    # Lorg/mozilla/javascript/Node;

    .prologue
    const/16 v12, 0x42

    const/4 v11, -0x1

    const/16 v10, -0x1e

    const/16 v9, 0x41

    const/4 v8, 0x0

    .line 1065
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    .line 1067
    .local v6, "type":I
    const/4 v4, 0x0

    .line 1068
    .local v4, "propertyIds":[Ljava/lang/Object;
    if-ne v6, v9, :cond_0

    .line 1069
    const/4 v1, 0x0

    .line 1070
    .local v1, "count":I
    move-object v3, p2

    .local v3, "n":Lorg/mozilla/javascript/Node;
    :goto_0
    if-eqz v3, :cond_1

    .line 1071
    add-int/lit8 v1, v1, 0x1

    .line 1070
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    goto :goto_0

    .line 1073
    .end local v1    # "count":I
    .end local v3    # "n":Lorg/mozilla/javascript/Node;
    :cond_0
    if-ne v6, v12, :cond_2

    .line 1074
    const/16 v7, 0xc

    invoke-virtual {p1, v7}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Object;

    move-object v4, v7

    check-cast v4, [Ljava/lang/Object;

    .line 1075
    array-length v1, v4

    .line 1079
    .restart local v1    # "count":I
    :cond_1
    const/16 v7, -0x1d

    invoke-direct {p0, v7, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 1080
    const/4 v7, 0x2

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 1081
    :goto_1
    if-eqz p2, :cond_6

    .line 1082
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v0

    .line 1083
    .local v0, "childType":I
    const/16 v7, 0x97

    if-ne v0, v7, :cond_3

    .line 1084
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1085
    const/16 v7, -0x39

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 1096
    :goto_2
    invoke-direct {p0, v11}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 1097
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object p2

    .line 1098
    goto :goto_1

    .line 1077
    .end local v0    # "childType":I
    .end local v1    # "count":I
    :cond_2
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/CodeGenerator;->badTree(Lorg/mozilla/javascript/Node;)Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 1086
    .restart local v0    # "childType":I
    .restart local v1    # "count":I
    :cond_3
    const/16 v7, 0x98

    if-ne v0, v7, :cond_4

    .line 1087
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1088
    const/16 v7, -0x3a

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto :goto_2

    .line 1089
    :cond_4
    const/16 v7, 0xa3

    if-ne v0, v7, :cond_5

    .line 1090
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-direct {p0, v7, v8}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1091
    invoke-direct {p0, v10}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto :goto_2

    .line 1093
    :cond_5
    invoke-direct {p0, p2, v8}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 1094
    invoke-direct {p0, v10}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto :goto_2

    .line 1099
    .end local v0    # "childType":I
    :cond_6
    if-ne v6, v9, :cond_8

    .line 1100
    const/16 v7, 0xb

    invoke-virtual {p1, v7}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    move-object v5, v7

    check-cast v5, [I

    .line 1101
    .local v5, "skipIndexes":[I
    if-nez v5, :cond_7

    .line 1102
    invoke-direct {p0, v9}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 1113
    .end local v5    # "skipIndexes":[I
    :goto_3
    invoke-direct {p0, v11}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 1114
    return-void

    .line 1104
    .restart local v5    # "skipIndexes":[I
    :cond_7
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v2

    .line 1105
    .local v2, "index":I
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v7, v5}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 1106
    const/16 v7, -0x1f

    invoke-direct {p0, v7, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto :goto_3

    .line 1109
    .end local v2    # "index":I
    .end local v5    # "skipIndexes":[I
    :cond_8
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v7}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v2

    .line 1110
    .restart local v2    # "index":I
    iget-object v7, p0, Lorg/mozilla/javascript/CodeGenerator;->literalIds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v7, v4}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 1111
    invoke-direct {p0, v12, v2}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto :goto_3
.end method

.method private visitStatement(Lorg/mozilla/javascript/Node;I)V
    .locals 33
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "initialStackDepth"    # I

    .prologue
    .line 231
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v32

    .line 232
    .local v32, "type":I
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v19

    .line 233
    .local v19, "child":Lorg/mozilla/javascript/Node;
    sparse-switch v32, :sswitch_data_0

    .line 487
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->badTree(Lorg/mozilla/javascript/Node;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 237
    :sswitch_0
    const/4 v3, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v22

    .line 238
    .local v22, "fnIndex":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    move/from16 v0, v22

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionType()I

    move-result v23

    .line 246
    .local v23, "fnType":I
    const/4 v3, 0x3

    move/from16 v0, v23

    if-ne v0, v3, :cond_2

    .line 247
    const/16 v3, -0x14

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 258
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/mozilla/javascript/CodeGenerator;->itsInFunctionFlag:Z

    if-nez v3, :cond_1

    .line 259
    const/16 v3, -0x13

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 260
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 261
    const/4 v3, -0x5

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 262
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 490
    .end local v22    # "fnIndex":I
    .end local v23    # "fnType":I
    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    :cond_1
    :goto_0
    :sswitch_1
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/CodeGenerator;->stackDepth:I

    move/from16 v0, p2

    if-eq v3, v0, :cond_e

    .line 491
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 249
    .restart local v22    # "fnIndex":I
    .restart local v23    # "fnType":I
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :cond_2
    const/4 v3, 0x1

    move/from16 v0, v23

    if-eq v0, v3, :cond_0

    .line 250
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 272
    .end local v22    # "fnIndex":I
    .end local v23    # "fnType":I
    :sswitch_2
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 275
    :goto_1
    :sswitch_3
    if-eqz v19, :cond_1

    .line 276
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitStatement(Lorg/mozilla/javascript/Node;I)V

    .line 277
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v19

    goto :goto_1

    .line 282
    :sswitch_4
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 283
    const/4 v3, 0x2

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 284
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 288
    :sswitch_5
    const/4 v3, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto :goto_0

    .line 293
    :sswitch_6
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/CodeGenerator;->allocLocal()I

    move-result v24

    .line 294
    .local v24, "local":I
    const/4 v3, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v3, v1}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 295
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 296
    :goto_2
    if-eqz v19, :cond_3

    .line 297
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitStatement(Lorg/mozilla/javascript/Node;I)V

    .line 298
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v19

    goto :goto_2

    .line 300
    :cond_3
    const/16 v3, -0x38

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 301
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->releaseLocal(I)V

    goto :goto_0

    .line 306
    .end local v24    # "local":I
    :sswitch_7
    const/16 v3, -0x40

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto :goto_0

    .line 310
    :sswitch_8
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 314
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 315
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v17

    check-cast v17, Lorg/mozilla/javascript/ast/Jump;

    .line 316
    .local v17, "caseNode":Lorg/mozilla/javascript/ast/Jump;
    :goto_3
    if-eqz v17, :cond_5

    .line 319
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ast/Jump;->getType()I

    move-result v3

    const/16 v6, 0x73

    if-eq v3, v6, :cond_4

    .line 320
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->badTree(Lorg/mozilla/javascript/Node;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 321
    :cond_4
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ast/Jump;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v30

    .line 322
    .local v30, "test":Lorg/mozilla/javascript/Node;
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 323
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 324
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 325
    const/16 v3, 0x2e

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 326
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 329
    move-object/from16 v0, v17

    iget-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    const/4 v6, -0x6

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v6}, Lorg/mozilla/javascript/CodeGenerator;->addGoto(Lorg/mozilla/javascript/Node;I)V

    .line 330
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 317
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/ast/Jump;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v17

    .end local v17    # "caseNode":Lorg/mozilla/javascript/ast/Jump;
    check-cast v17, Lorg/mozilla/javascript/ast/Jump;

    .restart local v17    # "caseNode":Lorg/mozilla/javascript/ast/Jump;
    goto :goto_3

    .line 332
    .end local v30    # "test":Lorg/mozilla/javascript/Node;
    :cond_5
    const/4 v3, -0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 333
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 338
    .end local v17    # "caseNode":Lorg/mozilla/javascript/ast/Jump;
    :sswitch_9
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->markTargetLabel(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_0

    .line 344
    :sswitch_a
    check-cast p1, Lorg/mozilla/javascript/ast/Jump;

    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    move-object/from16 v29, v0

    .line 345
    .local v29, "target":Lorg/mozilla/javascript/Node;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 346
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addGoto(Lorg/mozilla/javascript/Node;I)V

    .line 347
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 353
    .end local v29    # "target":Lorg/mozilla/javascript/Node;
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_b
    check-cast p1, Lorg/mozilla/javascript/ast/Jump;

    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    move-object/from16 v29, v0

    .line 354
    .restart local v29    # "target":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->addGoto(Lorg/mozilla/javascript/Node;I)V

    goto/16 :goto_0

    .line 360
    .end local v29    # "target":Lorg/mozilla/javascript/Node;
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_c
    check-cast p1, Lorg/mozilla/javascript/ast/Jump;

    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    move-object/from16 v29, v0

    .line 361
    .restart local v29    # "target":Lorg/mozilla/javascript/Node;
    const/16 v3, -0x17

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->addGoto(Lorg/mozilla/javascript/Node;I)V

    goto/16 :goto_0

    .line 368
    .end local v29    # "target":Lorg/mozilla/javascript/Node;
    .restart local p1    # "node":Lorg/mozilla/javascript/Node;
    :sswitch_d
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 369
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v20

    .line 370
    .local v20, "finallyRegister":I
    const/16 v3, -0x18

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 371
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    .line 372
    :goto_4
    if-eqz v19, :cond_6

    .line 373
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitStatement(Lorg/mozilla/javascript/Node;I)V

    .line 374
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v19

    goto :goto_4

    .line 376
    :cond_6
    const/16 v3, -0x19

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v3, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto/16 :goto_0

    .line 382
    .end local v20    # "finallyRegister":I
    :sswitch_e
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 383
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 384
    const/16 v3, 0x85

    move/from16 v0, v32

    if-ne v0, v3, :cond_7

    const/4 v3, -0x4

    :goto_5
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 385
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 384
    :cond_7
    const/4 v3, -0x5

    goto :goto_5

    :sswitch_f
    move-object/from16 v31, p1

    .line 390
    check-cast v31, Lorg/mozilla/javascript/ast/Jump;

    .line 391
    .local v31, "tryNode":Lorg/mozilla/javascript/ast/Jump;
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v8

    .line 392
    .local v8, "exceptionObjectLocal":I
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/CodeGenerator;->allocLocal()I

    move-result v9

    .line 394
    .local v9, "scopeLocal":I
    const/16 v3, -0xd

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v9}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 396
    move-object/from16 v0, p0

    iget v4, v0, Lorg/mozilla/javascript/CodeGenerator;->iCodeTop:I

    .line 397
    .local v4, "tryStart":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/mozilla/javascript/CodeGenerator;->itsInTryFlag:Z

    move/from16 v27, v0

    .line 398
    .local v27, "savedFlag":Z
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/mozilla/javascript/CodeGenerator;->itsInTryFlag:Z

    .line 399
    :goto_6
    if-eqz v19, :cond_8

    .line 400
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/CodeGenerator;->visitStatement(Lorg/mozilla/javascript/Node;I)V

    .line 401
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v19

    goto :goto_6

    .line 403
    :cond_8
    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/mozilla/javascript/CodeGenerator;->itsInTryFlag:Z

    .line 405
    move-object/from16 v0, v31

    iget-object v0, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    move-object/from16 v18, v0

    .line 406
    .local v18, "catchTarget":Lorg/mozilla/javascript/Node;
    if-eqz v18, :cond_9

    .line 407
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v6

    aget v5, v3, v6

    .line 409
    .local v5, "catchStartPC":I
    const/4 v7, 0x0

    move-object/from16 v3, p0

    move v6, v5

    invoke-direct/range {v3 .. v9}, Lorg/mozilla/javascript/CodeGenerator;->addExceptionHandler(IIIZII)V

    .line 413
    .end local v5    # "catchStartPC":I
    :cond_9
    invoke-virtual/range {v31 .. v31}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v21

    .line 414
    .local v21, "finallyTarget":Lorg/mozilla/javascript/Node;
    if-eqz v21, :cond_a

    .line 415
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/CodeGenerator;->labelTable:[I

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->getTargetLabel(Lorg/mozilla/javascript/Node;)I

    move-result v6

    aget v12, v3, v6

    .line 417
    .local v12, "finallyStartPC":I
    const/4 v14, 0x1

    move-object/from16 v10, p0

    move v11, v4

    move v13, v12

    move v15, v8

    move/from16 v16, v9

    invoke-direct/range {v10 .. v16}, Lorg/mozilla/javascript/CodeGenerator;->addExceptionHandler(IIIZII)V

    .line 422
    .end local v12    # "finallyStartPC":I
    :cond_a
    const/16 v3, -0x38

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v9}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 423
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/mozilla/javascript/CodeGenerator;->releaseLocal(I)V

    goto/16 :goto_0

    .line 429
    .end local v4    # "tryStart":I
    .end local v8    # "exceptionObjectLocal":I
    .end local v9    # "scopeLocal":I
    .end local v18    # "catchTarget":Lorg/mozilla/javascript/Node;
    .end local v21    # "finallyTarget":Lorg/mozilla/javascript/Node;
    .end local v27    # "savedFlag":Z
    .end local v31    # "tryNode":Lorg/mozilla/javascript/ast/Jump;
    :sswitch_10
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v25

    .line 430
    .local v25, "localIndex":I
    const/16 v3, 0xe

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->getExistingIntProp(I)I

    move-result v28

    .line 431
    .local v28, "scopeIndex":I
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v26

    .line 432
    .local v26, "name":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v19

    .line 433
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 434
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addStringPrefix(Ljava/lang/String;)V

    .line 435
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/CodeGenerator;->addIndexPrefix(I)V

    .line 436
    const/16 v3, 0x39

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 437
    if-eqz v28, :cond_b

    const/4 v3, 0x1

    :goto_7
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addUint8(I)V

    .line 438
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 437
    :cond_b
    const/4 v3, 0x0

    goto :goto_7

    .line 443
    .end local v25    # "localIndex":I
    .end local v26    # "name":Ljava/lang/String;
    .end local v28    # "scopeIndex":I
    :sswitch_11
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 444
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 445
    const/16 v3, 0x32

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 446
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/CodeGenerator;->lineNumber:I

    const v6, 0xffff

    and-int/2addr v3, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    .line 447
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 451
    :sswitch_12
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 452
    const/16 v3, 0x33

    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v6

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v6}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    goto/16 :goto_0

    .line 456
    :sswitch_13
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 457
    const/16 v3, 0x14

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v6}, Lorg/mozilla/javascript/Node;->getIntProp(II)I

    move-result v3

    if-eqz v3, :cond_c

    .line 459
    const/16 v3, -0x3f

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    .line 460
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/CodeGenerator;->lineNumber:I

    const v6, 0xffff

    and-int/2addr v3, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addUint16(I)V

    goto/16 :goto_0

    .line 461
    :cond_c
    if-eqz v19, :cond_d

    .line 462
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 463
    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    .line 464
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 466
    :cond_d
    const/16 v3, -0x16

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIcode(I)V

    goto/16 :goto_0

    .line 471
    :sswitch_14
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->updateLineNumber(Lorg/mozilla/javascript/Node;)V

    .line 472
    const/16 v3, 0x40

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->addToken(I)V

    goto/16 :goto_0

    .line 478
    :sswitch_15
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->visitExpression(Lorg/mozilla/javascript/Node;I)V

    .line 479
    invoke-direct/range {p0 .. p1}, Lorg/mozilla/javascript/CodeGenerator;->getLocalBlockRef(Lorg/mozilla/javascript/Node;)I

    move-result v3

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1, v3}, Lorg/mozilla/javascript/CodeGenerator;->addIndexOp(II)V

    .line 480
    const/4 v3, -0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/CodeGenerator;->stackChange(I)V

    goto/16 :goto_0

    .line 493
    .end local p1    # "node":Lorg/mozilla/javascript/Node;
    :cond_e
    return-void

    .line 233
    :sswitch_data_0
    .sparse-switch
        -0x3e -> :sswitch_1
        0x2 -> :sswitch_4
        0x3 -> :sswitch_5
        0x4 -> :sswitch_13
        0x5 -> :sswitch_b
        0x6 -> :sswitch_a
        0x7 -> :sswitch_a
        0x32 -> :sswitch_11
        0x33 -> :sswitch_12
        0x39 -> :sswitch_10
        0x3a -> :sswitch_15
        0x3b -> :sswitch_15
        0x3c -> :sswitch_15
        0x40 -> :sswitch_14
        0x51 -> :sswitch_f
        0x6d -> :sswitch_0
        0x72 -> :sswitch_8
        0x7b -> :sswitch_2
        0x7d -> :sswitch_d
        0x80 -> :sswitch_2
        0x81 -> :sswitch_2
        0x82 -> :sswitch_2
        0x83 -> :sswitch_9
        0x84 -> :sswitch_2
        0x85 -> :sswitch_e
        0x86 -> :sswitch_e
        0x87 -> :sswitch_c
        0x88 -> :sswitch_3
        0x8d -> :sswitch_6
        0xa0 -> :sswitch_7
    .end sparse-switch
.end method


# virtual methods
.method public compile(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)Lorg/mozilla/javascript/InterpreterData;
    .locals 4
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .prologue
    .line 55
    iput-object p1, p0, Lorg/mozilla/javascript/CodeGenerator;->compilerEnv:Lorg/mozilla/javascript/CompilerEnvirons;

    .line 62
    new-instance v0, Lorg/mozilla/javascript/NodeTransformer;

    invoke-direct {v0}, Lorg/mozilla/javascript/NodeTransformer;-><init>()V

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/NodeTransformer;->transform(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 69
    if-eqz p4, :cond_0

    .line 70
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    .line 74
    :goto_0
    new-instance v0, Lorg/mozilla/javascript/InterpreterData;

    invoke-virtual {p1}, Lorg/mozilla/javascript/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    iget-object v2, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v2

    check-cast p2, Lorg/mozilla/javascript/ast/AstRoot;

    .end local p2    # "tree":Lorg/mozilla/javascript/ast/ScriptNode;
    invoke-virtual {p2}, Lorg/mozilla/javascript/ast/AstRoot;->isInStrictMode()Z

    move-result v3

    invoke-direct {v0, v1, v2, p3, v3}, Lorg/mozilla/javascript/InterpreterData;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    iput-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    .line 78
    iget-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/mozilla/javascript/InterpreterData;->topLevel:Z

    .line 80
    if-eqz p4, :cond_1

    .line 81
    invoke-direct {p0}, Lorg/mozilla/javascript/CodeGenerator;->generateFunctionICode()V

    .line 85
    :goto_1
    iget-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->itsData:Lorg/mozilla/javascript/InterpreterData;

    return-object v0

    .line 72
    .restart local p2    # "tree":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_0
    iput-object p2, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    goto :goto_0

    .line 83
    .end local p2    # "tree":Lorg/mozilla/javascript/ast/ScriptNode;
    :cond_1
    iget-object v0, p0, Lorg/mozilla/javascript/CodeGenerator;->scriptOrFn:Lorg/mozilla/javascript/ast/ScriptNode;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/CodeGenerator;->generateICodeFromTree(Lorg/mozilla/javascript/Node;)V

    goto :goto_1
.end method
