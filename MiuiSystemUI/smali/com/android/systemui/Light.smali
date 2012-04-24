.class public Lcom/android/systemui/Light;
.super Ljava/lang/Object;
.source "Light.java"


# static fields
.field public static final FLASH_ENABLE:Ljava/lang/String;

.field public static final FLASH_MODE:Ljava/lang/String;

.field private static mLight:Z

.field private static mWriter:Ljava/io/FileWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 10
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/systemui/Light;->mLight:Z

    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    .line 14
    new-instance v0, Ljava/lang/String;

    const-string v1, "/sys/class/flashled/strobe/enable"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/systemui/Light;->FLASH_ENABLE:Ljava/lang/String;

    .line 16
    new-instance v0, Ljava/lang/String;

    const-string v1, "/sys/class/flashled/strobe/mode"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/systemui/Light;->FLASH_MODE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    sget-object v2, Lcom/android/systemui/Light;->FLASH_ENABLE:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    .line 23
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    const-string v2, "1"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;II)V

    .line 24
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 25
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-void

    .line 26
    :catch_0
    move-exception v0

    .line 27
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static close()V
    .locals 5

    .prologue
    .line 33
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    sget-object v2, Lcom/android/systemui/Light;->FLASH_MODE:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    .line 34
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 35
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 36
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V

    .line 38
    new-instance v1, Ljava/io/FileWriter;

    sget-object v2, Lcom/android/systemui/Light;->FLASH_ENABLE:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    .line 39
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    const-string v2, "0"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;II)V

    .line 40
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 41
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .local v0, e:Ljava/lang/Exception;
    :goto_0
    return-void

    .line 43
    .end local v0           #e:Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 44
    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static open()V
    .locals 5

    .prologue
    .line 50
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    sget-object v2, Lcom/android/systemui/Light;->FLASH_MODE:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    .line 51
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 52
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 53
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V

    .line 55
    new-instance v1, Ljava/io/FileWriter;

    sget-object v2, Lcom/android/systemui/Light;->FLASH_ENABLE:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    .line 56
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    const-string v2, "1"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;II)V

    .line 57
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 58
    sget-object v1, Lcom/android/systemui/Light;->mWriter:Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .local v0, e:Ljava/lang/Exception;
    :goto_0
    return-void

    .line 59
    .end local v0           #e:Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 60
    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
