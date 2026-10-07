.class public Lorg/mozilla/javascript/ImporterTopLevel;
.super Lorg/mozilla/javascript/TopLevel;
.source "ImporterTopLevel.java"


# static fields
.field private static final IMPORTER_TAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final Id_importClass:I = 0x2

.field private static final Id_importPackage:I = 0x3

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field static final serialVersionUID:J = -0x7e3948b0fe0fbc54L


# instance fields
.field private importedPackages:Lorg/mozilla/javascript/ObjArray;

.field private topScopeFlag:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "Importer"

    sput-object v0, Lorg/mozilla/javascript/ImporterTopLevel;->IMPORTER_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/mozilla/javascript/TopLevel;-><init>()V

    .line 288
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Context;)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>(Lorg/mozilla/javascript/Context;Z)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Context;Z)V
    .locals 1
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "sealed"    # Z

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/mozilla/javascript/TopLevel;-><init>()V

    .line 288
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    .line 54
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/ImporterTopLevel;->initStandardObjects(Lorg/mozilla/javascript/Context;Z)V

    .line 55
    return-void
.end method

.method private getPackageProperty(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 104
    sget-object v3, Lorg/mozilla/javascript/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    .line 106
    .local v3, "result":Ljava/lang/Object;
    iget-object v6, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    monitor-enter v6

    .line 107
    :try_start_0
    iget-object v5, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ObjArray;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 108
    .local v0, "elements":[Ljava/lang/Object;
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v0

    if-ge v1, v5, :cond_2

    .line 110
    aget-object v2, v0, v1

    check-cast v2, Lorg/mozilla/javascript/NativeJavaPackage;

    .line 111
    .local v2, "p":Lorg/mozilla/javascript/NativeJavaPackage;
    const/4 v5, 0x0

    invoke-virtual {v2, p1, p2, v5}, Lorg/mozilla/javascript/NativeJavaPackage;->getPkgProperty(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Z)Ljava/lang/Object;

    move-result-object v4

    .line 112
    .local v4, "v":Ljava/lang/Object;
    if-eqz v4, :cond_0

    instance-of v5, v4, Lorg/mozilla/javascript/NativeJavaPackage;

    if-nez v5, :cond_0

    .line 113
    sget-object v5, Lorg/mozilla/javascript/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v5, :cond_1

    .line 114
    move-object v3, v4

    .line 109
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 108
    .end local v0    # "elements":[Ljava/lang/Object;
    .end local v1    # "i":I
    .end local v2    # "p":Lorg/mozilla/javascript/NativeJavaPackage;
    .end local v4    # "v":Ljava/lang/Object;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 116
    .restart local v0    # "elements":[Ljava/lang/Object;
    .restart local v1    # "i":I
    .restart local v2    # "p":Lorg/mozilla/javascript/NativeJavaPackage;
    .restart local v4    # "v":Ljava/lang/Object;
    :cond_1
    const-string v5, "msg.ambig.import"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v5

    throw v5

    .line 121
    .end local v2    # "p":Lorg/mozilla/javascript/NativeJavaPackage;
    .end local v4    # "v":Ljava/lang/Object;
    :cond_2
    return-object v3
.end method

.method private importClass(Lorg/mozilla/javascript/NativeJavaClass;)V
    .locals 4
    .param p1, "cl"    # Lorg/mozilla/javascript/NativeJavaClass;

    .prologue
    .line 201
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 202
    .local v1, "s":Ljava/lang/String;
    const/16 v3, 0x2e

    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "n":Ljava/lang/String;
    invoke-virtual {p0, v0, p0}, Lorg/mozilla/javascript/ImporterTopLevel;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 204
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_0

    if-eq v2, p1, :cond_0

    .line 205
    const-string v3, "msg.prop.defined"

    invoke-static {v3, v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 208
    :cond_0
    invoke-virtual {p0, v0, p0, p1}, Lorg/mozilla/javascript/ImporterTopLevel;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 209
    return-void
.end method

.method private importPackage(Lorg/mozilla/javascript/NativeJavaPackage;)V
    .locals 3
    .param p1, "pkg"    # Lorg/mozilla/javascript/NativeJavaPackage;

    .prologue
    .line 186
    if-nez p1, :cond_0

    .line 197
    :goto_0
    return-void

    .line 189
    :cond_0
    iget-object v2, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    monitor-enter v2

    .line 190
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_1
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v1}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v1

    if-eq v0, v1, :cond_2

    .line 191
    iget-object v1, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/NativeJavaPackage;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 192
    monitor-exit v2

    goto :goto_0

    .line 196
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 190
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 195
    :cond_2
    :try_start_1
    iget-object v1, p0, Lorg/mozilla/javascript/ImporterTopLevel;->importedPackages:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 196
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    .line 65
    new-instance v0, Lorg/mozilla/javascript/ImporterTopLevel;

    invoke-direct {v0}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>()V

    .line 66
    .local v0, "obj":Lorg/mozilla/javascript/ImporterTopLevel;
    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1, p2}, Lorg/mozilla/javascript/ImporterTopLevel;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 67
    return-void
.end method

.method private js_construct(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 136
    new-instance v2, Lorg/mozilla/javascript/ImporterTopLevel;

    invoke-direct {v2}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>()V

    .line 137
    .local v2, "result":Lorg/mozilla/javascript/ImporterTopLevel;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-eq v1, v3, :cond_2

    .line 138
    aget-object v0, p2, v1

    .line 139
    .local v0, "arg":Ljava/lang/Object;
    instance-of v3, v0, Lorg/mozilla/javascript/NativeJavaClass;

    if-eqz v3, :cond_0

    .line 140
    check-cast v0, Lorg/mozilla/javascript/NativeJavaClass;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-direct {v2, v0}, Lorg/mozilla/javascript/ImporterTopLevel;->importClass(Lorg/mozilla/javascript/NativeJavaClass;)V

    .line 137
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_0
    instance-of v3, v0, Lorg/mozilla/javascript/NativeJavaPackage;

    if-eqz v3, :cond_1

    .line 142
    check-cast v0, Lorg/mozilla/javascript/NativeJavaPackage;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-direct {v2, v0}, Lorg/mozilla/javascript/ImporterTopLevel;->importPackage(Lorg/mozilla/javascript/NativeJavaPackage;)V

    goto :goto_1

    .line 144
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_1
    const-string v3, "msg.not.class.not.pkg"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 153
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_2
    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ImporterTopLevel;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 154
    invoke-virtual {v2, p0}, Lorg/mozilla/javascript/ImporterTopLevel;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 155
    return-object v2
.end method

.method private js_importClass([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 160
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-eq v1, v2, :cond_1

    .line 161
    aget-object v0, p1, v1

    .line 162
    .local v0, "arg":Ljava/lang/Object;
    instance-of v2, v0, Lorg/mozilla/javascript/NativeJavaClass;

    if-nez v2, :cond_0

    .line 163
    const-string v2, "msg.not.class"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 166
    :cond_0
    check-cast v0, Lorg/mozilla/javascript/NativeJavaClass;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/ImporterTopLevel;->importClass(Lorg/mozilla/javascript/NativeJavaClass;)V

    .line 160
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 168
    :cond_1
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v2
.end method

.method private js_importPackage([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 173
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-eq v1, v2, :cond_1

    .line 174
    aget-object v0, p1, v1

    .line 175
    .local v0, "arg":Ljava/lang/Object;
    instance-of v2, v0, Lorg/mozilla/javascript/NativeJavaPackage;

    if-nez v2, :cond_0

    .line 176
    const-string v2, "msg.not.pkg"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 179
    :cond_0
    check-cast v0, Lorg/mozilla/javascript/NativeJavaPackage;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/ImporterTopLevel;->importPackage(Lorg/mozilla/javascript/NativeJavaPackage;)V

    .line 173
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 181
    :cond_1
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v2
.end method

.method private realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/ImporterTopLevel;
    .locals 1
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 248
    iget-boolean v0, p0, Lorg/mozilla/javascript/ImporterTopLevel;->topScopeFlag:Z

    if-eqz v0, :cond_0

    .line 255
    .end local p0    # "this":Lorg/mozilla/javascript/ImporterTopLevel;
    .end local p1    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    return-object p0

    .line 253
    .restart local p0    # "this":Lorg/mozilla/javascript/ImporterTopLevel;
    .restart local p1    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    instance-of v0, p1, Lorg/mozilla/javascript/ImporterTopLevel;

    if-nez v0, :cond_1

    .line 254
    invoke-static {p2}, Lorg/mozilla/javascript/ImporterTopLevel;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 255
    :cond_1
    check-cast p1, Lorg/mozilla/javascript/ImporterTopLevel;

    .end local p1    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    move-object p0, p1

    goto :goto_0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 229
    sget-object v1, Lorg/mozilla/javascript/ImporterTopLevel;->IMPORTER_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 230
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/TopLevel;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 241
    :goto_0
    return-object v1

    .line 232
    :cond_0
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 233
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 243
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 235
    :pswitch_0
    invoke-direct {p0, p3, p5}, Lorg/mozilla/javascript/ImporterTopLevel;->js_construct(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 238
    :pswitch_1
    invoke-direct {p0, p4, p1}, Lorg/mozilla/javascript/ImporterTopLevel;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/ImporterTopLevel;

    move-result-object v1

    invoke-direct {v1, p5}, Lorg/mozilla/javascript/ImporterTopLevel;->js_importClass([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 241
    :pswitch_2
    invoke-direct {p0, p4, p1}, Lorg/mozilla/javascript/ImporterTopLevel;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/ImporterTopLevel;

    move-result-object v1

    invoke-direct {v1, p5}, Lorg/mozilla/javascript/ImporterTopLevel;->js_importPackage([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 233
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 265
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 266
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 267
    .local v3, "s_length":I
    const/16 v4, 0xb

    if-ne v3, v4, :cond_3

    .line 268
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 269
    .local v1, "c":I
    const/16 v4, 0x63

    if-ne v1, v4, :cond_2

    const-string v0, "constructor"

    const/4 v2, 0x1

    .line 273
    .end local v1    # "c":I
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v2, 0x0

    .line 277
    :cond_1
    return v2

    .line 270
    .restart local v1    # "c":I
    :cond_2
    const/16 v4, 0x69

    if-ne v1, v4, :cond_0

    const-string v0, "importClass"

    const/4 v2, 0x2

    goto :goto_0

    .line 272
    .end local v1    # "c":I
    :cond_3
    const/16 v4, 0xd

    if-ne v3, v4, :cond_0

    const-string v0, "importPackage"

    const/4 v2, 0x3

    goto :goto_0
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 96
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/TopLevel;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 97
    .local v0, "result":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_0

    move-object v1, v0

    .line 100
    .end local v0    # "result":Ljava/lang/Object;
    .local v1, "result":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 99
    .end local v1    # "result":Ljava/lang/Object;
    .restart local v0    # "result":Ljava/lang/Object;
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ImporterTopLevel;->getPackageProperty(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    .line 100
    .end local v0    # "result":Ljava/lang/Object;
    .restart local v1    # "result":Ljava/lang/Object;
    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-boolean v0, p0, Lorg/mozilla/javascript/ImporterTopLevel;->topScopeFlag:Z

    if-eqz v0, :cond_0

    const-string v0, "global"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "JavaImporter"

    goto :goto_0
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 90
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/TopLevel;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ImporterTopLevel;->getPackageProperty(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public importPackage(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Function;)V
    .locals 0
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "funObj"    # Lorg/mozilla/javascript/Function;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 131
    invoke-direct {p0, p3}, Lorg/mozilla/javascript/ImporterTopLevel;->js_importPackage([Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    return-void
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 216
    packed-switch p1, :pswitch_data_0

    .line 220
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 217
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 222
    .local v1, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lorg/mozilla/javascript/ImporterTopLevel;->IMPORTER_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/ImporterTopLevel;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 223
    return-void

    .line 218
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "importClass"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 219
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "importPackage"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 216
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public initStandardObjects(Lorg/mozilla/javascript/Context;Z)V
    .locals 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "sealed"    # Z

    .prologue
    .line 73
    invoke-virtual {p1, p0, p2}, Lorg/mozilla/javascript/Context;->initStandardObjects(Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/ScriptableObject;

    .line 74
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/javascript/ImporterTopLevel;->topScopeFlag:Z

    .line 78
    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p0, v2}, Lorg/mozilla/javascript/ImporterTopLevel;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    move-result-object v0

    .line 79
    .local v0, "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    if-eqz p2, :cond_0

    .line 80
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 85
    :cond_0
    const-string v1, "constructor"

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ImporterTopLevel;->delete(Ljava/lang/String;)V

    .line 86
    return-void
.end method
