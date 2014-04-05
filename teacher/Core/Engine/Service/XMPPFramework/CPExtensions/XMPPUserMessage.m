//
//  XMPPUserMessage.m
//  iCouple
//
//  Created by yl s on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XMPPUserMessage.h"

#import "CoreUtils.h"

#import "XMPPDateTimeProfiles.h"
#import "XMPPMessage+EXT.h"
#import "XMPPMessage+SYS.h"

@implementation XMPPUserMessage

@synthesize messageID = _messageID;

@synthesize from = _from;
@synthesize to = _to;
@synthesize type = _type;           //value from : UserMessageType.
@synthesize message = _message;
@synthesize resource = _resource;
@synthesize resContentLength = _resContentLength;
@synthesize resContentSize = _resContentSize;
@synthesize resourceMimeType = _resourceMimeType;
@synthesize resourceThumb = _resourceThumb;
@synthesize resourceWidth = _resourceWidth;
@synthesize resourceHeight = _resourceHeight;
@synthesize uuid = _uuid;
@synthesize petID = _petID;
@synthesize resID = _resID;
@synthesize xmppType = _xmppType;

@synthesize delayedTime = _delayedTime;

+ (XMPPUserMessage *) fromXMLElement:(XMPPMessage *)message
{
    XMPPUserMessage *userMessage = nil;
    
    if(message && /*[message isChatMessage]*/[message isChatMessageWithBody])
    {
        UserMessageType userMsgType = UserMessageTypeUnknown;
        
        NSString *subTypeStr = [message subTypeStr];
        CPLogInfo(@"subTypeStr:%@\n", subTypeStr);
        
        if( !subTypeStr )
        {
            userMsgType = UserMessageTypeText;
        }
        else if( [subTypeStr isEqualToString:@"clt_pic"])
        {
            userMsgType = UserMessageTypeImage;
        }
        else if( [subTypeStr isEqualToString:@"clt_au"])
        {
            userMsgType = UserMessageTypeAudio;
        }
        else if( [subTypeStr isEqualToString:@"clt_vd"])
        {
            userMsgType = UserMessageTypeVideo;
        }
        else if( [subTypeStr isEqualToString:@"clt_mgc"])
        {
            userMsgType = UserMessageTypeMagic;
        }
        else if( [subTypeStr isEqualToString:@"clt_act"])
        {
            userMsgType = UserMessageTypeFeeling;
        }
        else if( [subTypeStr isEqualToString:@"clt_snd"])
        {
            userMsgType = UserMessageTypeSound;
        }
        else if( [subTypeStr isEqualToString:@"clt_ask"])
        {
            userMsgType = UserMessageTypeAsk;
        }
        else if( [subTypeStr isEqualToString:@"clt_answer"] )
        {
            userMsgType = UserMessageTypeAnswer;
        }
        else if( [subTypeStr isEqualToString:@"clt_alarm"] )
        {
            userMsgType = UserMessageTypeAlarm;
        }
        
        if( userMsgType == UserMessageTypeUnknown )
        {
            //            return nil;
            CPLogInfo(@"unrecognized system message!!!");
        }
        
        NSString *msgContent = nil;
        NSString *resUrl = nil;
        NSNumber *contentLen = nil;
        NSNumber *contentSize = nil;
        
        NSString *thumb = nil;
        NSNumber *width = nil;
        NSNumber *height = nil;
        
        NSString *uuid = nil;
        
        NSString *petID = nil;
        NSString *resID = nil;
        
        switch (userMsgType)
        {
            case UserMessageTypeText:
            {
                msgContent = [[message elementForName:@"body"] stringValue];
            }
                break;
                
            case UserMessageTypeImage:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                resUrl = [jsonDict objectForKey:@"uri"];
            }
                break;
                
            case UserMessageTypeAudio:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
            }
                break;
                
            case UserMessageTypeVideo:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                resUrl = [jsonDict objectForKey:@"uri"];
                width = [jsonDict objectForKey:@"width"];
                height = [jsonDict objectForKey:@"height"];
                thumb = [jsonDict objectForKey:@"thumb"];
                contentLen = [jsonDict objectForKey:@"length"];
                contentSize = [jsonDict objectForKey:@"size"];
            }
                break;
                
            case UserMessageTypeMagic:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                petID = [jsonDict objectForKey:@"petid"];
                resID = [jsonDict objectForKey:@"resid"];
            }
                break;
                
            case UserMessageTypeFeeling:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                petID = [jsonDict objectForKey:@"petid"];
                resID = [jsonDict objectForKey:@"resid"];
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
            }
                break;
                
            case UserMessageTypeSound:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                petID = [jsonDict objectForKey:@"petid"];
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
            }
                break;
                
            case UserMessageTypeAsk:
            case UserMessageTypeAnswer:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                petID = [jsonDict objectForKey:@"petid"];
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
                uuid = [jsonDict objectForKey:@"uuid"];
            }
                break;
            case UserMessageTypeAlarm:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                /**
                 {"time":"Thu, 08 Mar 2012 15:46:24 GMT", "type":1, "content":"hello, good morning!", "uri":"http://a.com/a.amr", "length":100, "hide":true}
                 **/
                msgContent = [jsonDict objectForKey:@"content"];
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
                thumb = [jsonDict objectForKey:@"time"];
                width = [jsonDict objectForKey:@"type"];
                height = [jsonDict objectForKey:@"hide"];
            }
                break;
            case UserMessageTypeUnknown:
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
        
        userMessage = [[XMPPUserMessage alloc] init];
        
        userMessage.from = [[message from] bare];
        userMessage.to = [[message to] bare];
        userMessage.type = [NSNumber numberWithInt:userMsgType];
        userMessage.message = msgContent;
        userMessage.resource = resUrl;
        userMessage.resContentLength = contentLen;
        userMessage.resContentSize = contentSize;
        userMessage.resourceMimeType = nil;
        
        userMessage.resourceThumb = thumb;
        userMessage.resourceWidth = width;
        userMessage.resourceHeight = height;
        
        userMessage.uuid = uuid;
        
        userMessage.petID = petID;
        userMessage.resID = resID;
        
        userMessage.delayedTime = delayedTime;
    }
    
    return userMessage;
}

