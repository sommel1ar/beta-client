.class public Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;
.super Ljava/lang/Object;
.source "SwitchGenerator.java"


# instance fields
.field private P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

.field private R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

.field private c_was_defined:Z

.field char_tail_test_threshold:I

.field private columns:[I

.field private default_value:Ljava/lang/String;

.field private pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

.field private source_file:Ljava/lang/String;

.field use_if_threshold:I

.field v_c:Ljava/lang/String;

.field v_guess:Ljava/lang/String;

.field v_id:Ljava/lang/String;

.field v_label:Ljava/lang/String;

.field v_length_suffix:Ljava/lang/String;

.field v_s:Ljava/lang/String;

.field v_switch_label:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-string v0, "L0"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    .line 14
    const-string v0, "L"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    .line 15
    const-string v0, "s"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    .line 16
    const-string v0, "c"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    .line 17
    const-string v0, "X"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    .line 18
    const-string v0, "id"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    .line 19
    const-string v0, "_length"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_length_suffix:Ljava/lang/String;

    .line 21
    const/4 v0, 0x3

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->use_if_threshold:I

    .line 22
    const/4 v0, 0x2

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->char_tail_test_threshold:I

    return-void
.end method

.method private static bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z
    .locals 5
    .param p0, "a"    # Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p1, "b"    # Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p2, "comparator"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 372
    if-gez p2, :cond_3

    .line 376
    iget v3, p0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    iget v4, p1, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    sub-int v0, v3, v4

    .line 377
    .local v0, "diff":I
    if-eqz v0, :cond_2

    if-lez v0, :cond_1

    .line 381
    .end local v0    # "diff":I
    :cond_0
    :goto_0
    return v1

    .restart local v0    # "diff":I
    :cond_1
    move v1, v2

    .line 377
    goto :goto_0

    .line 378
    :cond_2
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    iget-object v4, p1, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-gtz v3, :cond_0

    move v1, v2

    goto :goto_0

    .line 381
    .end local v0    # "diff":I
    :cond_3
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    iget-object v4, p1, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v4, p2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-gt v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method private check_all_is_different(II)V
    .locals 4
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .prologue
    .line 345
    if-eq p1, p2, :cond_1

    .line 346
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v1, v2, p1

    .line 347
    .local v1, "prev":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :goto_0
    add-int/lit8 p1, p1, 0x1

    if-eq p1, p2, :cond_1

    .line 348
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v0, v2, p1

    .line 349
    .local v0, "current":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    iget-object v2, v1, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 350
    invoke-direct {p0, v1, v0}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->on_same_pair_fail(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 352
    :cond_0
    move-object v1, v0

    .line 353
    goto :goto_0

    .line 355
    .end local v0    # "current":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .end local v1    # "prev":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :cond_1
    return-void
.end method

.method private count_different_chars(III)I
    .locals 4
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "column"    # I

    .prologue
    .line 333
    const/4 v1, 0x0

    .line 334
    .local v1, "chars_count":I
    const/4 v2, -0x1

    .line 335
    .local v2, "cur_ch":I
    :goto_0
    if-eq p1, p2, :cond_1

    .line 336
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v3, v3, p1

    iget-object v3, v3, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 337
    .local v0, "ch":I
    if-eq v0, v2, :cond_0

    .line 338
    add-int/lit8 v1, v1, 0x1

    move v2, v0

    .line 335
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 341
    .end local v0    # "ch":I
    :cond_1
    return v1
.end method

.method private count_different_lengths(II)I
    .locals 4
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .prologue
    .line 299
    const/4 v2, 0x0

    .line 300
    .local v2, "lengths_count":I
    const/4 v0, -0x1

    .line 301
    .local v0, "cur_l":I
    :goto_0
    if-eq p1, p2, :cond_1

    .line 302
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v3, v3, p1

    iget v1, v3, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    .line 303
    .local v1, "l":I
    if-eq v0, v1, :cond_0

    .line 304
    add-int/lit8 v2, v2, 0x1

    move v0, v1

    .line 301
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 307
    .end local v1    # "l":I
    :cond_1
    return v2
.end method

.method private find_max_different_column(III)I
    .locals 6
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "L"    # I

    .prologue
    .line 311
    const/4 v3, 0x0

    .line 312
    .local v3, "max_count":I
    const/4 v4, 0x0

    .line 314
    .local v4, "max_index":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, p3, :cond_2

    .line 315
    iget-object v5, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    aget v0, v5, v2

    .line 316
    .local v0, "column":I
    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->sort_pairs(III)V

    .line 317
    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->count_different_chars(III)I

    move-result v1

    .line 318
    .local v1, "count":I
    sub-int v5, p2, p1

    if-ne v1, v5, :cond_0

    .line 329
    .end local v0    # "column":I
    .end local v1    # "count":I
    .end local v2    # "i":I
    :goto_1
    return v2

    .line 319
    .restart local v0    # "column":I
    .restart local v1    # "count":I
    .restart local v2    # "i":I
    :cond_0
    if-ge v3, v1, :cond_1

    .line 320
    move v3, v1

    .line 321
    move v4, v2

    .line 314
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 325
    .end local v0    # "column":I
    .end local v1    # "count":I
    :cond_2
    add-int/lit8 v5, p3, -0x1

    if-eq v4, v5, :cond_3

    .line 326
    iget-object v5, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    aget v5, v5, v4

    invoke-direct {p0, p1, p2, v5}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->sort_pairs(III)V

    :cond_3
    move v2, v4

    .line 329
    goto :goto_1
.end method

.method private generate_body(III)V
    .locals 4
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "indent_level"    # I

    .prologue
    .line 63
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2, p3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 64
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, ": { "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 65
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, " = "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->default_value:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 66
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, "; String "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, " = null;"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 68
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->c_was_defined:Z

    .line 69
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->getOffset()I

    move-result v0

    .line 70
    .local v0, "c_def_begin":I
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, " int "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const/16 v3, 0x3b

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(C)V

    .line 71
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->getOffset()I

    move-result v1

    .line 72
    .local v1, "c_def_end":I
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 74
    add-int/lit8 v2, p3, 0x1

    invoke-direct {p0, p1, p2, v2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generate_length_switch(III)V

    .line 76
    iget-boolean v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->c_was_defined:Z

    if-nez v2, :cond_0

    .line 77
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2, v0, v1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->erase(II)V

    .line 80
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    add-int/lit8 v3, p3, 0x1

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 81
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, "if ("

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, "!=null && "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 82
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, "!="

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 83
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, " && !"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, ".equals("

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, ")) "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 84
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, " = "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->default_value:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, ";"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 87
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    add-int/lit8 v3, p3, 0x1

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 88
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, "break "

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, ";"

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 90
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v3, "}"

    invoke-virtual {v2, p3, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->line(ILjava/lang/String;)V

    .line 91
    return-void
.end method

.method private generate_length_switch(III)V
    .locals 10
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "indent_level"    # I

    .prologue
    const/4 v9, 0x1

    .line 95
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->sort_pairs(III)V

    .line 97
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->check_all_is_different(II)V

    .line 99
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->count_different_lengths(II)I

    move-result v8

    .line 101
    .local v8, "lengths_count":I
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    add-int/lit8 v4, p2, -0x1

    aget-object v0, v0, v4

    iget v0, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    .line 104
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->use_if_threshold:I

    if-gt v8, v0, :cond_5

    .line 105
    const/4 v5, 0x1

    .line 106
    .local v5, "use_if":Z
    if-eq v8, v9, :cond_0

    .line 107
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, p3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 108
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "int "

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_length_suffix:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, " = "

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ".length();"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 110
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 121
    :cond_0
    :goto_0
    move v1, p1

    .line 122
    .local v1, "same_length_begin":I
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v0, v0, p1

    iget v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    .local v6, "cur_l":I
    const/4 v7, 0x0

    .line 123
    .local v7, "l":I
    move v2, p1

    .line 124
    .local v2, "i":I
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 125
    if-eq v2, p2, :cond_2

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v0, v0, v2

    iget v7, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    if-eq v7, v6, :cond_1

    .line 127
    :cond_2
    if-eqz v5, :cond_7

    .line 128
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, p3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 129
    if-eq v1, p1, :cond_3

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "else "

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 130
    :cond_3
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "if ("

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 131
    if-ne v8, v9, :cond_6

    .line 132
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ".length()=="

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 137
    :goto_2
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(I)V

    .line 138
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ") {"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 139
    add-int/lit8 v3, p3, 0x1

    .line 146
    .local v3, "next_indent":I
    :goto_3
    if-nez v5, :cond_8

    move v4, v9

    :goto_4
    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generate_letter_switch(IIIZZ)V

    .line 148
    if-eqz v5, :cond_9

    .line 149
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "}"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 155
    :goto_5
    if-ne v2, p2, :cond_a

    .line 161
    if-nez v5, :cond_4

    .line 162
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, p3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "}"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 165
    :cond_4
    return-void

    .line 114
    .end local v1    # "same_length_begin":I
    .end local v2    # "i":I
    .end local v3    # "next_indent":I
    .end local v5    # "use_if":Z
    .end local v6    # "cur_l":I
    .end local v7    # "l":I
    :cond_5
    const/4 v5, 0x0

    .line 115
    .restart local v5    # "use_if":Z
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, p3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 116
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ": switch ("

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ".length()) {"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    goto/16 :goto_0

    .line 135
    .restart local v1    # "same_length_begin":I
    .restart local v2    # "i":I
    .restart local v6    # "cur_l":I
    .restart local v7    # "l":I
    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_length_suffix:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "=="

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto :goto_2

    .line 142
    :cond_7
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, p3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 143
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "case "

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(I)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ":"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 144
    add-int/lit8 v3, p3, 0x1

    .restart local v3    # "next_indent":I
    goto/16 :goto_3

    .line 146
    :cond_8
    const/4 v4, 0x0

    goto/16 :goto_4

    .line 152
    :cond_9
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, "break "

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v4, ";"

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    goto/16 :goto_5

    .line 156
    :cond_a
    move v1, v2

    .line 157
    move v6, v7

    .line 158
    goto/16 :goto_1
.end method

.method private generate_letter_switch(IIIZZ)V
    .locals 8
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "indent_level"    # I
    .param p4, "label_was_defined"    # Z
    .param p5, "inside_if"    # Z

    .prologue
    .line 171
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v0, v0, p1

    iget v3, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->idLength:I

    .line 173
    .local v3, "L":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-eq v7, v3, :cond_0

    .line 174
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    aput v7, v0, v7

    .line 173
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_0
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .line 177
    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generate_letter_switch_r(IIIIZZ)Z

    .line 179
    return-void
.end method

.method private generate_letter_switch_r(IIIIZZ)Z
    .locals 20
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "L"    # I
    .param p4, "indent_level"    # I
    .param p5, "label_was_defined"    # Z
    .param p6, "inside_if"    # Z

    .prologue
    .line 186
    const/16 v17, 0x0

    .line 187
    .local v17, "next_is_unreachable":Z
    add-int/lit8 v3, p1, 0x1

    move/from16 v0, p2

    if-ne v3, v0, :cond_3

    .line 188
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const/16 v6, 0x20

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(C)V

    .line 189
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v19, v3, p1

    .line 190
    .local v19, "pair":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->char_tail_test_threshold:I

    move/from16 v0, p3

    if-le v0, v3, :cond_0

    .line 191
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, v19

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->qstring(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ";"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 192
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, v19

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->value:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ";"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 216
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const/16 v6, 0x20

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(C)V

    move/from16 v18, v17

    .line 294
    .end local v17    # "next_is_unreachable":Z
    .end local v19    # "pair":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .local v18, "next_is_unreachable":I
    :goto_1
    return v18

    .line 195
    .end local v18    # "next_is_unreachable":I
    .restart local v17    # "next_is_unreachable":Z
    .restart local v19    # "pair":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :cond_0
    if-nez p3, :cond_1

    .line 196
    const/16 v17, 0x1

    .line 197
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, v19

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->value:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "; break "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ";"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto :goto_0

    .line 201
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "if ("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 202
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    const/4 v6, 0x0

    aget v12, v3, v6

    .line 203
    .local v12, "column":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ".charAt("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v12}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ")=="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 204
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, v19

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v6, v12}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->qchar(I)V

    .line 205
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_2
    move/from16 v0, p3

    if-eq v5, v0, :cond_2

    .line 206
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, " && "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 207
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    aget v12, v3, v5

    .line 208
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ".charAt("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v12}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ")=="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 209
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, v19

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v6, v12}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->qchar(I)V

    .line 205
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 211
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ") {"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, v19

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->value:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 213
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "; break "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ";}"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 220
    .end local v5    # "i":I
    .end local v12    # "column":I
    .end local v19    # "pair":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :cond_3
    invoke-direct/range {p0 .. p3}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->find_max_different_column(III)I

    move-result v16

    .line 221
    .local v16, "max_column_index":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    aget v15, v3, v16

    .line 222
    .local v15, "max_column":I
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-direct {v0, v1, v2, v15}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->count_different_chars(III)I

    move-result v13

    .line 224
    .local v13, "count":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    add-int/lit8 v8, p3, -0x1

    aget v6, v6, v8

    aput v6, v3, v16

    .line 226
    if-eqz p6, :cond_8

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move/from16 v0, p4

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 230
    :goto_3
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->use_if_threshold:I

    if-gt v13, v3, :cond_9

    .line 231
    const/4 v9, 0x1

    .line 232
    .local v9, "use_if":Z
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->c_was_defined:Z

    .line 233
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 234
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ".charAt("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v15}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ");"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 246
    :goto_4
    move/from16 v4, p1

    .line 247
    .local v4, "same_char_begin":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v3, v3, p1

    iget-object v3, v3, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/String;->charAt(I)C

    move-result v14

    .local v14, "cur_ch":I
    const/4 v11, 0x0

    .line 248
    .local v11, "ch":I
    move/from16 v5, p1

    .line 249
    .restart local v5    # "i":I
    :cond_4
    :goto_5
    add-int/lit8 v5, v5, 0x1

    .line 250
    move/from16 v0, p2

    if-eq v5, v0, :cond_5

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    aget-object v3, v3, v5

    iget-object v3, v3, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-eq v11, v14, :cond_4

    .line 252
    :cond_5
    if-eqz v9, :cond_b

    .line 253
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move/from16 v0, p4

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 254
    move/from16 v0, p1

    if-eq v4, v0, :cond_6

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "else "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 255
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "if ("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "=="

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 256
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v14}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->qchar(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ") {"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 257
    add-int/lit8 v7, p4, 0x1

    .line 264
    .local v7, "next_indent":I
    :goto_6
    add-int/lit8 v6, p3, -0x1

    move-object/from16 v3, p0

    move/from16 v8, p5

    invoke-direct/range {v3 .. v9}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generate_letter_switch_r(IIIIZZ)Z

    move-result v10

    .line 267
    .local v10, "after_unreachable":Z
    if-eqz v9, :cond_c

    .line 268
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "}"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 275
    :cond_7
    :goto_7
    move/from16 v0, p2

    if-ne v5, v0, :cond_d

    .line 281
    if-eqz v9, :cond_f

    .line 282
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 283
    if-eqz p6, :cond_e

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    add-int/lit8 v6, p4, -0x1

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 292
    :goto_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->columns:[I

    aput v15, v3, v16

    move/from16 v18, v17

    .line 294
    .restart local v18    # "next_is_unreachable":I
    goto/16 :goto_1

    .line 227
    .end local v4    # "same_char_begin":I
    .end local v5    # "i":I
    .end local v7    # "next_indent":I
    .end local v9    # "use_if":Z
    .end local v10    # "after_unreachable":Z
    .end local v11    # "ch":I
    .end local v14    # "cur_ch":I
    .end local v18    # "next_is_unreachable":I
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const/16 v6, 0x20

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(C)V

    goto/16 :goto_3

    .line 237
    :cond_9
    const/4 v9, 0x0

    .line 238
    .restart local v9    # "use_if":Z
    if-nez p5, :cond_a

    .line 239
    const/16 p5, 0x1

    .line 240
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ": "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 242
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "switch ("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 243
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ".charAt("

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v15}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ")) {"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 260
    .restart local v4    # "same_char_begin":I
    .restart local v5    # "i":I
    .restart local v11    # "ch":I
    .restart local v14    # "cur_ch":I
    :cond_b
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move/from16 v0, p4

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    .line 261
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "case "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v14}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->qchar(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ":"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 262
    add-int/lit8 v7, p4, 0x1

    .restart local v7    # "next_indent":I
    goto/16 :goto_6

    .line 271
    .restart local v10    # "after_unreachable":Z
    :cond_c
    if-nez v10, :cond_7

    .line 272
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "break "

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, ";"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 276
    :cond_d
    move v4, v5

    .line 277
    move v14, v11

    .line 278
    goto/16 :goto_5

    .line 284
    :cond_e
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move/from16 v0, p4

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    goto/16 :goto_8

    .line 287
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    move/from16 v0, p4

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const-string v6, "}"

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 288
    if-eqz p6, :cond_10

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    add-int/lit8 v6, p4, -0x1

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    goto/16 :goto_8

    .line 289
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    const/16 v6, 0x20

    invoke-virtual {v3, v6}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(C)V

    goto/16 :goto_8
.end method

.method private static heap4Sort([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;III)V
    .locals 4
    .param p0, "array"    # [Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p1, "offset"    # I
    .param p2, "size"    # I
    .param p3, "comparator"    # I

    .prologue
    const/4 v3, 0x1

    .line 388
    if-gt p2, v3, :cond_1

    .line 398
    :cond_0
    return-void

    .line 389
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->makeHeap4([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;III)V

    .line 390
    :goto_0
    if-le p2, v3, :cond_0

    .line 391
    add-int/lit8 p2, p2, -0x1

    .line 392
    add-int v2, p1, p2

    aget-object v0, p0, v2

    .line 393
    .local v0, "v1":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    add-int/lit8 v2, p1, 0x0

    aget-object v1, p0, v2

    .line 394
    .local v1, "v2":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    add-int v2, p1, p2

    aput-object v1, p0, v2

    .line 395
    add-int/lit8 v2, p1, 0x0

    aput-object v0, p0, v2

    .line 396
    const/4 v2, 0x0

    invoke-static {p0, p1, p2, v2, p3}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->heapify4([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;IIII)V

    goto :goto_0
.end method

.method private static heapify4([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;IIII)V
    .locals 11
    .param p0, "array"    # [Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p1, "offset"    # I
    .param p2, "size"    # I
    .param p3, "i"    # I
    .param p4, "comparator"    # I

    .prologue
    .line 413
    add-int v10, p1, p3

    aget-object v1, p0, v10

    .line 415
    .local v1, "i_val":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :goto_0
    shl-int/lit8 v0, p3, 0x2

    .line 416
    .local v0, "base":I
    or-int/lit8 v2, v0, 0x1

    .line 417
    .local v2, "new_i1":I
    or-int/lit8 v3, v0, 0x2

    .line 418
    .local v3, "new_i2":I
    or-int/lit8 v4, v0, 0x3

    .line 419
    .local v4, "new_i3":I
    add-int/lit8 v5, v0, 0x4

    .line 420
    .local v5, "new_i4":I
    if-lt v5, p2, :cond_3

    .line 439
    if-ge v2, p2, :cond_2

    .line 440
    add-int v10, p1, v2

    aget-object v6, p0, v10

    .line 441
    .local v6, "val1":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    if-eq v3, p2, :cond_1

    .line 442
    add-int v10, p1, v3

    aget-object v7, p0, v10

    .line 443
    .local v7, "val2":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    invoke-static {v7, v6, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 444
    move-object v6, v7

    move v2, v3

    .line 446
    :cond_0
    if-eq v4, p2, :cond_1

    .line 447
    add-int v10, p1, v4

    aget-object v8, p0, v10

    .line 448
    .local v8, "val3":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    invoke-static {v8, v6, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 449
    move-object v6, v8

    move v2, v4

    .line 453
    .end local v7    # "val2":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .end local v8    # "val3":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :cond_1
    invoke-static {v6, v1, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 454
    add-int v10, p1, p3

    aput-object v6, p0, v10

    .line 455
    add-int v10, p1, v2

    aput-object v1, p0, v10

    .line 458
    .end local v6    # "val1":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    :cond_2
    return-void

    .line 421
    :cond_3
    add-int v10, p1, v2

    aget-object v6, p0, v10

    .line 422
    .restart local v6    # "val1":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    add-int v10, p1, v3

    aget-object v7, p0, v10

    .line 423
    .restart local v7    # "val2":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    add-int v10, p1, v4

    aget-object v8, p0, v10

    .line 424
    .restart local v8    # "val3":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    add-int v10, p1, v5

    aget-object v9, p0, v10

    .line 425
    .local v9, "val4":Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    invoke-static {v7, v6, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 426
    move-object v6, v7

    move v2, v3

    .line 428
    :cond_4
    invoke-static {v9, v8, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 429
    move-object v8, v9

    move v4, v5

    .line 431
    :cond_5
    invoke-static {v8, v6, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 432
    move-object v6, v8

    move v2, v4

    .line 434
    :cond_6
    invoke-static {v1, v6, p4}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->bigger(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-nez v10, :cond_2

    .line 435
    add-int v10, p1, p3

    aput-object v6, p0, v10

    .line 436
    add-int v10, p1, v2

    aput-object v1, p0, v10

    .line 437
    move p3, v2

    .line 438
    goto :goto_0
.end method

.method private static makeHeap4([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;III)V
    .locals 2
    .param p0, "array"    # [Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p1, "offset"    # I
    .param p2, "size"    # I
    .param p3, "comparator"    # I

    .prologue
    .line 403
    add-int/lit8 v1, p2, 0x2

    shr-int/lit8 v0, v1, 0x2

    .local v0, "i":I
    :goto_0
    if-eqz v0, :cond_0

    .line 404
    add-int/lit8 v0, v0, -0x1

    .line 405
    invoke-static {p0, p1, p2, v0, p3}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->heapify4([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;IIII)V

    goto :goto_0

    .line 407
    :cond_0
    return-void
.end method

.method private on_same_pair_fail(Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Lorg/mozilla/javascript/tools/idswitch/IdValuePair;)Lorg/mozilla/javascript/EvaluatorException;
    .locals 8
    .param p1, "a"    # Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p2, "b"    # Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    .prologue
    .line 358
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->getLineNumber()I

    move-result v3

    .local v3, "line1":I
    invoke-virtual {p2}, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->getLineNumber()I

    move-result v6

    .line 359
    .local v6, "line2":I
    if-le v6, v3, :cond_0

    move v7, v3

    .local v7, "tmp":I
    move v3, v6

    move v6, v7

    .line 360
    .end local v7    # "tmp":I
    :cond_0
    const-string v0, "msg.idswitch.same_string"

    iget-object v2, p1, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {v0, v2, v4}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 362
    .local v1, "error_text":Ljava/lang/String;
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->source_file:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    return-object v0
.end method

.method private sort_pairs(III)V
    .locals 2
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "comparator"    # I

    .prologue
    .line 366
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    sub-int v1, p2, p1

    invoke-static {v0, p1, v1, p3}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->heap4Sort([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;III)V

    .line 367
    return-void
.end method


# virtual methods
.method public generateSwitch([Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "pairs"    # [Ljava/lang/String;
    .param p2, "default_value"    # Ljava/lang/String;

    .prologue
    .line 43
    array-length v3, p1

    div-int/lit8 v0, v3, 0x2

    .line 44
    .local v0, "N":I
    new-array v2, v0, [Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    .line 45
    .local v2, "id_pairs":[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 46
    new-instance v3, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    mul-int/lit8 v4, v1, 0x2

    aget-object v4, p1, v4

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x1

    aget-object v5, p1, v5

    invoke-direct {v3, v4, v5}, Lorg/mozilla/javascript/tools/idswitch/IdValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v3, v2, v1

    .line 45
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0, v2, p2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generateSwitch([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public generateSwitch([Lorg/mozilla/javascript/tools/idswitch/IdValuePair;Ljava/lang/String;)V
    .locals 3
    .param p1, "pairs"    # [Lorg/mozilla/javascript/tools/idswitch/IdValuePair;
    .param p2, "default_value"    # Ljava/lang/String;

    .prologue
    .line 53
    const/4 v0, 0x0

    .line 54
    .local v0, "begin":I
    array-length v1, p1

    .line 55
    .local v1, "end":I
    if-ne v0, v1, :cond_0

    .line 60
    :goto_0
    return-void

    .line 56
    :cond_0
    iput-object p1, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->pairs:[Lorg/mozilla/javascript/tools/idswitch/IdValuePair;

    .line 57
    iput-object p2, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->default_value:Ljava/lang/String;

    .line 59
    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->generate_body(III)V

    goto :goto_0
.end method

.method public getCodePrinter()Lorg/mozilla/javascript/tools/idswitch/CodePrinter;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    return-object v0
.end method

.method public getReporter()Lorg/mozilla/javascript/tools/ToolErrorReporter;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    return-object v0
.end method

.method public getSourceFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->source_file:Ljava/lang/String;

    return-object v0
.end method

.method public setCodePrinter(Lorg/mozilla/javascript/tools/idswitch/CodePrinter;)V
    .locals 0
    .param p1, "value"    # Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    .prologue
    .line 34
    iput-object p1, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->P:Lorg/mozilla/javascript/tools/idswitch/CodePrinter;

    return-void
.end method

.method public setReporter(Lorg/mozilla/javascript/tools/ToolErrorReporter;)V
    .locals 0
    .param p1, "value"    # Lorg/mozilla/javascript/tools/ToolErrorReporter;

    .prologue
    .line 37
    iput-object p1, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->R:Lorg/mozilla/javascript/tools/ToolErrorReporter;

    return-void
.end method

.method public setSourceFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lorg/mozilla/javascript/tools/idswitch/SwitchGenerator;->source_file:Ljava/lang/String;

    return-void
.end method
