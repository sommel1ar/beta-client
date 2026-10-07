.class public Lorg/mozilla/classfile/ClassFileWriter;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;,
        Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;
    }
.end annotation


# static fields
.field public static final ACC_ABSTRACT:S = 0x400s

.field public static final ACC_FINAL:S = 0x10s

.field public static final ACC_NATIVE:S = 0x100s

.field public static final ACC_PRIVATE:S = 0x2s

.field public static final ACC_PROTECTED:S = 0x4s

.field public static final ACC_PUBLIC:S = 0x1s

.field public static final ACC_STATIC:S = 0x8s

.field public static final ACC_SUPER:S = 0x20s

.field public static final ACC_SYNCHRONIZED:S = 0x20s

.field public static final ACC_TRANSIENT:S = 0x80s

.field public static final ACC_VOLATILE:S = 0x40s

.field private static final DEBUGCODE:Z = false

.field private static final DEBUGLABELS:Z = false

.field private static final DEBUGSTACK:Z = false

.field private static final ExceptionTableSize:I = 0x4

.field private static final FileHeaderConstant:I = -0x35014542

.field private static final GenerateStackMap:Z

.field private static final LineNumberTableSize:I = 0x10

.field private static final MIN_FIXUP_TABLE_SIZE:I = 0x28

.field private static final MIN_LABEL_TABLE_SIZE:I = 0x20

.field private static final MajorVersion:I

.field private static final MinorVersion:I

.field private static final SuperBlockStartsSize:I = 0x4


# instance fields
.field private generatedClassName:Ljava/lang/String;

