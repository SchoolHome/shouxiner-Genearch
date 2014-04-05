//
//  CPOperationHttpMsgSend.m
//  iCouple
//
//  Created by liangshuang on 10/12/12.
//
//

#import "CPOperationHttpMsgSend.h"
#import "CPSystemEngine.h"
#import "CPMsgManager.h"
#import "CPResManager.h"
#import "CPUIModelMessageGroup.h"
#import "CPUIModelUserInfo.h"
#import "CPLGModelAccount.h"
#import "CPUIModelMessage.h"
#import "CPUIModelMessageGroupMember.h"
#import "XMPPUserMessage.h"
#import "XMPPGroupMessage.h"
#import "CPDBModelResource.h"
#import "CPDBModelMessage.h"
#import "ModelConvertUtils.h"
#import "CPDBManagement.h"
#import "CPResManager.h"
#import "CPSystemManager.h"

//#import "AudioConverterOperation.h"

#import "CoreUtils.h"

#define notifyFileCafPath @"fileCafPath"
#define notifyFileAudioPath @"fileAudioPath"
#define notifyAudioIsTrans @"isTransAudio"

@implementation CPOperationHttpMsgSend
- (id) initWithMsg:(CPUIModelMessage *) sendMsg andMsgGroup:(CPUIModelMessageGroup *)msgGroup
{
    self = [super init];
    if (self)
    {
        uiMsg = sendMsg;
        uiMsgGroup = msgGroup;
        sendMsgType = SEND_MSG_TYPE_DEFAULT;
    }
    return self;
}
- (id) initWithMsg:(CPUIModelMessage *) sendMsg andMsgGroupID:(NSNumber *)msgGroupID
{
    self = [super init];
    if (self)
    {
        uiMsg = sendMsg;
        sendMsgGroupID = msgGroupID;
        sendMsgType = SEND_MSG_TYPE_ALARMED;
    }
    return self;
}
-(void)sendMsgText
{
    if (uiMsgGroup.memberList)
    {
        if ([uiMsgGroup.memberList count]==1)
        {
            CPUIModelUserInfo *uiUserInfo = [(CPUIModelMessageGroupMember *)[uiMsgGroup.memberList objectAtIndex:0] userInfo];
            if (uiUserInfo.name)
            {
                NSString *toName = [NSString stringWithFormat:@"%@%@",uiUserInfo.name,uiUserInfo.domain];
               
                CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
                
                NSString *fromName = [NSString stringWithFormat:@"%@@%@",myAccountModel.uid,myAccountModel.domain];
                NSString *sendMsg = uiMsg.msgText;
                CPLogInfo(@"%@,%@,%@",fromName,toName,sendMsg);
                if (fromName&&toName)
                {
                    XMPPUserMessage *xmppMsg = [[XMPPUserMessage alloc] init];
                    [xmppMsg setFrom:fromName];
                    [xmppMsg setTo:toName];
                    NSInteger uiMsgType = [uiMsg.contentType integerValue];
                    switch (uiMsgType)
                    {
                        case MSG_CONTENT_TYPE_TEXT:
                            [xmppMsg setMessage:sendMsg];
                            [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeText]];
                            break;
                        case MSG_CONTENT_TYPE_CQ:
                        case MSG_CONTENT_TYPE_CS:
                        case MSG_CONTENT_TYPE_MAGIC:
                        case MSG_CONTENT_TYPE_TTW:
                        case MSG_CONTENT_TYPE_TTD:
                            if (!uiMsg.petMsgID)
                            {
                                [uiMsg setPetMsgID:@"1"];
                            }
                            [xmppMsg setPetID:uiMsg.petMsgID];
                            [xmppMsg setResID:uiMsg.magicMsgID];
                            switch (uiMsgType)
                        {
                            case MSG_CONTENT_TYPE_CQ:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeFeeling]];
                                break;
                            case MSG_CONTENT_TYPE_CS:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeSound]];
                                break;
                            case MSG_CONTENT_TYPE_MAGIC:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeMagic]];
                                break;
                            case MSG_CONTENT_TYPE_TTW:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAsk]];
                                break;
                            case MSG_CONTENT_TYPE_TTD:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAnswer]];
                                break;
                            default:
                                break;
                        }
                            break;
                        case MSG_CONTENT_TYPE_ALARM_TEXT:
                        {
                            [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAlarm]];
                            [xmppMsg setMessage:sendMsg];
                            [xmppMsg setResourceWidth:[NSNumber numberWithInt:1]];
                            [xmppMsg setResourceHeight:uiMsg.isAlarmHidden];
                            [xmppMsg setResourceThumb:[CoreUtils getStringFormatWithNumber:uiMsg.alarmTime]];
                        }
                            break;
                        case MSG_CONTENT_TYPE_ALARMED_TEXT:
                            break;
                        default:
                            break;
                    }
                    NSNumber *newMsgID = [[[CPSystemEngine sharedInstance] msgManager] sendMsgWithMsgGroup:uiMsgGroup newMsg:uiMsg];
                    if ([uiMsg.contentType integerValue]==MSG_CONTENT_TYPE_ALARMED_TEXT)
                    {
                        return;
                    }
                    [xmppMsg setMessageID:newMsgID];
                    [xmppMsg setXmppType:[NSNumber numberWithInt:XMPPMsgTypeChat]];
                    [[[CPSystemEngine sharedInstance] sysManager] sendXMPPMsg:xmppMsg];
                }
            }
        }
    }
}
-(void)sendGroupMsgText
{
    if (uiMsgGroup.groupServerID)
    {
        NSString *toName = uiMsgGroup.groupServerID;
        CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
        NSString *fromName = [NSString stringWithFormat:@"%@@%@",myAccountModel.loginName,myAccountModel.domain];
        NSString *sendMsg = uiMsg.msgText;
        CPLogInfo(@"%@,%@,%@",fromName,toName,sendMsg);
        if (fromName&&toName)
        {
            XMPPGroupMessage *xmppMsg = [[XMPPGroupMessage alloc] init];
            [xmppMsg setFrom:fromName];
            [xmppMsg setTo:toName];
            NSInteger uiMsgType = [uiMsg.contentType integerValue];
            switch (uiMsgType)
            {
                case MSG_CONTENT_TYPE_TEXT:
                    [xmppMsg setMessage:sendMsg];
                    [xmppMsg setType:[NSNumber numberWithInt:GroupMessageTypeText]];
                    break;
                case MSG_CONTENT_TYPE_CQ:
                case MSG_CONTENT_TYPE_CS:
                case MSG_CONTENT_TYPE_MAGIC:
                case MSG_CONTENT_TYPE_TTW:
                case MSG_CONTENT_TYPE_TTD:
                    if (!uiMsg.petMsgID)
                    {
                        [uiMsg setPetMsgID:@"1"];
                    }
                    [xmppMsg setPetID:uiMsg.petMsgID];
                    [xmppMsg setResID:uiMsg.magicMsgID];
                    switch (uiMsgType)
                {
                    case MSG_CONTENT_TYPE_CQ:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeFeeling]];
                        break;
                    case MSG_CONTENT_TYPE_CS:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeSound]];
                        break;
                    case MSG_CONTENT_TYPE_MAGIC:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeMagic]];
                        break;
                    case MSG_CONTENT_TYPE_TTW:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAsk]];
                        break;
                    case MSG_CONTENT_TYPE_TTD:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAnswer]];
                        break;
                    default:
                        break;
                }
                    break;
                default:
                    break;
            }
            NSNumber *newMsgID = [[[CPSystemEngine sharedInstance] msgManager] sendMsgWithMsgGroup:uiMsgGroup newMsg:uiMsg];
            [xmppMsg setMessageID:newMsgID];
            [xmppMsg setXmppType:[NSNumber numberWithInt:XMPPMsgTypeGroupChat]];
            [[[CPSystemEngine sharedInstance] sysManager] sendXMPPMsg:xmppMsg];
        }
    }
}
-(void)sendMsgMediaWithMsgType:(NSInteger)msgType
{
    if (uiMsgGroup.memberList)
    {
        if ([uiMsgGroup.memberList count]==1)
        {
            CPUIModelUserInfo *uiUserInfo = [(CPUIModelMessageGroupMember *)[uiMsgGroup.memberList objectAtIndex:0] userInfo];
            if (uiUserInfo.name)
            {
                NSString *toName = [NSString stringWithFormat:@"%@%@",uiUserInfo.name,uiUserInfo.domain];
                CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
                NSString *fromName = [NSString stringWithFormat:@"%@@%@",myAccountModel.uid,myAccountModel.domain];
                NSString *sendMsg = uiMsg.msgText;
                CPDBModelMessage *dbMsg = [ModelConvertUtils uiMessageToDb:uiMsg];
                CPLogInfo(@"%@,%@,%@",fromName,toName,sendMsg);
                if (fromName&&toName)
                {
                    XMPPUserMessage *xmppMsg = [[XMPPUserMessage alloc] init];
                    [xmppMsg setFrom:fromName];
                    [xmppMsg setTo:toName];
                    [xmppMsg setMessage:sendMsg];
                    NSString *writeFileSuffix = nil;
                    NSInteger resType = 0;
                    NSString *mimeType = @"";
                    switch (msgType)
                    {
                        case MSG_CONTENT_TYPE_IMG:
                            [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeImage]];
                            writeFileSuffix = @"jpg";
                            resType = RESOURCE_FILE_TYPE_MSG_IMG;
                            mimeType = @"image/jpeg";
                            break;
                        case MSG_CONTENT_TYPE_AUDIO:
                            [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAudio]];
                            writeFileSuffix = @"amr";
                            resType = RESOURCE_FILE_TYPE_MSG_AUDIO;
                            mimeType = @"audio/amr";
                            break;
                        case MSG_CONTENT_TYPE_VIDEO:
                            [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeVideo]];
                            writeFileSuffix = @"mp4";
                            resType = RESOURCE_FILE_TYPE_MSG_VIDEO;
                            mimeType = @"video/mp4";
                            break;
                        case MSG_CONTENT_TYPE_CQ:
                        case MSG_CONTENT_TYPE_CS:
                        case MSG_CONTENT_TYPE_TTW:
                        case MSG_CONTENT_TYPE_TTD:
                        case MSG_CONTENT_TYPE_ALARM_AUDIO:
                            if (!uiMsg.petMsgID)
                            {
                                [uiMsg setPetMsgID:@"1"];
                            }
                            [xmppMsg setPetID:uiMsg.petMsgID];
                            [xmppMsg setResID:uiMsg.magicMsgID];
                            writeFileSuffix = @"amr";//amr
                            resType = RESOURCE_FILE_TYPE_MSG_AUDIO;
                            mimeType = @"audio/amr";
                            switch ([uiMsg.contentType integerValue])
                        {
                            case MSG_CONTENT_TYPE_CQ:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeFeeling]];
                                break;
                            case MSG_CONTENT_TYPE_CS:
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeSound]];
                                break;
                            case MSG_CONTENT_TYPE_TTW:
                            {
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAsk]];
                                //NSString *uuidAsk = [CoreUtils getUUID];
                                NSString *uuidAsk = [[CoreUtils getLongFormatWithNowDate]stringValue];
                                NSLog(@"%@",uuidAsk);
                                [xmppMsg setUuid:uuidAsk];
                                [dbMsg setUuidAsk:uuidAsk];
                            }
                                break;
                            case MSG_CONTENT_TYPE_TTD:
                            {
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAnswer]];
                                [xmppMsg setUuid:uiMsg.uuidAsk];
                                NSLog(@"%@",uiMsg.uuidAsk);
                                NSString *toUserName = [ModelConvertUtils getAccountNameWithName:uiMsg.msgSenderName];
                                CPDBModelUserInfo *existUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] getUserInfoByCachedWithName:toUserName];
                                if (existUserInfo)
                                {
                                    [xmppMsg setTo:[NSString stringWithFormat:@"%@%@",existUserInfo.name,existUserInfo.domain]];
                                }
                            }
                                break;
                            case MSG_CONTENT_TYPE_ALARM_AUDIO:
                            {
                                [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAlarm]];
                                [xmppMsg setResourceWidth:[NSNumber numberWithInt:2]];
                                [xmppMsg setResourceHeight:uiMsg.isAlarmHidden];
                                [xmppMsg setResourceThumb:[CoreUtils getStringFormatWithNumber:uiMsg.alarmTime]];
                            }
                                break;
                            default:
                                break;
                        }
                            break;
                        default:
                            CPLogError(@"error msg type %d",msgType);
                            mimeType = @"application/octet-stream";
                            break;
                    }
                    if (!writeFileSuffix)
                    {
                        return;
                    }
                    NSString *writeFileName = [NSString stringWithFormat:@"%@.%@",[CoreUtils getUUID],writeFileSuffix];
                    BOOL isSave = NO;
                    NSString *filePath = [NSString stringWithFormat:@"%@/msg/",[[[CPSystemEngine sharedInstance] accountModel] loginName]];
                    [CoreUtils createPath:filePath];
                    if (uiMsg.msgData)
                    {
                        isSave = [CoreUtils writeToFileWithData:uiMsg.msgData file_name:writeFileName andPath:filePath];
                        NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
                        if ([audioFilePath rangeOfString:@".amr"].length>1)
                        {
                            [uiMsg setMediaTime:[CoreUtils getMediaTimeWithUrl:[NSURL fileURLWithPath:audioFilePath]]];
                        }
                    }
                    else if(resType == RESOURCE_FILE_TYPE_MSG_VIDEO&&uiMsg.videoUrl)
                    {
                        NSString *dstFilePath = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
                        NSDictionary *resDic = [CoreUtils convertMpeg4WithUrl:uiMsg.videoUrl
                                                               andDstFilePath:dstFilePath];
                        isSave = [[resDic objectForKey:convertMpeg4IsSucess] boolValue];
                        [uiMsg setMediaTime:[resDic objectForKey:convertMpeg4MediaTime]];
                        [uiMsg setFileSize:[resDic objectForKey:convertMpeg4FileSize]];

                        //warning modify the width and height etc
                        [xmppMsg setResourceHeight:[NSNumber numberWithInt:480]];
                        [xmppMsg setResourceWidth:[NSNumber numberWithInt:360]];
                        [xmppMsg setResourceThumb:@"11111"];
                    }
                    else if (resType == RESOURCE_FILE_TYPE_MSG_AUDIO&&uiMsg.filePath)
                    {
                        NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
                        if ([audioFilePath length]>4)
                        {
                            NSString *filePrePath = [audioFilePath substringToIndex:audioFilePath.length-4];
                            NSString *fileCafPath = [NSString stringWithFormat:@"%@.caf",filePrePath];
                            isSave = [CoreUtils moveFileWithSrcPath:uiMsg.filePath andDstPath:fileCafPath];
                            [uiMsg setMediaTime:[CoreUtils getMediaTimeWithUrl:[NSURL fileURLWithPath:fileCafPath]]];
                            //cq bs   cs&ttw bbs
                            NSInteger transType = 0;
                            if(msgType==MSG_CONTENT_TYPE_CS)
                            {
                                transType = CONVERT_PCM_TYPE_CS;
                            }
                            else if(msgType==MSG_CONTENT_TYPE_CQ)
                            {
                                transType = CONVERT_PCM_TYPE_CQ;
                            }
                            else if(msgType==MSG_CONTENT_TYPE_TTW)
                            {
                                transType = CONVERT_PCM_TYPE_TTW;
                            }else if (msgType == MSG_CONTENT_TYPE_ALARM_AUDIO){
                                transType = CONVERT_PCM_TYPE_ALARM;
                            }
                            
                            NSMutableDictionary *notifyDic = [[NSMutableDictionary alloc] init];
                            [notifyDic setObject:fileCafPath forKey:notifyFileCafPath];
                            [notifyDic setObject:audioFilePath forKey:notifyFileAudioPath];
                            [notifyDic setObject:[NSNumber numberWithInteger:transType] forKey:notifyAudioIsTrans];
                            [self blockConvertAudioWithData:notifyDic];
                            //                            [self performSelectorInBackground:@selector(notifyConvertAudioWithData:) withObject:notifyDic];
                            //                            [self performSelectorOnMainThread:@selector(notifyConvertAudioWithData:) withObject:notifyDic waitUntilDone:YES];
                            //                            isSave = [CoreUtils convertPCM:fileCafPath toAMR:audioFilePath isTrans:isTrans];
                        }
                    }
                    if (isSave)
                    {
                        CPDBModelResource *dbRes = [[CPDBModelResource alloc] init];
                        [dbRes setFileName:writeFileName];
                        [dbRes setFilePrefix:filePath];
                        [dbRes setType:[NSNumber numberWithInt:resType]];
                        [dbRes setObjType:[NSNumber numberWithInt:RESOURCE_FILE_CP_TYPE_MSG]];
                        [dbRes setMark:[NSNumber numberWithInt:MARK_UPLOAD]];
                        //
                        if (uiMsg.mediaTime)
                        {
                            NSInteger mediaTime = [uiMsg.mediaTime integerValue];
                            [dbRes setMediaTime:[NSNumber numberWithInt:mediaTime]];
                            [xmppMsg setResContentLength:[NSNumber numberWithInt:mediaTime]];
                        }
                        else
                        {
                            [dbRes setMediaTime:[NSNumber numberWithInt:0]];
                            [xmppMsg setResContentLength:[NSNumber numberWithInt:0]];
                        }
                        if (uiMsg.fileSize)
                        {
                            [dbRes setFileSize:uiMsg.fileSize];
                            [xmppMsg setResContentSize:uiMsg.fileSize];
                        }
                        else
                        {
                            [dbRes setFileSize:[NSNumber numberWithInt:0]];
                            [xmppMsg setResContentSize:[NSNumber numberWithInt:0]];
                        }
                        [dbRes setMimeType:mimeType];
                        
                        NSNumber *resID = [[[CPSystemEngine sharedInstance] dbManagement] insertResource:dbRes];
                        
                        
                        if (uiMsgGroup.msgGroupID&&[uiMsgGroup.msgGroupID longLongValue]>0)
                        {
                            [dbMsg setMsgGroupID:uiMsgGroup.msgGroupID];
                        }
                        else
                        {
                            return;
                        }
                        [dbMsg setAttachResID:resID];
                        [dbMsg setFlag:[NSNumber numberWithInt:MSG_FLAG_SEND]];
                        [dbMsg setSendState:[NSNumber numberWithInt:MSG_SEND_STATE_SENDING]];
                        [dbMsg setDate:[CoreUtils getLongFormatWithNowDate]];
                        [dbMsg setMsgOwnerName:[[CPSystemEngine sharedInstance] getAccountName]];
                        [dbMsg setMsgSenderID:[[CPSystemEngine sharedInstance] getAccountName]];
                        //
                        if ([uiMsg isAlarmMsg])
                        {
                            [dbMsg setMobile:[uiMsg.alarmTime stringValue]];
                            [dbMsg setLocationInfo:[uiMsg.isAlarmHidden stringValue]];
                        }
                        NSNumber *newMsgID = [[[CPSystemEngine sharedInstance] dbManagement] insertMessage:dbMsg];
                        [xmppMsg setMessageID:newMsgID];
                        [[[CPSystemEngine sharedInstance] dbManagement] updateResourceObjIDWithResID:resID obj_id:newMsgID];
                        CPDBModelResource *newDbRes = [[[CPSystemEngine sharedInstance] dbManagement] findResourceWithID:resID];
                        if (newDbRes)
                        {
                            [[[CPSystemEngine sharedInstance] dbManagement] addResCachedWithRes:newDbRes];
                        }
                        NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
                        
                        [[[CPSystemEngine sharedInstance] msgManager] addWillSendMsg:xmppMsg andMsgID:newMsgID];
                        
                        [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
                        
                        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupByAppendMsgWithNewMsgID:newMsgID];
                        //                        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:uiMsgGroup.msgGroupID];
                        
                        
                        //[[[CPSystemEngine sharedInstance] resManager] uploadWithRes:dbRes up_data:];
                    }
                    
                    //[[[CPSystemEngine sharedInstance] xmppEngine] sendInstantMessage:xmppMsg];
                }
            }
        }
    }
}
-(void)notifyConvertAudioWithData:(NSDictionary *)dic
{
    NSString *fileCafPath = [dic objectForKey:notifyFileCafPath];
    NSString *audioFilePath = [dic objectForKey:notifyFileAudioPath];
    NSInteger transType = [[dic objectForKey:notifyAudioIsTrans] integerValue];
    [CoreUtils convertPCM:fileCafPath toAMR:audioFilePath transType:transType];
}

