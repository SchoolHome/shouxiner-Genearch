//
//  XMPPGroupMessage.m
//  iCouple
//
//  Created by yl s on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XMPPGroupMessage.h"

#import "CoreUtils.h"

#import "XMPPDateTimeProfiles.h"
#import "XMPPMessage+EXT.h"
#import "XMPPMessage+SYS.h"
#import "XMPPMessage+XEP0045.h"

@implementation XMPPGroupMessage

@synthesize messageID = _messageID;

@synthesize from = _from;
@synthesize to = _to;
@synthesize sender = _sender;

@synthesize type = _type;           //value from : UserMessageType.
@synthesize xmppType = _xmppType;
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

@synthesize delayedTime = _delayedTime;

+ (XMPPGroupMessage *) fromXMLElement:(XMPPMessage *)message
{
    XMPPGroupMessage *groupMessage = nil;
    
    if(message && /*[message isGroupChatMessage]*/[message isGroupChatMessageWithBody])
    {
        GroupMessageType groupMsgType = GroupMessageTypeUnknown;
        
        if( ![message subTypeStr] )
        {
            groupMsgType = GroupMessageTypeText;
        }
        else if( [[message subTypeStr] isEqualToString:@"clt_pic"])
        {
            groupMsgType = GroupMessageTypeImage;
        }
        else if( [[message subTypeStr] isEqualToString:@"clt_au"])
        {
            groupMsgType = GroupMessageTypeAudio;
        }
        else if( [[message subTypeStr] isEqualToString:@"clt_vd"])
        {
            groupMsgType = GroupMessageTypeVideo;
        }
        else if( [[message subTypeStr] isEqualToString:@"clt_mgc"])
        {
            groupMsgType = GroupMessageTypeMagic;
        }
        else if( [[message subTypeStr] isEqualToString:@"clt_snd"])
        {
            groupMsgType = GroupMessageTypeSound;
        }

        
        if( groupMsgType == GroupMessageTypeUnknown )
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
        
        NSString *petID = nil;
        NSString *resID = nil;
        
        switch (groupMsgType)
        {
            case GroupMessageTypeText:
            {
                msgContent = [[message elementForName:@"body"] stringValue];;
            }
                break;
                
            case GroupMessageTypeImage:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                resUrl = [jsonDict objectForKey:@"uri"];
            }
                break;
                
            case GroupMessageTypeAudio:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
            }
                break;
                
            case GroupMessageTypeVideo:
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
                
            case GroupMessageTypeMagic:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                petID = [jsonDict objectForKey:@"petid"];
                resID = [jsonDict objectForKey:@"resid"];                
            }
                break;
                
            case GroupMessageTypeSound:
            {
                NSString *body = [[message elementForName:@"body"] stringValue];
                NSDictionary *jsonDict = [body objectFromJSONString];
                
                petID = [jsonDict objectForKey:@"petid"];
                resUrl = [jsonDict objectForKey:@"uri"];
                contentLen = [jsonDict objectForKey:@"length"];
            }
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
        
        groupMessage = [[XMPPGroupMessage alloc] init];
        
        groupMessage.from = [[message from] bare];
        groupMessage.to = [[message to] bare];
        groupMessage.sender = [[message from] resource];
        groupMessage.type = [NSNumber numberWithInt:groupMsgType];
        groupMessage.message = msgContent;
        groupMessage.resource = resUrl;
        groupMessage.resContentLength = contentLen;
        groupMessage.resContentSize = contentSize;
        groupMessage.resourceMimeType = nil;
        
        groupMessage.resourceThumb = thumb;
        groupMessage.resourceWidth = width;
        groupMessage.resourceHeight = height;
        
        groupMessage.petID = petID;
        groupMessage.resID = resID;
        
        groupMessage.delayedTime = delayedTime;
    }
    
    return groupMessage;
}

- (NSString *)getXMPPSubType
{
    NSString *subtype = nil;
    
    switch ([self.type intValue])
    {
        case GroupMessageTypeText:
            break;
            
        case GroupMessageTypeImage:
        {
            subtype = @"clt_pic";
        }
            break;
            
        case GroupMessageTypeAudio:
        {
            subtype = @"clt_au";
        }
            break;
            
        case GroupMessageTypeVideo:
        {
            subtype = @"clt_vd";
        }
            break;
            
        case GroupMessageTypeMagic:
        {
            subtype = @"clt_mgc";
        }
            break;
            
        case GroupMessageTypeSound:
        {
            subtype = @"clt_snd";
        }
            break;
            
        default:
            break;
    }
    
    return subtype;
}

- (NSString *) getXMPPType
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

- (NSString *)encodeBody
{
    NSString *body = nil;
    
    switch ([self.type intValue])
    {
        case GroupMessageTypeText:
        {
            body = self.message;
        }
            break;
            
        case GroupMessageTypeImage:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.resource forKey:@"uri"];
            
            body = [dict JSONString];
        }
            break;
            
        case GroupMessageTypeAudio:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resContentLength forKey:@"length"];
            
            body = [dict JSONString];
        }
            break;
            
        case GroupMessageTypeVideo:
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
            
        case GroupMessageTypeMagic:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.petID forKey:@"petid"];
            [dict setObject:self.resID forKey:@"resid"];
            
            body = [dict JSONString];
        }
            break;
            
        case GroupMessageTypeSound:
        {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:self.petID forKey:@"petid"];
            [dict setObject:self.resource forKey:@"uri"];
            [dict setObject:self.resContentLength forKey:@"length"];
            
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
