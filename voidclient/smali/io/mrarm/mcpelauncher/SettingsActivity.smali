.class public Lio/mrarm/mcpelauncher/SettingsActivity;
.super Lio/mrarm/mcpelauncher/AppCompatPreferenceActivity;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mrarm/mcpelauncher/SettingsActivity$AboutFragment;,
        Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;,
        Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;,
        Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;
    }
.end annotation


# static fields
.field public static needsRestart:Z

.field private static sBindPreferenceSummaryToValueListener:Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private updateRestartNeededListener:Landroid/preference/Preference$OnPreferenceChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    sput-boolean v0, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z

    .line 91
    new-instance v0, Lio/mrarm/mcpelauncher/SettingsActivity$1;

    invoke-direct {v0}, Lio/mrarm/mcpelauncher/SettingsActivity$1;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/SettingsActivity;->sBindPreferenceSummaryToValueListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/AppCompatPreferenceActivity;-><init>()V

    .line 117
    new-instance v0, Lio/mrarm/mcpelauncher/SettingsActivity$2;

    invoke-direct {v0, p0}, Lio/mrarm/mcpelauncher/SettingsActivity$2;-><init>(Lio/mrarm/mcpelauncher/SettingsActivity;)V

    iput-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity;->updateRestartNeededListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    return-void
.end method

.method static synthetic access$000(Landroid/preference/PreferenceFragment;Landroid/preference/Preference;)V
    .locals 0
    .param p0, "x0"    # Landroid/preference/PreferenceFragment;
    .param p1, "x1"    # Landroid/preference/Preference;

    .prologue
    .line 74
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity;->registerRestartPreference(Landroid/preference/PreferenceFragment;Landroid/preference/Preference;)V

    return-void
.end method

.method static synthetic access$100(Landroid/preference/Preference;)V
    .locals 0
    .param p0, "x0"    # Landroid/preference/Preference;

    .prologue
    .line 74
    invoke-static {p0}, Lio/mrarm/mcpelauncher/SettingsActivity;->bindPreferenceSummaryToValue(Landroid/preference/Preference;)V

    return-void
.end method

.method static synthetic access$200(Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Ljava/io/File;

    .prologue
    .line 74
    invoke-static {p0}, Lio/mrarm/mcpelauncher/SettingsActivity;->deleteRecursive(Ljava/io/File;)V

    return-void
.end method

.method private static bindPreferenceSummaryToValue(Landroid/preference/Preference;)V
    .locals 4
    .param p0, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 145
    sget-object v0, Lio/mrarm/mcpelauncher/SettingsActivity;->sBindPreferenceSummaryToValueListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {p0, v0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 149
    sget-object v0, Lio/mrarm/mcpelauncher/SettingsActivity;->sBindPreferenceSummaryToValueListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    .line 151
    invoke-virtual {p0}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 152
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 149
    invoke-interface {v0, p0, v1}, Landroid/preference/Preference$OnPreferenceChangeListener;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    .line 153
    return-void
.end method

.method private static deleteRecursive(Ljava/io/File;)V
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 78
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 79
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 80
    invoke-static {v0}, Lio/mrarm/mcpelauncher/SettingsActivity;->deleteRecursive(Ljava/io/File;)V

    .line 78
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 84
    .end local v0    # "f":Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 85
    return-void
.end method

.method private static isXLargeTablet(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 130
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private registerRestartPreference(Landroid/preference/Preference;)V
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 156
    iget-object v0, p0, Lio/mrarm/mcpelauncher/SettingsActivity;->updateRestartNeededListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 157
    return-void
.end method

.method private static registerRestartPreference(Landroid/preference/PreferenceFragment;Landroid/preference/Preference;)V
    .locals 1
    .param p0, "fragment"    # Landroid/preference/PreferenceFragment;
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 160
    invoke-virtual {p0}, Landroid/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lio/mrarm/mcpelauncher/SettingsActivity;

    if-eqz v0, :cond_0

    .line 161
    invoke-virtual {p0}, Landroid/preference/PreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/SettingsActivity;

    invoke-direct {v0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity;->registerRestartPreference(Landroid/preference/Preference;)V

    .line 162
    :cond_0
    return-void
.end method

.method private setupActionBar()V
    .locals 2

    .prologue
    .line 174
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 175
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 177
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 179
    :cond_0
    return-void
.end method


# virtual methods
.method protected isValidFragment(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fragmentName"    # Ljava/lang/String;

    .prologue
    .line 203
    const-class v0, Landroid/preference/PreferenceFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;

    .line 204
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Lio/mrarm/mcpelauncher/SettingsActivity$AboutFragment;

    .line 205
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Lio/mrarm/mcpelauncher/SettingsActivity$TexturePacksFragment;

    .line 206
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Lio/mrarm/mcpelauncher/SettingsActivity$ModPEFragment;

    .line 207
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBuildHeaders(Ljava/util/List;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/preference/PreferenceActivity$Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 195
    .local p1, "target":Ljava/util/List;, "Ljava/util/List<Landroid/preference/PreferenceActivity$Header;>;"
    sget v0, Lio/mrarm/mcpelauncher/R$xml;->pref_headers:I

    invoke-virtual {p0, v0, p1}, Lio/mrarm/mcpelauncher/SettingsActivity;->loadHeadersFromResource(ILjava/util/List;)V

    .line 196
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 166
    invoke-super {p0, p1}, Lio/mrarm/mcpelauncher/AppCompatPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 167
    invoke-direct {p0}, Lio/mrarm/mcpelauncher/SettingsActivity;->setupActionBar()V

    .line 168
    return-void
.end method

.method public onIsMultiPane()Z
    .locals 1

    .prologue
    .line 186
    invoke-static {p0}, Lio/mrarm/mcpelauncher/SettingsActivity;->isXLargeTablet(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 213
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 214
    .local v0, "id":I
    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 215
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity;->onBackPressed()V

    .line 216
    const/4 v1, 0x1

    .line 218
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Lio/mrarm/mcpelauncher/AppCompatPreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method
