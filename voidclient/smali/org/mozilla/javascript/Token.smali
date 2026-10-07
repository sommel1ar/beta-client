.class public Lorg/mozilla/javascript/Token;
.super Ljava/lang/Object;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/Token$CommentType;
    }
.end annotation


# static fields
.field public static final ADD:I = 0x15

.field public static final AND:I = 0x69

.field public static final ARRAYCOMP:I = 0x9d

.field public static final ARRAYLIT:I = 0x41

.field public static final ASSIGN:I = 0x5a

.field public static final ASSIGN_ADD:I = 0x61

.field public static final ASSIGN_BITAND:I = 0x5d

.field public static final ASSIGN_BITOR:I = 0x5b

.field public static final ASSIGN_BITXOR:I = 0x5c

.field public static final ASSIGN_DIV:I = 0x64

.field public static final ASSIGN_LSH:I = 0x5e

.field public static final ASSIGN_MOD:I = 0x65

.field public static final ASSIGN_MUL:I = 0x63

.field public static final ASSIGN_RSH:I = 0x5f

.field public static final ASSIGN_SUB:I = 0x62

.field public static final ASSIGN_URSH:I = 0x60

.field public static final BINDNAME:I = 0x31

.field public static final BITAND:I = 0xb

.field public static final BITNOT:I = 0x1b

.field public static final BITOR:I = 0x9

.field public static final BITXOR:I = 0xa

.field public static final BLOCK:I = 0x81

.field public static final BREAK:I = 0x78

.field public static final CALL:I = 0x26

.field public static final CASE:I = 0x73

.field public static final CATCH:I = 0x7c

.field public static final CATCH_SCOPE:I = 0x39

.field public static final COLON:I = 0x67

.field public static final COLONCOLON:I = 0x90

.field public static final COMMA:I = 0x59

.field public static final COMMENT:I = 0xa1

.field public static final CONST:I = 0x9a

.field public static final CONTINUE:I = 0x79

.field public static final DEBUGGER:I = 0xa0

.field public static final DEC:I = 0x6b

.field public static final DEFAULT:I = 0x74

.field public static final DEFAULTNAMESPACE:I = 0x4a

.field public static final DELPROP:I = 0x1f

.field public static final DEL_REF:I = 0x45

.field public static final DIV:I = 0x18

.field public static final DO:I = 0x76

.field public static final DOT:I = 0x6c

.field public static final DOTDOT:I = 0x8f

.field public static final DOTQUERY:I = 0x92

.field public static final ELSE:I = 0x71

.field public static final EMPTY:I = 0x80

.field public static final ENTERWITH:I = 0x2

.field public static final ENUM_ID:I = 0x3e

.field public static final ENUM_INIT_ARRAY:I = 0x3c

.field public static final ENUM_INIT_KEYS:I = 0x3a

.field public static final ENUM_INIT_VALUES:I = 0x3b

.field public static final ENUM_NEXT:I = 0x3d

.field public static final EOF:I = 0x0

.field public static final EOL:I = 0x1

.field public static final EQ:I = 0xc

.field public static final ERROR:I = -0x1

.field public static final ESCXMLATTR:I = 0x4b

.field public static final ESCXMLTEXT:I = 0x4c

.field public static final EXPORT:I = 0x6e

.field public static final EXPR_RESULT:I = 0x86

.field public static final EXPR_VOID:I = 0x85

.field public static final FALSE:I = 0x2c

.field public static final FINALLY:I = 0x7d

.field public static final FIRST_ASSIGN:I = 0x5a

.field public static final FIRST_BYTECODE_TOKEN:I = 0x2

.field public static final FOR:I = 0x77

.field public static final FUNCTION:I = 0x6d

.field public static final GE:I = 0x11

.field public static final GENEXPR:I = 0xa2

.field public static final GET:I = 0x97

.field public static final GETELEM:I = 0x24

.field public static final GETPROP:I = 0x21

.field public static final GETPROPNOWARN:I = 0x22

.field public static final GETVAR:I = 0x37

.field public static final GET_REF:I = 0x43

.field public static final GOTO:I = 0x5

