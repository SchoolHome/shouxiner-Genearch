//
//  CPPTModelGroupMember.m
//  iCouple
//
//  Created by yl s on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelGroupMember.h"

#define K_GROUP_MEMBER_KEY_JID              @"jid"
#define K_GROUP_MEMBER_KEY_NICK_NAME        @"nickname"
#define K_GROUP_MEMBER_KEY_ICON             @"icon"
#define K_GROUP_MEMBER_VALUE_NULL           @""

@implementation CPPTModelGroupMember

@synthesize jid = _jid;
@synthesize nickName = _nickName;
@synthesize icon = _icon;

+ (CPPTModelGroupMember *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelGroupMember *member = nil;
    
    if(jsonDict)
    {
        member = [[CPPTModelGroupMember alloc] init];
        if(member)
        {
            member.jid = [jsonDict objectForKey:K_GROUP_MEMBER_KEY_JID];
            member.nickName = [jsonDict objectForKey:K_GROUP_MEMBER_KEY_NICK_NAME];
            member.icon = [jsonDict objectForKey:K_GROUP_MEMBER_KEY_ICON];
        }
    }
    
    return member;
}

- (NSMutableDictionary *)toJsonDict
{
    //    NSAssert(phoneNum,@"phoneNum must not be null!");
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:self.jid forKey:K_GROUP_MEMBER_KEY_JID];
    
    if(self.nickName && self.nickName.length != 0)
    {
        [dict setObject:self.nickName forKey:K_GROUP_MEMBER_KEY_NICK_NAME];
    }
    else
    {
        [dict setObject:K_GROUP_MEMBER_VALUE_NULL forKey:K_GROUP_MEMBER_KEY_NICK_NAME];
    }
    
    if(self.icon && self.icon.length != 0)
    {
        [dict setObject:self.icon forKey:K_GROUP_MEMBER_KEY_NICK_NAME];
    }
    else
    {
        [dict setObject:K_GROUP_MEMBER_VALUE_NULL forKey:K_GROUP_MEMBER_KEY_ICON];
    }
    
    return dict;
}

@end
