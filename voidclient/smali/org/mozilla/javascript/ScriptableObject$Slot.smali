.class Lorg/mozilla/javascript/ScriptableObject$Slot;
.super Ljava/lang/Object;
.source "ScriptableObject.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/ScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Slot"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x548617c41c7a8763L


# instance fields
.field private volatile attributes:S

.field indexOrHash:I

.field name:Ljava/lang/String;

.field transient next:Lorg/mozilla/javascript/ScriptableObject$Slot;

.field volatile transient orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

.field volatile value:Ljava/lang/Object;

.field volatile transient wasDeleted:Z


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "indexOrHash"    # I
    .param p3, "attributes"    # I

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p1, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    .line 162
    iput p2, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    .line 163
    int-to-short v0, p3

    iput-short v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->attributes:S

    .line 164
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/ScriptableObject$Slot;)S
    .locals 1
    .param p0, "x0"    # Lorg/mozilla/javascript/ScriptableObject$Slot;

    .prologue
    .line 148
    iget-short v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->attributes:S

    return v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 170
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    .line 173
    :cond_0
    return-void
.end method


# virtual methods
.method getAttributes()I
    .locals 1

    .prologue
    .line 193
    iget-short v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->attributes:S

    return v0
.end method

.method getPropertyDescriptor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 2
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 209
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    iget-short v1, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->attributes:S

    invoke-static {p2, v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->buildDataDescriptor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method getValue(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 188
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    return-object v0
.end method

.method markDeleted()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 203
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->wasDeleted:Z

    .line 204
    iput-object v1, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 205
    iput-object v1, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    .line 206
    return-void
.end method

.method declared-synchronized setAttributes(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 198
    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->checkValidAttributes(I)V

    .line 199
    int-to-short v0, p1

    iput-short v0, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->attributes:S
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    monitor-exit p0

    return-void

    .line 198
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setValue(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "owner"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v0, 0x1

    .line 176
    iget-short v1, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->attributes:S

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 183
    :goto_0
    return v0

    .line 179
    :cond_0
    if-ne p2, p3, :cond_1

    .line 180
    iput-object p1, p0, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    goto :goto_0

    .line 183
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