.field public static final GT:I = 0x10

.field public static final HOOK:I = 0x66

.field public static final IF:I = 0x70

.field public static final IFEQ:I = 0x6

.field public static final IFNE:I = 0x7

.field public static final IMPORT:I = 0x6f

.field public static final IN:I = 0x34

.field public static final INC:I = 0x6a

.field public static final INSTANCEOF:I = 0x35

.field public static final JSR:I = 0x87

.field public static final LABEL:I = 0x82

.field public static final LAST_ASSIGN:I = 0x65

.field public static final LAST_BYTECODE_TOKEN:I = 0x50

.field public static final LAST_TOKEN:I = 0xa4

.field public static final LB:I = 0x53

.field public static final LC:I = 0x55

.field public static final LE:I = 0xf

.field public static final LEAVEWITH:I = 0x3

.field public static final LET:I = 0x99

.field public static final LETEXPR:I = 0x9e

.field public static final LOCAL_BLOCK:I = 0x8d

.field public static final LOCAL_LOAD:I = 0x36

.field public static final LOOP:I = 0x84

.field public static final LP:I = 0x57

.field public static final LSH:I = 0x12

.field public static final LT:I = 0xe

.field public static final METHOD:I = 0xa3

.field public static final MOD:I = 0x19

.field public static final MUL:I = 0x17

.field public static final NAME:I = 0x27

.field public static final NE:I = 0xd

.field public static final NEG:I = 0x1d

.field public static final NEW:I = 0x1e

.field public static final NOT:I = 0x1a

.field public static final NULL:I = 0x2a

.field public static final NUMBER:I = 0x28

.field public static final OBJECTLIT:I = 0x42

.field public static final OR:I = 0x68

.field public static final POS:I = 0x1c

.field public static final RB:I = 0x54

.field public static final RC:I = 0x56

.field public static final REF_CALL:I = 0x46

.field public static final REF_MEMBER:I = 0x4d

.field public static final REF_NAME:I = 0x4f

.field public static final REF_NS_MEMBER:I = 0x4e

.field public static final REF_NS_NAME:I = 0x50

.field public static final REF_SPECIAL:I = 0x47

.field public static final REGEXP:I = 0x30

.field public static final RESERVED:I = 0x7f

.field public static final RETHROW:I = 0x33

.field public static final RETURN:I = 0x4

.field public static final RETURN_RESULT:I = 0x40

.field public static final RP:I = 0x58

.field public static final RSH:I = 0x13

.field public static final SCRIPT:I = 0x88

.field public static final SEMI:I = 0x52

.field public static final SET:I = 0x98

.field public static final SETCONST:I = 0x9b

.field public static final SETCONSTVAR:I = 0x9c

.field public static final SETELEM:I = 0x25

.field public static final SETELEM_OP:I = 0x8c

.field public static final SETNAME:I = 0x8

.field public static final SETPROP:I = 0x23

.field public static final SETPROP_OP:I = 0x8b

.field public static final SETVAR:I = 0x38

.field public static final SET_REF:I = 0x44

.field public static final SET_REF_OP:I = 0x8e

.field public static final SHEQ:I = 0x2e

.field public static final SHNE:I = 0x2f

.field public static final STRICT_SETNAME:I = 0x49

.field public static final STRING:I = 0x29

.field public static final SUB:I = 0x16

.field public static final SWITCH:I = 0x72

.field public static final TARGET:I = 0x83

.field public static final THIS:I = 0x2b

.field public static final THISFN:I = 0x3f

.field public static final THROW:I = 0x32

.field public static final TO_DOUBLE:I = 0x96

.field public static final TO_OBJECT:I = 0x95

.field public static final TRUE:I = 0x2d

.field public static final TRY:I = 0x51

.field public static final TYPEOF:I = 0x20

.field public static final TYPEOFNAME:I = 0x89

.field public static final URSH:I = 0x14

.field public static final USE_STACK:I = 0x8a

.field public static final VAR:I = 0x7a

.field public static final VOID:I = 0x7e

.field public static final WHILE:I = 0x75

.field public static final WITH:I = 0x7b

