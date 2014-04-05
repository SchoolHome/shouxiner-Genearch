//
//  CPPTModelUserRegisterInfo.m
//  iCouple
//
//  Created by yl s on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelUserRegisterInfo.h"

#define K_USER_NAME     @"uname"
#define K_PASSWORD      @"passwd"
#define K_NICKNAME      @"nickname"
#define K_GENDER        @"gender"
#define K_PHONE_NUM     @"phnum"
#define K_PHONE_AREA    @"pharea"
#define K_RELATIONSHIP  @"relationship"
#define K_IMEI          @"imei"
#define K_OS            @"os"
#define K_OS_VERSION    @"os_version"
#define K_DEVICE        @"device"

@implementation CPPTModelUserRegisterInfo

@synthesize uName = nName_;
@synthesize password = password_;
@synthesize nickName = nickName_;
@synthesize gender = gender_;
@synthesize phoneNum = phoneNum_;
@synthesize phoneArea = phoneArea_;
@synthesize relationShip = relationShip_;
@synthesize imei = imei_;
@synthesize os = os_;
@synthesize os_version = os_version_;
@synthesize device = device_;

#pragma -
#pragma mark
-(id)init
{
    self = [super init];
    if (self) 
    {
        UIDevice* device = [UIDevice currentDevice];
//        self.os = @"2";//[device systemName];
        self.os = [NSNumber numberWithInt:2];
        self.os_version = [device systemVersion];
        self.imei = @"";//[device uniqueIdentifier];
        self.device = [device model];
    }
    return self;
}

- (NSMutableDictionary *) toJsonDict
{
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionary];
    [jsonDict setObject:[self uName] forKey:K_USER_NAME];
    [jsonDict setObject:[self password] forKey:K_PASSWORD];
    [jsonDict setObject:[self nickName] forKey:K_NICKNAME];
    [jsonDict setObject:[self gender] forKey:K_GENDER];
    [jsonDict setObject:[self phoneNum] forKey:K_PHONE_NUM];
    [jsonDict setObject:[self phoneArea] forKey:K_PHONE_AREA];
    [jsonDict setObject:[self relationShip] forKey:K_RELATIONSHIP];
    [jsonDict setObject:[self imei] forKey:K_IMEI];
    [jsonDict setObject:[self os] forKey:K_OS];
    [jsonDict setObject:[self os_version] forKey:K_OS_VERSION];
    [jsonDict setObject:[self device] forKey:K_DEVICE];
    
    return jsonDict;
}

@end
