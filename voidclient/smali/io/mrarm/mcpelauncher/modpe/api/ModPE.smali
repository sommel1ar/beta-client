.class public Lio/mrarm/mcpelauncher/modpe/api/ModPE;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "ModPE.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    return-void
.end method

.method public static crash()V
    .locals 0
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 168
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeCrash()V

    .line 169
    return-void
.end method

.method public static getBytesFromTexturePack(Ljava/lang/String;)[B
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 101
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-virtual {v0, p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getFileDataBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static getI18n(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 84
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeGetI18n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLanguage()Ljava/lang/String;
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 89
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeGetLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMinecraftVersion()Ljava/lang/String;
    .locals 4
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 28
    :try_start_0
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-virtual {v1}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "com.mojang.minecraftpe"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .local v0, "t":Ljava/lang/Throwable;
    :goto_0
    return-object v1

    .line 29
    .end local v0    # "t":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 30
    .restart local v0    # "t":Ljava/lang/Throwable;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static langEdit(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 94
    invoke-static {p0, p1}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeLangEdit(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public static leaveGame()V
    .locals 0
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 51
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeLeaveGame()V

    .line 52
    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 22
    const-string v0, "ModPE"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    return-void
.end method

.method private static native nativeCrash()V
.end method

.method private static native nativeGetI18n(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native nativeGetLanguage()Ljava/lang/String;
.end method

.method private static native nativeLangEdit(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static native nativeLeaveGame()V
.end method

.method private static native nativeResetFov()V
.end method

.method private static native nativeSelectLevel(Ljava/lang/String;)V
.end method

.method private static native nativeSetCamera(J)V
.end method

.method private static native nativeSetFov(F)V
.end method

.method private static native nativeSetGameSpeed(F)V
.end method

.method private static native nativeSetUiRenderDebug(Z)V
.end method

.method private static native nativeShowTipMessage(Ljava/lang/String;)V
.end method

.method private static native nativeTakeScreenshot()V
.end method

.method public static openInputStreamFromTexturePack(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 106
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 108
    :cond_0
    sget-object v0, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mrarm/mcpelauncher/MinecraftActivity;

    invoke-virtual {v0, p0}, Lio/mrarm/mcpelauncher/MinecraftActivity;->openAssetFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static overrideTexture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "texName"    # Ljava/lang/String;
    .param p1, "url"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 113
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->instance:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-virtual {v0, p0, p1}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->downloadTexture(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public static readData(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 140
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getConfigForCurrentScript()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, ""

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static removeData(Ljava/lang/String;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 145
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getConfigForCurrentScript()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 146
    return-void
.end method

.method public static resetFov()V
    .locals 0
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 41
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeResetFov()V

    .line 42
    return-void
.end method

.method public static resetImages()V
    .locals 1
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 118
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->instance:Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;

    invoke-virtual {v0}, Lio/mrarm/mcpelauncher/modpe/ModPETextureOverride;->reset()V

    .line 119
    return-void
.end method

.method public static saveData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 150
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getConfigForCurrentScript()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 151
    return-void
.end method

.method public static selectLevel(Ljava/lang/String;)V
    .locals 0
    .param p0, "dir"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 56
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeSelectLevel(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public static setCamera(Ljava/lang/Object;)V
    .locals 2
    .param p0, "eid"    # Ljava/lang/Object;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 61
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/Entity;->getEntityId(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeSetCamera(J)V

    .line 62
    return-void
.end method

.method public static setFoodItem(ILjava/lang/String;IILjava/lang/String;I)V
    .locals 2
    .param p0, "id"    # I
    .param p1, "iconName"    # Ljava/lang/String;
    .param p2, "iconIndex"    # I
    .param p3, "halfHearts"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "stackSize"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 162
    invoke-static {p0, p1, p2, p4, p5}, Lio/mrarm/mcpelauncher/modpe/api/Item;->setItem(ILjava/lang/String;ILjava/lang/String;I)V

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"use_animation\":\"eat\",\"use_duration\":32,\"food\":{\"nutrition\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"saturation_modifier\":\"normal\",\"is_meat\":false}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/api/Item;->setProperties(ILjava/lang/Object;)V

    .line 164
    return-void
.end method

.method public static setFov(D)V
    .locals 2
    .param p0, "fov"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 36
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeSetFov(F)V

    .line 37
    return-void
.end method

.method public static setGameSpeed(D)V
    .locals 2
    .param p0, "gameSpeed"    # D
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 46
    double-to-float v0, p0

    invoke-static {v0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeSetGameSpeed(F)V

    .line 47
    return-void
.end method

.method public static setGuiBlocks(Ljava/lang/String;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 123
    const-string v0, "gui/gui_blocks.png"

    invoke-static {v0, p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->overrideTexture(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method public static setItem(ILjava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "iconName"    # Ljava/lang/String;
    .param p2, "iconIndex"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "stackSize"    # I
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 157
    invoke-static {p0, p1, p2, p3, p4}, Lio/mrarm/mcpelauncher/modpe/api/Item;->setItem(ILjava/lang/String;ILjava/lang/String;I)V

    .line 158
    return-void
.end method

.method public static setItems(Ljava/lang/String;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 128
    const-string v0, "images/items-opaque.png"

    invoke-static {v0, p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->overrideTexture(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public static setTerrain(Ljava/lang/String;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 133
    const-string v0, "images/terrain-atlas.tga"

    invoke-static {v0, p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->overrideTexture(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public static setUiRenderDebug(Z)V
    .locals 0
    .param p0, "renderDebug"    # Z
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 66
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeSetUiRenderDebug(Z)V

    .line 67
    return-void
.end method

.method public static showTipMessage(Ljava/lang/String;)V
    .locals 0
    .param p0, "msg"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 71
    invoke-static {p0}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeShowTipMessage(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public static takeScreenshot(Ljava/lang/String;)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .annotation runtime Lorg/mozilla/javascript/annotations/JSStaticFunction;
    .end annotation

    .prologue
    .line 76
    sput-object p0, Lio/mrarm/mcpelauncher/modpe/ModPECallbacks;->screenshotName:Ljava/lang/String;

    .line 77
    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/ModPE;->nativeTakeScreenshot()V

    .line 78
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    const-string v0, "ModPE"

    return-object v0
.end method
