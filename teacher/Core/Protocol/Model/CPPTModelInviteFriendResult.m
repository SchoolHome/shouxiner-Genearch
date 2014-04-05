//
//  CPPTModelAddFriendResult.m
//  iCouple
//
//  Created by yl s on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelInviteFriendResult.h"

#define K_ADDFRIENDRESULT_KEY_ISUSER        @"isUser"
#define K_ADDFRIENDRESULT_KEY_ICON          @"icon"

#define K_ADDFRIENDRESULT_VALUE_NULL        @""

@implementation CPPTModelInviteFriendResult

@synthesize isUSer = _isUser;
@synthesize icon = _icon;

+ (CPPTModelInviteFriendResult *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelInviteFriendResult *result = nil;
    
    if(jsonDict)
    {
        if( [jsonDict count] )
        {
            result = [[CPPTModelInviteFriendResult alloc] init];
            result.isUSer = [jsonDict objectForKey:K_ADDFRIENDRESULT_KEY_ISUSER];
            result.icon = [jsonDict objectForKey:K_ADDFRIENDRESULT_KEY_ICON];
        }
    }
    
    return result;
}

@end
