.class public Lorg/mozilla/javascript/ContinuationPending;
.super Ljava/lang/RuntimeException;
.source "ContinuationPending.java"


# static fields
.field private static final serialVersionUID:J = 0x44c7471fc8185f08L


# instance fields
.field private applicationState:Ljava/lang/Object;

.field private continuationState:Lorg/mozilla/javascript/NativeContinuation;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/NativeContinuation;)V
    .locals 0
    .param p1, "continuationState"    # Lorg/mozilla/javascript/NativeContinuation;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/mozilla/javascript/ContinuationPending;->continuationState:Lorg/mozilla/javascript/NativeContinuation;

    .line 33
    return-void
.end method


# virtual methods
.method public getApplicationState()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/mozilla/javascript/ContinuationPending;->applicationState:Ljava/lang/Object;

    return-object v0
.end method

.method public getContinuation()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/mozilla/javascript/ContinuationPending;->continuationState:Lorg/mozilla/javascript/NativeContinuation;

    return-object v0
.end method

.method getContinuationState()Lorg/mozilla/javascript/NativeContinuation;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/mozilla/javascript/ContinuationPending;->continuationState:Lorg/mozilla/javascript/NativeContinuation;

    return-object v0
.end method

.method public setApplicationState(Ljava/lang/Object;)V
    .locals 0
    .param p1, "applicationState"    # Ljava/lang/Object;

    .prologue
    .line 58
    iput-object p1, p0, Lorg/mozilla/javascript/ContinuationPending;->applicationState:Ljava/lang/Object;

    .line 59
    return-void
.end method
