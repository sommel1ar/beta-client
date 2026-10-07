.class public Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;
.super Ljava/lang/Object;
.source "ModPEScriptLoader.java"


# static fields
.field public static currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

.field private static loadScriptException:Ljava/lang/Throwable;

.field public static scripts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 47
    sput-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->scripts:Ljava/util/ArrayList;

    .line 98
    sput-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptException:Ljava/lang/Throwable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 0
    .param p0, "x0"    # Ljava/lang/Throwable;

    .prologue
    .line 45
    sput-object p0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptException:Ljava/lang/Throwable;

    return-object p0
.end method

.method public static getConfigForCurrentScript()Landroid/content/SharedPreferences;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 230
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    iget-object v0, v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->name:Ljava/lang/String;

    .line 231
    .local v0, "name":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 232
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 233
    :cond_0
    sget-object v1, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ModPEScript_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Lio/mrarm/mcpelauncher/MinecraftActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    return-object v1
.end method

.method public static getModPEDir(Landroid/app/Activity;)Ljava/io/File;
    .locals 3
    .param p0, "context"    # Landroid/app/Activity;

    .prologue
    .line 237
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "modpe"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getZipTexturePackPaths()Ljava/util/Set;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 176
    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 177
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string v6, "modpe_enabled"

    const/4 v7, 0x0

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    .line 178
    .local v1, "enabledModPEs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 179
    .local v4, "ret":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v6, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/Activity;

    invoke-static {v6}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getModPEDir(Landroid/app/Activity;)Ljava/io/File;

    move-result-object v0

    .line 180
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    if-nez v1, :cond_1

    .line 190
    :cond_0
    return-object v4

    .line 182
    :cond_1
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 184
    .local v2, "file":Ljava/lang/String;
    :try_start_0
    const-string v7, ".modpkg"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, ".mpep"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 185
    :cond_3
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v5

    .line 187
    .local v5, "t":Ljava/lang/Throwable;
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static loadScript(Ljava/lang/String;Ljava/io/Reader;)V
    .locals 1
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "rdr"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScript(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public static loadScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    const/4 v7, 0x0

    .line 52
    invoke-static {}, Lorg/mozilla/javascript/Context;->enter()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 53
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Lorg/mozilla/javascript/Context;->setOptimizationLevel(I)V

    .line 54
    sget-object v6, Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;->instance:Lio/mrarm/mcpelauncher/modpe/SafeWrapFactory;

    invoke-virtual {v1, v6}, Lorg/mozilla/javascript/Context;->setWrapFactory(Lorg/mozilla/javascript/WrapFactory;)V

    .line 55
    new-instance v6, Lio/mrarm/mcpelauncher/modpe/api/Global;

    invoke-direct {v6}, Lio/mrarm/mcpelauncher/modpe/api/Global;-><init>()V

    invoke-virtual {v1, v6, v7}, Lorg/mozilla/javascript/Context;->initStandardObjects(Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v4

    .line 57
    .local v4, "scope":Lorg/mozilla/javascript/Scriptable;
    :try_start_0
    move-object v0, v4

    check-cast v0, Lorg/mozilla/javascript/ScriptableObject;

    move-object v6, v0

    const/16 v7, 0x1c

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "preventDefault"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "print"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "addItemInventory"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    const-string v9, "getPlayerX"

    aput-object v9, v7, v8

    const/4 v8, 0x4

    const-string v9, "getPlayerY"

    aput-object v9, v7, v8

    const/4 v8, 0x5

    const-string v9, "getPlayerZ"

    aput-object v9, v7, v8

    const/4 v8, 0x6

    const-string v9, "getPlayerEnt"

    aput-object v9, v7, v8

    const/4 v8, 0x7

    const-string v9, "clientMessage"

    aput-object v9, v7, v8

    const/16 v8, 0x8

    const-string v9, "explode"

    aput-object v9, v7, v8

    const/16 v8, 0x9

    const-string v9, "getTile"

    aput-object v9, v7, v8

    const/16 v8, 0xa

    const-string v9, "setTile"

    aput-object v9, v7, v8

    const/16 v8, 0xb

    const-string v9, "bl_spawnMob"

    aput-object v9, v7, v8

    const/16 v8, 0xc

    const-string v9, "bl_setMobSkin"

    aput-object v9, v7, v8

    const/16 v8, 0xd

    const-string v9, "getPitch"

    aput-object v9, v7, v8

    const/16 v8, 0xe

    const-string v9, "getYaw"

    aput-object v9, v7, v8

    const/16 v8, 0xf

    const-string v9, "rideAnimal"

    aput-object v9, v7, v8

    const/16 v8, 0x10

    const-string v9, "setPosition"

    aput-object v9, v7, v8

    const/16 v8, 0x11

    const-string v9, "setPositionRelative"

    aput-object v9, v7, v8

    const/16 v8, 0x12

    const-string v9, "setRot"

    aput-object v9, v7, v8

    const/16 v8, 0x13

    const-string v9, "setVelX"

    aput-object v9, v7, v8

    const/16 v8, 0x14

    const-string v9, "setVelY"

    aput-object v9, v7, v8

    const/16 v8, 0x15

    const-string v9, "setVelZ"

    aput-object v9, v7, v8

    const/16 v8, 0x16

    const-string v9, "spawnChicken"

    aput-object v9, v7, v8

    const/16 v8, 0x17

    const-string v9, "spawnCow"

    aput-object v9, v7, v8

    const/16 v8, 0x18

    const-string v9, "spawnPigZombie"

    aput-object v9, v7, v8

    const/16 v8, 0x19

    const-string v9, "setNightMode"

    aput-object v9, v7, v8

    const/16 v8, 0x1a

    const-string v9, "getCarriedItem"

    aput-object v9, v7, v8

    const/16 v8, 0x1b

    const-string v9, "print"

    aput-object v9, v7, v8

    const-class v8, Lio/mrarm/mcpelauncher/modpe/api/Global;

    const/4 v9, 0x2

    invoke-virtual {v6, v7, v8, v9}, Lorg/mozilla/javascript/ScriptableObject;->defineFunctionProperties([Ljava/lang/String;Ljava/lang/Class;I)V

    .line 65
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/ModPE;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 66
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Level;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 67
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Entity;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 68
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Player;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 69
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Item;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 70
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Block;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 71
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Renderer;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 72
    const-class v6, Lio/mrarm/mcpelauncher/modpe/api/Server;

    invoke-static {v4, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    .line 73
    const-string v6, "ChatColor"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getChatColors()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 74
    const-string v6, "BlockFace"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getBlockFaces()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    const-string v6, "ArmorType"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getArmorTypes()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    const-string v6, "MobEffect"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getMobEffects()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    const-string v6, "ItemCategory"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getItemCategories()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    const-string v6, "ParticleType"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getParticleTypes()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 79
    const-string v6, "EntityType"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getEntityTypes()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    const-string v6, "EntityRenderType"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getEntityRenderTypes()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 81
    const-string v6, "DimensionId"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getDimensionIds()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    const-string v6, "UseAnimation"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getUseAnimations()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    const-string v6, "Enchantment"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getEnchantments()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    const-string v6, "EnchantmentTypes"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getEnchantmentTypes()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    const-string v6, "BlockRenderLayer"

    invoke-static {}, Lio/mrarm/mcpelauncher/modpe/api/Consts;->getBlockRenderLayers()Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :goto_0
    invoke-virtual {v1, p1, p0, v10, v11}, Lorg/mozilla/javascript/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v5

    .line 90
    .local v5, "script":Lorg/mozilla/javascript/Script;
    new-instance v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    invoke-direct {v3, v5, p0, v4}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;-><init>(Lorg/mozilla/javascript/Script;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)V

    .line 91
    .local v3, "info":Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;
    sput-object v3, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 92
    invoke-interface {v5, v1, v4}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    .line 93
    sput-object v11, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 94
    sget-object v6, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    invoke-static {}, Lorg/mozilla/javascript/Context;->exit()V

    .line 96
    return-void

    .line 86
    .end local v3    # "info":Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;
    .end local v5    # "script":Lorg/mozilla/javascript/Script;
    :catch_0
    move-exception v2

    .line 87
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static loadScriptFromFile(Ljava/io/File;)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScript(Ljava/lang/String;Ljava/io/Reader;)V

    .line 140
    return-void
.end method

.method public static loadScriptFromFileViaThread(Ljava/io/File;)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-static {v0, v1}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptViaThread(Ljava/lang/String;Ljava/io/Reader;)V

    .line 144
    return-void
.end method

.method public static loadScriptViaThread(Ljava/lang/String;Ljava/io/Reader;)V
    .locals 1
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "rdr"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 135
    invoke-static {p1}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptViaThread(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public static loadScriptViaThread(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v1, 0x0

    sput-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptException:Ljava/lang/Throwable;

    .line 102
    new-instance v0, Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v1

    new-instance v2, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;

    invoke-direct {v2, p0, p1}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$1;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "Script Loader"

    const-wide/32 v4, 0x40000

    invoke-direct/range {v0 .. v5}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;J)V

    .line 112
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 113
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V

    .line 114
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptException:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 115
    sget-object v1, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptException:Ljava/lang/Throwable;

    throw v1

    .line 117
    :cond_0
    return-void
.end method

.method public static loadScripts()V
    .locals 12

    .prologue
    .line 147
    sget-object v8, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/Activity;

    invoke-static {v8}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->getModPEDir(Landroid/app/Activity;)Ljava/io/File;

    move-result-object v0

    .line 148
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_1

    .line 173
    :cond_0
    return-void

    .line 150
    :cond_1
    sget-object v8, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/Context;

    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 151
    .local v5, "prefs":Landroid/content/SharedPreferences;
    const-string v8, "modpe_enabled"

    const/4 v9, 0x0

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    .line 152
    .local v1, "enabledModPEs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    .line 154
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 156
    .local v4, "file":Ljava/lang/String;
    :try_start_0
    const-string v9, ".modpkg"

    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    const-string v9, ".mpep"

    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 157
    :cond_3
    new-instance v7, Ljava/util/zip/ZipFile;

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v7, v9}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 158
    .local v7, "zip":Ljava/util/zip/ZipFile;
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v2

    .line 159
    .local v2, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_4
    :goto_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 160
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/zip/ZipEntry;

    .line 161
    .local v3, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "script/"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 162
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/io/InputStreamReader;

    .line 163
    invoke-virtual {v7, v3}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 162
    invoke-static {v9, v10}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptViaThread(Ljava/lang/String;Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 169
    .end local v2    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v3    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "zip":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v6

    .line 170
    .local v6, "t":Ljava/lang/Throwable;
    invoke-static {v6, v4}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->throwScriptError(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_0

    .line 167
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_5
    :try_start_1
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v9}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->loadScriptFromFileViaThread(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static native nativeInit(III)V
.end method

.method private static readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 4
    .param p0, "rdr"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .local v0, "builder":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 123
    .local v2, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 127
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static throwScriptError(Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 226
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->throwScriptError(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method public static throwScriptError(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 7
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "fallbackStringName"    # Ljava/lang/String;

    .prologue
    .line 194
    sget-object v0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    .line 195
    .local v0, "brokenScript":Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;
    if-eqz v0, :cond_0

    .line 196
    const/4 v4, 0x1

    iput-boolean v4, v0, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->isDisabled:Z

    .line 197
    :cond_0
    sget-object v4, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    if-nez v4, :cond_2

    if-nez p1, :cond_1

    const-string v2, "Unknown"

    .line 199
    .local v2, "scriptName":Ljava/lang/String;
    :goto_0
    const-string v4, "ModPE/Loader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error in script "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 201
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 202
    .local v3, "str":Ljava/io/StringWriter;
    new-instance v4, Ljava/io/PrintWriter;

    invoke-direct {v4, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p0, v4}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 203
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "ex":Ljava/lang/String;
    sget-object v4, Lio/mrarm/mcpelauncher/MinecraftActivity;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/mrarm/mcpelauncher/MinecraftActivity;

    new-instance v5, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;

    invoke-direct {v5, v2, v1, v0}, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader$2;-><init>(Ljava/lang/String;Ljava/lang/String;Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;)V

    invoke-virtual {v4, v5}, Lio/mrarm/mcpelauncher/MinecraftActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 223
    return-void

    .end local v1    # "ex":Ljava/lang/String;
    .end local v2    # "scriptName":Ljava/lang/String;
    .end local v3    # "str":Ljava/io/StringWriter;
    :cond_1
    move-object v2, p1

    .line 197
    goto :goto_0

    :cond_2
    sget-object v4, Lio/mrarm/mcpelauncher/modpe/ModPEScriptLoader;->currentScript:Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;

    iget-object v2, v4, Lio/mrarm/mcpelauncher/modpe/ModPEScriptInfo;->name:Ljava/lang/String;

    goto :goto_0
.end method
