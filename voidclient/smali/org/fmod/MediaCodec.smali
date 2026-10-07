.class public Lorg/fmod/MediaCodec;
.super Ljava/lang/Object;
.source "MediaCodec.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field private mChannelCount:I

.field private mCodecPtr:J

.field private mCurrentOutputBufferIndex:I

.field private mDataSourceProxy:Ljava/lang/Object;

.field private mDecoder:Landroid/media/MediaCodec;

.field private mExtractor:Landroid/media/MediaExtractor;

.field private mInputBuffers:[Ljava/nio/ByteBuffer;

.field private mInputFinished:Z

.field private mLength:J

.field private mOutputBuffers:[Ljava/nio/ByteBuffer;

.field private mOutputFinished:Z

.field private mSampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-wide v2, p0, Lorg/fmod/MediaCodec;->mCodecPtr:J

    .line 17
    iput-wide v2, p0, Lorg/fmod/MediaCodec;->mLength:J

    .line 18
    iput v1, p0, Lorg/fmod/MediaCodec;->mSampleRate:I

    .line 19
    iput v1, p0, Lorg/fmod/MediaCodec;->mChannelCount:I

    .line 20
    iput-boolean v1, p0, Lorg/fmod/MediaCodec;->mInputFinished:Z

    .line 21
    iput-boolean v1, p0, Lorg/fmod/MediaCodec;->mOutputFinished:Z

    .line 22
    iput-object v0, p0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    .line 23
    iput-object v0, p0, Lorg/fmod/MediaCodec;->mDataSourceProxy:Ljava/lang/Object;

    .line 24
    iput-object v0, p0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    .line 25
    iput-object v0, p0, Lorg/fmod/MediaCodec;->mInputBuffers:[Ljava/nio/ByteBuffer;

    .line 26
    iput-object v0, p0, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    return-void
.end method

.method private convertTimeToOffset(J)J
    .locals 5
    .param p1, "time"    # J

    .prologue
    .line 56
    iget v0, p0, Lorg/fmod/MediaCodec;->mSampleRate:I

    int-to-long v0, v0

    mul-long/2addr v0, p1

    const-wide/32 v2, 0xf423f

    add-long/2addr v0, v2

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public static native fmodGetSize(J)I
.end method

.method public static native fmodReadAt(JJ[BI)I
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 112
    const-string v0, "FMod/MediaCodec"

    const-string v1, "close"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-ge v0, v1, :cond_1

    .line 125
    :cond_0
    :goto_0
    return-void

    .line 116
    :cond_1
    iget-object v0, p0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_2

    .line 117
    iget-object v0, p0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 118
    iget-object v0, p0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 119
    iput-object v2, p0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    .line 121
    :cond_2
    iget-object v0, p0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 123
    iput-object v2, p0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    goto :goto_0
.end method

.method public getChannelCount()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lorg/fmod/MediaCodec;->mChannelCount:I

    return v0
.end method

.method public getLength()J
    .locals 2

    .prologue
    .line 30
    iget-wide v0, p0, Lorg/fmod/MediaCodec;->mLength:J

    return-wide v0
.end method

.method public getSampleRate()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lorg/fmod/MediaCodec;->mSampleRate:I

    return v0
.end method

.method public init(J)Z
    .locals 23
    .param p1, "codecPtr"    # J

    .prologue
    .line 60
    const-string v17, "FMod/MediaCodec"

    const-string v18, "init"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    sget v17, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v18, 0x11

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_0

    .line 62
    const/16 v17, 0x0

    .line 108
    :goto_0
    return v17

    .line 64
    :cond_0
    move-wide/from16 v0, p1

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/fmod/MediaCodec;->mCodecPtr:J

    .line 65
    new-instance v17, Landroid/media/MediaExtractor;

    invoke-direct/range {v17 .. v17}, Landroid/media/MediaExtractor;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    .line 68
    :try_start_0
    const-string v17, "android.media.DataSource"

    invoke-static/range {v17 .. v17}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 69
    .local v4, "dataSource":Ljava/lang/Class;
    const-string v17, "android.media.MediaExtractor"

    invoke-static/range {v17 .. v17}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    .line 70
    .local v12, "mediaExtractor":Ljava/lang/Class;
    const-string v17, "setDataSource"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v4, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v14

    .line 71
    .local v14, "setDataSource":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v17

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v4, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/fmod/MediaCodec;->mDataSourceProxy:Ljava/lang/Object;

    .line 72
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mDataSourceProxy:Ljava/lang/Object;

    move-object/from16 v20, v0

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v4    # "dataSource":Ljava/lang/Class;
    .end local v12    # "mediaExtractor":Ljava/lang/Class;
    .end local v14    # "setDataSource":Ljava/lang/reflect/Method;
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v16

    .line 79
    .local v16, "trackCount":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_2
    move/from16 v0, v16

    if-ge v11, v0, :cond_4

    .line 80
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v10

    .line 81
    .local v10, "format":Landroid/media/MediaFormat;
    const-string v17, "mime"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 82
    .local v13, "mimeType":Ljava/lang/String;
    const-string v17, "FMod/MediaCodec"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Track "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ": mime="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const-string v17, "audio/mp4a-latm"

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 85
    :try_start_1
    invoke-static {v13}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 87
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v10, v1, v2, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 88
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/media/MediaCodec;->start()V

    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/fmod/MediaCodec;->mInputBuffers:[Ljava/nio/ByteBuffer;

    .line 91
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 93
    const-string v17, "encoder-delay"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_1

    const-string v17, "encoder-delay"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v8

    .line 94
    .local v8, "encoderDelay":I
    :goto_3
    const-string v17, "encoder-padding"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_2

    const-string v17, "encoder-padding"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v9

    .line 95
    .local v9, "encoderPadding":I
    :goto_4
    const-string v17, "durationUs"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 96
    .local v6, "duration":J
    const-string v17, "channel-count"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/fmod/MediaCodec;->mChannelCount:I

    .line 97
    const-string v17, "sample-rate"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/fmod/MediaCodec;->mSampleRate:I

    .line 98
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7}, Lorg/fmod/MediaCodec;->convertTimeToOffset(J)J

    move-result-wide v18

    int-to-long v0, v8

    move-wide/from16 v20, v0

    sub-long v18, v18, v20

    int-to-long v0, v9

    move-wide/from16 v20, v0

    sub-long v18, v18, v20

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/fmod/MediaCodec;->mLength:J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 73
    .end local v6    # "duration":J
    .end local v8    # "encoderDelay":I
    .end local v9    # "encoderPadding":I
    .end local v10    # "format":Landroid/media/MediaFormat;
    .end local v11    # "i":I
    .end local v13    # "mimeType":Ljava/lang/String;
    .end local v16    # "trackCount":I
    :catch_0
    move-exception v15

    .line 74
    .local v15, "t":Ljava/lang/Throwable;
    const-string v17, "FMod/MediaCodec"

    const-string v18, "Failed to set MediaExtractor\'s DataSource"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    invoke-virtual {v15}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_1

    .line 93
    .end local v15    # "t":Ljava/lang/Throwable;
    .restart local v10    # "format":Landroid/media/MediaFormat;
    .restart local v11    # "i":I
    .restart local v13    # "mimeType":Ljava/lang/String;
    .restart local v16    # "trackCount":I
    :cond_1
    const/4 v8, 0x0

    goto :goto_3

    .line 94
    .restart local v8    # "encoderDelay":I
    :cond_2
    const/4 v9, 0x0

    goto :goto_4

    .line 101
    .end local v8    # "encoderDelay":I
    :catch_1
    move-exception v5

    .line 102
    .local v5, "e":Ljava/io/IOException;
    const-string v17, "FMod/MediaCodec"

    const-string v18, "Failed to create decoder"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    .line 104
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 79
    .end local v5    # "e":Ljava/io/IOException;
    :cond_3
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_2

    .line 108
    .end local v10    # "format":Landroid/media/MediaFormat;
    .end local v13    # "mimeType":Ljava/lang/String;
    :cond_4
    const/16 v17, 0x0

    goto/16 :goto_0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "readAt"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    iget-wide v0, p0, Lorg/fmod/MediaCodec;->mCodecPtr:J

    const/4 v2, 0x0

    aget-object v2, p3, v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/4 v4, 0x1

    aget-object v4, p3, v4

    check-cast v4, [B

    check-cast v4, [B

    const/4 v5, 0x2

    aget-object v5, p3, v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static/range {v0 .. v5}, Lorg/fmod/MediaCodec;->fmodReadAt(JJ[BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 52
    :cond_0
    :goto_0
    return-object v0

    .line 45
    :cond_1
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getSize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 46
    iget-wide v0, p0, Lorg/fmod/MediaCodec;->mCodecPtr:J

    invoke-static {v0, v1}, Lorg/fmod/MediaCodec;->fmodGetSize(J)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 48
    :cond_2
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "close"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 51
    const-string v1, "FMod/MediaCodec"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown invoke method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public read([BI)I
    .locals 17
    .param p1, "data"    # [B
    .param p2, "count"    # I

    .prologue
    .line 128
    const-string v2, "FMod/MediaCodec"

    const-string v4, "read"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-ge v2, v4, :cond_1

    .line 130
    const/16 v16, -0x1

    .line 180
    :cond_0
    :goto_0
    return v16

    .line 132
    :cond_1
    const/16 v16, 0x0

    .line 133
    .local v16, "retVal":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/fmod/MediaCodec;->mInputFinished:Z

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/fmod/MediaCodec;->mOutputFinished:Z

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    const/4 v4, -0x1

    if-eq v2, v4, :cond_2

    .line 134
    const/16 v16, -0x1

    .line 135
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/fmod/MediaCodec;->mInputFinished:Z

    if-nez v2, :cond_3

    .line 136
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    const-wide/16 v6, 0x0

    invoke-virtual {v2, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v3

    .line 137
    .local v3, "bufId":I
    const/4 v2, -0x1

    if-ne v3, v2, :cond_6

    .line 148
    .end local v3    # "bufId":I
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/fmod/MediaCodec;->mOutputFinished:Z

    if-nez v2, :cond_4

    move-object/from16 v0, p0

    iget v2, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_4

    .line 149
    new-instance v13, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v13}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 150
    .local v13, "bufferInfo":Landroid/media/MediaCodec$BufferInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    const-wide/16 v6, 0x2710

    invoke-virtual {v2, v13, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v15

    .line 151
    .local v15, "ret":I
    if-ltz v15, :cond_8

    .line 152
    move-object/from16 v0, p0

    iput v15, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    .line 153
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v2, v2, v15

    iget v4, v13, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 154
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v2, v2, v15

    iget v4, v13, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 164
    :goto_2
    iget v2, v13, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_4

    .line 165
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lorg/fmod/MediaCodec;->mOutputFinished:Z

    .line 168
    .end local v13    # "bufferInfo":Landroid/media/MediaCodec$BufferInfo;
    .end local v15    # "ret":I
    :cond_4
    move-object/from16 v0, p0

    iget v2, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    .line 169
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    iget v4, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    aget-object v14, v2, v4

    .line 171
    .local v14, "outBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    move/from16 v0, p2

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 172
    const/4 v2, 0x0

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v14, v0, v2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 173
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_5

    .line 174
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 175
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v4, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    const/4 v6, 0x0

    invoke-virtual {v2, v4, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 176
    const/4 v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    :cond_5
    move/from16 v16, p2

    .line 178
    goto/16 :goto_0

    .line 139
    .end local v14    # "outBuffer":Ljava/nio/ByteBuffer;
    .restart local v3    # "bufId":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/fmod/MediaCodec;->mInputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v4, v4, v3

    const/4 v6, 0x0

    invoke-virtual {v2, v4, v6}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v5

    .line 140
    .local v5, "size":I
    if-ltz v5, :cond_7

    .line 141
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v6}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v6

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 142
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2}, Landroid/media/MediaExtractor;->advance()Z

    goto/16 :goto_1

    .line 144
    :cond_7
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    move v7, v3

    invoke-virtual/range {v6 .. v12}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 145
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lorg/fmod/MediaCodec;->mInputFinished:Z

    goto/16 :goto_1

    .line 155
    .end local v3    # "bufId":I
    .end local v5    # "size":I
    .restart local v13    # "bufferInfo":Landroid/media/MediaCodec$BufferInfo;
    .restart local v15    # "ret":I
    :cond_8
    const/4 v2, -0x3

    if-ne v15, v2, :cond_9

    .line 156
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/fmod/MediaCodec;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    goto/16 :goto_2

    .line 157
    :cond_9
    const/4 v2, -0x2

    if-ne v15, v2, :cond_a

    .line 158
    const-string v2, "FMod/MediaCodec"

    const-string v4, "dequeueOutputBuffer: Output format changed"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 159
    :cond_a
    const/4 v2, -0x1

    if-ne v15, v2, :cond_b

    .line 160
    const-string v2, "FMod/MediaCodec"

    const-string v4, "dequeueOutputBuffer: Try again later"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 162
    :cond_b
    const-string v2, "FMod/MediaCodec"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dequeueOutputBuffer: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2
.end method

.method public seek(I)V
    .locals 11
    .param p1, "i"    # I

    .prologue
    const/4 v6, -0x1

    const/4 v10, 0x0

    .line 184
    const-string v4, "FMod/MediaCodec"

    const-string v5, "seek"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    iget v4, p0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    if-eq v4, v6, :cond_0

    .line 186
    iget-object v4, p0, Lorg/fmod/MediaCodec;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    iget v5, p0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    aget-object v4, v4, v5

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 187
    iput v6, p0, Lorg/fmod/MediaCodec;->mCurrentOutputBufferIndex:I

    .line 189
    :cond_0
    iput-boolean v10, p0, Lorg/fmod/MediaCodec;->mInputFinished:Z

    .line 190
    iput-boolean v10, p0, Lorg/fmod/MediaCodec;->mOutputFinished:Z

    .line 192
    iget-object v4, p0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    int-to-long v6, p1

    const-wide/32 v8, 0xf4240

    mul-long/2addr v6, v8

    iget v5, p0, Lorg/fmod/MediaCodec;->mSampleRate:I

    int-to-long v8, v5

    div-long/2addr v6, v8

    invoke-virtual {v4, v6, v7, v10}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 194
    iget-object v4, p0, Lorg/fmod/MediaCodec;->mExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lorg/fmod/MediaCodec;->convertTimeToOffset(J)J

    move-result-wide v2

    .line 195
    .local v2, "off":J
    int-to-long v4, p1

    sub-long/2addr v4, v2

    iget v6, p0, Lorg/fmod/MediaCodec;->mChannelCount:I

    int-to-long v6, v6

    mul-long/2addr v4, v6

    const-wide/16 v6, 0x2

    mul-long/2addr v4, v6

    long-to-int v1, v4

    .line 196
    .local v1, "j":I
    if-gez v1, :cond_2

    .line 197
    const-string v4, "FMod/MediaCodec"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Position after seek to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    :cond_1
    return-void

    .line 200
    :cond_2
    const/16 v4, 0x800

    new-array v0, v4, [B

    .line 201
    .local v0, "data":[B
    :goto_0
    if-lez v1, :cond_1

    .line 202
    array-length v4, v0

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {p0, v0, v4}, Lorg/fmod/MediaCodec;->read([BI)I

    move-result v4

    sub-int/2addr v1, v4

    goto :goto_0
.end method
