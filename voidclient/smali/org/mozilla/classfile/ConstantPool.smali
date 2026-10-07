.class final Lorg/mozilla/classfile/ConstantPool;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# static fields
.field static final CONSTANT_Class:B = 0x7t

.field static final CONSTANT_Double:B = 0x6t

.field static final CONSTANT_Fieldref:B = 0x9t

.field static final CONSTANT_Float:B = 0x4t

.field static final CONSTANT_Integer:B = 0x3t

.field static final CONSTANT_InterfaceMethodref:B = 0xbt

.field static final CONSTANT_Long:B = 0x5t

.field static final CONSTANT_Methodref:B = 0xat

.field static final CONSTANT_NameAndType:B = 0xct

.field static final CONSTANT_String:B = 0x8t

.field static final CONSTANT_Utf8:B = 0x1t

.field private static final ConstantPoolSize:I = 0x100

.field private static final MAX_UTF_ENCODING_SIZE:I = 0xffff


# instance fields
.field private cfw:Lorg/mozilla/classfile/ClassFileWriter;

.field private itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

.field private itsConstantData:Lorg/mozilla/javascript/UintMap;

.field private itsFieldRefHash:Lorg/mozilla/javascript/ObjToIntMap;

.field private itsMethodRefHash:Lorg/mozilla/javascript/ObjToIntMap;

.field private itsPool:[B

.field private itsPoolTypes:Lorg/mozilla/javascript/UintMap;

.field private itsStringConstHash:Lorg/mozilla/javascript/UintMap;

.field private itsTop:I

.field private itsTopIndex:I

.field private itsUtf8Hash:Lorg/mozilla/javascript/ObjToIntMap;


# direct methods
.method constructor <init>(Lorg/mozilla/classfile/ClassFileWriter;)V
    .locals 1
    .param p1, "cfw"    # Lorg/mozilla/classfile/ClassFileWriter;

    .prologue
    .line 4410
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4727
    new-instance v0, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/UintMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsStringConstHash:Lorg/mozilla/javascript/UintMap;

    .line 4728
    new-instance v0, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsUtf8Hash:Lorg/mozilla/javascript/ObjToIntMap;

    .line 4729
    new-instance v0, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsFieldRefHash:Lorg/mozilla/javascript/ObjToIntMap;

    .line 4730
    new-instance v0, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsMethodRefHash:Lorg/mozilla/javascript/ObjToIntMap;

    .line 4731
    new-instance v0, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

    .line 4735
    new-instance v0, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/UintMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsConstantData:Lorg/mozilla/javascript/UintMap;

    .line 4736
    new-instance v0, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v0}, Lorg/mozilla/javascript/UintMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    .line 4411
    iput-object p1, p0, Lorg/mozilla/classfile/ConstantPool;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    .line 4412
    const/4 v0, 0x1

    iput v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4413
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    .line 4414
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4415
    return-void
.end method

.method private addNameAndType(Ljava/lang/String;Ljava/lang/String;)S
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0xc

    .line 4597
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 4598
    .local v0, "nameIndex":S
    invoke-virtual {p0, p2}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 4599
    .local v1, "typeIndex":S
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4600
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v5, v2, v3

    .line 4601
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4602
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4603
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v2, v3, v5}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4604
    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v2, v2

    return v2
.end method