- (NSString *)getXMPPType
{
    NSString *xmppType = nil;
    
    switch ([self.xmppType intValue])
    {
        case XMPPMsgTypeChat:
        {
            xmppType = @"chat";
        }
            break;
            
        case XMPPMsgTypeGroupChat:
        {
            xmppType = @"groupchat";
        }
            break;
            
        case XMPPMsgTypeNormal:
        {
            xmppType = @"normal";
        }
            break;
        default:
            break;
    }
    
    return xmppType;
}

- (NSString *)getXMPPSubType
{
    NSString *subtype = nil;
    
    switch ([self.type intValue])
    {
        case UserMessageTypeText:
            break;
            
        case UserMessageTypeImage:
        {
            subtype = @"clt_pic";
        }
            break;
            
        case UserMessageTypeAudio:
        {
            subtype = @"clt_au";
        }
            break;
            
        case UserMessageTypeVideo:
        {
            subtype = @"clt_vd";
        }
            break;
            
        case UserMessageTypeMagic:
        {
            subtype = @"clt_mgc";
        }
            break;
            
        case UserMessageTypeFeeling:
        {
            subtype = @"clt_act";
        }
            break;
            
        case UserMessageTypeSound:
        {
            subtype = @"clt_snd";
        }
            break;
            
        case UserMessageTypeAsk:
        {
            subtype = @"clt_ask";
        }
            break;
            
        case UserMessageTypeAnswer:
        {
            subtype = @"clt_answer";
        }
            break;
        case UserMessageTypeAlarm:
        {
            subtype = @"clt_alarm";
        }
        default:
            break;
    }
    
    return subtype;
}

- (NSString *)encodeBody
{
    NSString *body = nil;
    
    switch ([self.type intValue])
    {
        case UserMessageTypeText:
        {
            body = self.message;
        }
            break;
            
        case UserMessageTypeImage:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.resource forKey:@"uri"];
            
            body = [dict JSONString];
        }
            break;
            
        case UserMessageTypeAudio:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resContentLength forKey:@"length"];
            
            body = [dict JSONString];
        }
            break;
            
        case UserMessageTypeVideo:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resourceWidth forKey:@"width"];
            [dict setObject:self.resourceHeight forKey:@"height"];
            [dict setObject:self.resourceThumb forKey:@"thumb"];
            [dict setObject:self.resContentLength forKey:@"length"];
            [dict setObject:self.resContentSize forKey:@"size"];
            
            body = [dict JSONString];
        }
            break;
            
        case UserMessageTypeMagic:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.petID forKey:@"petid"];
            [dict setObject:self.resID forKey:@"resid"];
            
            body = [dict JSONString];
        }
            break;
            
        case UserMessageTypeFeeling:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.petID forKey:@"petid"];
            [dict setObject:self.resID forKey:@"resid"];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resContentLength forKey:@"length"];
            
            body = [dict JSONString];
        }
            break;
            
        case UserMessageTypeSound:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.petID forKey:@"petid"];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resContentLength forKey:@"length"];
            
            body = [dict JSONString];
        }
            break;
            
        case UserMessageTypeAsk:
        case UserMessageTypeAnswer:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.petID forKey:@"petid"];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resContentLength forKey:@"length"];
            [dict setObject:self.uuid forKey:@"uuid"];
            
            body = [dict JSONString];
        }
            break;
        case UserMessageTypeAlarm:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            if (self.message)
            {
                [dict setObject:self.message forKey:@"content"];
            }
            if (self.resource)
            {
                [dict setObject:self.resource forKey:@"uri"];
            }
            if (self.resContentLength)
            {
                [dict setObject:self.resContentLength forKey:@"length"];
            }
            if (self.resourceHeight)
            {
                [dict setObject:self.resourceHeight forKey:@"hide"];
            }
            [dict setObject:self.resourceThumb forKey:@"time"];
            [dict setObject:self.resourceWidth forKey:@"type"];
            
            body = [dict JSONString];
        }
            break;
        default:
            break;
    }
    
    return body;
}


- (NSMutableDictionary *)generateHttpSendDic
{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.uuid forKey:@"id"];
    [dict setObject:self.from forKey:@"fromJID"];
    [dict setObject:self.to forKey:@"toJID"];
    NSString *xmppType = self.getXMPPType;
    if (xmppType)
        [dict setObject:xmppType forKey:@"type"];
    NSString *xmppSubType = self.getXMPPSubType;
    if (xmppSubType)
        [dict setObject:xmppSubType forKey:@"subType"];
    [dict setObject:[self encodeBody] forKey:@"body"];
    
    return dict;
}

@end
