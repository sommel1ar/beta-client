.class public Lorg/mozilla/javascript/tools/idswitch/Main;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field private static final GENERATED_TAG:I = 0x2

.field private static final GENERATED_TAG_STR:Ljava/lang/String; = "generated"

.field private static final NORMAL_LINE:I = 0x0

.field private static final STRING_TAG:I = 0x3

.field private static final STRING_TAG_STR:Ljava/lang/String; = "string"

.field private static final SWITCH_TAG:I = 0x1

.field private static final SWITCH_TAG_STR:Ljava/lang/String; = "string_id_map"


# instance fields
.field private P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

.field private R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

.field private final all_pairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/tools/idswitch/IdValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

.field private source_file:Ljava/lang/String;

.field private tag_definition_end:I

.field private tag_value_end:I

.field private tag_value_start:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    return-void
.end method

.method private add_id([CIIII)V
    .locals 4
    .param p1, "array"    # [C
    .param p2, "id_start"    # I
    .param p3, "id_end"    # I
    .param p4, "name_start"    # I
    .param p5, "name_end"    # I

    .prologue
    .line 376
    new-instance v0, Ljava/lang/String;

    sub-int v3, p5, p4

    invoke-direct {v0, p1, p4, v3}, Ljava/lang/String;-><init>([CII)V

    .line 377
    .local v0, "name":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    sub-int v3, p3, p2

    invoke-direct {v2, p1, p2, v3}, Ljava/lang/String;-><init>([CII)V

    .line 379
    .local v2, "value":Ljava/lang/String;
    new-instance v1, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    invoke-direct {v1, v0, v2}, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    .local v1, "pair":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getLineNumber()I

    move-result v3

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->setLineNumber(I)V

    .line 383
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 384
    return-void
.end method

.method private static equals(Ljava/lang/String;[CII)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .prologue
    const/4 v2, 0x0

    .line 417
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v4, p3, p2

    if-ne v3, v4, :cond_0

    .line 418
    move v0, p2

    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-eq v0, p3, :cond_2

    .line 419
    aget-char v3, p1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_1

    .line 423
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_0
    :goto_1
    return v2

    .line 418
    .restart local v0    # "i":I
    .restart local v1    # "j":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 421
    :cond_2
    const/4 v2, 0x1

    goto :goto_1
.end method

.method private exec([Ljava/lang/String;)I
    .locals 7
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 448
    new-instance v4, Lorg/mozilla/javascript/tools/ToolErrorReporter;

    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-direct {v4, v6, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    iput-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    .line 450
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/idswitch/Main;->process_options([Ljava/lang/String;)I

    move-result v0

    .line 452
    .local v0, "arg_count":I
    if-nez v0, :cond_0

    .line 453
    const-string v3, "msg.idswitch.no_file_argument"

    invoke-static {v3}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 478
    :goto_0
    return v2

    .line 457
    :cond_0
    if-le v0, v6, :cond_1

    .line 458
    const-string v3, "msg.idswitch.too_many_arguments"

    invoke-static {v3}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    goto :goto_0

    .line 463
    :cond_1
    new-instance v4, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-direct {v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;-><init>()V

    iput-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    .line 464
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->setIndentStep(I)V

    .line 465
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->setIndentTabSize(I)V

    .line 468
    const/4 v4, 0x0

    :try_start_0
    aget-object v4, p1, v4

    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/tools/idswitch/Main;->process_file(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/mozilla/javascript/EvaluatorException; {:try_start_0 .. :try_end_0} :catch_1

    move v2, v3

    .line 478
    goto :goto_0

    .line 470
    :catch_0
    move-exception v1

    .line 471
    .local v1, "ex":Ljava/io/IOException;
    const-string v3, "msg.idswitch.io_error"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/tools/idswitch/Main;->print_error(Ljava/lang/String;)V

    goto :goto_0

    .line 475
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 476
    .local v1, "ex":Lorg/mozilla/javascript/EvaluatorException;
    goto :goto_0
.end method

.method private extract_line_tag_id([CII)I
    .locals 17
    .param p1, "array"    # [C
    .param p2, "cursor"    # I
    .param p3, "end"    # I

    .prologue
    .line 204
    const/4 v14, 0x0

    .line 205
    .local v14, "id":I
    invoke-static/range {p1 .. p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result p2

    .line 206
    move/from16 v9, p2

    .line 207
    .local v9, "after_leading_white_space":I
    invoke-direct/range {p0 .. p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->look_for_slash_slash([CII)I

    move-result p2

    .line 208
    move/from16 v0, p2

    move/from16 v1, p3

    if-eq v0, v1, :cond_9

    .line 209
    add-int/lit8 v3, v9, 0x2

    move/from16 v0, p2

    if-ne v3, v0, :cond_4

    const/4 v10, 0x1

    .line 210
    .local v10, "at_line_start":Z
    :goto_0
    invoke-static/range {p1 .. p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result p2

    .line 211
    move/from16 v0, p2

    move/from16 v1, p3

    if-eq v0, v1, :cond_9

    aget-char v3, p1, p2

    const/16 v5, 0x23

    if-ne v3, v5, :cond_9

    .line 212
    add-int/lit8 p2, p2, 0x1

    .line 214
    const/4 v13, 0x0

    .line 215
    .local v13, "end_tag":Z
    move/from16 v0, p2

    move/from16 v1, p3

    if-eq v0, v1, :cond_0

    aget-char v3, p1, p2

    const/16 v5, 0x2f

    if-ne v3, v5, :cond_0

    .line 216
    add-int/lit8 p2, p2, 0x1

    const/4 v13, 0x1

    .line 219
    :cond_0
    move/from16 v16, p2

    .line 221
    .local v16, "tag_start":I
    :goto_1
    move/from16 v0, p2

    move/from16 v1, p3

    if-eq v0, v1, :cond_1

    .line 222
    aget-char v12, p1, p2

    .line 223
    .local v12, "c":I
    const/16 v3, 0x23

    if-eq v12, v3, :cond_1

    const/16 v3, 0x3d

    if-eq v12, v3, :cond_1

    invoke-static {v12}, Lorg/mozilla/javascript/tools/idswitch/Main;->is_white_space(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 226
    .end local v12    # "c":I
    :cond_1
    move/from16 v0, p2

    move/from16 v1, p3

    if-eq v0, v1, :cond_9

    .line 227
    move/from16 v15, p2

    .line 228
    .local v15, "tag_end":I
    invoke-static/range {p1 .. p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result p2

    .line 229
    move/from16 v0, p2

    move/from16 v1, p3

    if-eq v0, v1, :cond_9

    .line 230
    aget-char v12, p1, p2

    .line 231
    .restart local v12    # "c":I
    const/16 v3, 0x3d

    if-eq v12, v3, :cond_2

    const/16 v3, 0x23

    if-ne v12, v3, :cond_9

    .line 232
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v16

    invoke-direct {v0, v1, v2, v15, v10}, Lorg/mozilla/javascript/tools/idswitch/Main;->get_tag_id([CIIZ)I

    move-result v14

    .line 234
    if-eqz v14, :cond_9

    .line 235
    const/4 v11, 0x0

    .line 236
    .local v11, "bad":Ljava/lang/String;
    const/16 v3, 0x23

    if-ne v12, v3, :cond_6

    .line 237
    if-eqz v13, :cond_3

    .line 238
    neg-int v14, v14

    .line 239
    invoke-static {v14}, Lorg/mozilla/javascript/tools/idswitch/Main;->is_value_type(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 240
    const-string v11, "msg.idswitch.no_end_usage"

    .line 243
    :cond_3
    add-int/lit8 v3, p2, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_definition_end:I

    .line 255
    :goto_2
    if-eqz v11, :cond_9

    .line 256
    invoke-static {v14}, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_name(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 258
    .local v4, "s":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->source_file:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v6}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getLineNumber()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 209
    .end local v4    # "s":Ljava/lang/String;
    .end local v10    # "at_line_start":Z
    .end local v11    # "bad":Ljava/lang/String;
    .end local v12    # "c":I
    .end local v13    # "end_tag":Z
    .end local v15    # "tag_end":I
    .end local v16    # "tag_start":I
    :cond_4
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 221
    .restart local v10    # "at_line_start":Z
    .restart local v12    # "c":I
    .restart local v13    # "end_tag":Z
    .restart local v16    # "tag_start":I
    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 246
    .restart local v11    # "bad":Ljava/lang/String;
    .restart local v15    # "tag_end":I
    :cond_6
    if-eqz v13, :cond_8

    .line 247
    const-string v11, "msg.idswitch.no_end_with_value"

    .line 252
    :cond_7
    :goto_3
    add-int/lit8 v3, p2, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-direct {v0, v1, v3, v2, v14}, Lorg/mozilla/javascript/tools/idswitch/Main;->extract_tag_value([CIII)I

    move-result v14

    goto :goto_2

    .line 249
    :cond_8
    invoke-static {v14}, Lorg/mozilla/javascript/tools/idswitch/Main;->is_value_type(I)Z

    move-result v3

    if-nez v3, :cond_7

    .line 250
    const-string v11, "msg.idswitch.no_value_allowed"

    goto :goto_3

    .line 268
    .end local v10    # "at_line_start":Z
    .end local v11    # "bad":Ljava/lang/String;
    .end local v12    # "c":I
    .end local v13    # "end_tag":Z
    .end local v15    # "tag_end":I
    .end local v16    # "tag_start":I
    :cond_9
    return v14
.end method

.method private extract_tag_value([CIII)I
    .locals 7
    .param p1, "array"    # [C
    .param p2, "cursor"    # I
    .param p3, "end"    # I
    .param p4, "id"    # I

    .prologue
    const/16 v6, 0x23

    .line 288
    const/4 v2, 0x0

    .line 289
    .local v2, "found":Z
    invoke-static {p1, p2, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result p2

    .line 290
    if-eq p2, p3, :cond_1

    .line 291
    move v4, p2

    .line 292
    .local v4, "value_start":I
    move v3, p2

    .line 293
    .local v3, "value_end":I
    :goto_0
    if-eq p2, p3, :cond_0

    .line 294
    aget-char v1, p1, p2

    .line 295
    .local v1, "c":I
    invoke-static {v1}, Lorg/mozilla/javascript/tools/idswitch/Main;->is_white_space(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 296
    add-int/lit8 v5, p2, 0x1

    invoke-static {p1, v5, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v0

    .line 297
    .local v0, "after_space":I
    if-eq v0, p3, :cond_2

    aget-char v5, p1, v0

    if-ne v5, v6, :cond_2

    .line 298
    move v3, p2

    .line 299
    move p2, v0

    .line 312
    .end local v0    # "after_space":I
    .end local v1    # "c":I
    :cond_0
    :goto_1
    if-eq p2, p3, :cond_1

    .line 314
    const/4 v2, 0x1

    .line 315
    iput v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_value_start:I

    .line 316
    iput v3, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_value_end:I

    .line 317
    add-int/lit8 v5, p2, 0x1

    iput v5, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_definition_end:I

    .line 320
    .end local v3    # "value_end":I
    .end local v4    # "value_start":I
    :cond_1
    if-eqz v2, :cond_5

    .end local p4    # "id":I
    :goto_2
    return p4

    .line 302
    .restart local v0    # "after_space":I
    .restart local v1    # "c":I
    .restart local v3    # "value_end":I
    .restart local v4    # "value_start":I
    .restart local p4    # "id":I
    :cond_2
    add-int/lit8 p2, v0, 0x1

    .line 303
    goto :goto_0

    .line 304
    .end local v0    # "after_space":I
    :cond_3
    if-ne v1, v6, :cond_4

    .line 305
    move v3, p2

    .line 306
    goto :goto_1

    .line 309
    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 320
    .end local v1    # "c":I
    .end local v3    # "value_end":I
    .end local v4    # "value_start":I
    :cond_5
    const/4 p4, 0x0

    goto :goto_2
.end method

.method private generate_java_code()V
    .locals 3

    .prologue
    .line 190
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->clear()V

    .line 192
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    .line 193
    .local v1, "pairs":[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 195
    new-instance v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;

    invoke-direct {v0}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;-><init>()V

    .line 196
    .local v0, "g":Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;
    const/4 v2, 0x2

    iput v2, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->char_tail_test_threshold:I

    .line 197
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->setReporter(Lorg/mozilla/javascript/tools/ToolErrorReporter;)V

    .line 198
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->setCodePrinter(Lorg/mozilla/javascript/tools/idswitch/CodePrinter;)V

    .line 200
    const-string v2, "0"

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generateSwitch([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method private get_tag_id([CIIZ)I
    .locals 1
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "at_line_start"    # Z

    .prologue
    .line 326
    if-eqz p4, :cond_1

    .line 327
    const-string v0, "string_id_map"

    invoke-static {v0, p1, p2, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 328
    const/4 v0, 0x1

    .line 337
    :goto_0
    return v0

    .line 330
    :cond_0
    const-string v0, "generated"

    invoke-static {v0, p1, p2, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 331
    const/4 v0, 0x2

    goto :goto_0

    .line 334
    :cond_1
    const-string v0, "string"

    invoke-static {v0, p1, p2, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 335
    const/4 v0, 0x3

    goto :goto_0

    .line 337
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private get_time_stamp()Ljava/lang/String;
    .locals 2

    .prologue
    .line 183
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, " \'Last update:\' yyyy-MM-dd HH:mm:ss z"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 185
    .local v0, "f":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static is_value_type(I)Z
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 40
    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    .line 41
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static is_white_space(I)Z
    .locals 1
    .param p0, "c"    # I

    .prologue
    .line 387
    const/16 v0, 0x20

    if-eq p0, v0, :cond_0

    const/16 v0, 0x9

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private look_for_id_definitions([CIIZ)V
    .locals 7
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "use_tag_value_as_string"    # Z

    .prologue
    .line 346
    move v6, p2

    .line 348
    .local v6, "cursor":I
    invoke-static {p1, v6, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v6

    .line 349
    move v2, v6

    .line 350
    .local v2, "id_start":I
    const-string v0, "Id_"

    invoke-static {v0, p1, v6, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_matched_prefix(Ljava/lang/String;[CII)I

    move-result v4

    .line 351
    .local v4, "name_start":I
    if-ltz v4, :cond_1

    .line 353
    move v6, v4

    .line 354
    invoke-static {p1, v6, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_name_char([CII)I

    move-result v6

    .line 355
    move v5, v6

    .line 356
    .local v5, "name_end":I
    if-eq v4, v5, :cond_1

    .line 357
    invoke-static {p1, v6, p3}, Lorg/mozilla/javascript/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v6

    .line 358
    if-eq v6, p3, :cond_1

    .line 359
    aget-char v0, p1, v6

    const/16 v1, 0x3d

    if-ne v0, v1, :cond_1

    .line 360
    move v3, v5

    .line 361
    .local v3, "id_end":I
    if-eqz p4, :cond_0

    .line 362
    iget v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_value_start:I

    .line 363
    iget v5, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_value_end:I

    :cond_0
    move-object v0, p0

    move-object v1, p1

    .line 366
    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/tools/idswitch/Main;->add_id([CIIII)V

    .line 371
    .end local v3    # "id_end":I
    .end local v5    # "name_end":I
    :cond_1
    return-void
.end method

.method private look_for_slash_slash([CII)I
    .locals 4
    .param p1, "array"    # [C
    .param p2, "cursor"    # I
    .param p3, "end"    # I

    .prologue
    const/16 v3, 0x2f

    .line 273
    move v1, p2

    .end local p2    # "cursor":I
    .local v1, "cursor":I
    :goto_0
    add-int/lit8 v2, v1, 0x2

    if-gt v2, p3, :cond_2

    .line 274
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "cursor":I
    .restart local p2    # "cursor":I
    aget-char v0, p1, v1

    .line 275
    .local v0, "c":I
    if-ne v0, v3, :cond_1

    .line 276
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "cursor":I
    .restart local v1    # "cursor":I
    aget-char v0, p1, p2

    .line 277
    if-ne v0, v3, :cond_0

    move p2, v1

    .line 282
    .end local v0    # "c":I
    .end local v1    # "cursor":I
    .restart local p2    # "cursor":I
    :goto_1
    return v1

    .end local p2    # "cursor":I
    .restart local v0    # "c":I
    .restart local v1    # "cursor":I
    :cond_0
    move p2, v1

    .end local v1    # "cursor":I
    .restart local p2    # "cursor":I
    :cond_1
    move v1, p2

    .line 281
    .end local p2    # "cursor":I
    .restart local v1    # "cursor":I
    goto :goto_0

    .end local v0    # "c":I
    :cond_2
    move p2, v1

    .end local v1    # "cursor":I
    .restart local p2    # "cursor":I
    move v1, p3

    .line 282
    goto :goto_1
.end method

.method public static main([Ljava/lang/String;)V
    .locals 2
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 442
    new-instance v0, Lorg/mozilla/javascript/tools/idswitch/Main;

    invoke-direct {v0}, Lorg/mozilla/javascript/tools/idswitch/Main;-><init>()V

    .line 443
    .local v0, "self":Lorg/mozilla/javascript/tools/idswitch/Main;
    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/idswitch/Main;->exec([Ljava/lang/String;)I

    move-result v1

    .line 444
    .local v1, "status":I
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 445
    return-void
.end method

.method private option_error(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 553
    const-string v0, "msg.idswitch.bad_invocation"

    invoke-static {v0, p1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/idswitch/Main;->print_error(Ljava/lang/String;)V

    .line 555
    return-void
.end method

.method private print_error(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 558
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 559
    return-void
.end method

.method private process_file()V
    .locals 22

    .prologue
    .line 93
    const/4 v13, 0x0

    .line 94
    .local v13, "cur_state":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getBuffer()[C

    move-result-object v11

    .line 96
    .local v11, "buffer":[C
    const/16 v16, -0x1

    .local v16, "generated_begin":I
    const/16 v17, -0x1

    .line 97
    .local v17, "generated_end":I
    const/16 v20, -0x1

    .local v20, "time_stamp_begin":I
    const/16 v21, -0x1

    .line 99
    .local v21, "time_stamp_end":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->startLineLoop()V

    .line 100
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLine()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 101
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getLineBegin()I

    move-result v10

    .line 102
    .local v10, "begin":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getLineEnd()I

    move-result v15

    .line 104
    .local v15, "end":I
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v10, v15}, Lorg/mozilla/javascript/tools/idswitch/Main;->extract_line_tag_id([CII)I

    move-result v19

    .line 105
    .local v19, "tag_id":I
    const/4 v9, 0x0

    .line 106
    .local v9, "bad_tag":Z
    packed-switch v13, :pswitch_data_0

    .line 166
    :cond_1
    :goto_0
    if-eqz v9, :cond_0

    .line 167
    const-string v3, "msg.idswitch.bad_tag_order"

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_name(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 169
    .local v4, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->source_file:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v6}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getLineNumber()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 108
    .end local v4    # "text":Ljava/lang/String;
    :pswitch_0
    const/4 v3, 0x1

    move/from16 v0, v19

    if-ne v0, v3, :cond_2

    .line 109
    const/4 v13, 0x1

    .line 110
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 111
    const/16 v16, -0x1

    goto :goto_0

    .line 113
    :cond_2
    const/4 v3, -0x1

    move/from16 v0, v19

    if-ne v0, v3, :cond_1

    .line 114
    const/4 v9, 0x1

    goto :goto_0

    .line 118
    :pswitch_1
    if-nez v19, :cond_3

    .line 119
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v10, v15, v3}, Lorg/mozilla/javascript/tools/idswitch/Main;->look_for_id_definitions([CIIZ)V

    goto :goto_0

    .line 121
    :cond_3
    const/4 v3, 0x3

    move/from16 v0, v19

    if-ne v0, v3, :cond_4

    .line 122
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v10, v15, v3}, Lorg/mozilla/javascript/tools/idswitch/Main;->look_for_id_definitions([CIIZ)V

    goto :goto_0

    .line 124
    :cond_4
    const/4 v3, 0x2

    move/from16 v0, v19

    if-ne v0, v3, :cond_6

    .line 125
    if-ltz v16, :cond_5

    const/4 v9, 0x1

    goto :goto_0

    .line 127
    :cond_5
    const/4 v13, 0x2

    .line 128
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_definition_end:I

    move/from16 v20, v0

    .line 129
    move/from16 v21, v15

    goto :goto_0

    .line 132
    :cond_6
    const/4 v3, -0x1

    move/from16 v0, v19

    if-ne v0, v3, :cond_7

    .line 133
    const/4 v13, 0x0

    .line 134
    if-ltz v16, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 135
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/tools/idswitch/Main;->generate_java_code()V

    .line 136
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->toString()Ljava/lang/String;

    move-result-object v12

    .line 137
    .local v12, "code":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v1, v12}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->setReplacement(IILjava/lang/String;)Z

    move-result v14

    .line 139
    .local v14, "different":Z
    if-eqz v14, :cond_1

    .line 140
    invoke-direct/range {p0 .. p0}, Lorg/mozilla/javascript/tools/idswitch/Main;->get_time_stamp()Ljava/lang/String;

    move-result-object v18

    .line 141
    .local v18, "stamp":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    move/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v18

    invoke-virtual {v3, v0, v1, v2}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->setReplacement(IILjava/lang/String;)Z

    goto/16 :goto_0

    .line 149
    .end local v12    # "code":Ljava/lang/String;
    .end local v14    # "different":Z
    .end local v18    # "stamp":Ljava/lang/String;
    :cond_7
    const/4 v9, 0x1

    .line 151
    goto/16 :goto_0

    .line 153
    :pswitch_2
    if-nez v19, :cond_8

    .line 154
    if-gez v16, :cond_1

    move/from16 v16, v10

    goto/16 :goto_0

    .line 156
    :cond_8
    const/4 v3, -0x2

    move/from16 v0, v19

    if-ne v0, v3, :cond_a

    .line 157
    if-gez v16, :cond_9

    move/from16 v16, v10

    .line 158
    :cond_9
    const/4 v13, 0x1

    .line 159
    move/from16 v17, v10

    goto/16 :goto_0

    .line 162
    :cond_a
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 174
    .end local v9    # "bad_tag":Z
    .end local v10    # "begin":I
    .end local v15    # "end":I
    .end local v19    # "tag_id":I
    :cond_b
    if-eqz v13, :cond_c

    .line 175
    const-string v3, "msg.idswitch.file_end_in_switch"

    invoke-static {v13}, Lorg/mozilla/javascript/tools/idswitch/Main;->tag_name(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 177
    .restart local v4    # "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->source_file:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v6}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->getLineNumber()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 180
    .end local v4    # "text":Ljava/lang/String;
    :cond_c
    return-void

    .line 106
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private process_options([Ljava/lang/String;)I
    .locals 14
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v13, 0x0

    const/16 v12, 0x2d

    const/4 v10, 0x2

    const/4 v11, 0x1

    .line 483
    const/4 v8, 0x1

    .line 485
    .local v8, "status":I
    const/4 v6, 0x0

    .line 486
    .local v6, "show_usage":Z
    const/4 v7, 0x0

    .line 488
    .local v7, "show_version":Z
    array-length v0, p1

    .line 489
    .local v0, "N":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-eq v4, v0, :cond_0

    .line 490
    aget-object v1, p1, v4

    .line 491
    .local v1, "arg":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 492
    .local v2, "arg_length":I
    if-lt v2, v10, :cond_6

    .line 493
    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v12, :cond_6

    .line 494
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v12, :cond_9

    .line 495
    if-ne v2, v10, :cond_4

    .line 496
    aput-object v13, p1, v4

    .line 531
    .end local v1    # "arg":Ljava/lang/String;
    .end local v2    # "arg_length":I
    :cond_0
    :goto_1
    if-ne v8, v11, :cond_2

    .line 532
    if-eqz v6, :cond_1

    invoke-direct {p0}, Lorg/mozilla/javascript/tools/idswitch/Main;->show_usage()V

    const/4 v8, 0x0

    .line 533
    :cond_1
    if-eqz v7, :cond_2

    invoke-direct {p0}, Lorg/mozilla/javascript/tools/idswitch/Main;->show_version()V

    const/4 v8, 0x0

    .line 536
    :cond_2
    if-eq v8, v11, :cond_3

    invoke-static {v8}, Ljava/lang/System;->exit(I)V

    .line 538
    :cond_3
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/idswitch/Main;->remove_nulls([Ljava/lang/String;)I

    move-result v9

    return v9

    .line 498
    .restart local v1    # "arg":Ljava/lang/String;
    .restart local v2    # "arg_length":I
    :cond_4
    const-string v9, "--help"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 499
    const/4 v6, 0x1

    .line 526
    :cond_5
    :goto_2
    aput-object v13, p1, v4

    .line 489
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 501
    :cond_7
    const-string v9, "--version"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 502
    const/4 v7, 0x1

    goto :goto_2

    .line 505
    :cond_8
    const-string v9, "msg.idswitch.bad_option"

    invoke-static {v9, v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/mozilla/javascript/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 507
    const/4 v8, -0x1

    goto :goto_1

    .line 511
    :cond_9
    const/4 v5, 0x1

    .local v5, "j":I
    :goto_3
    if-eq v5, v2, :cond_5

    .line 512
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 513
    .local v3, "c":C
    packed-switch v3, :pswitch_data_0

    .line 516
    const-string v9, "msg.idswitch.bad_option_char"

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/mozilla/javascript/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 520
    const/4 v8, -0x1

    .line 521
    goto :goto_1

    .line 514
    :pswitch_0
    const/4 v6, 0x1

    .line 511
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 513
    nop

    :pswitch_data_0
    .packed-switch 0x68
        :pswitch_0
    .end packed-switch
.end method

.method private remove_nulls([Ljava/lang/String;)I
    .locals 5
    .param p1, "array"    # [Ljava/lang/String;

    .prologue
    .line 562
    array-length v0, p1

    .line 563
    .local v0, "N":I
    const/4 v1, 0x0

    .line 564
    .local v1, "cursor":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 565
    aget-object v4, p1, v1

    if-nez v4, :cond_2

    .line 567
    :cond_0
    move v2, v1

    .line 568
    .local v2, "destination":I
    if-eq v1, v0, :cond_3

    .line 569
    add-int/lit8 v1, v1, 0x1

    .line 570
    :goto_1
    if-eq v1, v0, :cond_3

    .line 571
    aget-object v3, p1, v1

    .line 572
    .local v3, "elem":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 573
    aput-object v3, p1, v2

    add-int/lit8 v2, v2, 0x1

    .line 570
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 564
    .end local v2    # "destination":I
    .end local v3    # "elem":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 577
    .restart local v2    # "destination":I
    :cond_3
    return v2
.end method

.method private show_usage()V
    .locals 2

    .prologue
    .line 542
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "msg.idswitch.usage"

    invoke-static {v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 544
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 545
    return-void
.end method

.method private show_version()V
    .locals 2

    .prologue
    .line 548
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "msg.idswitch.version"

    invoke-static {v1}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 550
    return-void
.end method

.method private static skip_matched_prefix(Ljava/lang/String;[CII)I
    .locals 5
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .prologue
    .line 402
    const/4 v0, -0x1

    .line 403
    .local v0, "cursor":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 404
    .local v2, "prefix_length":I
    sub-int v3, p3, p2

    if-gt v2, v3, :cond_0

    .line 405
    move v0, p2

    .line 406
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v2, :cond_0

    .line 407
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    aget-char v4, p1, v0

    if-eq v3, v4, :cond_1

    .line 408
    const/4 v0, -0x1

    .line 412
    .end local v1    # "i":I
    :cond_0
    return v0

    .line 406
    .restart local v1    # "i":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static skip_name_char([CII)I
    .locals 3
    .param p0, "array"    # [C
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .prologue
    .line 427
    move v1, p1

    .line 428
    .local v1, "cursor":I
    :goto_0
    if-eq v1, p2, :cond_3

    .line 429
    aget-char v0, p0, v1

    .line 430
    .local v0, "c":I
    const/16 v2, 0x61

    if-gt v2, v0, :cond_0

    const/16 v2, 0x7a

    if-le v0, v2, :cond_4

    :cond_0
    const/16 v2, 0x41

    if-gt v2, v0, :cond_1

    const/16 v2, 0x5a

    if-le v0, v2, :cond_4

    .line 431
    :cond_1
    const/16 v2, 0x30

    if-gt v2, v0, :cond_2

    const/16 v2, 0x39

    if-le v0, v2, :cond_4

    .line 432
    :cond_2
    const/16 v2, 0x5f

    if-eq v0, v2, :cond_4

    .line 438
    .end local v0    # "c":I
    :cond_3
    return v1

    .line 428
    .restart local v0    # "c":I
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static skip_white_space([CII)I
    .locals 3
    .param p0, "array"    # [C
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .prologue
    .line 391
    move v1, p1

    .line 392
    .local v1, "cursor":I
    :goto_0
    if-eq v1, p2, :cond_0

    .line 393
    aget-char v0, p0, v1

    .line 394
    .local v0, "c":I
    invoke-static {v0}, Lorg/mozilla/javascript/tools/idswitch/Main;->is_white_space(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 396
    .end local v0    # "c":I
    :cond_0
    return v1

    .line 392
    .restart local v0    # "c":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static tag_name(I)Ljava/lang/String;
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 45
    packed-switch p0, :pswitch_data_0

    .line 51
    :pswitch_0
    const-string v0, ""

    :goto_0
    return-object v0

    .line 46
    :pswitch_1
    const-string v0, "string_id_map"

    goto :goto_0

    .line 47
    :pswitch_2
    const-string v0, "/string_id_map"

    goto :goto_0

    .line 48
    :pswitch_3
    const-string v0, "generated"

    goto :goto_0

    .line 49
    :pswitch_4
    const-string v0, "/generated"

    goto :goto_0

    .line 45
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method process_file(Ljava/lang/String;)V
    .locals 5
    .param p1, "file_path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iput-object p1, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->source_file:Ljava/lang/String;

    .line 57
    new-instance v4, Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-direct {v4}, Lorg/mozilla/javascript/tools/idswitch/FileBody;-><init>()V

    iput-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    .line 60
    const-string v4, "-"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 61
    sget-object v0, Ljava/lang/System;->in:Ljava/io/InputStream;

    .line 67
    .local v0, "is":Ljava/io/InputStream;
    :goto_0
    :try_start_0
    new-instance v2, Ljava/io/InputStreamReader;

    const-string v4, "ASCII"

    invoke-direct {v2, v0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 68
    .local v2, "r":Ljava/io/Reader;
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v4, v2}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->readData(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 72
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/idswitch/Main;->process_file()V

    .line 74
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v4}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->wasModified()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 76
    const-string v4, "-"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 77
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 84
    .local v1, "os":Ljava/io/OutputStream;
    :goto_1
    :try_start_1
    new-instance v3, Ljava/io/OutputStreamWriter;

    invoke-direct {v3, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 85
    .local v3, "w":Ljava/io/Writer;
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/Main;->body:Lorg/mozilla/javascript/tools/idswitch/FileBody;

    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->writeData(Ljava/io/Writer;)V

    .line 86
    invoke-virtual {v3}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 88
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 90
    .end local v1    # "os":Ljava/io/OutputStream;
    .end local v3    # "w":Ljava/io/Writer;
    :cond_0
    return-void

    .line 64
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v2    # "r":Ljava/io/Reader;
    :cond_1
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .restart local v0    # "is":Ljava/io/InputStream;
    goto :goto_0

    .line 70
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v4

    .line 80
    .restart local v2    # "r":Ljava/io/Reader;
    :cond_2
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .restart local v1    # "os":Ljava/io/OutputStream;
    goto :goto_1

    .line 88
    :catchall_1
    move-exception v4

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v4
.end method
