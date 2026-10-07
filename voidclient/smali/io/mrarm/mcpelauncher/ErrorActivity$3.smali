.class Lio/mrarm/mcpelauncher/ErrorActivity$3;
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
    .line 103
    iput-object p1, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 106
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 107
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "skipped_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v3}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$100(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 108
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 109
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v2}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 110
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    iget-object v3, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-static {v3}, Lio/mrarm/mcpelauncher/ErrorActivity;->access$000(Lio/mrarm/mcpelauncher/ErrorActivity;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 111
    .local v1, "i":Landroid/content/Intent;
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v2, v1}, Lio/mrarm/mcpelauncher/ErrorActivity;->startActivity(Landroid/content/Intent;)V

    .line 113
    .end local v1    # "i":Landroid/content/Intent;
    :cond_0
    iget-object v2, p0, Lio/mrarm/mcpelauncher/ErrorActivity$3;->this$0:Lio/mrarm/mcpelauncher/ErrorActivity;

    invoke-virtual {v2}, Lio/mrarm/mcpelauncher/ErrorActivity;->finish()V

    .line 114
    return-void
.end method
