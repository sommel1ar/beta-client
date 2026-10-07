.class public Lio/mrarm/mcpelauncher/FileBrowserActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "FileBrowserActivity.java"

# interfaces
.implements Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;,
        Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method public static getIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 198
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-ge v2, v3, :cond_0

    .line 199
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lio/mrarm/mcpelauncher/FileBrowserActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .local v0, "intent":Landroid/content/Intent;
    move-object v1, v0

    .line 204
    .end local v0    # "intent":Landroid/content/Intent;
    .local v1, "intent":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 202
    .end local v1    # "intent":Ljava/lang/Object;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 203
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string v2, "*/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-object v1, v0

    .line 204
    .restart local v1    # "intent":Ljava/lang/Object;
    goto :goto_0
.end method

.method private setDirectoryFragment(Ljava/lang/String;)V
    .locals 4
    .param p1, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 58
    new-instance v1, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;

    invoke-direct {v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;-><init>()V

    .line 59
    .local v1, "frag":Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 60
    .local v0, "b":Landroid/os/Bundle;
    const-string v2, "directory"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v1, v0}, Lio/mrarm/mcpelauncher/FileBrowserActivity$DirectoryFragment;->setArguments(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    sget v3, Lio/mrarm/mcpelauncher/R$id;->fragment_container:I

    .line 63
    invoke-virtual {v2, v3, v1}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 64
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 3

    .prologue
    const v2, 0x800003

    .line 68
    sget v1, Lio/mrarm/mcpelauncher/R$id;->drawer_layout:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    .line 69
    .local v0, "drawer":Landroid/support/v4/widget/DrawerLayout;
    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 74
    :goto_0
    return-void

    .line 72
    :cond_0
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    sget v1, Lio/mrarm/mcpelauncher/R$layout;->activity_file_browser:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->setContentView(I)V

    .line 42
    sget v1, Lio/mrarm/mcpelauncher/R$id;->toolbar:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/Toolbar;

    .line 43
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v3}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 45
    sget v1, Lio/mrarm/mcpelauncher/R$id;->drawer_layout:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/DrawerLayout;

    .line 46
    .local v2, "drawer":Landroid/support/v4/widget/DrawerLayout;
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle;

    sget v4, Lio/mrarm/mcpelauncher/R$string;->navigation_drawer_open:I

    sget v5, Lio/mrarm/mcpelauncher/R$string;->navigation_drawer_close:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;Landroid/support/v7/widget/Toolbar;II)V

    .line 48
    .local v0, "toggle":Landroid/support/v7/app/ActionBarDrawerToggle;
    invoke-virtual {v2, v0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V

    .line 49
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->syncState()V

    .line 51
    sget v1, Lio/mrarm/mcpelauncher/R$id;->nav_view:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/design/widget/NavigationView;

    .line 52
    .local v6, "navigationView":Landroid/support/design/widget/NavigationView;
    invoke-virtual {v6, p0}, Landroid/support/design/widget/NavigationView;->setNavigationItemSelectedListener(Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;)V

    .line 54
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->setDirectoryFragment(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public onNavigationItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 79
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 81
    .local v1, "id":I
    sget v2, Lio/mrarm/mcpelauncher/R$id;->nav_internal_storage:I

    if-ne v1, v2, :cond_1

    .line 82
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->setDirectoryFragment(Ljava/lang/String;)V

    .line 88
    :cond_0
    :goto_0
    sget v2, Lio/mrarm/mcpelauncher/R$id;->drawer_layout:I

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout;

    .line 89
    .local v0, "drawer":Landroid/support/v4/widget/DrawerLayout;
    const v2, 0x800003

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 90
    const/4 v2, 0x1

    return v2

    .line 84
    .end local v0    # "drawer":Landroid/support/v4/widget/DrawerLayout;
    :cond_1
    sget v2, Lio/mrarm/mcpelauncher/R$id;->nav_fs_root:I

    if-ne v1, v2, :cond_0

    .line 85
    const-string v2, "/"

    invoke-direct {p0, v2}, Lio/mrarm/mcpelauncher/FileBrowserActivity;->setDirectoryFragment(Ljava/lang/String;)V

    goto :goto_0
.end method
