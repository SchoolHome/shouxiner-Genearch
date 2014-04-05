//
//  CPPTModelGroupInfo.m
//  iCouple
//
//  Created by yl s on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPTModelGroupInfo.h"
#import "CPPTModelGroupMember.h"

#define K_GROUP_INFO_KEY_GROUP          @"group"

#define K_GROUP_INFO_KEY_GROUP_JID      @"groupJID"
#define K_GROUP_INFO_KEY_GROUP_NAME     @"groupName"
#define K_GROUP_INFO_KEY_OWNER_JID      @"ownerJID"
#define K_GROUP_INFO_KEY_MEMBERS        @"members"
#define K_GROUP_INFO_VALUE_NULL         @""

@implementation CPPTModelGroupInfo

@synthesize jid = _jid;
@synthesize name = _name;
@synthesize ownerJID = _ownerJID;

@synthesize memberList = _memberList;

+ (CPPTModelGroupInfo *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelGroupInfo *group = nil;
    
    if(jsonDict)
    {
//        NSDictionary* groupDict = [jsonDict objectForKey:K_GROUP_INFO_KEY_GROUP];
        
        group = [[CPPTModelGroupInfo alloc] init];
        if(group)
        {
            group.jid = [jsonDict/*groupDict*/ objectForKey:K_GROUP_INFO_KEY_GROUP_JID];
            group.name = [jsonDict/*groupDict*/ objectForKey:K_GROUP_INFO_KEY_GROUP_NAME];
            group.ownerJID = [jsonDict/*groupDict*/ objectForKey:K_GROUP_INFO_KEY_OWNER_JID];
            
            NSMutableArray *memberList = [[NSMutableArray alloc] init];
            NSArray * memberArray = [jsonDict/*groupDict*/ objectForKey:K_GROUP_INFO_KEY_MEMBERS];
            for(NSDictionary *dict in memberArray)
            {
                CPPTModelGroupMember *member = [CPPTModelGroupMember fromJsonDict:dict];
                [memberList addObject:member];
            }
            
            group.memberList = memberList;
        }
    }
    
    return group;
    
}

- (NSMutableDictionary *)toJsonDict
{
    //    NSAssert(phoneNum,@"phoneNum must not be null!");
    
    NSMutableArray *memberArray = [[NSMutableArray alloc] init];
    
    for(CPPTModelGroupMember* mmbr in self.memberList)
    {
        [memberArray addObject:[mmbr toJsonDict]];
    }
    
    NSMutableDictionary *groupDict = [NSMutableDictionary dictionary];
    [groupDict setObject:self.jid forKey:K_GROUP_INFO_KEY_GROUP_JID];
    [groupDict setObject:self.name forKey:K_GROUP_INFO_KEY_GROUP_NAME];
    [groupDict setObject:self.ownerJID forKey:K_GROUP_INFO_KEY_OWNER_JID];
    [groupDict setObject:memberArray forKey:K_GROUP_INFO_KEY_MEMBERS];
    
    return groupDict;
}

@end
