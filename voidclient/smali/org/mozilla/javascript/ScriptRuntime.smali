.class public Lorg/mozilla/javascript/ScriptRuntime;
.super Ljava/lang/Object;
.source "ScriptRuntime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/ScriptRuntime$DefaultMessageProvider;,
        Lorg/mozilla/javascript/ScriptRuntime$MessageProvider;,
        Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;,
        Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    }
.end annotation


# static fields
.field public static final BooleanClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ByteClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final CharacterClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ClassClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ContextClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ContextFactoryClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final DEFAULT_NS_TAG:Ljava/lang/String; = "__default_namespace__"

.field public static final DateClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final DoubleClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ENUMERATE_ARRAY:I = 0x2

.field public static final ENUMERATE_ARRAY_NO_ITERATOR:I = 0x5

.field public static final ENUMERATE_KEYS:I = 0x0

.field public static final ENUMERATE_KEYS_NO_ITERATOR:I = 0x3

.field public static final ENUMERATE_VALUES:I = 0x1

.field public static final ENUMERATE_VALUES_NO_ITERATOR:I = 0x4

.field public static final FloatClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final FunctionClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final IntegerClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final LIBRARY_SCOPE_KEY:Ljava/lang/Object;

.field public static final LongClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final NaN:D

.field public static final NaNobj:Ljava/lang/Double;

.field public static final NumberClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ObjectClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static ROOT_LOCALE:Ljava/util/Locale;

.field public static final ScriptableClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<",
            "Lorg/mozilla/javascript/Scriptable;",
            ">;"
        }
    .end annotation
.end field