# virtual methods
.method addClass(Ljava/lang/String;)S
    .locals 7
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x7

    const/4 v4, -0x1

    .line 4609
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v3, p1, v4}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v1

    .line 4610
    .local v1, "theIndex":I
    if-ne v1, v4, :cond_1

    .line 4611
    move-object v0, p1

    .line 4612
    .local v0, "slashed":Ljava/lang/String;
    const/16 v3, 0x2e

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-lez v3, :cond_0

    .line 4613
    invoke-static {p1}, Lorg/mozilla/classfile/ClassFileWriter;->getSlashedForm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4614
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v3, v0, v4}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v1

    .line 4615
    if-eq v1, v4, :cond_0

    .line 4616
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v3, p1, v1}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 4619
    :cond_0
    if-ne v1, v4, :cond_1

    .line 4620
    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 4621
    .local v2, "utf8Index":I
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4622
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v6, v3, v4

    .line 4623
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v2, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4624
    iget v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .end local v1    # "theIndex":I
    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4625
    .restart local v1    # "theIndex":I
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v3, v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 4626
    if-eq p1, v0, :cond_1

    .line 4627
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsClassHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v3, p1, v1}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 4631
    .end local v0    # "slashed":Ljava/lang/String;
    .end local v2    # "utf8Index":I
    :cond_1
    invoke-virtual {p0, v1, p1}, Lorg/mozilla/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 4632
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v3, v1, v6}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4633
    int-to-short v3, v1

    return v3
.end method

.method addConstant(D)I
    .locals 7
    .param p1, "k"    # D

    .prologue
    const/4 v6, 0x6

    .line 4476
    const/16 v3, 0x9

    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4477
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v6, v3, v4

    .line 4478
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 4479
    .local v0, "bits":J
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v1, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->putInt64(J[BI)I

    move-result v3

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4480
    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4481
    .local v2, "index":I
    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v3, v3, 0x2

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4482
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v3, v2, v6}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4483
    return v2
.end method

.method addConstant(F)I
    .locals 5
    .param p1, "k"    # F

    .prologue
    const/4 v4, 0x4

    .line 4466
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4467
    iget-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v4, v1, v2

    .line 4468
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    .line 4469
    .local v0, "bits":I
    iget-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v1

    iput v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4470
    iget-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v1, v2, v4}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4471
    iget v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    return v1
.end method

.method addConstant(I)I
    .locals 4
    .param p1, "k"    # I

    .prologue
    const/4 v3, 0x3

    .line 4446
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4447
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v3, v0, v1

    .line 4448
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {p1, v0, v1}, Lorg/mozilla/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v0

    iput v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4449
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    iget v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v0, v1, v3}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4450
    iget v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v0, v0

    return v0
.end method

.method addConstant(J)I
    .locals 5
    .param p1, "k"    # J

    .prologue
    const/4 v4, 0x5

    .line 4455
    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4456
    iget-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v4, v1, v2

    .line 4457
    iget-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {p1, p2, v1, v2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt64(J[BI)I

    move-result v1

    iput v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4458
    iget v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4459
    .local v0, "index":I
    iget v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4460
    iget-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v1, v0, v4}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4461
    return v0
.end method

.method addConstant(Ljava/lang/String;)I
    .locals 6
    .param p1, "k"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x8

    const/4 v4, -0x1

    .line 4488
    const v2, 0xffff

    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    and-int v1, v2, v3

    .line 4489
    .local v1, "utf8Index":I
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsStringConstHash:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v2, v1, v4}, Lorg/mozilla/javascript/UintMap;->getInt(II)I

    move-result v0

    .line 4490
    .local v0, "theIndex":I
    if-ne v0, v4, :cond_0

    .line 4491
    iget v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .end local v0    # "theIndex":I
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4492
    .restart local v0    # "theIndex":I
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4493
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v5, v2, v3

    .line 4494
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v1, v2, v3}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4495
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsStringConstHash:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v2, v1, v0}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4497
    :cond_0
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v2, v0, v5}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4498
    return v0
.end method

