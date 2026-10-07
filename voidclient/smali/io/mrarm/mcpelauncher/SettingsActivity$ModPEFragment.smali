.class public Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;
.super Landroid/preference/PreferenceFragment;
.source "SettingsActivity.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ModPEFragment"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;
    }
.end annotation


# static fields
.field public static ACTION_IMPORT:I


# instance fields
.field private adapter:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

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

.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private listView:Landroid/widget/ListView;

.field private noScripts:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 518
    const/4 v0, 0x1

    sput v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->ACTION_IMPORT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 517
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$400(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    .prologue
    .line 517
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;
    .locals 1
    .param p0, "x0"    # Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    .prologue
    .line 517
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->adapter:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    return-object v0
.end method

.method private buildFilesStringSet(Ljava/util/ArrayList;)Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 593
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 594
    .local v1, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 595
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 597
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    return-object v1
.end method

.method private getModPEDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 589
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getModPEDir(Landroid/app/Activity;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private loadFilesFromStringSet(Ljava/util/ArrayList;Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 601
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .local p2, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p2, :cond_1

    .line 612
    :cond_0
    return-void

    .line 603
    :cond_1
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 605
    .local v1, "s":Ljava/lang/String;
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getModPEDir()Ljava/io/File;

    move-result-object v4

    invoke-direct {v0, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 606
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 607
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 608
    .end local v0    # "file":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 609
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 14
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 655
    sget v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->ACTION_IMPORT:I

    if-ne p1, v0, :cond_7

    .line 656
    if-eqz p3, :cond_0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_1

    .line 689
    :cond_0
    :goto_0
    return-void

    .line 658
    :cond_1
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v8

    .line 659
    .local v8, "filename":Ljava/lang/String;
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 660
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_2

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 661
    const-string v0, "_display_name"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 662
    :cond_2
    const/16 v0, 0x2f

    invoke-virtual {v8, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    .line 663
    const/16 v0, 0x2f

    invoke-virtual {v8, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 664
    :cond_3
    new-instance v12, Ljava/io/File;

    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getModPEDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {v12, v0, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 665
    .local v12, "newFile":Ljava/io/File;
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getModPEDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 667
    :try_start_0
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v9

    .line 668
    .local v9, "fin":Ljava/io/InputStream;
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 669
    .local v10, "fout":Ljava/io/OutputStream;
    const/16 v0, 0x400

    new-array v6, v0, [B

    .line 671
    .local v6, "buf":[B
    :goto_1
    invoke-virtual {v9, v6}, Ljava/io/InputStream;->read([B)I

    move-result v11

    .local v11, "len":I
    if-lez v11, :cond_4

    .line 672
    const/4 v0, 0x0

    invoke-virtual {v10, v6, v0, v11}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 683
    .end local v6    # "buf":[B
    .end local v9    # "fin":Ljava/io/InputStream;
    .end local v10    # "fout":Ljava/io/OutputStream;
    .end local v11    # "len":I
    :catch_0
    move-exception v13

    .line 684
    .local v13, "t":Ljava/lang/Throwable;
    invoke-virtual {v13}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 674
    .end local v13    # "t":Ljava/lang/Throwable;
    .restart local v6    # "buf":[B
    .restart local v9    # "fin":Ljava/io/InputStream;
    .restart local v10    # "fout":Ljava/io/OutputStream;
    .restart local v11    # "len":I
    :cond_4
    :try_start_1
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 675
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    .line 676
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 677
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 678
    :cond_5
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->enabled:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 679
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->enabled:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 680
    :cond_6
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->adapter:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;->notifyDataSetChanged()V

    .line 681
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->noScripts:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 682
    const/4 v0, 0x1

    sput-boolean v0, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 688
    .end local v6    # "buf":[B
    .end local v7    # "cursor":Landroid/database/Cursor;
    .end local v8    # "filename":Ljava/lang/String;
    .end local v9    # "fin":Ljava/io/InputStream;
    .end local v10    # "fout":Ljava/io/OutputStream;
    .end local v11    # "len":I
    .end local v12    # "newFile":Ljava/io/File;
    :cond_7
    invoke-super/range {p0 .. p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto/16 :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 584
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 585
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->setHasOptionsMenu(Z)V

    .line 586
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 628
    sget v3, Lio/mrarm/mcpelauncher/R$layout;->modpe_manager:I

    invoke-virtual {p1, v3, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 629
    .local v2, "view":Landroid/view/View;
    sget v3, Lio/mrarm/mcpelauncher/R$id;->modpeNoScripts:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->noScripts:Landroid/widget/TextView;

    .line 630
    sget v3, Lio/mrarm/mcpelauncher/R$id;->modpeScripts:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->listView:Landroid/widget/ListView;

    .line 631
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    .line 632
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->enabled:Ljava/util/ArrayList;

    .line 633
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 634
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getModPEDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 635
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getModPEDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 636
    :cond_0
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gtz v3, :cond_1

    .line 637
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->noScripts:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 640
    :goto_0
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->enabled:Ljava/util/ArrayList;

    const-string v4, "modpe_enabled"

    const/4 v5, 0x0

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->loadFilesFromStringSet(Ljava/util/ArrayList;Ljava/util/Set;)V

    .line 641
    new-instance v3, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->list:Ljava/util/ArrayList;

    iget-object v6, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->enabled:Ljava/util/ArrayList;

    invoke-direct {v3, p0, v4, v5, v6}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    iput-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->adapter:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    .line 642
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->listView:Landroid/widget/ListView;

    iget-object v4, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->adapter:Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$ModPEScriptAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 643
    sget v3, Lio/mrarm/mcpelauncher/R$id;->modpeAdd:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/FloatingActionButton;

    .line 644
    .local v0, "fab":Landroid/support/design/widget/FloatingActionButton;
    new-instance v3, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$1;

    invoke-direct {v3, p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment$1;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;)V

    invoke-virtual {v0, v3}, Landroid/support/design/widget/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 650
    return-object v2

    .line 639
    .end local v0    # "fab":Landroid/support/design/widget/FloatingActionButton;
    :cond_1
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->noScripts:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public onStop()V
    .locals 5

    .prologue
    .line 616
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 617
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 618
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v3, p0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->enabled:Ljava/util/ArrayList;

    invoke-direct {p0, v3}, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;->buildFilesStringSet(Ljava/util/ArrayList;)Ljava/util/Set;

    move-result-object v1

    .line 619
    .local v1, "newSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v3, "modpe_enabled"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 620
    const/4 v3, 0x1

    sput-boolean v3, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z

    .line 621
    :cond_0
    const-string v3, "modpe_enabled"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 622
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 623
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onStop()V

    .line 624
    return-void
.end method