.field public static final ScriptableObjectClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final ShortClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final StringClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final emptyArgs:[Ljava/lang/Object;

.field public static final emptyStrings:[Ljava/lang/String;

.field public static messageProvider:Lorg/mozilla/javascript/ScriptRuntime$MessageProvider;

.field public static final negativeZero:D


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 112
    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    .line 113
    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    .line 114
    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    .line 115
    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    .line 116
    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    .line 117
    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    .line 118
    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    .line 119
    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->LongClass:Ljava/lang/Class;

    .line 120
    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    .line 121
    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    .line 122
    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    .line 123
    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    .line 124
    const-string v0, "java.util.Date"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->DateClass:Ljava/lang/Class;

    .line 127
    const-string v0, "org.mozilla.javascript.Context"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    .line 129
    const-string v0, "org.mozilla.javascript.ContextFactory"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    .line 131
    const-string v0, "org.mozilla.javascript.Function"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    .line 133
    const-string v0, "org.mozilla.javascript.ScriptableObject"

    invoke-static {v0}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableObjectClass:Ljava/lang/Class;

    .line 135
    const-class v0, Lorg/mozilla/javascript/Scriptable;

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    .line 139
    new-instance v0, Ljava/util/Locale;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    .line 141
    const-string v0, "LIBRARY_SCOPE"

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->LIBRARY_SCOPE_KEY:Ljava/lang/Object;

    .line 448
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    sput-wide v0, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    .line 452
    const-wide/high16 v0, -0x8000000000000000L

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    sput-wide v0, Lorg/mozilla/javascript/ScriptRuntime;->negativeZero:D

    .line 454
    new-instance v0, Ljava/lang/Double;

    sget-wide v2, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    invoke-direct {v0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    .line 3885
    new-instance v0, Lorg/mozilla/javascript/ScriptRuntime$DefaultMessageProvider;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime$DefaultMessageProvider;-><init>(Lorg/mozilla/javascript/ScriptRuntime$1;)V

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->messageProvider:Lorg/mozilla/javascript/ScriptRuntime$MessageProvider;

    .line 4270
    new-array v0, v4, [Ljava/lang/Object;

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 4271
    new-array v0, v4, [Ljava/lang/String;

    sput-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyStrings:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static add(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "val1"    # Ljava/lang/CharSequence;
    .param p1, "val2"    # Ljava/lang/Object;

    .prologue
    .line 2745
    new-instance v0, Lorg/mozilla/javascript/ConsString;

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static add(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/CharSequence;

    .prologue
    .line 2749
    new-instance v0, Lorg/mozilla/javascript/ConsString;

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static add(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 6
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v3, 0x0

    .line 2715
    instance-of v1, p0, Ljava/lang/Number;

    if-eqz v1, :cond_1

    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_1

    .line 2716
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "val1":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    move-object v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2741
    :cond_0
    :goto_0
    return-object v0

    .line 2719
    .restart local p0    # "val1":Ljava/lang/Object;
    :cond_1
    instance-of v1, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v1, :cond_2

    move-object v1, p0

    .line 2720
    check-cast v1, Lorg/mozilla/javascript/xml/XMLObject;

    const/4 v2, 0x1

    invoke-virtual {v1, p2, v2, p1}, Lorg/mozilla/javascript/xml/XMLObject;->addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2721
    .local v0, "test":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 2725
    .end local v0    # "test":Ljava/lang/Object;
    :cond_2
    instance-of v1, p1, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v1, :cond_3

    move-object v1, p1

    .line 2726
    check-cast v1, Lorg/mozilla/javascript/xml/XMLObject;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2, p0}, Lorg/mozilla/javascript/xml/XMLObject;->addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2727
    .restart local v0    # "test":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 2731
    .end local v0    # "test":Ljava/lang/Object;
    :cond_3
    instance-of v1, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_4

    .line 2732
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "val1":Ljava/lang/Object;
    invoke-interface {p0, v3}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 2733
    .restart local p0    # "val1":Ljava/lang/Object;
    :cond_4
    instance-of v1, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_5

    .line 2734
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .end local p1    # "val2":Ljava/lang/Object;
    invoke-interface {p1, v3}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 2735
    .restart local p1    # "val2":Ljava/lang/Object;
    :cond_5
    instance-of v1, p0, Ljava/lang/CharSequence;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/CharSequence;

    if-nez v1, :cond_7

    .line 2736
    instance-of v1, p0, Ljava/lang/Number;

    if-eqz v1, :cond_6

    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_6

    .line 2737
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "val1":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    move-object v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    goto :goto_0

    .line 2740
    .restart local p0    # "val1":Ljava/lang/Object;
    :cond_6
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    goto :goto_0

    .line 2741
    :cond_7
    new-instance v0, Lorg/mozilla/javascript/ConsString;

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public static addInstructionCount(Lorg/mozilla/javascript/Context;I)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "instructionsToAdd"    # I

    .prologue
    .line 3324
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 3325
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    iget v1, p0, Lorg/mozilla/javascript/Context;->instructionThreshold:I

    if-le v0, v1, :cond_0

    .line 3327
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Context;->observeInstructionCount(I)V

    .line 3328
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 3330
    :cond_0
    return-void
.end method

.method public static applyOrCall(ZLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "isApply"    # Z
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 2559
    array-length v0, p4

    .line 2560
    .local v0, "L":I
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->getCallable(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v3

    .line 2562
    .local v3, "function":Lorg/mozilla/javascript/Callable;
    const/4 v2, 0x0

    .line 2563
    .local v2, "callThis":Lorg/mozilla/javascript/Scriptable;
    if-eqz v0, :cond_0

    .line 2564
    aget-object v4, p4, v6

    invoke-static {p1, v4, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 2566
    :cond_0
    if-nez v2, :cond_1

    .line 2568
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 2572
    :cond_1
    if-eqz p0, :cond_3

    .line 2574
    if-gt v0, v5, :cond_2

    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 2586
    .local v1, "callArgs":[Ljava/lang/Object;
    :goto_0
    invoke-interface {v3, p1, p2, v2, v1}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 2574
    .end local v1    # "callArgs":[Ljava/lang/Object;
    :cond_2
    aget-object v4, p4, v5

    invoke-static {p1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->getApplyArguments(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 2578
    :cond_3
    if-gt v0, v5, :cond_4

    .line 2579
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .restart local v1    # "callArgs":[Ljava/lang/Object;
    goto :goto_0

    .line 2581
    .end local v1    # "callArgs":[Ljava/lang/Object;
    :cond_4
    add-int/lit8 v4, v0, -0x1

    new-array v1, v4, [Ljava/lang/Object;

    .line 2582
    .restart local v1    # "callArgs":[Ljava/lang/Object;
    add-int/lit8 v4, v0, -0x1

    invoke-static {p4, v5, v1, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static bind(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 1966
    const/4 v0, 0x0

    .line 1967
    .local v0, "firstXMLObject":Lorg/mozilla/javascript/Scriptable;
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1968
    .local v1, "parent":Lorg/mozilla/javascript/Scriptable;
    if-eqz v1, :cond_3

    .line 1970
    :cond_0
    instance-of v4, p1, Lorg/mozilla/javascript/NativeWith;

    if-eqz v4, :cond_6

    .line 1971
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 1972
    .local v2, "withObj":Lorg/mozilla/javascript/Scriptable;
    instance-of v4, v2, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v4, :cond_5

    move-object v3, v2

    .line 1973
    check-cast v3, Lorg/mozilla/javascript/xml/XMLObject;

    .line 1974
    .local v3, "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v3, p0, p2}, Lorg/mozilla/javascript/xml/XMLObject;->has(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2011
    .end local v2    # "withObj":Lorg/mozilla/javascript/Scriptable;
    .end local v3    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_0
    return-object v3

    .line 1977
    .restart local v2    # "withObj":Lorg/mozilla/javascript/Scriptable;
    .restart local v3    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_1
    if-nez v0, :cond_2

    .line 1978
    move-object v0, v3

    .line 1985
    .end local v3    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_2
    move-object p1, v1

    .line 1986
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1987
    if-nez v1, :cond_0

    .line 2003
    .end local v2    # "withObj":Lorg/mozilla/javascript/Scriptable;
    :cond_3
    :goto_1
    iget-boolean v4, p0, Lorg/mozilla/javascript/Context;->useDynamicScope:Z

    if-eqz v4, :cond_4

    .line 2004
    iget-object v4, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v4, p1}, Lorg/mozilla/javascript/ScriptRuntime;->checkDynamicScope(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 2006
    :cond_4
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    move-object v3, p1

    .line 2007
    goto :goto_0

    .line 1981
    .restart local v2    # "withObj":Lorg/mozilla/javascript/Scriptable;
    :cond_5
    invoke-static {v2, p2}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v3, v2

    .line 1982
    goto :goto_0

    .line 1992
    .end local v2    # "withObj":Lorg/mozilla/javascript/Scriptable;
    :cond_6
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    move-object v3, p1

    .line 1993
    goto :goto_0

    .line 1995
    :cond_7
    move-object p1, v1

    .line 1996
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1997
    if-nez v1, :cond_6

    goto :goto_1

    :cond_8
    move-object v3, v0

    .line 2011
    goto :goto_0
.end method

.method public static call(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "fun"    # Ljava/lang/Object;
    .param p2, "thisArg"    # Ljava/lang/Object;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1101
    instance-of v2, p1, Lorg/mozilla/javascript/Function;

    if-nez v2, :cond_0

    .line 1102
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    :cond_0
    move-object v0, p1

    .line 1104
    check-cast v0, Lorg/mozilla/javascript/Function;

    .line 1105
    .local v0, "function":Lorg/mozilla/javascript/Function;
    invoke-static {p0, p2, p4}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1106
    .local v1, "thisObj":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_1

    .line 1107
    const-string v2, "function"

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1109
    :cond_1
    invoke-interface {v0, p0, p4, v1, p3}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static callRef(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Ref;
    .locals 6
    .param p0, "function"    # Lorg/mozilla/javascript/Callable;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 2479
    instance-of v3, p0, Lorg/mozilla/javascript/RefCallable;

    if-eqz v3, :cond_0

    move-object v2, p0

    .line 2480
    check-cast v2, Lorg/mozilla/javascript/RefCallable;

    .line 2481
    .local v2, "rfunction":Lorg/mozilla/javascript/RefCallable;
    invoke-interface {v2, p3, p1, p2}, Lorg/mozilla/javascript/RefCallable;->refCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    .line 2482
    .local v1, "ref":Lorg/mozilla/javascript/Ref;
    if-nez v1, :cond_1

    .line 2483
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".refCall() returned null"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2488
    .end local v1    # "ref":Lorg/mozilla/javascript/Ref;
    .end local v2    # "rfunction":Lorg/mozilla/javascript/RefCallable;
    :cond_0
    const-string v3, "msg.no.ref.from.function"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2490
    .local v0, "msg":Ljava/lang/String;
    const-string v3, "ReferenceError"

    invoke-static {v3, v0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 2485
    .end local v0    # "msg":Ljava/lang/String;
    .restart local v1    # "ref":Lorg/mozilla/javascript/Ref;
    .restart local v2    # "rfunction":Lorg/mozilla/javascript/RefCallable;
    :cond_1
    return-object v1
.end method

.method public static callSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;
    .locals 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "fun"    # Lorg/mozilla/javascript/Callable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "callerThis"    # Lorg/mozilla/javascript/Scriptable;
    .param p6, "callType"    # I
    .param p7, "filename"    # Ljava/lang/String;
    .param p8, "lineNumber"    # I

    .prologue
    .line 2514
    const/4 v0, 0x1

    if-ne p6, v0, :cond_0

    .line 2515
    invoke-interface {p2}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-static {p1}, Lorg/mozilla/javascript/NativeGlobal;->isEvalFunction(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v0, p0

    move-object v1, p4

    move-object v2, p5

    move-object v3, p3

    move-object v4, p7

    move v5, p8

    .line 2516
    invoke-static/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptRuntime;->evalSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    .line 2528
    :goto_0
    return-object v0

    .line 2519
    :cond_0
    const/4 v0, 0x2

    if-ne p6, v0, :cond_1

    .line 2520
    invoke-static {p1}, Lorg/mozilla/javascript/NativeWith;->isWithFunction(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2521
    const-string v0, "msg.only.from.new"

    const-string v1, "With"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0

    .line 2525
    :cond_1
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 2528
    :cond_2
    invoke-interface {p1, p0, p4, p2, p3}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method static checkDeprecated(Lorg/mozilla/javascript/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 3825
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v1

    .line 3826
    .local v1, "version":I
    const/16 v2, 0x8c

    if-ge v1, v2, :cond_0

    if-nez v1, :cond_1

    .line 3827
    :cond_0
    const-string v2, "msg.deprec.ctor"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 3828
    .local v0, "msg":Ljava/lang/String;
    if-nez v1, :cond_2

    .line 3829
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 3833
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    return-void

    .line 3831
    .restart local v0    # "msg":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method static checkDynamicScope(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "possibleDynamicScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "staticTopScope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3307
    if-ne p0, p1, :cond_1

    .line 3317
    .end local p0    # "possibleDynamicScope":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    :goto_0
    return-object p0

    .line 3310
    .restart local p0    # "possibleDynamicScope":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    move-object v0, p0

    .line 3312
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_2
    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 3313
    if-eq v0, p1, :cond_0

    .line 3316
    if-nez v0, :cond_2

    move-object p0, p1

    .line 3317
    goto :goto_0
.end method

.method public static checkRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4088
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v0

    .line 4089
    .local v0, "result":Lorg/mozilla/javascript/RegExpProxy;
    if-nez v0, :cond_0

    .line 4090
    const-string v1, "msg.no.regexp"

    invoke-static {v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    throw v1

    .line 4092
    :cond_0
    return-object v0
.end method

.method public static cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 3214
    instance-of v4, p0, Ljava/lang/Number;

    if-eqz v4, :cond_0

    instance-of v4, p1, Ljava/lang/Number;

    if-eqz v4, :cond_0

    move-object v4, p0

    .line 3215
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .local v0, "d1":D
    move-object v4, p1

    .line 3216
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 3228
    .local v2, "d2":D
    :goto_0
    cmpg-double v4, v0, v2

    if-gtz v4, :cond_5

    :goto_1
    move v4, v5

    .end local v0    # "d1":D
    .end local v2    # "d2":D
    :goto_2
    return v4

    .line 3218
    :cond_0
    instance-of v4, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_1

    .line 3219
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "val1":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {p0, v4}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 3220
    .restart local p0    # "val1":Ljava/lang/Object;
    :cond_1
    instance-of v4, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_2

    .line 3221
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .end local p1    # "val2":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {p1, v4}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 3222
    .restart local p1    # "val2":Ljava/lang/Object;
    :cond_2
    instance-of v4, p0, Ljava/lang/CharSequence;

    if-eqz v4, :cond_4

    instance-of v4, p1, Ljava/lang/CharSequence;

    if-eqz v4, :cond_4

    .line 3223
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-gtz v4, :cond_3

    move v4, v5

    goto :goto_2

    :cond_3
    move v4, v6

    goto :goto_2

    .line 3225
    :cond_4
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 3226
    .restart local v0    # "d1":D
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .restart local v2    # "d2":D
    goto :goto_0

    :cond_5
    move v5, v6

    .line 3228
    goto :goto_1
.end method

.method public static cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 3194
    instance-of v4, p0, Ljava/lang/Number;

    if-eqz v4, :cond_0

    instance-of v4, p1, Ljava/lang/Number;

    if-eqz v4, :cond_0

    move-object v4, p0

    .line 3195
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .local v0, "d1":D
    move-object v4, p1

    .line 3196
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 3208
    .local v2, "d2":D
    :goto_0
    cmpg-double v4, v0, v2

    if-gez v4, :cond_5

    :goto_1
    move v4, v5

    .end local v0    # "d1":D
    .end local v2    # "d2":D
    :goto_2
    return v4

    .line 3198
    :cond_0
    instance-of v4, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_1

    .line 3199
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "val1":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {p0, v4}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 3200
    .restart local p0    # "val1":Ljava/lang/Object;
    :cond_1
    instance-of v4, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_2

    .line 3201
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .end local p1    # "val2":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {p1, v4}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 3202
    .restart local p1    # "val2":Ljava/lang/Object;
    :cond_2
    instance-of v4, p0, Ljava/lang/CharSequence;

    if-eqz v4, :cond_4

    instance-of v4, p1, Ljava/lang/CharSequence;

    if-eqz v4, :cond_4

    .line 3203
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_3

    move v4, v5

    goto :goto_2

    :cond_3
    move v4, v6

    goto :goto_2

    .line 3205
    :cond_4
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 3206
    .restart local v0    # "d1":D
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .restart local v2    # "d2":D
    goto :goto_0

    :cond_5
    move v5, v6

    .line 3208
    goto :goto_1
.end method

.method public static constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;
    .locals 7
    .param p0, "error"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 3927
    const/4 v0, 0x1

    new-array v6, v0, [I

    .line 3928
    .local v6, "linep":[I
    invoke-static {v6}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 3929
    .local v2, "filename":Ljava/lang/String;
    aget v3, v6, v5

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static constructError(Ljava/lang/String;Ljava/lang/String;I)Lorg/mozilla/javascript/EcmaError;
    .locals 7
    .param p0, "error"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "lineNumberDelta"    # I

    .prologue
    const/4 v5, 0x0

    .line 3936
    const/4 v0, 0x1

    new-array v6, v0, [I

    .line 3937
    .local v6, "linep":[I
    invoke-static {v6}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 3938
    .local v2, "filename":Ljava/lang/String;
    aget v0, v6, v5

    if-eqz v0, :cond_0

    .line 3939
    aget v0, v6, v5

    add-int/2addr v0, p2

    aput v0, v6, v5

    .line 3941
    :cond_0
    aget v3, v6, v5

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lorg/mozilla/javascript/EcmaError;
    .locals 7
    .param p0, "error"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "columnNumber"    # I

    .prologue
    .line 3951
    new-instance v0, Lorg/mozilla/javascript/EcmaError;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/EcmaError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    return-object v0
.end method

.method public static createFunctionActivation(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "funObj"    # Lorg/mozilla/javascript/NativeFunction;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 3376
    new-instance v0, Lorg/mozilla/javascript/NativeCall;

    invoke-direct {v0, p0, p1, p2}, Lorg/mozilla/javascript/NativeCall;-><init>(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private static currentXMLLib(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xml/XMLLib;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4103
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    if-nez v1, :cond_0

    .line 4104
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 4106
    :cond_0
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->cachedXMLLib:Lorg/mozilla/javascript/xml/XMLLib;

    .line 4107
    .local v0, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    if-nez v0, :cond_2

    .line 4108
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1}, Lorg/mozilla/javascript/xml/XMLLib;->extractFromScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .line 4109
    if-nez v0, :cond_1

    .line 4110
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 4111
    :cond_1
    iput-object v0, p0, Lorg/mozilla/javascript/Context;->cachedXMLLib:Lorg/mozilla/javascript/xml/XMLLib;

    .line 4114
    :cond_2
    return-object v0
.end method

.method static defaultObjectToSource(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 13
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v12, 0x0

    .line 927
    iget-object v10, p0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    if-nez v10, :cond_2

    .line 928
    const/4 v8, 0x1

    .line 929
    .local v8, "toplevel":Z
    const/4 v5, 0x0

    .line 930
    .local v5, "iterating":Z
    new-instance v10, Lorg/mozilla/javascript/ObjToIntMap;

    const/16 v11, 0x1f

    invoke-direct {v10, v11}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    iput-object v10, p0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    .line 936
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v10, 0x80

    invoke-direct {v6, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 937
    .local v6, "result":Ljava/lang/StringBuilder;
    if-eqz v8, :cond_0

    .line 938
    const-string v10, "("

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 940
    :cond_0
    const/16 v10, 0x7b

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 945
    if-nez v5, :cond_9

    .line 946
    :try_start_0
    iget-object v10, p0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v10, p2}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 947
    invoke-interface {p2}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v3

    .line 948
    .local v3, "ids":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v10, v3

    if-ge v1, v10, :cond_9

    .line 949
    aget-object v2, v3, v1

    .line 951
    .local v2, "id":Ljava/lang/Object;
    instance-of v10, v2, Ljava/lang/Integer;

    if-eqz v10, :cond_6

    .line 952
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "id":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 953
    .local v4, "intId":I
    invoke-interface {p2, v4, p2}, Lorg/mozilla/javascript/Scriptable;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v9

    .line 954
    .local v9, "value":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v9, v10, :cond_3

    .line 948
    .end local v4    # "intId":I
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 932
    .end local v1    # "i":I
    .end local v3    # "ids":[Ljava/lang/Object;
    .end local v5    # "iterating":Z
    .end local v6    # "result":Ljava/lang/StringBuilder;
    .end local v8    # "toplevel":Z
    .end local v9    # "value":Ljava/lang/Object;
    :cond_2
    const/4 v8, 0x0

    .line 933
    .restart local v8    # "toplevel":Z
    iget-object v10, p0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v10, p2}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v5

    .restart local v5    # "iterating":Z
    goto :goto_0

    .line 956
    .restart local v1    # "i":I
    .restart local v3    # "ids":[Ljava/lang/Object;
    .restart local v4    # "intId":I
    .restart local v6    # "result":Ljava/lang/StringBuilder;
    .restart local v9    # "value":Ljava/lang/Object;
    :cond_3
    if-lez v1, :cond_4

    .line 957
    :try_start_1
    const-string v10, ", "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 958
    :cond_4
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 975
    .end local v4    # "intId":I
    :goto_3
    const/16 v10, 0x3a

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 976
    invoke-static {p0, p1, v9}, Lorg/mozilla/javascript/ScriptRuntime;->uneval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 980
    .end local v1    # "i":I
    .end local v3    # "ids":[Ljava/lang/Object;
    .end local v9    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception v10

    if-eqz v8, :cond_5

    .line 981
    iput-object v12, p0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    :cond_5
    throw v10

    .line 960
    .restart local v1    # "i":I
    .restart local v2    # "id":Ljava/lang/Object;
    .restart local v3    # "ids":[Ljava/lang/Object;
    :cond_6
    :try_start_2
    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v7, v0

    .line 961
    .local v7, "strId":Ljava/lang/String;
    invoke-interface {p2, v7, p2}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v9

    .line 962
    .restart local v9    # "value":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_1

    .line 964
    if-lez v1, :cond_7

    .line 965
    const-string v10, ", "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 966
    :cond_7
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->isValidIdentifierName(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 967
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 969
    :cond_8
    const/16 v10, 0x27

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 970
    const/16 v10, 0x27

    invoke-static {v7, v10}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 972
    const/16 v10, 0x27

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    .line 980
    .end local v1    # "i":I
    .end local v2    # "id":Ljava/lang/Object;
    .end local v3    # "ids":[Ljava/lang/Object;
    .end local v7    # "strId":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/Object;
    :cond_9
    if-eqz v8, :cond_a

    .line 981
    iput-object v12, p0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    .line 985
    :cond_a
    const/16 v10, 0x7d

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 986
    if-eqz v8, :cond_b

    .line 987
    const/16 v10, 0x29

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 989
    :cond_b
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method static defaultObjectToString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/String;
    .locals 2
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 834
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[object "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1795
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "isName"    # Z

    .prologue
    .line 1831
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1832
    .local v1, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_1

    .line 1833
    if-eqz p4, :cond_0

    .line 1834
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1839
    :goto_0
    return-object v2

    .line 1836
    :cond_0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->undefDeleteError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1838
    :cond_1
    invoke-static {v1, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->deleteObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v0

    .line 1839
    .local v0, "result":Z
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_0
.end method

.method public static delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Z)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "isName"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1814
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static deleteObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z
    .locals 5
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1716
    invoke-static {p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1717
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_2

    .line 1718
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v0

    .line 1719
    .local v0, "index":I
    invoke-interface {p0, v0}, Lorg/mozilla/javascript/Scriptable;->delete(I)V

    .line 1720
    invoke-interface {p0, v0, p0}, Lorg/mozilla/javascript/Scriptable;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1723
    .end local v0    # "index":I
    :cond_0
    :goto_0
    return v2

    .restart local v0    # "index":I
    :cond_1
    move v2, v3

    .line 1720
    goto :goto_0

    .line 1722
    .end local v0    # "index":I
    :cond_2
    invoke-interface {p0, v1}, Lorg/mozilla/javascript/Scriptable;->delete(Ljava/lang/String;)V

    .line 1723
    invoke-interface {p0, v1, p0}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0
.end method

.method private static doScriptableIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 8
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "protoChainStart"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "incrDecrMask"    # I

    .prologue
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 2836
    and-int/lit8 v4, p4, 0x2

    if-eqz v4, :cond_1

    const/4 v2, 0x1

    .line 2838
    .local v2, "post":Z
    :goto_0
    instance-of v4, p3, Ljava/lang/Number;

    if-eqz v4, :cond_2

    move-object v4, p3

    .line 2839
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 2847
    .end local p3    # "value":Ljava/lang/Object;
    .local v0, "number":D
    :cond_0
    :goto_1
    and-int/lit8 v4, p4, 0x1

    if-nez v4, :cond_3

    .line 2848
    add-double/2addr v0, v6

    .line 2852
    :goto_2
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2853
    .local v3, "result":Ljava/lang/Number;
    invoke-interface {p0, p1, p2, v3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2854
    if-eqz v2, :cond_4

    .line 2857
    :goto_3
    return-object p3

    .line 2836
    .end local v0    # "number":D
    .end local v2    # "post":Z
    .end local v3    # "result":Ljava/lang/Number;
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 2841
    .restart local v2    # "post":Z
    :cond_2
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 2842
    .restart local v0    # "number":D
    if-eqz v2, :cond_0

    .line 2844
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object p3

    .local p3, "value":Ljava/lang/Number;
    goto :goto_1

    .line 2850
    .end local p3    # "value":Ljava/lang/Number;
    :cond_3
    sub-double/2addr v0, v6

    goto :goto_2

    .restart local v3    # "result":Ljava/lang/Number;
    :cond_4
    move-object p3, v3

    .line 2857
    goto :goto_3
.end method

.method public static doTopCall(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p0, "callable"    # Lorg/mozilla/javascript/Callable;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 3273
    if-nez p2, :cond_0

    .line 3274
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 3275
    :cond_0
    iget-object v1, p1, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 3278
    :cond_1
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    iput-object v1, p1, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    .line 3279
    const/4 v1, 0x7

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v1

    iput-boolean v1, p1, Lorg/mozilla/javascript/Context;->useDynamicScope:Z

    .line 3280
    invoke-virtual {p1}, Lorg/mozilla/javascript/Context;->getFactory()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v0

    .local v0, "f":Lorg/mozilla/javascript/ContextFactory;
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 3282
    :try_start_0
    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/ContextFactory;->doTopCall(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    .line 3284
    .local v6, "result":Ljava/lang/Object;
    iput-object v7, p1, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    .line 3286
    iput-object v7, p1, Lorg/mozilla/javascript/Context;->cachedXMLLib:Lorg/mozilla/javascript/xml/XMLLib;

    .line 3288
    iget-object v1, p1, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    if-eqz v1, :cond_3

    .line 3291
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 3284
    .end local v6    # "result":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    iput-object v7, p1, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    .line 3286
    iput-object v7, p1, Lorg/mozilla/javascript/Context;->cachedXMLLib:Lorg/mozilla/javascript/xml/XMLLib;

    .line 3288
    iget-object v2, p1, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    if-eqz v2, :cond_2

    .line 3291
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    :cond_2
    throw v1

    .line 3294
    .restart local v6    # "result":Ljava/lang/Object;
    :cond_3
    return-object v6
.end method

.method public static elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "index"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2868
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;
    .locals 8
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "index"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "incrDecrMask"    # I

    .prologue
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 2875
    invoke-static {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 2876
    .local v4, "value":Ljava/lang/Object;
    and-int/lit8 v5, p4, 0x2

    if-eqz v5, :cond_1

    const/4 v2, 0x1

    .line 2878
    .local v2, "post":Z
    :goto_0
    instance-of v5, v4, Ljava/lang/Number;

    if-eqz v5, :cond_2

    move-object v5, v4

    .line 2879
    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 2887
    .end local v4    # "value":Ljava/lang/Object;
    .local v0, "number":D
    :cond_0
    :goto_1
    and-int/lit8 v5, p4, 0x1

    if-nez v5, :cond_3

    .line 2888
    add-double/2addr v0, v6

    .line 2892
    :goto_2
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2893
    .local v3, "result":Ljava/lang/Number;
    invoke-static {p0, p1, v3, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    .line 2894
    if-eqz v2, :cond_4

    .line 2897
    :goto_3
    return-object v4

    .line 2876
    .end local v0    # "number":D
    .end local v2    # "post":Z
    .end local v3    # "result":Ljava/lang/Number;
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 2881
    .restart local v2    # "post":Z
    :cond_2
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 2882
    .restart local v0    # "number":D
    if-eqz v2, :cond_0

    .line 2884
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .local v4, "value":Ljava/lang/Number;
    goto :goto_1

    .line 2890
    .end local v4    # "value":Ljava/lang/Number;
    :cond_3
    sub-double/2addr v0, v6

    goto :goto_2

    .restart local v3    # "result":Ljava/lang/Number;
    :cond_4
    move-object v4, v3

    .line 2897
    goto :goto_3
.end method

.method public static enterActivationFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3383
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    if-nez v1, :cond_0

    .line 3384
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    :cond_0
    move-object v0, p1

    .line 3385
    check-cast v0, Lorg/mozilla/javascript/NativeCall;

    .line 3386
    .local v0, "call":Lorg/mozilla/javascript/NativeCall;
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    iput-object v1, v0, Lorg/mozilla/javascript/NativeCall;->parentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 3387
    iput-object v0, p0, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 3388
    return-void
.end method

.method public static enterDotQuery(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3623
    instance-of v1, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-nez v1, :cond_0

    .line 3624
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    :cond_0
    move-object v0, p0

    .line 3626
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .line 3627
    .local v0, "object":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->enterDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;

    move-result-object v1

    return-object v1
.end method

.method public static enterWith(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3604
    invoke-static {p1, p0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 3605
    .local v0, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 3606
    const-string v2, "msg.undef.with"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 3608
    :cond_0
    instance-of v2, v0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v2, :cond_1

    move-object v1, v0

    .line 3609
    check-cast v1, Lorg/mozilla/javascript/xml/XMLObject;

    .line 3610
    .local v1, "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v1, p2}, Lorg/mozilla/javascript/xml/XMLObject;->enterWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;

    move-result-object v2

    .line 3612
    .end local v1    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_0
    return-object v2

    :cond_1
    new-instance v2, Lorg/mozilla/javascript/NativeWith;

    invoke-direct {v2, p2, v0}, Lorg/mozilla/javascript/NativeWith;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_0
.end method

.method private static enumChangeObject(Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;)V
    .locals 6
    .param p0, "x"    # Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;

    .prologue
    .line 2276
    const/4 v2, 0x0

    .line 2277
    .local v2, "ids":[Ljava/lang/Object;
    :goto_0
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_0

    .line 2278
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v4}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v2

    .line 2279
    array-length v4, v2

    if-eqz v4, :cond_2

    .line 2284
    :cond_0
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    if-eqz v4, :cond_3

    .line 2285
    iget-object v3, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    .line 2286
    .local v3, "previous":[Ljava/lang/Object;
    array-length v0, v3

    .line 2287
    .local v0, "L":I
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->used:Lorg/mozilla/javascript/ObjToIntMap;

    if-nez v4, :cond_1

    .line 2288
    new-instance v4, Lorg/mozilla/javascript/ObjToIntMap;

    invoke-direct {v4, v0}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    iput-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->used:Lorg/mozilla/javascript/ObjToIntMap;

    .line 2290
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-eq v1, v0, :cond_3

    .line 2291
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->used:Lorg/mozilla/javascript/ObjToIntMap;

    aget-object v5, v3, v1

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2290
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2282
    .end local v0    # "L":I
    .end local v1    # "i":I
    .end local v3    # "previous":[Ljava/lang/Object;
    :cond_2
    iget-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v4}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    iput-object v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    goto :goto_0

    .line 2294
    :cond_3
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    .line 2295
    const/4 v4, 0x0

    iput v4, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->index:I

    .line 2296
    return-void
.end method

.method public static enumId(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 4
    .param p0, "enumObj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 2238
    move-object v1, p0

    check-cast v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;

    .line 2239
    .local v1, "x":Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;
    iget-object v2, v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_0

    .line 2240
    iget-object v2, v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2252
    :goto_0
    return-object v2

    .line 2242
    :cond_0
    iget v2, v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->enumType:I

    packed-switch v2, :pswitch_data_0

    .line 2254
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2245
    :pswitch_0
    iget-object v2, v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    goto :goto_0

    .line 2248
    :pswitch_1
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->enumValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_0

    .line 2251
    :pswitch_2
    const/4 v2, 0x2

    new-array v0, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->enumValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2

    .line 2252
    .local v0, "elements":[Ljava/lang/Object;
    iget-object v2, v1, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-virtual {p1, v2, v0}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    goto :goto_0

    .line 2242
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "enumType"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2152
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "enumType"    # I

    .prologue
    const/4 v2, 0x0

    .line 2158
    new-instance v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;

    invoke-direct {v0, v2}, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;-><init>(Lorg/mozilla/javascript/ScriptRuntime$1;)V

    .line 2159
    .local v0, "x":Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;
    invoke-static {p1, p0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    iput-object v1, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    .line 2160
    iget-object v1, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    if-nez v1, :cond_1

    .line 2180
    :cond_0
    :goto_0
    return-object v0

    .line 2165
    :cond_1
    iput p3, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->enumType:I

    .line 2166
    iput-object v2, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    .line 2167
    const/4 v1, 0x3

    if-eq p3, v1, :cond_2

    const/4 v1, 0x4

    if-eq p3, v1, :cond_2

    const/4 v1, 0x5

    if-eq p3, v1, :cond_2

    .line 2171
    iget-object v1, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    iget-object v3, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    if-nez p3, :cond_3

    const/4 v1, 0x1

    :goto_1
    invoke-static {p1, v2, v3, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toIterator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    iput-object v1, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    .line 2174
    :cond_2
    iget-object v1, v0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    if-nez v1, :cond_0

    .line 2177
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->enumChangeObject(Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;)V

    goto :goto_0

    .line 2171
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Z)Ljava/lang/Object;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "enumValues"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2135
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 11
    .param p0, "enumObj"    # Ljava/lang/Object;

    .prologue
    .line 2189
    move-object v7, p0

    check-cast v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;

    .line 2190
    .local v7, "x":Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    if-eqz v8, :cond_3

    .line 2191
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    const-string v9, "next"

    invoke-static {v8, v9}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 2192
    .local v6, "v":Ljava/lang/Object;
    instance-of v8, v6, Lorg/mozilla/javascript/Callable;

    if-nez v8, :cond_0

    .line 2193
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2232
    .end local v6    # "v":Ljava/lang/Object;
    :goto_0
    return-object v8

    .restart local v6    # "v":Ljava/lang/Object;
    :cond_0
    move-object v2, v6

    .line 2194
    check-cast v2, Lorg/mozilla/javascript/Callable;

    .line 2195
    .local v2, "f":Lorg/mozilla/javascript/Callable;
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 2197
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    :try_start_0
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v8}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    iget-object v9, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->iterator:Lorg/mozilla/javascript/Scriptable;

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v2, v0, v8, v9, v10}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2199
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_0
    .catch Lorg/mozilla/javascript/JavaScriptException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2200
    :catch_0
    move-exception v1

    .line 2201
    .local v1, "e":Lorg/mozilla/javascript/JavaScriptException;
    invoke-virtual {v1}, Lorg/mozilla/javascript/JavaScriptException;->getValue()Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Lorg/mozilla/javascript/NativeIterator$StopIteration;

    if-eqz v8, :cond_1

    .line 2202
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 2204
    :cond_1
    throw v1

    .line 2211
    .end local v0    # "cx":Lorg/mozilla/javascript/Context;
    .end local v1    # "e":Lorg/mozilla/javascript/JavaScriptException;
    .end local v2    # "f":Lorg/mozilla/javascript/Callable;
    .end local v6    # "v":Ljava/lang/Object;
    :cond_2
    iget v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->index:I

    iget-object v9, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    array-length v9, v9

    if-ne v8, v9, :cond_4

    .line 2212
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v8}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    iput-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    .line 2213
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->enumChangeObject(Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;)V

    .line 2208
    :cond_3
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    if-nez v8, :cond_2

    .line 2209
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 2216
    :cond_4
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    iget v9, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->index:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->index:I

    aget-object v3, v8, v9

    .line 2217
    .local v3, "id":Ljava/lang/Object;
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->used:Lorg/mozilla/javascript/ObjToIntMap;

    if-eqz v8, :cond_5

    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->used:Lorg/mozilla/javascript/ObjToIntMap;

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 2220
    :cond_5
    instance-of v8, v3, Ljava/lang/String;

    if-eqz v8, :cond_6

    move-object v5, v3

    .line 2221
    check-cast v5, Ljava/lang/String;

    .line 2222
    .local v5, "strId":Ljava/lang/String;
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    iget-object v9, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v8, v5, v9}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 2224
    iput-object v5, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2232
    .end local v3    # "id":Ljava/lang/Object;
    .end local v5    # "strId":Ljava/lang/String;
    :goto_1
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 2226
    .restart local v3    # "id":Ljava/lang/Object;
    :cond_6
    check-cast v3, Ljava/lang/Number;

    .end local v3    # "id":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 2227
    .local v4, "intId":I
    iget-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    iget-object v9, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v8, v4, v9}, Lorg/mozilla/javascript/Scriptable;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 2229
    iget-boolean v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->enumNumbers:Z

    if-eqz v8, :cond_7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    :goto_2
    iput-object v8, v7, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    goto :goto_1

    :cond_7
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_2
.end method

.method public static enumValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 6
    .param p0, "enumObj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 2259
    move-object v3, p0

    check-cast v3, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;

    .line 2263
    .local v3, "x":Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;
    iget-object v4, v3, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    invoke-static {p1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 2264
    .local v2, "s":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 2265
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v0

    .line 2266
    .local v0, "index":I
    iget-object v4, v3, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    iget-object v5, v3, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v4, v0, v5}, Lorg/mozilla/javascript/Scriptable;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2271
    .end local v0    # "index":I
    .local v1, "result":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 2268
    .end local v1    # "result":Ljava/lang/Object;
    :cond_0
    iget-object v4, v3, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    iget-object v5, v3, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->obj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v4, v2, v5}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/Object;
    goto :goto_0
.end method

.method public static eq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 14
    .param p0, "x"    # Ljava/lang/Object;
    .param p1, "y"    # Ljava/lang/Object;

    .prologue
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    const-wide/16 v12, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 2962
    if-eqz p0, :cond_0

    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v6, :cond_4

    .line 2963
    :cond_0
    if-eqz p1, :cond_1

    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v6, :cond_3

    :cond_1
    move v8, v7

    .line 3034
    .end local p1    # "y":Ljava/lang/Object;
    :cond_2
    :goto_0
    return v8

    .line 2966
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_3
    instance-of v6, p1, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v6, :cond_2

    .line 2967
    check-cast p1, Lorg/mozilla/javascript/ScriptableObject;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2968
    .local v1, "test":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v6, :cond_2

    .line 2969
    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "test":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    goto :goto_0

    .line 2973
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_4
    instance-of v6, p0, Ljava/lang/Number;

    if-eqz v6, :cond_5

    .line 2974
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "x":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7, p1}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v8

    goto :goto_0

    .line 2975
    .restart local p0    # "x":Ljava/lang/Object;
    :cond_5
    if-ne p0, p1, :cond_6

    move v8, v7

    .line 2976
    goto :goto_0

    .line 2977
    :cond_6
    instance-of v6, p0, Ljava/lang/CharSequence;

    if-eqz v6, :cond_7

    .line 2978
    check-cast p0, Ljava/lang/CharSequence;

    .end local p0    # "x":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->eqString(Ljava/lang/CharSequence;Ljava/lang/Object;)Z

    move-result v8

    goto :goto_0

    .line 2979
    .restart local p0    # "x":Ljava/lang/Object;
    :cond_7
    instance-of v6, p0, Ljava/lang/Boolean;

    if-eqz v6, :cond_c

    move-object v6, p0

    .line 2980
    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 2981
    .local v0, "b":Z
    instance-of v6, p1, Ljava/lang/Boolean;

    if-eqz v6, :cond_9

    .line 2982
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-ne v0, v6, :cond_8

    move v6, v7

    :goto_1
    move v8, v6

    goto :goto_0

    :cond_8
    move v6, v8

    goto :goto_1

    .line 2984
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_9
    instance-of v6, p1, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v6, :cond_a

    move-object v6, p1

    .line 2985
    check-cast v6, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v6, p0}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2986
    .restart local v1    # "test":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v6, :cond_a

    .line 2987
    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "test":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    goto :goto_0

    .line 2990
    :cond_a
    if-eqz v0, :cond_b

    move-wide v6, v10

    :goto_2
    invoke-static {v6, v7, p1}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v8

    goto :goto_0

    :cond_b
    move-wide v6, v12

    goto :goto_2

    .line 2991
    .end local v0    # "b":Z
    :cond_c
    instance-of v6, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v6, :cond_15

    .line 2992
    instance-of v6, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v6, :cond_10

    .line 2993
    instance-of v6, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v6, :cond_d

    move-object v6, p0

    .line 2994
    check-cast v6, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v6, p1}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2995
    .restart local v1    # "test":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v6, :cond_d

    .line 2996
    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "test":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    goto/16 :goto_0

    .line 2999
    :cond_d
    instance-of v6, p1, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v6, :cond_e

    move-object v6, p1

    .line 3000
    check-cast v6, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v6, p0}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3001
    .restart local v1    # "test":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v6, :cond_e

    .line 3002
    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "test":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    goto/16 :goto_0

    .line 3005
    :cond_e
    instance-of v6, p0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v6, :cond_2

    instance-of v6, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v6, :cond_2

    .line 3008
    check-cast p0, Lorg/mozilla/javascript/Wrapper;

    .end local p0    # "x":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v4

    .line 3009
    .local v4, "unwrappedX":Ljava/lang/Object;
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v5

    .line 3010
    .local v5, "unwrappedY":Ljava/lang/Object;
    if-eq v4, v5, :cond_f

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->isPrimitive(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->isPrimitive(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_f
    move v8, v7

    goto/16 :goto_0

    .line 3016
    .end local v4    # "unwrappedX":Ljava/lang/Object;
    .end local v5    # "unwrappedY":Ljava/lang/Object;
    .restart local p0    # "x":Ljava/lang/Object;
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_10
    instance-of v6, p1, Ljava/lang/Boolean;

    if-eqz v6, :cond_13

    .line 3017
    instance-of v6, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v6, :cond_11

    move-object v6, p0

    .line 3018
    check-cast v6, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v6, p1}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3019
    .restart local v1    # "test":Ljava/lang/Object;
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v6, :cond_11

    .line 3020
    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "test":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    goto/16 :goto_0

    .line 3023
    :cond_11
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_12

    move-wide v2, v10

    .line 3024
    .local v2, "d":D
    :goto_3
    invoke-static {v2, v3, p0}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v8

    goto/16 :goto_0

    .end local v2    # "d":D
    :cond_12
    move-wide v2, v12

    .line 3023
    goto :goto_3

    .line 3025
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_13
    instance-of v6, p1, Ljava/lang/Number;

    if-eqz v6, :cond_14

    .line 3026
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7, p0}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v8

    goto/16 :goto_0

    .line 3027
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_14
    instance-of v6, p1, Ljava/lang/CharSequence;

    if-eqz v6, :cond_2

    .line 3028
    check-cast p1, Ljava/lang/CharSequence;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-static {p1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->eqString(Ljava/lang/CharSequence;Ljava/lang/Object;)Z

    move-result v8

    goto/16 :goto_0

    .line 3033
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_15
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 3034
    if-ne p0, p1, :cond_16

    :goto_4
    move v8, v7

    goto/16 :goto_0

    :cond_16
    move v7, v8

    goto :goto_4
.end method

.method static eqNumber(DLjava/lang/Object;)Z
    .locals 8
    .param p0, "x"    # D
    .param p2, "y"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 3047
    :goto_0
    if-eqz p2, :cond_0

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v2, :cond_2

    :cond_0
    move v3, v4

    .line 3066
    .end local p2    # "y":Ljava/lang/Object;
    :cond_1
    :goto_1
    return v3

    .line 3049
    .restart local p2    # "y":Ljava/lang/Object;
    :cond_2
    instance-of v2, p2, Ljava/lang/Number;

    if-eqz v2, :cond_4

    .line 3050
    check-cast p2, Ljava/lang/Number;

    .end local p2    # "y":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    cmpl-double v2, p0, v6

    if-nez v2, :cond_3

    move v2, v3

    :goto_2
    move v3, v2

    goto :goto_1

    :cond_3
    move v2, v4

    goto :goto_2

    .line 3051
    .restart local p2    # "y":Ljava/lang/Object;
    :cond_4
    instance-of v2, p2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_5

    .line 3052
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v6

    cmpl-double v2, p0, v6

    if-eqz v2, :cond_1

    move v3, v4

    goto :goto_1

    .line 3053
    :cond_5
    instance-of v2, p2, Ljava/lang/Boolean;

    if-eqz v2, :cond_7

    .line 3054
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "y":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    :goto_3
    cmpl-double v2, p0, v6

    if-eqz v2, :cond_1

    move v3, v4

    goto :goto_1

    :cond_6
    const-wide/16 v6, 0x0

    goto :goto_3

    .line 3055
    .restart local p2    # "y":Ljava/lang/Object;
    :cond_7
    instance-of v2, p2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_9

    .line 3056
    instance-of v2, p2, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v2, :cond_8

    .line 3057
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .local v1, "xval":Ljava/lang/Number;
    move-object v2, p2

    .line 3058
    check-cast v2, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3059
    .local v0, "test":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_8

    .line 3060
    check-cast v0, Ljava/lang/Boolean;

    .end local v0    # "test":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_1

    .line 3063
    .end local v1    # "xval":Ljava/lang/Number;
    :cond_8
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toPrimitive(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_0

    .line 3065
    :cond_9
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    move v3, v4

    .line 3066
    goto :goto_1
.end method

.method private static eqString(Ljava/lang/CharSequence;Ljava/lang/Object;)Z
    .locals 10
    .param p0, "x"    # Ljava/lang/CharSequence;
    .param p1, "y"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 3074
    :goto_0
    if-eqz p1, :cond_0

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v2, :cond_2

    :cond_0
    move v3, v4

    .line 3094
    .end local p1    # "y":Ljava/lang/Object;
    :cond_1
    :goto_1
    return v3

    .line 3076
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_2
    instance-of v2, p1, Ljava/lang/CharSequence;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 3077
    check-cast v0, Ljava/lang/CharSequence;

    .line 3078
    .local v0, "c":Ljava/lang/CharSequence;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ne v2, v5, :cond_3

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    move v2, v3

    :goto_2
    move v3, v2

    goto :goto_1

    :cond_3
    move v2, v4

    goto :goto_2

    .line 3079
    .end local v0    # "c":Ljava/lang/CharSequence;
    :cond_4
    instance-of v2, p1, Ljava/lang/Number;

    if-eqz v2, :cond_5

    .line 3080
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v6

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v8

    cmpl-double v2, v6, v8

    if-eqz v2, :cond_1

    move v3, v4

    goto :goto_1

    .line 3081
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_5
    instance-of v2, p1, Ljava/lang/Boolean;

    if-eqz v2, :cond_7

    .line 3082
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v8

    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    :goto_3
    cmpl-double v2, v8, v6

    if-eqz v2, :cond_1

    move v3, v4

    goto :goto_1

    :cond_6
    const-wide/16 v6, 0x0

    goto :goto_3

    .line 3083
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_7
    instance-of v2, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_9

    .line 3084
    instance-of v2, p1, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v2, :cond_8

    move-object v2, p1

    .line 3085
    check-cast v2, Lorg/mozilla/javascript/ScriptableObject;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/mozilla/javascript/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3086
    .local v1, "test":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_8

    .line 3087
    check-cast v1, Ljava/lang/Boolean;

    .end local v1    # "test":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_1

    .line 3090
    :cond_8
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toPrimitive(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 3091
    goto/16 :goto_0

    .line 3093
    :cond_9
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    move v3, v4

    .line 3094
    goto/16 :goto_1
.end method

.method private static errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/Object;

    .prologue
    .line 4234
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    return-object v0
.end method

.method public static escapeAttributeValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4125
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->currentXMLLib(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .line 4126
    .local v0, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/xml/XMLLib;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static escapeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 707
    const/16 v0, 0x22

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeString(Ljava/lang/String;C)Ljava/lang/String;
    .locals 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "escapeQuote"    # C

    .prologue
    const/16 v10, 0x5c

    .line 716
    const/16 v9, 0x22

    if-eq p1, v9, :cond_0

    const/16 v9, 0x27

    if-eq p1, v9, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 717
    :cond_0
    const/4 v7, 0x0

    .line 719
    .local v7, "sb":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .local v6, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "L":I
    :goto_0
    if-eq v6, v0, :cond_8

    .line 720
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 722
    .local v1, "c":I
    const/16 v9, 0x20

    if-gt v9, v1, :cond_2

    const/16 v9, 0x7e

    if-gt v1, v9, :cond_2

    if-eq v1, p1, :cond_2

    if-eq v1, v10, :cond_2

    .line 725
    if-eqz v7, :cond_1

    .line 726
    int-to-char v9, v1

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 719
    :cond_1
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 730
    :cond_2
    if-nez v7, :cond_3

    .line 731
    new-instance v7, Ljava/lang/StringBuilder;

    .end local v7    # "sb":Ljava/lang/StringBuilder;
    add-int/lit8 v9, v0, 0x3

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 732
    .restart local v7    # "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 733
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 736
    :cond_3
    const/4 v3, -0x1

    .line 737
    .local v3, "escape":I
    sparse-switch v1, :sswitch_data_0

    .line 747
    :goto_2
    if-ltz v3, :cond_4

    .line 749
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 750
    int-to-char v9, v3

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 738
    :sswitch_0
    const/16 v3, 0x62

    goto :goto_2

    .line 739
    :sswitch_1
    const/16 v3, 0x66

    goto :goto_2

    .line 740
    :sswitch_2
    const/16 v3, 0x6e

    goto :goto_2

    .line 741
    :sswitch_3
    const/16 v3, 0x72

    goto :goto_2

    .line 742
    :sswitch_4
    const/16 v3, 0x74

    goto :goto_2

    .line 743
    :sswitch_5
    const/16 v3, 0x76

    goto :goto_2

    .line 744
    :sswitch_6
    const/16 v3, 0x20

    goto :goto_2

    .line 745
    :sswitch_7
    const/16 v3, 0x5c

    goto :goto_2

    .line 751
    :cond_4
    if-ne v1, p1, :cond_5

    .line 752
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 753
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 756
    :cond_5
    const/16 v9, 0x100

    if-ge v1, v9, :cond_6

    .line 758
    const-string v9, "\\x"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 759
    const/4 v5, 0x2

    .line 766
    .local v5, "hexSize":I
    :goto_3
    add-int/lit8 v9, v5, -0x1

    mul-int/lit8 v8, v9, 0x4

    .local v8, "shift":I
    :goto_4
    if-ltz v8, :cond_1

    .line 767
    shr-int v9, v1, v8

    and-int/lit8 v2, v9, 0xf

    .line 768
    .local v2, "digit":I
    const/16 v9, 0xa

    if-ge v2, v9, :cond_7

    add-int/lit8 v4, v2, 0x30

    .line 769
    .local v4, "hc":I
    :goto_5
    int-to-char v9, v4

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 766
    add-int/lit8 v8, v8, -0x4

    goto :goto_4

    .line 762
    .end local v2    # "digit":I
    .end local v4    # "hc":I
    .end local v5    # "hexSize":I
    .end local v8    # "shift":I
    :cond_6
    const-string v9, "\\u"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 763
    const/4 v5, 0x4

    .restart local v5    # "hexSize":I
    goto :goto_3

    .line 768
    .restart local v2    # "digit":I
    .restart local v8    # "shift":I
    :cond_7
    add-int/lit8 v4, v2, 0x57

    goto :goto_5

    .line 773
    .end local v1    # "c":I
    .end local v2    # "digit":I
    .end local v3    # "escape":I
    .end local v5    # "hexSize":I
    .end local v8    # "shift":I
    :cond_8
    if-nez v7, :cond_9

    .end local p0    # "s":Ljava/lang/String;
    :goto_6
    return-object p0

    .restart local p0    # "s":Ljava/lang/String;
    :cond_9
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6

    .line 737
    nop

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_0
        0x9 -> :sswitch_4
        0xa -> :sswitch_2
        0xb -> :sswitch_5
        0xc -> :sswitch_1
        0xd -> :sswitch_3
        0x20 -> :sswitch_6
        0x5c -> :sswitch_7
    .end sparse-switch
.end method

.method public static escapeTextValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4137
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->currentXMLLib(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .line 4138
    .local v0, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/xml/XMLLib;->escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static evalSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 14
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisArg"    # Ljava/lang/Object;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "filename"    # Ljava/lang/String;
    .param p5, "lineNumber"    # I

    .prologue
    .line 2624
    move-object/from16 v0, p3

    array-length v2, v0

    const/4 v3, 0x1

    if-ge v2, v3, :cond_0

    .line 2625
    sget-object v13, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 2664
    .end local p2    # "thisArg":Ljava/lang/Object;
    :goto_0
    return-object v13

    .line 2626
    .restart local p2    # "thisArg":Ljava/lang/Object;
    :cond_0
    const/4 v2, 0x0

    aget-object v13, p3, v2

    .line 2627
    .local v13, "x":Ljava/lang/Object;
    instance-of v2, v13, Ljava/lang/CharSequence;

    if-nez v2, :cond_3

    .line 2628
    const/16 v2, 0xb

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v2

    if-nez v2, :cond_1

    const/16 v2, 0x9

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2631
    :cond_1
    const-string v2, "msg.eval.nonstring.strict"

    invoke-static {v2}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 2633
    :cond_2
    const-string v2, "msg.eval.nonstring"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 2634
    .local v11, "message":Ljava/lang/String;
    invoke-static {v11}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    goto :goto_0

    .line 2637
    .end local v11    # "message":Ljava/lang/String;
    :cond_3
    if-nez p4, :cond_4

    .line 2638
    const/4 v2, 0x1

    new-array v10, v2, [I

    .line 2639
    .local v10, "linep":[I
    invoke-static {v10}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object p4

    .line 2640
    if-eqz p4, :cond_5

    .line 2641
    const/4 v2, 0x0

    aget p5, v10, v2

    .line 2646
    .end local v10    # "linep":[I
    :cond_4
    :goto_1
    const/4 v2, 0x1

    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v2, v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->makeUrlForGeneratedScript(ZLjava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    .line 2650
    .local v6, "sourceName":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/DefaultErrorReporter;->forEval(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v5

    .line 2652
    .local v5, "reporter":Lorg/mozilla/javascript/ErrorReporter;
    invoke-static {}, Lorg/mozilla/javascript/Context;->createInterpreter()Lorg/mozilla/javascript/Evaluator;

    move-result-object v4

    .line 2653
    .local v4, "evaluator":Lorg/mozilla/javascript/Evaluator;
    if-nez v4, :cond_6

    .line 2654
    new-instance v2, Lorg/mozilla/javascript/JavaScriptException;

    const-string v3, "Interpreter not present"

    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-direct {v2, v3, v0, v1}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v2

    .line 2643
    .end local v4    # "evaluator":Lorg/mozilla/javascript/Evaluator;
    .end local v5    # "reporter":Lorg/mozilla/javascript/ErrorReporter;
    .end local v6    # "sourceName":Ljava/lang/String;
    .restart local v10    # "linep":[I
    :cond_5
    const-string p4, ""

    goto :goto_1

    .line 2660
    .end local v10    # "linep":[I
    .restart local v4    # "evaluator":Lorg/mozilla/javascript/Evaluator;
    .restart local v5    # "reporter":Lorg/mozilla/javascript/ErrorReporter;
    .restart local v6    # "sourceName":Ljava/lang/String;
    :cond_6
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lorg/mozilla/javascript/Context;->compileString(Ljava/lang/String;Lorg/mozilla/javascript/Evaluator;Lorg/mozilla/javascript/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v12

    .line 2662
    .local v12, "script":Lorg/mozilla/javascript/Script;
    invoke-interface {v4, v12}, Lorg/mozilla/javascript/Evaluator;->setEvalScriptFlag(Lorg/mozilla/javascript/Script;)V

    move-object v9, v12

    .line 2663
    check-cast v9, Lorg/mozilla/javascript/Callable;

    .line 2664
    .local v9, "c":Lorg/mozilla/javascript/Callable;
    check-cast p2, Lorg/mozilla/javascript/Scriptable;

    .end local p2    # "thisArg":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v0, p2

    invoke-interface {v9, p0, p1, v0, v2}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    goto :goto_0
.end method

.method public static exitActivationFunction(Lorg/mozilla/javascript/Context;)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3392
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 3393
    .local v0, "call":Lorg/mozilla/javascript/NativeCall;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCall;->parentActivationCall:Lorg/mozilla/javascript/NativeCall;

    iput-object v1, p0, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 3394
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/mozilla/javascript/NativeCall;->parentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 3395
    return-void
.end method

.method static findFunctionActivation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/NativeCall;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "f"    # Lorg/mozilla/javascript/Function;

    .prologue
    .line 3399
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 3400
    .local v0, "call":Lorg/mozilla/javascript/NativeCall;
    :goto_0
    if-eqz v0, :cond_1

    .line 3401
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCall;->function:Lorg/mozilla/javascript/NativeFunction;

    if-ne v1, p1, :cond_0

    .line 3405
    .end local v0    # "call":Lorg/mozilla/javascript/NativeCall;
    :goto_1
    return-object v0

    .line 3403
    .restart local v0    # "call":Lorg/mozilla/javascript/NativeCall;
    :cond_0
    iget-object v0, v0, Lorg/mozilla/javascript/NativeCall;->parentActivationCall:Lorg/mozilla/javascript/NativeCall;

    goto :goto_0

    .line 3405
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method static getApplyArguments(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 2591
    if-eqz p1, :cond_0

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v0, :cond_1

    .line 2592
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 2594
    .end local p1    # "arg1":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 2593
    .restart local p1    # "arg1":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Lorg/mozilla/javascript/NativeArray;

    if-nez v0, :cond_2

    instance-of v0, p1, Lorg/mozilla/javascript/Arguments;

    if-eqz v0, :cond_3

    .line 2594
    :cond_2
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .end local p1    # "arg1":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Context;->getElements(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 2596
    .restart local p1    # "arg1":Ljava/lang/Object;
    :cond_3
    const-string v0, "msg.arg.isnt.array"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static getArrayElements(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;
    .locals 10
    .param p0, "object"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3804
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 3805
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v0, p0}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v4

    .line 3806
    .local v4, "longLen":J
    const-wide/32 v8, 0x7fffffff

    cmp-long v7, v4, v8

    if-lez v7, :cond_0

    .line 3808
    new-instance v7, Ljava/lang/IllegalArgumentException;

    invoke-direct {v7}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v7

    .line 3810
    :cond_0
    long-to-int v3, v4

    .line 3811
    .local v3, "len":I
    if-nez v3, :cond_2

    .line 3812
    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 3820
    :cond_1
    return-object v6

    .line 3814
    :cond_2
    new-array v6, v3, [Ljava/lang/Object;

    .line 3815
    .local v6, "result":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 3816
    invoke-static {p0, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v1

    .line 3817
    .local v1, "elem":Ljava/lang/Object;
    sget-object v7, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v7, :cond_3

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .end local v1    # "elem":Ljava/lang/Object;
    :cond_3
    aput-object v1, v6, v2

    .line 3815
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method static getCallable(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;
    .locals 3
    .param p0, "thisObj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2603
    instance-of v2, p0, Lorg/mozilla/javascript/Callable;

    if-eqz v2, :cond_0

    move-object v0, p0

    .line 2604
    check-cast v0, Lorg/mozilla/javascript/Callable;

    .line 2612
    .local v0, "function":Lorg/mozilla/javascript/Callable;
    :goto_0
    return-object v0

    .line 2606
    .end local v0    # "function":Lorg/mozilla/javascript/Callable;
    :cond_0
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    invoke-interface {p0, v2}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 2607
    .local v1, "value":Ljava/lang/Object;
    instance-of v2, v1, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_1

    .line 2608
    invoke-static {v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    :cond_1
    move-object v0, v1

    .line 2610
    check-cast v0, Lorg/mozilla/javascript/Callable;

    .restart local v0    # "function":Lorg/mozilla/javascript/Callable;
    goto :goto_0
.end method

.method public static getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2343
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v0

    return-object v0
.end method

.method public static getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;
    .locals 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2356
    invoke-static {p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 2357
    .local v1, "str":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 2358
    invoke-static {p0, v1, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v3

    .line 2373
    :goto_0
    return-object v3

    .line 2360
    :cond_0
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v0

    .line 2362
    .local v0, "index":I
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 2363
    .local v2, "thisObj":Lorg/mozilla/javascript/Scriptable;
    if-nez v2, :cond_1

    .line 2364
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 2367
    :cond_1
    invoke-static {v2, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v3

    .line 2368
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Lorg/mozilla/javascript/Callable;

    if-nez v4, :cond_2

    .line 2369
    invoke-static {v3, p1}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 2372
    :cond_2
    invoke-static {p2, v2}, Lorg/mozilla/javascript/ScriptRuntime;->storeScriptable(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 2373
    check-cast v3, Lorg/mozilla/javascript/Callable;

    goto :goto_0
.end method

.method static getExistingCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Function;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;

    .prologue
    .line 1271
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1272
    .local v0, "ctorVal":Ljava/lang/Object;
    instance-of v1, v0, Lorg/mozilla/javascript/Function;

    if-eqz v1, :cond_0

    .line 1273
    check-cast v0, Lorg/mozilla/javascript/Function;

    .end local v0    # "ctorVal":Ljava/lang/Object;
    return-object v0

    .line 1275
    .restart local v0    # "ctorVal":Ljava/lang/Object;
    :cond_0
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 1276
    const-string v1, "msg.ctor.not.found"

    invoke-static {v1, p2}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    throw v1

    .line 1279
    :cond_1
    const-string v1, "msg.not.ctor"

    invoke-static {v1, p2}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method public static getGlobal(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3236
    const-string v0, "org.mozilla.javascript.tools.shell.Global"

    .line 3237
    .local v0, "GLOBAL_CLASS":Ljava/lang/String;
    const-string v6, "org.mozilla.javascript.tools.shell.Global"

    invoke-static {v6}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 3238
    .local v3, "globalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v3, :cond_0

    .line 3240
    const/4 v6, 0x1

    :try_start_0
    new-array v5, v6, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    aput-object v7, v5, v6

    .line 3241
    .local v5, "parm":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {v3, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 3242
    .local v4, "globalClassCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v6, 0x1

    new-array v1, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v1, v6

    .line 3243
    .local v1, "arg":[Ljava/lang/Object;
    invoke-virtual {v4, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/mozilla/javascript/ScriptableObject;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 3252
    .end local v1    # "arg":[Ljava/lang/Object;
    .end local v4    # "globalClassCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v5    # "parm":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_0
    return-object v6

    .line 3245
    :catch_0
    move-exception v2

    .line 3246
    .local v2, "e":Ljava/lang/RuntimeException;
    throw v2

    .line 3248
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v6

    .line 3252
    :cond_0
    new-instance v6, Lorg/mozilla/javascript/ImporterTopLevel;

    invoke-direct {v6, p0}, Lorg/mozilla/javascript/ImporterTopLevel;-><init>(Lorg/mozilla/javascript/Context;)V

    goto :goto_0
.end method

.method static getIndexObject(D)Ljava/lang/Object;
    .locals 4
    .param p0, "d"    # D

    .prologue
    .line 1397
    double-to-int v0, p0

    .line 1398
    .local v0, "i":I
    int-to-double v2, v0

    cmpl-double v1, v2, p0

    if-nez v1, :cond_0

    .line 1399
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1401
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method static getIndexObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 1384
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->indexFromString(Ljava/lang/String;)J

    move-result-wide v0

    .line 1385
    .local v0, "indexTest":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 1386
    long-to-int v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    .line 1388
    .end local p0    # "s":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static getLibraryScopeOrNull(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 297
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->LIBRARY_SCOPE_KEY:Ljava/lang/Object;

    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getTopScopeValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ScriptableObject;

    .line 299
    .local v0, "libScope":Lorg/mozilla/javascript/ScriptableObject;
    return-object v0
.end method

.method public static getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arguments"    # [Ljava/lang/Object;

    .prologue
    .line 3889
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->messageProvider:Lorg/mozilla/javascript/ScriptRuntime$MessageProvider;

    invoke-interface {v0, p0, p1}, Lorg/mozilla/javascript/ScriptRuntime$MessageProvider;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMessage0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "messageId"    # Ljava/lang/String;

    .prologue
    .line 3837
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 3842
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 3843
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 3849
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 3850
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;
    .param p3, "arg3"    # Ljava/lang/Object;

    .prologue
    .line 3856
    const/4 v1, 0x3

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    .line 3857
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage4(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;
    .param p3, "arg3"    # Ljava/lang/Object;
    .param p4, "arg4"    # Ljava/lang/Object;

    .prologue
    .line 3863
    const/4 v1, 0x4

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    const/4 v1, 0x3

    aput-object p4, v0, v1

    .line 3864
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getNameFunctionAndThis(Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2309
    invoke-interface {p2}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2310
    .local v0, "parent":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_2

    .line 2311
    invoke-static {p1, p2, p0}, Lorg/mozilla/javascript/ScriptRuntime;->topScopeName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2312
    .local v1, "result":Ljava/lang/Object;
    instance-of v3, v1, Lorg/mozilla/javascript/Callable;

    if-nez v3, :cond_1

    .line 2313
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v3, :cond_0

    .line 2314
    invoke-static {p2, p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFoundError(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2316
    :cond_0
    invoke-static {v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2320
    :cond_1
    move-object v2, p2

    .line 2321
    .local v2, "thisObj":Lorg/mozilla/javascript/Scriptable;
    invoke-static {p1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->storeScriptable(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 2322
    check-cast v1, Lorg/mozilla/javascript/Callable;

    .line 2326
    .end local v1    # "result":Ljava/lang/Object;
    .end local v2    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    return-object v1

    :cond_2
    const/4 v3, 0x1

    invoke-static {p1, p2, v0, p0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->nameOrFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/Callable;

    move-object v1, v3

    goto :goto_0
.end method

.method public static getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1443
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1451
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 1452
    .local v0, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 1453
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1455
    :cond_0
    invoke-static {v0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 4
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1464
    instance-of v3, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v3, :cond_1

    .line 1465
    check-cast p0, Lorg/mozilla/javascript/xml/XMLObject;

    .end local p0    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0, p2, p1}, Lorg/mozilla/javascript/xml/XMLObject;->get(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1476
    .local v1, "result":Ljava/lang/Object;
    :goto_0
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v3, :cond_0

    .line 1477
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 1480
    :cond_0
    return-object v1

    .line 1467
    .end local v1    # "result":Ljava/lang/Object;
    .restart local p0    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    invoke-static {p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1468
    .local v2, "s":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 1469
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v0

    .line 1470
    .local v0, "index":I
    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v1

    .line 1471
    .restart local v1    # "result":Ljava/lang/Object;
    goto :goto_0

    .line 1472
    .end local v0    # "index":I
    .end local v1    # "result":Ljava/lang/Object;
    :cond_2
    invoke-static {p0, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/Object;
    goto :goto_0
.end method

.method public static getObjectIndex(Ljava/lang/Object;DLorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1560
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectIndex(Ljava/lang/Object;DLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectIndex(Ljava/lang/Object;DLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1570
    invoke-static {p3, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 1571
    .local v2, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v2, :cond_0

    .line 1572
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1575
    :cond_0
    double-to-int v0, p1

    .line 1576
    .local v0, "index":I
    int-to-double v4, v0

    cmpl-double v3, v4, p1

    if-nez v3, :cond_1

    .line 1577
    invoke-static {v2, v0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectIndex(Lorg/mozilla/javascript/Scriptable;ILorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v3

    .line 1580
    :goto_0
    return-object v3

    .line 1579
    :cond_1
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v1

    .line 1580
    .local v1, "s":Ljava/lang/String;
    invoke-static {v2, v1, p3}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method public static getObjectIndex(Lorg/mozilla/javascript/Scriptable;ILorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1587
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 1588
    .local v0, "result":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 1589
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 1592
    :cond_0
    return-object v0
.end method

.method public static getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1492
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1503
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 1504
    .local v0, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 1505
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1507
    :cond_0
    invoke-static {v0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1514
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1515
    .local v0, "result":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 1516
    const/16 v1, 0xb

    invoke-virtual {p2, v1}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1517
    const-string v1, "msg.ref.undefined.prop"

    invoke-static {v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 1520
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 1523
    :cond_1
    return-object v0
.end method

.method public static getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1533
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1539
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1540
    .local v1, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_0

    .line 1541
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1543
    :cond_0
    invoke-static {v1, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1544
    .local v0, "result":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v2, :cond_1

    .line 1545
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 1547
    .end local v0    # "result":Ljava/lang/Object;
    :cond_1
    return-object v0
.end method

.method public static getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2392
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v0

    return-object v0
.end method

.method public static getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2406
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2407
    .local v0, "thisObj":Lorg/mozilla/javascript/Scriptable;
    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThisHelper(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v1

    return-object v1
.end method

.method private static getPropFunctionAndThisHelper(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2413
    if-nez p3, :cond_0

    .line 2414
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2417
    :cond_0
    invoke-static {p3, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2418
    .local v1, "value":Ljava/lang/Object;
    instance-of v2, v1, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_1

    .line 2419
    const-string v2, "__noSuchMethod__"

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2420
    .local v0, "noSuchMethod":Ljava/lang/Object;
    instance-of v2, v0, Lorg/mozilla/javascript/Callable;

    if-eqz v2, :cond_1

    .line 2421
    new-instance v1, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;

    .end local v1    # "value":Ljava/lang/Object;
    check-cast v0, Lorg/mozilla/javascript/Callable;

    .end local v0    # "noSuchMethod":Ljava/lang/Object;
    invoke-direct {v1, v0, p1}, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;-><init>(Lorg/mozilla/javascript/Callable;Ljava/lang/String;)V

    .line 2424
    :cond_1
    instance-of v2, v1, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_2

    .line 2425
    invoke-static {p3, v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2428
    :cond_2
    invoke-static {p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->storeScriptable(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 2429
    check-cast v1, Lorg/mozilla/javascript/Callable;

    return-object v1
.end method

.method public static getRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4077
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getRegExpProxy()Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v0

    return-object v0
.end method

.method public static getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3262
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    .line 3263
    .local v0, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 3264
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 3266
    :cond_0
    return-object v0
.end method

.method public static getTopLevelProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 1264
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 1265
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static getTopPackageNames()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 289
    const-string v0, "Dalvik"

    const-string v1, "java.vm.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "java"

    aput-object v1, v0, v2

    const-string v1, "javax"

    aput-object v1, v0, v3

    const-string v1, "org"

    aput-object v1, v0, v4

    const-string v1, "com"

    aput-object v1, v0, v5

    const-string v1, "edu"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string v2, "net"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "android"

    aput-object v2, v0, v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "java"

    aput-object v1, v0, v2

    const-string v1, "javax"

    aput-object v1, v0, v3

    const-string v1, "org"

    aput-object v1, v0, v4

    const-string v1, "com"

    aput-object v1, v0, v5

    const-string v1, "edu"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string v2, "net"

    aput-object v2, v0, v1

    goto :goto_0
.end method

.method public static getValueFunctionAndThis(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 2441
    instance-of v2, p0, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_0

    .line 2442
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    :cond_0
    move-object v0, p0

    .line 2445
    check-cast v0, Lorg/mozilla/javascript/Callable;

    .line 2446
    .local v0, "f":Lorg/mozilla/javascript/Callable;
    const/4 v1, 0x0

    .line 2447
    .local v1, "thisObj":Lorg/mozilla/javascript/Scriptable;
    instance-of v2, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_1

    move-object v2, v0

    .line 2448
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 2450
    :cond_1
    if-nez v1, :cond_3

    .line 2451
    iget-object v2, p1, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    if-nez v2, :cond_2

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 2452
    :cond_2
    iget-object v1, p1, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    .line 2454
    :cond_3
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 2455
    instance-of v2, v1, Lorg/mozilla/javascript/NativeWith;

    if-eqz v2, :cond_5

    .line 2463
    :cond_4
    :goto_0
    invoke-static {p1, v1}, Lorg/mozilla/javascript/ScriptRuntime;->storeScriptable(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 2464
    return-object v0

    .line 2458
    :cond_5
    instance-of v2, v1, Lorg/mozilla/javascript/NativeCall;

    if-eqz v2, :cond_4

    .line 2460
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    goto :goto_0
.end method

.method public static hasObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z
    .locals 3
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1732
    invoke-static {p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1733
    .local v2, "s":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 1734
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v0

    .line 1735
    .local v0, "index":I
    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;I)Z

    move-result v1

    .line 1740
    .end local v0    # "index":I
    .local v1, "result":Z
    :goto_0
    return v1

    .line 1737
    .end local v1    # "result":Z
    :cond_0
    invoke-static {p0, v2}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v1

    .restart local v1    # "result":Z
    goto :goto_0
.end method

.method public static hasTopCall(Lorg/mozilla/javascript/Context;)Z
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3257
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static in(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3184
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_0

    .line 3185
    const-string v0, "msg.in.not.object"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 3188
    :cond_0
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .end local p1    # "b":Ljava/lang/Object;
    invoke-static {p1, p0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->hasObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v0

    return v0
.end method

.method public static indexFromString(Ljava/lang/String;)J
    .locals 13
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const-wide/16 v8, -0x1

    const/16 v12, 0x9

    const/4 v11, 0x1

    const v10, -0xccccccc

    .line 1293
    const/16 v0, 0xa

    .line 1295
    .local v0, "MAX_VALUE_LENGTH":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 1296
    .local v4, "len":I
    if-lez v4, :cond_0

    .line 1297
    const/4 v2, 0x0

    .line 1298
    .local v2, "i":I
    const/4 v5, 0x0

    .line 1299
    .local v5, "negate":Z
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1300
    .local v1, "c":I
    const/16 v7, 0x2d

    if-ne v1, v7, :cond_2

    .line 1301
    if-le v4, v11, :cond_2

    .line 1302
    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1303
    const/16 v7, 0x30

    if-ne v1, v7, :cond_1

    .line 1339
    .end local v1    # "c":I
    .end local v2    # "i":I
    .end local v5    # "negate":Z
    :cond_0
    :goto_0
    return-wide v8

    .line 1304
    .restart local v1    # "c":I
    .restart local v2    # "i":I
    .restart local v5    # "negate":Z
    :cond_1
    const/4 v2, 0x1

    .line 1305
    const/4 v5, 0x1

    .line 1308
    :cond_2
    add-int/lit8 v1, v1, -0x30

    .line 1309
    if-ltz v1, :cond_0

    if-gt v1, v12, :cond_0

    if-eqz v5, :cond_3

    const/16 v7, 0xb

    :goto_1
    if-gt v4, v7, :cond_0

    .line 1315
    neg-int v3, v1

    .line 1316
    .local v3, "index":I
    const/4 v6, 0x0

    .line 1317
    .local v6, "oldIndex":I
    add-int/lit8 v2, v2, 0x1

    .line 1318
    if-eqz v3, :cond_4

    .line 1320
    :goto_2
    if-eq v2, v4, :cond_4

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v7

    add-int/lit8 v1, v7, -0x30

    if-ltz v1, :cond_4

    if-gt v1, v12, :cond_4

    .line 1322
    move v6, v3

    .line 1323
    mul-int/lit8 v7, v3, 0xa

    sub-int v3, v7, v1

    .line 1324
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1309
    .end local v3    # "index":I
    .end local v6    # "oldIndex":I
    :cond_3
    const/16 v7, 0xa

    goto :goto_1

    .line 1329
    .restart local v3    # "index":I
    .restart local v6    # "oldIndex":I
    :cond_4
    if-ne v2, v4, :cond_0

    if-gt v6, v10, :cond_5

    if-ne v6, v10, :cond_0

    if-eqz v5, :cond_6

    const/16 v7, 0x8

    :goto_3
    if-gt v1, v7, :cond_0

    .line 1335
    :cond_5
    const-wide v8, 0xffffffffL

    if-eqz v5, :cond_7

    .end local v3    # "index":I
    :goto_4
    int-to-long v10, v3

    and-long/2addr v8, v10

    goto :goto_0

    .line 1329
    .restart local v3    # "index":I
    :cond_6
    const/4 v7, 0x7

    goto :goto_3

    .line 1335
    :cond_7
    neg-int v3, v3

    goto :goto_4
.end method

.method public static initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;IZ)V
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "function"    # Lorg/mozilla/javascript/NativeFunction;
    .param p3, "type"    # I
    .param p4, "fromEvalCode"    # Z

    .prologue
    .line 3675
    const/4 v1, 0x1

    if-ne p3, v1, :cond_2

    .line 3676
    invoke-virtual {p2}, Lorg/mozilla/javascript/NativeFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 3677
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 3678
    if-nez p4, :cond_1

    .line 3681
    const/4 v1, 0x4

    invoke-static {p1, v0, p2, v1}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3701
    :cond_0
    :goto_0
    return-void

    .line 3684
    :cond_1
    invoke-interface {p1, v0, p1, p2}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 3687
    .end local v0    # "name":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x3

    if-ne p3, v1, :cond_4

    .line 3688
    invoke-virtual {p2}, Lorg/mozilla/javascript/NativeFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 3689
    .restart local v0    # "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 3693
    :goto_1
    instance-of v1, p1, Lorg/mozilla/javascript/NativeWith;

    if-eqz v1, :cond_3

    .line 3694
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_1

    .line 3696
    :cond_3
    invoke-interface {p1, v0, p1, p2}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 3699
    .end local v0    # "name":Ljava/lang/String;
    :cond_4
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static initSafeStandardObjects(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/ScriptableObject;
    .locals 13
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p2, "sealed"    # Z

    .prologue
    .line 158
    if-nez p1, :cond_0

    .line 159
    new-instance p1, Lorg/mozilla/javascript/NativeObject;

    .end local p1    # "scope":Lorg/mozilla/javascript/ScriptableObject;
    invoke-direct {p1}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 161
    .restart local p1    # "scope":Lorg/mozilla/javascript/ScriptableObject;
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->LIBRARY_SCOPE_KEY:Ljava/lang/Object;

    invoke-virtual {p1, v0, p1}, Lorg/mozilla/javascript/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    new-instance v0, Lorg/mozilla/javascript/ClassCache;

    invoke-direct {v0}, Lorg/mozilla/javascript/ClassCache;-><init>()V

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ClassCache;->associate(Lorg/mozilla/javascript/ScriptableObject;)Z

    .line 164
    invoke-static {p1, p2}, Lorg/mozilla/javascript/BaseFunction;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 165
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeObject;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 167
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v11

    .line 170
    .local v11, "objectProto":Lorg/mozilla/javascript/Scriptable;
    const-string v0, "Function"

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->getClassPrototype(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v10

    .line 171
    .local v10, "functionProto":Lorg/mozilla/javascript/Scriptable;
    invoke-interface {v10, v11}, Lorg/mozilla/javascript/Scriptable;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 174
    invoke-virtual {p1}, Lorg/mozilla/javascript/ScriptableObject;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    if-nez v0, :cond_1

    .line 175
    invoke-virtual {p1, v11}, Lorg/mozilla/javascript/ScriptableObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 178
    :cond_1
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeError;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 179
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/NativeGlobal;->init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V

    .line 181
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeArray;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 182
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getOptimizationLevel()I

    move-result v0

    if-lez v0, :cond_2

    .line 186
    const v0, 0x30d40

    invoke-static {v0}, Lorg/mozilla/javascript/NativeArray;->setMaximumInitialCapacity(I)V

    .line 188
    :cond_2
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeString;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 189
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeBoolean;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 190
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeNumber;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 191
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeDate;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 192
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeMath;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 193
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeJSON;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 195
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeWith;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 196
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeCall;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 197
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeScript;->init(Lorg/mozilla/javascript/Scriptable;Z)V

    .line 199
    invoke-static {p1, p2}, Lorg/mozilla/javascript/NativeIterator;->init(Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 201
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getE4xImplementationFactory()Lorg/mozilla/javascript/xml/XMLLib$Factory;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v12, 0x1

    .line 205
    .local v12, "withXml":Z
    :goto_0
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "RegExp"

    const-string v3, "org.mozilla.javascript.regexp.NativeRegExp"

    const/4 v5, 0x1

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 207
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "Continuation"

    const-string v3, "org.mozilla.javascript.NativeContinuation"

    const/4 v5, 0x1

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 210
    if-eqz v12, :cond_3

    .line 211
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getE4xImplementationFactory()Lorg/mozilla/javascript/xml/XMLLib$Factory;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xml/XMLLib$Factory;->getImplementationClassName()Ljava/lang/String;

    move-result-object v3

    .line 212
    .local v3, "xmlImpl":Ljava/lang/String;
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "XML"

    const/4 v5, 0x1

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 213
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "XMLList"

    const/4 v5, 0x1

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 214
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "Namespace"

    const/4 v5, 0x1

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 215
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "QName"

    const/4 v5, 0x1

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 218
    .end local v3    # "xmlImpl":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v0

    const/16 v1, 0xb4

    if-lt v0, v1, :cond_4

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v0

    if-nez v0, :cond_5

    :cond_4
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v0

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_6

    .line 222
    :cond_5
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "ArrayBuffer"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeArrayBuffer"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 225
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Int8Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeInt8Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 228
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Uint8Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeUint8Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 231
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Uint8ClampedArray"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeUint8ClampedArray"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 234
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Int16Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeInt16Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 237
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Uint16Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeUint16Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 240
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Int32Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeInt32Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 243
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Uint32Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeUint32Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 246
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Float32Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeFloat32Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 249
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "Float64Array"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeFloat64Array"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 252
    new-instance v4, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v6, "DataView"

    const-string v7, "org.mozilla.javascript.typedarrays.NativeDataView"

    const/4 v9, 0x1

    move-object v5, p1

    move v8, p2

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 257
    :cond_6
    instance-of v0, p1, Lorg/mozilla/javascript/TopLevel;

    if-eqz v0, :cond_7

    move-object v0, p1

    .line 258
    check-cast v0, Lorg/mozilla/javascript/TopLevel;

    invoke-virtual {v0}, Lorg/mozilla/javascript/TopLevel;->cacheBuiltins()V

    .line 261
    :cond_7
    return-object p1

    .line 201
    .end local v12    # "withXml":Z
    :cond_8
    const/4 v12, 0x0

    goto/16 :goto_0
.end method

.method public static initScript(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .locals 8
    .param p0, "funObj"    # Lorg/mozilla/javascript/NativeFunction;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "evalScript"    # Z

    .prologue
    .line 3336
    iget-object v6, p2, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    if-nez v6, :cond_0

    .line 3337
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 3339
    :cond_0
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeFunction;->getParamAndVarCount()I

    move-result v4

    .line 3340
    .local v4, "varCount":I
    if-eqz v4, :cond_5

    .line 3342
    move-object v5, p3

    .line 3345
    .local v5, "varScope":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    instance-of v6, v5, Lorg/mozilla/javascript/NativeWith;

    if-eqz v6, :cond_1

    .line 3346
    invoke-interface {v5}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    goto :goto_0

    .line 3349
    :cond_1
    move v0, v4

    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_1
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    if-eqz v1, :cond_5

    .line 3350
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v3

    .line 3351
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeFunction;->getParamOrVarConst(I)Z

    move-result v2

    .line 3354
    .local v2, "isConst":Z
    invoke-static {p3, v3}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 3355
    if-eqz v2, :cond_2

    .line 3356
    invoke-static {v5, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineConstProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V

    :goto_2
    move v1, v0

    .line 3368
    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_1

    .line 3357
    .end local v1    # "i":I
    .restart local v0    # "i":I
    :cond_2
    if-nez p4, :cond_3

    .line 3359
    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    const/4 v7, 0x4

    invoke-static {v5, v3, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_2

    .line 3363
    :cond_3
    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-interface {v5, v3, v5, v6}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_2

    .line 3366
    :cond_4
    invoke-static {p3, v3, v2}, Lorg/mozilla/javascript/ScriptableObject;->redefineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Z)V

    goto :goto_2

    .line 3370
    .end local v0    # "i":I
    .end local v2    # "isConst":Z
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "varScope":Lorg/mozilla/javascript/Scriptable;
    :cond_5
    return-void
.end method

.method public static initStandardObjects(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/ScriptableObject;
    .locals 9
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p2, "sealed"    # Z

    .prologue
    const/4 v5, 0x1

    .line 268
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->initSafeStandardObjects(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v1

    .line 270
    .local v1, "s":Lorg/mozilla/javascript/ScriptableObject;
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "Packages"

    const-string v3, "org.mozilla.javascript.NativeJavaTopPackage"

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 272
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "getClass"

    const-string v3, "org.mozilla.javascript.NativeJavaTopPackage"

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 274
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "JavaAdapter"

    const-string v3, "org.mozilla.javascript.JavaAdapter"

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 276
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v2, "JavaImporter"

    const-string v3, "org.mozilla.javascript.ImporterTopLevel"

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 279
    invoke-static {}, Lorg/mozilla/javascript/ScriptRuntime;->getTopPackageNames()[Ljava/lang/String;

    move-result-object v6

    .local v6, "arr$":[Ljava/lang/String;
    array-length v8, v6

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_0
    if-ge v7, v8, :cond_0

    aget-object v2, v6, v7

    .line 280
    .local v2, "packageName":Ljava/lang/String;
    new-instance v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    const-string v3, "org.mozilla.javascript.NativeJavaTopPackage"

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/LazilyLoadedCtor;-><init>(Lorg/mozilla/javascript/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 279
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 284
    .end local v2    # "packageName":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public static instanceOf(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3141
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_0

    .line 3142
    const-string v0, "msg.instanceof.not.object"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 3146
    :cond_0
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_1

    .line 3147
    const/4 v0, 0x0

    .line 3149
    .end local p0    # "a":Ljava/lang/Object;
    .end local p1    # "b":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p0    # "a":Ljava/lang/Object;
    .restart local p1    # "b":Ljava/lang/Object;
    :cond_1
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .end local p1    # "b":Ljava/lang/Object;
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "a":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/Scriptable;->hasInstance(Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isArrayObject(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 3799
    instance-of v0, p0, Lorg/mozilla/javascript/NativeArray;

    if-nez v0, :cond_0

    instance-of v0, p0, Lorg/mozilla/javascript/Arguments;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isGeneratedScript(Ljava/lang/String;)Z
    .locals 1
    .param p0, "sourceUrl"    # Ljava/lang/String;

    .prologue
    .line 4228
    const-string v0, "(eval)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_0

    const-string v0, "(Function)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isJSLineTerminator(I)Z
    .locals 2
    .param p0, "c"    # I

    .prologue
    const/4 v0, 0x0

    .line 307
    const v1, 0xdfd0

    and-int/2addr v1, p0

    if-eqz v1, :cond_1

    .line 310
    :cond_0
    :goto_0
    return v0

    :cond_1
    const/16 v1, 0xa

    if-eq p0, v1, :cond_2

    const/16 v1, 0xd

    if-eq p0, v1, :cond_2

    const/16 v1, 0x2028

    if-eq p0, v1, :cond_2

    const/16 v1, 0x2029

    if-ne p0, v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isJSWhitespaceOrLineTerminator(I)Z
    .locals 1
    .param p0, "c"    # I

    .prologue
    .line 314
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPrimitive(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 3039
    if-eqz p0, :cond_0

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p0, v0, :cond_0

    instance-of v0, p0, Ljava/lang/Number;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isRhinoRuntimeType(Ljava/lang/Class;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 145
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 146
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq p0, v2, :cond_0

    .line 148
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 146
    goto :goto_0

    .line 148
    :cond_1
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p0, v2, :cond_2

    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p0, v2, :cond_2

    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v2, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    move v1, v0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method static isSpecialProperty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 1770
    const-string v0, "__proto__"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "__parent__"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isStrWhiteSpaceChar(I)Z
    .locals 3
    .param p0, "c"    # I

    .prologue
    const/4 v0, 0x1

    .line 334
    sparse-switch p0, :sswitch_data_0

    .line 347
    invoke-static {p0}, Ljava/lang/Character;->getType(I)I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_0

    :goto_0
    :sswitch_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 334
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0xa0 -> :sswitch_0
        0x2028 -> :sswitch_0
        0x2029 -> :sswitch_0
        0xfeff -> :sswitch_0
    .end sparse-switch
.end method

.method static isValidIdentifierName(Ljava/lang/String;)Z
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 778
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 779
    .local v0, "L":I
    if-nez v0, :cond_1

    .line 787
    :cond_0
    :goto_0
    return v2

    .line 781
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 783
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    if-eq v1, v0, :cond_2

    .line 784
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 783
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 787
    :cond_2
    invoke-static {p0}, Lorg/mozilla/javascript/TokenStream;->isKeyword(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method private static isVisible(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 3596
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getClassShutter()Lorg/mozilla/javascript/ClassShutter;

    move-result-object v0

    .line 3597
    .local v0, "shutter":Lorg/mozilla/javascript/ClassShutter;
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/mozilla/javascript/ClassShutter;->visibleToScripts(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static jsDelegatesTo(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z
    .locals 2
    .param p0, "lhs"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "rhs"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3158
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 3160
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    if-eqz v0, :cond_1

    .line 3161
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    .line 3165
    :goto_1
    return v1

    .line 3162
    :cond_0
    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_0

    .line 3165
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method static lastIndexResult(Lorg/mozilla/javascript/Context;)I
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4182
    iget v0, p0, Lorg/mozilla/javascript/Context;->scratchIndex:I

    return v0
.end method

.method public static lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4210
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->scratchScriptable:Lorg/mozilla/javascript/Scriptable;

    .line 4211
    .local v0, "result":Lorg/mozilla/javascript/Scriptable;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/mozilla/javascript/Context;->scratchScriptable:Lorg/mozilla/javascript/Scriptable;

    .line 4212
    return-object v0
.end method

.method public static lastUint32Result(Lorg/mozilla/javascript/Context;)J
    .locals 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 4194
    iget-wide v0, p0, Lorg/mozilla/javascript/Context;->scratchUint32:J

    .line 4195
    .local v0, "value":J
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 4196
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 4197
    :cond_0
    return-wide v0
.end method

.method public static leaveDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3639
    move-object v0, p0

    check-cast v0, Lorg/mozilla/javascript/NativeWith;

    .line 3640
    .local v0, "nw":Lorg/mozilla/javascript/NativeWith;
    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeWith;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static leaveWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3617
    move-object v0, p0

    check-cast v0, Lorg/mozilla/javascript/NativeWith;

    .line 3618
    .local v0, "nw":Lorg/mozilla/javascript/NativeWith;
    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeWith;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method static makeUrlForGeneratedScript(ZLjava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "isEval"    # Z
    .param p1, "masterScriptUrl"    # Ljava/lang/String;
    .param p2, "masterScriptLine"    # I

    .prologue
    const/16 v1, 0x23

    .line 4218
    if-eqz p0, :cond_0

    .line 4219
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(eval)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4221
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(Function)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static memberRef(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "namespace"    # Ljava/lang/Object;
    .param p2, "elem"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .param p4, "memberTypeFlags"    # I

    .prologue
    .line 4154
    instance-of v1, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-nez v1, :cond_0

    .line 4155
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    :cond_0
    move-object v0, p0

    .line 4157
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .line 4158
    .local v0, "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v0, p3, p1, p2, p4}, Lorg/mozilla/javascript/xml/XMLObject;->memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    return-object v1
.end method

.method public static memberRef(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "memberTypeFlags"    # I

    .prologue
    .line 4144
    instance-of v1, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-nez v1, :cond_0

    .line 4145
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    :cond_0
    move-object v0, p0

    .line 4147
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .line 4148
    .local v0, "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v0, p2, p1, p3}, Lorg/mozilla/javascript/xml/XMLObject;->memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    return-object v1
.end method

.method public static name(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1847
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 1848
    .local v0, "parent":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 1849
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->topScopeName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1850
    .local v1, "result":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v2, :cond_1

    .line 1851
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->notFoundError(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1856
    .end local v1    # "result":Ljava/lang/Object;
    :cond_0
    const/4 v2, 0x0

    invoke-static {p0, p1, v0, p2, v2}, Lorg/mozilla/javascript/ScriptRuntime;->nameOrFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v1

    :cond_1
    return-object v1
.end method

.method public static nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 1
    .param p0, "scopeChain"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2761
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .locals 3
    .param p0, "scopeChain"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "incrDecrMask"    # I

    .prologue
    .line 2771
    :cond_0
    iget-boolean v2, p2, Lorg/mozilla/javascript/Context;->useDynamicScope:Z

    if-eqz v2, :cond_1

    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    if-nez v2, :cond_1

    .line 2772
    iget-object v2, p2, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v2, p0}, Lorg/mozilla/javascript/ScriptRuntime;->checkDynamicScope(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2774
    :cond_1
    move-object v0, p0

    .line 2776
    .local v0, "target":Lorg/mozilla/javascript/Scriptable;
    :cond_2
    instance-of v2, v0, Lorg/mozilla/javascript/NativeWith;

    if-eqz v2, :cond_3

    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    instance-of v2, v2, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v2, :cond_3

    .line 2786
    :goto_0
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2787
    if-nez p0, :cond_0

    .line 2788
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->notFoundError(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2780
    :cond_3
    invoke-interface {v0, p1, p0}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2781
    .local v1, "value":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_4

    .line 2790
    invoke-static {v0, p1, p0, v1, p3}, Lorg/mozilla/javascript/ScriptRuntime;->doScriptableIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 2784
    :cond_4
    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2785
    if-nez v0, :cond_2

    goto :goto_0
.end method

.method private static nameOrFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "parentScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "asFunctionCall"    # Z

    .prologue
    .line 1864
    move-object v2, p1

    .line 1866
    .local v2, "thisObj":Lorg/mozilla/javascript/Scriptable;
    const/4 v0, 0x0

    .line 1868
    .local v0, "firstXMLObject":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_0
    instance-of v5, p1, Lorg/mozilla/javascript/NativeWith;

    if-eqz v5, :cond_6

    .line 1869
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    .line 1870
    .local v3, "withObj":Lorg/mozilla/javascript/Scriptable;
    instance-of v5, v3, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v5, :cond_5

    move-object v4, v3

    .line 1871
    check-cast v4, Lorg/mozilla/javascript/xml/XMLObject;

    .line 1872
    .local v4, "xmlObj":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v4, p3, v4}, Lorg/mozilla/javascript/xml/XMLObject;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1874
    move-object v2, v4

    .line 1875
    invoke-virtual {v4, p3, v4}, Lorg/mozilla/javascript/xml/XMLObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 1931
    .end local v3    # "withObj":Lorg/mozilla/javascript/Scriptable;
    .end local v4    # "xmlObj":Lorg/mozilla/javascript/xml/XMLObject;
    .local v1, "result":Ljava/lang/Object;
    :cond_1
    :goto_0
    if-eqz p4, :cond_b

    .line 1932
    instance-of v5, v1, Lorg/mozilla/javascript/Callable;

    if-nez v5, :cond_a

    .line 1933
    invoke-static {v1, p3}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 1878
    .end local v1    # "result":Ljava/lang/Object;
    .restart local v3    # "withObj":Lorg/mozilla/javascript/Scriptable;
    .restart local v4    # "xmlObj":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_2
    if-nez v0, :cond_3

    .line 1879
    move-object v0, v4

    .line 1911
    .end local v3    # "withObj":Lorg/mozilla/javascript/Scriptable;
    .end local v4    # "xmlObj":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_3
    move-object p1, p2

    .line 1912
    invoke-interface {p2}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object p2

    .line 1913
    if-nez p2, :cond_0

    .line 1914
    invoke-static {p0, p1, p3}, Lorg/mozilla/javascript/ScriptRuntime;->topScopeName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1915
    .restart local v1    # "result":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v5, :cond_9

    .line 1916
    if-eqz v0, :cond_4

    if-eqz p4, :cond_8

    .line 1917
    :cond_4
    invoke-static {p1, p3}, Lorg/mozilla/javascript/ScriptRuntime;->notFoundError(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 1882
    .end local v1    # "result":Ljava/lang/Object;
    .restart local v3    # "withObj":Lorg/mozilla/javascript/Scriptable;
    :cond_5
    invoke-static {v3, p3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1883
    .restart local v1    # "result":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v5, :cond_3

    .line 1885
    move-object v2, v3

    .line 1886
    goto :goto_0

    .line 1889
    .end local v1    # "result":Ljava/lang/Object;
    .end local v3    # "withObj":Lorg/mozilla/javascript/Scriptable;
    :cond_6
    instance-of v5, p1, Lorg/mozilla/javascript/NativeCall;

    if-eqz v5, :cond_7

    .line 1892
    invoke-interface {p1, p3, p1}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 1893
    .restart local v1    # "result":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v5, :cond_3

    .line 1894
    if-eqz p4, :cond_1

    .line 1897
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    goto :goto_0

    .line 1905
    .end local v1    # "result":Ljava/lang/Object;
    :cond_7
    invoke-static {p1, p3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1906
    .restart local v1    # "result":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v5, :cond_3

    .line 1907
    move-object v2, p1

    .line 1908
    goto :goto_0

    .line 1923
    :cond_8
    invoke-virtual {v0, p3, v0}, Lorg/mozilla/javascript/xml/XMLObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 1926
    :cond_9
    move-object v2, p1

    .line 1927
    goto :goto_0

    .line 1935
    :cond_a
    invoke-static {p0, v2}, Lorg/mozilla/javascript/ScriptRuntime;->storeScriptable(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 1938
    :cond_b
    return-object v1
.end method

.method public static nameRef(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;
    .locals 6
    .param p0, "namespace"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "memberTypeFlags"    # I

    .prologue
    .line 4171
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->currentXMLLib(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .local v0, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    move-object v1, p2

    move-object v2, p0

    move-object v3, p1

    move-object v4, p3

    move v5, p4

    .line 4172
    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/xml/XMLLib;->nameRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    return-object v1
.end method

.method public static nameRef(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;
    .locals 2
    .param p0, "name"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "memberTypeFlags"    # I

    .prologue
    .line 4164
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->currentXMLLib(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .line 4165
    .local v0, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    invoke-virtual {v0, p1, p0, p2, p3}, Lorg/mozilla/javascript/xml/XMLLib;->nameRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    return-object v1
.end method

.method public static newArrayLiteral([Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 10
    .param p0, "objects"    # [Ljava/lang/Object;
    .param p1, "skipIndices"    # [I
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3707
    const/4 v0, 0x2

    .line 3708
    .local v0, "SKIP_DENSITY":I
    array-length v2, p0

    .line 3709
    .local v2, "count":I
    const/4 v7, 0x0

    .line 3710
    .local v7, "skipCount":I
    if-eqz p1, :cond_0

    .line 3711
    array-length v7, p1

    .line 3713
    :cond_0
    add-int v5, v2, v7

    .line 3714
    .local v5, "length":I
    const/4 v9, 0x1

    if-le v5, v9, :cond_5

    mul-int/lit8 v9, v7, 0x2

    if-ge v9, v5, :cond_5

    .line 3717
    if-nez v7, :cond_3

    .line 3718
    move-object v8, p0

    .line 3732
    .local v8, "sparse":[Ljava/lang/Object;
    :cond_1
    invoke-virtual {p2, p3, v8}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 3746
    .end local v8    # "sparse":[Ljava/lang/Object;
    :cond_2
    return-object v1

    .line 3720
    :cond_3
    new-array v8, v5, [Ljava/lang/Object;

    .line 3721
    .restart local v8    # "sparse":[Ljava/lang/Object;
    const/4 v6, 0x0

    .line 3722
    .local v6, "skip":I
    const/4 v3, 0x0

    .local v3, "i":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_0
    if-eq v3, v5, :cond_1

    .line 3723
    if-eq v6, v7, :cond_4

    aget v9, p1, v6

    if-ne v9, v3, :cond_4

    .line 3724
    sget-object v9, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    aput-object v9, v8, v3

    .line 3725
    add-int/lit8 v6, v6, 0x1

    .line 3722
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3728
    :cond_4
    aget-object v9, p0, v4

    aput-object v9, v8, v3

    .line 3729
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 3735
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v6    # "skip":I
    .end local v8    # "sparse":[Ljava/lang/Object;
    :cond_5
    invoke-virtual {p2, p3, v5}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 3737
    .local v1, "array":Lorg/mozilla/javascript/Scriptable;
    const/4 v6, 0x0

    .line 3738
    .restart local v6    # "skip":I
    const/4 v3, 0x0

    .restart local v3    # "i":I
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_2
    if-eq v3, v5, :cond_2

    .line 3739
    if-eq v6, v7, :cond_6

    aget v9, p1, v6

    if-ne v9, v3, :cond_6

    .line 3740
    add-int/lit8 v6, v6, 0x1

    .line 3738
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 3743
    :cond_6
    aget-object v9, p0, v4

    invoke-static {v1, v3, v9}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)V

    .line 3744
    add-int/lit8 v4, v4, 0x1

    goto :goto_3
.end method

.method public static newBuiltinObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "type"    # Lorg/mozilla/javascript/TopLevel$Builtins;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1125
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1126
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/TopLevel;->getBuiltinCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Function;

    move-result-object v0

    .line 1127
    .local v0, "ctor":Lorg/mozilla/javascript/Function;
    if-nez p3, :cond_0

    sget-object p3, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1128
    :cond_0
    invoke-interface {v0, p0, p1, p3}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newCatchScope(Ljava/lang/Throwable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 22
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "lastCatchScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "exceptionName"    # Ljava/lang/String;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3417
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/mozilla/javascript/JavaScriptException;

    move/from16 v19, v0

    if-eqz v19, :cond_3

    .line 3418
    const/4 v5, 0x0

    .local v5, "cacheObj":Z
    move-object/from16 v19, p0

    .line 3419
    check-cast v19, Lorg/mozilla/javascript/JavaScriptException;

    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/JavaScriptException;->getValue()Ljava/lang/Object;

    move-result-object v13

    .line 3502
    :cond_0
    :goto_0
    new-instance v6, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v6}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 3504
    .local v6, "catchScopeObject":Lorg/mozilla/javascript/NativeObject;
    const/16 v19, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-virtual {v6, v0, v13, v1}, Lorg/mozilla/javascript/NativeObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3507
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->isVisible(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3511
    const-string v19, "__exception__"

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Context;->javaToJS(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v20

    const/16 v21, 0x6

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v6, v0, v1, v2}, Lorg/mozilla/javascript/NativeObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3516
    :cond_1
    if-eqz v5, :cond_2

    .line 3517
    move-object/from16 v0, p0

    invoke-virtual {v6, v0, v13}, Lorg/mozilla/javascript/NativeObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3519
    :cond_2
    return-object v6

    .line 3421
    .end local v5    # "cacheObj":Z
    .end local v6    # "catchScopeObject":Lorg/mozilla/javascript/NativeObject;
    :cond_3
    const/4 v5, 0x1

    .line 3426
    .restart local v5    # "cacheObj":Z
    if-eqz p1, :cond_4

    move-object/from16 v11, p1

    .line 3427
    check-cast v11, Lorg/mozilla/javascript/NativeObject;

    .line 3428
    .local v11, "last":Lorg/mozilla/javascript/NativeObject;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Lorg/mozilla/javascript/NativeObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 3429
    .local v13, "obj":Ljava/lang/Object;
    if-nez v13, :cond_0

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_0

    .line 3436
    .end local v11    # "last":Lorg/mozilla/javascript/NativeObject;
    .end local v13    # "obj":Ljava/lang/Object;
    :cond_4
    const/4 v10, 0x0

    .line 3438
    .local v10, "javaException":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/mozilla/javascript/EcmaError;

    move/from16 v19, v0

    if-eqz v19, :cond_9

    move-object/from16 v7, p0

    .line 3439
    check-cast v7, Lorg/mozilla/javascript/EcmaError;

    .line 3440
    .local v7, "ee":Lorg/mozilla/javascript/EcmaError;
    move-object v14, v7

    .line 3441
    .local v14, "re":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual {v7}, Lorg/mozilla/javascript/EcmaError;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/TopLevel$NativeErrors;->valueOf(Ljava/lang/String;)Lorg/mozilla/javascript/TopLevel$NativeErrors;

    move-result-object v16

    .line 3442
    .local v16, "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    invoke-virtual {v7}, Lorg/mozilla/javascript/EcmaError;->getErrorMessage()Ljava/lang/String;

    move-result-object v8

    .line 3468
    .end local v7    # "ee":Lorg/mozilla/javascript/EcmaError;
    .local v8, "errorMsg":Ljava/lang/String;
    :goto_1
    invoke-virtual {v14}, Lorg/mozilla/javascript/RhinoException;->sourceName()Ljava/lang/String;

    move-result-object v15

    .line 3469
    .local v15, "sourceUri":Ljava/lang/String;
    if-nez v15, :cond_5

    .line 3470
    const-string v15, ""

    .line 3472
    :cond_5
    invoke-virtual {v14}, Lorg/mozilla/javascript/RhinoException;->lineNumber()I

    move-result v12

    .line 3474
    .local v12, "line":I
    if-lez v12, :cond_d

    .line 3475
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v4, v0, [Ljava/lang/Object;

    const/16 v19, 0x0

    aput-object v8, v4, v19

    const/16 v19, 0x1

    aput-object v15, v4, v19

    const/16 v19, 0x2

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v4, v19

    .line 3480
    .local v4, "args":[Ljava/lang/Object;
    :goto_2
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2, v4}, Lorg/mozilla/javascript/ScriptRuntime;->newNativeError(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$NativeErrors;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v9

    .line 3482
    .local v9, "errorObject":Lorg/mozilla/javascript/Scriptable;
    instance-of v0, v9, Lorg/mozilla/javascript/NativeError;

    move/from16 v19, v0

    if-eqz v19, :cond_6

    move-object/from16 v19, v9

    .line 3483
    check-cast v19, Lorg/mozilla/javascript/NativeError;

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Lorg/mozilla/javascript/NativeError;->setStackProvider(Lorg/mozilla/javascript/RhinoException;)V

    .line 3486
    :cond_6
    if-eqz v10, :cond_7

    move-object/from16 v0, p3

    invoke-static {v0, v10}, Lorg/mozilla/javascript/ScriptRuntime;->isVisible(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 3487
    invoke-virtual/range {p3 .. p3}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v10, v3}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v18

    .line 3489
    .local v18, "wrap":Ljava/lang/Object;
    const-string v19, "javaException"

    const/16 v20, 0x7

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    move/from16 v2, v20

    invoke-static {v9, v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3493
    .end local v18    # "wrap":Ljava/lang/Object;
    :cond_7
    move-object/from16 v0, p3

    invoke-static {v0, v14}, Lorg/mozilla/javascript/ScriptRuntime;->isVisible(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 3494
    invoke-virtual/range {p3 .. p3}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v14, v3}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v18

    .line 3495
    .restart local v18    # "wrap":Ljava/lang/Object;
    const-string v19, "rhinoException"

    const/16 v20, 0x7

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    move/from16 v2, v20

    invoke-static {v9, v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3499
    .end local v18    # "wrap":Ljava/lang/Object;
    :cond_8
    move-object v13, v9

    .local v13, "obj":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_0

    .line 3443
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v8    # "errorMsg":Ljava/lang/String;
    .end local v9    # "errorObject":Lorg/mozilla/javascript/Scriptable;
    .end local v12    # "line":I
    .end local v13    # "obj":Lorg/mozilla/javascript/Scriptable;
    .end local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    .end local v15    # "sourceUri":Ljava/lang/String;
    .end local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    :cond_9
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/mozilla/javascript/WrappedException;

    move/from16 v19, v0

    if-eqz v19, :cond_a

    move-object/from16 v17, p0

    .line 3444
    check-cast v17, Lorg/mozilla/javascript/WrappedException;

    .line 3445
    .local v17, "we":Lorg/mozilla/javascript/WrappedException;
    move-object/from16 v14, v17

    .line 3446
    .restart local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/WrappedException;->getWrappedException()Ljava/lang/Throwable;

    move-result-object v10

    .line 3447
    sget-object v16, Lorg/mozilla/javascript/TopLevel$NativeErrors;->JavaException:Lorg/mozilla/javascript/TopLevel$NativeErrors;

    .line 3448
    .restart local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ": "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v10}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 3450
    .restart local v8    # "errorMsg":Ljava/lang/String;
    goto/16 :goto_1

    .end local v8    # "errorMsg":Ljava/lang/String;
    .end local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    .end local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    .end local v17    # "we":Lorg/mozilla/javascript/WrappedException;
    :cond_a
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/mozilla/javascript/EvaluatorException;

    move/from16 v19, v0

    if-eqz v19, :cond_b

    move-object/from16 v7, p0

    .line 3452
    check-cast v7, Lorg/mozilla/javascript/EvaluatorException;

    .line 3453
    .local v7, "ee":Lorg/mozilla/javascript/EvaluatorException;
    move-object v14, v7

    .line 3454
    .restart local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    sget-object v16, Lorg/mozilla/javascript/TopLevel$NativeErrors;->InternalError:Lorg/mozilla/javascript/TopLevel$NativeErrors;

    .line 3455
    .restart local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    invoke-virtual {v7}, Lorg/mozilla/javascript/EvaluatorException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 3456
    .restart local v8    # "errorMsg":Ljava/lang/String;
    goto/16 :goto_1

    .end local v7    # "ee":Lorg/mozilla/javascript/EvaluatorException;
    .end local v8    # "errorMsg":Ljava/lang/String;
    .end local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    .end local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    :cond_b
    const/16 v19, 0xd

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v19

    if-eqz v19, :cond_c

    .line 3459
    new-instance v14, Lorg/mozilla/javascript/WrappedException;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/WrappedException;-><init>(Ljava/lang/Throwable;)V

    .line 3460
    .restart local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    sget-object v16, Lorg/mozilla/javascript/TopLevel$NativeErrors;->JavaException:Lorg/mozilla/javascript/TopLevel$NativeErrors;

    .line 3461
    .restart local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "errorMsg":Ljava/lang/String;
    goto/16 :goto_1

    .line 3465
    .end local v8    # "errorMsg":Ljava/lang/String;
    .end local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    .end local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    :cond_c
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v19

    throw v19

    .line 3477
    .restart local v8    # "errorMsg":Ljava/lang/String;
    .restart local v12    # "line":I
    .restart local v14    # "re":Lorg/mozilla/javascript/RhinoException;
    .restart local v15    # "sourceUri":Ljava/lang/String;
    .restart local v16    # "type":Lorg/mozilla/javascript/TopLevel$NativeErrors;
    :cond_d
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v4, v0, [Ljava/lang/Object;

    const/16 v19, 0x0

    aput-object v8, v4, v19

    const/16 v19, 0x1

    aput-object v15, v4, v19

    .restart local v4    # "args":[Ljava/lang/Object;
    goto/16 :goto_2
.end method

.method static newNativeError(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$NativeErrors;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "type"    # Lorg/mozilla/javascript/TopLevel$NativeErrors;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1134
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1135
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/TopLevel;->getNativeErrorCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$NativeErrors;)Lorg/mozilla/javascript/Function;

    move-result-object v0

    .line 1136
    .local v0, "ctor":Lorg/mozilla/javascript/Function;
    if-nez p3, :cond_0

    sget-object p3, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1137
    :cond_0
    invoke-interface {v0, p0, p1, p3}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newObject(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "fun"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 2501
    instance-of v1, p0, Lorg/mozilla/javascript/Function;

    if-nez v1, :cond_0

    .line 2502
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    :cond_0
    move-object v0, p0

    .line 2504
    check-cast v0, Lorg/mozilla/javascript/Function;

    .line 2505
    .local v0, "function":Lorg/mozilla/javascript/Function;
    invoke-interface {v0, p1, p2, p3}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1115
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1116
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getExistingCtor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Function;

    move-result-object v0

    .line 1117
    .local v0, "ctor":Lorg/mozilla/javascript/Function;
    if-nez p3, :cond_0

    sget-object p3, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1118
    :cond_0
    invoke-interface {v0, p0, p1, p3}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "propertyIds"    # [Ljava/lang/Object;
    .param p1, "propertyValues"    # [Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 3762
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 14
    .param p0, "propertyIds"    # [Ljava/lang/Object;
    .param p1, "propertyValues"    # [Ljava/lang/Object;
    .param p2, "getterSetters"    # [I
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3770
    invoke-virtual/range {p3 .. p4}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v9

    .line 3771
    .local v9, "object":Lorg/mozilla/javascript/Scriptable;
    const/4 v5, 0x0

    .local v5, "i":I
    array-length v2, p0

    .local v2, "end":I
    :goto_0
    if-eq v5, v2, :cond_5

    .line 3772
    aget-object v6, p0, v5

    .line 3773
    .local v6, "id":Ljava/lang/Object;
    if-nez p2, :cond_0

    const/4 v4, 0x0

    .line 3774
    .local v4, "getterSetter":I
    :goto_1
    aget-object v12, p1, v5

    .line 3775
    .local v12, "value":Ljava/lang/Object;
    instance-of v13, v6, Ljava/lang/String;

    if-eqz v13, :cond_4

    .line 3776
    if-nez v4, :cond_2

    move-object v13, v6

    .line 3777
    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->isSpecialProperty(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 3778
    check-cast v6, Ljava/lang/String;

    .end local v6    # "id":Ljava/lang/Object;
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-static {v9, v6, v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;

    move-result-object v10

    .line 3779
    .local v10, "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-virtual {v10, v0, v1, v12}, Lorg/mozilla/javascript/Ref;->set(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3771
    .end local v10    # "ref":Lorg/mozilla/javascript/Ref;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 3773
    .end local v4    # "getterSetter":I
    .end local v12    # "value":Ljava/lang/Object;
    .restart local v6    # "id":Ljava/lang/Object;
    :cond_0
    aget v4, p2, v5

    goto :goto_1

    .line 3781
    .restart local v4    # "getterSetter":I
    .restart local v12    # "value":Ljava/lang/Object;
    :cond_1
    check-cast v6, Ljava/lang/String;

    .end local v6    # "id":Ljava/lang/Object;
    invoke-interface {v9, v6, v9, v12}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_2

    .restart local v6    # "id":Ljava/lang/Object;
    :cond_2
    move-object v11, v9

    .line 3784
    check-cast v11, Lorg/mozilla/javascript/ScriptableObject;

    .local v11, "so":Lorg/mozilla/javascript/ScriptableObject;
    move-object v3, v12

    .line 3785
    check-cast v3, Lorg/mozilla/javascript/Callable;

    .line 3786
    .local v3, "getterOrSetter":Lorg/mozilla/javascript/Callable;
    const/4 v13, 0x1

    if-ne v4, v13, :cond_3

    const/4 v8, 0x1

    .line 3787
    .local v8, "isSetter":Z
    :goto_3
    check-cast v6, Ljava/lang/String;

    .end local v6    # "id":Ljava/lang/Object;
    const/4 v13, 0x0

    invoke-virtual {v11, v6, v13, v3, v8}, Lorg/mozilla/javascript/ScriptableObject;->setGetterOrSetter(Ljava/lang/String;ILorg/mozilla/javascript/Callable;Z)V

    goto :goto_2

    .line 3786
    .end local v8    # "isSetter":Z
    .restart local v6    # "id":Ljava/lang/Object;
    :cond_3
    const/4 v8, 0x0

    goto :goto_3

    .line 3790
    .end local v3    # "getterOrSetter":Lorg/mozilla/javascript/Callable;
    .end local v11    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :cond_4
    check-cast v6, Ljava/lang/Integer;

    .end local v6    # "id":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 3791
    .local v7, "index":I
    invoke-interface {v9, v7, v9, v12}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_2

    .line 3794
    .end local v4    # "getterSetter":I
    .end local v7    # "index":I
    .end local v12    # "value":Ljava/lang/Object;
    :cond_5
    return-object v9
.end method

.method public static newSpecial(Lorg/mozilla/javascript/Context;Ljava/lang/Object;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "fun"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "callType"    # I

    .prologue
    .line 2535
    const/4 v0, 0x1

    if-ne p4, v0, :cond_0

    .line 2536
    invoke-static {p1}, Lorg/mozilla/javascript/NativeGlobal;->isEvalFunction(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2537
    const-string v0, "msg.not.ctor"

    const-string v1, "eval"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 2539
    :cond_0
    const/4 v0, 0x2

    if-ne p4, v0, :cond_1

    .line 2540
    invoke-static {p1}, Lorg/mozilla/javascript/NativeWith;->isWithFunction(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2541
    invoke-static {p0, p3, p2}, Lorg/mozilla/javascript/NativeWith;->newWithSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2547
    :goto_0
    return-object v0

    .line 2544
    :cond_1
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 2547
    :cond_2
    invoke-static {p1, p0, p3, p2}, Lorg/mozilla/javascript/ScriptRuntime;->newObject(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_0
.end method

.method public static notFoundError(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "object"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 4018
    const-string v1, "msg.is.not.defined"

    invoke-static {v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 4019
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "ReferenceError"

    invoke-static {v1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 4024
    invoke-static {p0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    return-object v0
.end method

.method public static notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "messageHelper"    # Ljava/lang/Object;

    .prologue
    .line 4031
    if-nez p1, :cond_0

    const-string v0, "null"

    .line 4033
    .local v0, "msg":Ljava/lang/String;
    :goto_0
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p0, v1, :cond_1

    .line 4034
    const-string v1, "msg.function.not.found"

    invoke-static {v1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    .line 4036
    :goto_1
    return-object v1

    .line 4031
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 4036
    .restart local v0    # "msg":Ljava/lang/String;
    :cond_1
    const-string v1, "msg.isnt.function"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    goto :goto_1
.end method

.method public static notFunctionError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 4043
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 4044
    .local v1, "objString":Ljava/lang/String;
    instance-of v3, p0, Lorg/mozilla/javascript/NativeFunction;

    if-eqz v3, :cond_0

    .line 4046
    const/16 v3, 0x29

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 4047
    .local v2, "paren":I
    const/16 v3, 0x7b

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 4048
    .local v0, "curly":I
    const/4 v3, -0x1

    if-le v0, v3, :cond_0

    .line 4049
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "...}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 4052
    .end local v0    # "curly":I
    .end local v2    # "paren":I
    :cond_0
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p1, v3, :cond_1

    .line 4053
    const-string v3, "msg.function.not.found.in"

    invoke-static {v3, p2, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    .line 4056
    :goto_0
    return-object v3

    :cond_1
    const-string v3, "msg.isnt.function.in"

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, p2, v1, v4}, Lorg/mozilla/javascript/ScriptRuntime;->typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    goto :goto_0
.end method

.method private static notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 4062
    const-string v0, "msg.isnt.xml.object"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static numberToString(DI)Ljava/lang/String;
    .locals 6
    .param p0, "d"    # D
    .param p2, "base"    # I

    .prologue
    const/4 v4, 0x0

    .line 850
    const/4 v2, 0x2

    if-lt p2, v2, :cond_0

    const/16 v2, 0x24

    if-le p2, v2, :cond_1

    .line 851
    :cond_0
    const-string v2, "msg.bad.radix"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 855
    :cond_1
    cmpl-double v2, p0, p0

    if-eqz v2, :cond_3

    .line 856
    const-string v1, "NaN"

    .line 875
    :cond_2
    :goto_0
    return-object v1

    .line 857
    :cond_3
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v2, p0, v2

    if-nez v2, :cond_4

    .line 858
    const-string v1, "Infinity"

    goto :goto_0

    .line 859
    :cond_4
    const-wide/high16 v2, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v2, p0, v2

    if-nez v2, :cond_5

    .line 860
    const-string v1, "-Infinity"

    goto :goto_0

    .line 861
    :cond_5
    const-wide/16 v2, 0x0

    cmpl-double v2, p0, v2

    if-nez v2, :cond_6

    .line 862
    const-string v1, "0"

    goto :goto_0

    .line 864
    :cond_6
    const/16 v2, 0xa

    if-eq p2, v2, :cond_7

    .line 865
    invoke-static {p2, p0, p1}, Lorg/mozilla/javascript/DToA;->JS_dtobasestr(ID)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 869
    :cond_7
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/FastDtoa;->numberToString(D)Ljava/lang/String;

    move-result-object v1

    .line 870
    .local v1, "result":Ljava/lang/String;
    if-nez v1, :cond_2

    .line 873
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 874
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-static {v0, v4, v4, p0, p1}, Lorg/mozilla/javascript/DToA;->JS_dtostr(Ljava/lang/StringBuilder;IID)V

    .line 875
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static padArguments([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "count"    # I

    .prologue
    .line 689
    array-length v2, p0

    if-ge p1, v2, :cond_0

    .line 702
    .end local p0    # "args":[Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 693
    .restart local p0    # "args":[Ljava/lang/Object;
    :cond_0
    new-array v1, p1, [Ljava/lang/Object;

    .line 694
    .local v1, "result":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 695
    aget-object v2, p0, v0

    aput-object v2, v1, v0

    .line 694
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 698
    :cond_1
    :goto_2
    if-ge v0, p1, :cond_2

    .line 699
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aput-object v2, v1, v0

    .line 698
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    move-object p0, v1

    .line 702
    goto :goto_0
.end method

.method public static propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2801
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "incrDecrMask"    # I

    .prologue
    .line 2808
    invoke-static {p2, p0, p3}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2809
    .local v0, "start":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 2810
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2813
    :cond_0
    move-object v1, v0

    .line 2817
    .local v1, "target":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    invoke-interface {v1, p1, v0}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 2818
    .local v2, "value":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_2

    .line 2826
    invoke-static {v1, p1, v0, v2, p4}, Lorg/mozilla/javascript/ScriptRuntime;->doScriptableIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    :goto_0
    return-object v3

    .line 2821
    :cond_2
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 2822
    if-nez v1, :cond_1

    .line 2823
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    invoke-interface {v0, p1, v0, v3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2824
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto :goto_0
.end method

.method public static rangeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 3957
    const-string v0, "RangeError"

    invoke-static {v0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static refDel(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lorg/mozilla/javascript/Ref;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1765
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Ref;->delete(Lorg/mozilla/javascript/Context;)Z

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static refGet(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lorg/mozilla/javascript/Ref;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1745
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Ref;->get(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static refIncrDecr(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lorg/mozilla/javascript/Ref;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2907
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lorg/mozilla/javascript/ScriptRuntime;->refIncrDecr(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static refIncrDecr(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;
    .locals 8
    .param p0, "ref"    # Lorg/mozilla/javascript/Ref;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "incrDecrMask"    # I

    .prologue
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 2913
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Ref;->get(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v4

    .line 2914
    .local v4, "value":Ljava/lang/Object;
    and-int/lit8 v5, p3, 0x2

    if-eqz v5, :cond_1

    const/4 v2, 0x1

    .line 2916
    .local v2, "post":Z
    :goto_0
    instance-of v5, v4, Ljava/lang/Number;

    if-eqz v5, :cond_2

    move-object v5, v4

    .line 2917
    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 2925
    .end local v4    # "value":Ljava/lang/Object;
    .local v0, "number":D
    :cond_0
    :goto_1
    and-int/lit8 v5, p3, 0x1

    if-nez v5, :cond_3

    .line 2926
    add-double/2addr v0, v6

    .line 2930
    :goto_2
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2931
    .local v3, "result":Ljava/lang/Number;
    invoke-virtual {p0, p1, p2, v3}, Lorg/mozilla/javascript/Ref;->set(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2932
    if-eqz v2, :cond_4

    .line 2935
    :goto_3
    return-object v4

    .line 2914
    .end local v0    # "number":D
    .end local v2    # "post":Z
    .end local v3    # "result":Ljava/lang/Number;
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 2919
    .restart local v2    # "post":Z
    :cond_2
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 2920
    .restart local v0    # "number":D
    if-eqz v2, :cond_0

    .line 2922
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .local v4, "value":Ljava/lang/Number;
    goto :goto_1

    .line 2928
    .end local v4    # "value":Ljava/lang/Number;
    :cond_3
    sub-double/2addr v0, v6

    goto :goto_2

    .restart local v3    # "result":Ljava/lang/Number;
    :cond_4
    move-object v4, v3

    .line 2935
    goto :goto_3
.end method

.method public static refSet(Lorg/mozilla/javascript/Ref;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lorg/mozilla/javascript/Ref;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1754
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->refSet(Lorg/mozilla/javascript/Ref;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static refSet(Lorg/mozilla/javascript/Ref;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lorg/mozilla/javascript/Ref;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1760
    invoke-virtual {p0, p2, p3, p1}, Lorg/mozilla/javascript/Ref;->set(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;
    .locals 4
    .param p0, "val"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "idFuncObj"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 4275
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    if-eqz v1, :cond_1

    move-object v0, p0

    .line 4276
    .local v0, "val1":Lorg/mozilla/javascript/Scriptable;
    :goto_0
    if-eqz v0, :cond_0

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    .line 4277
    :cond_0
    const-string v1, "msg.called.null.or.undefined"

    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1

    .line 4275
    .end local v0    # "val1":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 4279
    .restart local v0    # "val1":Lorg/mozilla/javascript/Scriptable;
    :cond_2
    return-object v0
.end method

.method public static searchDefaultNamespace(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1240
    iget-object v2, p0, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 1241
    .local v2, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v2, :cond_0

    .line 1242
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 1246
    :cond_0
    :goto_0
    invoke-interface {v2}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1247
    .local v1, "parent":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_1

    .line 1248
    const-string v3, "__default_namespace__"

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1249
    .local v0, "nsObject":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v3, :cond_2

    .line 1250
    const/4 v3, 0x0

    .line 1260
    :goto_1
    return-object v3

    .line 1254
    .end local v0    # "nsObject":Ljava/lang/Object;
    :cond_1
    const-string v3, "__default_namespace__"

    invoke-interface {v2, v3, v2}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 1255
    .restart local v0    # "nsObject":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v3, :cond_3

    :cond_2
    move-object v3, v0

    .line 1260
    goto :goto_1

    .line 1258
    :cond_3
    move-object v2, v1

    .line 1259
    goto :goto_0
.end method

.method public static setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V
    .locals 1
    .param p0, "object"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "type"    # Lorg/mozilla/javascript/TopLevel$Builtins;

    .prologue
    .line 3665
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 3666
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 3667
    invoke-static {p1, p2}, Lorg/mozilla/javascript/TopLevel;->getBuiltinPrototype(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 3668
    return-void
.end method

.method public static setConst(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "bound"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "id"    # Ljava/lang/String;

    .prologue
    .line 2064
    instance-of v0, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 2065
    invoke-interface {p0, p3, p0, p1}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2069
    :goto_0
    return-object p1

    .line 2067
    :cond_0
    invoke-static {p0, p3, p1}, Lorg/mozilla/javascript/ScriptableObject;->putConstProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setDefaultNamespace(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 5
    .param p0, "namespace"    # Ljava/lang/Object;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1217
    iget-object v1, p1, Lorg/mozilla/javascript/Context;->currentActivationCall:Lorg/mozilla/javascript/NativeCall;

    .line 1218
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_0

    .line 1219
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 1222
    :cond_0
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->currentXMLLib(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v2

    .line 1223
    .local v2, "xmlLib":Lorg/mozilla/javascript/xml/XMLLib;
    invoke-virtual {v2, p1, p0}, Lorg/mozilla/javascript/xml/XMLLib;->toDefaultXmlNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1226
    .local v0, "ns":Ljava/lang/Object;
    const-string v3, "__default_namespace__"

    invoke-interface {v1, v3, v1}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1228
    const-string v3, "__default_namespace__"

    const/4 v4, 0x6

    invoke-static {v1, v3, v0, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 1235
    :goto_0
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v3

    .line 1232
    :cond_1
    const-string v3, "__default_namespace__"

    invoke-interface {v1, v3, v1, v0}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setEnumNumbers(Ljava/lang/Object;Z)V
    .locals 0
    .param p0, "enumObj"    # Ljava/lang/Object;
    .param p1, "enumNumbers"    # Z

    .prologue
    .line 2184
    check-cast p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;

    .end local p0    # "enumObj":Ljava/lang/Object;
    iput-boolean p1, p0, Lorg/mozilla/javascript/ScriptRuntime$IdEnumeration;->enumNumbers:Z

    .line 2185
    return-void
.end method

.method public static setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V
    .locals 1
    .param p0, "fn"    # Lorg/mozilla/javascript/BaseFunction;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3646
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/BaseFunction;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 3647
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getFunctionPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/BaseFunction;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 3648
    return-void
.end method

.method public static setName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "bound"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "id"    # Ljava/lang/String;

    .prologue
    .line 2017
    if-eqz p0, :cond_0

    .line 2020
    invoke-static {p0, p4, p1}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2038
    :goto_0
    return-object p1

    .line 2025
    :cond_0
    const/16 v0, 0xb

    invoke-virtual {p2, v0}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2028
    :cond_1
    const-string v0, "msg.assn.create.strict"

    invoke-static {v0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 2032
    :cond_2
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2033
    iget-boolean v0, p2, Lorg/mozilla/javascript/Context;->useDynamicScope:Z

    if-eqz v0, :cond_3

    .line 2034
    iget-object v0, p2, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->checkDynamicScope(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2036
    :cond_3
    invoke-interface {p0, p4, p0, p1}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1604
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1613
    invoke-static {p3, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 1614
    .local v0, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 1615
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1617
    :cond_0
    invoke-static {v0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static setObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1623
    instance-of v2, p0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v2, :cond_0

    .line 1624
    check-cast p0, Lorg/mozilla/javascript/xml/XMLObject;

    .end local p0    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0, p3, p1, p2}, Lorg/mozilla/javascript/xml/XMLObject;->put(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1635
    :goto_0
    return-object p2

    .line 1626
    .restart local p0    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_0
    invoke-static {p3, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1627
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 1628
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v0

    .line 1629
    .local v0, "index":I
    invoke-static {p0, v0, p2}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)V

    goto :goto_0

    .line 1631
    .end local v0    # "index":I
    :cond_1
    invoke-static {p0, v1, p2}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1681
    invoke-static {p4}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v1 .. v6}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "cx"    # Lorg/mozilla/javascript/Context;
    .param p5, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1692
    invoke-static {p4, p0, p5}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 1693
    .local v2, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v2, :cond_0

    .line 1694
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, p3}, Lorg/mozilla/javascript/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1697
    :cond_0
    double-to-int v0, p1

    .line 1698
    .local v0, "index":I
    int-to-double v4, v0

    cmpl-double v3, v4, p1

    if-nez v3, :cond_1

    .line 1699
    invoke-static {v2, v0, p3, p4}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectIndex(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v3

    .line 1702
    :goto_0
    return-object v3

    .line 1701
    :cond_1
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v1

    .line 1702
    .local v1, "s":Ljava/lang/String;
    invoke-static {v2, v1, p3, p4}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method public static setObjectIndex(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 0
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1709
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)V

    .line 1710
    return-object p2
.end method

.method public static setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1647
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1657
    invoke-static {p3, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 1658
    .local v0, "sobj":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_0

    .line 1659
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1661
    :cond_0
    invoke-static {v0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static setObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .locals 0
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 1667
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1668
    return-object p2
.end method

.method public static setObjectProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;)V
    .locals 2
    .param p0, "object"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3654
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 3655
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 3656
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/mozilla/javascript/ScriptableObject;->getClassPrototype(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 3658
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 3659
    return-void
.end method

.method public static setRegExpProxy(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/RegExpProxy;)V
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "proxy"    # Lorg/mozilla/javascript/RegExpProxy;

    .prologue
    .line 4082
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 4083
    :cond_0
    iput-object p1, p0, Lorg/mozilla/javascript/Context;->regExpProxy:Lorg/mozilla/javascript/RegExpProxy;

    .line 4084
    return-void
.end method

.method public static shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .param p0, "x"    # Ljava/lang/Object;
    .param p1, "y"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 3100
    if-ne p0, p1, :cond_2

    .line 3101
    instance-of v4, p0, Ljava/lang/Number;

    if-nez v4, :cond_1

    .line 3130
    .end local p0    # "x":Ljava/lang/Object;
    .end local p1    # "y":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v2

    .line 3105
    .restart local p0    # "x":Ljava/lang/Object;
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_1
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "x":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 3106
    .local v0, "d":D
    cmpl-double v4, v0, v0

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0

    .line 3108
    .end local v0    # "d":D
    .restart local p0    # "x":Ljava/lang/Object;
    :cond_2
    if-eqz p0, :cond_3

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v4, :cond_4

    :cond_3
    move v2, v3

    .line 3109
    goto :goto_0

    .line 3110
    :cond_4
    instance-of v4, p0, Ljava/lang/Number;

    if-eqz v4, :cond_5

    .line 3111
    instance-of v4, p1, Ljava/lang/Number;

    if-eqz v4, :cond_9

    .line 3112
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "x":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0

    .line 3114
    .restart local p0    # "x":Ljava/lang/Object;
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_5
    instance-of v4, p0, Ljava/lang/CharSequence;

    if-eqz v4, :cond_6

    .line 3115
    instance-of v2, p1, Ljava/lang/CharSequence;

    if-eqz v2, :cond_9

    .line 3116
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 3118
    :cond_6
    instance-of v4, p0, Ljava/lang/Boolean;

    if-eqz v4, :cond_7

    .line 3119
    instance-of v2, p1, Ljava/lang/Boolean;

    if-eqz v2, :cond_9

    .line 3120
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 3122
    :cond_7
    instance-of v4, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_8

    .line 3123
    instance-of v4, p0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v4, :cond_9

    instance-of v4, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v4, :cond_9

    .line 3124
    check-cast p0, Lorg/mozilla/javascript/Wrapper;

    .end local p0    # "x":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v4

    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "y":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v5

    if-eq v4, v5, :cond_0

    move v2, v3

    goto :goto_0

    .line 3127
    .restart local p0    # "x":Ljava/lang/Object;
    .restart local p1    # "y":Ljava/lang/Object;
    :cond_8
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 3128
    if-eq p0, p1, :cond_0

    move v2, v3

    goto :goto_0

    :cond_9
    move v2, v3

    .line 3130
    goto :goto_0
.end method

.method public static specialRef(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Ref;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "specialProperty"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1780
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;

    move-result-object v0

    return-object v0
.end method

.method public static specialRef(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "specialProperty"    # Ljava/lang/String;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1786
    invoke-static {p2, p3, p0, p1}, Lorg/mozilla/javascript/SpecialRef;->createSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/String;)Lorg/mozilla/javascript/Ref;

    move-result-object v0

    return-object v0
.end method

.method private static storeIndexResult(Lorg/mozilla/javascript/Context;I)V
    .locals 0
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "index"    # I

    .prologue
    .line 4177
    iput p1, p0, Lorg/mozilla/javascript/Context;->scratchIndex:I

    .line 4178
    return-void
.end method

.method private static storeScriptable(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "value"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 4203
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->scratchScriptable:Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 4204
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 4205
    :cond_0
    iput-object p1, p0, Lorg/mozilla/javascript/Context;->scratchScriptable:Lorg/mozilla/javascript/Scriptable;

    .line 4206
    return-void
.end method

.method public static storeUint32Result(Lorg/mozilla/javascript/Context;J)V
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "value"    # J

    .prologue
    .line 4187
    const/16 v0, 0x20

    ushr-long v0, p1, v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 4188
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 4189
    :cond_0
    iput-wide p1, p0, Lorg/mozilla/javascript/Context;->scratchUint32:J

    .line 4190
    return-void
.end method

.method public static strictSetName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "bound"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "id"    # Ljava/lang/String;

    .prologue
    .line 2043
    if-eqz p0, :cond_0

    .line 2052
    invoke-static {p0, p4, p1}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2053
    return-object p1

    .line 2056
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Assignment to undefined \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" in strict mode"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2057
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "ReferenceError"

    invoke-static {v1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method static stringToNumber(Ljava/lang/String;II)D
    .locals 32
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "radix"    # I

    .prologue
    .line 460
    const/16 v13, 0x39

    .line 461
    .local v13, "digitMax":C
    const/16 v19, 0x61

    .line 462
    .local v19, "lowerCaseBound":C
    const/16 v26, 0x41

    .line 463
    .local v26, "upperCaseBound":C
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v18

    .line 464
    .local v18, "len":I
    const/16 v27, 0xa

    move/from16 v0, p2

    move/from16 v1, v27

    if-ge v0, v1, :cond_0

    .line 465
    add-int/lit8 v27, p2, 0x30

    add-int/lit8 v27, v27, -0x1

    move/from16 v0, v27

    int-to-char v13, v0

    .line 467
    :cond_0
    const/16 v27, 0xa

    move/from16 v0, p2

    move/from16 v1, v27

    if-le v0, v1, :cond_1

    .line 468
    add-int/lit8 v27, p2, 0x61

    add-int/lit8 v27, v27, -0xa

    move/from16 v0, v27

    int-to-char v0, v0

    move/from16 v19, v0

    .line 469
    add-int/lit8 v27, p2, 0x41

    add-int/lit8 v27, v27, -0xa

    move/from16 v0, v27

    int-to-char v0, v0

    move/from16 v26, v0

    .line 472
    :cond_1
    const-wide/16 v24, 0x0

    .line 473
    .local v24, "sum":D
    move/from16 v14, p1

    .local v14, "end":I
    :goto_0
    move/from16 v0, v18

    if-ge v14, v0, :cond_4

    .line 474
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 476
    .local v11, "c":C
    const/16 v27, 0x30

    move/from16 v0, v27

    if-gt v0, v11, :cond_2

    if-gt v11, v13, :cond_2

    .line 477
    add-int/lit8 v20, v11, -0x30

    .line 484
    .local v20, "newDigit":I
    :goto_1
    move/from16 v0, p2

    int-to-double v0, v0

    move-wide/from16 v28, v0

    mul-double v28, v28, v24

    move/from16 v0, v20

    int-to-double v0, v0

    move-wide/from16 v30, v0

    add-double v24, v28, v30

    .line 473
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 478
    .end local v20    # "newDigit":I
    :cond_2
    const/16 v27, 0x61

    move/from16 v0, v27

    if-gt v0, v11, :cond_3

    move/from16 v0, v19

    if-ge v11, v0, :cond_3

    .line 479
    add-int/lit8 v27, v11, -0x61

    add-int/lit8 v20, v27, 0xa

    .restart local v20    # "newDigit":I
    goto :goto_1

    .line 480
    .end local v20    # "newDigit":I
    :cond_3
    const/16 v27, 0x41

    move/from16 v0, v27

    if-gt v0, v11, :cond_4

    move/from16 v0, v26

    if-ge v11, v0, :cond_4

    .line 481
    add-int/lit8 v27, v11, -0x41

    add-int/lit8 v20, v27, 0xa

    .restart local v20    # "newDigit":I
    goto :goto_1

    .line 486
    .end local v11    # "c":C
    .end local v20    # "newDigit":I
    :cond_4
    move/from16 v0, p1

    if-ne v0, v14, :cond_5

    .line 487
    sget-wide v28, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    .line 605
    :goto_2
    return-wide v28

    .line 489
    :cond_5
    const-wide/high16 v28, 0x4340000000000000L    # 9.007199254740992E15

    cmpl-double v27, v24, v28

    if-ltz v27, :cond_8

    .line 490
    const/16 v27, 0xa

    move/from16 v0, p2

    move/from16 v1, v27

    if-ne v0, v1, :cond_6

    .line 497
    :try_start_0
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual {v0, v1, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v28

    goto :goto_2

    .line 498
    :catch_0
    move-exception v21

    .line 499
    .local v21, "nfe":Ljava/lang/NumberFormatException;
    sget-wide v28, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto :goto_2

    .line 501
    .end local v21    # "nfe":Ljava/lang/NumberFormatException;
    :cond_6
    const/16 v27, 0x2

    move/from16 v0, p2

    move/from16 v1, v27

    if-eq v0, v1, :cond_7

    const/16 v27, 0x4

    move/from16 v0, p2

    move/from16 v1, v27

    if-eq v0, v1, :cond_7

    const/16 v27, 0x8

    move/from16 v0, p2

    move/from16 v1, v27

    if-eq v0, v1, :cond_7

    const/16 v27, 0x10

    move/from16 v0, p2

    move/from16 v1, v27

    if-eq v0, v1, :cond_7

    const/16 v27, 0x20

    move/from16 v0, p2

    move/from16 v1, v27

    if-ne v0, v1, :cond_8

    .line 514
    :cond_7
    const/4 v10, 0x1

    .line 515
    .local v10, "bitShiftInChar":I
    const/4 v12, 0x0

    .line 517
    .local v12, "digit":I
    const/4 v5, 0x0

    .line 518
    .local v5, "SKIP_LEADING_ZEROS":I
    const/4 v3, 0x1

    .line 519
    .local v3, "FIRST_EXACT_53_BITS":I
    const/4 v2, 0x2

    .line 520
    .local v2, "AFTER_BIT_53":I
    const/4 v6, 0x3

    .line 521
    .local v6, "ZEROS_AFTER_54":I
    const/4 v4, 0x4

    .line 523
    .local v4, "MIXED_AFTER_54":I
    const/16 v23, 0x0

    .line 524
    .local v23, "state":I
    const/16 v15, 0x35

    .line 525
    .local v15, "exactBitsLimit":I
    const-wide/16 v16, 0x0

    .line 526
    .local v16, "factor":D
    const/4 v8, 0x0

    .line 528
    .local v8, "bit53":Z
    const/4 v9, 0x0

    .local v9, "bit54":Z
    move/from16 v22, p1

    .line 531
    .end local p1    # "start":I
    .local v22, "start":I
    :goto_3
    const/16 v27, 0x1

    move/from16 v0, v27

    if-ne v10, v0, :cond_12

    .line 532
    move/from16 v0, v22

    if-ne v0, v14, :cond_9

    .line 579
    packed-switch v23, :pswitch_data_0

    move/from16 p1, v22

    .end local v2    # "AFTER_BIT_53":I
    .end local v3    # "FIRST_EXACT_53_BITS":I
    .end local v4    # "MIXED_AFTER_54":I
    .end local v5    # "SKIP_LEADING_ZEROS":I
    .end local v6    # "ZEROS_AFTER_54":I
    .end local v8    # "bit53":Z
    .end local v9    # "bit54":Z
    .end local v10    # "bitShiftInChar":I
    .end local v12    # "digit":I
    .end local v15    # "exactBitsLimit":I
    .end local v16    # "factor":D
    .end local v22    # "start":I
    .end local v23    # "state":I
    .restart local p1    # "start":I
    :cond_8
    :goto_4
    move-wide/from16 v28, v24

    .line 605
    goto :goto_2

    .line 534
    .end local p1    # "start":I
    .restart local v2    # "AFTER_BIT_53":I
    .restart local v3    # "FIRST_EXACT_53_BITS":I
    .restart local v4    # "MIXED_AFTER_54":I
    .restart local v5    # "SKIP_LEADING_ZEROS":I
    .restart local v6    # "ZEROS_AFTER_54":I
    .restart local v8    # "bit53":Z
    .restart local v9    # "bit54":Z
    .restart local v10    # "bitShiftInChar":I
    .restart local v12    # "digit":I
    .restart local v15    # "exactBitsLimit":I
    .restart local v16    # "factor":D
    .restart local v22    # "start":I
    .restart local v23    # "state":I
    :cond_9
    add-int/lit8 p1, v22, 0x1

    .end local v22    # "start":I
    .restart local p1    # "start":I
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v12

    .line 535
    const/16 v27, 0x30

    move/from16 v0, v27

    if-gt v0, v12, :cond_b

    const/16 v27, 0x39

    move/from16 v0, v27

    if-gt v12, v0, :cond_b

    .line 536
    add-int/lit8 v12, v12, -0x30

    .line 541
    :goto_5
    move/from16 v10, p2

    .line 543
    :goto_6
    shr-int/lit8 v10, v10, 0x1

    .line 544
    and-int v27, v12, v10

    if-eqz v27, :cond_d

    const/4 v7, 0x1

    .line 546
    .local v7, "bit":Z
    :goto_7
    packed-switch v23, :pswitch_data_1

    :cond_a
    :goto_8
    move/from16 v22, p1

    .line 578
    .end local p1    # "start":I
    .restart local v22    # "start":I
    goto :goto_3

    .line 537
    .end local v7    # "bit":Z
    .end local v22    # "start":I
    .restart local p1    # "start":I
    :cond_b
    const/16 v27, 0x61

    move/from16 v0, v27

    if-gt v0, v12, :cond_c

    const/16 v27, 0x7a

    move/from16 v0, v27

    if-gt v12, v0, :cond_c

    .line 538
    add-int/lit8 v12, v12, -0x57

    goto :goto_5

    .line 540
    :cond_c
    add-int/lit8 v12, v12, -0x37

    goto :goto_5

    .line 544
    :cond_d
    const/4 v7, 0x0

    goto :goto_7

    .line 548
    .restart local v7    # "bit":Z
    :pswitch_0
    if-eqz v7, :cond_a

    .line 549
    add-int/lit8 v15, v15, -0x1

    .line 550
    const-wide/high16 v24, 0x3ff0000000000000L    # 1.0

    .line 551
    const/16 v23, 0x1

    goto :goto_8

    .line 555
    :pswitch_1
    const-wide/high16 v28, 0x4000000000000000L    # 2.0

    mul-double v24, v24, v28

    .line 556
    if-eqz v7, :cond_e

    .line 557
    const-wide/high16 v28, 0x3ff0000000000000L    # 1.0

    add-double v24, v24, v28

    .line 558
    :cond_e
    add-int/lit8 v15, v15, -0x1

    .line 559
    if-nez v15, :cond_a

    .line 560
    move v8, v7

    .line 561
    const/16 v23, 0x2

    goto :goto_8

    .line 565
    :pswitch_2
    move v9, v7

    .line 566
    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    .line 567
    const/16 v23, 0x3

    .line 568
    goto :goto_8

    .line 570
    :pswitch_3
    if-eqz v7, :cond_f

    .line 571
    const/16 v23, 0x4

    .line 575
    :cond_f
    :pswitch_4
    const-wide/high16 v28, 0x4000000000000000L    # 2.0

    mul-double v16, v16, v28

    goto :goto_8

    .line 581
    .end local v7    # "bit":Z
    .end local p1    # "start":I
    .restart local v22    # "start":I
    :pswitch_5
    const-wide/16 v24, 0x0

    move/from16 p1, v22

    .line 582
    .end local v22    # "start":I
    .restart local p1    # "start":I
    goto :goto_4

    .end local p1    # "start":I
    .restart local v22    # "start":I
    :pswitch_6
    move/from16 p1, v22

    .line 586
    .end local v22    # "start":I
    .restart local p1    # "start":I
    goto :goto_4

    .line 590
    .end local p1    # "start":I
    .restart local v22    # "start":I
    :pswitch_7
    and-int v27, v9, v8

    if-eqz v27, :cond_10

    .line 591
    const-wide/high16 v28, 0x3ff0000000000000L    # 1.0

    add-double v24, v24, v28

    .line 592
    :cond_10
    mul-double v24, v24, v16

    move/from16 p1, v22

    .line 593
    .end local v22    # "start":I
    .restart local p1    # "start":I
    goto :goto_4

    .line 597
    .end local p1    # "start":I
    .restart local v22    # "start":I
    :pswitch_8
    if-eqz v9, :cond_11

    .line 598
    const-wide/high16 v28, 0x3ff0000000000000L    # 1.0

    add-double v24, v24, v28

    .line 599
    :cond_11
    mul-double v24, v24, v16

    move/from16 p1, v22

    .end local v22    # "start":I
    .restart local p1    # "start":I
    goto/16 :goto_4

    .end local p1    # "start":I
    .restart local v22    # "start":I
    :cond_12
    move/from16 p1, v22

    .end local v22    # "start":I
    .restart local p1    # "start":I
    goto :goto_6

    .line 579
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 546
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static testUint32String(Ljava/lang/String;)J
    .locals 15
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const-wide/16 v6, 0x0

    const/16 v14, 0x9

    const-wide/16 v8, -0x1

    const/4 v11, 0x1

    .line 1350
    const/16 v0, 0xa

    .line 1352
    .local v0, "MAX_VALUE_LENGTH":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 1353
    .local v3, "len":I
    if-gt v11, v3, :cond_0

    const/16 v10, 0xa

    if-gt v3, v10, :cond_0

    .line 1354
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1355
    .local v1, "c":I
    add-int/lit8 v1, v1, -0x30

    .line 1356
    if-nez v1, :cond_2

    .line 1358
    if-ne v3, v11, :cond_1

    :goto_0
    move-wide v8, v6

    .line 1375
    .end local v1    # "c":I
    :cond_0
    :goto_1
    return-wide v8

    .restart local v1    # "c":I
    :cond_1
    move-wide v6, v8

    .line 1358
    goto :goto_0

    .line 1360
    :cond_2
    if-gt v11, v1, :cond_0

    if-gt v1, v14, :cond_0

    .line 1361
    int-to-long v4, v1

    .line 1362
    .local v4, "v":J
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_2
    if-eq v2, v3, :cond_3

    .line 1363
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v10

    add-int/lit8 v1, v10, -0x30

    .line 1364
    if-ltz v1, :cond_0

    if-gt v1, v14, :cond_0

    .line 1367
    const-wide/16 v10, 0xa

    mul-long/2addr v10, v4

    int-to-long v12, v1

    add-long v4, v10, v12

    .line 1362
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1370
    :cond_3
    const/16 v10, 0x20

    ushr-long v10, v4, v10

    cmp-long v6, v10, v6

    if-nez v6, :cond_0

    move-wide v8, v4

    .line 1371
    goto :goto_1
.end method

.method public static throwCustomError(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/JavaScriptException;
    .locals 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 4263
    new-array v2, v4, [I

    aput v6, v2, v6

    .line 4264
    .local v2, "linep":[I
    invoke-static {v2}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v1

    .line 4265
    .local v1, "filename":Ljava/lang/String;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p3, v3, v6

    aput-object v1, v3, v4

    const/4 v4, 0x2

    aget v5, v2, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, p1, p2, v3}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 4267
    .local v0, "error":Lorg/mozilla/javascript/Scriptable;
    new-instance v3, Lorg/mozilla/javascript/JavaScriptException;

    aget v4, v2, v6

    invoke-direct {v3, v0, v1, v4}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    return-object v3
.end method

.method public static throwError(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/JavaScriptException;
    .locals 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 4246
    new-array v2, v5, [I

    aput v7, v2, v7

    .line 4247
    .local v2, "linep":[I
    invoke-static {v2}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v1

    .line 4248
    .local v1, "filename":Ljava/lang/String;
    sget-object v3, Lorg/mozilla/javascript/TopLevel$Builtins;->Error:Lorg/mozilla/javascript/TopLevel$Builtins;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v7

    aput-object v1, v4, v5

    const/4 v5, 0x2

    aget v6, v2, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {p0, p1, v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->newBuiltinObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 4250
    .local v0, "error":Lorg/mozilla/javascript/Scriptable;
    new-instance v3, Lorg/mozilla/javascript/JavaScriptException;

    aget v4, v2, v7

    invoke-direct {v3, v0, v1, v4}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    return-object v3
.end method

.method public static toBoolean(Ljava/lang/Object;)Z
    .locals 8
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 377
    :cond_0
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_2

    .line 378
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 404
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_1
    :goto_0
    return v3

    .line 379
    :cond_2
    if-eqz p0, :cond_3

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v2, :cond_4

    :cond_3
    move v3, v4

    .line 380
    goto :goto_0

    .line 381
    :cond_4
    instance-of v2, p0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_6

    .line 382
    check-cast p0, Ljava/lang/CharSequence;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eqz v2, :cond_5

    move v2, v3

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_5
    move v2, v4

    goto :goto_1

    .line 383
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_6
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_8

    .line 384
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 385
    .local v0, "d":D
    cmpl-double v2, v0, v0

    if-nez v2, :cond_7

    const-wide/16 v6, 0x0

    cmpl-double v2, v0, v6

    if-nez v2, :cond_1

    :cond_7
    move v3, v4

    goto :goto_0

    .line 387
    .end local v0    # "d":D
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_8
    instance-of v2, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_a

    .line 388
    instance-of v2, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v2, :cond_9

    move-object v2, p0

    check-cast v2, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ScriptableObject;->avoidObjectDetection()Z

    move-result v2

    if-eqz v2, :cond_9

    move v3, v4

    .line 391
    goto :goto_0

    .line 393
    :cond_9
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/Context;->isVersionECMA1()Z

    move-result v2

    if-nez v2, :cond_1

    .line 398
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "val":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    invoke-interface {p0, v2}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 399
    .restart local p0    # "val":Ljava/lang/Object;
    instance-of v2, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_0

    .line 400
    const-string v2, "msg.primitive.expected"

    invoke-static {v2, p0}, Lorg/mozilla/javascript/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 403
    :cond_a
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 791
    instance-of v0, p0, Lorg/mozilla/javascript/NativeString;

    if-eqz v0, :cond_0

    .line 792
    check-cast p0, Lorg/mozilla/javascript/NativeString;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeString;->toCharSequence()Ljava/lang/CharSequence;

    move-result-object p0

    .line 794
    :goto_0
    return-object p0

    .restart local p0    # "val":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    check-cast p0, Ljava/lang/CharSequence;

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static toInt32(D)I
    .locals 2
    .param p0, "d"    # D

    .prologue
    .line 1187
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->doubleToInt32(D)I

    move-result v0

    return v0
.end method

.method public static toInt32(Ljava/lang/Object;)I
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 1176
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 1177
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1179
    .restart local p0    # "val":Ljava/lang/Object;
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(D)I

    move-result v0

    goto :goto_0
.end method

.method public static toInt32([Ljava/lang/Object;I)I
    .locals 1
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    .line 1183
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toInteger(D)D
    .locals 4
    .param p0, "d"    # D

    .prologue
    const-wide/16 v0, 0x0

    .line 1151
    cmpl-double v2, p0, p0

    if-eqz v2, :cond_1

    move-wide p0, v0

    .line 1162
    .end local p0    # "d":D
    :cond_0
    :goto_0
    return-wide p0

    .line 1154
    .restart local p0    # "d":D
    :cond_1
    cmpl-double v2, p0, v0

    if-eqz v2, :cond_0

    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v2, p0, v2

    if-eqz v2, :cond_0

    const-wide/high16 v2, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v2, p0, v2

    if-eqz v2, :cond_0

    .line 1159
    cmpl-double v0, p0, v0

    if-lez v0, :cond_2

    .line 1160
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p0

    goto :goto_0

    .line 1162
    :cond_2
    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p0

    goto :goto_0
.end method

.method public static toInteger(Ljava/lang/Object;)D
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 1145
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toInteger([Ljava/lang/Object;I)D
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    .line 1166
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public static toIterator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/Scriptable;
    .locals 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "keyOnly"    # Z

    .prologue
    .line 2107
    const-string v3, "__iterator__"

    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2110
    const-string v3, "__iterator__"

    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 2112
    .local v2, "v":Ljava/lang/Object;
    instance-of v3, v2, Lorg/mozilla/javascript/Callable;

    if-nez v3, :cond_0

    .line 2113
    const-string v3, "msg.invalid.iterator"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    :cond_0
    move-object v1, v2

    .line 2115
    check-cast v1, Lorg/mozilla/javascript/Callable;

    .line 2116
    .local v1, "f":Lorg/mozilla/javascript/Callable;
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    if-eqz p3, :cond_1

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    aput-object v3, v0, v4

    .line 2118
    .local v0, "args":[Ljava/lang/Object;
    invoke-interface {v1, p0, p1, p2, v0}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2119
    instance-of v3, v2, Lorg/mozilla/javascript/Scriptable;

    if-nez v3, :cond_2

    .line 2120
    const-string v3, "msg.iterator.primitive"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 2116
    .end local v0    # "args":[Ljava/lang/Object;
    :cond_1
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 2122
    .restart local v0    # "args":[Ljava/lang/Object;
    :cond_2
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .line 2124
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "f":Lorg/mozilla/javascript/Callable;
    .end local v2    # "v":Ljava/lang/Object;
    :goto_1
    return-object v2

    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static toNumber(Ljava/lang/Object;)D
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v0, 0x0

    .line 416
    :cond_0
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_2

    .line 417
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 435
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-wide v0

    .line 418
    :cond_2
    if-eqz p0, :cond_1

    .line 420
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v2, :cond_3

    .line 421
    sget-wide v0, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto :goto_0

    .line 422
    :cond_3
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 423
    check-cast p0, Ljava/lang/String;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 424
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_4
    instance-of v2, p0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_5

    .line 425
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 426
    :cond_5
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_6

    .line 427
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    goto :goto_0

    .line 428
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_6
    instance-of v2, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_7

    .line 429
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "val":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {p0, v2}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 430
    .restart local p0    # "val":Ljava/lang/Object;
    instance-of v2, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_0

    .line 431
    const-string v0, "msg.primitive.expected"

    invoke-static {v0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 434
    :cond_7
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 435
    sget-wide v0, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto :goto_0
.end method

.method public static toNumber(Ljava/lang/String;)D
    .locals 20
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 615
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v11

    .line 616
    .local v11, "len":I
    const/4 v12, 0x0

    .line 619
    .local v12, "start":I
    :goto_0
    if-ne v12, v11, :cond_1

    .line 621
    const-wide/16 v16, 0x0

    .line 678
    :cond_0
    :goto_1
    return-wide v16

    .line 623
    :cond_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v13

    .line 624
    .local v13, "startChar":C
    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v15

    if-nez v15, :cond_3

    .line 629
    const/16 v15, 0x30

    if-ne v13, v15, :cond_4

    .line 630
    add-int/lit8 v15, v12, 0x2

    if-ge v15, v11, :cond_7

    .line 631
    add-int/lit8 v15, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 632
    .local v5, "c1":I
    const/16 v15, 0x78

    if-eq v5, v15, :cond_2

    const/16 v15, 0x58

    if-ne v5, v15, :cond_7

    .line 634
    :cond_2
    add-int/lit8 v15, v12, 0x2

    const/16 v18, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v15, v1}, Lorg/mozilla/javascript/ScriptRuntime;->stringToNumber(Ljava/lang/String;II)D

    move-result-wide v16

    goto :goto_1

    .line 626
    .end local v5    # "c1":I
    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 637
    :cond_4
    const/16 v15, 0x2b

    if-eq v13, v15, :cond_5

    const/16 v15, 0x2d

    if-ne v13, v15, :cond_7

    .line 638
    :cond_5
    add-int/lit8 v15, v12, 0x3

    if-ge v15, v11, :cond_7

    add-int/lit8 v15, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v18, 0x30

    move/from16 v0, v18

    if-ne v15, v0, :cond_7

    .line 639
    add-int/lit8 v15, v12, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 640
    .local v6, "c2":I
    const/16 v15, 0x78

    if-eq v6, v15, :cond_6

    const/16 v15, 0x58

    if-ne v6, v15, :cond_7

    .line 642
    :cond_6
    add-int/lit8 v15, v12, 0x3

    const/16 v18, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v15, v1}, Lorg/mozilla/javascript/ScriptRuntime;->stringToNumber(Ljava/lang/String;II)D

    move-result-wide v16

    .line 643
    .local v16, "val":D
    const/16 v15, 0x2d

    if-ne v13, v15, :cond_0

    move-wide/from16 v0, v16

    neg-double v0, v0

    move-wide/from16 v16, v0

    goto :goto_1

    .line 648
    .end local v6    # "c2":I
    .end local v16    # "val":D
    :cond_7
    add-int/lit8 v7, v11, -0x1

    .line 650
    .local v7, "end":I
    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .local v8, "endChar":C
    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 651
    add-int/lit8 v7, v7, -0x1

    goto :goto_2

    .line 652
    :cond_8
    const/16 v15, 0x79

    if-ne v8, v15, :cond_d

    .line 654
    const/16 v15, 0x2b

    if-eq v13, v15, :cond_9

    const/16 v15, 0x2d

    if-ne v13, v15, :cond_a

    .line 655
    :cond_9
    add-int/lit8 v12, v12, 0x1

    .line 656
    :cond_a
    add-int/lit8 v15, v12, 0x7

    if-ne v15, v7, :cond_c

    const-string v15, "Infinity"

    const/16 v18, 0x0

    const/16 v19, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v12, v15, v1, v2}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v15

    if-eqz v15, :cond_c

    .line 657
    const/16 v15, 0x2d

    if-ne v13, v15, :cond_b

    const-wide/high16 v18, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    :goto_3
    move-wide/from16 v16, v18

    goto/16 :goto_1

    :cond_b
    const-wide/high16 v18, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_3

    .line 660
    :cond_c
    sget-wide v16, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto/16 :goto_1

    .line 664
    :cond_d
    add-int/lit8 v15, v7, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 667
    .local v14, "sub":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v15

    add-int/lit8 v10, v15, -0x1

    .local v10, "i":I
    :goto_4
    if-ltz v10, :cond_11

    .line 668
    invoke-virtual {v14, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 669
    .local v4, "c":C
    const/16 v15, 0x30

    if-gt v15, v4, :cond_e

    const/16 v15, 0x39

    if-le v4, v15, :cond_f

    :cond_e
    const/16 v15, 0x2e

    if-eq v4, v15, :cond_f

    const/16 v15, 0x65

    if-eq v4, v15, :cond_f

    const/16 v15, 0x45

    if-eq v4, v15, :cond_f

    const/16 v15, 0x2b

    if-eq v4, v15, :cond_f

    const/16 v15, 0x2d

    if-ne v4, v15, :cond_10

    .line 667
    :cond_f
    add-int/lit8 v10, v10, -0x1

    goto :goto_4

    .line 673
    :cond_10
    sget-wide v16, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto/16 :goto_1

    .line 676
    .end local v4    # "c":C
    :cond_11
    :try_start_0
    invoke-static {v14}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v16

    goto/16 :goto_1

    .line 677
    :catch_0
    move-exception v9

    .line 678
    .local v9, "ex":Ljava/lang/NumberFormatException;
    sget-wide v16, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto/16 :goto_1
.end method

.method public static toNumber([Ljava/lang/Object;I)D
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    .line 440
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    sget-wide v0, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    goto :goto_0
.end method

.method public static toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 4
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 1051
    instance-of v2, p2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_0

    .line 1052
    check-cast p2, Lorg/mozilla/javascript/Scriptable;

    .end local p2    # "val":Ljava/lang/Object;
    move-object v0, p2

    .line 1080
    :goto_0
    return-object v0

    .line 1054
    .restart local p2    # "val":Ljava/lang/Object;
    :cond_0
    instance-of v2, p2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_1

    .line 1056
    new-instance v0, Lorg/mozilla/javascript/NativeString;

    check-cast p2, Ljava/lang/CharSequence;

    .end local p2    # "val":Ljava/lang/Object;
    invoke-direct {v0, p2}, Lorg/mozilla/javascript/NativeString;-><init>(Ljava/lang/CharSequence;)V

    .line 1057
    .local v0, "result":Lorg/mozilla/javascript/NativeString;
    sget-object v2, Lorg/mozilla/javascript/TopLevel$Builtins;->String:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, p1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    goto :goto_0

    .line 1060
    .end local v0    # "result":Lorg/mozilla/javascript/NativeString;
    .restart local p2    # "val":Ljava/lang/Object;
    :cond_1
    instance-of v2, p2, Ljava/lang/Number;

    if-eqz v2, :cond_2

    .line 1061
    new-instance v0, Lorg/mozilla/javascript/NativeNumber;

    check-cast p2, Ljava/lang/Number;

    .end local p2    # "val":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lorg/mozilla/javascript/NativeNumber;-><init>(D)V

    .line 1062
    .local v0, "result":Lorg/mozilla/javascript/NativeNumber;
    sget-object v2, Lorg/mozilla/javascript/TopLevel$Builtins;->Number:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, p1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    goto :goto_0

    .line 1065
    .end local v0    # "result":Lorg/mozilla/javascript/NativeNumber;
    .restart local p2    # "val":Ljava/lang/Object;
    :cond_2
    instance-of v2, p2, Ljava/lang/Boolean;

    if-eqz v2, :cond_3

    .line 1066
    new-instance v0, Lorg/mozilla/javascript/NativeBoolean;

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "val":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct {v0, v2}, Lorg/mozilla/javascript/NativeBoolean;-><init>(Z)V

    .line 1067
    .local v0, "result":Lorg/mozilla/javascript/NativeBoolean;
    sget-object v2, Lorg/mozilla/javascript/TopLevel$Builtins;->Boolean:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, p1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    goto :goto_0

    .line 1070
    .end local v0    # "result":Lorg/mozilla/javascript/NativeBoolean;
    .restart local p2    # "val":Ljava/lang/Object;
    :cond_3
    if-nez p2, :cond_4

    .line 1071
    const-string v2, "msg.null.to.object"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1073
    :cond_4
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v2, :cond_5

    .line 1074
    const-string v2, "msg.undef.to.object"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1078
    :cond_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p0, p1, p2, v3}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 1079
    .local v1, "wrapped":Ljava/lang/Object;
    instance-of v2, v1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_6

    .line 1080
    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .end local v1    # "wrapped":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0

    .line 1081
    .restart local v1    # "wrapped":Ljava/lang/Object;
    :cond_6
    const-string v2, "msg.invalid.type"

    invoke-static {v2, p2}, Lorg/mozilla/javascript/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method public static toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/mozilla/javascript/Scriptable;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1091
    .local p3, "staticClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static toObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "val"    # Ljava/lang/Object;

    .prologue
    .line 994
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 995
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .line 997
    .end local p1    # "val":Ljava/lang/Object;
    :goto_0
    return-object p1

    .restart local p1    # "val":Ljava/lang/Object;
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0
.end method

.method public static toObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/mozilla/javascript/Scriptable;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1038
    .local p2, "staticClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 1039
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .line 1041
    .end local p1    # "val":Ljava/lang/Object;
    :goto_0
    return-object p1

    .restart local p1    # "val":Ljava/lang/Object;
    :cond_0
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0
.end method

.method public static toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1009
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 1010
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .line 1014
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p1

    .line 1011
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p1, v0, :cond_1

    .line 1012
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 1014
    :cond_1
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public static toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1023
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 1024
    check-cast p1, Lorg/mozilla/javascript/Scriptable;

    .line 1028
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p1

    .line 1025
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p1, v0, :cond_1

    .line 1026
    invoke-static {p0, p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 1028
    :cond_1
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public static toPrimitive(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 2940
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptRuntime;->toPrimitive(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static toPrimitive(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 2945
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v2, p0, Lorg/mozilla/javascript/Scriptable;

    if-nez v2, :cond_0

    .line 2952
    .end local p0    # "val":Ljava/lang/Object;
    :goto_0
    return-object p0

    .restart local p0    # "val":Ljava/lang/Object;
    :cond_0
    move-object v1, p0

    .line 2948
    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .line 2949
    .local v1, "s":Lorg/mozilla/javascript/Scriptable;
    invoke-interface {v1, p1}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 2950
    .local v0, "result":Ljava/lang/Object;
    instance-of v2, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_1

    .line 2951
    const-string v2, "msg.bad.default.value"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    :cond_1
    move-object p0, v0

    .line 2952
    goto :goto_0
.end method

.method public static toString(D)Ljava/lang/String;
    .locals 2
    .param p0, "val"    # D

    .prologue
    .line 846
    const/16 v0, 0xa

    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 804
    :cond_0
    if-nez p0, :cond_1

    .line 805
    const-string p0, "null"

    .line 828
    .end local p0    # "val":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 807
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v0, :cond_2

    .line 808
    const-string p0, "undefined"

    goto :goto_0

    .line 810
    :cond_2
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 811
    check-cast p0, Ljava/lang/String;

    goto :goto_0

    .line 813
    :cond_3
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    .line 814
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 816
    :cond_4
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_5

    .line 819
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 821
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_5
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_6

    .line 822
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "val":Ljava/lang/Object;
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    invoke-interface {p0, v0}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 823
    .restart local p0    # "val":Ljava/lang/Object;
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_0

    .line 824
    const-string v0, "msg.primitive.expected"

    invoke-static {v0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 828
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static toString([Ljava/lang/Object;I)Ljava/lang/String;
    .locals 1
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    .line 839
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "undefined"

    goto :goto_0
.end method

.method static toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;
    .locals 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 1411
    instance-of v6, p1, Ljava/lang/Number;

    if-eqz v6, :cond_2

    move-object v6, p1

    .line 1412
    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 1413
    .local v0, "d":D
    double-to-int v2, v0

    .line 1414
    .local v2, "index":I
    int-to-double v8, v2

    cmpl-double v6, v8, v0

    if-nez v6, :cond_1

    .line 1415
    invoke-static {p0, v2}, Lorg/mozilla/javascript/ScriptRuntime;->storeIndexResult(Lorg/mozilla/javascript/Context;I)V

    move-object v3, v7

    .line 1431
    .end local v0    # "d":D
    .end local v2    # "index":I
    :cond_0
    :goto_0
    return-object v3

    .line 1418
    .restart local v0    # "d":D
    .restart local v2    # "index":I
    :cond_1
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 1421
    .end local v0    # "d":D
    .end local v2    # "index":I
    :cond_2
    instance-of v6, p1, Ljava/lang/String;

    if-eqz v6, :cond_3

    move-object v3, p1

    .line 1422
    check-cast v3, Ljava/lang/String;

    .line 1426
    .local v3, "s":Ljava/lang/String;
    :goto_1
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->indexFromString(Ljava/lang/String;)J

    move-result-wide v4

    .line 1427
    .local v4, "indexTest":J
    const-wide/16 v8, 0x0

    cmp-long v6, v4, v8

    if-ltz v6, :cond_0

    .line 1428
    long-to-int v6, v4

    invoke-static {p0, v6}, Lorg/mozilla/javascript/ScriptRuntime;->storeIndexResult(Lorg/mozilla/javascript/Context;I)V

    move-object v3, v7

    .line 1429
    goto :goto_0

    .line 1424
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "indexTest":J
    :cond_3
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1
.end method

.method public static toUint16(Ljava/lang/Object;)C
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 1207
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 1208
    .local v0, "d":D
    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->doubleToInt32(D)I

    move-result v2

    int-to-char v2, v2

    return v2
.end method

.method public static toUint32(D)J
    .locals 4
    .param p0, "d"    # D

    .prologue
    .line 1195
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->doubleToInt32(D)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static toUint32(Ljava/lang/Object;)J
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 1199
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v0

    return-wide v0
.end method

.method private static topScopeName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1944
    iget-boolean v0, p0, Lorg/mozilla/javascript/Context;->useDynamicScope:Z

    if-eqz v0, :cond_0

    .line 1945
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->checkDynamicScope(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1947
    :cond_0
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 3962
    const-string v0, "TypeError"

    invoke-static {v0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;

    .prologue
    .line 3967
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3968
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 3973
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 3974
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 3980
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 3981
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/String;
    .param p2, "arg2"    # Ljava/lang/String;
    .param p3, "arg3"    # Ljava/lang/String;

    .prologue
    .line 3987
    invoke-static {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 3988
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeErrorThrower()Lorg/mozilla/javascript/BaseFunction;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 44
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeErrorThrower(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v0

    return-object v0
.end method

.method public static typeErrorThrower(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/BaseFunction;
    .locals 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 52
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->typeErrorThrower:Lorg/mozilla/javascript/BaseFunction;

    if-nez v1, :cond_0

    .line 53
    new-instance v0, Lorg/mozilla/javascript/ScriptRuntime$1;

    invoke-direct {v0}, Lorg/mozilla/javascript/ScriptRuntime$1;-><init>()V

    .line 65
    .local v0, "thrower":Lorg/mozilla/javascript/BaseFunction;
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->topCallScope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V

    .line 66
    invoke-virtual {v0}, Lorg/mozilla/javascript/BaseFunction;->preventExtensions()V

    .line 67
    iput-object v0, p0, Lorg/mozilla/javascript/Context;->typeErrorThrower:Lorg/mozilla/javascript/BaseFunction;

    .line 69
    .end local v0    # "thrower":Lorg/mozilla/javascript/BaseFunction;
    :cond_0
    iget-object v1, p0, Lorg/mozilla/javascript/Context;->typeErrorThrower:Lorg/mozilla/javascript/BaseFunction;

    return-object v1
.end method

.method public static typeof(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 2672
    if-nez p0, :cond_0

    .line 2673
    const-string v0, "object"

    .line 2685
    :goto_0
    return-object v0

    .line 2674
    :cond_0
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v0, :cond_1

    .line 2675
    const-string v0, "undefined"

    goto :goto_0

    .line 2676
    :cond_1
    instance-of v0, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v0, :cond_2

    .line 2677
    check-cast p0, Lorg/mozilla/javascript/ScriptableObject;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTypeOf()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2678
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_4

    .line 2679
    instance-of v0, p0, Lorg/mozilla/javascript/Callable;

    if-eqz v0, :cond_3

    const-string v0, "function"

    goto :goto_0

    :cond_3
    const-string v0, "object"

    goto :goto_0

    .line 2680
    :cond_4
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_5

    .line 2681
    const-string v0, "string"

    goto :goto_0

    .line 2682
    :cond_5
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_6

    .line 2683
    const-string v0, "number"

    goto :goto_0

    .line 2684
    :cond_6
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    .line 2685
    const-string v0, "boolean"

    goto :goto_0

    .line 2686
    :cond_7
    const-string v0, "msg.invalid.type"

    invoke-static {v0, p0}, Lorg/mozilla/javascript/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static typeofName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 2694
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 2695
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v0, p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->bind(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 2696
    .local v1, "val":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_0

    .line 2697
    const-string v2, "undefined"

    .line 2698
    :goto_0
    return-object v2

    :cond_0
    invoke-static {v1, p1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 3998
    const-string v0, "msg.undef.method.call"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method private static undefDeleteError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 4011
    const-string v0, "msg.undef.prop.delete"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 3993
    const-string v0, "msg.undef.prop.read"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 4005
    const-string v0, "msg.undef.prop.write"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method static uneval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/String;
    .locals 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/16 v8, 0x22

    const-wide/16 v10, 0x0

    .line 882
    if-nez p2, :cond_0

    .line 883
    const-string v7, "null"

    .line 920
    .end local p2    # "value":Ljava/lang/Object;
    :goto_0
    return-object v7

    .line 885
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_0
    sget-object v7, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v7, :cond_1

    .line 886
    const-string v7, "undefined"

    goto :goto_0

    .line 888
    :cond_1
    instance-of v7, p2, Ljava/lang/CharSequence;

    if-eqz v7, :cond_2

    .line 889
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 890
    .local v2, "escaped":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x2

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 891
    .local v5, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 892
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 893
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 894
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 896
    .end local v2    # "escaped":Ljava/lang/String;
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    :cond_2
    instance-of v7, p2, Ljava/lang/Number;

    if-eqz v7, :cond_4

    .line 897
    check-cast p2, Ljava/lang/Number;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 898
    .local v0, "d":D
    cmpl-double v7, v0, v10

    if-nez v7, :cond_3

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    div-double/2addr v8, v0

    cmpg-double v7, v8, v10

    if-gez v7, :cond_3

    .line 899
    const-string v7, "-0"

    goto :goto_0

    .line 901
    :cond_3
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 903
    .end local v0    # "d":D
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_4
    instance-of v7, p2, Ljava/lang/Boolean;

    if-eqz v7, :cond_5

    .line 904
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 906
    :cond_5
    instance-of v7, p2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v7, :cond_7

    move-object v4, p2

    .line 907
    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    .line 910
    .local v4, "obj":Lorg/mozilla/javascript/Scriptable;
    const-string v7, "toSource"

    invoke-static {v4, v7}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 911
    const-string v7, "toSource"

    invoke-static {v4, v7}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 912
    .local v6, "v":Ljava/lang/Object;
    instance-of v7, v6, Lorg/mozilla/javascript/Function;

    if-eqz v7, :cond_6

    move-object v3, v6

    .line 913
    check-cast v3, Lorg/mozilla/javascript/Function;

    .line 914
    .local v3, "f":Lorg/mozilla/javascript/Function;
    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v3, p0, p1, v4, v7}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 917
    .end local v3    # "f":Lorg/mozilla/javascript/Function;
    .end local v6    # "v":Ljava/lang/Object;
    :cond_6
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 919
    .end local v4    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_7
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 920
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0
.end method

.method public static updateDotQuery(ZLorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "value"    # Z
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 3633
    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/NativeWith;

    .line 3634
    .local v0, "nw":Lorg/mozilla/javascript/NativeWith;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeWith;->updateDotQuery(Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static warnAboutNonJSObject(Ljava/lang/Object;)V
    .locals 3
    .param p0, "nonJSObject"    # Ljava/lang/Object;

    .prologue
    .line 4067
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RHINO USAGE WARNING: Missed Context.javaToJS() conversion:\nRhino runtime detected object "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " of class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " where it expected String, Number, Boolean or Scriptable instance. Please check your code for missing Context.javaToJS() call."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4070
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 4072
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 4073
    return-void
.end method

.method public static wrapBoolean(Z)Ljava/lang/Boolean;
    .locals 1
    .param p0, "b"    # Z

    .prologue
    .line 353
    if-eqz p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static wrapException(Ljava/lang/Throwable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;
    .locals 13
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3528
    const/4 v5, 0x0

    .line 3530
    .local v5, "javaException":Ljava/lang/Throwable;
    instance-of v11, p0, Lorg/mozilla/javascript/EcmaError;

    if-eqz v11, :cond_4

    move-object v1, p0

    .line 3531
    check-cast v1, Lorg/mozilla/javascript/EcmaError;

    .line 3532
    .local v1, "ee":Lorg/mozilla/javascript/EcmaError;
    move-object v7, v1

    .line 3533
    .local v7, "re":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual {v1}, Lorg/mozilla/javascript/EcmaError;->getName()Ljava/lang/String;

    move-result-object v3

    .line 3534
    .local v3, "errorName":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/mozilla/javascript/EcmaError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    .line 3560
    .end local v1    # "ee":Lorg/mozilla/javascript/EcmaError;
    .local v2, "errorMsg":Ljava/lang/String;
    :goto_0
    invoke-virtual {v7}, Lorg/mozilla/javascript/RhinoException;->sourceName()Ljava/lang/String;

    move-result-object v8

    .line 3561
    .local v8, "sourceUri":Ljava/lang/String;
    if-nez v8, :cond_0

    .line 3562
    const-string v8, ""

    .line 3564
    :cond_0
    invoke-virtual {v7}, Lorg/mozilla/javascript/RhinoException;->lineNumber()I

    move-result v6

    .line 3566
    .local v6, "line":I
    if-lez v6, :cond_8

    .line 3567
    const/4 v11, 0x3

    new-array v0, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v2, v0, v11

    const/4 v11, 0x1

    aput-object v8, v0, v11

    const/4 v11, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v0, v11

    .line 3572
    .local v0, "args":[Ljava/lang/Object;
    :goto_1
    invoke-virtual {p2, p1, v3, v0}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 3573
    .local v4, "errorObject":Lorg/mozilla/javascript/Scriptable;
    const-string v11, "name"

    invoke-static {v4, v11, v3}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3575
    instance-of v11, v4, Lorg/mozilla/javascript/NativeError;

    if-eqz v11, :cond_1

    move-object v11, v4

    .line 3576
    check-cast v11, Lorg/mozilla/javascript/NativeError;

    invoke-virtual {v11, v7}, Lorg/mozilla/javascript/NativeError;->setStackProvider(Lorg/mozilla/javascript/RhinoException;)V

    .line 3579
    :cond_1
    if-eqz v5, :cond_2

    invoke-static {p2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->isVisible(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 3580
    invoke-virtual {p2}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, p2, p1, v5, v12}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    .line 3582
    .local v10, "wrap":Ljava/lang/Object;
    const-string v11, "javaException"

    const/4 v12, 0x7

    invoke-static {v4, v11, v10, v12}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3586
    .end local v10    # "wrap":Ljava/lang/Object;
    :cond_2
    invoke-static {p2, v7}, Lorg/mozilla/javascript/ScriptRuntime;->isVisible(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 3587
    invoke-virtual {p2}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, p2, p1, v7, v12}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    .line 3588
    .restart local v10    # "wrap":Ljava/lang/Object;
    const-string v11, "rhinoException"

    const/4 v12, 0x7

    invoke-static {v4, v11, v10, v12}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3592
    .end local v10    # "wrap":Ljava/lang/Object;
    :cond_3
    return-object v4

    .line 3535
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v2    # "errorMsg":Ljava/lang/String;
    .end local v3    # "errorName":Ljava/lang/String;
    .end local v4    # "errorObject":Lorg/mozilla/javascript/Scriptable;
    .end local v6    # "line":I
    .end local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    .end local v8    # "sourceUri":Ljava/lang/String;
    :cond_4
    instance-of v11, p0, Lorg/mozilla/javascript/WrappedException;

    if-eqz v11, :cond_5

    move-object v9, p0

    .line 3536
    check-cast v9, Lorg/mozilla/javascript/WrappedException;

    .line 3537
    .local v9, "we":Lorg/mozilla/javascript/WrappedException;
    move-object v7, v9

    .line 3538
    .restart local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    invoke-virtual {v9}, Lorg/mozilla/javascript/WrappedException;->getWrappedException()Ljava/lang/Throwable;

    move-result-object v5

    .line 3539
    const-string v3, "JavaException"

    .line 3540
    .restart local v3    # "errorName":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ": "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3542
    .restart local v2    # "errorMsg":Ljava/lang/String;
    goto/16 :goto_0

    .end local v2    # "errorMsg":Ljava/lang/String;
    .end local v3    # "errorName":Ljava/lang/String;
    .end local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    .end local v9    # "we":Lorg/mozilla/javascript/WrappedException;
    :cond_5
    instance-of v11, p0, Lorg/mozilla/javascript/EvaluatorException;

    if-eqz v11, :cond_6

    move-object v1, p0

    .line 3544
    check-cast v1, Lorg/mozilla/javascript/EvaluatorException;

    .line 3545
    .local v1, "ee":Lorg/mozilla/javascript/EvaluatorException;
    move-object v7, v1

    .line 3546
    .restart local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    const-string v3, "InternalError"

    .line 3547
    .restart local v3    # "errorName":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/mozilla/javascript/EvaluatorException;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 3548
    .restart local v2    # "errorMsg":Ljava/lang/String;
    goto/16 :goto_0

    .end local v1    # "ee":Lorg/mozilla/javascript/EvaluatorException;
    .end local v2    # "errorMsg":Ljava/lang/String;
    .end local v3    # "errorName":Ljava/lang/String;
    .end local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    :cond_6
    const/16 v11, 0xd

    invoke-virtual {p2, v11}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 3551
    new-instance v7, Lorg/mozilla/javascript/WrappedException;

    invoke-direct {v7, p0}, Lorg/mozilla/javascript/WrappedException;-><init>(Ljava/lang/Throwable;)V

    .line 3552
    .restart local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    const-string v3, "JavaException"

    .line 3553
    .restart local v3    # "errorName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "errorMsg":Ljava/lang/String;
    goto/16 :goto_0

    .line 3557
    .end local v2    # "errorMsg":Ljava/lang/String;
    .end local v3    # "errorName":Ljava/lang/String;
    .end local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    :cond_7
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v11

    throw v11

    .line 3569
    .restart local v2    # "errorMsg":Ljava/lang/String;
    .restart local v3    # "errorName":Ljava/lang/String;
    .restart local v6    # "line":I
    .restart local v7    # "re":Lorg/mozilla/javascript/RhinoException;
    .restart local v8    # "sourceUri":Ljava/lang/String;
    :cond_8
    const/4 v11, 0x2

    new-array v0, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v2, v0, v11

    const/4 v11, 0x1

    aput-object v8, v0, v11

    .restart local v0    # "args":[Ljava/lang/Object;
    goto/16 :goto_1
.end method

.method public static wrapInt(I)Ljava/lang/Integer;
    .locals 1
    .param p0, "i"    # I

    .prologue
    .line 358
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static wrapNumber(D)Ljava/lang/Number;
    .locals 2
    .param p0, "x"    # D

    .prologue
    .line 363
    cmpl-double v0, p0, p0

    if-eqz v0, :cond_0

    .line 364
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    .line 366
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p0, p1}, Ljava/lang/Double;-><init>(D)V

    goto :goto_0
.end method

.method public static wrapRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .locals 1
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "compiled"    # Ljava/lang/Object;

    .prologue
    .line 4097
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getRegExpProxy()Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/mozilla/javascript/RegExpProxy;->wrapRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method
