.class public Lio/mrarm/mcpelauncher/DragDropListView;
.super Landroid/widget/ListView;
.source "DragDropListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;,
        Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;,
        Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    }
.end annotation


# instance fields
.field private autoScrollMode:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

.field public dragHandleWidth:I

.field private group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

.field myPointerId:I

.field prevTouchX:I

.field prevTouchY:I

.field private scrollDist:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 31
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    .line 32
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->dragHandleWidth:I

    .line 116
    const/4 v0, -0x1

    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    .line 32
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->dragHandleWidth:I

    .line 116
    const/4 v0, -0x1

    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    .line 32
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->dragHandleWidth:I

    .line 116
    const/4 v0, -0x1

    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 31
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    .line 32
    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->dragHandleWidth:I

    .line 116
    const/4 v0, -0x1

    iput v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    .line 49
    return-void
.end method

.method static synthetic access$000(Lio/mrarm/mcpelauncher/DragDropListView;)V
    .locals 0
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/DragDropListView;

    .prologue
    .line 27
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->doAutoScroll()V

    return-void
.end method

.method private doAutoScroll()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 305
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->autoScrollMode:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    sget-object v1, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->DOWN:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    if-ne v0, v1, :cond_1

    .line 306
    iget v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    invoke-virtual {p0, v0, v2}, Lio/mrarm/mcpelauncher/DragDropListView;->smoothScrollBy(II)V

    .line 310
    :cond_0
    :goto_0
    return-void

    .line 307
    :cond_1
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->autoScrollMode:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    sget-object v1, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->UP:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    if-ne v0, v1, :cond_0

    .line 308
    iget v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    neg-int v0, v0

    invoke-virtual {p0, v0, v2}, Lio/mrarm/mcpelauncher/DragDropListView;->smoothScrollBy(II)V

    goto :goto_0
.end method

