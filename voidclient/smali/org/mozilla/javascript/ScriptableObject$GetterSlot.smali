.class final Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
.super Lorg/mozilla/javascript/ScriptableObject$Slot;
.source "ScriptableObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/ScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GetterSlot"
.end annotation


# static fields
.field static final serialVersionUID:J = -0x440256dc8cdfe294L


# instance fields
.field getter:Ljava/lang/Object;

.field setter:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "indexOrHash"    # I
    .param p3, "attributes"    # I

    .prologue
    .line 235
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject$Slot;-><init>(Ljava/lang/String;II)V

    .line 236
    return-void
.end method


# virtual methods
.method getPropertyDescriptor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 240
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getAttributes()I

    move-result v0

    .line 241
    .local v0, "attr":I
    new-instance v1, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v1}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 242
    .local v1, "desc":Lorg/mozilla/javascript/ScriptableObject;
    sget-object v2, Lorg/mozilla/javascript/TopLevel$Builtins;->Object:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v1, p2, v2}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    .line 243
    const-string v5, "enumerable"

    and-int/lit8 v2, v0, 0x2

    if-nez v2, :cond_2

    move v2, v3

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v5, v2, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 244
    const-string v2, "configurable"

    and-int/lit8 v5, v0, 0x4

    if-nez v5, :cond_3

    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 245
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v2, :cond_0

    const-string v2, "get"

    iget-object v3, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 246
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    if-eqz v2, :cond_1

    const-string v2, "set"

    iget-object v3, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 247
    :cond_1
    return-object v1

    :cond_2
    move v2, v4

    .line 243
    goto :goto_0

    :cond_3
    move v3, v4

    .line 244
    goto :goto_1
.end method

