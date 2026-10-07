.class final Lorg/mozilla/classfile/TypeInfo;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# static fields
.field static final DOUBLE:I = 0x3

.field static final FLOAT:I = 0x2

.field static final INTEGER:I = 0x1

.field static final LONG:I = 0x4

.field static final NULL:I = 0x5

.field static final OBJECT_TAG:I = 0x7

.field static final TOP:I = 0x0

.field static final UNINITIALIZED_THIS:I = 0x6

.field static final UNINITIALIZED_VAR_TAG:I = 0x8


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 4956
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static final OBJECT(I)I
    .locals 1
    .param p0, "constantPoolIndex"    # I

    .prologue
    .line 4969
    const v0, 0xffff

    and-int/2addr v0, p0

    shl-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x7

    return v0
.end method

.method static final OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I
    .locals 1
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 4973
    invoke-virtual {p1, p0}, Lorg/mozilla/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    invoke-static {v0}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(I)I

    move-result v0

    return v0
.end method

.method static final UNINITIALIZED_VARIABLE(I)I
    .locals 1
    .param p0, "bytecodeOffset"    # I

    .prologue
    .line 4977
    const v0, 0xffff

    and-int/2addr v0, p0

    shl-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x8

    return v0
.end method

.method static final fromType(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I
    .locals 2
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    const/4 v0, 0x1

    .line 5005
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 5006
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 5020
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 5014
    :sswitch_0
    const/4 v0, 0x3

    .line 5023
    :goto_0
    :sswitch_1
    return v0

    .line 5016
    :sswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 5018
    :sswitch_3
    const/4 v0, 0x4

    goto :goto_0

    .line 5023
    :cond_0
    invoke-static {p0, p1}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result v0

    goto :goto_0

    .line 5006
    :sswitch_data_0
    .sparse-switch
        0x42 -> :sswitch_1
        0x43 -> :sswitch_1
        0x44 -> :sswitch_0
        0x46 -> :sswitch_2
        0x49 -> :sswitch_1
        0x4a -> :sswitch_3
        0x53 -> :sswitch_1
        0x5a -> :sswitch_1
    .end sparse-switch
.end method

.method static getClassFromInternalName(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "internalName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 5150
    const/16 v1, 0x2f

    const/16 v2, 0x2e

    :try_start_0
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 5151
    :catch_0
    move-exception v0

    .line 5152
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static final getPayload(I)I
    .locals 1
    .param p0, "typeInfo"    # I

    .prologue
    .line 4985
    ushr-int/lit8 v0, p0, 0x8

    return v0
.end method

.method static final getPayloadAsType(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;
    .locals 2
    .param p0, "typeInfo"    # I
    .param p1, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 4995
    invoke-static {p0}, Lorg/mozilla/classfile/TypeInfo;->getTag(I)I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 4996
    invoke-static {p0}, Lorg/mozilla/classfile/TypeInfo;->getPayload(I)I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 4998
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "expecting object type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static final getTag(I)I
    .locals 1
    .param p0, "typeInfo"    # I

    .prologue
    .line 4981
    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method static isTwoWords(I)Z
    .locals 1
    .param p0, "type"    # I

    .prologue
    .line 5027
    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 v0, 0x4

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static merge(IILorg/mozilla/classfile/ConstantPool;)I
    .locals 17
    .param p0, "current"    # I
    .param p1, "incoming"    # I
    .param p2, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 5049
    invoke-static/range {p0 .. p0}, Lorg/mozilla/classfile/TypeInfo;->getTag(I)I

    move-result v6

    .line 5050
    .local v6, "currentTag":I
    invoke-static/range {p1 .. p1}, Lorg/mozilla/classfile/TypeInfo;->getTag(I)I

    move-result v12

    .line 5051
    .local v12, "incomingTag":I
    const/4 v14, 0x7

    if-ne v6, v14, :cond_2

    const/4 v4, 0x1

    .line 5052
    .local v4, "currentIsObject":Z
    :goto_0
    const/4 v14, 0x7

    if-ne v12, v14, :cond_3

    const/4 v10, 0x1

    .line 5054
    .local v10, "incomingIsObject":Z
    :goto_1
    move/from16 v0, p0

    move/from16 v1, p1

    if-eq v0, v1, :cond_0

    if-eqz v4, :cond_4

    const/4 v14, 0x5

    move/from16 v0, p1

    if-ne v0, v14, :cond_4

    :cond_0
    move/from16 p1, p0

    .line 5102
    .end local p1    # "incoming":I
    :cond_1
    :goto_2
    return p1

    .line 5051
    .end local v4    # "currentIsObject":Z
    .end local v10    # "incomingIsObject":Z
    .restart local p1    # "incoming":I
    :cond_2
    const/4 v4, 0x0

    goto :goto_0

    .line 5052
    .restart local v4    # "currentIsObject":Z
    :cond_3
    const/4 v10, 0x0

    goto :goto_1

    .line 5056
    .restart local v10    # "incomingIsObject":Z
    :cond_4
    if-eqz v6, :cond_5

    if-nez v12, :cond_6

    .line 5058
    :cond_5
    const/16 p1, 0x0

    goto :goto_2

    .line 5059
    :cond_6
    const/4 v14, 0x5

    move/from16 v0, p0

    if-ne v0, v14, :cond_7

    if-nez v10, :cond_1

    .line 5061
    :cond_7
    if-eqz v4, :cond_e

    if-eqz v10, :cond_e

    .line 5062
    move/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/classfile/TypeInfo;->getPayloadAsType(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v5

    .line 5063
    .local v5, "currentName":Ljava/lang/String;
    invoke-static/range {p1 .. p2}, Lorg/mozilla/classfile/TypeInfo;->getPayloadAsType(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v11

    .line 5067
    .local v11, "incomingName":Ljava/lang/String;
    const/4 v14, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 5068
    .local v7, "currentlyGeneratedName":Ljava/lang/String;
    const/4 v14, 0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/mozilla/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 5075
    .local v8, "currentlyGeneratedSuperName":Ljava/lang/String;
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 5076
    move-object v5, v8

    .line 5078
    :cond_8
    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 5079
    move-object v11, v8

    .line 5082
    :cond_9
    invoke-static {v5}, Lorg/mozilla/classfile/TypeInfo;->getClassFromInternalName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 5083
    .local v3, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v11}, Lorg/mozilla/classfile/TypeInfo;->getClassFromInternalName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 5085
    .local v9, "incomingClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_a

    move/from16 p1, p0

    .line 5086
    goto :goto_2

    .line 5087
    :cond_a
    invoke-virtual {v9, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 5089
    invoke-virtual {v9}, Ljava/lang/Class;->isInterface()Z

    move-result v14

    if-nez v14, :cond_b

    invoke-virtual {v3}, Ljava/lang/Class;->isInterface()Z

    move-result v14

    if-eqz v14, :cond_c

    .line 5095
    :cond_b
    const-string v14, "java/lang/Object"

    move-object/from16 v0, p2

    invoke-static {v14, v0}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result p1

    goto :goto_2

    .line 5097
    :cond_c
    invoke-virtual {v9}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 5098
    .local v2, "commonClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_3
    if-eqz v2, :cond_e

    .line 5099
    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_d

    .line 5100
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    .line 5101
    .local v13, "name":Ljava/lang/String;
    invoke-static {v13}, Lorg/mozilla/classfile/ClassFileWriter;->getSlashedForm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 5102
    move-object/from16 v0, p2

    invoke-static {v13, v0}, Lorg/mozilla/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lorg/mozilla/classfile/ConstantPool;)I

    move-result p1

    goto/16 :goto_2

    .line 5104
    .end local v13    # "name":Ljava/lang/String;
    :cond_d
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_3

    .line 5108
    .end local v2    # "commonClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "currentName":Ljava/lang/String;
    .end local v7    # "currentlyGeneratedName":Ljava/lang/String;
    .end local v8    # "currentlyGeneratedSuperName":Ljava/lang/String;
    .end local v9    # "incomingClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "incomingName":Ljava/lang/String;
    :cond_e
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "bad merge attempt between "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/classfile/TypeInfo;->toString(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " and "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static/range {p1 .. p2}, Lorg/mozilla/classfile/TypeInfo;->toString(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14
.end method

.method static print([II[IILorg/mozilla/classfile/ConstantPool;)V
    .locals 2
    .param p0, "locals"    # [I
    .param p1, "localsTop"    # I
    .param p2, "stack"    # [I
    .param p3, "stackTop"    # I
    .param p4, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 5179
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "locals: "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 5180
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0, p1, p4}, Lorg/mozilla/classfile/TypeInfo;->toString([IILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 5181
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "stack: "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 5182
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p2, p3, p4}, Lorg/mozilla/classfile/TypeInfo;->toString([IILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 5183
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 5184
    return-void
.end method

.method static print([I[ILorg/mozilla/classfile/ConstantPool;)V
    .locals 2
    .param p0, "locals"    # [I
    .param p1, "stack"    # [I
    .param p2, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 5174
    array-length v0, p0

    array-length v1, p1

    invoke-static {p0, v0, p1, v1, p2}, Lorg/mozilla/classfile/TypeInfo;->print([II[IILorg/mozilla/classfile/ConstantPool;)V

    .line 5175
    return-void
.end method

.method static toString(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;
    .locals 3
    .param p0, "type"    # I
    .param p1, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 5114
    invoke-static {p0}, Lorg/mozilla/classfile/TypeInfo;->getTag(I)I

    move-result v0

    .line 5115
    .local v0, "tag":I
    packed-switch v0, :pswitch_data_0

    .line 5131
    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 5132
    invoke-static {p0, p1}, Lorg/mozilla/classfile/TypeInfo;->getPayloadAsType(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v1

    .line 5134
    :goto_0
    return-object v1

    .line 5117
    :pswitch_0
    const-string v1, "top"

    goto :goto_0

    .line 5119
    :pswitch_1
    const-string v1, "int"

    goto :goto_0

    .line 5121
    :pswitch_2
    const-string v1, "float"

    goto :goto_0

    .line 5123
    :pswitch_3
    const-string v1, "double"

    goto :goto_0

    .line 5125
    :pswitch_4
    const-string v1, "long"

    goto :goto_0

    .line 5127
    :pswitch_5
    const-string v1, "null"

    goto :goto_0

    .line 5129
    :pswitch_6
    const-string v1, "uninitialized_this"

    goto :goto_0

    .line 5133
    :cond_0
    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 5134
    const-string v1, "uninitialized"

    goto :goto_0

    .line 5136
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bad type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 5115
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method static toString([IILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;
    .locals 3
    .param p0, "types"    # [I
    .param p1, "typesTop"    # I
    .param p2, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 5161
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 5162
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5163
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_1

    .line 5164
    if-lez v0, :cond_0

    .line 5165
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5167
    :cond_0
    aget v2, p0, v0

    invoke-static {v2, p2}, Lorg/mozilla/classfile/TypeInfo;->toString(ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5163
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 5169
    :cond_1
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5170
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static toString([ILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;
    .locals 1
    .param p0, "types"    # [I
    .param p1, "pool"    # Lorg/mozilla/classfile/ConstantPool;

    .prologue
    .line 5157
    array-length v0, p0

    invoke-static {p0, v0, p1}, Lorg/mozilla/classfile/TypeInfo;->toString([IILorg/mozilla/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
