//
//  XMPPGroupMemberChangeInfo.h
//  iCouple
//
//  Created by yl s on 12-5-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPP.h"
#import "XMPPMessage.h"
#import "NSXMLElement+XMPP.h"

#import "CPPTModelGroupMember.h"

typedef enum{
    
    GroupMemberChangeTypeUnknown = 0,
    GroupMemberChangeTypeAdd = 1,
    GroupMemberChangeTypeRemove = 2,
}GroupMemberChangeType;

@interface XMPPGroupMemberChangeMessage : NSObject
{
    NSString *_from;
    NSString *_to;
    
    NSNumber *_type;                //value from : GroupMemberChangeType.
    
    NSString *_actor;               //JID.
    NSString *_content;
    NSArray  *_changedMembers;      //elem : CPPTModelGroupMember
}

@property (strong, nonatomic) NSString *from;
@property (strong, nonatomic) NSString *to;

@property (strong, nonatomic) NSNumber *type;

@property (strong, nonatomic) NSString *actor;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSArray  *changedMembers;

+ (XMPPGroupMemberChangeMessage *) fromXMLElement:(XMPPMessage *)message;

@end
