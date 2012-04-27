.class public Lcom/android/updater/BaseFragment;
.super Landroid/app/Fragment;
.source "BaseFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/updater/BaseFragment$MD5CheckerTask;
    }
.end annotation


# static fields
.field private static COMMAND_FILE:Ljava/io/File;

.field public static final MANUALLY_APPLY_UPDATE:Z

.field private static RECOVERY_DIR:Ljava/io/File;


# instance fields
.field protected final MODE_STOPPED_ERROR:I

.field protected final MODE_STOPPED_FINISHED:I

.field protected mActivity:Landroid/app/Activity;

.field protected final mApplyNowListener:Landroid/view/View$OnClickListener;

.field private mBackupAlertDialog:Landroid/app/AlertDialog;

.field protected mDownloadUpdateManager:Lcom/android/updater/tasks/DownloadUpdateManager;

.field private mMD5CheckResult:Z

.field private mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

.field protected mMode:I

.field protected mPreferences:Lcom/android/updater/utils/Preferences;

.field protected mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

.field protected mUpdateFile:Landroid/net/Uri;

.field protected mUpdateFolder:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 41
    const-string v0, "leo"

    sget-object v1, Lmiui/os/Build;->BOARD:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "htcleo"

    sget-object v1, Lmiui/os/Build;->BOARD:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/android/updater/BaseFragment;->MANUALLY_APPLY_UPDATE:Z

    .line 46
    new-instance v0, Ljava/io/File;

    const-string v1, "/cache/recovery"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/updater/BaseFragment;->RECOVERY_DIR:Ljava/io/File;

    .line 48
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/updater/BaseFragment;->RECOVERY_DIR:Ljava/io/File;

    const-string v2, "command"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/android/updater/BaseFragment;->COMMAND_FILE:Ljava/io/File;

    return-void

    .line 41
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/updater/BaseFragment;->MODE_STOPPED_FINISHED:I

    .line 80
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/updater/BaseFragment;->MODE_STOPPED_ERROR:I

    .line 235
    new-instance v0, Lcom/android/updater/BaseFragment$3;

    invoke-direct {v0, p0}, Lcom/android/updater/BaseFragment$3;-><init>(Lcom/android/updater/BaseFragment;)V

    iput-object v0, p0, Lcom/android/updater/BaseFragment;->mApplyNowListener:Landroid/view/View$OnClickListener;

    .line 397
    return-void
.end method

