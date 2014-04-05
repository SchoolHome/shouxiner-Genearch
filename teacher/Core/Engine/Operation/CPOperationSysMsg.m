
//
//  CPOperationSysMsg.m
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationSysMsg.h"
#import "XMPPSystemMessage.h"
#import "CPUIModelMessage.h"
#import "CPDBModelMessage.h"
#import "CPSystemEngine.h"
#import "CPMsgManager.h"
#import "CPDBManagement.h"
#import "CPDBModelUserInfo.h"
#import "ModelConvertUtils.h"
#import "CPDBManagement.h"
#import "CPUserManager.h"
#import "CPSystemManager.h"
@implementation CPOperationSysMsg
- (id) initWithSys:(NSArray *)sysMsgs
{
    self = [super init];
    if (self)
    {
        sysMsgArray = sysMsgs;
    }
    return self;
}
-(void)saveFriendCommendWithSysMsg:(XMPPSystemMessage *)sys
{
    CPDBModelUserInfo *dbUserInfo = [[CPDBModelUserInfo alloc] init];
    [dbUserInfo setName:[ModelConvertUtils getAccountNameWithName:sys.uName]];
    [dbUserInfo setDomain:[ModelConvertUtils getDomainWithName:sys.uName]];
    [dbUserInfo setNickName:sys.nickName];
    [dbUserInfo setMobileNumber:sys.phnum];
    [dbUserInfo setType:[NSNumber numberWithInt:USER_RELATION_COMMEND]];
    CPDBModelUserInfo *oldUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] findUserInfoWithAccount:dbUserInfo.name];
    if (oldUserInfo&&oldUserInfo.userInfoID)
    {
        return;
    }
    NSNumber *dbUserID = [[[CPSystemEngine sharedInstance] dbManagement]  insertUserInfo:dbUserInfo];
    [[[CPSystemEngine sharedInstance] userManager] addUserCommendListWithUserID:dbUserID];
}
-(void)excuteSysMsg:(XMPPSystemMessage *)sys
{
    NSInteger sysType = [sys.type integerValue];
    NSInteger msgType = 0;
    NSString *msgText = sys.content;
    switch (sysType)
    {
        case SystemMessageTypeFriendRecommend:
        {
            msgType = MSG_CONTENT_TYPE_SYS_RECOMMEND;
            if ([[[CPSystemEngine sharedInstance] dbManagement] findMessageWithSendID:sys.uName 
                                                                       andContentType:[NSNumber numberWithInt:msgType]])
            {
                return;
            }
            [self saveFriendCommendWithSysMsg:sys];
            NSMutableString *msgTextString = [[NSMutableString alloc] init];
            if (sys.nickName)
            {
                [msgTextString appendString:sys.nickName];
            }
            CPDBModelContact *dbContact = [[[CPSystemEngine sharedInstance] dbManagement] getContactWithMobile:sys.phnum];
            if (dbContact.fullName)
            {
                [msgTextString appendFormat:@"（%@）",dbContact.fullName];
            }
            [msgTextString appendString:NSLocalizedString(@"AutoMsgSysCommendFriend",nil)];
            msgText = msgTextString;
        }
            break;
        case SystemMessageTypeAddFriendRequest:
            msgType = MSG_CONTENT_TYPE_SYS_ADD_REQ;
            break;
        case SystemMessageTypeAddFriendResponse:
            msgType = MSG_CONTENT_TYPE_SYS_ADD_RES;
            break;
        case SystemMessageTypeRelationDown:
            msgType = MSG_CONTENT_TYPE_SYS;
            
            /********************add relationDel KVO by wang shuo*************************/
            // 非朋友
            if ([sys.toLevel intValue] == 77) {
                [[CPSystemEngine sharedInstance] updateTagByUserRelationDel];
            }
            /********************add relationDel KVO by wang shuo*************************/
            break;
        case SystemMessageTypeUnknown:
            msgType = MSG_CONTENT_TYPE_UNKNOWN;
            msgText = NSLocalizedString(@"AutoMsgUpdateMsg",nil);
            break;
        case SystemMessageTypeAck:
            msgType = MSG_CONTENT_TYPE_ACK;
            break;
        default:
            msgType = MSG_CONTENT_TYPE_SYS;
            break;
    }
    NSString *fromUserAccount = [ModelConvertUtils getAccountNameWithName:sys.from];
    //NSString *toUserAccount = userMsg.to;
    NSNumber *msgGroupID = [[[CPSystemEngine sharedInstance] msgManager] getMsgGroupIdWithUserName:fromUserAccount];
    NSNumber *newMsgID = nil;
//    if (msgGroupID)
    {
        CPDBModelMessage *dbMsg = [[CPDBModelMessage alloc] init];
        [dbMsg setMsgGroupID:msgGroupID];
        [dbMsg setMsgText:msgText];
        [dbMsg setContentType:[NSNumber numberWithInt:msgType]];
        [dbMsg setFlag:[NSNumber numberWithInt:MSG_FLAG_RECEIVE]];
        [dbMsg setDate:[CoreUtils getLongFormatWithNowDate]];
        [dbMsg setSendState:[NSNumber numberWithInt:MSG_SEND_STATE_DEFAULT]];
        [dbMsg setIsReaded:[NSNumber numberWithInt:MSG_READ_STATUS_IS_NOT_READ]];
        [dbMsg setBodyContent:sys.bodyString];
        [dbMsg setMsgOwnerName:fromUserAccount];
        [dbMsg setMsgSenderID:sys.uName];
        newMsgID = [[[CPSystemEngine sharedInstance] dbManagement] insertMessage:dbMsg];
        if (newMsgID && msgType != MSG_CONTENT_TYPE_ACK)
        {
            [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupByAppendMsgWithNewMsgID:newMsgID];
        }
    }
//    else 
//    {
//        CPLogError(@"receive sys msg, put msg ,error ,has no this msg group");
//    }
}
-(void)excuteSysMsgRelationUpdate:(XMPPSystemMessage *)sys
{
    [[[CPSystemEngine sharedInstance] sysManager] getFriendsByTimeStampCached];
    //收到同意的回应，只有同意的时候才会需要处理; 拒绝的情况 只处理couple和夫妻的情况
    BOOL isAccept = [sys.isAccept boolValue];
    if (isAccept)
    {
        [[[CPSystemEngine sharedInstance] msgManager] sendAutoMsgByFriendApplyWithUserName:sys.uName
                                                                              andApplyType:[sys.applyType integerValue]];
    }
    else 
    {
        NSInteger sysApplyType = [sys.applyType integerValue];
        switch (sysApplyType) 
        {
            case SYS_MSG_APPLY_TYPE_COMMON:
            case SYS_MSG_APPLY_TYPE_CLOSER:
            case SYS_MSG_APPLY_TYPE_LOVE:
                break;
            case SYS_MSG_APPLY_TYPE_COUPLE:
            case SYS_MSG_APPLY_TYPE_MARRIED:
            {
                [self excuteSysMsg:sys];
            }
                break;    
            default:
                break;
        }
    }
}
-(void)excuteSysMsgMatchLove:(XMPPSystemMessage *)sys
{
    NSString *userName = [ModelConvertUtils getAccountNameWithName:sys.uName];
    CPDBModelMessageGroup *dbMsgGroup = [[[CPSystemEngine sharedInstance] dbManagement] getExistMsgGroupWithUserName:userName];
    if (dbMsgGroup.msgGroupID&&sys.content)
    {
        CPDBModelMessage *newDbMsg = [[CPDBModelMessage alloc] init];
        [newDbMsg setMsgText:sys.content];
        [newDbMsg setMobile:@"1"];
        [[[CPSystemEngine sharedInstance] msgManager] sendAutoMsgTextWithMsgGroupID:dbMsgGroup.msgGroupID newMsg:newDbMsg];
    }
    else 
    {
        CPLogError(@"%@",sys.bodyString);
    }
}
-(void)main
{
    @autoreleasepool 
    {
        for(XMPPSystemMessage *xmppSysMsg in sysMsgArray)
        {
            CPLogInfo(@"xmpp sys content is %@",xmppSysMsg.content);
            NSInteger sysType = [xmppSysMsg.type integerValue];
            switch (sysType)
            {
                case SystemMessageTypeAck:
                case SystemMessageTypeFriendRecommend:
                case SystemMessageTypeAddFriendRequest:
                    [self excuteSysMsg:xmppSysMsg];
                    break;
                case SystemMessageTypeRelationDown://
                    [[[CPSystemEngine sharedInstance] sysManager] getFriendsByTimeStampCached];
                    if ([CoreUtils stringIsNotNull:xmppSysMsg.content])
                    {
                        [self excuteSysMsg:xmppSysMsg];
                    }
                    break;
                case SystemMessageTypeAddFriendResponse:
                    [self excuteSysMsgRelationUpdate:xmppSysMsg];
                    break;
                case SYstemMessageTypeRelationMatchNotify:
                    [self excuteSysMsgMatchLove:xmppSysMsg];
                    break;
                case SystemMessageTypeUnknown:
                    [self excuteSysMsg:xmppSysMsg];
                    break;
                default:
                {
                    if ([CoreUtils stringIsNotNull:xmppSysMsg.content])
                    {
                        [self excuteSysMsg:xmppSysMsg];
                    }
                }
                    break;
            }
        }
    }
}

@end