.method addFieldRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 8
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "fieldType"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x9

    const/4 v5, -0x1

    .line 4638
    new-instance v2, Lorg/mozilla/classfile/FieldOrMethodRef;

    invoke-direct {v2, p1, p2, p3}, Lorg/mozilla/classfile/FieldOrMethodRef;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4641
    .local v2, "ref":Lorg/mozilla/classfile/FieldOrMethodRef;
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsFieldRefHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v4, v2, v5}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v3

    .line 4642
    .local v3, "theIndex":I
    if-ne v3, v5, :cond_0

    .line 4643
    invoke-direct {p0, p2, p3}, Lorg/mozilla/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .line 4644
    .local v1, "ntIndex":S
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    .line 4645
    .local v0, "classIndex":S
    const/4 v4, 0x5

    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4646
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v7, v4, v5

    .line 4647
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4648
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v1, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4649
    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .end local v3    # "theIndex":I
    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4650
    .restart local v3    # "theIndex":I
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsFieldRefHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v4, v2, v3}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 4652
    .end local v0    # "classIndex":S
    .end local v1    # "ntIndex":S
    :cond_0
    invoke-virtual {p0, v3, v2}, Lorg/mozilla/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 4653
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v4, v3, v7}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4654
    int-to-short v4, v3

    return v4
.end method

.method addInterfaceMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 7
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "methodType"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0xb

    .line 4682
    invoke-direct {p0, p2, p3}, Lorg/mozilla/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .line 4683
    .local v1, "ntIndex":S
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    .line 4684
    .local v0, "classIndex":S
    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4685
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v6, v3, v4

    .line 4686
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4687
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v1, v3, v4}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    iput v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4688
    new-instance v2, Lorg/mozilla/classfile/FieldOrMethodRef;

    invoke-direct {v2, p1, p2, p3}, Lorg/mozilla/classfile/FieldOrMethodRef;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4690
    .local v2, "r":Lorg/mozilla/classfile/FieldOrMethodRef;
    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {p0, v3, v2}, Lorg/mozilla/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 4691
    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v3, v4, v6}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4692
    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v3, v3

    return v3
.end method

.method addMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 8
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "methodType"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0xa

    const/4 v5, -0x1

    .line 4660
    new-instance v2, Lorg/mozilla/classfile/FieldOrMethodRef;

    invoke-direct {v2, p1, p2, p3}, Lorg/mozilla/classfile/FieldOrMethodRef;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4663
    .local v2, "ref":Lorg/mozilla/classfile/FieldOrMethodRef;
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsMethodRefHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v4, v2, v5}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v3

    .line 4664
    .local v3, "theIndex":I
    if-ne v3, v5, :cond_0

    .line 4665
    invoke-direct {p0, p2, p3}, Lorg/mozilla/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .line 4666
    .local v1, "ntIndex":S
    invoke-virtual {p0, p1}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    .line 4667
    .local v0, "classIndex":S
    const/4 v4, 0x5

    invoke-virtual {p0, v4}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4668
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    aput-byte v7, v4, v5

    .line 4669
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4670
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v1, v4, v5}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4671
    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .end local v3    # "theIndex":I
    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4672
    .restart local v3    # "theIndex":I
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsMethodRefHash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v4, v2, v3}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 4674
    .end local v0    # "classIndex":S
    .end local v1    # "ntIndex":S
    :cond_0
    invoke-virtual {p0, v3, v2}, Lorg/mozilla/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 4675
    iget-object v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v4, v3, v7}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4676
    int-to-short v4, v3

    return v4
.end method