.field public static final WITHEXPR:I = 0x9f

.field public static final XML:I = 0x91

.field public static final XMLATTR:I = 0x93

.field public static final XMLEND:I = 0x94

.field public static final YIELD:I = 0x48

.field static final printICode:Z

.field static final printNames:Z

.field public static final printTrees:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static isValidToken(I)Z
    .locals 1
    .param p0, "code"    # I

    .prologue
    .line 474
    const/4 v0, -0x1

    if-lt p0, v0, :cond_0

    const/16 v0, 0xa4

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static keywordToName(I)Ljava/lang/String;
    .locals 1
    .param p0, "token"    # I

    .prologue
    .line 431
    sparse-switch p0, :sswitch_data_0

    .line 464
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 432
    :sswitch_0
    const-string v0, "break"

    goto :goto_0

    .line 433
    :sswitch_1
    const-string v0, "case"

    goto :goto_0

    .line 434
    :sswitch_2
    const-string v0, "continue"

    goto :goto_0

    .line 435
    :sswitch_3
    const-string v0, "default"

    goto :goto_0

    .line 436
    :sswitch_4
    const-string v0, "delete"

    goto :goto_0

    .line 437
    :sswitch_5
    const-string v0, "do"

    goto :goto_0

    .line 438
    :sswitch_6
    const-string v0, "else"

    goto :goto_0

    .line 439
    :sswitch_7
    const-string v0, "false"

    goto :goto_0

    .line 440
    :sswitch_8
    const-string v0, "for"

    goto :goto_0

    .line 441
    :sswitch_9
    const-string v0, "function"

    goto :goto_0

    .line 442
    :sswitch_a
    const-string v0, "if"

    goto :goto_0

    .line 443
    :sswitch_b
    const-string v0, "in"

    goto :goto_0

    .line 444
    :sswitch_c
    const-string v0, "let"

    goto :goto_0

    .line 445
    :sswitch_d
    const-string v0, "new"

    goto :goto_0

    .line 446
    :sswitch_e
    const-string v0, "null"

    goto :goto_0

    .line 447
    :sswitch_f
    const-string v0, "return"

    goto :goto_0

    .line 448
    :sswitch_10
    const-string v0, "switch"

    goto :goto_0

    .line 449
    :sswitch_11
    const-string v0, "this"

    goto :goto_0

    .line 450
    :sswitch_12
    const-string v0, "true"

    goto :goto_0

    .line 451
    :sswitch_13
    const-string v0, "typeof"

    goto :goto_0

    .line 452
    :sswitch_14
    const-string v0, "var"

    goto :goto_0

    .line 453
    :sswitch_15
    const-string v0, "void"

    goto :goto_0

    .line 454
    :sswitch_16
    const-string v0, "while"

    goto :goto_0

    .line 455
    :sswitch_17
    const-string v0, "with"

    goto :goto_0

    .line 456
    :sswitch_18
    const-string v0, "yield"

    goto :goto_0

    .line 457
    :sswitch_19
    const-string v0, "catch"

    goto :goto_0

    .line 458
    :sswitch_1a
    const-string v0, "const"

    goto :goto_0

    .line 459
    :sswitch_1b
    const-string v0, "debugger"

    goto :goto_0

    .line 460
    :sswitch_1c
    const-string v0, "finally"

    goto :goto_0

    .line 461
    :sswitch_1d
    const-string v0, "instanceof"

    goto :goto_0

    .line 462
    :sswitch_1e
    const-string v0, "throw"

    goto :goto_0

    .line 463
    :sswitch_1f
    const-string v0, "try"

    goto :goto_0

    .line 431
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_f
        0x1e -> :sswitch_d
        0x1f -> :sswitch_4
        0x20 -> :sswitch_13
        0x2a -> :sswitch_e
        0x2b -> :sswitch_11
        0x2c -> :sswitch_7
        0x2d -> :sswitch_12
        0x32 -> :sswitch_1e
        0x34 -> :sswitch_b
        0x35 -> :sswitch_1d
        0x48 -> :sswitch_18
        0x51 -> :sswitch_1f
        0x6d -> :sswitch_9
        0x70 -> :sswitch_a
        0x71 -> :sswitch_6
        0x72 -> :sswitch_10
        0x73 -> :sswitch_1
        0x74 -> :sswitch_3
        0x75 -> :sswitch_16
        0x76 -> :sswitch_5
        0x77 -> :sswitch_8
        0x78 -> :sswitch_0
        0x79 -> :sswitch_2
        0x7a -> :sswitch_14
        0x7b -> :sswitch_17
        0x7c -> :sswitch_19
        0x7d -> :sswitch_1c
        0x7e -> :sswitch_15
        0x99 -> :sswitch_c
        0x9a -> :sswitch_1a
        0xa0 -> :sswitch_1b
    .end sparse-switch
