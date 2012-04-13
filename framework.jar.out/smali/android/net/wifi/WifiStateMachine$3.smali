.class Landroid/net/wifi/WifiStateMachine$3;
.super Ljava/lang/Object;
.source "WifiStateMachine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/net/wifi/WifiStateMachine;->startSoftApWithConfig(Landroid/net/wifi/WifiConfiguration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/net/wifi/WifiStateMachine;

.field final synthetic val$config:Landroid/net/wifi/WifiConfiguration;


# direct methods
.method constructor <init>(Landroid/net/wifi/WifiStateMachine;Landroid/net/wifi/WifiConfiguration;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1769
    iput-object p1, p0, Landroid/net/wifi/WifiStateMachine$3;->this$0:Landroid/net/wifi/WifiStateMachine;

    iput-object p2, p0, Landroid/net/wifi/WifiStateMachine$3;->val$config:Landroid/net/wifi/WifiConfiguration;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1772
    :try_start_0
    iget-object v1, p0, Landroid/net/wifi/WifiStateMachine$3;->this$0:Landroid/net/wifi/WifiStateMachine;

    #getter for: Landroid/net/wifi/WifiStateMachine;->mNwService:Landroid/os/INetworkManagementService;
    invoke-static {v1}, Landroid/net/wifi/WifiStateMachine;->access$100(Landroid/net/wifi/WifiStateMachine;)Landroid/os/INetworkManagementService;

    move-result-object v1

    iget-object v2, p0, Landroid/net/wifi/WifiStateMachine$3;->val$config:Landroid/net/wifi/WifiConfiguration;

    iget-object v3, p0, Landroid/net/wifi/WifiStateMachine$3;->this$0:Landroid/net/wifi/WifiStateMachine;

    #getter for: Landroid/net/wifi/WifiStateMachine;->mInterfaceName:Ljava/lang/String;
    invoke-static {v3}, Landroid/net/wifi/WifiStateMachine;->access$000(Landroid/net/wifi/WifiStateMachine;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "wl0.1"

    invoke-interface {v1, v2, v3, v4}, Landroid/os/INetworkManagementService;->startAccessPoint(Landroid/net/wifi/WifiConfiguration;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1785
    :goto_0
    iget-object v1, p0, Landroid/net/wifi/WifiStateMachine$3;->this$0:Landroid/net/wifi/WifiStateMachine;

    const v2, 0x20016

    invoke-virtual {v1, v2}, Landroid/net/wifi/WifiStateMachine;->sendMessage(I)V

    .line 1786
    return-void

    .line 1773
    :catch_0
    move-exception v0

    .line 1774
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Landroid/net/wifi/WifiStateMachine$3;->this$0:Landroid/net/wifi/WifiStateMachine;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception in softap start "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/net/wifi/WifiStateMachine;->loge(Ljava/lang/String;)V
    invoke-static {v1, v2}, Landroid/net/wifi/WifiStateMachine;->access$200(Landroid/net/wifi/WifiStateMachine;Ljava/lang/String;)V

    goto :goto_0
.end method
