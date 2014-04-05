//
//  CPSystemManager.h
//  icouple
//
//  Created by yong wei on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CPHttpEngineObserver.h"
#import "XMPPUserMessage.h"
#import "XMPPGroupMessage.h"

#ifdef SYS_STATE_MIGR
#import "CPXmppEngine.h"
#import "CPXmppEngineObserver.h"
#endif

#ifdef SYS_STATE_MIGR
enum sysState
{
    SYS_STATE_UNKNOWN,
    SYS_STATE_OFFLINE,
//    SYS_STATE_REG_ACC,              //注册
    SYS_STATE_HTTP_LOGOUT,
    SYS_STATE_HTTP_LOGINING,        //登录中
    SYS_STATE_HTTP_LOGIN_SUC,
//    SYS_STATE_HTTP_LOGIN_TIMEOUT,
//    SYS_STATE_HTTP_LOGIN_FAILED,
    SYS_STATE_HTTP_RE_LOGINING,
//    SYS_STATE_VERIFY_ACC,           //注册过程中验证手机号
    SYS_STATE_XMPP_DISCONNECTED,
    SYS_STATE_XMPP_CONNECTING,
    SYS_STATE_XMPP_CONNECTED,
    SYS_STATE_XMPP_RECONNECTING,
    SYS_STATE_ONLINE,
};

typedef enum sysState SysState;
#endif

typedef enum
{
    REG_RESPONSE_CODE_SUCESS = 0,
    REG_RESPONSE_CODE_SERVER_ERROR = 1,
}RegisterResponseCode;
typedef enum
{
    LOGIN_RESPONSE_CODE_SUCESS = 0,
    LOGIN_RESPONSE_CODE_SERVER_ERROR = 1
}LoginResponseCode;
typedef enum
{
    BIND_RESPONSE_CODE_SUCESS = 0,
    BIND_RESPONSE_CODE_SERVER_ERROR = 1
}BindResponseCode;

typedef enum
{
    ACTIVE_RESPONSE_CODE_SUCESS = 0,
    ACTIVE_RESPONSE_CODE_SERVER_ERROR = 1
}ActiveResponseCode;

@class CPUIModelRegisterInfo;
@interface CPSystemManager : NSObject<CPHttpEngineObserver
#ifdef SYS_STATE_MIGR
                                    , CPXmppEngineObserver
#endif
                                     >
{
    __strong CPUIModelRegisterInfo *cachedRegInfo;
    
//    SysState state;
}

@property(strong,atomic)NSString * uniqueDeviceIdentifier;
#ifdef SYS_STATE_MIGR
- (void)XmppEngineStatusChanged:(NSInteger)status;
- (void)handleReLoginResult:(NSNumber *)resultCode withObject:(NSObject*)resutlObject andToken:(NSString *)token;

- (void)activeSystem;
#endif
-(void)clearRegInfoData;

-(void)registerWithRegInfo:(CPUIModelRegisterInfo *)regInfo;
-(void)loginWithName:(NSString *)loginName password:(NSString *)pwd;
-(void)activeAccountWithCode:(NSString *)code;
-(void)bindMobileNumber:(NSString *)number region_number:(NSString *)regionNumber;
-(void)autoLogin;
-(void)logout;
-(void)getFriendsByTimeStampCached;

-(void)uploadAddressBook;
-(void)uploadAbWithContacts:(NSArray *)contacts;
-(void)uploadDeviceToken:(NSString *)deviceToken;

-(void)modifyUserPasswordWithOldPwd:(NSString *)oldPwd andNewPwd:(NSString *)newPwd;
-(void)resetPasswordGetCodeWithUserName:(NSString *)userName andMobileNumber:(NSString *)mobileNumber andMobileArea:(NSString *)mobileArea;
-(void)resetPasswordPostWithUserName:(NSString *)userName 
                     andMobileNumber:(NSString *)mobileNumber 
                       andMobileArea:(NSString *)mobileArea
                              andPwd:(NSString *)password
                       andVerifyCode:(NSString *)verifyCode;
-(void)pushFanxerTeam;
-(void)checkUpdate;

-(void)uploadPersonalBgImgWithData:(NSData *)imgData;
-(void)uploadPersonalHeaderImgWithData:(NSData *)imgData;
-(void)uploadPersonalCoupleImgWithData:(NSData *)imgData;
-(void)uploadPersonalBabyImgWithData:(NSData *)imgData;

-(void)sendXMPPMsg:(XMPPUserMessage*) xmppMsg;
-(void)sendXMPPGroupMsg:(XMPPGroupMessage*) xmppMsg;
@end
