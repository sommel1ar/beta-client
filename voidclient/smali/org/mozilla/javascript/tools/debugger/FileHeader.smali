.class Lorg/mozilla/javascript/tools/debugger/FileHeader;
.super Ljavax/swing/JPanel;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/MouseListener;


# static fields
.field private static final serialVersionUID:J = -0x27acdf518a40a2b7L


# instance fields
.field private fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

.field private pressLine:I


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/FileWindow;)V
    .locals 1
    .param p1, "fileWindow"    # Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .prologue
    .line 1908
    invoke-direct {p0}, Ljavax/swing/JPanel;-><init>()V

    .line 1898
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->pressLine:I

    .line 1909
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    .line 1910
    invoke-virtual {p0, p0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1911
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->update()V

    .line 1912
    return-void
.end method


# virtual methods
.method public mouseClicked(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 2024
    return-void
.end method

.method public mouseEntered(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 2008
    return-void
.end method

.method public mouseExited(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 2030
    return-void
.end method

.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 2014
    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    iget-object v3, v3, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v3}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v0

    .line 2015
    .local v0, "font":Ljava/awt/Font;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v2

    .line 2016
    .local v2, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual {v2}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v1

    .line 2017
    .local v1, "h":I
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v3

    div-int/2addr v3, v1

    iput v3, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->pressLine:I

    .line 2018
    return-void
.end method

.method public mouseReleased(Ljava/awt/event/MouseEvent;)V
    .locals 7
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 2036
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getComponent()Ljava/awt/Component;

    move-result-object v5

    if-ne v5, p0, :cond_0

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v5

    and-int/lit8 v5, v5, 0x10

    if-eqz v5, :cond_0

    .line 2038
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v4

    .line 2039
    .local v4, "y":I
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    iget-object v5, v5, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v5}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v0

    .line 2040
    .local v0, "font":Ljava/awt/Font;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v3

    .line 2041
    .local v3, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual {v3}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v1

    .line 2042
    .local v1, "h":I
    div-int v2, v4, v1

    .line 2043
    .local v2, "line":I
    iget v5, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->pressLine:I

    if-ne v2, v5, :cond_1

    .line 2044
    iget-object v5, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->toggleBreakPoint(I)V

    .line 2049
    .end local v0    # "font":Ljava/awt/Font;
    .end local v1    # "h":I
    .end local v2    # "line":I
    .end local v3    # "metrics":Ljava/awt/FontMetrics;
    .end local v4    # "y":I
    :cond_0
    :goto_0
    return-void

    .line 2046
    .restart local v0    # "font":Ljava/awt/Font;
    .restart local v1    # "h":I
    .restart local v2    # "line":I
    .restart local v3    # "metrics":Ljava/awt/FontMetrics;
    .restart local v4    # "y":I
    :cond_1
    const/4 v5, -0x1

    iput v5, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->pressLine:I

    goto :goto_0
.end method

.method public paint(Ljava/awt/Graphics;)V
    .locals 29
    .param p1, "g"    # Ljava/awt/Graphics;

    .prologue
    .line 1940
    invoke-super/range {p0 .. p1}, Ljavax/swing/JPanel;->paint(Ljava/awt/Graphics;)V

    .line 1941
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    move-object/from16 v21, v0

    .line 1942
    .local v21, "textArea":Lorg/mozilla/javascript/tools/debugger/FileTextArea;
    invoke-virtual/range {v21 .. v21}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v12

    .line 1943
    .local v12, "font":Ljava/awt/Font;
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/awt/Graphics;->setFont(Ljava/awt/Font;)V

    .line 1944
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v17

    .line 1945
    .local v17, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Graphics;->getClipBounds()Ljava/awt/Rectangle;

    move-result-object v7

    .line 1946
    .local v7, "clip":Ljava/awt/Rectangle;
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->getBackground()Ljava/awt/Color;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 1947
    iget v0, v7, Ljava/awt/Rectangle;->x:I

    move/from16 v25, v0

    iget v0, v7, Ljava/awt/Rectangle;->y:I

    move/from16 v26, v0

    iget v0, v7, Ljava/awt/Rectangle;->width:I

    move/from16 v27, v0

    iget v0, v7, Ljava/awt/Rectangle;->height:I

    move/from16 v28, v0

    move-object/from16 v0, p1

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/awt/Graphics;->fillRect(IIII)V

    .line 1948
    invoke-virtual/range {v17 .. v17}, Ljava/awt/FontMetrics;->getMaxAscent()I

    move-result v6

    .line 1949
    .local v6, "ascent":I
    invoke-virtual/range {v17 .. v17}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v13

    .line 1950
    .local v13, "h":I
    invoke-virtual/range {v21 .. v21}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineCount()I

    move-result v25

    add-int/lit8 v16, v25, 0x1

    .line 1951
    .local v16, "lineCount":I
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    .line 1952
    .local v8, "dummy":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v25

    const/16 v26, 0x2

    move/from16 v0, v25

    move/from16 v1, v26

    if-ge v0, v1, :cond_0

    .line 1953
    const-string v8, "99"

    .line 1955
    :cond_0
    iget v0, v7, Ljava/awt/Rectangle;->y:I

    move/from16 v25, v0

    div-int v19, v25, v13

    .line 1956
    .local v19, "startLine":I
    iget v0, v7, Ljava/awt/Rectangle;->y:I

    move/from16 v25, v0

    iget v0, v7, Ljava/awt/Rectangle;->height:I

    move/from16 v26, v0

    add-int v25, v25, v26

    div-int v25, v25, v13

    add-int/lit8 v11, v25, 0x1

    .line 1957
    .local v11, "endLine":I
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->getWidth()I

    move-result v22

    .line 1958
    .local v22, "width":I
    move/from16 v0, v16

    if-le v11, v0, :cond_1

    move/from16 v11, v16

    .line 1959
    :cond_1
    move/from16 v14, v19

    .local v14, "i":I
    :goto_0
    if-ge v14, v11, :cond_6

    .line 1961
    const/16 v18, -0x2

    .line 1963
    .local v18, "pos":I
    :try_start_0
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineStartOffset(I)I
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v18

    .line 1966
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-object/from16 v25, v0

    add-int/lit8 v26, v14, 0x1

    invoke-virtual/range {v25 .. v26}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->isBreakPoint(I)Z

    move-result v15

    .line 1967
    .local v15, "isBreakPoint":Z
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v26, v14, 0x1

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 1968
    .local v20, "text":Ljava/lang/String;
    mul-int v24, v14, v13

    .line 1969
    .local v24, "y":I
    sget-object v25, Ljava/awt/Color;->blue:Ljava/awt/Color;

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 1970
    const/16 v25, 0x0

    add-int v26, v24, v6

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Ljava/awt/Graphics;->drawString(Ljava/lang/String;II)V

    .line 1971
    sub-int v23, v22, v6

    .line 1972
    .local v23, "x":I
    if-eqz v15, :cond_2

    .line 1973
    new-instance v25, Ljava/awt/Color;

    const/16 v26, 0x80

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v28}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 1974
    add-int v25, v24, v6

    add-int/lit8 v10, v25, -0x9

    .line 1975
    .local v10, "dy":I
    const/16 v25, 0x9

    const/16 v26, 0x9

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Ljava/awt/Graphics;->fillOval(IIII)V

    .line 1976
    const/16 v25, 0x8

    const/16 v26, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Ljava/awt/Graphics;->drawOval(IIII)V

    .line 1977
    const/16 v25, 0x9

    const/16 v26, 0x9

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Ljava/awt/Graphics;->drawOval(IIII)V

    .line 1979
    .end local v10    # "dy":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->currentPos:I

    move/from16 v25, v0

    move/from16 v0, v18

    move/from16 v1, v25

    if-ne v0, v1, :cond_5

    .line 1980
    new-instance v5, Ljava/awt/Polygon;

    invoke-direct {v5}, Ljava/awt/Polygon;-><init>()V

    .line 1981
    .local v5, "arrow":Ljava/awt/Polygon;
    move/from16 v9, v23

    .line 1982
    .local v9, "dx":I
    add-int/lit8 v25, v6, -0xa

    add-int v24, v24, v25

    .line 1983
    move/from16 v10, v24

    .line 1984
    .restart local v10    # "dy":I
    add-int/lit8 v25, v10, 0x3

    move/from16 v0, v25

    invoke-virtual {v5, v9, v0}, Ljava/awt/Polygon;->addPoint(II)V

    .line 1985
    add-int/lit8 v25, v9, 0x5

    add-int/lit8 v26, v10, 0x3

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v5, v0, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 1986
    add-int/lit8 v23, v9, 0x5

    :goto_2
    add-int/lit8 v25, v9, 0xa

    move/from16 v0, v23

    move/from16 v1, v25

    if-gt v0, v1, :cond_3

    .line 1987
    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v5, v0, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 1986
    add-int/lit8 v23, v23, 0x1

    add-int/lit8 v24, v24, 0x1

    goto :goto_2

    .line 1989
    :cond_3
    add-int/lit8 v23, v9, 0x9

    :goto_3
    add-int/lit8 v25, v9, 0x5

    move/from16 v0, v23

    move/from16 v1, v25

    if-lt v0, v1, :cond_4

    .line 1990
    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v5, v0, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 1989
    add-int/lit8 v23, v23, -0x1

    add-int/lit8 v24, v24, 0x1

    goto :goto_3

    .line 1992
    :cond_4
    add-int/lit8 v25, v9, 0x5

    add-int/lit8 v26, v10, 0x7

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v5, v0, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 1993
    add-int/lit8 v25, v10, 0x7

    move/from16 v0, v25

    invoke-virtual {v5, v9, v0}, Ljava/awt/Polygon;->addPoint(II)V

    .line 1994
    sget-object v25, Ljava/awt/Color;->yellow:Ljava/awt/Color;

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 1995
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/awt/Graphics;->fillPolygon(Ljava/awt/Polygon;)V

    .line 1996
    sget-object v25, Ljava/awt/Color;->black:Ljava/awt/Color;

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 1997
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/awt/Graphics;->drawPolygon(Ljava/awt/Polygon;)V

    .line 1959
    .end local v5    # "arrow":Ljava/awt/Polygon;
    .end local v9    # "dx":I
    .end local v10    # "dy":I
    :cond_5
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_0

    .line 1964
    .end local v15    # "isBreakPoint":Z
    .end local v20    # "text":Ljava/lang/String;
    .end local v23    # "x":I
    .end local v24    # "y":I
    :catch_0
    move-exception v25

    goto/16 :goto_1

    .line 2000
    .end local v18    # "pos":I
    :cond_6
    return-void
.end method

.method public update()V
    .locals 9

    .prologue
    .line 1918
    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/FileHeader;->fileWindow:Lorg/mozilla/javascript/tools/debugger/FileWindow;

    iget-object v6, v7, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    .line 1919
    .local v6, "textArea":Lorg/mozilla/javascript/tools/debugger/FileTextArea;
    invoke-virtual {v6}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v2

    .line 1920
    .local v2, "font":Ljava/awt/Font;
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->setFont(Ljava/awt/Font;)V

    .line 1921
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v5

    .line 1922
    .local v5, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual {v5}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v3

    .line 1923
    .local v3, "h":I
    invoke-virtual {v6}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineCount()I

    move-result v7

    add-int/lit8 v4, v7, 0x1

    .line 1924
    .local v4, "lineCount":I
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 1925
    .local v1, "dummy":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x2

    if-ge v7, v8, :cond_0

    .line 1926
    const-string v1, "99"

    .line 1928
    :cond_0
    new-instance v0, Ljava/awt/Dimension;

    invoke-direct {v0}, Ljava/awt/Dimension;-><init>()V

    .line 1929
    .local v0, "d":Ljava/awt/Dimension;
    invoke-virtual {v5, v1}, Ljava/awt/FontMetrics;->stringWidth(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x10

    iput v7, v0, Ljava/awt/Dimension;->width:I

    .line 1930
    mul-int v7, v4, v3

    add-int/lit8 v7, v7, 0x64

    iput v7, v0, Ljava/awt/Dimension;->height:I

    .line 1931
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 1932
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->setSize(Ljava/awt/Dimension;)V

    .line 1933
    return-void
.end method
