//
//  CPOperationHttpMsgReSend.m
//  iCouple
//
//  Created by liangshuang on 10/13/12.
//
//


#import "CPOperationHttpMsgReSend.h"

#import "CPUIModelMessage.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPDBModelMessage.h"
#import "CPUIModelMessageGroup.h"
#import "CPUIModelMessageGroupMember.h"
#import "XMPPUserMessage.h"
#import "XMPPGroupMessage.h"
#import "CPLGModelAccount.h"
#import "CPXmppEngine.h"
#import "CPDBModelResource.h"
#import "CPMsgManager.h"
#import "CPUIModelUserInfo.h"
#import "CPResManager.h"
#import "CoreUtils.h"
#import "CPSystemManager.h"
@implementation CPOperationHttpMsgReSend
- (id) initWithMsg:(CPUIModelMessage *) uiMsg andMsgGroup:(CPUIModelMessageGroup *)msgGroup
{
    self = [super init];
    if (self)
    {
        reSendMsg = uiMsg;
        uiMsgGroup = msgGroup;
    }
    return self;
}
-(XMPPUserMessage *)dbMsgToPtUserMsgWithModel:(CPDBModelMessage *)dbMsg
{
    XMPPUserMessage *xmppUserMsg = [[XMPPUserMessage alloc] init];
    //    NSString *toName = [NSString stringWithFormat:@"%@%@",uiUserInfo.name,uiUserInfo.domain];
    CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
    NSString *fromName = [NSString stringWithFormat:@"%@@%@",myAccountModel.uid,myAccountModel.domain];
    NSString *sendMsg = dbMsg.msgText;
    [xmppUserMsg setFrom:fromName];
    //    [xmppUserMsg setTo:toName];
    NSInteger uiMsgType = [dbMsg.contentType integerValue];
    switch (uiMsgType)
    {
        case MSG_CONTENT_TYPE_TEXT:
            [xmppUserMsg setMessage:sendMsg];
            [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeText]];
            break;
        case MSG_CONTENT_TYPE_MAGIC:
            if (!dbMsg.petMsgID)
            {
                [dbMsg setPetMsgID:@"1"];
            }
            [xmppUserMsg setPetID:dbMsg.petMsgID];
            [xmppUserMsg setResID:dbMsg.magicMsgID];
            [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeMagic]];
            break;
        case MSG_CONTENT_TYPE_IMG:
            [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeImage]];
            break;
        case MSG_CONTENT_TYPE_AUDIO:
            [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeAudio]];
            break;
        case MSG_CONTENT_TYPE_VIDEO:
            [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeVideo]];
            break;
        case MSG_CONTENT_TYPE_CQ:
        case MSG_CONTENT_TYPE_CS:
        case MSG_CONTENT_TYPE_TTW:
        case MSG_CONTENT_TYPE_TTD:
        case MSG_CONTENT_TYPE_ALARM_AUDIO:
        case MSG_CONTENT_TYPE_ALARM_TEXT:
            if (!dbMsg.petMsgID)
            {
                [dbMsg setPetMsgID:@"1"];
            }
            [xmppUserMsg setPetID:dbMsg.petMsgID];
            [xmppUserMsg setResID:dbMsg.magicMsgID];
            switch ([dbMsg.contentType integerValue])
        {
            case MSG_CONTENT_TYPE_CQ:
                [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeFeeling]];
                break;
            case MSG_CONTENT_TYPE_CS:
                [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeSound]];
                break;
            case MSG_CONTENT_TYPE_TTW:
                [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeAsk]];
                [xmppUserMsg setUuid:dbMsg.uuidAsk];
                break;
            case MSG_CONTENT_TYPE_TTD:
                [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeAnswer]];
                [xmppUserMsg setUuid:dbMsg.uuidAsk];
                break;
            case MSG_CONTENT_TYPE_ALARM_AUDIO:
                [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeAlarm]];
                [xmppUserMsg setResourceWidth:[NSNumber numberWithInt:2]];
                [xmppUserMsg setResourceHeight:[NSNumber numberWithBool:[dbMsg.locationInfo boolValue]]];
                [xmppUserMsg setResourceThumb:[CoreUtils getStringFormatWithNumber:[NSNumber numberWithLongLong:[dbMsg.mobile longLongValue]]]];
                break;
            case MSG_CONTENT_TYPE_ALARM_TEXT:
                [xmppUserMsg setType:[NSNumber numberWithInt:UserMessageTypeAlarm]];
                [xmppUserMsg setResourceWidth:[NSNumber numberWithInt:1]];
                [xmppUserMsg setMessage:sendMsg];
                [xmppUserMsg setResourceHeight:[NSNumber numberWithBool:[dbMsg.locationInfo boolValue]]];
                [xmppUserMsg setResourceThumb:[CoreUtils getStringFormatWithNumber:[NSNumber numberWithLongLong:[dbMsg.mobile longLongValue]]]];
                
                break;
            default:
                break;
        }
            break;
        default:
            break;
    }
    [xmppUserMsg setMessageID:dbMsg.msgID];
    return xmppUserMsg;
}
-(XMPPGroupMessage *)dbMsgToPtGroupUserMsgWithModel:(CPDBModelMessage *)dbMsg
{
    XMPPGroupMessage *xmppGroupUserMsg = [[XMPPGroupMessage alloc] init];
    //    NSString *toName = [NSString stringWithFormat:@"%@%@",uiUserInfo.name,uiUserInfo.domain];
    CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
    NSString *fromName = [NSString stringWithFormat:@"%@@%@",myAccountModel.loginName,myAccountModel.domain];
    NSString *sendMsg = dbMsg.msgText;
    [xmppGroupUserMsg setFrom:fromName];
    //    [xmppGroupUserMsg setTo:toName];
    NSInteger uiMsgType = [dbMsg.contentType integerValue];
    switch (uiMsgType)
    {
        case MSG_CONTENT_TYPE_TEXT:
            [xmppGroupUserMsg setMessage:sendMsg];
            [xmppGroupUserMsg setType:[NSNumber numberWithInt:UserMessageTypeText]];
            break;
        case MSG_CONTENT_TYPE_MAGIC:
            if (!dbMsg.petMsgID)
            {
                [dbMsg setPetMsgID:@"1"];
            }
            [xmppGroupUserMsg setPetID:dbMsg.petMsgID];
            [xmppGroupUserMsg setResID:dbMsg.magicMsgID];
            [xmppGroupUserMsg setType:[NSNumber numberWithInt:UserMessageTypeMagic]];
            break;
        case MSG_CONTENT_TYPE_IMG:
            [xmppGroupUserMsg setType:[NSNumber numberWithInt:GroupMessageTypeImage]];
            break;
        case MSG_CONTENT_TYPE_AUDIO:
            [xmppGroupUserMsg setType:[NSNumber numberWithInt:GroupMessageTypeAudio]];
            break;
        case MSG_CONTENT_TYPE_VIDEO:
            [xmppGroupUserMsg setType:[NSNumber numberWithInt:GroupMessageTypeVideo]];
            break;
        case MSG_CONTENT_TYPE_CS:
            if (!dbMsg.petMsgID)
            {
                [dbMsg setPetMsgID:@"1"];
            }
            [xmppGroupUserMsg setPetID:dbMsg.petMsgID];
            [xmppGroupUserMsg setResID:dbMsg.magicMsgID];
            [xmppGroupUserMsg setType:[NSNumber numberWithInt:GroupMessageTypeSound]];
            break;
        default:
            break;
    }
    [xmppGroupUserMsg setMessageID:dbMsg.msgID];
    return xmppGroupUserMsg;
}

