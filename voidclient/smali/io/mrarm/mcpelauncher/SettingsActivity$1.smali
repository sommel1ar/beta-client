.class final Lio/mrarm/mcpelauncher/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 94
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "stringValue":Ljava/lang/String;
    instance-of v3, p1, Landroid/preference/ListPreference;

    if-eqz v3, :cond_1

    move-object v1, p1

    .line 99
    check-cast v1, Landroid/preference/ListPreference;

    .line 100
    .local v1, "listPreference":Landroid/preference/ListPreference;
    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 103
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 105
    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, v0

    .line 103
    :goto_0
    invoke-virtual {p1, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 113
    .end local v0    # "index":I
    .end local v1    # "listPreference":Landroid/preference/ListPreference;
    :goto_1
    const/4 v3, 0x1

    return v3

    .line 105
    .restart local v0    # "index":I
    .restart local v1    # "listPreference":Landroid/preference/ListPreference;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 111
    .end local v0    # "index":I
    .end local v1    # "listPreference":Landroid/preference/ListPreference;
    :cond_1
    invoke-virtual {p1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method
