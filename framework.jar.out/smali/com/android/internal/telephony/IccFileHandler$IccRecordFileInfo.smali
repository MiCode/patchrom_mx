.class Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;
.super Ljava/lang/Object;
.source "IccFileHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/IccFileHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IccRecordFileInfo"
.end annotation


# static fields
.field public static final ICC_FCP_TEMP_FLAG:B = 0x62t

.field public static final ICC_FILE_DESC_FLAG:B = -0x7et

.field public static final ICC_FILE_SIZE_FLAG:B = -0x80t

.field public static final ICC_REC_COUNT_BIT:I = 0x2

.field public static final ICC_REC_SIZE_BIT:I = 0x1


# instance fields
.field protected mData:[B

.field protected mRecordCount:I

.field protected mRecordSize:I

.field protected mRecordType:I

.field protected mValidInfoBmp:I

.field final synthetic this$0:Lcom/android/internal/telephony/IccFileHandler;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/IccFileHandler;[B)V
    .locals 1
    .parameter
    .parameter "data"

    .prologue
    const/4 v0, 0x0

    .line 301
    iput-object p1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->this$0:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 294
    iput v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    .line 295
    iput v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    .line 296
    iput v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    .line 302
    iput v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    .line 303
    iput-object p2, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    .line 304
    return-void
.end method

.method private parseUsimRecordFileDescriptionInfo(I)I
    .locals 8
    .parameter "curOffset"

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x0

    const/4 v3, -0x1

    .line 361
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    array-length v0, v4

    .line 362
    .local v0, bufTotLen:I
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v5, p1, 0x1

    aget-byte v2, v4, v5

    .line 363
    .local v2, len:I
    const/4 v1, 0x0

    .line 364
    .local v1, fileDesByte:I
    if-eq v2, v7, :cond_1

    const/4 v4, 0x2

    if-eq v2, v4, :cond_1

    .line 387
    :cond_0
    :goto_0
    return v3

    .line 367
    :cond_1
    add-int v4, p1, v2

    if-gt v4, v0, :cond_0

    .line 371
    iget-object v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v4, p1, 0x2

    aget-byte v1, v3, v4

    .line 372
    xor-int/lit8 v3, v1, 0x1

    and-int/lit8 v3, v3, 0x7

    if-nez v3, :cond_3

    .line 373
    iput v6, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordType:I

    .line 382
    :goto_1
    if-ne v2, v7, :cond_2

    .line 383
    iget-object v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v4, p1, 0x5

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    iput v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    .line 384
    iget-object v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v4, p1, 0x6

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    iput v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    .line 386
    :cond_2
    iget v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    or-int/lit8 v3, v3, 0x3

    iput v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    .line 387
    iget-object v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v4, p1, 0x1

    aget-byte v3, v3, v4

    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    .line 374
    :cond_3
    xor-int/lit8 v3, v1, 0x2

    and-int/lit8 v3, v3, 0x7

    if-nez v3, :cond_4

    .line 375
    const/4 v3, 0x1

    iput v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordType:I

    goto :goto_1

    .line 376
    :cond_4
    xor-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x7

    if-nez v3, :cond_5

    .line 377
    const/4 v3, 0x3

    iput v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordType:I

    goto :goto_1

    .line 379
    :cond_5
    iput v6, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordType:I

    goto :goto_1
.end method

.method private parseUsimRecordFileInfo()I
    .locals 6

    .prologue
    const/4 v3, -0x1

    .line 418
    const/4 v1, 0x0

    .line 419
    .local v1, curOffset:I
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    array-length v0, v4

    .line 421
    .local v0, bufTotLen:I
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    const/4 v5, 0x0

    aget-byte v4, v4, v5

    const/16 v5, 0x62

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    const/4 v5, 0x1

    aget-byte v4, v4, v5

    add-int/lit8 v4, v4, 0x2

    if-eq v4, v0, :cond_2

    :cond_0
    move v0, v3

    .line 449
    .end local v0           #bufTotLen:I
    :cond_1
    :goto_0
    return v0

    .line 425
    .restart local v0       #bufTotLen:I
    :cond_2
    add-int/lit8 v1, v1, 0x2

    .line 427
    :goto_1
    sub-int v4, v0, v1

    const/4 v5, 0x2

    if-lt v4, v5, :cond_4

    .line 428
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    aget-byte v4, v4, v1

    packed-switch v4, :pswitch_data_0

    .line 436
    :pswitch_0
    invoke-direct {p0, v1}, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->parseUsimRecrodFileUnknownField(I)I

    move-result v2

    .line 440
    .local v2, eatBufLen:I
    :goto_2
    if-gez v2, :cond_3

    move v0, v3

    .line 441
    goto :goto_0

    .line 430
    .end local v2           #eatBufLen:I
    :pswitch_1
    invoke-direct {p0, v1}, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->parseUsimRecordFileDescriptionInfo(I)I

    move-result v2

    .line 431
    .restart local v2       #eatBufLen:I
    goto :goto_2

    .line 433
    .end local v2           #eatBufLen:I
    :pswitch_2
    invoke-direct {p0, v1}, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->parseUsimRecordFileSizeInfo(I)I

    move-result v2

    .line 434
    .restart local v2       #eatBufLen:I
    goto :goto_2

    .line 443
    :cond_3
    add-int/2addr v1, v2

    goto :goto_1

    .line 446
    .end local v2           #eatBufLen:I
    :cond_4
    if-eq v0, v1, :cond_1

    move v0, v3

    .line 449
    goto :goto_0

    .line 428
    nop

    :pswitch_data_0
    .packed-switch -0x80
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private parseUsimRecordFileSizeInfo(I)I
    .locals 7
    .parameter "curOffset"

    .prologue
    .line 391
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    array-length v1, v4

    .line 392
    .local v1, bufTotLen:I
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v5, p1, 0x1

    aget-byte v2, v4, v5

    .line 393
    .local v2, len:I
    const/4 v3, 0x0

    .local v3, pos:I
    const/4 v0, 0x0

    .line 394
    .local v0, allocSize:I
    add-int v4, p1, v2

    if-le v4, v1, :cond_0

    .line 395
    const/4 v4, -0x1

    .line 405
    :goto_0
    return v4

    .line 398
    :cond_0
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_1

    .line 399
    shl-int/lit8 v4, v0, 0x8

    iget-object v5, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v6, p1, 0x2

    add-int/2addr v6, v3

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    add-int v0, v4, v5

    .line 398
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 401
    :cond_1
    iget v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordType:I

    if-nez v4, :cond_2

    .line 402
    iput v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    .line 405
    :cond_2
    iget-object v4, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v5, p1, 0x1

    aget-byte v4, v4, v5

    add-int/lit8 v4, v4, 0x2

    goto :goto_0
.end method

.method private parseUsimRecrodFileUnknownField(I)I
    .locals 4
    .parameter "curOffset"

    .prologue
    .line 409
    iget-object v2, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    array-length v0, v2

    .line 410
    .local v0, bufTotLen:I
    iget-object v2, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v1, v2, v3

    .line 411
    .local v1, len:I
    add-int v2, p1, v1

    if-le v2, v0, :cond_0

    .line 412
    const/4 v2, -0x1

    .line 414
    :goto_0
    return v2

    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v2, v2, v3

    add-int/lit8 v2, v2, 0x2

    goto :goto_0
.end method


# virtual methods
.method public getRecrodCount()I
    .locals 1

    .prologue
    .line 313
    iget v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    return v0
.end method

.method public getRecrodSize()I
    .locals 1

    .prologue
    .line 310
    iget v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    return v0
.end method

.method public getValidInfoBmp()I
    .locals 1

    .prologue
    .line 307
    iget v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    return v0
.end method

.method public parseEFFileByCardType(I)V
    .locals 5
    .parameter "efType"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/IccException;,
            Lcom/android/internal/telephony/IccFileTypeMismatch;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v1, 0x0

    .line 318
    iput v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    .line 319
    iput v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    .line 320
    iput v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    .line 322
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->this$0:Lcom/android/internal/telephony/IccFileHandler;

    iget-object v1, v1, Lcom/android/internal/telephony/IccFileHandler;->phone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/IccCardApplication$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/IccCardApplication$AppType;

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/IccCard;->isApplicationOnIcc(Lcom/android/internal/telephony/IccCardApplication$AppType;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 323
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->this$0:Lcom/android/internal/telephony/IccFileHandler;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "parse USIM record info, mData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 324
    invoke-direct {p0}, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->parseUsimRecordFileInfo()I

    move-result v1

    if-gez v1, :cond_0

    .line 325
    new-instance v1, Lcom/android/internal/telephony/IccException;

    const-string v2, "Parse USIM record Info exception"

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/IccException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 328
    :cond_0
    iget v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    and-int/lit8 v1, v1, 0x3

    if-eq v1, v4, :cond_1

    .line 331
    new-instance v1, Lcom/android/internal/telephony/IccException;

    const-string v2, "No valid size and count found in record"

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/IccException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 333
    :cond_1
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->this$0:Lcom/android/internal/telephony/IccFileHandler;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "parse USIM record info, size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 358
    :goto_0
    return-void

    .line 335
    :cond_2
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->this$0:Lcom/android/internal/telephony/IccFileHandler;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "parse SIM record info, mData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 336
    const/4 v1, 0x4

    iget-object v2, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    const/4 v3, 0x6

    aget-byte v2, v2, v3

    if-eq v1, v2, :cond_3

    .line 337
    new-instance v1, Lcom/android/internal/telephony/IccFileTypeMismatch;

    const-string/jumbo v2, "parseEFFileByCardType 1"

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/IccFileTypeMismatch;-><init>(Ljava/lang/String;)V

    throw v1

    .line 340
    :cond_3
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    const/16 v2, 0xd

    aget-byte v1, v1, v2

    if-eq p1, v1, :cond_4

    .line 341
    new-instance v1, Lcom/android/internal/telephony/IccFileTypeMismatch;

    const-string/jumbo v2, "parseEFFileByCardType 2"

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/IccFileTypeMismatch;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :cond_4
    iget v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    or-int/lit8 v1, v1, 0x3

    iput v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mValidInfoBmp:I

    .line 346
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    const/4 v2, 0x2

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    aget-byte v2, v2, v4

    and-int/lit16 v2, v2, 0xff

    add-int v0, v1, v2

    .line 350
    .local v0, size:I
    if-eq p1, v4, :cond_5

    const/4 v1, 0x1

    if-ne p1, v1, :cond_6

    .line 351
    :cond_5
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mData:[B

    const/16 v2, 0xe

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    iput v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    .line 352
    iget v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    div-int v1, v0, v1

    iput v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    .line 356
    :goto_1
    iget-object v1, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->this$0:Lcom/android/internal/telephony/IccFileHandler;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "parse SIM record info, size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 354
    :cond_6
    iput v0, p0, Lcom/android/internal/telephony/IccFileHandler$IccRecordFileInfo;->mRecordSize:I

    goto :goto_1
.end method
