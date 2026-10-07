.class public Lorg/fmod/AudioDevice;
.super Ljava/lang/Object;
.source "AudioDevice.java"


# instance fields
.field private mTrack:Landroid/media/AudioTrack;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 26
    const-string v1, "FMod/AudioDevice"

    const-string v2, "close"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    :try_start_0
    iget-object v1, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V

    .line 29
    iget-object v1, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V

    .line 30
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    return-void

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "FMod/AudioDevice"

    const-string v2, "Failed to close device"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public fetchChannelConfigFromCount(I)I
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 13
    packed-switch p1, :pswitch_data_0

    .line 21
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 15
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 17
    :pswitch_2
    const/4 v0, 0x3

    goto :goto_0

    .line 19
    :pswitch_3
    const/16 v0, 0xfc

    goto :goto_0

    .line 13
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public init(IIII)Z
    .locals 11
    .param p1, "channelCount"    # I
    .param p2, "sampleRate"    # I
    .param p3, "unk1"    # I
    .param p4, "unk2"    # I

    .prologue
    const/4 v2, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 38
    const-string v0, "FMod/AudioDevice"

    const-string v1, "init"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-virtual {p0, p1}, Lorg/fmod/AudioDevice;->fetchChannelConfigFromCount(I)I

    move-result v3

    .line 40
    .local v3, "channelConfig":I
    invoke-static {p2, v3, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v8

    .line 41
    .local v8, "minBufferSize":I
    if-gez v8, :cond_0

    .line 42
    const-string v0, "FMod/AudioDevice"

    const-string v1, "Cannot get min buffer size"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    :cond_0
    mul-int v0, p3, p4

    mul-int/2addr v0, p1

    mul-int/lit8 v5, v0, 0x2

    .line 45
    .local v5, "size":I
    if-le v8, v5, :cond_1

    .line 46
    move v5, v8

    .line 48
    :cond_1
    const-string v0, "FMod/AudioDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Buffer size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :try_start_0
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    const/4 v4, 0x2

    const/4 v6, 0x1

    move v2, p2

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v0, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :try_start_1
    iget-object v0, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    move v0, v9

    .line 64
    :goto_0
    return v0

    .line 51
    :catch_0
    move-exception v7

    .line 52
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    const-string v0, "FMod/AudioDevice"

    const-string v1, "Failed to create AudioTrack"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    invoke-virtual {v7}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    move v0, v10

    .line 54
    goto :goto_0

    .line 58
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v7

    .line 59
    .local v7, "e":Ljava/lang/IllegalStateException;
    const-string v0, "FMod/AudioDevice"

    const-string v1, "Failed to play track"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    invoke-virtual {v7}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 61
    invoke-virtual {p0}, Lorg/fmod/AudioDevice;->close()V

    move v0, v10

    .line 62
    goto :goto_0
.end method

.method public write([BI)V
    .locals 2
    .param p1, "data"    # [B
    .param p2, "count"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lorg/fmod/AudioDevice;->mTrack:Landroid/media/AudioTrack;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2}, Landroid/media/AudioTrack;->write([BII)I

    .line 69
    return-void
.end method
