.class public Lio/mrarm/msa/Network;
.super Ljava/lang/Object;
.source "Network.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static decodeBase64(Ljava/lang/String;)[B
    .locals 1
    .param p0, "d"    # Ljava/lang/String;

    .prologue
    .line 266
    const/4 v0, 0x2

    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method private static doDeviceAddRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "membername"    # Ljava/lang/String;
    .param p1, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<?xml version=\"1.0\" encoding=\"UTF-8\"?><DeviceAddRequest><ClientInfo name=\"MSAAndroidApp\" version=\"1.0\"/><Authentication><Membername>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Lio/mrarm/msa/Network;->xmlEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</Membername><Password>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lio/mrarm/msa/Network;->xmlEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</Password></Authentication></DeviceAddRequest>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "auth":Ljava/lang/String;
    const-string v2, "https://login.live.com/ppsecure/deviceaddcredential.srf"

    invoke-static {v2, v0}, Lio/mrarm/msa/Network;->send(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "reply":Ljava/lang/String;
    const-string v2, "<success>"

    const-string v3, "</success>"

    invoke-static {v1, v2, v3}, Lio/mrarm/msa/Network;->getStringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "true"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 58
    const-string v2, "<puid>"

    const-string v3, "</puid>"

    invoke-static {v1, v2, v3}, Lio/mrarm/msa/Network;->getStringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 60
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static doDeviceAuth(Ljava/lang/String;Ljava/lang/String;)Lio/mrarm/msa/LegacyToken;
    .locals 7
    .param p0, "uname"    # Ljava/lang/String;
    .param p1, "pwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v4, "<?xml version=\"1.0\" encoding=\"UTF-8\"?><s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:ps=\"http://schemas.microsoft.com/Passport/SoapServices/PPCRL\" xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\" xmlns:saml=\"urn:oasis:names:tc:SAML:1.0:assertion\" xmlns:wsp=\"http://schemas.xmlsoap.org/ws/2004/09/policy\" xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\" xmlns:wsa=\"http://www.w3.org/2005/08/addressing\" xmlns:wssc=\"http://schemas.xmlsoap.org/ws/2005/02/sc\" xmlns:wst=\"http://schemas.xmlsoap.org/ws/2005/02/trust\"><s:Header><wsa:Action s:mustUnderstand=\"1\">http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue</wsa:Action><wsa:To s:mustUnderstand=\"1\">https://login.live.com/RST2.srf</wsa:To><wsa:MessageID>\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    const-string v4, "</wsa:MessageID><ps:AuthInfo xmlns:ps=\"http://schemas.microsoft.com/Passport/SoapServices/PPCRL\" Id=\"PPAuthInfo\"><ps:BinaryVersion>11</ps:BinaryVersion><ps:DeviceType>Android</ps:DeviceType><ps:HostingApp>{F501FD64-9070-46AB-993C-6F7B71D8D883}</ps:HostingApp></ps:AuthInfo><wsse:Security><wsse:UsernameToken wsu:Id=\"devicesoftware\"><wsse:Username>\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-static {p0}, Lio/mrarm/msa/Network;->xmlEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    const-string v4, "</wsse:Username><wsse:Password>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    invoke-static {p1}, Lio/mrarm/msa/Network;->xmlEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    const-string v4, "</wsse:Password></wsse:UsernameToken>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-static {}, Lio/mrarm/msa/Network;->getTimestamp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    const-string v4, "</wsse:Security></s:Header><s:Body><wst:RequestSecurityToken xmlns:wst=\"http://schemas.xmlsoap.org/ws/2005/02/trust\" Id=\"RST0\"><wst:RequestType>http://schemas.xmlsoap.org/ws/2005/02/trust/Issue</wst:RequestType><wsp:AppliesTo xmlns:wsp=\"http://schemas.xmlsoap.org/ws/2004/09/policy\"><wsa:EndpointReference xmlns:wsa=\"http://www.w3.org/2005/08/addressing\"><wsa:Address>http://Passport.NET/tb</wsa:Address></wsa:EndpointReference></wsp:AppliesTo></wst:RequestSecurityToken></s:Body></s:Envelope>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v4, "https://login.live.com/RST2.srf"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lio/mrarm/msa/Network;->send(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "resp":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v4

    new-instance v5, Lorg/xml/sax/InputSource;

    new-instance v6, Ljava/io/StringReader;

    invoke-direct {v6, v2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v4, v5}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 79
    .local v1, "doc":Lorg/w3c/dom/Document;
    const-string v4, "wst:RequestSecurityTokenResponse"

    invoke-interface {v1, v4}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-static {v4}, Lio/mrarm/msa/LegacyToken;->fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/LegacyToken;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 81
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    :goto_0
    return-object v4

    .line 80
    :catch_0
    move-exception v3

    .line 81
    .local v3, "t":Ljava/lang/Throwable;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private static doSTS(Lio/mrarm/msa/UserAccount;Lio/mrarm/msa/LegacyToken;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;
    .locals 36
    .param p0, "account"    # Lio/mrarm/msa/UserAccount;
    .param p1, "devToken"    # Lio/mrarm/msa/LegacyToken;
    .param p2, "securityScopes"    # [Lio/mrarm/msa/SecurityScope;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v19, Ljava/security/SecureRandom;

    invoke-direct/range {v19 .. v19}, Ljava/security/SecureRandom;-><init>()V

    .line 92
    .local v19, "random":Ljava/security/SecureRandom;
    new-instance v26, Ljava/util/Date;

    invoke-direct/range {v26 .. v26}, Ljava/util/Date;-><init>()V

    .line 94
    .local v26, "serverTime":Ljava/util/Date;
    const/16 v31, 0x20

    move/from16 v0, v31

    new-array v0, v0, [B

    move-object/from16 v30, v0

    .line 95
    .local v30, "xmlNonce":[B
    move-object/from16 v0, v19

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 97
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .local v8, "builder":Ljava/lang/StringBuilder;
    const-string v31, "<?xml version=\"1.0\" encoding=\"UTF-8\"?><s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:ps=\"http://schemas.microsoft.com/Passport/SoapServices/PPCRL\" xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\" xmlns:saml=\"urn:oasis:names:tc:SAML:1.0:assertion\" xmlns:wsp=\"http://schemas.xmlsoap.org/ws/2004/09/policy\" xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\" xmlns:wsa=\"http://www.w3.org/2005/08/addressing\" xmlns:wssc=\"http://schemas.xmlsoap.org/ws/2005/02/sc\" xmlns:wst=\"http://schemas.xmlsoap.org/ws/2005/02/trust\"><s:Header><wsa:Action s:mustUnderstand=\"1\">http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue</wsa:Action><wsa:To s:mustUnderstand=\"1\">https://login.live.com/RST2.srf</wsa:To>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    const-string v31, "<wsa:MessageID>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    const-string v31, "</wsa:MessageID>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const-string v4, "<ps:AuthInfo xmlns:ps=\"http://schemas.microsoft.com/Passport/SoapServices/PPCRL\" Id=\"PPAuthInfo\"><ps:BinaryVersion>11</ps:BinaryVersion><ps:DeviceType>Android</ps:DeviceType><ps:HostingApp>{F501FD64-9070-46AB-993C-6F7B71D8D883}</ps:HostingApp><ps:InlineUX>Android</ps:InlineUX><ps:ConsentFlags>1</ps:ConsentFlags><ps:IsConnected>1</ps:IsConnected><ps:ClientAppURI>android-app://com.mojang.minecraftpe.H62DKCBHJP6WXXIV7RBFOGOL4NAK4E6Y</ps:ClientAppURI></ps:AuthInfo>"

    .line 107
    .local v4, "authInfo":Ljava/lang/String;
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    const-string v31, "<wsse:Security>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual/range {p0 .. p0}, Lio/mrarm/msa/UserAccount;->getDaToken()Lio/mrarm/msa/LegacyToken;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lio/mrarm/msa/LegacyToken;->getXml()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    const-string v31, "<wsse:BinarySecurityToken ValueType=\"urn:liveid:sha1device\" Id=\"DeviceDAToken\">"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    const/16 v31, 0x20

    move/from16 v0, v31

    new-array v0, v0, [B

    move-object/from16 v20, v0

    .line 116
    .local v20, "randomBytes":[B
    invoke-virtual/range {v19 .. v20}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 117
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "ct="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v26 .. v26}, Ljava/util/Date;->getTime()J

    move-result-wide v32

    const-wide/16 v34, 0x3e8

    div-long v32, v32, v34

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "&hashalg=SHA256&bver=11&appid=%7BF501FD64-9070-46AB-993C-6F7B71D8D883%7D&da="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {p1 .. p1}, Lio/mrarm/msa/LegacyToken;->getXml()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lio/mrarm/msa/Network;->encodeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "&nonce="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-static/range {v20 .. v20}, Lio/mrarm/msa/Network;->encodeBase64([B)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lio/mrarm/msa/Network;->encodeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 119
    .local v5, "binSecTokenVal":Ljava/lang/String;
    :try_start_0
    const-string v31, "HmacSHA256"

    invoke-static/range {v31 .. v31}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v12

    .line 120
    .local v12, "digester":Ljavax/crypto/Mac;
    new-instance v31, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v32, 0x20

    invoke-virtual/range {p1 .. p1}, Lio/mrarm/msa/LegacyToken;->getKey()[B

    move-result-object v33

    const-string v34, "WS-SecureConversation"

    move/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    move-object/from16 v3, v20

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/msa/Network;->generateKey(I[BLjava/lang/String;[B)[B

    move-result-object v32

    const-string v33, "HmacSHA256"

    invoke-direct/range {v31 .. v33}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    move-object/from16 v0, v31

    invoke-virtual {v12, v0}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 121
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "&hash="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "UTF-8"

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v12, v0}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lio/mrarm/msa/Network;->encodeBase64([B)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lio/mrarm/msa/Network;->encodeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 122
    invoke-static {v5}, Lio/mrarm/msa/Network;->xmlEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    const-string v31, "</wsse:BinarySecurityToken>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    const-string v31, "<wssc:DerivedKeyToken wsu:Id=\"SignKey\" Algorithm=\"urn:liveid:SP800-108CTR-HMAC-SHA256\"><wsse:RequestedTokenReference><wsse:KeyIdentifier ValueType=\"http://docs.oasis-open.org/wss/2004/XX/oasis-2004XX-wss-saml-token-profile-1.0#SAMLAssertionID\"/><wsse:Reference URI=\"\"/></wsse:RequestedTokenReference><wssc:Nonce>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    invoke-static/range {v30 .. v30}, Lio/mrarm/msa/Network;->encodeBase64([B)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    const-string v31, "</wssc:Nonce></wssc:DerivedKeyToken>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-static {}, Lio/mrarm/msa/Network;->getTimestamp()Ljava/lang/String;

    move-result-object v29

    .line 135
    .local v29, "timestamp":Ljava/lang/String;
    move-object/from16 v0, v29

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .local v24, "rstsBuilder":Ljava/lang/StringBuilder;
    const-string v31, "<ps:RequestMultipleSecurityTokens xmlns:ps=\"http://schemas.microsoft.com/Passport/SoapServices/PPCRL\" Id=\"RSTS\">"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_0
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v16

    move/from16 v1, v31

    if-ge v0, v1, :cond_1

    .line 142
    const-string v31, "<wst:RequestSecurityToken xmlns:wst=\"http://schemas.xmlsoap.org/ws/2005/02/trust\" Id=\"RST"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    move-object/from16 v0, v24

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    const-string v31, "\"><wst:RequestType>http://schemas.xmlsoap.org/ws/2005/02/trust/Issue</wst:RequestType><wsp:AppliesTo xmlns:wsp=\"http://schemas.xmlsoap.org/ws/2004/09/policy\"><wsa:EndpointReference xmlns:wsa=\"http://www.w3.org/2005/08/addressing\"><wsa:Address>"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    aget-object v31, p2, v16

    invoke-virtual/range {v31 .. v31}, Lio/mrarm/msa/SecurityScope;->getAddress()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    const-string v31, "</wsa:Address></wsa:EndpointReference></wsp:AppliesTo>"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    aget-object v31, p2, v16

    invoke-virtual/range {v31 .. v31}, Lio/mrarm/msa/SecurityScope;->getPolicyReference()Ljava/lang/String;

    move-result-object v31

    if-eqz v31, :cond_0

    .line 148
    const-string v31, "<wsp:PolicyReference xmlns:wsp=\"http://schemas.xmlsoap.org/ws/2004/09/policy\" URI=\""

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    aget-object v31, p2, v16

    invoke-virtual/range {v31 .. v31}, Lio/mrarm/msa/SecurityScope;->getPolicyReference()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    const-string v31, "\"></wsp:PolicyReference>"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    :cond_0
    const-string v31, "</wst:RequestSecurityToken>"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 123
    .end local v12    # "digester":Ljavax/crypto/Mac;
    .end local v16    # "i":I
    .end local v24    # "rstsBuilder":Ljava/lang/StringBuilder;
    .end local v29    # "timestamp":Ljava/lang/String;
    :catch_0
    move-exception v28

    .line 124
    .local v28, "t":Ljava/security/GeneralSecurityException;
    new-instance v31, Ljava/lang/RuntimeException;

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v31

    .line 156
    .end local v28    # "t":Ljava/security/GeneralSecurityException;
    .restart local v12    # "digester":Ljavax/crypto/Mac;
    .restart local v16    # "i":I
    .restart local v24    # "rstsBuilder":Ljava/lang/StringBuilder;
    .restart local v29    # "timestamp":Ljava/lang/String;
    :cond_1
    const-string v31, "</ps:RequestMultipleSecurityTokens>"

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 160
    .local v23, "rsts":Ljava/lang/String;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v27, "signInfo":Ljava/lang/StringBuilder;
    const-string v31, "<SignedInfo xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><CanonicalizationMethod Algorithm=\"http://www.w3.org/2001/10/xml-exc-c14n#\"></CanonicalizationMethod><SignatureMethod Algorithm=\"http://www.w3.org/2001/04/xmldsig-more#hmac-sha256\"></SignatureMethod>"

    move-object/from16 v0, v27

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    :try_start_1
    const-string v31, "SHA-256"

    invoke-static/range {v31 .. v31}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v17

    .line 164
    .local v17, "md":Ljava/security/MessageDigest;
    const-string v31, "PPAuthInfo"

    move-object/from16 v0, v27

    move-object/from16 v1, v17

    move-object/from16 v2, v31

    invoke-static {v0, v1, v2, v4}, Lio/mrarm/msa/Network;->sign(Ljava/lang/StringBuilder;Ljava/security/MessageDigest;Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    const-string v31, "Timestamp"

    move-object/from16 v0, v27

    move-object/from16 v1, v17

    move-object/from16 v2, v31

    move-object/from16 v3, v29

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/msa/Network;->sign(Ljava/lang/StringBuilder;Ljava/security/MessageDigest;Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    const-string v31, "RSTS"

    move-object/from16 v0, v27

    move-object/from16 v1, v17

    move-object/from16 v2, v31

    move-object/from16 v3, v23

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/msa/Network;->sign(Ljava/lang/StringBuilder;Ljava/security/MessageDigest;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 170
    const-string v31, "</SignedInfo>"

    move-object/from16 v0, v27

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const-string v31, "<Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\">"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 173
    const-string v31, "<SignatureValue>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    :try_start_2
    const-string v31, "HmacSHA256"

    invoke-static/range {v31 .. v31}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v12

    .line 176
    new-instance v31, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v32, 0x20

    invoke-virtual/range {p0 .. p0}, Lio/mrarm/msa/UserAccount;->getDaToken()Lio/mrarm/msa/LegacyToken;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Lio/mrarm/msa/LegacyToken;->getKey()[B

    move-result-object v33

    const-string v34, "WS-SecureConversationWS-SecureConversation"

    move/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    move-object/from16 v3, v30

    invoke-static {v0, v1, v2, v3}, Lio/mrarm/msa/Network;->generateKey(I[BLjava/lang/String;[B)[B

    move-result-object v32

    const-string v33, "HmacSHA256"

    invoke-direct/range {v31 .. v33}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    move-object/from16 v0, v31

    invoke-virtual {v12, v0}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 177
    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    const-string v32, "UTF-8"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v12, v0}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lio/mrarm/msa/Network;->encodeBase64([B)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 181
    const-string v31, "</SignatureValue><KeyInfo><wsse:SecurityTokenReference><wsse:Reference URI=\"#SignKey\"/></wsse:SecurityTokenReference></KeyInfo></Signature></wsse:Security></s:Header>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    const-string v31, "<s:Body>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    move-object/from16 v0, v23

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    const-string v31, "</s:Body></s:Envelope>"

    move-object/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    const-string v31, "https://login.live.com/RST2.srf"

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lio/mrarm/msa/Network;->send(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 193
    .local v21, "resp":Ljava/lang/String;
    :try_start_3
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v31

    new-instance v32, Lorg/xml/sax/InputSource;

    new-instance v33, Ljava/io/StringReader;

    move-object/from16 v0, v33

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v32 .. v33}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual/range {v31 .. v32}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v13

    .line 197
    .local v13, "doc":Lorg/w3c/dom/Document;
    const-string v31, "wssc:DerivedKeyToken"

    move-object/from16 v0, v31

    invoke-interface {v13, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v18

    .line 198
    .local v18, "nodeList":Lorg/w3c/dom/NodeList;
    const/4 v15, 0x0

    .line 199
    .local v15, "encKeyNonceB64":Ljava/lang/String;
    const/16 v16, 0x0

    :goto_1
    invoke-interface/range {v18 .. v18}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v31

    move/from16 v0, v16

    move/from16 v1, v31

    if-ge v0, v1, :cond_4

    .line 200
    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v31

    check-cast v31, Lorg/w3c/dom/Element;

    const-string v32, "wsu:Id"

    invoke-interface/range {v31 .. v32}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    const-string v32, "EncKey"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_2

    .line 201
    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v31

    check-cast v31, Lorg/w3c/dom/Element;

    const-string v32, "wssc:Nonce"

    invoke-interface/range {v31 .. v32}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v31

    const/16 v32, 0x0

    invoke-interface/range {v31 .. v32}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v15

    .line 199
    :cond_2
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 167
    .end local v13    # "doc":Lorg/w3c/dom/Document;
    .end local v15    # "encKeyNonceB64":Ljava/lang/String;
    .end local v17    # "md":Ljava/security/MessageDigest;
    .end local v18    # "nodeList":Lorg/w3c/dom/NodeList;
    .end local v21    # "resp":Ljava/lang/String;
    :catch_1
    move-exception v28

    .line 168
    .restart local v28    # "t":Ljava/security/GeneralSecurityException;
    new-instance v31, Ljava/lang/RuntimeException;

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v31

    .line 178
    .end local v28    # "t":Ljava/security/GeneralSecurityException;
    .restart local v17    # "md":Ljava/security/MessageDigest;
    :catch_2
    move-exception v28

    .line 179
    .restart local v28    # "t":Ljava/security/GeneralSecurityException;
    new-instance v31, Ljava/lang/RuntimeException;

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v31

    .line 194
    .end local v28    # "t":Ljava/security/GeneralSecurityException;
    .restart local v21    # "resp":Ljava/lang/String;
    :catch_3
    move-exception v28

    .line 195
    .local v28, "t":Ljava/lang/Throwable;
    const/16 v22, 0x0

    .line 218
    .end local v28    # "t":Ljava/lang/Throwable;
    :cond_3
    :goto_2
    return-object v22

    .line 202
    .restart local v13    # "doc":Lorg/w3c/dom/Document;
    .restart local v15    # "encKeyNonceB64":Ljava/lang/String;
    .restart local v18    # "nodeList":Lorg/w3c/dom/NodeList;
    :cond_4
    if-nez v15, :cond_5

    .line 203
    const/16 v22, 0x0

    goto :goto_2

    .line 204
    :cond_5
    invoke-static {v15}, Lio/mrarm/msa/Network;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v14

    .line 205
    .local v14, "encKeyNonce":[B
    const-string v31, "S:Body"

    move-object/from16 v0, v31

    invoke-interface {v13, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v31

    const/16 v32, 0x0

    invoke-interface/range {v31 .. v32}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    .line 206
    .local v6, "body":Lorg/w3c/dom/Element;
    const-string v31, "CipherValue"

    move-object/from16 v0, v31

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v31

    const/16 v32, 0x0

    invoke-interface/range {v31 .. v32}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v11

    .line 207
    .local v11, "cipherValueB64":Ljava/lang/String;
    invoke-static {v11}, Lio/mrarm/msa/Network;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v10

    .line 209
    .local v10, "cipherValue":[B
    :try_start_4
    const-string v31, "AES/CBC/PKCS5Padding"

    invoke-static/range {v31 .. v31}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v9

    .line 210
    .local v9, "cipher":Ljavax/crypto/Cipher;
    const/16 v31, 0x2

    new-instance v32, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v33, 0x20

    invoke-virtual/range {p0 .. p0}, Lio/mrarm/msa/UserAccount;->getDaToken()Lio/mrarm/msa/LegacyToken;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Lio/mrarm/msa/LegacyToken;->getKey()[B

    move-result-object v34

    const-string v35, "WS-SecureConversationWS-SecureConversation"

    move/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-static {v0, v1, v2, v14}, Lio/mrarm/msa/Network;->generateKey(I[BLjava/lang/String;[B)[B

    move-result-object v33

    const-string v34, "AES"

    invoke-direct/range {v32 .. v34}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v33, Ljavax/crypto/spec/IvParameterSpec;

    const/16 v34, 0x0

    const/16 v35, 0x10

    move-object/from16 v0, v33

    move/from16 v1, v34

    move/from16 v2, v35

    invoke-direct {v0, v10, v1, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([BII)V

    move/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v9, v0, v1, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 211
    new-instance v25, Ljava/lang/String;

    const/16 v31, 0x10

    array-length v0, v10

    move/from16 v32, v0

    add-int/lit8 v32, v32, -0x10

    move/from16 v0, v31

    move/from16 v1, v32

    invoke-virtual {v9, v10, v0, v1}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v31

    const-string v32, "UTF-8"

    move-object/from16 v0, v25

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 212
    .local v25, "s":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v31

    new-instance v32, Lorg/xml/sax/InputSource;

    new-instance v33, Ljava/io/StringReader;

    move-object/from16 v0, v33

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v32 .. v33}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual/range {v31 .. v32}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v7

    .line 213
    .local v7, "bodyCtx":Lorg/w3c/dom/Document;
    invoke-interface {v7}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v18

    .line 214
    invoke-interface/range {v18 .. v18}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v31

    move/from16 v0, v31

    new-array v0, v0, [Lio/mrarm/msa/Token;

    move-object/from16 v22, v0

    .line 215
    .local v22, "ret":[Lio/mrarm/msa/Token;
    const/16 v16, 0x0

    :goto_3
    invoke-interface/range {v18 .. v18}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v31

    move/from16 v0, v16

    move/from16 v1, v31

    if-ge v0, v1, :cond_3

    .line 216
    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v31

    check-cast v31, Lorg/w3c/dom/Element;

    invoke-static/range {v31 .. v31}, Lio/mrarm/msa/Token;->fromRequestSecurityTokenResponse(Lorg/w3c/dom/Element;)Lio/mrarm/msa/Token;

    move-result-object v31

    aput-object v31, v22, v16
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4

    .line 215
    add-int/lit8 v16, v16, 0x1

    goto :goto_3

    .line 219
    .end local v7    # "bodyCtx":Lorg/w3c/dom/Document;
    .end local v9    # "cipher":Ljavax/crypto/Cipher;
    .end local v22    # "ret":[Lio/mrarm/msa/Token;
    .end local v25    # "s":Ljava/lang/String;
    :catch_4
    move-exception v28

    .line 220
    .restart local v28    # "t":Ljava/lang/Throwable;
    new-instance v31, Ljava/lang/RuntimeException;

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v31
.end method

.method protected static encodeBase64([B)Ljava/lang/String;
    .locals 1
    .param p0, "bs"    # [B

    .prologue
    .line 262
    const/4 v0, 0x2

    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static encodeURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 336
    :try_start_0
    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "+"

    const-string v3, "%20"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 338
    :goto_0
    return-object v1

    .line 337
    :catch_0
    move-exception v0

    .line 338
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    goto :goto_0
.end method

.method static generateKey(I[BLjava/lang/String;[B)[B
    .locals 10
    .param p0, "keyLength"    # I
    .param p1, "sessionKey"    # [B
    .param p2, "keyUsage"    # Ljava/lang/String;
    .param p3, "nonce"    # [B

    .prologue
    const/4 v9, 0x0

    .line 308
    :try_start_0
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 309
    .local v4, "key":Ljava/nio/ByteBuffer;
    const/4 v6, 0x4

    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 310
    .local v0, "bb":Ljava/nio/ByteBuffer;
    const-string v6, "HmacSHA256"

    invoke-static {v6}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v2

    .line 311
    .local v2, "digester":Ljavax/crypto/Mac;
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    const-string v7, "HmacSHA256"

    invoke-direct {v6, p1, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v2, v6}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 312
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    if-ge v6, p0, :cond_0

    .line 313
    invoke-virtual {v2}, Ljavax/crypto/Mac;->reset()V

    .line 314
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 315
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 316
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 317
    invoke-virtual {v2, v0}, Ljavax/crypto/Mac;->update(Ljava/nio/ByteBuffer;)V

    .line 318
    const-string v6, "UTF-8"

    invoke-virtual {p2, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v2, v6}, Ljavax/crypto/Mac;->update([B)V

    .line 319
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Ljavax/crypto/Mac;->update(B)V

    .line 320
    invoke-virtual {v2, p3}, Ljavax/crypto/Mac;->update([B)V

    .line 321
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 322
    mul-int/lit8 v6, p0, 0x8

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 323
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 324
    invoke-virtual {v2, v0}, Ljavax/crypto/Mac;->update(Ljava/nio/ByteBuffer;)V

    .line 325
    invoke-virtual {v2}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v1

    .line 326
    .local v1, "digested":[B
    const/4 v6, 0x0

    array-length v7, v1

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {v4, v1, v6, v7}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 312
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 328
    .end local v1    # "digested":[B
    :cond_0
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 330
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v2    # "digester":Ljavax/crypto/Mac;
    .end local v3    # "i":I
    .end local v4    # "key":Ljava/nio/ByteBuffer;
    :goto_1
    return-object v6

    .line 329
    :catch_0
    move-exception v5

    .line 330
    .local v5, "t":Ljava/lang/Throwable;
    new-array v6, v9, [B

    goto :goto_1
.end method

.method protected static getServerTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 280
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method private static getStringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "str1"    # Ljava/lang/String;
    .param p2, "str2"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 270
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 271
    .local v0, "iof":I
    if-ne v0, v2, :cond_0

    .line 272
    const-string v2, ""

    .line 276
    :goto_0
    return-object v2

    .line 273
    :cond_0
    invoke-virtual {p0, p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 274
    .local v1, "iof2":I
    if-ne v1, v2, :cond_1

    .line 275
    const-string v2, ""

    goto :goto_0

    .line 276
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static getTimestamp()Ljava/lang/String;
    .locals 8

    .prologue
    .line 284
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 285
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    const-string v3, "UTC"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 286
    invoke-static {}, Lio/mrarm/msa/Network;->getServerTime()Ljava/util/Date;

    move-result-object v1

    .line 287
    .local v1, "timeCreated":Ljava/util/Date;
    new-instance v2, Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/32 v6, 0x493e0

    add-long/2addr v4, v6

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 288
    .local v2, "timeExpires":Ljava/util/Date;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<wsu:Timestamp xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\" wsu:Id=\"Timestamp\"><wsu:Created>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</wsu:Created><wsu:Expires>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</wsu:Expires></wsu:Timestamp>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static requestTokens(Lio/mrarm/msa/MSA;Lio/mrarm/msa/UserAccount;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;
    .locals 6
    .param p0, "msa"    # Lio/mrarm/msa/MSA;
    .param p1, "account"    # Lio/mrarm/msa/UserAccount;
    .param p2, "scopes"    # [Lio/mrarm/msa/SecurityScope;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p0}, Lio/mrarm/msa/MSA;->getDeviceAuth()Lio/mrarm/msa/DeviceAuth;

    move-result-object v0

    .line 30
    .local v0, "auth":Lio/mrarm/msa/DeviceAuth;
    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getPuid()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    .line 32
    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getMembername()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lio/mrarm/msa/Network;->doDeviceAddRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "devPuid":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 49
    .end local v1    # "devPuid":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v3

    .line 35
    .restart local v1    # "devPuid":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0, v1}, Lio/mrarm/msa/DeviceAuth;->setPuid(Ljava/lang/String;)V

    .line 37
    invoke-virtual {p0}, Lio/mrarm/msa/MSA;->saveDeviceAuth()V

    .line 39
    .end local v1    # "devPuid":Ljava/lang/String;
    :cond_2
    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getToken()Lio/mrarm/msa/LegacyToken;

    move-result-object v4

    if-nez v4, :cond_3

    .line 41
    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getMembername()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lio/mrarm/msa/Network;->doDeviceAuth(Ljava/lang/String;Ljava/lang/String;)Lio/mrarm/msa/LegacyToken;

    move-result-object v2

    .line 42
    .local v2, "token":Lio/mrarm/msa/LegacyToken;
    if-eqz v2, :cond_0

    .line 44
    invoke-virtual {v0, v2}, Lio/mrarm/msa/DeviceAuth;->setToken(Lio/mrarm/msa/LegacyToken;)V

    .line 46
    invoke-virtual {p0}, Lio/mrarm/msa/MSA;->saveDeviceAuth()V

    .line 49
    .end local v2    # "token":Lio/mrarm/msa/LegacyToken;
    :cond_3
    invoke-virtual {v0}, Lio/mrarm/msa/DeviceAuth;->getToken()Lio/mrarm/msa/LegacyToken;

    move-result-object v3

    invoke-static {p1, v3, p2}, Lio/mrarm/msa/Network;->doSTS(Lio/mrarm/msa/UserAccount;Lio/mrarm/msa/LegacyToken;[Lio/mrarm/msa/SecurityScope;)[Lio/mrarm/msa/Token;

    move-result-object v3

    goto :goto_0
.end method

.method private static send(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 227
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    .line 228
    .local v2, "conn":Ljavax/net/ssl/HttpsURLConnection;
    const-string v7, "User-Agent"

    const-string v8, "Dalvik/2.1.0 (Linux; U; Android 6.0.1; ONEPLUS A3003 Build/MMB29M); com.mojang.minecraftpe/0.15.2.1; MsaAndroidSdk/2.1.0504.0524"

    invoke-virtual {v2, v7, v8}, Ljavax/net/ssl/HttpsURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    const-string v7, "Content-type"

    const-string v8, "application/x-www-form-urlencoded"

    invoke-virtual {v2, v7, v8}, Ljavax/net/ssl/HttpsURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    const-string v7, "UTF-8"

    invoke-virtual {p1, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 231
    .local v0, "b":[B
    invoke-virtual {v2, v9}, Ljavax/net/ssl/HttpsURLConnection;->setDoInput(Z)V

    .line 232
    invoke-virtual {v2, v9}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 233
    const-string v7, "POST"

    invoke-virtual {v2, v7}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 234
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljavax/net/ssl/HttpsURLConnection;->setUseCaches(Z)V

    .line 235
    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 236
    .local v4, "ous":Ljava/io/OutputStream;
    invoke-virtual {v4, v0}, Ljava/io/OutputStream;->write([B)V

    .line 237
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 239
    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_0

    .line 240
    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 243
    .local v3, "ins":Ljava/io/InputStream;
    :goto_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 244
    .local v1, "br":Ljava/io/BufferedReader;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    .local v5, "out":Ljava/lang/StringBuilder;
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .local v6, "s":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 247
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    const-string v7, "\n"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 242
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "ins":Ljava/io/InputStream;
    .end local v5    # "out":Ljava/lang/StringBuilder;
    .end local v6    # "s":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    .restart local v3    # "ins":Ljava/io/InputStream;
    goto :goto_0

    .line 250
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "out":Ljava/lang/StringBuilder;
    .restart local v6    # "s":Ljava/lang/String;
    :cond_1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method private static sign(Ljava/lang/StringBuilder;Ljava/security/MessageDigest;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "md"    # Ljava/security/MessageDigest;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "ctx"    # Ljava/lang/String;

    .prologue
    .line 293
    :try_start_0
    const-string v1, "UTF-8"

    invoke-virtual {p3, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    invoke-static {v1}, Lio/mrarm/msa/Network;->encodeBase64([B)Ljava/lang/String;

    move-result-object v0

    .line 294
    .local v0, "str":Ljava/lang/String;
    const-string v1, "<Reference URI=\"#"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    const-string v1, "\"><Transforms><Transform Algorithm=\"http://www.w3.org/2001/10/xml-exc-c14n#\"></Transform></Transforms><DigestMethod Algorithm=\"http://www.w3.org/2001/04/xmlenc#sha256\"></DigestMethod><DigestValue>"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    const-string v1, "</DigestValue></Reference>"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 302
    .end local v0    # "str":Ljava/lang/String;
    :goto_0
    return-void

    .line 299
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static xmlEscape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 254
    const-string v0, "<"

    const-string v1, "&lt;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&"

    const-string v2, "&amp;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static xmlUnescape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 258
    const-string v0, "&lt;"

    const-string v1, "<"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&quot"

    const-string v2, "\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&apos"

    const-string v2, "\'"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&amp;"

    const-string v2, "&"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
