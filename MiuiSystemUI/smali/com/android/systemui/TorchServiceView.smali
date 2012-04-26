.class public Lcom/android/systemui/TorchServiceView;
.super Landroid/widget/FrameLayout;
.source "TorchServiceView.java"


# static fields
.field public static final FLASH_DEVICES:[Ljava/lang/String;


# instance fields
.field private mCamera:Landroid/hardware/Camera;

.field private mCameraWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mDelayOpen:Ljava/lang/Runnable;

.field private mFlashDevice:Ljava/lang/String;

.field private mFlashMode:I

.field private mParams:Landroid/hardware/Camera$Parameters;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mSurfaceView:Landroid/view/SurfaceView;

.field private mValueOn:I

.field private mWriter:Ljava/io/FileWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 25
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "/sys/class/leds/flashlight/brightness"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/sys/class/leds/spotlight/brightness"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/systemui/TorchServiceView;->FLASH_DEVICES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/TorchServiceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;

    .line 182
    new-instance v0, Lcom/android/systemui/TorchServiceView$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/TorchServiceView$1;-><init>(Lcom/android/systemui/TorchServiceView;)V

    iput-object v0, p0, Lcom/android/systemui/TorchServiceView;->mDelayOpen:Ljava/lang/Runnable;

    .line 189
    new-instance v0, Lcom/android/systemui/TorchServiceView$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/TorchServiceView$2;-><init>(Lcom/android/systemui/TorchServiceView;)V

    iput-object v0, p0, Lcom/android/systemui/TorchServiceView;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 51
    invoke-direct {p0}, Lcom/android/systemui/TorchServiceView;->fetchFlashDeviceConfig()V

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/TorchServiceView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/android/systemui/TorchServiceView;->setFlashMode(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/systemui/TorchServiceView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 24
    iget v0, p0, Lcom/android/systemui/TorchServiceView;->mFlashMode:I

    return v0
.end method

.method private enableMxLed()V
    .locals 6

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 92
    .local v1, lWriter:Ljava/io/FileWriter;
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    const-string v3, "/sys/class/flashled/strobe/enable"

    invoke-direct {v2, v3}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .end local v1           #lWriter:Ljava/io/FileWriter;
    .local v2, lWriter:Ljava/io/FileWriter;
    :try_start_1
    const-string v3, "1"

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/FileWriter;->write(Ljava/lang/String;II)V

    .line 94
    invoke-virtual {v2}, Ljava/io/FileWriter;->flush()V

    .line 95
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 100
    .end local v2           #lWriter:Ljava/io/FileWriter;
    .restart local v1       #lWriter:Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, e:Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 96
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #lWriter:Ljava/io/FileWriter;
    .restart local v2       #lWriter:Ljava/io/FileWriter;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2           #lWriter:Ljava/io/FileWriter;
    .restart local v1       #lWriter:Ljava/io/FileWriter;
    goto :goto_1
.end method

.method private fetchFlashDeviceConfig()V
    .locals 5

    .prologue
    .line 55
    iget-object v3, p0, Lcom/android/systemui/TorchServiceView;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 56
    .local v2, resources:Landroid/content/res/Resources;
    const v3, 0x7f0b0001

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lcom/android/systemui/TorchServiceView;->mValueOn:I

    .line 58
    const v3, 0x7f0a0002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/TorchServiceView;->mFlashDevice:Ljava/lang/String;

    .line 59
    const/4 v0, 0x0

    .line 60
    .local v0, i:I
    :goto_0
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/android/systemui/TorchServiceView;->mFlashDevice:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 61
    sget-object v3, Lcom/android/systemui/TorchServiceView;->FLASH_DEVICES:[Ljava/lang/String;

    array-length v3, v3

    if-ne v0, v3, :cond_1

    .line 62
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/systemui/TorchServiceView;->mFlashDevice:Ljava/lang/String;

    .line 67
    :cond_0
    return-void

    .line 65
    :cond_1
    sget-object v3, Lcom/android/systemui/TorchServiceView;->FLASH_DEVICES:[Ljava/lang/String;

    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .local v1, i:I
    aget-object v3, v3, v0

    iput-object v3, p0, Lcom/android/systemui/TorchServiceView;->mFlashDevice:Ljava/lang/String;

    move v0, v1

    .end local v1           #i:I
    .restart local v0       #i:I
    goto :goto_0
.end method

.method private declared-synchronized setFlashMode(I)V
    .locals 10
    .parameter "mode"

    .prologue
    const/4 v6, 0x0

    const/4 v9, 0x1

    .line 103
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mFlashDevice:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 104
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    if-nez v6, :cond_0

    .line 105
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v6

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    .line 107
    :cond_0
    if-nez p1, :cond_4

    .line 108
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mDelayOpen:Ljava/lang/Runnable;

    invoke-virtual {p0, v6}, Lcom/android/systemui/TorchServiceView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 110
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v6

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    .line 111
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    const-string v7, "off"

    invoke-virtual {v6, v7}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 112
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v6, v7}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 113
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->stopPreview()V

    .line 114
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->release()V

    .line 115
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    .line 116
    invoke-virtual {p0}, Lcom/android/systemui/TorchServiceView;->invalidate()V

    .line 118
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCameraWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v6, :cond_1

    .line 119
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCameraWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 122
    :cond_1
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    if-eqz v6, :cond_2

    .line 123
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {p0, v6}, Lcom/android/systemui/TorchServiceView;->removeView(Landroid/view/View;)V

    .line 124
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    .line 126
    :cond_2
    const/16 v6, 0x8

    invoke-virtual {p0, v6}, Lcom/android/systemui/TorchServiceView;->setVisibility(I)V

    .line 172
    :cond_3
    :goto_0
    iput p1, p0, Lcom/android/systemui/TorchServiceView;->mFlashMode:I

    .line 173
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "torch_state"

    invoke-static {v6, v7, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :goto_1
    monitor-exit p0

    return-void

    .line 128
    :cond_4
    :try_start_1
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    if-nez v6, :cond_5

    .line 129
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/android/systemui/TorchServiceView;->setVisibility(I)V

    .line 131
    new-instance v6, Landroid/view/SurfaceView;

    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    .line 132
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    const/4 v7, 0x1

    const/4 v8, 0x1

    invoke-virtual {p0, v6, v7, v8}, Lcom/android/systemui/TorchServiceView;->addView(Landroid/view/View;II)V

    .line 133
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mDelayOpen:Ljava/lang/Runnable;

    invoke-virtual {p0, v6}, Lcom/android/systemui/TorchServiceView;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, e:Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 103
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 137
    :cond_5
    :try_start_3
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v6

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    .line 138
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    const-string v7, "torch"

    invoke-virtual {v6, v7}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 141
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v6}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v4

    .line 142
    .local v4, previewSizes:Ljava/util/List;,"Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/Camera$Size;

    .line 143
    .local v2, minSize:Landroid/hardware/Camera$Size;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_6
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/Camera$Size;

    .line 144
    .local v5, size:Landroid/hardware/Camera$Size;
    iget v6, v5, Landroid/hardware/Camera$Size;->height:I

    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    mul-int/2addr v6, v7

    iget v7, v2, Landroid/hardware/Camera$Size;->height:I

    iget v8, v2, Landroid/hardware/Camera$Size;->width:I

    mul-int/2addr v7, v8

    if-ge v6, v7, :cond_6

    .line 145
    move-object v2, v5

    goto :goto_2

    .line 148
    .end local v5           #size:Landroid/hardware/Camera$Size;
    :cond_7
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    iget v7, v2, Landroid/hardware/Camera$Size;->width:I

    iget v8, v2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v6, v7, v8}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 150
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mParams:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v6, v7}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 151
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v7}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 152
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->startPreview()V

    .line 154
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mContext:Landroid/content/Context;

    const-string v7, "power"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 155
    .local v3, pm:Landroid/os/PowerManager;
    const/4 v6, 0x1

    const-string v7, "TorchServiceView"

    invoke-virtual {v3, v6, v7}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCameraWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 156
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mCameraWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->acquire()V

    goto/16 :goto_0

    .line 159
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #minSize:Landroid/hardware/Camera$Size;
    .end local v3           #pm:Landroid/os/PowerManager;
    .end local v4           #previewSizes:Ljava/util/List;,"Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    :cond_8
    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;

    if-nez v7, :cond_9

    .line 160
    new-instance v7, Ljava/io/FileWriter;

    iget-object v8, p0, Lcom/android/systemui/TorchServiceView;->mFlashDevice:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;

    .line 163
    :cond_9
    invoke-direct {p0}, Lcom/android/systemui/TorchServiceView;->enableMxLed()V

    .line 164
    iget-object v7, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;

    if-ne p1, v9, :cond_a

    iget v6, p0, Lcom/android/systemui/TorchServiceView;->mValueOn:I

    :cond_a
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 165
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v6}, Ljava/io/FileWriter;->flush()V

    .line 166
    if-nez p1, :cond_3

    .line 167
    iget-object v6, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v6}, Ljava/io/FileWriter;->close()V

    .line 168
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/systemui/TorchServiceView;->mWriter:Ljava/io/FileWriter;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 3

    .prologue
    .line 71
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 73
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/systemui/TorchServiceView;->setFlashMode(I)V

    .line 74
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "miui.intent.action.TOGGLE_TORCH"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, filter:Landroid/content/IntentFilter;
    const/16 v1, -0x3e8

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 76
    iget-object v1, p0, Lcom/android/systemui/TorchServiceView;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/TorchServiceView;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 77
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/TorchServiceView;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/systemui/TorchServiceView;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/systemui/TorchServiceView;->setFlashMode(I)V

    .line 84
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 85
    return-void
.end method