.method addUtf8(Ljava/lang/String;)S
    .locals 14
    .param p1, "k"    # Ljava/lang/String;

    .prologue
    const v13, 0xffff

    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v10, -0x1

    .line 4540
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsUtf8Hash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v9, p1, v10}, Lorg/mozilla/javascript/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v4

    .line 4541
    .local v4, "theIndex":I
    if-ne v4, v10, :cond_5

    .line 4542
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 4544
    .local v3, "strLen":I
    if-le v3, v13, :cond_0

    .line 4545
    const/4 v5, 0x1

    .line 4586
    .local v5, "tooBigString":Z
    :goto_0
    if-eqz v5, :cond_5

    .line 4587
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "Too big string"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 4547
    .end local v5    # "tooBigString":Z
    :cond_0
    const/4 v5, 0x0

    .line 4550
    .restart local v5    # "tooBigString":Z
    mul-int/lit8 v9, v3, 0x3

    add-int/lit8 v9, v9, 0x3

    invoke-virtual {p0, v9}, Lorg/mozilla/classfile/ConstantPool;->ensure(I)V

    .line 4551
    iget v6, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4553
    .local v6, "top":I
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "top":I
    .local v7, "top":I
    aput-byte v12, v9, v6

    .line 4554
    add-int/lit8 v6, v7, 0x2

    .line 4556
    .end local v7    # "top":I
    .restart local v6    # "top":I
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v9, v3}, Lorg/mozilla/classfile/ClassFileWriter;->getCharBuffer(I)[C

    move-result-object v1

    .line 4557
    .local v1, "chars":[C
    invoke-virtual {p1, v11, v3, v1, v11}, Ljava/lang/String;->getChars(II[CI)V

    .line 4559
    const/4 v2, 0x0

    .local v2, "i":I
    move v7, v6

    .end local v6    # "top":I
    .restart local v7    # "top":I
    :goto_1
    if-eq v2, v3, :cond_3

    .line 4560
    aget-char v0, v1, v2

    .line 4561
    .local v0, "c":I
    if-eqz v0, :cond_1

    const/16 v9, 0x7f

    if-gt v0, v9, :cond_1

    .line 4562
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "top":I
    .restart local v6    # "top":I
    int-to-byte v10, v0

    aput-byte v10, v9, v7

    .line 4559
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move v7, v6

    .end local v6    # "top":I
    .restart local v7    # "top":I
    goto :goto_1

    .line 4563
    :cond_1
    const/16 v9, 0x7ff

    if-le v0, v9, :cond_2

    .line 4564
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "top":I
    .restart local v6    # "top":I
    shr-int/lit8 v10, v0, 0xc

    or-int/lit16 v10, v10, 0xe0

    int-to-byte v10, v10

    aput-byte v10, v9, v7

    .line 4565
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "top":I
    .restart local v7    # "top":I
    shr-int/lit8 v10, v0, 0x6

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, v9, v6

    .line 4566
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "top":I
    .restart local v6    # "top":I
    and-int/lit8 v10, v0, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, v9, v7

    goto :goto_2

    .line 4568
    .end local v6    # "top":I
    .restart local v7    # "top":I
    :cond_2
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "top":I
    .restart local v6    # "top":I
    shr-int/lit8 v10, v0, 0x6

    or-int/lit16 v10, v10, 0xc0

    int-to-byte v10, v10

    aput-byte v10, v9, v7

    .line 4569
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "top":I
    .restart local v7    # "top":I
    and-int/lit8 v10, v0, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, v9, v6

    move v6, v7

    .end local v7    # "top":I
    .restart local v6    # "top":I
    goto :goto_2

    .line 4573
    .end local v0    # "c":I
    .end local v6    # "top":I
    .restart local v7    # "top":I
    :cond_3
    iget v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v9, v9, 0x1

    add-int/lit8 v9, v9, 0x2

    sub-int v8, v7, v9

    .line 4574
    .local v8, "utfLen":I
    if-le v8, v13, :cond_4

    .line 4575
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 4578
    :cond_4
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v10, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v10, v10, 0x1

    ushr-int/lit8 v11, v8, 0x8

    int-to-byte v11, v11

    aput-byte v11, v9, v10

    .line 4579
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v10, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v10, v10, 0x2

    int-to-byte v11, v8

    aput-byte v11, v9, v10

    .line 4581
    iput v7, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    .line 4582
    iget v4, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .end local v4    # "theIndex":I
    add-int/lit8 v9, v4, 0x1

    iput v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    .line 4583
    .restart local v4    # "theIndex":I
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsUtf8Hash:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v9, p1, v4}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    goto/16 :goto_0

    .line 4590
    .end local v1    # "chars":[C
    .end local v2    # "i":I
    .end local v3    # "strLen":I
    .end local v5    # "tooBigString":Z
    .end local v7    # "top":I
    .end local v8    # "utfLen":I
    :cond_5
    invoke-virtual {p0, v4, p1}, Lorg/mozilla/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 4591
    iget-object v9, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v9, v4, v12}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 4592
    int-to-short v9, v4

    return v9
.end method

.method ensure(I)V
    .locals 5
    .param p1, "howMuch"    # I

    .prologue
    const/4 v4, 0x0

    .line 4712
    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/2addr v2, p1

    iget-object v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    array-length v3, v3

    if-le v2, v3, :cond_1

    .line 4713
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    array-length v2, v2

    mul-int/lit8 v0, v2, 0x2

    .line 4714
    .local v0, "newCapacity":I
    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/2addr v2, p1

    if-le v2, v0, :cond_0

    .line 4715
    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int v0, v2, p1

    .line 4717
    :cond_0
    new-array v1, v0, [B

    .line 4718
    .local v1, "tmp":[B
    iget-object v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4719
    iput-object v1, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    .line 4721
    .end local v0    # "newCapacity":I
    .end local v1    # "tmp":[B
    :cond_1
    return-void
.end method

.method getConstantData(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 4697
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsConstantData:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/UintMap;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getConstantType(I)B
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 4707
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPoolTypes:Lorg/mozilla/javascript/UintMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/mozilla/javascript/UintMap;->getInt(II)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method getUtfEncodingLimit(Ljava/lang/String;II)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 4518
    sub-int v3, p3, p2

    mul-int/lit8 v3, v3, 0x3

    const v4, 0xffff

    if-gt v3, v4, :cond_1

    .line 4535
    .end local p3    # "end":I
    :cond_0
    :goto_0
    return p3

    .line 4521
    .restart local p3    # "end":I
    :cond_1
    const v2, 0xffff

    .line 4522
    .local v2, "limit":I
    move v1, p2

    .local v1, "i":I
    :goto_1
    if-eq v1, p3, :cond_0

    .line 4523
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 4524
    .local v0, "c":I
    if-eqz v0, :cond_2

    const/16 v3, 0x7f

    if-gt v0, v3, :cond_2

    .line 4525
    add-int/lit8 v2, v2, -0x1

    .line 4531
    :goto_2
    if-gez v2, :cond_4

    move p3, v1

    .line 4532
    goto :goto_0

    .line 4526
    :cond_2
    const/16 v3, 0x7ff

    if-ge v0, v3, :cond_3

    .line 4527
    add-int/lit8 v2, v2, -0x2

    goto :goto_2

    .line 4529
    :cond_3
    add-int/lit8 v2, v2, -0x3

    goto :goto_2

    .line 4522
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method getWriteSize()I
    .locals 1

    .prologue
    .line 4441
    iget v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method isUnderUtfEncodingLimit(Ljava/lang/String;)Z
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const v4, 0xffff

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 4503
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 4504
    .local v0, "strLen":I
    mul-int/lit8 v3, v0, 0x3

    if-gt v3, v4, :cond_1

    .line 4509
    :cond_0
    :goto_0
    return v1

    .line 4506
    :cond_1
    if-le v0, v4, :cond_2

    move v1, v2

    .line 4507
    goto :goto_0

    .line 4509
    :cond_2
    invoke-virtual {p0, p1, v2, v0}, Lorg/mozilla/classfile/ConstantPool;->getUtfEncodingLimit(Ljava/lang/String;II)I

    move-result v3

    if-eq v0, v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method setConstantData(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 4702
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsConstantData:Lorg/mozilla/javascript/UintMap;

    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/UintMap;->put(ILjava/lang/Object;)V

    .line 4703
    return-void
.end method

.method write([BI)I
    .locals 3
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 4433
    iget v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v0, v0

    invoke-static {v0, p1, p2}, Lorg/mozilla/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 4434
    iget-object v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsPool:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4435
    iget v0, p0, Lorg/mozilla/classfile/ConstantPool;->itsTop:I

    add-int/2addr p2, v0

    .line 4436
    return p2
.end method
