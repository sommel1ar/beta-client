.class public Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;
.super Landroid/widget/ArrayAdapter;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ModPEScriptAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field private enabled:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;


# direct methods
.method public constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 530
    .local p3, "values":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .local p4, "enabledScripts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    .line 531
    const/4 v0, -0x1

    invoke-direct {p0, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 532
    iput-object p4, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->enabled:Ljava/util/ArrayList;

    .line 533
    return-void
.end method

.method static synthetic access$300(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    .prologue
    .line 526
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->enabled:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 537
    if-nez p2, :cond_0

    .line 538
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "layout_inflater"

    .line 539
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 540
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lio/mrarm/mcpelauncher/R$layout;->modpe_entry:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 542
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    sget v2, Lio/mrarm/mcpelauncher/R$id;->modpeCheck:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 543
    .local v1, "name":Landroid/widget/CheckBox;
    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 544
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 545
    iget-object v2, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->enabled:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 546
    new-instance v2, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;

    invoke-direct {v2, p0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$1;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;I)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 558
    new-instance v2, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;

    invoke-direct {v2, p0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter$2;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;I)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 578
    return-object p2
.end method
