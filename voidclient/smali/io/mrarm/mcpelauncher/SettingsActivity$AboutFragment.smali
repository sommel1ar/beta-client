.class public Lio/mrarm/mcpelauncher/SettingsActivity$AboutFragment;
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
    name = "AboutFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 693
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 696
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 698
    sget v0, Lio/mrarm/mcpelauncher/R$xml;->pref_about:I

    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/SettingsActivity$AboutFragment;->addPreferencesFromResource(I)V

    .line 699
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/mrarm/mcpelauncher/SettingsActivity$AboutFragment;->setHasOptionsMenu(Z)V

    .line 700
    return-void
.end method
