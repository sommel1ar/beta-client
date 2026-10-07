.class public final enum Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
.super Ljava/lang/Enum;
.source "DragDropListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/DragDropListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AutoScrollMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

.field public static final enum DOWN:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

.field public static final enum NONE:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

.field public static final enum UP:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 313
    new-instance v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->NONE:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    new-instance v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    const-string v1, "UP"

    invoke-direct {v0, v1, v3}, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->UP:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    new-instance v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    const-string v1, "DOWN"

    invoke-direct {v0, v1, v4}, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->DOWN:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    .line 312
    const/4 v0, 0x3

    new-array v0, v0, [Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    sget-object v1, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->NONE:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    aput-object v1, v0, v2

    sget-object v1, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->UP:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    aput-object v1, v0, v3

    sget-object v1, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->DOWN:Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    aput-object v1, v0, v4

    sput-object v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->$VALUES:[Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 312
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 312
    const-class v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    return-object v0
.end method

.method public static values()[Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;
    .locals 1

    .prologue
    .line 312
    sget-object v0, Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->$VALUES:[Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    invoke-virtual {v0}, [Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/mrarm/mcpelauncher/DragDropListView$AutoScrollMode;

    return-object v0
.end method
