//
//  CPPTModelSystemMessage.m
//  iCouple
//
//  Created by yl s on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XMPPSystemMessage.h"

#import "XMPPMessage+EXT.h"
#import "XMPPMessage+SYS.h"

#define K_SYSTEMMESSAGE_KEY_CONTENT           @"content"
#define K_SYSTEMMESSAGE_KEY_PHONE_NUM         @"phnum"
#define K_SYSTEMMESSAGE_KEY_PHONE_AREA        @"pharea"
#define K_SYSTEMMESSAGE_KEY_REQID             @"reqid"

#define K_SYSTEMMESSAGE_VALUE_NULL            @""

@implementation XMPPSystemMessage

@synthesize from = _from;
@synthesize to = _to;
@synthesize type = _type;
@synthesize content = _content;
@synthesize phnum = _phnum;
@synthesize pharea = _pharea;
@synthesize uName = _uName;
@synthesize nickName = _nickName;
@synthesize applyType = _applyType;
@synthesize isAccept = _isAccept;
@synthesize actor = _actor;
@synthesize fromLevel = _fromLevel;
@synthesize toLevel = _toLevel;
@synthesize reqId = reqId_;
@synthesize bodyString = _bodyString;
@synthesize ip = _ip;

@synthesize delayedTime = _delayedTime;

+ (XMPPSystemMessage *) fromXMLElement:(XMPPMessage *)message
{
    XMPPSystemMessage *sysMsg = nil;
    SystemMessageType sysMsgType = SystemMessageTypeUnknown;
    if( message && [message isSystemMessageWithBody])
    {
        NSString *subTypeStr = [message subTypeStr];
        if( [subTypeStr isEqualToString:@"sys_rmd"])
        {
            sysMsgType = SystemMessageTypeFriendRecommend;
        }
        else if( [subTypeStr isEqualToString:@"sys_req"])
        {
            sysMsgType = SystemMessageTypeAddFriendRequest;
        }
        else if( [subTypeStr isEqualToString:@"sys_rsp"])
        {
            sysMsgType = SystemMessageTypeAddFriendResponse;
        }
        else if( [subTypeStr isEqualToString:@"sys_dgrd"] )
        {
            sysMsgType = SystemMessageTypeRelationDown;
        }
        else if( [subTypeStr isEqualToString:@"sys_logout"] )
        {
            sysMsgType = SystemMessageTypeLogoutNotify;
        }
        else if( [subTypeStr isEqualToString:@"sys_login"] )
        {
            sysMsgType = SystemMessageTypeLoginNotify;
        }
        else if( [subTypeStr isEqualToString:@"sys_match"] )
        {
            sysMsgType = SYstemMessageTypeRelationMatchNotify;
        }
        else if( [subTypeStr isEqualToString:@"ack"] )
        {
            sysMsgType = SystemMessageTypeAck;
        }
    
            
        NSString *from = [[message from] bare];
        NSString *to = [[message to] bare];
    
        NSString *content = nil;
        NSString *phnum = nil;
        NSString *pharea = nil;
        NSString *uName = nil;
        NSString *nickName = nil;
        NSNumber *applyType = nil;
        NSString *reqid = nil;
        NSNumber *isAccept = nil;
        
        NSString *actor = nil;
        NSNumber *fromLevel = nil;
        NSNumber *toLevel = nil;
        
        NSString *ip = nil;
    
        NSString *body = [[message elementForName:@"body"] stringValue];
        NSDictionary *jsonDict = [body objectFromJSONString];

        switch( sysMsgType )
        {
            case SystemMessageTypeFriendRecommend:
                {
                    content = [jsonDict objectForKey:@"content"];
                    phnum = [jsonDict objectForKey:@"phnum"];
                    pharea = [jsonDict objectForKey:@"pharea"];
                    uName = [jsonDict objectForKey:@"uname"];
                    nickName = [jsonDict objectForKey:@"nickname"];
                }
                break;
                
            case SystemMessageTypeAddFriendRequest:
                {
                    content = [jsonDict objectForKey:@"content"];
                    reqid = [jsonDict objectForKey:@"reqid"];
                    uName = [jsonDict objectForKey:@"uname"];
                    nickName = [jsonDict objectForKey:@"nickname"];
                    applyType = [jsonDict objectForKey:@"applytype"];
                }
                break;
                
            case SystemMessageTypeAddFriendResponse:
                {
                    content = [jsonDict objectForKey:@"content"];
                    uName = [jsonDict objectForKey:@"uname"];
                    isAccept = [jsonDict objectForKey:@"isAccept"];
                    nickName = [jsonDict objectForKey:@"nickname"];
                    applyType = [jsonDict objectForKey:@"applytype"];
                }
                break;
                
            case SystemMessageTypeRelationDown:
                {
                    content = [jsonDict objectForKey:@"content"];
                    actor = [jsonDict objectForKey:@"actor"];
                    nickName = [jsonDict objectForKey:@"nickname"];
                    fromLevel = [jsonDict objectForKey:@"fromLevel"];
                    toLevel = [jsonDict objectForKey:@"toLevel"];
                }
                break;
                
            case SystemMessageTypeLogoutNotify:
                {
                
                }
                break;
                
            case SystemMessageTypeLoginNotify:
                {
                    ip = [jsonDict objectForKey:@"ip"];
                }
                break;
                
            case SYstemMessageTypeRelationMatchNotify:
                {
                    content = [jsonDict objectForKey:@"content"];
                    uName = [jsonDict objectForKey:@"uname"];
                }
                break;
                
            case SystemMessageTypeAck:
                {
                    content = [jsonDict objectForKey:@"id"];
                }
                break;
                
            case SystemMessageTypeUnknown:
                break;
                
            default:
                break;
        }

        NSNumber *delayedTime = nil;
        NSXMLElement *delay = nil;
        delay = [message elementForName:@"delay" xmlns:@"urn:xmpp:delay"];
        if (delay)
        {
            NSString *stampValue = [delay attributeStringValueForName:@"stamp"];
            NSDate *date = [XMPPDateTimeProfiles parseDateTime:stampValue];
            delayedTime = [CoreUtils getLongFormatWithDate:date];
        }
    
        sysMsg = [[XMPPSystemMessage alloc] init ];
        sysMsg.from = from;
        sysMsg.to = to;
        sysMsg.type = [NSNumber numberWithInt:sysMsgType];
        sysMsg.content = content;
        sysMsg.phnum = phnum;
        sysMsg.pharea = pharea;
        sysMsg.uName = uName;
        sysMsg.nickName = nickName;
        sysMsg.applyType = applyType;
        sysMsg.isAccept = isAccept;
        sysMsg.actor = actor;
        sysMsg.fromLevel = fromLevel;
        sysMsg.toLevel = toLevel;
        sysMsg.reqId = reqid;
        sysMsg.ip = ip;
        sysMsg.bodyString = body;
        
        sysMsg.delayedTime = delayedTime;
    }
    if( sysMsgType == SystemMessageTypeUnknown )
    {
        //            return nil;
        CPLogInfo(@"unrecognized system message!!!");
        if (!sysMsg)
        {
            sysMsg = [[XMPPSystemMessage alloc] init ];
        }
        sysMsg.from = @"system";
        sysMsg.uName = @"system";
    }

    return sysMsg;
}

@end