.end method

.method public static name(I)Ljava/lang/String;
    .locals 1
    .param p0, "token"    # I

    .prologue
    .line 242
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static typeToName(I)Ljava/lang/String;
    .locals 2
    .param p0, "token"    # I

    .prologue
    .line 254
    packed-switch p0, :pswitch_data_0

    .line 421
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :pswitch_1
    const-string v0, "ERROR"

    .line 417
    :goto_0
    return-object v0

    .line 256
    :pswitch_2
    const-string v0, "EOF"

    goto :goto_0

    .line 257
    :pswitch_3
    const-string v0, "EOL"

    goto :goto_0

    .line 258
    :pswitch_4
    const-string v0, "ENTERWITH"

    goto :goto_0

    .line 259
    :pswitch_5
    const-string v0, "LEAVEWITH"

    goto :goto_0

    .line 260
    :pswitch_6
    const-string v0, "RETURN"

    goto :goto_0

    .line 261
    :pswitch_7
    const-string v0, "GOTO"

    goto :goto_0

    .line 262
    :pswitch_8
    const-string v0, "IFEQ"

    goto :goto_0

    .line 263
    :pswitch_9
    const-string v0, "IFNE"

    goto :goto_0

    .line 264
    :pswitch_a
    const-string v0, "SETNAME"

    goto :goto_0

    .line 265
    :pswitch_b
    const-string v0, "BITOR"

    goto :goto_0

    .line 266
    :pswitch_c
    const-string v0, "BITXOR"

    goto :goto_0

    .line 267
    :pswitch_d
    const-string v0, "BITAND"

    goto :goto_0

    .line 268
    :pswitch_e
    const-string v0, "EQ"

    goto :goto_0

    .line 269
    :pswitch_f
    const-string v0, "NE"

    goto :goto_0

    .line 270
    :pswitch_10
    const-string v0, "LT"

    goto :goto_0

    .line 271
    :pswitch_11
    const-string v0, "LE"

    goto :goto_0

    .line 272
    :pswitch_12
    const-string v0, "GT"

    goto :goto_0

    .line 273
    :pswitch_13
    const-string v0, "GE"

    goto :goto_0

    .line 274
    :pswitch_14
    const-string v0, "LSH"

    goto :goto_0

    .line 275
    :pswitch_15
    const-string v0, "RSH"

    goto :goto_0

    .line 276
    :pswitch_16
    const-string v0, "URSH"

    goto :goto_0

    .line 277
    :pswitch_17
    const-string v0, "ADD"

    goto :goto_0

    .line 278
    :pswitch_18
    const-string v0, "SUB"

    goto :goto_0

    .line 279
    :pswitch_19
    const-string v0, "MUL"

    goto :goto_0

    .line 280
    :pswitch_1a
    const-string v0, "DIV"

    goto :goto_0

    .line 281
    :pswitch_1b
    const-string v0, "MOD"

    goto :goto_0

    .line 282
    :pswitch_1c
    const-string v0, "NOT"

    goto :goto_0

    .line 283
    :pswitch_1d
    const-string v0, "BITNOT"

    goto :goto_0

    .line 284
    :pswitch_1e
    const-string v0, "POS"

    goto :goto_0

    .line 285
    :pswitch_1f
    const-string v0, "NEG"

    goto :goto_0

    .line 286
    :pswitch_20
    const-string v0, "NEW"

    goto :goto_0

    .line 287
    :pswitch_21
    const-string v0, "DELPROP"

    goto :goto_0

    .line 288
    :pswitch_22
    const-string v0, "TYPEOF"

    goto :goto_0

    .line 289
    :pswitch_23
    const-string v0, "GETPROP"

    goto :goto_0

    .line 290
    :pswitch_24
    const-string v0, "GETPROPNOWARN"

    goto :goto_0

    .line 291
    :pswitch_25
    const-string v0, "SETPROP"

    goto :goto_0

    .line 292
    :pswitch_26
    const-string v0, "GETELEM"

    goto :goto_0

    .line 293
    :pswitch_27
    const-string v0, "SETELEM"

    goto :goto_0

    .line 294
    :pswitch_28
    const-string v0, "CALL"

    goto :goto_0

    .line 295
    :pswitch_29
    const-string v0, "NAME"

    goto :goto_0

    .line 296
    :pswitch_2a
    const-string v0, "NUMBER"

    goto :goto_0

    .line 297
    :pswitch_2b
    const-string v0, "STRING"

    goto :goto_0

    .line 298
    :pswitch_2c
    const-string v0, "NULL"

    goto/16 :goto_0

    .line 299
    :pswitch_2d
    const-string v0, "THIS"

    goto/16 :goto_0

    .line 300
    :pswitch_2e
    const-string v0, "FALSE"

    goto/16 :goto_0

    .line 301
    :pswitch_2f
    const-string v0, "TRUE"

    goto/16 :goto_0

    .line 302
    :pswitch_30
    const-string v0, "SHEQ"

    goto/16 :goto_0

    .line 303
    :pswitch_31
    const-string v0, "SHNE"

    goto/16 :goto_0

    .line 304
    :pswitch_32
    const-string v0, "REGEXP"

    goto/16 :goto_0

    .line 305
    :pswitch_33
    const-string v0, "BINDNAME"

    goto/16 :goto_0

    .line 306
    :pswitch_34
    const-string v0, "THROW"

    goto/16 :goto_0

    .line 307
    :pswitch_35
    const-string v0, "RETHROW"

    goto/16 :goto_0

    .line 308
    :pswitch_36
    const-string v0, "IN"

    goto/16 :goto_0

    .line 309
    :pswitch_37
    const-string v0, "INSTANCEOF"

    goto/16 :goto_0

    .line 310
    :pswitch_38
    const-string v0, "LOCAL_LOAD"

    goto/16 :goto_0

    .line 311
    :pswitch_39
    const-string v0, "GETVAR"

    goto/16 :goto_0

    .line 312
    :pswitch_3a
    const-string v0, "SETVAR"

    goto/16 :goto_0

    .line 313
    :pswitch_3b
    const-string v0, "CATCH_SCOPE"

    goto/16 :goto_0

    .line 314
    :pswitch_3c
    const-string v0, "ENUM_INIT_KEYS"

    goto/16 :goto_0

    .line 315
    :pswitch_3d
    const-string v0, "ENUM_INIT_VALUES"

    goto/16 :goto_0

    .line 316
    :pswitch_3e
    const-string v0, "ENUM_INIT_ARRAY"

    goto/16 :goto_0

    .line 317
    :pswitch_3f
    const-string v0, "ENUM_NEXT"

    goto/16 :goto_0

    .line 318
    :pswitch_40
    const-string v0, "ENUM_ID"

    goto/16 :goto_0

    .line 319
    :pswitch_41
    const-string v0, "THISFN"

    goto/16 :goto_0

    .line 320
    :pswitch_42
    const-string v0, "RETURN_RESULT"

    goto/16 :goto_0

    .line 321
    :pswitch_43
    const-string v0, "ARRAYLIT"

    goto/16 :goto_0

    .line 322
    :pswitch_44
    const-string v0, "OBJECTLIT"

    goto/16 :goto_0

    .line 323
    :pswitch_45
    const-string v0, "GET_REF"

    goto/16 :goto_0

    .line 324
    :pswitch_46
    const-string v0, "SET_REF"

    goto/16 :goto_0

    .line 325
    :pswitch_47
    const-string v0, "DEL_REF"

    goto/16 :goto_0

    .line 326
    :pswitch_48
    const-string v0, "REF_CALL"

    goto/16 :goto_0

    .line 327
    :pswitch_49
    const-string v0, "REF_SPECIAL"

    goto/16 :goto_0

    .line 328
    :pswitch_4a
    const-string v0, "DEFAULTNAMESPACE"

    goto/16 :goto_0

    .line 329
    :pswitch_4b
    const-string v0, "ESCXMLTEXT"

    goto/16 :goto_0

    .line 330
    :pswitch_4c
    const-string v0, "ESCXMLATTR"

    goto/16 :goto_0

    .line 331
    :pswitch_4d
    const-string v0, "REF_MEMBER"

    goto/16 :goto_0

    .line 332
    :pswitch_4e
    const-string v0, "REF_NS_MEMBER"

    goto/16 :goto_0

    .line 333
    :pswitch_4f
    const-string v0, "REF_NAME"

    goto/16 :goto_0

    .line 334
    :pswitch_50
    const-string v0, "REF_NS_NAME"

    goto/16 :goto_0

    .line 335
    :pswitch_51
    const-string v0, "TRY"

    goto/16 :goto_0

    .line 336
    :pswitch_52
    const-string v0, "SEMI"

    goto/16 :goto_0

    .line 337
    :pswitch_53
    const-string v0, "LB"

    goto/16 :goto_0

    .line 338
    :pswitch_54
    const-string v0, "RB"

    goto/16 :goto_0

    .line 339
    :pswitch_55
    const-string v0, "LC"

    goto/16 :goto_0

    .line 340
    :pswitch_56
    const-string v0, "RC"

    goto/16 :goto_0

    .line 341
    :pswitch_57
    const-string v0, "LP"

    goto/16 :goto_0

    .line 342
    :pswitch_58
    const-string v0, "RP"

    goto/16 :goto_0

    .line 343
    :pswitch_59
    const-string v0, "COMMA"

    goto/16 :goto_0

    .line 344
    :pswitch_5a
    const-string v0, "ASSIGN"

    goto/16 :goto_0

    .line 345
    :pswitch_5b
    const-string v0, "ASSIGN_BITOR"

    goto/16 :goto_0

    .line 346
    :pswitch_5c
    const-string v0, "ASSIGN_BITXOR"

    goto/16 :goto_0

    .line 347
    :pswitch_5d
    const-string v0, "ASSIGN_BITAND"

    goto/16 :goto_0

    .line 348
    :pswitch_5e
    const-string v0, "ASSIGN_LSH"

    goto/16 :goto_0

    .line 349
    :pswitch_5f
    const-string v0, "ASSIGN_RSH"

    goto/16 :goto_0

    .line 350
    :pswitch_60
    const-string v0, "ASSIGN_URSH"

    goto/16 :goto_0

    .line 351
    :pswitch_61
    const-string v0, "ASSIGN_ADD"

    goto/16 :goto_0

    .line 352
    :pswitch_62
    const-string v0, "ASSIGN_SUB"

    goto/16 :goto_0

    .line 353
    :pswitch_63
    const-string v0, "ASSIGN_MUL"

    goto/16 :goto_0

    .line 354
    :pswitch_64
    const-string v0, "ASSIGN_DIV"

    goto/16 :goto_0

    .line 355
    :pswitch_65
    const-string v0, "ASSIGN_MOD"

    goto/16 :goto_0

    .line 356
    :pswitch_66
    const-string v0, "HOOK"

    goto/16 :goto_0

    .line 357
    :pswitch_67
    const-string v0, "COLON"

    goto/16 :goto_0

    .line 358
    :pswitch_68
    const-string v0, "OR"

    goto/16 :goto_0

    .line 359
    :pswitch_69
    const-string v0, "AND"

    goto/16 :goto_0

    .line 360
    :pswitch_6a
    const-string v0, "INC"

    goto/16 :goto_0

    .line 361
    :pswitch_6b
    const-string v0, "DEC"

    goto/16 :goto_0

    .line 362
    :pswitch_6c
    const-string v0, "DOT"

    goto/16 :goto_0

    .line 363
    :pswitch_6d
    const-string v0, "FUNCTION"

    goto/16 :goto_0

    .line 364
    :pswitch_6e
    const-string v0, "EXPORT"

    goto/16 :goto_0

    .line 365
    :pswitch_6f
    const-string v0, "IMPORT"

    goto/16 :goto_0

    .line 366
    :pswitch_70
    const-string v0, "IF"

    goto/16 :goto_0

    .line 367
    :pswitch_71
    const-string v0, "ELSE"

    goto/16 :goto_0

    .line 368
    :pswitch_72
    const-string v0, "SWITCH"

    goto/16 :goto_0

    .line 369
    :pswitch_73
    const-string v0, "CASE"

    goto/16 :goto_0

    .line 370
    :pswitch_74
    const-string v0, "DEFAULT"

    goto/16 :goto_0

    .line 371
    :pswitch_75
    const-string v0, "WHILE"

    goto/16 :goto_0

    .line 372
    :pswitch_76
    const-string v0, "DO"

    goto/16 :goto_0

    .line 373
    :pswitch_77
    const-string v0, "FOR"

    goto/16 :goto_0

    .line 374
    :pswitch_78
    const-string v0, "BREAK"

    goto/16 :goto_0

    .line 375
    :pswitch_79
    const-string v0, "CONTINUE"

    goto/16 :goto_0

    .line 376
    :pswitch_7a
    const-string v0, "VAR"

    goto/16 :goto_0

    .line 377
    :pswitch_7b
    const-string v0, "WITH"

    goto/16 :goto_0

    .line 378
    :pswitch_7c
    const-string v0, "CATCH"

    goto/16 :goto_0

    .line 379
    :pswitch_7d
    const-string v0, "FINALLY"

    goto/16 :goto_0

    .line 380
    :pswitch_7e
    const-string v0, "VOID"

    goto/16 :goto_0

    .line 381
    :pswitch_7f
    const-string v0, "RESERVED"

    goto/16 :goto_0

    .line 382
    :pswitch_80
    const-string v0, "EMPTY"

    goto/16 :goto_0

    .line 383
    :pswitch_81
    const-string v0, "BLOCK"

    goto/16 :goto_0

    .line 384
    :pswitch_82
    const-string v0, "LABEL"

    goto/16 :goto_0

    .line 385
    :pswitch_83
    const-string v0, "TARGET"

    goto/16 :goto_0

    .line 386
    :pswitch_84
    const-string v0, "LOOP"

    goto/16 :goto_0

    .line 387
    :pswitch_85
    const-string v0, "EXPR_VOID"

    goto/16 :goto_0

    .line 388
    :pswitch_86
    const-string v0, "EXPR_RESULT"

    goto/16 :goto_0

    .line 389
    :pswitch_87
    const-string v0, "JSR"

    goto/16 :goto_0

    .line 390
    :pswitch_88
    const-string v0, "SCRIPT"

    goto/16 :goto_0

    .line 391
    :pswitch_89
    const-string v0, "TYPEOFNAME"

    goto/16 :goto_0

    .line 392
    :pswitch_8a
    const-string v0, "USE_STACK"

    goto/16 :goto_0

    .line 393
    :pswitch_8b
    const-string v0, "SETPROP_OP"

    goto/16 :goto_0

    .line 394
    :pswitch_8c
    const-string v0, "SETELEM_OP"

    goto/16 :goto_0

    .line 395
    :pswitch_8d
    const-string v0, "LOCAL_BLOCK"

    goto/16 :goto_0

    .line 396
    :pswitch_8e
    const-string v0, "SET_REF_OP"

    goto/16 :goto_0

    .line 397
    :pswitch_8f
    const-string v0, "DOTDOT"

    goto/16 :goto_0

    .line 398
    :pswitch_90
    const-string v0, "COLONCOLON"

    goto/16 :goto_0

    .line 399
    :pswitch_91
    const-string v0, "XML"

    goto/16 :goto_0

    .line 400
    :pswitch_92
    const-string v0, "DOTQUERY"

    goto/16 :goto_0

    .line 401
    :pswitch_93
    const-string v0, "XMLATTR"

    goto/16 :goto_0

    .line 402
    :pswitch_94
    const-string v0, "XMLEND"

    goto/16 :goto_0

    .line 403
    :pswitch_95
    const-string v0, "TO_OBJECT"

    goto/16 :goto_0

    .line 404
    :pswitch_96
    const-string v0, "TO_DOUBLE"

    goto/16 :goto_0

    .line 405
    :pswitch_97
    const-string v0, "GET"

    goto/16 :goto_0

    .line 406
    :pswitch_98
    const-string v0, "SET"

    goto/16 :goto_0

    .line 407
    :pswitch_99
    const-string v0, "LET"

    goto/16 :goto_0

    .line 408
    :pswitch_9a
    const-string v0, "YIELD"

    goto/16 :goto_0

    .line 409
    :pswitch_9b
    const-string v0, "CONST"

    goto/16 :goto_0

    .line 410
    :pswitch_9c
    const-string v0, "SETCONST"

    goto/16 :goto_0

    .line 411
    :pswitch_9d
    const-string v0, "ARRAYCOMP"

    goto/16 :goto_0

    .line 412
    :pswitch_9e
    const-string v0, "WITHEXPR"

    goto/16 :goto_0

    .line 413
    :pswitch_9f
    const-string v0, "LETEXPR"

    goto/16 :goto_0

    .line 414
    :pswitch_a0
    const-string v0, "DEBUGGER"

    goto/16 :goto_0

    .line 415
    :pswitch_a1
    const-string v0, "COMMENT"

    goto/16 :goto_0

    .line 416
    :pswitch_a2
    const-string v0, "GENEXPR"

    goto/16 :goto_0

    .line 417
    :pswitch_a3
    const-string v0, "METHOD"

    goto/16 :goto_0

    .line 254
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
        :pswitch_49
        :pswitch_9a
        :pswitch_0
        :pswitch_4a
        :pswitch_4c
        :pswitch_4b
        :pswitch_4d
        :pswitch_4e
        :pswitch_4f
        :pswitch_50
        :pswitch_51
        :pswitch_52
        :pswitch_53
        :pswitch_54
        :pswitch_55
        :pswitch_56
        :pswitch_57
        :pswitch_58
        :pswitch_59
        :pswitch_5a
        :pswitch_5b
        :pswitch_5c
        :pswitch_5d
        :pswitch_5e
        :pswitch_5f
        :pswitch_60
        :pswitch_61
        :pswitch_62
        :pswitch_63
        :pswitch_64
        :pswitch_65
        :pswitch_66
        :pswitch_67
        :pswitch_68
        :pswitch_69
        :pswitch_6a
        :pswitch_6b
        :pswitch_6c
        :pswitch_6d
        :pswitch_6e
        :pswitch_6f
        :pswitch_70
        :pswitch_71
        :pswitch_72
        :pswitch_73
        :pswitch_74
        :pswitch_75
        :pswitch_76
        :pswitch_77
        :pswitch_78
        :pswitch_79
        :pswitch_7a
        :pswitch_7b
        :pswitch_7c
        :pswitch_7d
        :pswitch_7e
        :pswitch_7f
        :pswitch_80
        :pswitch_81
        :pswitch_82
        :pswitch_83
        :pswitch_84
        :pswitch_85
        :pswitch_86
        :pswitch_87
        :pswitch_88
        :pswitch_89
        :pswitch_8a
        :pswitch_8b
        :pswitch_8c
        :pswitch_8d
        :pswitch_8e
        :pswitch_8f
        :pswitch_90
        :pswitch_91
        :pswitch_92
        :pswitch_93
        :pswitch_94
        :pswitch_95
        :pswitch_96
        :pswitch_97
        :pswitch_98
        :pswitch_99
        :pswitch_9b
        :pswitch_9c
        :pswitch_0
        :pswitch_9d
        :pswitch_9f
        :pswitch_9e
        :pswitch_a0
        :pswitch_a1
        :pswitch_a2
        :pswitch_a3
    .end packed-switch
.end method
