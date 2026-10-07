.class public Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;
.super Landroid/support/v4/app/Fragment;
.source "FileBrowserActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/FileBrowserActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DirectoryFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 121
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 126
    sget v8, Lio/mrarm/mcpelauncher/R$layout;->file_browser_dirview:I

    const/4 v9, 0x0

    invoke-virtual {p1, v8, p2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    .line 127
    .local v7, "view":Landroid/view/View;
    sget v8, Lio/mrarm/mcpelauncher/R$id;->listView:I

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ListView;

    .line 128
    .local v6, "listView":Landroid/widget/ListView;
    const-string v8, "Dir"

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v9

    const-string v10, "directory"

    const-string v11, "/"

    invoke-virtual {v9, v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "directory"

    const-string v10, "/"

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 130
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "has_parent"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 131
    .local v3, "hasParent":Z
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 132
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    array-length v8, v1

    if-nez v8, :cond_2

    .line 133
    :cond_0
    sget v8, Lio/mrarm/mcpelauncher/R$id;->listError:I

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 134
    if-eqz v3, :cond_1

    .line 135
    const/4 v8, 0x1

    new-array v1, v8, [Ljava/io/File;

    .line 136
    const/4 v8, 0x0

    new-instance v9, Ljava/io/File;

    const-string v10, ".."

    invoke-direct {v9, v0, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v9, v1, v8

    .line 162
    :goto_0
    move-object v2, v1

    .line 163
    .local v2, "filesOut":[Ljava/io/File;
    new-instance v8, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;

    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v9

    invoke-direct {v8, v9, v2}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;-><init>(Landroid/content/Context;[Ljava/io/File;)V

    invoke-virtual {v6, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 164
    new-instance v8, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;

    invoke-direct {v8, p0, v3, v2}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;-><init>(Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;Z[Ljava/io/File;)V

    invoke-virtual {v6, v8}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 193
    return-object v7

    .line 138
    .end local v2    # "filesOut":[Ljava/io/File;
    :cond_1
    const/4 v8, 0x0

    new-array v1, v8, [Ljava/io/File;

    goto :goto_0

    .line 141
    :cond_2
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 142
    array-length v9, v1

    if-eqz v3, :cond_5

    const/4 v8, 0x1

    :goto_1
    add-int/2addr v8, v9

    new-array v2, v8, [Ljava/io/File;

    .line 143
    .restart local v2    # "filesOut":[Ljava/io/File;
    const/4 v5, 0x0

    .line 144
    .local v5, "j":I
    if-eqz v3, :cond_3

    .line 145
    const/4 v8, 0x0

    new-instance v9, Ljava/io/File;

    const-string v10, ".."

    invoke-direct {v9, v0, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v9, v2, v8

    .line 146
    add-int/lit8 v5, v5, 0x1

    .line 148
    :cond_3
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    array-length v8, v1

    if-ge v4, v8, :cond_6

    .line 149
    aget-object v8, v1, v4

    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 150
    aget-object v8, v1, v4

    aput-object v8, v2, v5

    .line 151
    add-int/lit8 v5, v5, 0x1

    .line 148
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 142
    .end local v2    # "filesOut":[Ljava/io/File;
    .end local v4    # "i":I
    .end local v5    # "j":I
    :cond_5
    const/4 v8, 0x0

    goto :goto_1

    .line 154
    .restart local v2    # "filesOut":[Ljava/io/File;
    .restart local v4    # "i":I
    .restart local v5    # "j":I
    :cond_6
    const/4 v4, 0x0

    :goto_3
    array-length v8, v1

    if-ge v4, v8, :cond_8

    .line 155
    aget-object v8, v1, v4

    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_7

    .line 156
    aget-object v8, v1, v4

    aput-object v8, v2, v5

    .line 157
    add-int/lit8 v5, v5, 0x1

    .line 154
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 160
    :cond_8
    move-object v1, v2

    goto :goto_0
.end method