.method private isHoveringOverDelete(II)Z
    .locals 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 287
    iget-object v3, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    if-eqz v3, :cond_1

    .line 288
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 289
    .local v0, "viewPos":[I
    iget-object v3, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v3, v3, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 291
    aget v3, v0, v2

    if-le p1, v3, :cond_0

    aget v3, v0, v2

    iget-object v4, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v4, v4, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    if-ge p1, v3, :cond_0

    aget v3, v0, v1

    if-le p2, v3, :cond_0

    aget v3, v0, v1

    iget-object v4, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v4, v4, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    .line 292
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    add-int/2addr v3, v4

    if-ge p2, v3, :cond_0

    .line 294
    .end local v0    # "viewPos":[I
    :goto_0
    return v1

    .restart local v0    # "viewPos":[I
    :cond_0
    move v1, v2

    .line 292
    goto :goto_0

    .end local v0    # "viewPos":[I
    :cond_1
    move v1, v2

    .line 294
    goto :goto_0
.end method


# virtual methods
.method public getDragDropGroup()Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    return-object v0
.end method

.method public handleDragEvent(Landroid/view/MotionEvent;)Z
    .locals 27
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 121
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    packed-switch v23, :pswitch_data_0

    .line 276
    :cond_0
    :goto_0
    const/16 v23, 0x0

    :goto_1
    return v23

    .line 123
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView;->prevTouchX:I

    .line 124
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView;->prevTouchY:I

    .line 125
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v23

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    .line 127
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v23

    move-object/from16 v0, p0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->dragHandleWidth:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    cmpg-float v23, v23, v24

    if-gtz v23, :cond_0

    .line 129
    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v20, v0

    .line 130
    .local v20, "viewPos":[I
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->getLocationOnScreen([I)V

    .line 132
    new-instance v16, Landroid/graphics/Rect;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/Rect;-><init>()V

    .line 133
    .local v16, "rect":Landroid/graphics/Rect;
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x0

    aget v24, v20, v24

    sub-int v21, v23, v24

    .line 134
    .local v21, "x":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x1

    aget v24, v20, v24

    sub-int v22, v23, v24

    .line 135
    .local v22, "y":I
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getChildCount()I

    move-result v4

    .line 136
    .local v4, "count":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    if-ge v8, v4, :cond_0

    .line 137
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lio/mrarm/mcpelauncher/DragDropListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 138
    .local v3, "child":Landroid/view/View;
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 139
    move-object/from16 v0, v16

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 140
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getFirstVisiblePosition()I

    move-result v23

    add-int v15, v23, v8

    .line 141
    .local v15, "n":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lio/mrarm/mcpelauncher/DragDropListView;->startDrag(I)V

    goto/16 :goto_0

    .line 136
    .end local v15    # "n":I
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 150
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "count":I
    .end local v8    # "i":I
    .end local v16    # "rect":Landroid/graphics/Rect;
    .end local v20    # "viewPos":[I
    .end local v21    # "x":I
    .end local v22    # "y":I
    :pswitch_1
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v23

    move-object/from16 v0, p0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedView:Landroid/view/View;

    move-object/from16 v23, v0

    if-eqz v23, :cond_0

    .line 151
    const/16 v23, -0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    .line 152
    new-instance v23, Lio/mrarm/mcpelauncher/DragDropListView$3;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView$3;-><init>(Lio/mrarm/mcpelauncher/DragDropListView;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->post(Ljava/lang/Runnable;)Z

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    move-object/from16 v23, v0

    if-eqz v23, :cond_2

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    move-object/from16 v23, v0

    const/16 v24, 0x8

    invoke-virtual/range {v23 .. v24}, Landroid/view/View;->setVisibility(I)V

    .line 165
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    iput-object v0, v1, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedView:Landroid/view/View;

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    const/16 v24, 0x8

    invoke-virtual/range {v23 .. v24}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    move/from16 v23, v0

    invoke-virtual/range {p0 .. p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getFirstVisiblePosition()I

    move-result v24

    sub-int v23, v23, v24

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->getChildAt(I)Landroid/view/View;

    move-result-object v18

    .line 170
    .local v18, "toShow":Landroid/view/View;
    if-eqz v18, :cond_3

    .line 171
    const/16 v23, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 173
    :cond_3
    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v6, v0, [I

    .line 174
    .local v6, "draggedPos":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->getLocationOnScreen([I)V

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v7

    .line 177
    .local v7, "draggedW":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v5

    .line 179
    .local v5, "draggedH":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->lists:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_3
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_4

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lio/mrarm/mcpelauncher/DragDropListView;

    .line 180
    .local v19, "view":Lio/mrarm/mcpelauncher/DragDropListView;
    sget-object v24, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->NONE:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->setAutoScrollMode(Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;)V

    goto :goto_3

    .line 183
    .end local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    :cond_4
    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 184
    .local v17, "selfPos":[I
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->getLocationOnScreen([I)V

    .line 186
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x0

    aget v24, v17, v24

    add-int v23, v23, v24

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v24

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    const/16 v25, 0x1

    aget v25, v17, v25

    add-int v24, v24, v25

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lio/mrarm/mcpelauncher/DragDropListView;->isHoveringOverDelete(II)Z

    move-result v23

    if-eqz v23, :cond_6

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->destroyItem(I)V

    .line 219
    :cond_5
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    const/16 v24, -0x1

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->notifyDataSetChanged()V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    iput-object v0, v1, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    goto/16 :goto_0

    .line 189
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->lists:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_7
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_5

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lio/mrarm/mcpelauncher/DragDropListView;

    .line 190
    .restart local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [I

    move-object/from16 v20, v0

    .line 191
    .restart local v20    # "viewPos":[I
    invoke-virtual/range {v19 .. v20}, Lio/mrarm/mcpelauncher/DragDropListView;->getLocationOnScreen([I)V

    .line 192
    const/16 v24, 0x0

    aget v24, v6, v24

    const/16 v25, 0x0

    aget v25, v20, v25

    div-int/lit8 v26, v7, 0x2

    sub-int v25, v25, v26

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_7

    const/16 v24, 0x0

    aget v24, v6, v24

    add-int v24, v24, v7

    const/16 v25, 0x0

    aget v25, v20, v25

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getWidth()I

    move-result v26

    add-int v25, v25, v26

    div-int/lit8 v26, v7, 0x2

    add-int v25, v25, v26

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_7

    const/16 v24, 0x1

    aget v24, v6, v24

    const/16 v25, 0x1

    aget v25, v20, v25

    div-int/lit8 v26, v5, 0x2

    sub-int v25, v25, v26

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_7

    const/16 v24, 0x1

    aget v24, v6, v24

    add-int v24, v24, v5

    const/16 v25, 0x1

    aget v25, v20, v25

    .line 193
    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getHeight()I

    move-result v26

    add-int v25, v25, v26

    div-int/lit8 v26, v5, 0x2

    add-int v25, v25, v26

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_7

    .line 195
    new-instance v16, Landroid/graphics/Rect;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/Rect;-><init>()V

    .line 196
    .restart local v16    # "rect":Landroid/graphics/Rect;
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x0

    aget v24, v20, v24

    sub-int v21, v23, v24

    .line 197
    .restart local v21    # "x":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x1

    aget v24, v20, v24

    sub-int v22, v23, v24

    .line 198
    .restart local v22    # "y":I
    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getChildCount()I

    move-result v4

    .line 199
    .restart local v4    # "count":I
    const/4 v10, 0x0

    .line 200
    .local v10, "insertAt":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_5
    if-ge v8, v4, :cond_8

    .line 201
    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lio/mrarm/mcpelauncher/DragDropListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 202
    .restart local v3    # "child":Landroid/view/View;
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 203
    move-object/from16 v0, v16

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v23

    if-eqz v23, :cond_9

    .line 204
    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getFirstVisiblePosition()I

    move-result v23

    add-int v10, v23, v8

    .line 205
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->centerY()I

    move-result v23

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_8

    .line 206
    add-int/lit8 v10, v10, 0x1

    .line 211
    .end local v3    # "child":Landroid/view/View;
    :cond_8
    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v23

    check-cast v23, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->transformDropIndex(I)I

    move-result v10

    .line 212
    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v23

    check-cast v23, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v10, v1}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->addItemAt(ILjava/lang/Object;)V

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v24, v0

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v10, v0, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, 0x1

    :goto_6
    move-object/from16 v0, v24

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->removeItem(I)V

    .line 214
    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v23

    check-cast v23, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    invoke-virtual/range {v23 .. v23}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->notifyDataSetChanged()V

    goto/16 :goto_4

    .line 200
    .restart local v3    # "child":Landroid/view/View;
    :cond_9
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_5

    .line 213
    .end local v3    # "child":Landroid/view/View;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    move/from16 v23, v0

    goto :goto_6

    .line 226
    .end local v4    # "count":I
    .end local v5    # "draggedH":I
    .end local v6    # "draggedPos":[I
    .end local v7    # "draggedW":I
    .end local v8    # "i":I
    .end local v10    # "insertAt":I
    .end local v16    # "rect":Landroid/graphics/Rect;
    .end local v17    # "selfPos":[I
    .end local v18    # "toShow":Landroid/view/View;
    .end local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    .end local v20    # "viewPos":[I
    .end local v21    # "x":I
    .end local v22    # "y":I
    :pswitch_2
    move-object/from16 v0, p0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    move/from16 v23, v0

    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_0

    .line 228
    move-object/from16 v0, p0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->myPointerId:I

    move/from16 v23, v0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v9

    .line 229
    .local v9, "index":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getX(I)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v21, v0

    .line 230
    .restart local v21    # "x":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getY(I)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v22, v0

    .line 231
    .restart local v22    # "y":I
    move-object/from16 v0, p0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->prevTouchX:I

    move/from16 v23, v0

    sub-int v12, v21, v23

    .line 232
    .local v12, "mX":I
    move-object/from16 v0, p0

    iget v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->prevTouchY:I

    move/from16 v23, v0

    sub-int v13, v22, v23

    .line 233
    .local v13, "mY":I
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView;->prevTouchX:I

    .line 234
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lio/mrarm/mcpelauncher/DragDropListView;->prevTouchY:I

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedView:Landroid/view/View;

    move-object/from16 v23, v0

    if-eqz v23, :cond_0

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroid/widget/RelativeLayout$LayoutParams;

    .line 237
    .local v11, "layout":Landroid/widget/RelativeLayout$LayoutParams;
    iget v0, v11, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    move/from16 v23, v0

    add-int v23, v23, v12

    move/from16 v0, v23

    iput v0, v11, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 238
    iget v0, v11, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    move/from16 v23, v0

    add-int v23, v23, v13

    move/from16 v0, v23

    iput v0, v11, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v6, v0, [I

    .line 242
    .restart local v6    # "draggedPos":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->getLocationOnScreen([I)V

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v7

    .line 245
    .restart local v7    # "draggedW":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v5

    .line 247
    .restart local v5    # "draggedH":I
    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 248
    .restart local v17    # "selfPos":[I
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->getLocationOnScreen([I)V

    .line 250
    const/16 v23, 0x0

    aget v23, v17, v23

    add-int v23, v23, v21

    const/16 v24, 0x1

    aget v24, v17, v24

    add-int v24, v24, v22

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lio/mrarm/mcpelauncher/DragDropListView;->isHoveringOverDelete(II)Z

    move-result v23

    if-eqz v23, :cond_c

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    move-object/from16 v23, v0

    const/high16 v24, 0x3f800000    # 1.0f

    invoke-virtual/range {v23 .. v24}, Landroid/view/View;->setAlpha(F)V

    .line 256
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->lists:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_8
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_e

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lio/mrarm/mcpelauncher/DragDropListView;

    .line 257
    .restart local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [I

    move-object/from16 v20, v0

    .line 258
    .restart local v20    # "viewPos":[I
    invoke-virtual/range {v19 .. v20}, Lio/mrarm/mcpelauncher/DragDropListView;->getLocationOnScreen([I)V

    .line 260
    sget-object v14, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->NONE:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    .line 261
    .local v14, "mode":Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    const/16 v24, 0x0

    aget v24, v6, v24

    const/16 v25, 0x0

    aget v25, v20, v25

    div-int/lit8 v26, v7, 0x2

    sub-int v25, v25, v26

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_b

    const/16 v24, 0x0

    aget v24, v6, v24

    add-int v24, v24, v7

    const/16 v25, 0x0

    aget v25, v20, v25

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getWidth()I

    move-result v26

    add-int v25, v25, v26

    div-int/lit8 v26, v7, 0x2

    add-int v25, v25, v26

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_b

    .line 262
    const/16 v24, 0x1

    aget v24, v6, v24

    const/16 v25, 0x1

    aget v25, v20, v25

    invoke-virtual/range {v19 .. v19}, Lio/mrarm/mcpelauncher/DragDropListView;->getHeight()I

    move-result v26

    add-int v25, v25, v26

    sub-int v25, v25, v5

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_d

    .line 263
    sget-object v14, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->DOWN:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    .line 268
    :cond_b
    :goto_9
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Lio/mrarm/mcpelauncher/DragDropListView;->setAutoScrollMode(Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;)V

    goto :goto_8

    .line 253
    .end local v14    # "mode":Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    .end local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    .end local v20    # "viewPos":[I
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    move-object/from16 v23, v0

    const v24, 0x3f19999a    # 0.6f

    invoke-virtual/range {v23 .. v24}, Landroid/view/View;->setAlpha(F)V

    goto/16 :goto_7

    .line 264
    .restart local v14    # "mode":Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    .restart local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    .restart local v20    # "viewPos":[I
    :cond_d
    const/16 v24, 0x1

    aget v24, v6, v24

    const/16 v25, 0x1

    aget v25, v20, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_b

    .line 265
    sget-object v14, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->UP:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    goto :goto_9

    .line 270
    .end local v14    # "mode":Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    .end local v19    # "view":Lio/mrarm/mcpelauncher/DragDropListView;
    .end local v20    # "viewPos":[I
    :cond_e
    const/16 v23, 0x1

    goto/16 :goto_1

    .line 121
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public init(Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;)V
    .locals 4
    .param p1, "group"    # Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    .prologue
    .line 52
    iput-object p1, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    .line 53
    iget-object v1, p1, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->lists:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    const/4 v1, 0x1

    const/high16 v2, 0x42300000    # 44.0f

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lio/mrarm/mcpelauncher/DragDropListView;->dragHandleWidth:I

    .line 57
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 58
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    const/high16 v1, 0x41700000    # 15.0f

    iget v2, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lio/mrarm/mcpelauncher/DragDropListView;->scrollDist:I

    .line 60
    new-instance v1, Lio/mrarm/mcpelauncher/DragDropListView$1;

    invoke-direct {v1, p0}, Lio/mrarm/mcpelauncher/DragDropListView$1;-><init>(Lio/mrarm/mcpelauncher/DragDropListView;)V

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 67
    new-instance v1, Lio/mrarm/mcpelauncher/DragDropListView$2;

    invoke-direct {v1, p0}, Lio/mrarm/mcpelauncher/DragDropListView$2;-><init>(Lio/mrarm/mcpelauncher/DragDropListView;)V

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/DragDropListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 78
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 281
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/DragDropListView;->handleDragEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    const/4 v0, 0x1

    .line 283
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public setAutoScrollMode(Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;)V
    .locals 2
    .param p1, "mode"    # Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    .prologue
    .line 298
    iget-object v1, p0, Lio/mrarm/mcpelauncher/DragDropListView;->autoScrollMode:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    if-ne v1, p1, :cond_1

    const/4 v0, 0x1

    .line 299
    .local v0, "hasChange":Z
    :goto_0
    iput-object p1, p0, Lio/mrarm/mcpelauncher/DragDropListView;->autoScrollMode:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    .line 300
    if-eqz v0, :cond_0

    .line 301
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->doAutoScroll()V

    .line 302
    :cond_0
    return-void

    .line 298
    .end local v0    # "hasChange":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public startDrag(I)V
    .locals 10
    .param p1, "position"    # I

    .prologue
    const/4 v9, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 81
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    invoke-virtual {v5, p1}, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;->canDrag(I)Z

    move-result v5

    if-nez v5, :cond_0

    .line 110
    :goto_0
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getFirstVisiblePosition()I

    move-result v5

    sub-int v5, p1, v5

    invoke-virtual {p0, v5}, Lio/mrarm/mcpelauncher/DragDropListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 85
    .local v3, "view":Landroid/view/View;
    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 86
    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v5}, Lio/mrarm/mcpelauncher/DragDropListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 88
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    if-eqz v5, :cond_1

    .line 89
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 90
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->deleterView:Landroid/view/View;

    const v6, 0x3f19999a    # 0.6f

    invoke-virtual {v5, v6}, Landroid/view/View;->setAlpha(F)V

    .line 93
    :cond_1
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v5}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 94
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-direct {v1, v5, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 96
    .local v1, "params":Landroid/widget/RelativeLayout$LayoutParams;
    new-array v4, v9, [I

    .line 97
    .local v4, "viewPos":[I
    invoke-virtual {v3, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 98
    new-array v0, v9, [I

    .line 99
    .local v0, "containerPos":[I
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v5}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {v5, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 100
    aget v5, v4, v8

    aget v6, v0, v8

    sub-int/2addr v5, v6

    aget v6, v4, v7

    aget v7, v0, v7

    sub-int/2addr v6, v7

    invoke-virtual {v1, v5, v6, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 102
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    const/4 v6, 0x0

    iget-object v7, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v7, v7, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    invoke-interface {v5, p1, v6, v7}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 104
    .local v2, "v":Landroid/view/View;
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 105
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iput-object v2, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedView:Landroid/view/View;

    .line 106
    iget-object v6, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/DragDropListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    check-cast v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    iput-object v5, v6, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemAdapter:Lio/mrarm/mcpelauncher/DragDropListView$DragDropAdapter;

    .line 107
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iput p1, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemId:I

    .line 109
    iget-object v5, p0, Lio/mrarm/mcpelauncher/DragDropListView;->group:Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;

    iget-object v5, v5, Lio/mrarm/mcpelauncher/DragDropListView$DragDropGroup;->draggedItemContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_0
.end method