-(void)main
{
    @autoreleasepool
    {
        if (reSendMsg.msgID)
        {
            CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:reSendMsg.msgID];
            if (!uiMsgGroup)
            {
                return;
            }
            
            [dbMsg setSendState:[NSNumber numberWithInt:MSG_STATE_SENDING]];
            [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID
                                                                      andStatus:[NSNumber numberWithInt:MSG_STATE_SENDING]];
            [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
            NSInteger groupType = [uiMsgGroup.type integerValue];
            switch (groupType)
            {
                case MSG_GROUP_TYPE_SINGLE:
                case MSG_GROUP_TYPE_SINGLE_PRE:
                {
                    if ([uiMsgGroup.memberList count]>0)
                    {
                        CPUIModelMessageGroupMember *dbGroupMem = [uiMsgGroup.memberList objectAtIndex:0];
                        CPUIModelUserInfo *uiUserInfo = dbGroupMem.userInfo;
                        if (!uiUserInfo.name)
                        {
                            return;
                        }
                        NSString *toName = [NSString stringWithFormat:@"%@%@",uiUserInfo.name,uiUserInfo.domain];
                        XMPPUserMessage *userMsg = [self dbMsgToPtUserMsgWithModel:dbMsg];
                        [userMsg setTo:toName];
                        NSInteger msgType = [dbMsg.contentType integerValue];
                        switch (msgType)
                        {
                            case MSG_CONTENT_TYPE_MAGIC:
                            case MSG_CONTENT_TYPE_TEXT:
                            case MSG_CONTENT_TYPE_ALARM_TEXT:
                            case MSG_CONTENT_TYPE_ALARMED_TEXT:
                                [userMsg setXmppType:[NSNumber numberWithInt:XMPPMsgTypeChat]];
                                [[[CPSystemEngine sharedInstance] sysManager] sendXMPPMsg:userMsg];
                                break;
                            case MSG_CONTENT_TYPE_CQ:
                            case MSG_CONTENT_TYPE_CS:
                            case MSG_CONTENT_TYPE_TTW:
                            case MSG_CONTENT_TYPE_TTD:
                            case MSG_CONTENT_TYPE_IMG:
                            case MSG_CONTENT_TYPE_AUDIO:
                            case MSG_CONTENT_TYPE_VIDEO:
                            case MSG_CONTENT_TYPE_ALARM_AUDIO:
                            case MSG_CONTENT_TYPE_ALARMED_AUDIO:
                            {
                                CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance]dbManagement] findResourceWithID:dbMsg.attachResID];
                                if (dbRes)
                                {
                                    [userMsg setResContentLength:dbRes.mediaTime];
                                    NSString *resPath = [[[CPSystemEngine sharedInstance] resManager] getResourcePathWithRes:dbRes];
                                    NSNumber *resFileSize = [CoreUtils getFileSizeWithName:resPath];
                                    [userMsg setResContentSize:resFileSize];
                                    //                                    [userMsg setResContentSize:dbRes.fileSize];
                                    [userMsg setResource:dbRes.serverUrl];
                                    if (msgType==MSG_CONTENT_TYPE_VIDEO)
                                    {
                                        [userMsg setResourceHeight:[NSNumber numberWithInt:480]];
                                        [userMsg setResourceWidth:[NSNumber numberWithInt:360]];
                                        CPDBModelResource *dbResThub = [[[CPSystemEngine sharedInstance] dbManagement] findResourceVideoThumbImgWithObjID:dbRes.objID];
                                        if (dbResThub)
                                        {
                                            [userMsg setResourceThumb:dbResThub.serverUrl];
                                        }
                                        else
                                        {
                                            [userMsg setResourceThumb:@"11111"];
                                        }
                                    }
                                    if ([dbRes.mark integerValue]==MARK_DEFAULT)
                                    {
                                        [userMsg setXmppType:[NSNumber numberWithInt:XMPPMsgTypeChat]];
                                        [[[CPSystemEngine sharedInstance] sysManager] sendXMPPMsg:userMsg];
                                    }
                                    else if([dbRes.mark integerValue]==MARK_UPLOAD)
                                    {
                                        NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
                                        [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
                                        [[[CPSystemEngine sharedInstance] msgManager] addWillSendMsg:userMsg andMsgID:reSendMsg.msgID];
                                    }
                                }
                            }
                                break;
                            default:
                                break;
                        }
                    }
                }
                    //
                    break;
                case MSG_GROUP_TYPE_MULTI:
                case MSG_GROUP_TYPE_MULTI_PRE:
                case MSG_GROUP_TYPE_CONVER:
                case MSG_GROUP_TYPE_CONVER_PRE:
                {
                    XMPPGroupMessage *groupMsg = [self dbMsgToPtGroupUserMsgWithModel:dbMsg];
                    [groupMsg setTo:uiMsgGroup.groupServerID];
                    NSInteger msgType = [dbMsg.contentType integerValue];
                    switch (msgType)
                    {
                        case MSG_CONTENT_TYPE_MAGIC:
                        case MSG_CONTENT_TYPE_TEXT:
                            [groupMsg setXmppType:[NSNumber numberWithInt:XMPPMsgTypeGroupChat]];
                            [[[CPSystemEngine sharedInstance] sysManager] sendXMPPGroupMsg:groupMsg];
                            break;
                        case MSG_CONTENT_TYPE_CQ:
                        case MSG_CONTENT_TYPE_CS:
                        case MSG_CONTENT_TYPE_TTW:
                        case MSG_CONTENT_TYPE_TTD:
                        case MSG_CONTENT_TYPE_IMG:
                        case MSG_CONTENT_TYPE_AUDIO:
                        case MSG_CONTENT_TYPE_VIDEO:
                        {
                            CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance]dbManagement] findResourceWithID:dbMsg.attachResID];
                            if (dbRes)
                            {
                                [groupMsg setResContentLength:dbRes.mediaTime];
                                NSString *resPath = [[[CPSystemEngine sharedInstance] resManager] getResourcePathWithRes:dbRes];
                                NSNumber *resFileSize = [CoreUtils getFileSizeWithName:resPath];
                                [groupMsg setResContentSize:resFileSize];
                                //                                [groupMsg setResContentSize:dbRes.fileSize];
                                [groupMsg setResource:dbRes.serverUrl];
                                if (msgType==MSG_CONTENT_TYPE_VIDEO)
                                {
                                    [groupMsg setResourceHeight:[NSNumber numberWithInt:480]];
                                    [groupMsg setResourceWidth:[NSNumber numberWithInt:360]];
                                    CPDBModelResource *dbResThub = [[[CPSystemEngine sharedInstance] dbManagement] findResourceVideoThumbImgWithObjID:dbRes.objID];
                                    if (dbResThub)
                                    {
                                        [groupMsg setResourceThumb:dbResThub.serverUrl];
                                    }
                                    else
                                    {
                                        [groupMsg setResourceThumb:@"11111"];
                                    }
                                }
                                if ([dbRes.mark integerValue]==MARK_DEFAULT)
                                {
                                    [groupMsg setXmppType:[NSNumber numberWithInt:XMPPMsgTypeGroupChat]];
                                    [[[CPSystemEngine sharedInstance] sysManager] sendXMPPGroupMsg:groupMsg];
                                }
                                else if([dbRes.mark integerValue]==MARK_UPLOAD)
                                {
                                    NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
                                    [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
                                    [[[CPSystemEngine sharedInstance] msgManager] addWillSendMsg:groupMsg andMsgID:reSendMsg.msgID];
                                }
                            }
                        }
                            break;
                        default:
                            break;
                    }
                }
                    break;
                default:
                    CPLogError(@"this msg group type error");
                    return;
            }
        }
    }
}

@end

