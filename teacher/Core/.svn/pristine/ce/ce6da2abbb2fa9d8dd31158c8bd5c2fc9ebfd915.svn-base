//
//  CPPTModelSearchResultUserInfo.m
//  iCouple
//
//  Created by yl s on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelSearchResultUserInfo.h"

#define K_USER_NAME         @"uname"
#define K_NICKNAME          @"nickname"
#define K_GENDER            @"gender"
#define K_ICON              @"icon"
#define K_RELATIONSHIP      @"relationship"

@implementation CPPTModelSearchResultUserInfo

@synthesize uName = uName_;
@synthesize nickName = nickName_;
@synthesize gender = gender_;
@synthesize icon = icon_;
@synthesize relationShip = relationShip_;

+ (CPPTModelSearchResultUserInfo *)fromJsonString:(NSString *)jsonStr
{
    CPPTModelSearchResultUserInfo *userInfo = nil;

    if(jsonStr)
    {
        userInfo = [[CPPTModelSearchResultUserInfo alloc] init];
        if(userInfo)
        {
            NSDictionary *dict = [jsonStr objectFromJSONString];
            
            userInfo.uName = [dict objectForKey:K_USER_NAME];
            userInfo.nickName = [dict objectForKey:K_NICKNAME];
            userInfo.gender = [dict objectForKey:K_GENDER];
            userInfo.icon = [dict objectForKey:K_ICON];
            userInfo.relationShip = [dict objectForKey:K_RELATIONSHIP];
        }
    }
    
    return userInfo;
}

+ (CPPTModelSearchResultUserInfo *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelSearchResultUserInfo *userInfo = nil;
    
    if(jsonDict)
    {
        userInfo = [[CPPTModelSearchResultUserInfo alloc] init];
        if(userInfo)
        {
            userInfo.uName = [jsonDict objectForKey:K_USER_NAME];
            userInfo.nickName = [jsonDict objectForKey:K_NICKNAME];
            userInfo.gender = [jsonDict objectForKey:K_GENDER];
            userInfo.icon = [jsonDict objectForKey:K_ICON];
            userInfo.relationShip = [jsonDict objectForKey:K_RELATIONSHIP];
        }
    }
    
    return userInfo;
}

@end
