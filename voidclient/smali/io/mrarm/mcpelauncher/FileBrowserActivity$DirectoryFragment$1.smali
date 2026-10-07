.class Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;
.super Ljava/lang/Object;
.source "FileBrowserActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

.field final synthetic val$filesOut:[Ljava/io/File;

.field final synthetic val$hasParent:Z


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;Z[Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    .prologue
    .line 164
    iput-object p1, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->this$0:Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    iput-boolean p2, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$hasParent:Z

    iput-object p3, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$filesOut:[Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-boolean v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$hasParent:Z

    if-eqz v5, :cond_1

    if-nez p3, :cond_1

    .line 168
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->this$0:Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    invoke-virtual {v5}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 191
    :cond_0
    :goto_0
    return-void

    .line 171
    :cond_1
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$filesOut:[Ljava/io/File;

    aget-object v5, v5, p3

    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 172
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 173
    .local v3, "result":Landroid/content/Intent;
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$filesOut:[Ljava/io/File;

    aget-object v5, v5, p3

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 174
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->this$0:Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    invoke-virtual {v5}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    const/4 v6, -0x1

    invoke-virtual {v5, v6, v3}, Landroid/support/v4/app/FragmentActivity;->setResult(ILandroid/content/Intent;)V

    .line 175
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->this$0:Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    invoke-virtual {v5}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 178
    .end local v3    # "result":Landroid/content/Intent;
    :cond_2
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$filesOut:[Ljava/io/File;

    aget-object v5, v5, p3

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 180
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->val$filesOut:[Ljava/io/File;

    aget-object v5, v5, p3

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, "filePath":Ljava/lang/String;
    iget-object v5, p0, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment$1;->this$0:Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    invoke-virtual {v5}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    .line 182
    .local v4, "transaction":Landroid/support/v4/app/FragmentTransaction;
    new-instance v2, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    invoke-direct {v2}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;-><init>()V

    .line 183
    .local v2, "frag":Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;
    sget v5, Lio/mrarm/mcpelauncher/R$animator;->slide_left:I

    sget v6, Lio/mrarm/mcpelauncher/R$animator;->fade_out:I

    sget v7, Lio/mrarm/mcpelauncher/R$animator;->fade_in:I

    sget v8, Lio/mrarm/mcpelauncher/R$animator;->slide_right:I

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;

    .line 184
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 185
    .local v0, "b":Landroid/os/Bundle;
    const-string v5, "directory"

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-string v5, "has_parent"

    const/4 v6, 0x1

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 187
    invoke-virtual {v2, v0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->setArguments(Landroid/os/Bundle;)V

    .line 188
    sget v5, Lio/mrarm/mcpelauncher/R$id;->fragment_container:I

    invoke-virtual {v4, v5, v2}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 189
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 190
    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    goto :goto_0
.end method