-(void)blockConvertAudioWithData:(NSDictionary *)dicData
{
    __block NSDictionary *dic = dicData;
    dispatch_block_t updateTagBlock = ^{
        NSString *fileCafPath = [dic objectForKey:notifyFileCafPath];
        NSString *audioFilePath = [dic objectForKey:notifyFileAudioPath];
        NSString *audioFilePathTemp = [NSString stringWithFormat:@"%@tmp",audioFilePath];
        NSInteger transType = [[dic objectForKey:notifyAudioIsTrans] integerValue];
        [CoreUtils convertPCM:fileCafPath toAMR:audioFilePathTemp transType:transType];
        [CoreUtils moveFileWithSrcPath:audioFilePathTemp andDstPath:audioFilePath];
        [[[CPSystemEngine sharedInstance] resManager] excuteResourceCached];
    };
    dispatch_async(dispatch_get_global_queue(0, 0), updateTagBlock);
}
-(void)sendGroupMsgMediaWithMsgType:(NSInteger)msgType
{
    if (uiMsgGroup.groupServerID)
    {
        NSString *toName = uiMsgGroup.groupServerID;
        CPLGModelAccount *myAccountModel = [[CPSystemEngine sharedInstance] accountModel];
        NSString *fromName = [NSString stringWithFormat:@"%@@%@",myAccountModel.loginName,myAccountModel.domain];
        NSString *sendMsg = uiMsg.msgText;
        CPLogInfo(@"%@,%@,%@",fromName,toName,sendMsg);
        if (fromName&&toName)
        {
            XMPPGroupMessage *xmppMsg = [[XMPPGroupMessage alloc] init];
            [xmppMsg setFrom:fromName];
            [xmppMsg setTo:toName];
            [xmppMsg setMessage:sendMsg];
            NSString *writeFileSuffix = nil;
            NSInteger resType = 0;
            NSString *mimeType = @"";
            switch (msgType)
            {
                case MSG_CONTENT_TYPE_IMG:
                    [xmppMsg setType:[NSNumber numberWithInt:GroupMessageTypeImage]];
                    writeFileSuffix = @"jpg";
                    resType = RESOURCE_FILE_GROUP_MSG_IMG;
                    mimeType = @"image/jpeg";
                    break;
                case MSG_CONTENT_TYPE_AUDIO:
                    [xmppMsg setType:[NSNumber numberWithInt:GroupMessageTypeAudio]];
                    writeFileSuffix = @"amr";//amr
                    resType = RESOURCE_FILE_GROUP_MSG_AUDIO;
                    mimeType = @"audio/amr";
                    break;
                case MSG_CONTENT_TYPE_VIDEO:
                    [xmppMsg setType:[NSNumber numberWithInt:GroupMessageTypeVideo]];
                    writeFileSuffix = @"mp4";
                    resType = RESOURCE_FILE_GROUP_MSG_VIDEO;
                    mimeType = @"video/mp4";
                    break;
                case MSG_CONTENT_TYPE_CQ:
                case MSG_CONTENT_TYPE_CS:
                case MSG_CONTENT_TYPE_TTW:
                case MSG_CONTENT_TYPE_TTD:
                    if (!uiMsg.petMsgID)
                    {
                        [uiMsg setPetMsgID:@"1"];
                    }
                    [xmppMsg setPetID:uiMsg.petMsgID];
                    [xmppMsg setResID:uiMsg.magicMsgID];
                    writeFileSuffix = @"amr";
                    resType = RESOURCE_FILE_GROUP_MSG_AUDIO;
                    mimeType = @"audio/amr";
                    switch ([uiMsg.contentType integerValue])
                {
                    case MSG_CONTENT_TYPE_CQ:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeFeeling]];
                        break;
                    case MSG_CONTENT_TYPE_CS:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeSound]];
                        break;
                    case MSG_CONTENT_TYPE_TTW:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAsk]];
                        break;
                    case MSG_CONTENT_TYPE_TTD:
                        [xmppMsg setType:[NSNumber numberWithInt:UserMessageTypeAnswer]];
                        break;
                    default:
                        break;
                }
                    break;
                default:
                    CPLogError(@"error msg type %d",msgType);
                    mimeType = @"application/octet-stream";
                    break;
            }
            if (!writeFileSuffix)
            {
                return;
            }
            NSString *writeFileName = [NSString stringWithFormat:@"%@.%@",[CoreUtils getUUID],writeFileSuffix];
            BOOL isSave = NO;
            NSString *filePath = [NSString stringWithFormat:@"%@/msg/",[[[CPSystemEngine sharedInstance] accountModel] loginName]];
            [CoreUtils createPath:filePath];
            if (uiMsg.msgData)
            {
                isSave = [CoreUtils writeToFileWithData:uiMsg.msgData file_name:writeFileName andPath:filePath];
                NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
                if ([audioFilePath rangeOfString:@".amr"].length>1)
                {
                    [uiMsg setMediaTime:[CoreUtils getMediaTimeWithUrl:[NSURL fileURLWithPath:audioFilePath]]];
                }
            }
            else if(resType == RESOURCE_FILE_GROUP_MSG_VIDEO&&uiMsg.videoUrl)
            {
                NSString *dstFilePath = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
                NSDictionary *resDic = [CoreUtils convertMpeg4WithUrl:uiMsg.videoUrl
                                                       andDstFilePath:dstFilePath];
                isSave = [[resDic objectForKey:convertMpeg4IsSucess] boolValue];
                [uiMsg setMediaTime:[resDic objectForKey:convertMpeg4MediaTime]];
                [uiMsg setFileSize:[resDic objectForKey:convertMpeg4FileSize]];
//warning modify the width and height etc
                [xmppMsg setResourceHeight:[NSNumber numberWithInt:480]];
                [xmppMsg setResourceWidth:[NSNumber numberWithInt:360]];
                [xmppMsg setResourceThumb:@"11111"];
            }
            else if (resType == RESOURCE_FILE_GROUP_MSG_AUDIO&&uiMsg.filePath)
            {
                NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
                if ([audioFilePath length]>4)
                {
                    NSString *filePrePath = [audioFilePath substringToIndex:audioFilePath.length-4];
                    NSString *fileCafPath = [NSString stringWithFormat:@"%@.caf",filePrePath];
                    isSave = [CoreUtils moveFileWithSrcPath:uiMsg.filePath andDstPath:fileCafPath];
                    [uiMsg setMediaTime:[CoreUtils getMediaTimeWithUrl:[NSURL fileURLWithPath:fileCafPath]]];
                    //cq  bbs   cs&ttw bs
                    NSInteger transType = 0;
                    if(msgType==MSG_CONTENT_TYPE_CS)
                    {
                        transType = CONVERT_PCM_TYPE_CS;
                    }
                    else if(msgType==MSG_CONTENT_TYPE_CQ)
                    {
                        transType = CONVERT_PCM_TYPE_CQ;
                    }
                    else if(msgType==MSG_CONTENT_TYPE_TTW)
                    {
                        transType = CONVERT_PCM_TYPE_TTW;
                    }else if (msgType == MSG_CONTENT_TYPE_ALARM_AUDIO){
                        transType = CONVERT_PCM_TYPE_ALARM;
                    }
                    NSMutableDictionary *notifyDic = [[NSMutableDictionary alloc] init];
                    [notifyDic setObject:fileCafPath forKey:notifyFileCafPath];
                    [notifyDic setObject:audioFilePath forKey:notifyFileAudioPath];
                    [notifyDic setObject:[NSNumber numberWithInteger:transType] forKey:notifyAudioIsTrans];
                    [self blockConvertAudioWithData:notifyDic];
                    
                    //                    isSave = [CoreUtils convertPCM:fileCafPath toAMR:audioFilePath isTrans:isTrans];
                }
            }
            if (isSave)
            {
                CPDBModelResource *dbRes = [[CPDBModelResource alloc] init];
                [dbRes setFileName:writeFileName];
                [dbRes setFilePrefix:filePath];
                [dbRes setType:[NSNumber numberWithInt:resType]];
                [dbRes setObjType:[NSNumber numberWithInt:RESOURCE_FILE_CP_TYPE_MSG]];
                [dbRes setMark:[NSNumber numberWithInt:MARK_UPLOAD]];
                //[dbRes setMediaTime:uiMsg.mediaTime];
                if (uiMsg.mediaTime)
                {
                    NSInteger mediaTime = [uiMsg.mediaTime integerValue];
                    [dbRes setMediaTime:[NSNumber numberWithInt:mediaTime]];
                    [xmppMsg setResContentLength:[NSNumber numberWithInt:mediaTime]];
                }
                else
                {
                    [dbRes setMediaTime:[NSNumber numberWithInt:0]];
                    [xmppMsg setResContentLength:[NSNumber numberWithInt:0]];
                }
                if (uiMsg.fileSize)
                {
                    [dbRes setFileSize:uiMsg.fileSize];
                    [xmppMsg setResContentSize:uiMsg.fileSize];
                }
                else
                {
                    [dbRes setFileSize:[NSNumber numberWithInt:0]];
                    [xmppMsg setResContentSize:[NSNumber numberWithInt:0]];
                }
                
                [dbRes setMimeType:mimeType];
                
                NSNumber *resID = [[[CPSystemEngine sharedInstance] dbManagement] insertResource:dbRes];
                
                
                CPDBModelMessage *dbMsg = [ModelConvertUtils uiMessageToDb:uiMsg];
                if (uiMsgGroup.msgGroupID&&[uiMsgGroup.msgGroupID longLongValue]>0)
                {
                    [dbMsg setMsgGroupID:uiMsgGroup.msgGroupID];
                }
                else
                {
                    return;
                }
                [dbMsg setAttachResID:resID];
                [dbMsg setFlag:[NSNumber numberWithInt:MSG_FLAG_SEND]];
                [dbMsg setSendState:[NSNumber numberWithInt:MSG_SEND_STATE_SENDING]];
                [dbMsg setDate:[CoreUtils getLongFormatWithNowDate]];
                [dbMsg setMsgOwnerName:[[CPSystemEngine sharedInstance] getAccountName]];
                [dbMsg setMsgSenderID:[[CPSystemEngine sharedInstance] getAccountName]];
                NSNumber *newMsgID = [[[CPSystemEngine sharedInstance] dbManagement] insertMessage:dbMsg];
                [xmppMsg setMessageID:newMsgID];
                [[[CPSystemEngine sharedInstance] dbManagement] updateResourceObjIDWithResID:resID obj_id:newMsgID];
                CPDBModelResource *newDbRes = [[[CPSystemEngine sharedInstance] dbManagement] findResourceWithID:resID];
                if (newDbRes)
                {
                    [[[CPSystemEngine sharedInstance] dbManagement] addResCachedWithRes:newDbRes];
                }
                NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
                
                [[[CPSystemEngine sharedInstance] msgManager] addWillSendMsg:xmppMsg andMsgID:newMsgID];
                
                [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
                
                [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupByAppendMsgWithNewMsgID:newMsgID];
                
                //                [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:uiMsgGroup.msgGroupID];
                
                
                //[[[CPSystemEngine sharedInstance] resManager] uploadWithRes:dbRes up_data:];
            }
            
            //[[[CPSystemEngine sharedInstance] xmppEngine] sendInstantMessage:xmppMsg];
        }
    }
}

