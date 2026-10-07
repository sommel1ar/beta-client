.class Lio/mrarm/mcpelauncher/ErrorActivity$6;
.super Ljava/lang/Object;
.source "ErrorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mrarm/mcpelauncher/ErrorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mrarm/mcpelauncher/ErrorActivity;


# direct methods
.method constructor <init>(Lio/mrarm/mcpelauncher/ErrorActivity;)V
    .locals 0
    .param p1, "this$0"    # Lio/mrarm/mcpelauncher/ErrorActivity;

    .prologue
    .line 138
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$6;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 141
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$6;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 142
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "modpe_enabled"

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 143
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 144
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$6;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    const-class v3, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 145
    .local v1, "i":Landroid/content/Intent;
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$6;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v2, v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 146
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$6;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v2}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V

    .line 147
    return-void
.end method
