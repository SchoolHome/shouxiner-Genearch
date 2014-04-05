//
//  CPOperationMsgUpdate.m
//  iCouple
//
//  Created by yong wei on 12-5-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationMsgUpdate.h"

#import "CPDBModelMessage.h"
#import "CPSystemEngine.h"
#import "CPResManager.h"
#import "CPUIModelMessage.h"
#import "CPDBManagement.h"
#import "CPMsgManager.h"
#import "CPUIModelMessageGroup.h"
#import "CPUIModelManagement.h"
#import "CPUserManager.h"
@implementation CPOperationMsgUpdate
- (id) initWithMsg:(CPUIModelMessage *)uiMsg andType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        uiMsgUpdate = uiMsg;
        updateType = type;
    }
    return self;
}
- (id) initWithMsgGroup:(CPUIModelMessageGroup *)uiMsgGroup
{
    self = [super init];
    if (self)
    {
        uiMsgGroupUpdate = uiMsgGroup;
        updateType = MSG_UPDATE_TYPE_MARK_READED;
    }
    return self;
}
- (id) initWithMsg:(CPUIModelMessage *)uiMsg andType:(NSInteger)type andActionType:(NSInteger)actionType
{
    self = [super init];
    if (self)
    {
        uiMsgUpdate = uiMsg;
        updateType = MSG_UPDATE_TYPE_SYS_REQ_ACTION;
        reqActionType = actionType;
    }
    return self;
}
-(void)updateMsgWithDownloadRes
{
    NSNumber *resID = uiMsgUpdate.attachResID;
    if (!resID)
    {
        CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:uiMsgUpdate.msgID];
        resID = dbMsg.attachResID;
    }
    if (resID)
    {
        CPDBModelResource *dbRes = [[[CPSystemEngine sharedInstance] dbManagement] findResourceWithID:resID];
        [[[CPSystemEngine sharedInstance] dbManagement] updateResourceWillDownloadWithID:dbRes.resID];
        
        NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
        [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
        
        CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:uiMsgUpdate.msgID];
        if (dbMsg.msgGroupID)
        {
            [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID andStatus:[NSNumber numberWithInt:MSG_SEND_STATE_DOWNING]];
            [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
            [[CPSystemEngine sharedInstance] updateTagByMsgGroupMsgReload];
        }

    }
}
-(void)updateMsgGroupReaded
{
//    if (uiMsgGroupUpdate.msgGroupID)
    {
        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupInfoReadedWithMsgGroup:uiMsgGroupUpdate];
    }
}
-(void)updateMsgAudioReaded
{
    NSNumber *updateMsgGroupID = uiMsgUpdate.msgGroupID;
    if (!updateMsgGroupID) 
    {
        CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:uiMsgUpdate.msgID];
        updateMsgGroupID = dbMsg.msgGroupID;
    }
    [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:uiMsgUpdate.msgID 
                                                              andStatus:[NSNumber numberWithInt:MSG_STATE_AUDIO_READED]];
    [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:updateMsgGroupID];
//    [[CPSystemEngine sharedInstance] updateTagByMsgGroupMsgReload];
}
-(void)excuteSysMsgReqAction
{
    CPUIModelSysMessageReq *sysMsg = [uiMsgUpdate getSysMsgReq];
//    if (sysMsg.reqID)
//    {
//        [[[CPSystemEngine sharedInstance] userManager] answerRequestWithReqID:[sysMsg.reqID stringValue] 
//                                                                      andFlag:reqActionType 
//                                                                andContextObj:uiMsgUpdate];
//        [[[CPSystemEngine sharedInstance] userManager] setResponseActionUserName:sysMsg.userName];
//    }
//    else 
//    {
//        CPLogError(@"sys msg is nil");
//    }
    CPDBModelMessage *dbMsg = [[[CPSystemEngine sharedInstance] dbManagement] findMessageWithID:uiMsgUpdate.msgID];
    if (dbMsg.msgGroupID)
    {
        NSInteger msgContentType = [dbMsg.contentType integerValue];
        if (reqActionType==REQ_FLAG_REFUSE)
        {
            msgContentType = msgContentType|MSG_CONTENT_TYPE_SYS_ADD_REQ_IGNORE;
        }
        else 
        {
            msgContentType = msgContentType|MSG_CONTENT_TYPE_SYS_ADD_REQ_ACCEPT;
            [[[CPSystemEngine sharedInstance] msgManager] sendAutoMsgByFriendApplyReqWithUserName:sysMsg.userName
                                                                                     andApplyType:[sysMsg.applyType integerValue]];
        }
        [dbMsg setContentType:[NSNumber numberWithInt:msgContentType]];
        [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithID:dbMsg.msgID obj:dbMsg];
        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:dbMsg.msgGroupID];
        [[CPSystemEngine sharedInstance] updateTagByMsgGroupMsgReload];
    }
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc] init];
    [resDic setObject:[NSNumber numberWithInt:RES_CODE_SUCESS] forKey:response_action_res_code];
    [[CPSystemEngine sharedInstance] updateTagByResponseActionWithDic:resDic];
}
-(void)main
{
    @autoreleasepool 
    {
        switch (updateType)
        {
            case MSG_UPDATE_TYPE_DN_RES:
                [self updateMsgWithDownloadRes];
                break;
            case MSG_UPDATE_TYPE_MARK_READED:
                [self updateMsgGroupReaded];
                break;
            case MSG_UPDATE_TYPE_AUDIO_READED:
                [self updateMsgAudioReaded];
                break;
            case MSG_UPDATE_TYPE_SYS_REQ_ACTION:
                [self excuteSysMsgReqAction];
                break;
            default:
                break;
        }
    }
}

@end