.field private itsCodeBuffer:[B

.field private itsCodeBufferTop:I

.field private itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

.field private itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

.field private itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

.field private itsExceptionTableTop:I

.field private itsFields:Lorg/mozilla/javascript/ObjArray;

.field private itsFixupTable:[J

.field private itsFixupTableTop:I

.field private itsFlags:S

.field private itsInterfaces:Lorg/mozilla/javascript/ObjArray;

.field private itsJumpFroms:Lorg/mozilla/javascript/UintMap;

.field private itsLabelTable:[I

.field private itsLabelTableTop:I

.field private itsLineNumberTable:[I

.field private itsLineNumberTableTop:I

.field private itsMaxLocals:S

.field private itsMaxStack:S

.field private itsMethods:Lorg/mozilla/javascript/ObjArray;

.field private itsSourceFileNameIndex:S

.field private itsStackTop:S

.field private itsSuperBlockStarts:[I

.field private itsSuperBlockStartsTop:I

.field private itsSuperClassIndex:S

.field private itsThisClassIndex:S

.field private itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

.field private tmpCharBuffer:[C


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .prologue
    const/16 v11, 0x8

    const/16 v10, 0x32

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 4190
    const/4 v2, 0x0

    .line 4191
    .local v2, "is":Ljava/io/InputStream;
    const/16 v3, 0x30

    .local v3, "major":I
    const/4 v4, 0x0

    .line 4193
    .local v4, "minor":I
    :try_start_0
    const-class v8, Lorg/mozilla/classfile/ClassFileWriter;

    const-string v9, "ClassFileWriter.class"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 4194
    if-nez v2, :cond_0

    .line 4195
    const-string v8, "org/mozilla/classfile/ClassFileWriter.class"

    invoke-static {v8}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 4198
    :cond_0
    const/16 v8, 0x8

    new-array v1, v8, [B

    .line 4201
    .local v1, "header":[B
    const/4 v5, 0x0

    .line 4202
    .local v5, "read":I
    :goto_0
    if-ge v5, v11, :cond_3

    .line 4203
    rsub-int/lit8 v8, v5, 0x8

    invoke-virtual {v2, v1, v5, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 4204
    .local v0, "c":I
    if-gez v0, :cond_2

    new-instance v8, Ljava/io/IOException;

    invoke-direct {v8}, Ljava/io/IOException;-><init>()V

    throw v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4209
    .end local v0    # "c":I
    .end local v1    # "header":[B
    .end local v5    # "read":I
    :catch_0
    move-exception v8

    .line 4212
    sput v4, Lorg/mozilla/classfile/ClassFileWriter;->MinorVersion:I

    .line 4213
    sput v3, Lorg/mozilla/classfile/ClassFileWriter;->MajorVersion:I

    .line 4214
    if-lt v3, v10, :cond_5

    :goto_1
    sput-boolean v6, Lorg/mozilla/classfile/ClassFileWriter;->GenerateStackMap:Z

    .line 4215
    if-eqz v2, :cond_1

    .line 4217
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 4222
    :cond_1
    :goto_2
    return-void

    .line 4205
    .restart local v0    # "c":I
    .restart local v1    # "header":[B
    .restart local v5    # "read":I
    :cond_2
    add-int/2addr v5, v0

    .line 4206
    goto :goto_0

    .line 4207
    .end local v0    # "c":I
    :cond_3
    const/4 v8, 0x4

    :try_start_2
    aget-byte v8, v1, v8

    shl-int/lit8 v8, v8, 0x8

    const/4 v9, 0x5

    aget-byte v9, v1, v9

    and-int/lit16 v9, v9, 0xff

    or-int v4, v8, v9

    .line 4208
    const/4 v8, 0x6

    aget-byte v8, v1, v8

    shl-int/lit8 v8, v8, 0x8

    const/4 v9, 0x7

    aget-byte v9, v1, v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    and-int/lit16 v9, v9, 0xff

    or-int v3, v8, v9

    .line 4212
    sput v4, Lorg/mozilla/classfile/ClassFileWriter;->MinorVersion:I

    .line 4213
    sput v3, Lorg/mozilla/classfile/ClassFileWriter;->MajorVersion:I

    .line 4214
    if-lt v3, v10, :cond_4

    :goto_3
    sput-boolean v6, Lorg/mozilla/classfile/ClassFileWriter;->GenerateStackMap:Z

    .line 4215
    if-eqz v2, :cond_1

    .line 4217
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    .line 4218
    :catch_1
    move-exception v6

    goto :goto_2

    :cond_4
    move v6, v7

    .line 4214
    goto :goto_3

    .end local v1    # "header":[B
    .end local v5    # "read":I
    :cond_5
    move v6, v7

    goto :goto_1

    .line 4212
    :catchall_0
    move-exception v8

    sput v4, Lorg/mozilla/classfile/ClassFileWriter;->MinorVersion:I

    .line 4213
    sput v3, Lorg/mozilla/classfile/ClassFileWriter;->MajorVersion:I

    .line 4214
    if-lt v3, v10, :cond_7

    :goto_4
    sput-boolean v6, Lorg/mozilla/classfile/ClassFileWriter;->GenerateStackMap:Z

    .line 4215
    if-eqz v2, :cond_6

    .line 4217
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 4219
    :cond_6
    :goto_5
    throw v8

    :cond_7
    move v6, v7

    .line 4214
    goto :goto_4

    .line 4218
    :catch_2
    move-exception v6

    goto :goto_2

    :catch_3
    move-exception v6

    goto :goto_5
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "superClassName"    # Ljava/lang/String;
    .param p3, "sourceFileName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4162
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    .line 4163
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 4170
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    .line 4238
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    .line 4249
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    .line 4250
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    .line 4251
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsInterfaces:Lorg/mozilla/javascript/ObjArray;

    .line 4268
    const/16 v0, 0x40

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->tmpCharBuffer:[C

    .line 55
    iput-object p1, p0, Lorg/mozilla/classfile/ClassFileWriter;->generatedClassName:Ljava/lang/String;

    .line 56
    new-instance v0, Lorg/mozilla/classfile/ConstantPool;

    invoke-direct {v0, p0}, Lorg/mozilla/classfile/ConstantPool;-><init>(Lorg/mozilla/classfile/ClassFileWriter;)V

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    .line 57
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsThisClassIndex:S

    .line 58
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v0, p2}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperClassIndex:S

    .line 59
    if-eqz p3, :cond_0

    .line 60
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v0, p3}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    .line 64
    :cond_0
    const/16 v0, 0x21

    iput-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFlags:S

    .line 65
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/classfile/ClassFileWriter;)I
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    return v0
.end method

.method static synthetic access$100(Lorg/mozilla/classfile/ClassFileWriter;)[I
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter;->createInitialLocals()[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0}, Lorg/mozilla/classfile/ClassFileWriter;->sizeOfParameters(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lorg/mozilla/classfile/ClassFileWriter;)S
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsThisClassIndex:S

    return v0
.end method

.method static synthetic access$1200(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0}, Lorg/mozilla/classfile/ClassFileWriter;->descriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Lorg/mozilla/classfile/ClassFileWriter;)S
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxLocals:S

    return v0
.end method

.method static synthetic access$1400(Lorg/mozilla/classfile/ClassFileWriter;)S
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    return v0
.end method

.method static synthetic access$200(Lorg/mozilla/classfile/ClassFileWriter;)[I
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    return-object v0
.end method

.method static synthetic access$300(Lorg/mozilla/classfile/ClassFileWriter;)I
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    return v0
.end method

.method static synthetic access$400(Lorg/mozilla/classfile/ClassFileWriter;)I
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    return v0
.end method

.method static synthetic access$410(Lorg/mozilla/classfile/ClassFileWriter;)I
    .locals 2
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    return v0
.end method

.method static synthetic access$500(Lorg/mozilla/classfile/ClassFileWriter;)[Lorg/mozilla/classfile/ExceptionTableEntry;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    return-object v0
.end method

.method static synthetic access$600(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/javascript/UintMap;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    return-object v0
.end method

.method static synthetic access$700(Lorg/mozilla/classfile/ClassFileWriter;)[B
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    return-object v0
.end method

.method static synthetic access$800(Lorg/mozilla/classfile/ClassFileWriter;)Lorg/mozilla/classfile/ConstantPool;
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    return-object v0
.end method

.method static synthetic access$900(I)C
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 25
    invoke-static {p0}, Lorg/mozilla/classfile/ClassFileWriter;->arrayTypeToName(I)C

    move-result v0

    return v0
.end method

.method private addLabelFixup(II)V
    .locals 8
    .param p1, "label"    # I
    .param p2, "fixupSite"    # I

    .prologue
    const/4 v3, 0x0

    .line 1272
    if-ltz p1, :cond_0

    .line 1273
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Bad label, no biscuit"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1274
    :cond_0
    const v2, 0x7fffffff

    and-int/2addr p1, v2

    .line 1275
    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTableTop:I

    if-lt p1, v2, :cond_1

    .line 1276
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Bad label"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1277
    :cond_1
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 1278
    .local v1, "top":I
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    array-length v2, v2

    if-ne v1, v2, :cond_3

    .line 1279
    :cond_2
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    if-nez v2, :cond_4

    .line 1280
    const/16 v2, 0x28

    new-array v2, v2, [J

    iput-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    .line 1287
    :cond_3
    :goto_0
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 1288
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    int-to-long v4, p1

    const/16 v3, 0x20

    shl-long/2addr v4, v3

    int-to-long v6, p2

    or-long/2addr v4, v6

    aput-wide v4, v2, v1

    .line 1289
    return-void

    .line 1282
    :cond_4
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    new-array v0, v2, [J

    .line 1283
    .local v0, "tmp":[J
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    invoke-static {v2, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1284
    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    goto :goto_0
.end method

.method private addReservedCodeSpace(I)I
    .locals 6
    .param p1, "size"    # I

    .prologue
    const/4 v5, 0x0

    .line 1359
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    if-nez v4, :cond_0

    .line 1360
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "No method to add to"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1361
    :cond_0
    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 1362
    .local v2, "oldTop":I
    add-int v1, v2, p1

    .line 1363
    .local v1, "newTop":I
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    array-length v4, v4

    if-le v1, v4, :cond_2

    .line 1364
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    array-length v4, v4

    mul-int/lit8 v0, v4, 0x2

    .line 1365
    .local v0, "newSize":I
    if-le v1, v0, :cond_1

    move v0, v1

    .line 1366
    :cond_1
    new-array v3, v0, [B

    .line 1367
    .local v3, "tmp":[B
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {v4, v5, v3, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1368
    iput-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    .line 1370
    .end local v0    # "newSize":I
    .end local v3    # "tmp":[B
    :cond_2
    iput v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 1371
    return v2
.end method

.method private addSuperBlockStart(I)V
    .locals 4
    .param p1, "pc"    # I

    .prologue
    const/4 v3, 0x0

    .line 4116
    sget-boolean v1, Lorg/mozilla/classfile/ClassFileWriter;->GenerateStackMap:Z

    if-eqz v1, :cond_1

    .line 4117
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    if-nez v1, :cond_2

    .line 4118
    const/4 v1, 0x4

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    .line 4125
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    aput p1, v1, v2

    .line 4127
    :cond_1
    return-void

    .line 4119
    :cond_2
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    array-length v1, v1

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    if-ne v1, v2, :cond_0

    .line 4120
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [I

    .line 4121
    .local v0, "tmp":[I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4123
    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    goto :goto_0
.end method

.method private addToCodeBuffer(I)V
    .locals 3
    .param p1, "b"    # I

    .prologue
    .line 1347
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addReservedCodeSpace(I)I

    move-result v0

    .line 1348
    .local v0, "N":I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    int-to-byte v2, p1

    aput-byte v2, v1, v0

    .line 1349
    return-void
.end method

.method private addToCodeInt16(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 1353
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addReservedCodeSpace(I)I

    move-result v0

    .line 1354
    .local v0, "N":I
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {p1, v1, v0}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    .line 1355
    return-void
.end method

.method private static arrayTypeToName(I)C
    .locals 2
    .param p0, "type"    # I

    .prologue
    .line 2601
    packed-switch p0, :pswitch_data_0

    .line 2619
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad operand"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2603
    :pswitch_0
    const/16 v0, 0x5a

    .line 2617
    :goto_0
    return v0

    .line 2605
    :pswitch_1
    const/16 v0, 0x43

    goto :goto_0

    .line 2607
    :pswitch_2
    const/16 v0, 0x46

    goto :goto_0

    .line 2609
    :pswitch_3
    const/16 v0, 0x44

    goto :goto_0

    .line 2611
    :pswitch_4
    const/16 v0, 0x42

    goto :goto_0

    .line 2613
    :pswitch_5
    const/16 v0, 0x53

    goto :goto_0

    .line 2615
    :pswitch_6
    const/16 v0, 0x49

    goto :goto_0

    .line 2617
    :pswitch_7
    const/16 v0, 0x4a

    goto :goto_0

    .line 2601
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private static badStack(I)V
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 2838
    if-gez p0, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Stack underflow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2840
    .local v0, "s":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2839
    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Too big stack: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "s":Ljava/lang/String;
    goto :goto_0
.end method

.method private static bytecodeStr(I)Ljava/lang/String;
    .locals 1
    .param p0, "code"    # I

    .prologue
    .line 4093
    const-string v0, ""

    return-object v0
.end method

.method private static classDescriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "descriptor"    # Ljava/lang/String;

    .prologue
    .line 2629
    const/4 v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static classNameToSignature(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 129
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 130
    .local v3, "nameLength":I
    add-int/lit8 v1, v3, 0x1

    .line 131
    .local v1, "colonPos":I
    add-int/lit8 v4, v1, 0x1

    new-array v0, v4, [C

    .line 132
    .local v0, "buf":[C
    const/16 v4, 0x4c

    aput-char v4, v0, v6

    .line 133
    const/16 v4, 0x3b

    aput-char v4, v0, v1

    .line 134
    const/4 v4, 0x1

    invoke-virtual {p0, v6, v3, v0, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 135
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_1

    .line 136
    aget-char v4, v0, v2

    const/16 v5, 0x2e

    if-ne v4, v5, :cond_0

    .line 137
    const/16 v4, 0x2f

    aput-char v4, v0, v2

    .line 135
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 140
    :cond_1
    new-instance v4, Ljava/lang/String;

    add-int/lit8 v5, v1, 0x1

    invoke-direct {v4, v0, v6, v5}, Ljava/lang/String;-><init>([CII)V

    return-object v4
.end method

.method private createInitialLocals()[I
    .locals 14

    .prologue
    .line 2665
    iget-short v12, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxLocals:S

    new-array v1, v12, [I

    .line 2666
    .local v1, "initialLocals":[I
    const/4 v4, 0x0

    .line 2671
    .local v4, "localsTop":I
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileMethod;->getFlags()S

    move-result v12

    and-int/lit8 v12, v12, 0x8

    if-nez v12, :cond_0

    .line 2672
    const-string v12, "<init>"

    iget-object v13, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    invoke-virtual {v13}, Lorg/mozilla/classfile/ClassFileMethod;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 2673
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "localsTop":I
    .local v5, "localsTop":I
    const/4 v12, 0x6

    aput v12, v1, v4

    move v4, v5

    .line 2680
    .end local v5    # "localsTop":I
    .restart local v4    # "localsTop":I
    :cond_0
    :goto_0
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    invoke-virtual {v12}, Lorg/mozilla/classfile/ClassFileMethod;->getType()Ljava/lang/String;

    move-result-object v10

    .line 2681
    .local v10, "type":Ljava/lang/String;
    const/16 v12, 0x28

    invoke-virtual {v10, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 2682
    .local v3, "lParenIndex":I
    const/16 v12, 0x29

    invoke-virtual {v10, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 2683
    .local v8, "rParenIndex":I
    if-nez v3, :cond_1

    if-gez v8, :cond_3

    .line 2684
    :cond_1
    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "bad method type"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 2675
    .end local v3    # "lParenIndex":I
    .end local v8    # "rParenIndex":I
    .end local v10    # "type":Ljava/lang/String;
    :cond_2
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "localsTop":I
    .restart local v5    # "localsTop":I
    iget-short v12, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsThisClassIndex:S

    invoke-static {v12}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v12

    aput v12, v1, v4

    move v4, v5

    .end local v5    # "localsTop":I
    .restart local v4    # "localsTop":I
    goto :goto_0

    .line 2686
    .restart local v3    # "lParenIndex":I
    .restart local v8    # "rParenIndex":I
    .restart local v10    # "type":Ljava/lang/String;
    :cond_3
    add-int/lit8 v9, v3, 0x1

    .line 2687
    .local v9, "start":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .local v7, "paramType":Ljava/lang/StringBuilder;
    move v5, v4

    .line 2688
    .end local v4    # "localsTop":I
    .restart local v5    # "localsTop":I
    :goto_1
    if-ge v9, v8, :cond_5

    .line 2689
    invoke-virtual {v10, v9}, Ljava/lang/String;->charAt(I)C

    move-result v12

    sparse-switch v12, :sswitch_data_0

    .line 2712
    :goto_2
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/mozilla/classfile/ClassFileWriter;->descriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2714
    .local v2, "internalType":Ljava/lang/String;
    iget-object v12, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-static {v2, v12}, Lorg/mozilla/classfile/TypeInfo;->fromType(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v11

    .line 2715
    .local v11, "typeInfo":I
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "localsTop":I
    .restart local v4    # "localsTop":I
    aput v11, v1, v5

    .line 2716
    invoke-static {v11}, Lorg/mozilla/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 2717
    add-int/lit8 v4, v4, 0x1

    .line 2719
    :cond_4
    const/4 v12, 0x0

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->setLength(I)V

    move v5, v4

    .line 2720
    .end local v4    # "localsTop":I
    .restart local v5    # "localsTop":I
    goto :goto_1

    .line 2698
    .end local v2    # "internalType":Ljava/lang/String;
    .end local v11    # "typeInfo":I
    :sswitch_0
    invoke-virtual {v10, v9}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2699
    add-int/lit8 v9, v9, 0x1

    .line 2700
    goto :goto_2

    .line 2702
    :sswitch_1
    const/16 v12, 0x3b

    invoke-virtual {v10, v12, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v12

    add-int/lit8 v0, v12, 0x1

    .line 2703
    .local v0, "end":I
    invoke-virtual {v10, v9, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 2704
    .local v6, "name":Ljava/lang/String;
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2705
    move v9, v0

    .line 2706
    goto :goto_2

    .line 2708
    .end local v0    # "end":I
    .end local v6    # "name":Ljava/lang/String;
    :sswitch_2
    const/16 v12, 0x5b

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2709
    add-int/lit8 v9, v9, 0x1

    .line 2710
    goto :goto_1

    .line 2721
    :cond_5
    return-object v1

    .line 2689
    :sswitch_data_0
    .sparse-switch
        0x42 -> :sswitch_0
        0x43 -> :sswitch_0
        0x44 -> :sswitch_0
        0x46 -> :sswitch_0
        0x49 -> :sswitch_0
        0x4a -> :sswitch_0
        0x4c -> :sswitch_1
        0x53 -> :sswitch_0
        0x5a -> :sswitch_0
        0x5b -> :sswitch_2
    .end sparse-switch
.end method

.method private static descriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "descriptor"    # Ljava/lang/String;

    .prologue
    .line 2638
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 2653
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad descriptor:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2651
    :pswitch_1
    invoke-static {p0}, Lorg/mozilla/classfile/ClassFileWriter;->classDescriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "descriptor":Ljava/lang/String;
    :pswitch_2
    return-object p0

    .line 2638
    :pswitch_data_0
    .packed-switch 0x42
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private finalizeSuperBlockStarts()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 4136
    sget-boolean v6, Lorg/mozilla/classfile/ClassFileWriter;->GenerateStackMap:Z

    if-eqz v6, :cond_4

    .line 4137
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    if-ge v4, v6, :cond_0

    .line 4138
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    aget-object v2, v6, v4

    .line 4139
    .local v2, "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    iget v6, v2, Lorg/mozilla/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v6

    int-to-short v3, v6

    .line 4140
    .local v3, "handlerPC":S
    invoke-direct {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 4137
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 4142
    .end local v2    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v3    # "handlerPC":S
    :cond_0
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    iget v7, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    invoke-static {v6, v8, v7}, Ljava/util/Arrays;->sort([III)V

    .line 4143
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    aget v5, v6, v8

    .line 4144
    .local v5, "prev":I
    const/4 v0, 0x1

    .line 4145
    .local v0, "copyTo":I
    const/4 v4, 0x1

    :goto_1
    iget v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    if-ge v4, v6, :cond_3

    .line 4146
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    aget v1, v6, v4

    .line 4147
    .local v1, "curr":I
    if-eq v5, v1, :cond_2

    .line 4148
    if-eq v0, v4, :cond_1

    .line 4149
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    aput v1, v6, v0

    .line 4151
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 4152
    move v5, v1

    .line 4145
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 4155
    .end local v1    # "curr":I
    :cond_3
    iput v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 4156
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    add-int/lit8 v7, v0, -0x1

    aget v6, v6, v7

    iget v7, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    if-ne v6, v7, :cond_4

    .line 4157
    iget v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 4160
    .end local v0    # "copyTo":I
    .end local v4    # "i":I
    .end local v5    # "prev":I
    :cond_4
    return-void
.end method

.method private fixLabelGotos()V
    .locals 10

    .prologue
    .line 1293
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    .line 1294
    .local v0, "codeBuffer":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTableTop:I

    if-ge v4, v8, :cond_2

    .line 1295
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTable:[J

    aget-wide v2, v8, v4

    .line 1296
    .local v2, "fixup":J
    const/16 v8, 0x20

    shr-long v8, v2, v8

    long-to-int v5, v8

    .line 1297
    .local v5, "label":I
    long-to-int v1, v2

    .line 1298
    .local v1, "fixupSite":I
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    aget v7, v8, v5

    .line 1299
    .local v7, "pc":I
    const/4 v8, -0x1

    if-ne v7, v8, :cond_0

    .line 1301
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8}, Ljava/lang/RuntimeException;-><init>()V

    throw v8

    .line 1304
    :cond_0
    invoke-direct {p0, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1305
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    add-int/lit8 v9, v1, -0x1

    invoke-virtual {v8, v7, v9}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 1306
    add-int/lit8 v8, v1, -0x1

    sub-int v6, v7, v8

    .line 1307
    .local v6, "offset":I
    int-to-short v8, v6

    if-eq v8, v6, :cond_1

    .line 1308
    new-instance v8, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v9, "Program too complex: too big jump offset"

    invoke-direct {v8, v9}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1311
    :cond_1
    shr-int/lit8 v8, v6, 0x8

    int-to-byte v8, v8

    aput-byte v8, v0, v1

    .line 1312
    add-int/lit8 v8, v1, 0x1

    int-to-byte v9, v6

    aput-byte v9, v0, v8

    .line 1294
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1314
    .end local v1    # "fixupSite":I
    .end local v2    # "fixup":J
    .end local v5    # "label":I
    .end local v6    # "offset":I
    .end local v7    # "pc":I
    :cond_2
    const/4 v8, 0x0

    iput v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 1315
    return-void
.end method

.method static getSlashedForm(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 119
    const/16 v0, 0x2e

    const/16 v1, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getWriteSize()I
    .locals 4

    .prologue
    .line 2739
    const/4 v1, 0x0

    .line 2741
    .local v1, "size":I
    iget-short v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v2, :cond_0

    .line 2742
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    const-string v3, "SourceFile"

    invoke-virtual {v2, v3}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    .line 2745
    :cond_0
    add-int/lit8 v1, v1, 0x8

    .line 2746
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ConstantPool;->getWriteSize()I

    move-result v2

    add-int/lit8 v1, v2, 0x8

    .line 2747
    add-int/lit8 v1, v1, 0x2

    .line 2748
    add-int/lit8 v1, v1, 0x2

    .line 2749
    add-int/lit8 v1, v1, 0x2

    .line 2750
    add-int/lit8 v1, v1, 0x2

    .line 2751
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsInterfaces:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    .line 2753
    add-int/lit8 v1, v1, 0x2

    .line 2754
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 2755
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/classfile/ClassFileField;

    check-cast v2, Lorg/mozilla/classfile/ClassFileField;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileField;->getWriteSize()I

    move-result v2

    add-int/2addr v1, v2

    .line 2754
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2758
    :cond_1
    add-int/lit8 v1, v1, 0x2

    .line 2759
    const/4 v0, 0x0

    :goto_1
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 2760
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/classfile/ClassFileMethod;

    check-cast v2, Lorg/mozilla/classfile/ClassFileMethod;

    invoke-virtual {v2}, Lorg/mozilla/classfile/ClassFileMethod;->getWriteSize()I

    move-result v2

    add-int/2addr v1, v2

    .line 2759
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2763
    :cond_2
    iget-short v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v2, :cond_3

    .line 2764
    add-int/lit8 v1, v1, 0x2

    .line 2765
    add-int/lit8 v1, v1, 0x2

    .line 2766
    add-int/lit8 v1, v1, 0x4

    .line 2767
    add-int/lit8 v1, v1, 0x2

    .line 2772
    :goto_2
    return v1

    .line 2769
    :cond_3
    add-int/lit8 v1, v1, 0x2

    goto :goto_2
.end method

.method static opcodeCount(I)I
    .locals 3
    .param p0, "opcode"    # I

    .prologue
    .line 3209
    packed-switch p0, :pswitch_data_0

    .line 3421
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3361
    :pswitch_1
    const/4 v0, 0x0

    .line 3419
    :goto_0
    return v0

    .line 3411
    :pswitch_2
    const/4 v0, 0x1

    goto :goto_0

    .line 3415
    :pswitch_3
    const/4 v0, 0x2

    goto :goto_0

    .line 3419
    :pswitch_4
    const/4 v0, -0x1

    goto :goto_0

    .line 3209
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method static opcodeLength(IZ)I
    .locals 3
    .param p0, "opcode"    # I
    .param p1, "wide"    # Z

    .prologue
    const/4 v2, 0x5

    const/4 v1, 0x2

    const/4 v0, 0x3

    .line 2980
    packed-switch p0, :pswitch_data_0

    .line 3201
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3132
    :pswitch_1
    const/4 v0, 0x1

    .line 3193
    :cond_0
    :goto_0
    :pswitch_2
    return v0

    :pswitch_3
    move v0, v1

    .line 3136
    goto :goto_0

    .line 3148
    :pswitch_4
    if-nez p1, :cond_0

    move v0, v1

    goto :goto_0

    .line 3185
    :pswitch_5
    if-eqz p1, :cond_0

    move v0, v2

    goto :goto_0

    .line 3188
    :pswitch_6
    const/4 v0, 0x4

    goto :goto_0

    :pswitch_7
    move v0, v2

    .line 3193
    goto :goto_0

    .line 2980
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_5
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_7
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_6
        :pswitch_2
        :pswitch_2
        :pswitch_7
        :pswitch_7
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method static putInt16(I[BI)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "array"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 2959
    add-int/lit8 v0, p2, 0x0

    ushr-int/lit8 v1, p0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2960
    add-int/lit8 v0, p2, 0x1

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 2961
    add-int/lit8 v0, p2, 0x2

    return v0
.end method

.method static putInt32(I[BI)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "array"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 2966
    add-int/lit8 v0, p2, 0x0

    ushr-int/lit8 v1, p0, 0x18

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2967
    add-int/lit8 v0, p2, 0x1

    ushr-int/lit8 v1, p0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2968
    add-int/lit8 v0, p2, 0x2

    ushr-int/lit8 v1, p0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2969
    add-int/lit8 v0, p2, 0x3

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 2970
    add-int/lit8 v0, p2, 0x4

    return v0
.end method

.method static putInt64(J[BI)I
    .locals 2
    .param p0, "value"    # J
    .param p2, "array"    # [B
    .param p3, "offset"    # I

    .prologue
    .line 2831
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    invoke-static {v0, p2, p3}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result p3

    .line 2832
    long-to-int v0, p0

    invoke-static {v0, p2, p3}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v0

    return v0
.end method

.method private static sizeOfParameters(Ljava/lang/String;)I
    .locals 11
    .param p0, "pString"    # Ljava/lang/String;

    .prologue
    .line 2853
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 2854
    .local v3, "length":I
    const/16 v8, 0x29

    invoke-virtual {p0, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 2855
    .local v5, "rightParenthesis":I
    const/4 v8, 0x3

    if-gt v8, v3, :cond_4

    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x28

    if-ne v8, v9, :cond_4

    const/4 v8, 0x1

    if-gt v8, v5, :cond_4

    add-int/lit8 v8, v5, 0x1

    if-ge v8, v3, :cond_4

    .line 2859
    const/4 v4, 0x1

    .line 2860
    .local v4, "ok":Z
    const/4 v2, 0x1

    .line 2861
    .local v2, "index":I
    const/4 v7, 0x0

    .line 2862
    .local v7, "stackDiff":I
    const/4 v1, 0x0

    .line 2864
    .local v1, "count":I
    :goto_0
    if-eq v2, v5, :cond_0

    .line 2865
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v8

    sparse-switch v8, :sswitch_data_0

    .line 2867
    const/4 v4, 0x0

    .line 2926
    :cond_0
    :goto_1
    if-eqz v4, :cond_4

    .line 2927
    add-int/lit8 v8, v5, 0x1

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 2929
    :pswitch_0
    const/4 v4, 0x0

    .line 2948
    :goto_2
    :pswitch_1
    if-eqz v4, :cond_4

    .line 2949
    shl-int/lit8 v8, v1, 0x10

    const v9, 0xffff

    and-int/2addr v9, v7

    or-int/2addr v8, v9

    return v8

    .line 2871
    :sswitch_0
    add-int/lit8 v7, v7, -0x1

    .line 2879
    :sswitch_1
    add-int/lit8 v7, v7, -0x1

    .line 2880
    add-int/lit8 v1, v1, 0x1

    .line 2881
    add-int/lit8 v2, v2, 0x1

    .line 2882
    goto :goto_0

    .line 2884
    :sswitch_2
    add-int/lit8 v2, v2, 0x1

    .line 2885
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 2886
    .local v0, "c":I
    :goto_3
    const/16 v8, 0x5b

    if-ne v0, v8, :cond_1

    .line 2887
    add-int/lit8 v2, v2, 0x1

    .line 2888
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_3

    .line 2890
    :cond_1
    sparse-switch v0, :sswitch_data_1

    .line 2892
    const/4 v4, 0x0

    .line 2893
    goto :goto_1

    .line 2902
    :sswitch_3
    add-int/lit8 v7, v7, -0x1

    .line 2903
    add-int/lit8 v1, v1, 0x1

    .line 2904
    add-int/lit8 v2, v2, 0x1

    .line 2905
    goto :goto_0

    .line 2911
    .end local v0    # "c":I
    :sswitch_4
    add-int/lit8 v7, v7, -0x1

    .line 2912
    add-int/lit8 v1, v1, 0x1

    .line 2913
    add-int/lit8 v2, v2, 0x1

    .line 2914
    const/16 v8, 0x3b

    invoke-virtual {p0, v8, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 2915
    .local v6, "semicolon":I
    add-int/lit8 v8, v2, 0x1

    if-gt v8, v6, :cond_2

    if-lt v6, v5, :cond_3

    .line 2918
    :cond_2
    const/4 v4, 0x0

    .line 2919
    goto :goto_1

    .line 2921
    :cond_3
    add-int/lit8 v2, v6, 0x1

    .line 2922
    goto :goto_0

    .line 2933
    .end local v6    # "semicolon":I
    :pswitch_2
    add-int/lit8 v7, v7, 0x1

    .line 2943
    :pswitch_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 2953
    .end local v1    # "count":I
    .end local v2    # "index":I
    .end local v4    # "ok":Z
    .end local v7    # "stackDiff":I
    :cond_4
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Bad parameter signature: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2865
    :sswitch_data_0
    .sparse-switch
        0x42 -> :sswitch_1
        0x43 -> :sswitch_1
        0x44 -> :sswitch_0
        0x46 -> :sswitch_1
        0x49 -> :sswitch_1
        0x4a -> :sswitch_0
        0x4c -> :sswitch_4
        0x53 -> :sswitch_1
        0x5a -> :sswitch_1
        0x5b -> :sswitch_2
    .end sparse-switch

    .line 2927
    :pswitch_data_0
    .packed-switch 0x42
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_3
    .end packed-switch

    .line 2890
    :sswitch_data_1
    .sparse-switch
        0x42 -> :sswitch_3
        0x43 -> :sswitch_3
        0x44 -> :sswitch_3
        0x46 -> :sswitch_3
        0x49 -> :sswitch_3
        0x4a -> :sswitch_3
        0x4c -> :sswitch_4
        0x53 -> :sswitch_3
        0x5a -> :sswitch_3
    .end sparse-switch
.end method

.method static stackChange(I)I
    .locals 3
    .param p0, "opcode"    # I

    .prologue
    .line 3431
    packed-switch p0, :pswitch_data_0

    .line 3650
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3434
    :pswitch_1
    const/4 v0, -0x4

    .line 3648
    :goto_0
    return v0

    .line 3445
    :pswitch_2
    const/4 v0, -0x3

    goto :goto_0

    .line 3481
    :pswitch_3
    const/4 v0, -0x2

    goto :goto_0

    .line 3551
    :pswitch_4
    const/4 v0, -0x1

    goto :goto_0

    .line 3585
    :pswitch_5
    const/4 v0, 0x0

    goto :goto_0

    .line 3628
    :pswitch_6
    const/4 v0, 0x1

    goto :goto_0

    .line 3648
    :pswitch_7
    const/4 v0, 0x2

    goto :goto_0

    .line 3431
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_6
        :pswitch_7
        :pswitch_6
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_5
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method private xop(III)V
    .locals 1
    .param p1, "shortOp"    # I
    .param p2, "op"    # I
    .param p3, "local"    # I

    .prologue
    .line 1096
    packed-switch p3, :pswitch_data_0

    .line 1110
    invoke-virtual {p0, p2, p3}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 1112
    :goto_0
    return-void

    .line 1098
    :pswitch_0
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1101
    :pswitch_1
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1104
    :pswitch_2
    add-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1107
    :pswitch_3
    add-int/lit8 v0, p1, 0x3

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1096
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public acquireLabel()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1218
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTableTop:I

    .line 1219
    .local v1, "top":I
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    array-length v2, v2

    if-ne v1, v2, :cond_1

    .line 1220
    :cond_0
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    if-nez v2, :cond_2

    .line 1221
    const/16 v2, 0x20

    new-array v2, v2, [I

    iput-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    .line 1228
    :cond_1
    :goto_0
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTableTop:I

    .line 1229
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    const/4 v3, -0x1

    aput v3, v2, v1

    .line 1230
    const/high16 v2, -0x80000000

    or-int/2addr v2, v1

    return v2

    .line 1223
    :cond_2
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    new-array v0, v2, [I

    .line 1224
    .local v0, "tmp":[I
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    invoke-static {v2, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1225
    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    goto :goto_0
.end method

.method public add(I)V
    .locals 3
    .param p1, "theOpCode"    # I

    .prologue
    .line 454
    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->opcodeCount(I)I

    move-result v1

    if-eqz v1, :cond_0

    .line 455
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unexpected operands"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 456
    :cond_0
    iget-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v2

    add-int v0, v1, v2

    .line 457
    .local v0, "newStack":I
    if-ltz v0, :cond_1

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_2

    :cond_1
    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 460
    :cond_2
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 461
    int-to-short v1, v0

    iput-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 462
    iget-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_3

    int-to-short v1, v0

    iput-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 467
    :cond_3
    const/16 v1, 0xbf

    if-ne p1, v1, :cond_4

    .line 468
    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 470
    :cond_4
    return-void
.end method

.method public add(II)V
    .locals 11
    .param p1, "theOpCode"    # I
    .param p2, "theOperand"    # I

    .prologue
    const/16 v10, 0x13

    const/high16 v9, 0x10000

    const/16 v8, 0x100

    const/high16 v7, -0x80000000

    .line 483
    iget-short v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v6

    add-int v1, v5, v6

    .line 484
    .local v1, "newStack":I
    if-ltz v1, :cond_0

    const/16 v5, 0x7fff

    if-ge v5, v1, :cond_1

    :cond_0
    invoke-static {v1}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 486
    :cond_1
    sparse-switch p1, :sswitch_data_0

    .line 621
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Unexpected opcode for 1 operand"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 491
    :sswitch_0
    iget v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    add-int/lit8 v5, v5, 0x3

    invoke-direct {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 510
    :sswitch_1
    and-int v5, p2, v7

    if-eq v5, v7, :cond_3

    .line 511
    if-ltz p2, :cond_2

    const v5, 0xffff

    if-le p2, v5, :cond_3

    .line 512
    :cond_2
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Bad label for branch"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 515
    :cond_3
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 516
    .local v0, "branchPC":I
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 517
    and-int v5, p2, v7

    if-eq v5, v7, :cond_5

    .line 519
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 520
    add-int v3, p2, v0

    .line 521
    .local v3, "target":I
    invoke-direct {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 522
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v5, v3, v0}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 625
    .end local v0    # "branchPC":I
    .end local v3    # "target":I
    :goto_0
    int-to-short v5, v1

    iput-short v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 626
    iget-short v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v1, v5, :cond_4

    int-to-short v5, v1

    iput-short v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 631
    :cond_4
    return-void

    .line 525
    .restart local v0    # "branchPC":I
    :cond_5
    invoke-virtual {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v4

    .line 532
    .local v4, "targetPC":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_6

    .line 533
    sub-int v2, v4, v0

    .line 534
    .local v2, "offset":I
    invoke-direct {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 535
    invoke-direct {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 536
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v5, v4, v0}, Lorg/mozilla/javascript/UintMap;->put(II)V

    goto :goto_0

    .line 539
    .end local v2    # "offset":I
    :cond_6
    add-int/lit8 v5, v0, 0x1

    invoke-direct {p0, p2, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addLabelFixup(II)V

    .line 540
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto :goto_0

    .line 547
    .end local v0    # "branchPC":I
    .end local v4    # "targetPC":I
    :sswitch_2
    int-to-byte v5, p2

    if-eq v5, p2, :cond_7

    .line 548
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "out of range byte"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 549
    :cond_7
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 550
    int-to-byte v5, p2

    invoke-direct {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_0

    .line 554
    :sswitch_3
    int-to-short v5, p2

    if-eq v5, p2, :cond_8

    .line 555
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "out of range short"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 556
    :cond_8
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 557
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto :goto_0

    .line 561
    :sswitch_4
    if-ltz p2, :cond_9

    if-lt p2, v8, :cond_a

    .line 562
    :cond_9
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "out of range index"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 563
    :cond_a
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 564
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_0

    .line 569
    :sswitch_5
    if-ltz p2, :cond_b

    if-lt p2, v9, :cond_c

    .line 570
    :cond_b
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "out of range field"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 571
    :cond_c
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 572
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto :goto_0

    .line 578
    :sswitch_6
    if-ltz p2, :cond_d

    if-lt p2, v9, :cond_e

    .line 579
    :cond_d
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "out of range index"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 580
    :cond_e
    if-ge p2, v8, :cond_f

    if-eq p1, v10, :cond_f

    const/16 v5, 0x14

    if-ne p1, v5, :cond_11

    .line 584
    :cond_f
    const/16 v5, 0x12

    if-ne p1, v5, :cond_10

    .line 585
    invoke-direct {p0, v10}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 589
    :goto_1
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto/16 :goto_0

    .line 587
    :cond_10
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_1

    .line 591
    :cond_11
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 592
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto/16 :goto_0

    .line 607
    :sswitch_7
    if-ltz p2, :cond_12

    if-lt p2, v9, :cond_13

    .line 608
    :cond_12
    new-instance v5, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v6, "out of range variable"

    invoke-direct {v5, v6}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 609
    :cond_13
    if-lt p2, v8, :cond_14

    .line 610
    const/16 v5, 0xc4

    invoke-direct {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 611
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 612
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto/16 :goto_0

    .line 615
    :cond_14
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 616
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto/16 :goto_0

    .line 486
    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_2
        0x11 -> :sswitch_3
        0x12 -> :sswitch_6
        0x13 -> :sswitch_6
        0x14 -> :sswitch_6
        0x15 -> :sswitch_7
        0x16 -> :sswitch_7
        0x17 -> :sswitch_7
        0x18 -> :sswitch_7
        0x19 -> :sswitch_7
        0x36 -> :sswitch_7
        0x37 -> :sswitch_7
        0x38 -> :sswitch_7
        0x39 -> :sswitch_7
        0x3a -> :sswitch_7
        0x99 -> :sswitch_1
        0x9a -> :sswitch_1
        0x9b -> :sswitch_1
        0x9c -> :sswitch_1
        0x9d -> :sswitch_1
        0x9e -> :sswitch_1
        0x9f -> :sswitch_1
        0xa0 -> :sswitch_1
        0xa1 -> :sswitch_1
        0xa2 -> :sswitch_1
        0xa3 -> :sswitch_1
        0xa4 -> :sswitch_1
        0xa5 -> :sswitch_1
        0xa6 -> :sswitch_1
        0xa7 -> :sswitch_0
        0xa8 -> :sswitch_1
        0xa9 -> :sswitch_7
        0xb4 -> :sswitch_5
        0xb5 -> :sswitch_5
        0xbc -> :sswitch_4
        0xc6 -> :sswitch_1
        0xc7 -> :sswitch_1
    .end sparse-switch
.end method

.method public add(III)V
    .locals 6
    .param p1, "theOpCode"    # I
    .param p2, "theOperand1"    # I
    .param p3, "theOperand2"    # I

    .prologue
    const/16 v5, 0xc5

    const/high16 v4, 0x10000

    const/16 v3, 0x84

    .line 701
    iget-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v2

    add-int v0, v1, v2

    .line 702
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    :cond_0
    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 704
    :cond_1
    if-ne p1, v3, :cond_9

    .line 705
    if-ltz p2, :cond_2

    if-lt p2, v4, :cond_3

    .line 706
    :cond_2
    new-instance v1, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v2, "out of range variable"

    invoke-direct {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 707
    :cond_3
    if-ltz p3, :cond_4

    if-lt p3, v4, :cond_5

    .line 708
    :cond_4
    new-instance v1, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v2, "out of range increment"

    invoke-direct {v1, v2}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 710
    :cond_5
    const/16 v1, 0xff

    if-gt p2, v1, :cond_6

    const/16 v1, -0x80

    if-lt p3, v1, :cond_6

    const/16 v1, 0x7f

    if-le p3, v1, :cond_8

    .line 711
    :cond_6
    const/16 v1, 0xc4

    invoke-direct {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 712
    invoke-direct {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 713
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 714
    invoke-direct {p0, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 736
    :goto_0
    int-to-short v1, v0

    iput-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 737
    iget-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_7

    int-to-short v1, v0

    iput-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 743
    :cond_7
    return-void

    .line 717
    :cond_8
    invoke-direct {p0, v3}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 718
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 719
    invoke-direct {p0, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_0

    .line 722
    :cond_9
    if-ne p1, v5, :cond_e

    .line 723
    if-ltz p2, :cond_a

    if-lt p2, v4, :cond_b

    .line 724
    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range index"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 725
    :cond_b
    if-ltz p3, :cond_c

    const/16 v1, 0x100

    if-lt p3, v1, :cond_d

    .line 726
    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range dimensions"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 728
    :cond_d
    invoke-direct {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 729
    invoke-direct {p0, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 730
    invoke-direct {p0, p3}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_0

    .line 733
    :cond_e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unexpected opcode for 2 operands"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public add(ILjava/lang/String;)V
    .locals 4
    .param p1, "theOpCode"    # I
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 750
    iget-short v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v3

    add-int v1, v2, v3

    .line 751
    .local v1, "newStack":I
    if-ltz v1, :cond_0

    const/16 v2, 0x7fff

    if-ge v2, v1, :cond_1

    :cond_0
    invoke-static {v1}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 752
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 764
    :pswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "bad opcode for class reference"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 757
    :pswitch_1
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v2, p2}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    .line 758
    .local v0, "classIndex":S
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 759
    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 767
    int-to-short v2, v1

    iput-short v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 768
    iget-short v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v1, v2, :cond_2

    int-to-short v2, v1

    iput-short v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 773
    :cond_2
    return-void

    .line 752
    nop

    :pswitch_data_0
    .packed-switch 0xbb
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "theOpCode"    # I
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "fieldName"    # Ljava/lang/String;
    .param p4, "fieldType"    # Ljava/lang/String;

    .prologue
    .line 783
    iget-short v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v5

    add-int v3, v4, v5

    .line 784
    .local v3, "newStack":I
    const/4 v4, 0x0

    invoke-virtual {p4, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 785
    .local v2, "fieldTypeChar":C
    const/16 v4, 0x4a

    if-eq v2, v4, :cond_0

    const/16 v4, 0x44

    if-ne v2, v4, :cond_1

    :cond_0
    const/4 v1, 0x2

    .line 787
    .local v1, "fieldSize":I
    :goto_0
    packed-switch p1, :pswitch_data_0

    .line 797
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "bad opcode for field reference"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 785
    .end local v1    # "fieldSize":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 790
    .restart local v1    # "fieldSize":I
    :pswitch_0
    add-int/2addr v3, v1

    .line 800
    :goto_1
    if-ltz v3, :cond_2

    const/16 v4, 0x7fff

    if-ge v4, v3, :cond_3

    :cond_2
    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 801
    :cond_3
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v4, p2, p3, p4}, Lorg/mozilla/classfile/ConstantPool;->addFieldRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    .line 803
    .local v0, "fieldRefIndex":S
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 804
    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 806
    int-to-short v4, v3

    iput-short v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 807
    iget-short v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v3, v4, :cond_4

    int-to-short v4, v3

    iput-short v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 812
    :cond_4
    return-void

    .line 794
    .end local v0    # "fieldRefIndex":S
    :pswitch_1
    sub-int/2addr v3, v1

    .line 795
    goto :goto_1

    .line 787
    :pswitch_data_0
    .packed-switch 0xb2
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public addALoad(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1083
    const/16 v0, 0x2a

    const/16 v1, 0x19

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1084
    return-void
.end method

.method public addAStore(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1033
    const/16 v0, 0x4b

    const/16 v1, 0x3a

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1034
    return-void
.end method

.method public addDLoad(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1073
    const/16 v0, 0x26

    const/16 v1, 0x18

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1074
    return-void
.end method

.method public addDStore(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1023
    const/16 v0, 0x47

    const/16 v1, 0x39

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1024
    return-void
.end method

.method public addExceptionHandler(IIILjava/lang/String;)V
    .locals 7
    .param p1, "startLabel"    # I
    .param p2, "endLabel"    # I
    .param p3, "handlerLabel"    # I
    .param p4, "catchClassName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/high16 v6, -0x80000000

    .line 1377
    and-int v5, p1, v6

    if-eq v5, v6, :cond_0

    .line 1378
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Bad startLabel"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1379
    :cond_0
    and-int v5, p2, v6

    if-eq v5, v6, :cond_1

    .line 1380
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Bad endLabel"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1381
    :cond_1
    and-int v5, p3, v6

    if-eq v5, v6, :cond_2

    .line 1382
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Bad handlerLabel"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1389
    :cond_2
    if-nez p4, :cond_4

    move v1, v4

    .line 1392
    .local v1, "catch_type_index":S
    :goto_0
    new-instance v2, Lorg/mozilla/classfile/ExceptionTableEntry;

    invoke-direct {v2, p1, p2, p3, v1}, Lorg/mozilla/classfile/ExceptionTableEntry;-><init>(IIIS)V

    .line 1397
    .local v2, "newEntry":Lorg/mozilla/classfile/ExceptionTableEntry;
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    .line 1398
    .local v0, "N":I
    if-nez v0, :cond_5

    .line 1399
    const/4 v4, 0x4

    new-array v4, v4, [Lorg/mozilla/classfile/ExceptionTableEntry;

    iput-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    .line 1405
    :cond_3
    :goto_1
    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    aput-object v2, v4, v0

    .line 1406
    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    .line 1408
    return-void

    .line 1389
    .end local v0    # "N":I
    .end local v1    # "catch_type_index":S
    .end local v2    # "newEntry":Lorg/mozilla/classfile/ExceptionTableEntry;
    :cond_4
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v5, p4}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v1

    goto :goto_0

    .line 1400
    .restart local v0    # "N":I
    .restart local v1    # "catch_type_index":S
    .restart local v2    # "newEntry":Lorg/mozilla/classfile/ExceptionTableEntry;
    :cond_5
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    array-length v5, v5

    if-ne v0, v5, :cond_3

    .line 1401
    mul-int/lit8 v5, v0, 0x2

    new-array v3, v5, [Lorg/mozilla/classfile/ExceptionTableEntry;

    .line 1402
    .local v3, "tmp":[Lorg/mozilla/classfile/ExceptionTableEntry;
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    invoke-static {v5, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1403
    iput-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    goto :goto_1
.end method

.method public addFLoad(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1063
    const/16 v0, 0x22

    const/16 v1, 0x17

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1064
    return-void
.end method

.method public addFStore(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1013
    const/16 v0, 0x43

    const/16 v1, 0x38

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1014
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;S)V
    .locals 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S

    .prologue
    .line 152
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v2, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 153
    .local v0, "fieldNameIndex":S
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v2, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 154
    .local v1, "typeIndex":S
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    new-instance v3, Lorg/mozilla/classfile/ClassFileField;

    invoke-direct {v3, v0, v1, p3}, Lorg/mozilla/classfile/ClassFileField;-><init>(SSS)V

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 155
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;SD)V
    .locals 8
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S
    .param p4, "value"    # D

    .prologue
    .line 215
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 216
    .local v1, "fieldNameIndex":S
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 217
    .local v2, "typeIndex":S
    new-instance v0, Lorg/mozilla/classfile/ClassFileField;

    invoke-direct {v0, v1, v2, p3}, Lorg/mozilla/classfile/ClassFileField;-><init>(SSS)V

    .line 219
    .local v0, "field":Lorg/mozilla/classfile/ClassFileField;
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    const-string v4, "ConstantValue"

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v6, p4, p5}, Lorg/mozilla/classfile/ConstantPool;->addConstant(D)I

    move-result v6

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/mozilla/classfile/ClassFileField;->setAttributes(SSSI)V

    .line 223
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 224
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;SI)V
    .locals 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S
    .param p4, "value"    # I

    .prologue
    const/4 v5, 0x0

    .line 169
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 170
    .local v1, "fieldNameIndex":S
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 171
    .local v2, "typeIndex":S
    new-instance v0, Lorg/mozilla/classfile/ClassFileField;

    invoke-direct {v0, v1, v2, p3}, Lorg/mozilla/classfile/ClassFileField;-><init>(SSS)V

    .line 173
    .local v0, "field":Lorg/mozilla/classfile/ClassFileField;
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    const-string v4, "ConstantValue"

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    iget-object v4, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v4, p4}, Lorg/mozilla/classfile/ConstantPool;->addConstant(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v5, v4}, Lorg/mozilla/classfile/ClassFileField;->setAttributes(SSSI)V

    .line 177
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 178
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;SJ)V
    .locals 8
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S
    .param p4, "value"    # J

    .prologue
    .line 192
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 193
    .local v1, "fieldNameIndex":S
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 194
    .local v2, "typeIndex":S
    new-instance v0, Lorg/mozilla/classfile/ClassFileField;

    invoke-direct {v0, v1, v2, p3}, Lorg/mozilla/classfile/ClassFileField;-><init>(SSS)V

    .line 196
    .local v0, "field":Lorg/mozilla/classfile/ClassFileField;
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    const-string v4, "ConstantValue"

    invoke-virtual {v3, v4}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v6, p4, p5}, Lorg/mozilla/classfile/ConstantPool;->addConstant(J)I

    move-result v6

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/mozilla/classfile/ClassFileField;->setAttributes(SSSI)V

    .line 200
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 201
    return-void
.end method

.method public addILoad(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1043
    const/16 v0, 0x1a

    const/16 v1, 0x15

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1044
    return-void
.end method

.method public addIStore(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 993
    const/16 v0, 0x3b

    const/16 v1, 0x36

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 994
    return-void
.end method

.method public addInterface(Ljava/lang/String;)V
    .locals 3
    .param p1, "interfaceName"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v1, p1}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    .line 84
    .local v0, "interfaceIndex":S
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsInterfaces:Lorg/mozilla/javascript/ObjArray;

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "theOpCode"    # I
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "methodType"    # Ljava/lang/String;

    .prologue
    .line 822
    invoke-static {p4}, Lorg/mozilla/classfile/ClassFileWriter;->sizeOfParameters(Ljava/lang/String;)I

    move-result v4

    .line 823
    .local v4, "parameterInfo":I
    ushr-int/lit8 v3, v4, 0x10

    .line 824
    .local v3, "parameterCount":I
    int-to-short v5, v4

    .line 826
    .local v5, "stackDiff":I
    iget-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    add-int v2, v6, v5

    .line 827
    .local v2, "newStack":I
    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v6

    add-int/2addr v2, v6

    .line 828
    if-ltz v2, :cond_0

    const/16 v6, 0x7fff

    if-ge v6, v2, :cond_1

    :cond_0
    invoke-static {v2}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 830
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 855
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "bad opcode for method reference"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 835
    :pswitch_0
    invoke-direct {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 836
    const/16 v6, 0xb9

    if-ne p1, v6, :cond_3

    .line 837
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v6, p2, p3, p4}, Lorg/mozilla/classfile/ConstantPool;->addInterfaceMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    .line 841
    .local v0, "ifMethodRefIndex":S
    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 842
    add-int/lit8 v6, v3, 0x1

    invoke-direct {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 843
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 858
    .end local v0    # "ifMethodRefIndex":S
    :goto_0
    int-to-short v6, v2

    iput-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 859
    iget-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v2, v6, :cond_2

    int-to-short v6, v2

    iput-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 864
    :cond_2
    return-void

    .line 846
    :cond_3
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v6, p2, p3, p4}, Lorg/mozilla/classfile/ConstantPool;->addMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .line 849
    .local v1, "methodRefIndex":S
    invoke-direct {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto :goto_0

    .line 830
    :pswitch_data_0
    .packed-switch 0xb6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public addLLoad(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1053
    const/16 v0, 0x1e

    const/16 v1, 0x16

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1054
    return-void
.end method

.method public addLStore(I)V
    .locals 2
    .param p1, "local"    # I

    .prologue
    .line 1003
    const/16 v0, 0x3f

    const/16 v1, 0x37

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/classfile/ClassFileWriter;->xop(III)V

    .line 1004
    return-void
.end method

.method public addLineNumberEntry(S)V
    .locals 4
    .param p1, "lineNumber"    # S

    .prologue
    const/4 v3, 0x0

    .line 1411
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    if-nez v2, :cond_0

    .line 1412
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No method to stop"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1413
    :cond_0
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    .line 1414
    .local v0, "N":I
    if-nez v0, :cond_2

    .line 1415
    const/16 v2, 0x10

    new-array v2, v2, [I

    iput-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    .line 1421
    :cond_1
    :goto_0
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    iget v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    shl-int/lit8 v3, v3, 0x10

    add-int/2addr v3, p1

    aput v3, v2, v0

    .line 1422
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    .line 1423
    return-void

    .line 1416
    :cond_2
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    array-length v2, v2

    if-ne v0, v2, :cond_1

    .line 1417
    mul-int/lit8 v2, v0, 0x2

    new-array v1, v2, [I

    .line 1418
    .local v1, "tmp":[I
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1419
    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    goto :goto_0
.end method

.method public addLoadConstant(D)V
    .locals 3
    .param p1, "k"    # D

    .prologue
    .line 676
    const/16 v0, 0x14

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v1, p1, p2}, Lorg/mozilla/classfile/ConstantPool;->addConstant(D)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 677
    return-void
.end method

.method public addLoadConstant(F)V
    .locals 2
    .param p1, "k"    # F

    .prologue
    .line 667
    const/16 v0, 0x12

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v1, p1}, Lorg/mozilla/classfile/ConstantPool;->addConstant(F)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 668
    return-void
.end method

.method public addLoadConstant(I)V
    .locals 2
    .param p1, "k"    # I

    .prologue
    .line 639
    packed-switch p1, :pswitch_data_0

    .line 647
    const/16 v0, 0x12

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v1, p1}, Lorg/mozilla/classfile/ConstantPool;->addConstant(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 650
    :goto_0
    return-void

    .line 640
    :pswitch_0
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 641
    :pswitch_1
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 642
    :pswitch_2
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 643
    :pswitch_3
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 644
    :pswitch_4
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 645
    :pswitch_5
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 639
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public addLoadConstant(J)V
    .locals 3
    .param p1, "k"    # J

    .prologue
    .line 658
    const/16 v0, 0x14

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v1, p1, p2}, Lorg/mozilla/classfile/ConstantPool;->addConstant(J)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 659
    return-void
.end method

.method public addLoadConstant(Ljava/lang/String;)V
    .locals 2
    .param p1, "k"    # Ljava/lang/String;

    .prologue
    .line 685
    const/16 v0, 0x12

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v1, p1}, Lorg/mozilla/classfile/ConstantPool;->addConstant(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    .line 686
    return-void
.end method

.method public addLoadThis()V
    .locals 1

    .prologue
    .line 1091
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 1092
    return-void
.end method

.method public addPush(D)V
    .locals 7
    .param p1, "k"    # D

    .prologue
    const/16 v6, 0x77

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    const-wide/16 v2, 0x0

    .line 916
    cmpl-double v0, p1, v2

    if-nez v0, :cond_1

    .line 918
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 919
    div-double v0, v4, p1

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    .line 921
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 931
    :cond_0
    :goto_0
    return-void

    .line 923
    :cond_1
    cmpl-double v0, p1, v4

    if-eqz v0, :cond_2

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    cmpl-double v0, p1, v0

    if-nez v0, :cond_3

    .line 924
    :cond_2
    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 925
    cmpg-double v0, p1, v2

    if-gez v0, :cond_0

    .line 926
    invoke-virtual {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 929
    :cond_3
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(D)V

    goto :goto_0
.end method

.method public addPush(I)V
    .locals 2
    .param p1, "k"    # I

    .prologue
    .line 873
    int-to-byte v0, p1

    if-ne v0, p1, :cond_2

    .line 874
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 875
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 886
    :goto_0
    return-void

    .line 876
    :cond_0
    if-ltz p1, :cond_1

    const/4 v0, 0x5

    if-gt p1, v0, :cond_1

    .line 877
    add-int/lit8 v0, p1, 0x3

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 879
    :cond_1
    const/16 v0, 0x10

    int-to-byte v1, p1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 881
    :cond_2
    int-to-short v0, p1

    if-ne v0, p1, :cond_3

    .line 882
    const/16 v0, 0x11

    int-to-short v1, p1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 884
    :cond_3
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(I)V

    goto :goto_0
.end method

.method public addPush(J)V
    .locals 5
    .param p1, "k"    # J

    .prologue
    .line 900
    long-to-int v0, p1

    .line 901
    .local v0, "ik":I
    int-to-long v2, v0

    cmp-long v1, v2, p1

    if-nez v1, :cond_0

    .line 902
    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 903
    const/16 v1, 0x85

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 907
    :goto_0
    return-void

    .line 905
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(J)V

    goto :goto_0
.end method

.method public addPush(Ljava/lang/String;)V
    .locals 11
    .param p1, "k"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0xb6

    const/16 v9, 0x59

    .line 940
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 941
    .local v2, "length":I
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    const/4 v6, 0x0

    invoke-virtual {v5, p1, v6, v2}, Lorg/mozilla/classfile/ConstantPool;->getUtfEncodingLimit(Ljava/lang/String;II)I

    move-result v3

    .line 942
    .local v3, "limit":I
    if-ne v3, v2, :cond_0

    .line 943
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(Ljava/lang/String;)V

    .line 973
    :goto_0
    return-void

    .line 952
    :cond_0
    const-string v0, "java/lang/StringBuilder"

    .line 953
    .local v0, "SB":Ljava/lang/String;
    const/16 v5, 0xbb

    const-string v6, "java/lang/StringBuilder"

    invoke-virtual {p0, v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 954
    invoke-virtual {p0, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 955
    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ClassFileWriter;->addPush(I)V

    .line 956
    const/16 v5, 0xb7

    const-string v6, "java/lang/StringBuilder"

    const-string v7, "<init>"

    const-string v8, "(I)V"

    invoke-virtual {p0, v5, v6, v7, v8}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 957
    const/4 v1, 0x0

    .line 959
    .local v1, "cursor":I
    :goto_1
    invoke-virtual {p0, v9}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 960
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 961
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ClassFileWriter;->addLoadConstant(Ljava/lang/String;)V

    .line 962
    const-string v5, "java/lang/StringBuilder"

    const-string v6, "append"

    const-string v7, "(Ljava/lang/String;)Ljava/lang/StringBuilder;"

    invoke-virtual {p0, v10, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 964
    const/16 v5, 0x57

    invoke-virtual {p0, v5}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 965
    if-ne v3, v2, :cond_1

    .line 971
    const-string v5, "java/lang/StringBuilder"

    const-string v6, "toString"

    const-string v7, "()Ljava/lang/String;"

    invoke-virtual {p0, v10, v5, v6, v7}, Lorg/mozilla/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 968
    :cond_1
    move v1, v3

    .line 969
    iget-object v5, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v5, p1, v3, v2}, Lorg/mozilla/classfile/ConstantPool;->getUtfEncodingLimit(Ljava/lang/String;II)I

    move-result v3

    .line 970
    goto :goto_1
.end method

.method public addPush(Z)V
    .locals 1
    .param p1, "k"    # Z

    .prologue
    .line 890
    if-eqz p1, :cond_0

    const/4 v0, 0x4

    :goto_0
    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->add(I)V

    .line 891
    return-void

    .line 890
    :cond_0
    const/4 v0, 0x3

    goto :goto_0
.end method

.method public addTableSwitch(II)I
    .locals 9
    .param p1, "low"    # I
    .param p2, "high"    # I

    .prologue
    .line 1120
    if-le p1, p2, :cond_0

    .line 1121
    new-instance v6, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Bad bounds: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1123
    :cond_0
    iget-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    const/16 v7, 0xaa

    invoke-static {v7}, Lorg/mozilla/classfile/ClassFileWriter;->stackChange(I)I

    move-result v7

    add-int v3, v6, v7

    .line 1124
    .local v3, "newStack":I
    if-ltz v3, :cond_1

    const/16 v6, 0x7fff

    if-ge v6, v3, :cond_2

    :cond_1
    invoke-static {v3}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 1126
    :cond_2
    sub-int v6, p2, p1

    add-int/lit8 v2, v6, 0x1

    .line 1127
    .local v2, "entryCount":I
    iget v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    xor-int/lit8 v6, v6, -0x1

    and-int/lit8 v4, v6, 0x3

    .line 1129
    .local v4, "padSize":I
    add-int/lit8 v6, v4, 0x1

    add-int/lit8 v7, v2, 0x3

    mul-int/lit8 v7, v7, 0x4

    add-int/2addr v6, v7

    invoke-direct {p0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addReservedCodeSpace(I)I

    move-result v0

    .line 1130
    .local v0, "N":I
    move v5, v0

    .line 1131
    .local v5, "switchStart":I
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "N":I
    .local v1, "N":I
    const/16 v7, -0x56

    aput-byte v7, v6, v0

    .line 1132
    :goto_0
    if-eqz v4, :cond_3

    .line 1133
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "N":I
    .restart local v0    # "N":I
    const/4 v7, 0x0

    aput-byte v7, v6, v1

    .line 1134
    add-int/lit8 v4, v4, -0x1

    move v1, v0

    .end local v0    # "N":I
    .restart local v1    # "N":I
    goto :goto_0

    .line 1136
    :cond_3
    add-int/lit8 v0, v1, 0x4

    .line 1137
    .end local v1    # "N":I
    .restart local v0    # "N":I
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {p1, v6, v0}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v0

    .line 1138
    iget-object v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {p2, v6, v0}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    .line 1140
    int-to-short v6, v3

    iput-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 1141
    iget-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v3, v6, :cond_4

    int-to-short v6, v3

    iput-short v6, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 1147
    :cond_4
    return v5
.end method

.method public addVariableDescriptor(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "startPC"    # I
    .param p4, "register"    # I

    .prologue
    .line 239
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 240
    .local v2, "nameIndex":I
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v3, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 241
    .local v1, "descriptorIndex":I
    const/4 v3, 0x4

    new-array v0, v3, [I

    const/4 v3, 0x0

    aput v2, v0, v3

    const/4 v3, 0x1

    aput v1, v0, v3

    const/4 v3, 0x2

    aput p3, v0, v3

    const/4 v3, 0x3

    aput p4, v0, v3

    .line 242
    .local v0, "chunk":[I
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    if-nez v3, :cond_0

    .line 243
    new-instance v3, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v3}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    .line 245
    :cond_0
    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 246
    return-void
.end method

.method public adjustStackTop(I)V
    .locals 2
    .param p1, "delta"    # I

    .prologue
    .line 1335
    iget-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    add-int v0, v1, p1

    .line 1336
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    :cond_0
    invoke-static {v0}, Lorg/mozilla/classfile/ClassFileWriter;->badStack(I)V

    .line 1337
    :cond_1
    int-to-short v1, v0

    iput-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 1338
    iget-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_2

    int-to-short v1, v0

    iput-short v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 1343
    :cond_2
    return-void
.end method

.method final getCharBuffer(I)[C
    .locals 2
    .param p1, "minimalSize"    # I

    .prologue
    .line 4098
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->tmpCharBuffer:[C

    array-length v1, v1

    if-le p1, v1, :cond_1

    .line 4099
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->tmpCharBuffer:[C

    array-length v1, v1

    mul-int/lit8 v0, v1, 0x2

    .line 4100
    .local v0, "newSize":I
    if-le p1, v0, :cond_0

    move v0, p1

    .line 4101
    :cond_0
    new-array v1, v0, [C

    iput-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->tmpCharBuffer:[C

    .line 4103
    .end local v0    # "newSize":I
    :cond_1
    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->tmpCharBuffer:[C

    return-object v1
.end method

.method public final getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->generatedClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentCodeOffset()I
    .locals 1

    .prologue
    .line 1323
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    return v0
.end method

.method public getLabelPC(I)I
    .locals 2
    .param p1, "label"    # I

    .prologue
    .line 1262
    if-ltz p1, :cond_0

    .line 1263
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label, no biscuit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1264
    :cond_0
    const v0, 0x7fffffff

    and-int/2addr p1, v0

    .line 1265
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTableTop:I

    if-lt p1, v0, :cond_1

    .line 1266
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1267
    :cond_1
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    aget v0, v0, p1

    return v0
.end method

.method public getStackTop()S
    .locals 1

    .prologue
    .line 1327
    iget-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    return v0
.end method

.method public isUnderStringSizeLimit(Ljava/lang/String;)Z
    .locals 1
    .param p1, "k"    # Ljava/lang/String;

    .prologue
    .line 983
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lorg/mozilla/classfile/ConstantPool;->isUnderUtfEncodingLimit(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public markHandler(I)V
    .locals 1
    .param p1, "theLabel"    # I

    .prologue
    .line 1256
    const/4 v0, 0x1

    iput-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 1257
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 1258
    return-void
.end method

.method public markLabel(I)V
    .locals 2
    .param p1, "label"    # I

    .prologue
    .line 1235
    if-ltz p1, :cond_0

    .line 1236
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label, no biscuit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1238
    :cond_0
    const v0, 0x7fffffff

    and-int/2addr p1, v0

    .line 1239
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTableTop:I

    if-le p1, v0, :cond_1

    .line 1240
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1242
    :cond_1
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    aget v0, v0, p1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1243
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only mark label once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1246
    :cond_2
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTable:[I

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    aput v1, v0, p1

    .line 1247
    return-void
.end method

.method public markLabel(IS)V
    .locals 0
    .param p1, "label"    # I
    .param p2, "stackTop"    # S

    .prologue
    .line 1251
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ClassFileWriter;->markLabel(I)V

    .line 1252
    iput-short p2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 1253
    return-void
.end method

.method public final markTableSwitchCase(II)V
    .locals 2
    .param p1, "switchStart"    # I
    .param p2, "caseIndex"    # I

    .prologue
    .line 1159
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1160
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {v0, v1, p1}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 1161
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {p0, p1, p2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->setTableSwitchJump(III)V

    .line 1162
    return-void
.end method

.method public final markTableSwitchCase(III)V
    .locals 3
    .param p1, "switchStart"    # I
    .param p2, "caseIndex"    # I
    .param p3, "stackTop"    # I

    .prologue
    .line 1167
    if-ltz p3, :cond_0

    iget-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    if-le p3, v0, :cond_1

    .line 1168
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad stack index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1169
    :cond_1
    int-to-short v0, p3

    iput-short v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 1170
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1171
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {v0, v1, p1}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 1172
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {p0, p1, p2, v0}, Lorg/mozilla/classfile/ClassFileWriter;->setTableSwitchJump(III)V

    .line 1173
    return-void
.end method

.method public final markTableSwitchDefault(I)V
    .locals 2
    .param p1, "switchStart"    # I

    .prologue
    .line 1152
    iget v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1153
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {v0, v1, p1}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 1154
    const/4 v0, -0x1

    iget v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {p0, p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->setTableSwitchJump(III)V

    .line 1155
    return-void
.end method

.method public setFlags(S)V
    .locals 0
    .param p1, "flags"    # S

    .prologue
    .line 114
    iput-short p1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFlags:S

    .line 115
    return-void
.end method

.method public setStackTop(S)V
    .locals 0
    .param p1, "n"    # S

    .prologue
    .line 1331
    iput-short p1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 1332
    return-void
.end method

.method public setTableSwitchJump(III)V
    .locals 5
    .param p1, "switchStart"    # I
    .param p2, "caseIndex"    # I
    .param p3, "jumpTarget"    # I

    .prologue
    .line 1182
    if-ltz p3, :cond_0

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    if-le p3, v2, :cond_1

    .line 1183
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad jump target: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1184
    :cond_1
    const/4 v2, -0x1

    if-ge p2, v2, :cond_2

    .line 1185
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad case index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1187
    :cond_2
    xor-int/lit8 v2, p1, -0x1

    and-int/lit8 v1, v2, 0x3

    .line 1189
    .local v1, "padSize":I
    if-gez p2, :cond_4

    .line 1191
    add-int/lit8 v2, p1, 0x1

    add-int v0, v2, v1

    .line 1195
    .local v0, "caseOffset":I
    :goto_0
    if-ltz p1, :cond_3

    iget v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    add-int/lit8 v2, v2, -0x10

    sub-int/2addr v2, v1

    add-int/lit8 v2, v2, -0x1

    if-le p1, v2, :cond_5

    .line 1198
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is outside a possible range of tableswitch"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " in already generated code"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1193
    .end local v0    # "caseOffset":I
    :cond_4
    add-int/lit8 v2, p1, 0x1

    add-int/2addr v2, v1

    add-int/lit8 v3, p2, 0x3

    mul-int/lit8 v3, v3, 0x4

    add-int v0, v2, v3

    .restart local v0    # "caseOffset":I
    goto :goto_0

    .line 1202
    :cond_5
    iget-object v2, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    aget-byte v2, v2, p1

    and-int/lit16 v2, v2, 0xff

    const/16 v3, 0xaa

    if-eq v2, v3, :cond_6

    .line 1203
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not offset of tableswitch statement"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1206
    :cond_6
    if-ltz v0, :cond_7

    add-int/lit8 v2, v0, 0x4

    iget v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    if-le v2, v3, :cond_8

    .line 1209
    :cond_7
    new-instance v2, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Too big case index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1213
    :cond_8
    sub-int v2, p3, p1

    iget-object v3, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {v2, v3, v0}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    .line 1214
    return-void
.end method

.method public startMethod(Ljava/lang/String;Ljava/lang/String;S)V
    .locals 6
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S

    .prologue
    .line 260
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 261
    .local v2, "methodNameIndex":S
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v0, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v4

    .line 262
    .local v4, "typeIndex":S
    new-instance v0, Lorg/mozilla/classfile/ClassFileMethod;

    move-object v1, p1

    move-object v3, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/classfile/ClassFileMethod;-><init>(Ljava/lang/String;SLjava/lang/String;SS)V

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    .line 264
    new-instance v0, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/UintMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    .line 265
    iget-object v0, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    iget-object v1, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 266
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/mozilla/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 267
    return-void
.end method

.method public stopMethod(S)V
    .locals 33
    .param p1, "maxLocals"    # S

    .prologue
    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    move-object/from16 v30, v0

    if-nez v30, :cond_0

    .line 280
    new-instance v30, Ljava/lang/IllegalStateException;

    const-string v31, "No method to stop"

    invoke-direct/range {v30 .. v31}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 282
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter;->fixLabelGotos()V

    .line 284
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxLocals:S

    .line 286
    const/16 v20, 0x0

    .line 287
    .local v20, "stackMap":Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;
    sget-boolean v30, Lorg/mozilla/classfile/ClassFileWriter;->GenerateStackMap:Z

    if-eqz v30, :cond_1

    .line 288
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/classfile/ClassFileWriter;->finalizeSuperBlockStarts()V

    .line 289
    new-instance v20, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;

    .end local v20    # "stackMap":Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;-><init>(Lorg/mozilla/classfile/ClassFileWriter;)V

    .line 290
    .restart local v20    # "stackMap":Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;
    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->generate()V

    .line 293
    :cond_1
    const/16 v17, 0x0

    .line 294
    .local v17, "lineNumberTableLength":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    move-object/from16 v30, v0

    if-eqz v30, :cond_2

    .line 298
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    move/from16 v30, v0

    mul-int/lit8 v30, v30, 0x4

    add-int/lit8 v17, v30, 0x8

    .line 301
    :cond_2
    const/16 v29, 0x0

    .line 302
    .local v29, "variableTableLength":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v30, v0

    if-eqz v30, :cond_3

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v30

    mul-int/lit8 v30, v30, 0xa

    add-int/lit8 v29, v30, 0x8

    .line 309
    :cond_3
    const/16 v22, 0x0

    .line 310
    .local v22, "stackMapTableLength":I
    if-eqz v20, :cond_4

    .line 311
    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->computeWriteSize()I

    move-result v23

    .line 312
    .local v23, "stackMapWriteSize":I
    if-lez v23, :cond_4

    .line 313
    add-int/lit8 v22, v23, 0x6

    .line 317
    .end local v23    # "stackMapWriteSize":I
    :cond_4
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    move/from16 v30, v0

    add-int/lit8 v30, v30, 0xe

    add-int/lit8 v30, v30, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    move/from16 v31, v0

    mul-int/lit8 v31, v31, 0x8

    add-int v30, v30, v31

    add-int/lit8 v30, v30, 0x2

    add-int v30, v30, v17

    add-int v30, v30, v29

    add-int v3, v30, v22

    .line 330
    .local v3, "attrLength":I
    const/high16 v30, 0x10000

    move/from16 v0, v30

    if-le v3, v0, :cond_5

    .line 334
    new-instance v30, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v31, "generated bytecode for method exceeds 64K limit."

    invoke-direct/range {v30 .. v31}, Lorg/mozilla/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 337
    :cond_5
    new-array v8, v3, [B

    .line 338
    .local v8, "codeAttribute":[B
    const/4 v14, 0x0

    .line 339
    .local v14, "index":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    move-object/from16 v30, v0

    const-string v31, "Code"

    invoke-virtual/range {v30 .. v31}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v7

    .line 340
    .local v7, "codeAttrIndex":I
    invoke-static {v7, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 341
    add-int/lit8 v3, v3, -0x6

    .line 342
    invoke-static {v3, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v14

    .line 343
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    move/from16 v30, v0

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 344
    move-object/from16 v0, p0

    iget-short v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxLocals:S

    move/from16 v30, v0

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 345
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    move/from16 v30, v0

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v14

    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBuffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    move/from16 v32, v0

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-static {v0, v1, v8, v14, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 348
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    move/from16 v30, v0

    add-int v14, v14, v30

    .line 350
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    move/from16 v30, v0

    if-lez v30, :cond_9

    .line 351
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    move/from16 v30, v0

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 352
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v13, v0, :cond_a

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    move-object/from16 v30, v0

    aget-object v11, v30, v13

    .line 354
    .local v11, "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    iget v0, v11, Lorg/mozilla/classfile/ExceptionTableEntry;->itsStartLabel:I

    move/from16 v30, v0

    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v30

    move/from16 v0, v30

    int-to-short v0, v0

    move/from16 v25, v0

    .line 355
    .local v25, "startPC":S
    iget v0, v11, Lorg/mozilla/classfile/ExceptionTableEntry;->itsEndLabel:I

    move/from16 v30, v0

    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v30

    move/from16 v0, v30

    int-to-short v10, v0

    .line 356
    .local v10, "endPC":S
    iget v0, v11, Lorg/mozilla/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    move/from16 v30, v0

    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v30

    move/from16 v0, v30

    int-to-short v12, v0

    .line 357
    .local v12, "handlerPC":S
    iget-short v5, v11, Lorg/mozilla/classfile/ExceptionTableEntry;->itsCatchType:S

    .line 358
    .local v5, "catchType":S
    const/16 v30, -0x1

    move/from16 v0, v25

    move/from16 v1, v30

    if-ne v0, v1, :cond_6

    .line 359
    new-instance v30, Ljava/lang/IllegalStateException;

    const-string v31, "start label not defined"

    invoke-direct/range {v30 .. v31}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 360
    :cond_6
    const/16 v30, -0x1

    move/from16 v0, v30

    if-ne v10, v0, :cond_7

    .line 361
    new-instance v30, Ljava/lang/IllegalStateException;

    const-string v31, "end label not defined"

    invoke-direct/range {v30 .. v31}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 362
    :cond_7
    const/16 v30, -0x1

    move/from16 v0, v30

    if-ne v12, v0, :cond_8

    .line 363
    new-instance v30, Ljava/lang/IllegalStateException;

    const-string v31, "handler label not defined"

    invoke-direct/range {v30 .. v31}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 366
    :cond_8
    move/from16 v0, v25

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 367
    invoke-static {v10, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 368
    invoke-static {v12, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 369
    invoke-static {v5, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 352
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 374
    .end local v5    # "catchType":S
    .end local v10    # "endPC":S
    .end local v11    # "ete":Lorg/mozilla/classfile/ExceptionTableEntry;
    .end local v12    # "handlerPC":S
    .end local v13    # "i":I
    .end local v25    # "startPC":S
    :cond_9
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 377
    :cond_a
    const/4 v4, 0x0

    .line 378
    .local v4, "attributeCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    move-object/from16 v30, v0

    if-eqz v30, :cond_b

    .line 379
    add-int/lit8 v4, v4, 0x1

    .line 380
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v30, v0

    if-eqz v30, :cond_c

    .line 381
    add-int/lit8 v4, v4, 0x1

    .line 382
    :cond_c
    if-lez v22, :cond_d

    .line 383
    add-int/lit8 v4, v4, 0x1

    .line 385
    :cond_d
    invoke-static {v4, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 387
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    move-object/from16 v30, v0

    if-eqz v30, :cond_e

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    move-object/from16 v30, v0

    const-string v31, "LineNumberTable"

    invoke-virtual/range {v30 .. v31}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v16

    .line 390
    .local v16, "lineNumberTableAttrIndex":I
    move/from16 v0, v16

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 391
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    move/from16 v30, v0

    mul-int/lit8 v30, v30, 0x4

    add-int/lit8 v26, v30, 0x2

    .line 392
    .local v26, "tableAttrLength":I
    move/from16 v0, v26

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v14

    .line 393
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    move/from16 v30, v0

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 394
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v13, v0, :cond_e

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTable:[I

    move-object/from16 v30, v0

    aget v30, v30, v13

    move/from16 v0, v30

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v14

    .line 394
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 399
    .end local v13    # "i":I
    .end local v16    # "lineNumberTableAttrIndex":I
    .end local v26    # "tableAttrLength":I
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v30, v0

    if-eqz v30, :cond_f

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    move-object/from16 v30, v0

    const-string v31, "LocalVariableTable"

    invoke-virtual/range {v30 .. v31}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v28

    .line 402
    .local v28, "variableTableAttrIndex":I
    move/from16 v0, v28

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v27

    .line 404
    .local v27, "varCount":I
    mul-int/lit8 v30, v27, 0xa

    add-int/lit8 v26, v30, 0x2

    .line 405
    .restart local v26    # "tableAttrLength":I
    move/from16 v0, v26

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v14

    .line 406
    move/from16 v0, v27

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 407
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_2
    move/from16 v0, v27

    if-ge v13, v0, :cond_f

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, [I

    move-object/from16 v6, v30

    check-cast v6, [I

    .line 409
    .local v6, "chunk":[I
    const/16 v30, 0x0

    aget v18, v6, v30

    .line 410
    .local v18, "nameIndex":I
    const/16 v30, 0x1

    aget v9, v6, v30

    .line 411
    .local v9, "descriptorIndex":I
    const/16 v30, 0x2

    aget v25, v6, v30

    .line 412
    .local v25, "startPC":I
    const/16 v30, 0x3

    aget v19, v6, v30

    .line 413
    .local v19, "register":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    move/from16 v30, v0

    sub-int v15, v30, v25

    .line 415
    .local v15, "length":I
    move/from16 v0, v25

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 416
    invoke-static {v15, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 417
    move/from16 v0, v18

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 418
    invoke-static {v9, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 419
    move/from16 v0, v19

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 407
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 423
    .end local v6    # "chunk":[I
    .end local v9    # "descriptorIndex":I
    .end local v13    # "i":I
    .end local v15    # "length":I
    .end local v18    # "nameIndex":I
    .end local v19    # "register":I
    .end local v25    # "startPC":I
    .end local v26    # "tableAttrLength":I
    .end local v27    # "varCount":I
    .end local v28    # "variableTableAttrIndex":I
    :cond_f
    if-lez v22, :cond_10

    .line 424
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    move-object/from16 v30, v0

    const-string v31, "StackMapTable"

    invoke-virtual/range {v30 .. v31}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v21

    .line 426
    .local v21, "stackMapTableAttrIndex":I
    move/from16 v24, v14

    .line 427
    .local v24, "start":I
    move/from16 v0, v21

    invoke-static {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v14

    .line 428
    move-object/from16 v0, v20

    invoke-virtual {v0, v8, v14}, Lorg/mozilla/classfile/ClassFileWriter$StackMapTable;->write([BI)I

    move-result v14

    .line 431
    .end local v21    # "stackMapTableAttrIndex":I
    .end local v24    # "start":I
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v8}, Lorg/mozilla/classfile/ClassFileMethod;->setCodeAttribute([B)V

    .line 433
    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTable:[Lorg/mozilla/classfile/ExceptionTableEntry;

    .line 434
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsExceptionTableTop:I

    .line 435
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    .line 436
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 437
    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsCurrentMethod:Lorg/mozilla/classfile/ClassFileMethod;

    .line 438
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsMaxStack:S

    .line 439
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-short v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsStackTop:S

    .line 440
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsLabelTableTop:I

    .line 441
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 442
    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsVarDescriptors:Lorg/mozilla/javascript/ObjArray;

    .line 443
    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    .line 444
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 445
    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/classfile/ClassFileWriter;->itsJumpFroms:Lorg/mozilla/javascript/UintMap;

    .line 446
    return-void
.end method

.method public toByteArray()[B
    .locals 10

    .prologue
    .line 2780
    invoke-direct {p0}, Lorg/mozilla/classfile/ClassFileWriter;->getWriteSize()I

    move-result v1

    .line 2781
    .local v1, "dataSize":I
    new-array v0, v1, [B

    .line 2782
    .local v0, "data":[B
    const/4 v6, 0x0

    .line 2784
    .local v6, "offset":I
    const/4 v7, 0x0

    .line 2785
    .local v7, "sourceFileAttributeNameIndex":S
    iget-short v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v8, :cond_0

    .line 2786
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    const-string v9, "SourceFile"

    invoke-virtual {v8, v9}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v7

    .line 2790
    :cond_0
    const v8, -0x35014542    # -8346975.0f

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v6

    .line 2791
    sget v8, Lorg/mozilla/classfile/ClassFileWriter;->MinorVersion:I

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2792
    sget v8, Lorg/mozilla/classfile/ClassFileWriter;->MajorVersion:I

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2793
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsConstantPool:Lorg/mozilla/classfile/ConstantPool;

    invoke-virtual {v8, v0, v6}, Lorg/mozilla/classfile/ConstantPool;->write([BI)I

    move-result v6

    .line 2794
    iget-short v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFlags:S

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2795
    iget-short v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsThisClassIndex:S

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2796
    iget-short v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSuperClassIndex:S

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2797
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsInterfaces:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2798
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsInterfaces:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    if-ge v3, v8, :cond_1

    .line 2799
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsInterfaces:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Short;

    check-cast v8, Ljava/lang/Short;

    invoke-virtual {v8}, Ljava/lang/Short;->shortValue()S

    move-result v4

    .line 2800
    .local v4, "interfaceIndex":I
    invoke-static {v4, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2798
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2802
    .end local v4    # "interfaceIndex":I
    :cond_1
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2803
    const/4 v3, 0x0

    :goto_1
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    if-ge v3, v8, :cond_2

    .line 2804
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsFields:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/classfile/ClassFileField;

    .line 2805
    .local v2, "field":Lorg/mozilla/classfile/ClassFileField;
    invoke-virtual {v2, v0, v6}, Lorg/mozilla/classfile/ClassFileField;->write([BI)I

    move-result v6

    .line 2803
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2807
    .end local v2    # "field":Lorg/mozilla/classfile/ClassFileField;
    :cond_2
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2808
    const/4 v3, 0x0

    :goto_2
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    if-ge v3, v8, :cond_3

    .line 2809
    iget-object v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsMethods:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/mozilla/classfile/ClassFileMethod;

    .line 2810
    .local v5, "method":Lorg/mozilla/classfile/ClassFileMethod;
    invoke-virtual {v5, v0, v6}, Lorg/mozilla/classfile/ClassFileMethod;->write([BI)I

    move-result v6

    .line 2808
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2812
    .end local v5    # "method":Lorg/mozilla/classfile/ClassFileMethod;
    :cond_3
    iget-short v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v8, :cond_4

    .line 2813
    const/4 v8, 0x1

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2814
    invoke-static {v7, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2815
    const/4 v8, 0x2

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v6

    .line 2816
    iget-short v8, p0, Lorg/mozilla/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    .line 2821
    :goto_3
    if-eq v6, v1, :cond_5

    .line 2823
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8}, Ljava/lang/RuntimeException;-><init>()V

    throw v8

    .line 2818
    :cond_4
    const/4 v8, 0x0

    invoke-static {v8, v0, v6}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v6

    goto :goto_3

    .line 2826
    :cond_5
    return-object v0
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "oStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2733
    invoke-virtual {p0}, Lorg/mozilla/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v0

    .line 2734
    .local v0, "array":[B
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 2735
    return-void
.end method
