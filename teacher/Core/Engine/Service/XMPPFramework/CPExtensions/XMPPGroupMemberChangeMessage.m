//
//  XMPPGroupMemberChangeInfo.m
//  iCouple
//
//  Created by yl s on 12-5-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XMPPGroupMemberChangeMessage.h"

#import "CPPTModelGroupMember.h"

#define K_GROUPMEMBERCHANGEMESSAGE_KEY_ACTOR                @"actor"
#define K_GROUPMEMEERCHANGEMESSAGE_KEY_CONTENT              @"content"
#define K_GROUPMEMBERCHANGEMESSAGE_KEY_NEW_MEMBERS          @"newMembers"
#define K_GROUPMEMBERCHANGEMESSAGE_KEY_QUIT_MEMBERS         @"quitMembers"

#define K_GROUPMEMBERCHANGEMESSAGE_VALUE_NULL               @""

@implementation XMPPGroupMemberChangeMessage

@synthesize from = _from;
@synthesize to = _to;

@synthesize type = _type;

@synthesize actor = _actor;
@synthesize content = _content;
@synthesize changedMembers = _changedMembers;

+ (XMPPGroupMemberChangeMessage *) fromXMLElement:(XMPPMessage *)message
{
    XMPPGroupMemberChangeMessage *gmcMsg = nil;
            
    NSString *from = [[message from] bare];
    NSString *to = [[message to] bare];
        
    NSString *actor = nil;
    NSString *content = nil;
    NSNumber *msgType = nil;
    NSArray *membersArray = nil;
        
    NSString *body = [[message elementForName:@"body"] stringValue];
    NSDictionary *jsonDict = [body objectFromJSONString];
        
    actor = [jsonDict objectForKey:K_GROUPMEMBERCHANGEMESSAGE_KEY_ACTOR];
    content = [jsonDict objectForKey:K_GROUPMEMEERCHANGEMESSAGE_KEY_CONTENT];
    
    NSMutableArray *changedMembers = [[NSMutableArray alloc] init];
    
    membersArray = [jsonDict objectForKey:K_GROUPMEMBERCHANGEMESSAGE_KEY_NEW_MEMBERS];
    if( membersArray )
    {
        msgType = [NSNumber numberWithInt:GroupMemberChangeTypeAdd];
    }
    else
    {
        membersArray = [jsonDict objectForKey:K_GROUPMEMBERCHANGEMESSAGE_KEY_QUIT_MEMBERS];
        if(membersArray)
        {
            msgType = [NSNumber numberWithInt:GroupMemberChangeTypeRemove];
        }
    }
    
    for( NSDictionary *dict in membersArray )
    {
        CPPTModelGroupMember *gm = [CPPTModelGroupMember fromJsonDict:dict];
        if(gm)
        {
            [changedMembers addObject:gm];
        }
    }
        
    gmcMsg = [[XMPPGroupMemberChangeMessage alloc] init ];
    gmcMsg.from = from;
    gmcMsg.to = to;
    gmcMsg.type = msgType;
    gmcMsg.actor = actor;
    gmcMsg.content = content;
    gmcMsg.changedMembers = changedMembers;
//    gmcMsg.changedMembers = membersArray;
    
    return gmcMsg;
}

@end