.method static synthetic access$000(Lcom/android/updater/BaseFragment;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/android/updater/BaseFragment;->mBackupAlertDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/updater/BaseFragment;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    iput-object p1, p0, Lcom/android/updater/BaseFragment;->mBackupAlertDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/updater/BaseFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/android/updater/BaseFragment;->mMD5CheckResult:Z

    return v0
.end method

.method static synthetic access$102(Lcom/android/updater/BaseFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckResult:Z

    return p1
.end method

.method static synthetic access$202(Lcom/android/updater/BaseFragment;Lcom/android/updater/BaseFragment$MD5CheckerTask;)Lcom/android/updater/BaseFragment$MD5CheckerTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    iput-object p1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

    return-object p1
.end method


# virtual methods
.method protected Downloadfinish(I)V
    .locals 6
    .parameter "mode"

    .prologue
    const/4 v5, 0x1

    .line 354
    const/4 v1, 0x1

    .line 355
    .local v1, toDownloadMode:Z
    packed-switch p1, :pswitch_data_0

    .line 369
    const/4 v1, 0x0

    .line 373
    :goto_0
    if-eqz v1, :cond_0

    .line 374
    invoke-virtual {p0, v5}, Lcom/android/updater/BaseFragment;->updateMode(I)V

    .line 376
    :cond_0
    return-void

    .line 357
    :pswitch_0
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    invoke-static {v2}, Lcom/android/updater/utils/SysUtils;->checkExistingRomFile(Lcom/android/updater/customTypes/UpdateInfo;)Ljava/io/File;

    move-result-object v0

    .line 358
    .local v0, downloadedRom:Ljava/io/File;
    if-nez v0, :cond_1

    .line 359
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    const v3, 0x7f05002a

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 361
    :cond_1
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    invoke-virtual {v2}, Lcom/android/updater/customTypes/UpdateInfo;->getChecksum()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/android/updater/BaseFragment;->validateRomFile(Ljava/io/File;Ljava/lang/String;)V

    .line 362
    const/4 v1, 0x0

    .line 364
    goto :goto_0

    .line 366
    .end local v0           #downloadedRom:Ljava/io/File;
    :pswitch_1
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    const v3, 0x7f05003e

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 355
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected applyUpdate()V
    .locals 5

    .prologue
    const v2, 0x7f05004a

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 216
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 217
    .local v0, applyRomdialog:Landroid/app/ProgressDialog;
    invoke-virtual {p0, v2}, Lcom/android/updater/BaseFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 218
    invoke-virtual {p0, v2}, Lcom/android/updater/BaseFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 219
    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 220
    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 221
    new-instance v1, Lcom/android/updater/tasks/ApplyRomTask;

    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v0, v2}, Lcom/android/updater/tasks/ApplyRomTask;-><init>(Landroid/app/ProgressDialog;Landroid/content/Context;)V

    new-array v2, v3, [Ljava/lang/String;

    iget-object v3, p0, Lcom/android/updater/BaseFragment;->mUpdateFile:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/android/updater/tasks/ApplyRomTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 222
    return-void
.end method

.method protected applyUpdate(Landroid/net/Uri;)V
    .locals 3
    .parameter "romPath"

    .prologue
    .line 198
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    invoke-static {v1, v2}, Lcom/android/updater/utils/StringUtils;->getModName(Landroid/content/Context;Lcom/android/updater/customTypes/UpdateInfo;)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, updateRomName:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    invoke-static {v1}, Lcom/android/updater/ApplyUpdateFragment;->setUpdateInfo(Lcom/android/updater/customTypes/UpdateInfo;)V

    .line 200
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/updater/BaseFragment;->applyUpdate(Landroid/net/Uri;Ljava/lang/String;Z)V

    .line 201
    return-void
.end method

.method protected applyUpdate(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1
    .parameter "romPath"
    .parameter "romName"

    .prologue
    .line 204
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/updater/BaseFragment;->applyUpdate(Landroid/net/Uri;Ljava/lang/String;Z)V

    .line 205
    return-void
.end method

.method protected applyUpdate(Landroid/net/Uri;Ljava/lang/String;Z)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 208
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    const-class v2, Lcom/android/updater/ApplyUpdateActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 209
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 210
    const-string v1, "update_info"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 211
    const-string v1, "ota_update"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 212
    invoke-virtual {p0, v0}, Lcom/android/updater/BaseFragment;->startActivity(Landroid/content/Intent;)V

    .line 213
    return-void
.end method

.method protected doDownloadUpdate(Lcom/android/updater/customTypes/UpdateInfo;)V
    .locals 3
    .parameter "ui"

    .prologue
    .line 347
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/updater/BaseFragment;->updateMode(I)V

    .line 348
    iget-object v0, p0, Lcom/android/updater/BaseFragment;->mDownloadUpdateManager:Lcom/android/updater/tasks/DownloadUpdateManager;

    invoke-virtual {v0, p1}, Lcom/android/updater/tasks/DownloadUpdateManager;->download(Lcom/android/updater/customTypes/UpdateInfo;)V

    .line 349
    iget-object v0, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    const v1, 0x7f050019

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 351
    return-void
.end method

.method protected downloadRequestedUpdate(Lcom/android/updater/customTypes/UpdateInfo;)V
    .locals 3
    .parameter "ui"

    .prologue
    .line 320
    if-nez p1, :cond_1

    .line 344
    :cond_0
    :goto_0
    return-void

    .line 323
    :cond_1
    iget-object v0, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/updater/utils/SysUtils;->isConnectivityActive(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/updater/utils/SysUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 327
    invoke-virtual {p0, p1}, Lcom/android/updater/BaseFragment;->doDownloadUpdate(Lcom/android/updater/customTypes/UpdateInfo;)V

    goto :goto_0

    .line 330
    :cond_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f050047

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f050048

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f050020

    new-instance v2, Lcom/android/updater/BaseFragment$4;

    invoke-direct {v2, p0, p1}, Lcom/android/updater/BaseFragment$4;-><init>(Lcom/android/updater/BaseFragment;Lcom/android/updater/customTypes/UpdateInfo;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f050021

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method protected needDownload()Z
    .locals 3

    .prologue
    .line 225
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    invoke-virtual {v2}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, filename:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mUpdateFolder:Ljava/io/File;

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 227
    .local v0, downloadedRom:Ljava/io/File;
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lcom/android/updater/BaseFragment;->mUpdateFile:Landroid/net/Uri;

    .line 228
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 229
    const/4 v2, 0x0

    .line 231
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .parameter "item"

    .prologue
    const/4 v5, 0x0

    const v4, 0x104000a

    const/high16 v3, 0x104

    const/4 v0, 0x1

    .line 125
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 153
    invoke-super {p0, p1}, Landroid/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 127
    :pswitch_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f050049

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/android/updater/BaseFragment$1;

    invoke-direct {v2, p0}, Lcom/android/updater/BaseFragment$1;-><init>(Lcom/android/updater/BaseFragment;)V

    invoke-virtual {v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 140
    :pswitch_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f050006

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/android/updater/BaseFragment$2;

    invoke-direct {v2, p0}, Lcom/android/updater/BaseFragment$2;-><init>(Lcom/android/updater/BaseFragment;)V

    invoke-virtual {v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 125
    nop

    :pswitch_data_0
    .packed-switch 0x7f08001c
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    const/4 v7, -0x1

    .line 89
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 90
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/android/updater/BaseFragment;->setHasOptionsMenu(Z)V

    .line 91
    invoke-virtual {p0}, Lcom/android/updater/BaseFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iput-object v4, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    .line 92
    iget-object v4, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    const v5, 0x7f020017

    invoke-virtual {v4, v5}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 93
    new-instance v4, Lcom/android/updater/utils/Preferences;

    iget-object v5, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v4, v5}, Lcom/android/updater/utils/Preferences;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/updater/BaseFragment;->mPreferences:Lcom/android/updater/utils/Preferences;

    .line 94
    new-instance v4, Lcom/android/updater/tasks/DownloadUpdateManager;

    iget-object v5, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    iget-object v6, p0, Lcom/android/updater/BaseFragment;->mPreferences:Lcom/android/updater/utils/Preferences;

    invoke-direct {v4, v5, v6}, Lcom/android/updater/tasks/DownloadUpdateManager;-><init>(Landroid/content/Context;Lcom/android/updater/utils/Preferences;)V

    iput-object v4, p0, Lcom/android/updater/BaseFragment;->mDownloadUpdateManager:Lcom/android/updater/tasks/DownloadUpdateManager;

    .line 96
    invoke-static {}, Lcom/android/updater/utils/SysUtils;->getRomDir()Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lcom/android/updater/BaseFragment;->mUpdateFolder:Ljava/io/File;

    .line 97
    iget-object v4, p0, Lcom/android/updater/BaseFragment;->mUpdateFolder:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 98
    iget-object v4, p0, Lcom/android/updater/BaseFragment;->mUpdateFolder:Ljava/io/File;

    const/16 v5, 0x1ff

    invoke-static {v4, v5, v7, v7}, Lmiui/os/ExtraFileUtils;->mkdirs(Ljava/io/File;III)Z

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    iget-object v4, p0, Lcom/android/updater/BaseFragment;->mPreferences:Lcom/android/updater/utils/Preferences;

    invoke-virtual {v4}, Lcom/android/updater/utils/Preferences;->getLastClearTrashTime()J

    move-result-wide v2

    .line 103
    .local v2, lastClearTrashTime:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 104
    .local v0, currentTime:J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_2

    sub-long v4, v0, v2

    const-wide v6, 0x9a7ec800L

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 105
    :cond_2
    iget-object v4, p0, Lcom/android/updater/BaseFragment;->mUpdateFolder:Ljava/io/File;

    invoke-static {v4}, Lcom/android/updater/utils/SysUtils;->deleteTrashFiles(Ljava/io/File;)V

    .line 106
    iget-object v4, p0, Lcom/android/updater/BaseFragment;->mPreferences:Lcom/android/updater/utils/Preferences;

    invoke-virtual {v4, v0, v1}, Lcom/android/updater/utils/Preferences;->setLastClearTrashTime(J)V

    goto :goto_0
.end method

.method protected rebootRecovery()V
    .locals 5

    .prologue
    .line 159
    :try_start_0
    sget-object v3, Lcom/android/updater/BaseFragment;->RECOVERY_DIR:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 160
    sget-object v3, Lcom/android/updater/BaseFragment;->COMMAND_FILE:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 162
    new-instance v0, Ljava/io/FileWriter;

    sget-object v3, Lcom/android/updater/BaseFragment;->COMMAND_FILE:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .local v0, command:Ljava/io/FileWriter;
    :try_start_1
    const-string v3, "recovery"

    invoke-virtual {v0, v3}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 167
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 172
    .end local v0           #command:Ljava/io/FileWriter;
    :goto_0
    iget-object v3, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    const-string v4, "power"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    .line 173
    .local v2, pm:Landroid/os/PowerManager;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    .line 174
    return-void

    .line 167
    .end local v2           #pm:Landroid/os/PowerManager;
    .restart local v0       #command:Ljava/io/FileWriter;
    :catchall_0
    move-exception v3

    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V

    throw v3
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 169
    .end local v0           #command:Ljava/io/FileWriter;
    :catch_0
    move-exception v1

    .line 170
    .local v1, ex:Ljava/io/IOException;
    const-string v3, "BaseFragment"

    const-string v4, "file operation failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected setVersionInfo(Lcom/android/updater/customTypes/UpdateInfo;)V
    .locals 0
    .parameter "updateInfo"

    .prologue
    .line 310
    iput-object p1, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    .line 311
    return-void
.end method

.method protected showDownloading()Z
    .locals 5

    .prologue
    .line 112
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mThisInfo:Lcom/android/updater/customTypes/UpdateInfo;

    .line 113
    .local v1, updateInfo:Lcom/android/updater/customTypes/UpdateInfo;
    if-nez v1, :cond_0

    .line 114
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mPreferences:Lcom/android/updater/utils/Preferences;

    invoke-virtual {v2}, Lcom/android/updater/utils/Preferences;->getLastUpdateInfo()Lcom/android/updater/customTypes/UpdateInfo;

    move-result-object v1

    .line 116
    :cond_0
    if-nez v1, :cond_1

    .line 117
    const/4 v2, 0x0

    .line 120
    :goto_0
    return v2

    .line 119
    :cond_1
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/android/updater/BaseFragment;->mUpdateFolder:Ljava/io/File;

    invoke-virtual {v1}, Lcom/android/updater/customTypes/UpdateInfo;->getFileName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, destFilePath:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/updater/BaseFragment;->mDownloadUpdateManager:Lcom/android/updater/tasks/DownloadUpdateManager;

    invoke-virtual {v2, v0}, Lcom/android/updater/tasks/DownloadUpdateManager;->isDownloading(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0
.end method

.method protected switchSystem()V
    .locals 3

    .prologue
    .line 177
    invoke-static {}, Lcom/android/updater/DualSystem;->switchSystem()V

    .line 178
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 179
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    .line 180
    return-void
.end method

.method protected updateMode(I)V
    .locals 0
    .parameter "mode"

    .prologue
    .line 306
    iput p1, p0, Lcom/android/updater/BaseFragment;->mMode:I

    .line 307
    return-void
.end method

.method protected validateRomFile(Ljava/io/File;Ljava/lang/String;)V
    .locals 4
    .parameter "updateFile"
    .parameter "checksum"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 380
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 381
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 382
    .local v0, dialog:Landroid/app/ProgressDialog;
    const v1, 0x7f050027

    invoke-virtual {p0, v1}, Lcom/android/updater/BaseFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 383
    const v1, 0x7f050028

    invoke-virtual {p0, v1}, Lcom/android/updater/BaseFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 384
    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 387
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

    if-eqz v1, :cond_0

    .line 388
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

    invoke-virtual {v1, v2}, Lcom/android/updater/BaseFragment$MD5CheckerTask;->cancel(Z)Z

    .line 389
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

    .line 392
    :cond_0
    new-instance v1, Lcom/android/updater/BaseFragment$MD5CheckerTask;

    invoke-direct {v1, p0, v0, p2}, Lcom/android/updater/BaseFragment$MD5CheckerTask;-><init>(Lcom/android/updater/BaseFragment;Landroid/app/ProgressDialog;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

    .line 393
    iget-object v1, p0, Lcom/android/updater/BaseFragment;->mMD5CheckerTask:Lcom/android/updater/BaseFragment$MD5CheckerTask;

    new-array v2, v2, [Ljava/io/File;

    aput-object p1, v2, v3

    invoke-virtual {v1, v2}, Lcom/android/updater/BaseFragment$MD5CheckerTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 395
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :cond_1
    return-void
.end method
