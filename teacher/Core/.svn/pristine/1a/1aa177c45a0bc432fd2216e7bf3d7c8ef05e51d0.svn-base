//
//  XMPPGroupMessage.h
//  iCouple
//
//  Created by yl s on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPP.h"
#import "XMPPMessage.h"
#import "NSXMLElement+XMPP.h"

typedef enum{
    
    GroupMessageTypeUnknown = 0,
    GroupMessageTypeText = 1,
    GroupMessageTypeImage = 2,
    GroupMessageTypeAudio = 3,
    GroupMessageTypeVideo = 4,
    GroupMessageTypeMagic = 5,
//    GroupMessageTypeFeeling = 6,
    GroupMessageTypeSound = 7,
//    GroupMessageTypeAsk = 8,
}GroupMessageType;

@interface XMPPGroupMessage : NSObject

@property (strong, nonatomic) NSNumber *messageID;

@property (strong, nonatomic) NSString *from;
@property (strong, nonatomic) NSString *to;
@property (strong, nonatomic) NSString *sender; //only used by groupchat.

@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSNumber *xmppType;
@property (strong, nonatomic) NSString *message;            //only available if the msg is textMsg.
@property (strong, nonatomic) NSString *resource;           //avalible if the msg is not textMsg.
@property (strong, nonatomic) NSNumber *resContentLength;   //avalible if the msg is audio/video Msg.s
@property (strong, nonatomic) NSNumber *resContentSize;
@property (strong, nonatomic) NSString *resourceMimeType;   //N/A

@property (strong, nonatomic) NSString *resourceThumb;      //only available if the msg is videoMsg.
@property (strong, nonatomic) NSNumber *resourceWidth;      //only available if the msg is videoMsg.
@property (strong, nonatomic) NSNumber *resourceHeight;      //only available if the msg is videoMsg.

@property (strong, nonatomic) NSString *uuid;
@property (strong, nonatomic) NSString *petID;
@property (strong, nonatomic) NSString *resID;

@property (strong, nonatomic) NSNumber *delayedTime;

+ (XMPPGroupMessage *) fromXMLElement:(XMPPMessage *)message;

- (NSString *)getXMPPType;
- (NSString *)getXMPPSubType;

- (NSString *)encodeBody;


- (NSMutableDictionary *)generateHttpSendDic;

@end
