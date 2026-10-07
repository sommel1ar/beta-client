.class public abstract Leu/chainfire/libsuperuser/Policy;
.super Ljava/lang/Object;
.source "Policy.java"


# static fields
.field private static final MAX_POLICY_LENGTH:I = 0xfe0

.field private static volatile canInject:Ljava/lang/Boolean;

.field private static volatile injected:Z

.field private static final synchronizer:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    .line 56
    const/4 v0, 0x0

    sput-object v0, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    .line 57
    const/4 v0, 0x0

    sput-boolean v0, Leu/chainfire/libsuperuser/Policy;->injected:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canInject()Z
    .locals 7

    .prologue
    .line 90
    sget-object v3, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    monitor-enter v3

    .line 91
    :try_start_0
    sget-object v2, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    if-eqz v2, :cond_0

    sget-object v2, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    monitor-exit v3

    .line 109
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    return v2

    .line 93
    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    sput-object v2, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    .line 99
    const-string v2, "sh"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "supolicy"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v2, v4, v5, v6}, Leu/chainfire/libsuperuser/Shell;->run(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v1

    .line 100
    .restart local v1    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_2

    .line 101
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 102
    .local v0, "line":Ljava/lang/String;
    const-string v4, "supolicy"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 103
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    sput-object v2, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    .line 109
    .end local v0    # "line":Ljava/lang/String;
    :cond_2
    sget-object v2, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    monitor-exit v3

    goto :goto_0

    .line 110
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static haveInjected()Z
    .locals 1

    .prologue
    .line 63
    sget-boolean v0, Leu/chainfire/libsuperuser/Policy;->injected:Z

    return v0
.end method

.method public static resetCanInject()V
    .locals 2

    .prologue
    .line 117
    sget-object v1, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    monitor-enter v1

    .line 118
    const/4 v0, 0x0

    :try_start_0
    sput-object v0, Leu/chainfire/libsuperuser/Policy;->canInject:Ljava/lang/Boolean;

    .line 119
    monitor-exit v1

    .line 120
    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static resetInjected()V
    .locals 2

    .prologue
    .line 71
    sget-object v1, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    monitor-enter v1

    .line 72
    const/4 v0, 0x0

    :try_start_0
    sput-boolean v0, Leu/chainfire/libsuperuser/Policy;->injected:Z

    .line 73
    monitor-exit v1

    .line 74
    return-void

    .line 73
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method protected getInjectCommands()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Leu/chainfire/libsuperuser/Policy;->getInjectCommands(Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getInjectCommands(Z)Ljava/util/List;
    .locals 9
    .param p1, "allowBlocking"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 138
    sget-object v5, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    monitor-enter v5

    .line 140
    :try_start_0
    invoke-static {}, Leu/chainfire/libsuperuser/Shell$SU;->isSELinuxEnforcing()Z

    move-result v4

    if-nez v4, :cond_0

    monitor-exit v5

    .line 171
    :goto_0
    return-object v1

    .line 143
    :cond_0
    if-eqz p1, :cond_1

    invoke-static {}, Leu/chainfire/libsuperuser/Policy;->canInject()Z

    move-result v4

    if-nez v4, :cond_1

    monitor-exit v5

    goto :goto_0

    .line 172
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 146
    :cond_1
    :try_start_1
    sget-boolean v4, Leu/chainfire/libsuperuser/Policy;->injected:Z

    if-eqz v4, :cond_2

    monitor-exit v5

    goto :goto_0

    .line 149
    :cond_2
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Policy;->getPolicies()[Ljava/lang/String;

    move-result-object v2

    .line 150
    .local v2, "policies":[Ljava/lang/String;
    if-eqz v2, :cond_7

    array-length v4, v2

    if-lez v4, :cond_7

    .line 151
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, ""

    .line 155
    .local v0, "command":Ljava/lang/String;
    array-length v6, v2

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v6, :cond_5

    aget-object v3, v2, v4

    .line 156
    .local v3, "policy":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x3

    const/16 v8, 0xfe0

    if-ge v7, v8, :cond_4

    .line 157
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 155
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 159
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "supolicy --live"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    const-string v0, ""

    goto :goto_2

    .line 163
    .end local v3    # "policy":Ljava/lang/String;
    :cond_5
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_6

    .line 164
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "supolicy --live"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    :cond_6
    monitor-exit v5

    goto/16 :goto_0

    .line 171
    .end local v0    # "command":Ljava/lang/String;
    .end local v1    # "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_7
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0
.end method

.method protected abstract getPolicies()[Ljava/lang/String;
.end method

.method public inject()V
    .locals 3

    .prologue
    .line 180
    sget-object v2, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    monitor-enter v2

    .line 182
    :try_start_0
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Policy;->getInjectCommands()Ljava/util/List;

    move-result-object v0

    .line 185
    .local v0, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 186
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$SU;->run(Ljava/util/List;)Ljava/util/List;

    .line 190
    :cond_0
    const/4 v1, 0x1

    sput-boolean v1, Leu/chainfire/libsuperuser/Policy;->injected:Z

    .line 191
    monitor-exit v2

    .line 192
    return-void

    .line 191
    .end local v0    # "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public inject(Leu/chainfire/libsuperuser/Shell$Interactive;Z)V
    .locals 3
    .param p1, "shell"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p2, "waitForIdle"    # Z

    .prologue
    .line 204
    sget-object v2, Leu/chainfire/libsuperuser/Policy;->synchronizer:Ljava/lang/Object;

    monitor-enter v2

    .line 206
    :try_start_0
    invoke-virtual {p0, p2}, Leu/chainfire/libsuperuser/Policy;->getInjectCommands(Z)Ljava/util/List;

    move-result-object v0

    .line 209
    .local v0, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 210
    invoke-virtual {p1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand(Ljava/util/List;)V

    .line 211
    if-eqz p2, :cond_0

    .line 212
    invoke-virtual {p1}, Leu/chainfire/libsuperuser/Shell$Interactive;->waitForIdle()Z

    .line 217
    :cond_0
    const/4 v1, 0x1

    sput-boolean v1, Leu/chainfire/libsuperuser/Policy;->injected:Z

    .line 218
    monitor-exit v2

    .line 219
    return-void

    .line 218
    .end local v0    # "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
