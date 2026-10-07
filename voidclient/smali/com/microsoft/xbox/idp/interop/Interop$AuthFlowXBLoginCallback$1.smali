.class Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$1;
.super Ljava/lang/Object;
.source "Interop.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;->onLogin(JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;


# direct methods
.method constructor <init>(Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;)V
    .locals 0
    .param p1, "this$0"    # Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 272
    iget-object v0, p0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback$1;->this$0:Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;

    iget-wide v0, v0, Lcom/microsoft/xbox/idp/interop/Interop$AuthFlowXBLoginCallback;->myUserPtr:J

    const/4 v2, 0x0

    const-string v3, "t=EwAIA+pvBAAUKods63Ys1fGlwiccIFJ+qE1hANsAASuI2uyrLOUnPIEGYIggSeFi4RSHvFNtH1g39d7cwpb0lBDTU3m7eEEx/tr3H4E+IAN0Q2/Pyyv2amXN3aWlTgxGjSvD3D0AFmWywIZEz97hQXBGcPk5kudIBNZDYUpjZ8WLAPhwOKltX1VVnHda6so5JBH7VTE3b3R+ddJROZdIrw8RjMM0scn5EUTxO30KHe3a7fjAhF+Za3n+t+Hn/Qs9AVSU9fqTf3FA0IE4IUqUDnRVTcuHUVdy8ylcm3Nz81oNmzF+9kC6eAyrGD8QWHhu9XJ8UfipZZDp+WbPZRB9cuk7j+tQWIfOz8vkWf/9r6lS7o3ykPLLdA+Sc8cXIHsDZgAACDZ6SR6xkuGP2AHOw28PNa86PLRftw1IfHyf50BMiSWw3Gn1Mm0kIKkiDEqgijfaSgUWl9y9/KKU445k9d4VA1nxgxmq1s4+47R3K0lmD9XKC70Rm3PS6DSdgPI2srOLUZibL1CrBQ7JOKYTpkegKZofu2mFsUg203EVDPAMkZdt5QR6vtPz4gsw61BWh08kqtleNybfIUo9qI2IzyWd8lVpk2lzrYuv6Q+l/65ncm0Kpdvoy9Q7IMJ750EbbPIfaLeM7O29qI1oBYdEaE1BEt9yQ5rPowzlyoyuDChD4n8XSSpN1UShLlL0qLQSluHFPMrJ4Ug9o6PdBwElnSONQe7dhcBGKz5c5sRROcKMHd01XmAiII7w7T72gjLNDRvByaxwMVxtyG555Hm9zOxsHmPGHxmSEgOkmlFDP8lReTTd0gG1KPeSClRYTS7/QY9ceD8f6RbkHC5j8QqyPpKiKInr6crOO0R9VLepE/xxy1j/kIPEL8j7doZgl8nMGLTji8EcOy6c3GXyVbFUhGx62h2Ywl38zI12DoMHNVly39Bk+qL7fznu23caVlz90atddSLmnquVtryARk3uzLGdzpwb77oYsjanEY1yeNGGDUJ2Mjkwx1uF3YUyBLuBgVX1nxcbEQI=&p="

    invoke-static {v0, v1, v2, v3}, Lcom/microsoft/xbox/idp/interop/Interop;->auth_flow_callback(JILjava/lang/String;)V

    .line 273
    return-void
.end method