-(void)main
{
    @autoreleasepool
    {
        if (sendMsgType==SEND_MSG_TYPE_ALARMED)
        {
            CPUIModelMessageGroup *uiTempMsgGroup = [[CPUIModelMessageGroup alloc] init];
            [uiTempMsgGroup setMsgGroupID:sendMsgGroupID];
            [[[CPSystemEngine sharedInstance] msgManager] sendMsgAlarmWithMsgGroup:uiTempMsgGroup
                                                                            newMsg:uiMsg];
            return;
        }
        NSInteger msgType = [uiMsg.contentType integerValue];
        switch (msgType)
        {
            case MSG_CONTENT_TYPE_MAGIC:
            case MSG_CONTENT_TYPE_TEXT:
            case MSG_CONTENT_TYPE_ALARM_TEXT:
            case MSG_CONTENT_TYPE_ALARMED_TEXT:
            {
                if ([uiMsgGroup.type integerValue]==MSG_GROUP_TYPE_SINGLE||[uiMsgGroup.type integerValue]==MSG_GROUP_TYPE_SINGLE_PRE)
                {
                    [self sendMsgText];
                }
                else
                {
                    [self sendGroupMsgText];
                }
            }
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
                if ([uiMsgGroup.type integerValue]==MSG_GROUP_TYPE_SINGLE||[uiMsgGroup.type integerValue]==MSG_GROUP_TYPE_SINGLE_PRE)
                {
                    [self sendMsgMediaWithMsgType:msgType];
                }
                else
                {
                    [self sendGroupMsgMediaWithMsgType:msgType];
                }
            }
                break;
            default:
                break;
        }
        
    }
}

@end