.method getValue(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 9
    .param p1, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 296
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v7, :cond_3

    .line 297
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    instance-of v7, v7, Lorg/mozilla/javascript/MemberBox;

    if-eqz v7, :cond_2

    .line 298
    iget-object v5, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    check-cast v5, Lorg/mozilla/javascript/MemberBox;

    .line 301
    .local v5, "nativeGetter":Lorg/mozilla/javascript/MemberBox;
    iget-object v7, v5, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    if-nez v7, :cond_1

    .line 302
    move-object v3, p1

    .line 303
    .local v3, "getterThis":Lorg/mozilla/javascript/Scriptable;
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 308
    .end local v3    # "getterThis":Lorg/mozilla/javascript/Scriptable;
    .local v0, "args":[Ljava/lang/Object;
    :goto_0
    invoke-virtual {v5, v3, v0}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 325
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v5    # "nativeGetter":Lorg/mozilla/javascript/MemberBox;
    :cond_0
    :goto_1
    return-object v6

    .line 305
    .restart local v5    # "nativeGetter":Lorg/mozilla/javascript/MemberBox;
    :cond_1
    iget-object v3, v5, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 306
    .local v3, "getterThis":Ljava/lang/Object;
    const/4 v7, 0x1

    new-array v0, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v0, v7

    .restart local v0    # "args":[Ljava/lang/Object;
    goto :goto_0

    .line 309
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v3    # "getterThis":Ljava/lang/Object;
    .end local v5    # "nativeGetter":Lorg/mozilla/javascript/MemberBox;
    :cond_2
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    instance-of v7, v7, Lorg/mozilla/javascript/Function;

    if-eqz v7, :cond_3

    .line 310
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    check-cast v2, Lorg/mozilla/javascript/Function;

    .line 311
    .local v2, "f":Lorg/mozilla/javascript/Function;
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 312
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    invoke-interface {v2}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v7

    sget-object v8, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v2, v1, v7, p1, v8}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_1

    .line 316
    .end local v1    # "cx":Lorg/mozilla/javascript/Context;
    .end local v2    # "f":Lorg/mozilla/javascript/Function;
    :cond_3
    iget-object v6, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 317
    .local v6, "val":Ljava/lang/Object;
    instance-of v7, v6, Lorg/mozilla/javascript/LazilyLoadedCtor;

    if-eqz v7, :cond_0

    move-object v4, v6

    .line 318
    check-cast v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    .line 320
    .local v4, "initializer":Lorg/mozilla/javascript/LazilyLoadedCtor;
    :try_start_0
    invoke-virtual {v4}, Lorg/mozilla/javascript/LazilyLoadedCtor;->init()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    invoke-virtual {v4}, Lorg/mozilla/javascript/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    goto :goto_1

    :catchall_0
    move-exception v7

    invoke-virtual {v4}, Lorg/mozilla/javascript/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    throw v7
.end method

.method markDeleted()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 330
    invoke-super {p0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->markDeleted()V

    .line 331
    iput-object v0, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 332
    iput-object v0, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 333
    return-void
.end method

.method setValue(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z
    .locals 12
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "owner"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 252
    iget-object v9, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    if-nez v9, :cond_1

    .line 253
    iget-object v9, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v9, :cond_5

    .line 254
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v9

    const/16 v10, 0xb

    invoke-virtual {v9, v10}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 257
    const-string v9, "msg.set.prop.no.setter"

    iget-object v10, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->name:Ljava/lang/String;

    invoke-static {v9, v10}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v9

    throw v9

    .line 261
    :cond_0
    const/4 v9, 0x1

    .line 291
    :goto_0
    return v9

    .line 264
    :cond_1
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    .line 265
    .local v2, "cx":Lorg/mozilla/javascript/Context;
    iget-object v9, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    instance-of v9, v9, Lorg/mozilla/javascript/MemberBox;

    if-eqz v9, :cond_4

    .line 266
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    check-cast v4, Lorg/mozilla/javascript/MemberBox;

    .line 267
    .local v4, "nativeSetter":Lorg/mozilla/javascript/MemberBox;
    iget-object v5, v4, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 270
    .local v5, "pTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v9, v5

    add-int/lit8 v9, v9, -0x1

    aget-object v8, v5, v9

    .line 271
    .local v8, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v8}, Lorg/mozilla/javascript/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v7

    .line 272
    .local v7, "tag":I
    invoke-static {v2, p3, p1, v7}, Lorg/mozilla/javascript/FunctionObject;->convertArg(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    .line 276
    .local v0, "actualArg":Ljava/lang/Object;
    iget-object v9, v4, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    if-nez v9, :cond_3

    .line 277
    move-object v6, p3

    .line 278
    .local v6, "setterThis":Lorg/mozilla/javascript/Scriptable;
    const/4 v9, 0x1

    new-array v1, v9, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v1, v9

    .line 283
    .end local v6    # "setterThis":Lorg/mozilla/javascript/Scriptable;
    .local v1, "args":[Ljava/lang/Object;
    :goto_1
    invoke-virtual {v4, v6, v1}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .end local v0    # "actualArg":Ljava/lang/Object;
    .end local v1    # "args":[Ljava/lang/Object;
    .end local v4    # "nativeSetter":Lorg/mozilla/javascript/MemberBox;
    .end local v5    # "pTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v7    # "tag":I
    .end local v8    # "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_2
    const/4 v9, 0x1

    goto :goto_0

    .line 280
    .restart local v0    # "actualArg":Ljava/lang/Object;
    .restart local v4    # "nativeSetter":Lorg/mozilla/javascript/MemberBox;
    .restart local v5    # "pTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v7    # "tag":I
    .restart local v8    # "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    iget-object v6, v4, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 281
    .local v6, "setterThis":Ljava/lang/Object;
    const/4 v9, 0x2

    new-array v1, v9, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p3, v1, v9

    const/4 v9, 0x1

    aput-object v0, v1, v9

    .restart local v1    # "args":[Ljava/lang/Object;
    goto :goto_1

    .line 284
    .end local v0    # "actualArg":Ljava/lang/Object;
    .end local v1    # "args":[Ljava/lang/Object;
    .end local v4    # "nativeSetter":Lorg/mozilla/javascript/MemberBox;
    .end local v5    # "pTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "setterThis":Ljava/lang/Object;
    .end local v7    # "tag":I
    .end local v8    # "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    iget-object v9, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    instance-of v9, v9, Lorg/mozilla/javascript/Function;

    if-eqz v9, :cond_2

    .line 285
    iget-object v3, p0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    check-cast v3, Lorg/mozilla/javascript/Function;

    .line 286
    .local v3, "f":Lorg/mozilla/javascript/Function;
    invoke-interface {v3}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v9

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-interface {v3, v2, v9, p3, v10}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 291
    .end local v2    # "cx":Lorg/mozilla/javascript/Context;
    .end local v3    # "f":Lorg/mozilla/javascript/Function;
    :cond_5
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setValue(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v9

    goto :goto_0
.end method
