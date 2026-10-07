.class public Lcom/microsoft/xbox/idp/interop/Interop;
.super Ljava/lang/Object;
.source "Interop.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;,
        Lcom/microsoft/xbox/idp/interop/Interop$SilentXBLoginCallback;,
        Lcom/microsoft/xbox/idp/interop/Interop$XBLogoutCallback;,
        Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;,
        Lcom/microsoft/xbox/idp/interop/Interop$EventInitializationCallback;,
        Lcom/microsoft/xbox/idp/interop/Interop$ErrorCallback;,
        Lcom/microsoft/xbox/idp/interop/Interop$Callback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ClearIntent()V
    .locals 2

    .prologue
    .line 46
    const-string v0, "xbox/idp"

    const-string v1, "ClearIntent"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method public static GetLiveXTokenCallback(Z)Ljava/lang/String;
    .locals 2
    .param p0, "forceRefresh"    # Z

    .prologue
    .line 50
    const-string v0, "xbox/idp"

    const-string v1, "GetLiveXTokenCallback"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const-string v0, ""

    return-object v0
.end method

.method public static GetLocalStoragePath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const-string v0, "xbox/idp"

    const-string v1, "GetLocalStoragePath"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static GetXTokenCallback(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "xuid"    # Ljava/lang/String;

    .prologue
    .line 60
    const-string v0, "xbox/idp"

    const-string v1, "GetXTokenCallback"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const-string v0, ""

    return-object v0
.end method

.method public static InitCLL(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "iKey"    # Ljava/lang/String;

    .prologue
    .line 65
    const-string v0, "xbox/idp"

    const-string v1, "InitCLL"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    return-void
.end method

.method public static InvokeAuthFlow(JLandroid/app/Activity;Z)V
    .locals 4
    .param p0, "userPtr"    # J
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "isProd"    # Z

    .prologue
    .line 69
    const-string v1, "xbox/idp"

    const-string v2, "InvokeAuthFlow"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    new-instance v1, Lcom/microsoft/xbox/idp/interop/Interop$1;

    invoke-direct {v1, p2}, Lcom/microsoft/xbox/idp/interop/Interop$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p2, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 76
    invoke-static {p2}, Lio/mrarm/mcpelauncher/MSAHelper;->getMSA(Landroid/content/Context;)Lio/mrarm/msa/MSA;

    move-result-object v1

    invoke-virtual {v1}, Lio/mrarm/msa/MSA;->getAccounts()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 77
    new-instance v1, Lcom/microsoft/xbox/idp/interop/Interop$2;

    invoke-direct {v1, p2, p0, p1}, Lcom/microsoft/xbox/idp/interop/Interop$2;-><init>(Landroid/app/Activity;J)V

    invoke-virtual {p2, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 123
    :goto_0
    return-void

    .line 119
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lio/mrarm/mcpelauncher/XboxLoginActivity;

    invoke-direct {v0, p2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 120
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "NativeUserPtr"

    invoke-virtual {v0, v1, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 121
    invoke-virtual {p2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public static InvokeBrokeredMSA(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isProd"    # Z

    .prologue
    .line 126
    const-string v0, "xbox/idp"

    const-string v1, "InvokeBrokeredMSA"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return-void
.end method

.method public static InvokeEventInitialization(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$EventInitializationCallback;)V
    .locals 2
    .param p0, "l"    # J
    .param p2, "str"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/microsoft/xbox/idp/interop/Interop$EventInitializationCallback;

    .prologue
    .line 134
    const-string v0, "xbox/idp"

    const-string v1, "InvokeEventInitialization"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    return-void
.end method

.method public static InvokeEventInitialization(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isProd"    # Z

    .prologue
    .line 130
    const-string v0, "xbox/idp"

    const-string v1, "InvokeEventInitialization"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    return-void
.end method

.method public static InvokeLatestIntent(Landroid/app/Activity;Ljava/lang/Object;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "intent"    # Ljava/lang/Object;

    .prologue
    .line 138
    const-string v0, "xbox/idp"

    const-string v1, "InvokeLatestIntent"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void
.end method

.method public static InvokeMSA(Landroid/content/Context;IZLjava/lang/String;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "requestCode"    # I
    .param p2, "isProd"    # Z
    .param p3, "cid"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 142
    const-string v2, "xbox/idp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InvokeMSA "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    if-ne p1, v5, :cond_2

    .line 145
    invoke-static {}, Lcom/microsoft/xbox/idp/interop/Interop;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lio/mrarm/mcpelauncher/MSAHelper;->getLastAccount(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 146
    const-string v2, ""

    const-string v3, "Must show UI to acquire an account."

    invoke-static {v2, p1, v5, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->ticket_callback(Ljava/lang/String;IILjava/lang/String;)V

    .line 158
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    sget-object v2, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Lio/mrarm/mcpelauncher/MSAHelper;->getMSA(Landroid/content/Context;)Lio/mrarm/msa/MSA;

    move-result-object v0

    .line 149
    .local v0, "msa":Lio/mrarm/msa/MSA;
    invoke-static {}, Lcom/microsoft/xbox/idp/interop/Interop;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lio/mrarm/mcpelauncher/MSAHelper;->getLastAccount(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lio/mrarm/msa/MSA;->getAccountByEmail(Ljava/lang/String;)Lio/mrarm/msa/UserAccount;

    move-result-object v2

    new-array v3, v5, [Lio/mrarm/msa/SecurityScope;

    new-instance v4, Lio/mrarm/msa/SecurityScope;

    const-string v5, "user.auth.xboxlive.com"

    const-string v6, "mbi_ssl"

    invoke-direct {v4, v5, v6}, Lio/mrarm/msa/SecurityScope;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v4, v3, v7

    invoke-virtual {v2, v0, v3}, Lio/mrarm/msa/UserAccount;->requestTokens(Lio/mrarm/msa/MSA;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;

    move-result-object v1

    .line 150
    .local v1, "tokens":[Lio/mrarm/msa/Token;
    aget-object v2, v1, v7

    check-cast v2, Lio/mrarm/msa/CompactToken;

    invoke-virtual {v2}, Lio/mrarm/msa/CompactToken;->getStringToken()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Got ticket"

    invoke-static {v2, v7, v7, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->ticket_callback(Ljava/lang/String;IILjava/lang/String;)V

    goto :goto_0

    .line 153
    .end local v0    # "msa":Lio/mrarm/msa/MSA;
    .end local v1    # "tokens":[Lio/mrarm/msa/Token;
    :cond_2
    const/4 v2, 0x6

    if-ne p1, v2, :cond_0

    .line 155
    invoke-static {}, Lcom/microsoft/xbox/idp/interop/Interop;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lio/mrarm/mcpelauncher/MSAHelper;->setLastAccount(Landroid/content/Context;Ljava/lang/String;)V

    .line 156
    invoke-static {}, Lcom/microsoft/xbox/idp/interop/Interop;->sign_out_callback()V

    goto :goto_0
.end method

.method public static InvokeXBLogin(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;)V
    .locals 2
    .param p0, "userPtr"    # J
    .param p2, "rpsTicket"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;

    .prologue
    .line 161
    const-string v0, "xbox/idp"

    const-string v1, "InvokeXBLogin"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    invoke-static {p0, p1, p2, p3}, Lcom/microsoft/xbox/idp/interop/Interop;->invoke_xb_login(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;)V

    .line 163
    return-void
.end method

.method public static InvokeXBLogout(JLcom/microsoft/xbox/idp/interop/Interop$XBLogoutCallback;)V
    .locals 2
    .param p0, "userPtr"    # J
    .param p2, "callback"    # Lcom/microsoft/xbox/idp/interop/Interop$XBLogoutCallback;

    .prologue
    .line 166
    const-string v0, "xbox/idp"

    const-string v1, "InvokeXBLogout"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    return-void
.end method

.method public static InvokeXTokenCallback(JLcom/microsoft/xbox/idp/interop/Interop$Callback;)V
    .locals 2
    .param p0, "userPtr"    # J
    .param p2, "callback"    # Lcom/microsoft/xbox/idp/interop/Interop$Callback;

    .prologue
    .line 170
    const-string v0, "xbox/idp"

    const-string v1, "InvokeXTokenCallback"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    return-void
.end method

.method public static LogCLL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "xuid"    # Ljava/lang/String;
    .param p1, "evName"    # Ljava/lang/String;
    .param p2, "evData"    # Ljava/lang/String;

    .prologue
    .line 174
    const-string v0, "xbox/idp"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LogCLL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    return-void
.end method

.method public static NotificationRegisterCallback(Ljava/lang/String;Z)V
    .locals 2
    .param p0, "regId"    # Ljava/lang/String;
    .param p1, "isCached"    # Z

    .prologue
    .line 178
    const-string v0, "xbox/idp"

    const-string v1, "NotificationRegisterCallback"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    return-void
.end method

.method public static ReadConfigFile(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 182
    const-string v0, "xbox/idp"

    const-string v1, "ReadConfigFile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    const-string v0, "{\"TitleId\":1739947436,\n\"PrimaryServiceConfigId\":\"00000000-0000-0000-0000-000067b57dac\",\n\"FirstParty\":\"1\",\n\"OverrideTitleId\":896928775,\n\"OverrideServiceConfigId\":\"4fc10100-5f7a-4470-899b-280835760c07\"}"

    return-object v0
.end method

.method public static RegisterWithGNS(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 192
    const-string v0, "xbox/idp"

    const-string v1, "RegisterWithGNS"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    return-void
.end method

.method public static native auth_flow_callback(JILjava/lang/String;)V
.end method

.method public static native deinitializeInterop()Z
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .locals 2

    .prologue
    .line 26
    const-string v0, "xbox/idp"

    const-string v1, "getApplicationContext"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method public static getLocale()Ljava/lang/String;
    .locals 2

    .prologue
    .line 31
    const-string v0, "xbox/idp"

    const-string v1, "getLocale"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSystemProxy()Ljava/lang/String;
    .locals 5

    .prologue
    .line 36
    const-string v2, "xbox/idp"

    const-string v3, "getSystemProxy"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    const-string v2, "http.proxyPort"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "port":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 39
    const-string v1, ""

    .line 42
    :goto_0
    return-object v1

    .line 40
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "http.proxyHost"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "proxy":Ljava/lang/String;
    const-string v2, "xbox/idp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getSystemProxy returning "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static native get_supporting_x_token_callback(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native get_title_telemetry_device_id()Ljava/lang/String;
.end method

.method private static native get_title_telemetry_session_id()Ljava/lang/String;
.end method

.method private static native get_uploader_x_token_callback(Z)Ljava/lang/String;
.end method

.method public static native initializeInterop(Landroid/content/Context;)Z
.end method

.method private static native invoke_event_initialization(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$EventInitializationCallback;)V
.end method

.method private static native invoke_x_token_acquisition(JLcom/microsoft/xbox/idp/interop/Interop$Callback;)V
.end method

.method private static native invoke_xb_login(JLjava/lang/String;Lcom/microsoft/xbox/idp/interop/Interop$XBLoginCallback;)V
.end method

.method private static native invoke_xb_logout(JLcom/microsoft/xbox/idp/interop/Interop$XBLogoutCallback;)V
.end method

.method private static native notificiation_registration_callback(Ljava/lang/String;Z)V
.end method

.method private static native sign_out_callback()V
.end method

.method private static native ticket_callback(Ljava/lang/String;IILjava/lang/String;)V
.end method
