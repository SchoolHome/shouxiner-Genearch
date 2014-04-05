//
//  CPPTModelSystemMessage.h
//  iCouple
//
//  Created by yl s on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONKit.h"

#import "CoreUtils.h"

#import "XMPPDateTimeProfiles.h"

#import "XMPP.h"
#import "XMPPMessage.h"
#import "NSXMLElement+XMPP.h"

typedef enum{

    SystemMessageTypeUnknown = 0,
    SystemMessageTypeFriendRecommend = 1,
    SystemMessageTypeAddFriendRequest = 2,
    SystemMessageTypeAddFriendResponse = 3,
    SystemMessageTypeRelationDown = 4,
    SystemMessageTypeLogoutNotify = 5,
    SystemMessageTypeLoginNotify = 6,
    SYstemMessageTypeRelationMatchNotify = 7,
    SystemMessageTypeAck = 99,
}SystemMessageType;

@interface XMPPSystemMessage : NSObject
{
//    NSString *from_;
//    NSString *to_;
//    NSNumber *type_;             //value from:SystemMessageType.
//    NSString *content_;
//    NSString *phnum_;
//    NSString *pharea_;
//    NSString *reqId_;
}

@property (strong, nonatomic) NSString *from;
@property (strong, nonatomic) NSString *to;
@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *phnum;
@property (strong, nonatomic) NSString *pharea;
@property (strong, nonatomic) NSString *uName;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSNumber *applyType;
@property (strong, nonatomic) NSNumber *isAccept; //bool
@property (strong, nonatomic) NSString *actor;
@property (strong, nonatomic) NSNumber *fromLevel;
@property (strong, nonatomic) NSNumber *toLevel;
@property (strong, nonatomic) NSString *reqId;
@property (strong, nonatomic) NSString *bodyString;
@property (strong, nonatomic) NSString *ip;
@property (strong, nonatomic) NSNumber *delayedTime;

+ (XMPPSystemMessage *) fromXMLElement:(XMPPMessage *)message;

//+ (XMPPSystemMessage *)fromJsonDict:(NSDictionary *)jsonDict;

@end
