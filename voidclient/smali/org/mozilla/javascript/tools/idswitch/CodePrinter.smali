.class Lorg/mozilla/javascript/tools/idswitch/CodePrinter;
.super Ljava/lang/Object;
.source "CodePrinter.java"


# static fields
.field private static final LITERAL_CHAR_MAX_SIZE:I = 0x6


# instance fields
.field private buffer:[C

.field private indentStep:I

.field private indentTabSize:I

.field private lineTerminator:Ljava/lang/String;

.field private offset:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-string v0, "\n"

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->lineTerminator:Ljava/lang/String;

    .line 15
    const/4 v0, 0x4

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentStep:I

    .line 16
    const/16 v0, 0x8

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentTabSize:I

    .line 18
    const/16 v0, 0x1000

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    return-void
.end method

.method private add_area(I)I
    .locals 2
    .param p1, "area_size"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->ensure_area(I)I

    move-result v0

    .line 49
    .local v0, "pos":I
    add-int v1, v0, p1

    iput v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    .line 50
    return v0
.end method

.method private static digit_to_hex_letter(I)C
    .locals 1
    .param p0, "d"    # I

    .prologue
    .line 141
    const/16 v0, 0xa

    if-ge p0, v0, :cond_0

    add-int/lit8 v0, p0, 0x30

    :goto_0
    int-to-char v0, v0

    return v0

    :cond_0
    add-int/lit8 v0, p0, 0x37

    goto :goto_0
.end method

.method private ensure_area(I)I
    .locals 6
    .param p1, "area_size"    # I

    .prologue
    const/4 v5, 0x0

    .line 35
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    .line 36
    .local v0, "begin":I
    add-int v1, v0, p1

    .line 37
    .local v1, "end":I
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    array-length v4, v4

    if-le v1, v4, :cond_1

    .line 38
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    array-length v4, v4

    mul-int/lit8 v2, v4, 0x2

    .line 39
    .local v2, "new_capacity":I
    if-le v1, v2, :cond_0

    move v2, v1

    .line 40
    :cond_0
    new-array v3, v2, [C

    .line 41
    .local v3, "tmp":[C
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    invoke-static {v4, v5, v3, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    iput-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    .line 44
    .end local v2    # "new_capacity":I
    .end local v3    # "tmp":[C
    :cond_1
    return v0
.end method

.method private put_string_literal_char(IIZ)I
    .locals 4
    .param p1, "pos"    # I
    .param p2, "c"    # I
    .param p3, "in_string"    # Z

    .prologue
    const/16 v2, 0x5c

    .line 107
    const/4 v0, 0x1

    .line 108
    .local v0, "backslash_symbol":Z
    sparse-switch p2, :sswitch_data_0

    .line 116
    const/4 v0, 0x0

    .line 119
    :goto_0
    if-eqz v0, :cond_1

    .line 120
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char v2, v1, p1

    .line 121
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    int-to-char v3, p2

    aput-char v3, v1, v2

    .line 122
    add-int/lit8 p1, p1, 0x2

    .line 137
    :goto_1
    return p1

    .line 109
    :sswitch_0
    const/16 p2, 0x62

    goto :goto_0

    .line 110
    :sswitch_1
    const/16 p2, 0x74

    goto :goto_0

    .line 111
    :sswitch_2
    const/16 p2, 0x6e

    goto :goto_0

    .line 112
    :sswitch_3
    const/16 p2, 0x66

    goto :goto_0

    .line 113
    :sswitch_4
    const/16 p2, 0x72

    goto :goto_0

    .line 114
    :sswitch_5
    if-nez p3, :cond_0

    const/4 v0, 0x1

    :goto_2
    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_2

    .line 115
    :sswitch_6
    move v0, p3

    goto :goto_0

    .line 124
    :cond_1
    const/16 v1, 0x20

    if-gt v1, p2, :cond_2

    const/16 v1, 0x7e

    if-gt p2, v1, :cond_2

    .line 125
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    int-to-char v2, p2

    aput-char v2, v1, p1

    .line 126
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 129
    :cond_2
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char v2, v1, p1

    .line 130
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    const/16 v3, 0x75

    aput-char v3, v1, v2

    .line 131
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    add-int/lit8 v2, p1, 0x2

    shr-int/lit8 v3, p2, 0xc

    and-int/lit8 v3, v3, 0xf

    invoke-static {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->digit_to_hex_letter(I)C

    move-result v3

    aput-char v3, v1, v2

    .line 132
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    add-int/lit8 v2, p1, 0x3

    shr-int/lit8 v3, p2, 0x8

    and-int/lit8 v3, v3, 0xf

    invoke-static {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->digit_to_hex_letter(I)C

    move-result v3

    aput-char v3, v1, v2

    .line 133
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    add-int/lit8 v2, p1, 0x4

    shr-int/lit8 v3, p2, 0x4

    and-int/lit8 v3, v3, 0xf

    invoke-static {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->digit_to_hex_letter(I)C

    move-result v3

    aput-char v3, v1, v2

    .line 134
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    add-int/lit8 v2, p1, 0x5

    and-int/lit8 v3, p2, 0xf

    invoke-static {v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->digit_to_hex_letter(I)C

    move-result v3

    aput-char v3, v1, v2

    .line 135
    add-int/lit8 p1, p1, 0x6

    goto :goto_1

    .line 108
    nop

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_0
        0x9 -> :sswitch_1
        0xa -> :sswitch_2
        0xc -> :sswitch_3
        0xd -> :sswitch_4
        0x22 -> :sswitch_6
        0x27 -> :sswitch_5
    .end sparse-switch
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    .line 32
    return-void
.end method

.method public erase(II)V
    .locals 3
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    iget v2, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    sub-int/2addr v2, p2

    invoke-static {v0, p2, v1, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 171
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    sub-int v1, p2, p1

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    .line 172
    return-void
.end method

.method public getIndentStep()I
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentStep:I

    return v0
.end method

.method public getIndentTabSize()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentTabSize:I

    return v0
.end method

.method public getLastChar()I
    .locals 2

    .prologue
    .line 58
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    if-nez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    iget v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    add-int/lit8 v1, v1, -0x1

    aget-char v0, v0, v1

    goto :goto_0
.end method

.method public getLineTerminator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->lineTerminator:Ljava/lang/String;

    return-object v0
.end method

.method public getOffset()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    return v0
.end method

.method public indent(I)V
    .locals 8
    .param p1, "level"    # I

    .prologue
    .line 145
    iget v6, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentStep:I

    mul-int v5, v6, p1

    .line 147
    .local v5, "visible_size":I
    iget v6, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentTabSize:I

    if-gtz v6, :cond_0

    .line 148
    const/4 v3, 0x0

    .local v3, "tab_count":I
    move v1, v5

    .line 154
    .local v1, "indent_size":I
    :goto_0
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->add_area(I)I

    move-result v2

    .line 155
    .local v2, "pos":I
    add-int v4, v2, v3

    .line 156
    .local v4, "tab_end":I
    add-int v0, v2, v1

    .line 157
    .local v0, "indent_end":I
    :goto_1
    if-eq v2, v4, :cond_1

    iget-object v6, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    const/16 v7, 0x9

    aput-char v7, v6, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 151
    .end local v0    # "indent_end":I
    .end local v1    # "indent_size":I
    .end local v2    # "pos":I
    .end local v3    # "tab_count":I
    .end local v4    # "tab_end":I
    :cond_0
    iget v6, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentTabSize:I

    div-int v3, v5, v6

    .line 152
    .restart local v3    # "tab_count":I
    iget v6, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentTabSize:I

    rem-int v6, v5, v6

    add-int v1, v3, v6

    .restart local v1    # "indent_size":I
    goto :goto_0

    .line 158
    .restart local v0    # "indent_end":I
    .restart local v2    # "pos":I
    .restart local v4    # "tab_end":I
    :cond_1
    :goto_2
    if-eq v2, v0, :cond_2

    iget-object v6, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    const/16 v7, 0x20

    aput-char v7, v6, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 159
    :cond_2
    return-void
.end method

.method public line(ILjava/lang/String;)V
    .locals 0
    .param p1, "indent_level"    # I
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 166
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indent(I)V

    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->nl()V

    .line 167
    return-void
.end method

.method public nl()V
    .locals 1

    .prologue
    .line 162
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(C)V

    .line 163
    return-void
.end method

.method public p(C)V
    .locals 2
    .param p1, "c"    # C

    .prologue
    .line 62
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->add_area(I)I

    move-result v0

    .line 63
    .local v0, "pos":I
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char p1, v1, v0

    .line 64
    return-void
.end method

.method public p(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 83
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 68
    .local v0, "l":I
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->add_area(I)I

    move-result v1

    .line 69
    .local v1, "pos":I
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    invoke-virtual {p1, v2, v0, v3, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 70
    return-void
.end method

.method public final p([C)V
    .locals 2
    .param p1, "array"    # [C

    .prologue
    .line 73
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->p([CII)V

    .line 74
    return-void
.end method

.method public p([CII)V
    .locals 3
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .prologue
    .line 77
    sub-int v0, p3, p2

    .line 78
    .local v0, "l":I
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->add_area(I)I

    move-result v1

    .line 79
    .local v1, "pos":I
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    invoke-static {p1, p2, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    return-void
.end method

.method public qchar(I)V
    .locals 4
    .param p1, "c"    # I

    .prologue
    const/16 v3, 0x27

    .line 87
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->ensure_area(I)I

    move-result v0

    .line 88
    .local v0, "pos":I
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char v3, v1, v0

    .line 89
    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v1, p1, v2}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->put_string_literal_char(IIZ)I

    move-result v0

    .line 90
    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char v3, v1, v0

    .line 91
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    .line 92
    return-void
.end method

.method public qstring(Ljava/lang/String;)V
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x22

    .line 95
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 96
    .local v1, "l":I
    mul-int/lit8 v3, v1, 0x6

    add-int/lit8 v3, v3, 0x2

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->ensure_area(I)I

    move-result v2

    .line 97
    .local v2, "pos":I
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char v5, v3, v2

    .line 98
    add-int/lit8 v2, v2, 0x1

    .line 99
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, v1, :cond_0

    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/4 v4, 0x1

    invoke-direct {p0, v2, v3, v4}, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->put_string_literal_char(IIZ)I

    move-result v2

    .line 99
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_0
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    aput-char v5, v3, v2

    .line 103
    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    .line 104
    return-void
.end method

.method public setIndentStep(I)V
    .locals 0
    .param p1, "char_count"    # I

    .prologue
    .line 25
    iput p1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentStep:I

    return-void
.end method

.method public setIndentTabSize(I)V
    .locals 0
    .param p1, "tab_size"    # I

    .prologue
    .line 28
    iput p1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->indentTabSize:I

    return-void
.end method

.method public setLineTerminator(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->lineTerminator:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 176
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/mozilla/javascript/tools/idswitch/CodePrinter;->offset:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
