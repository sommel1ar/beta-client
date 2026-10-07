.class Lio/mrarm/mcpelauncher/SettingsActivity$2;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mrarm/mcpelauncher/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/SettingsActivity;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/SettingsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/SettingsActivity;

    .prologue
    .line 117
    iput-object p1, p0, Lio/mrarm/mcpelauncher/SettingsActivity$2;->this$0:Lio/mrarm/mcpelauncher/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 120
    sput-boolean v0, Lio/mrarm/mcpelauncher/SettingsActivity;->needsRestart:Z

    .line 121
    return v0
.end method
