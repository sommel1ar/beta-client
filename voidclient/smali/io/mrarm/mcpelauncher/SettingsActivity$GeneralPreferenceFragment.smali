.class public Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;
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
    name = "GeneralPreferenceFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 222
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 225
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 226
    sget v1, Lio/mrarm/mcpelauncher/R$xml;->pref_general:I

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->addPreferencesFromResource(I)V

    .line 227
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->setHasOptionsMenu(Z)V

    .line 229
    const-string v1, "pixel_scale"

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {p0, v1}, Lio/mrarm/mcpelauncher/SettingsActivity;->access$000(Landroid/preference/PreferenceFragment;Landroid/preference/Preference;)V

    .line 231
    const-string v1, "pixel_scale"

    invoke-virtual {p0, v1}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v1}, Lio/mrarm/mcpelauncher/SettingsActivity;->access$100(Landroid/preference/Preference;)V

    .line 232
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 233
    .local v0, "prefs":Landroid/content/SharedPreferences;
    sget-boolean v1, Lio/mrarm/mcpelauncher/MainActivity;->currentVersionHasWarning:Z

    if-nez v1, :cond_0

    const-string v1, "disable_startup_warnings"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 234
    invoke-virtual {p0}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v2, "disable_startup_warnings"

    invoke-virtual {p0, v2}, Lio/mrarm/mcpelauncher/SettingsActivity$GeneralPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 235
    :cond_0
    return-void
.end method
