#import "CPUIModelMessage.h"

#import "ModelConvertUtils.h"
/**
 * 消息表
 */

@implementation CPUIModelMessage


@synthesize msgID = msgID_;
@synthesize msgGroupID = msgGroupID_;
@synthesize msgSenderName = msgSenderName_;
@synthesize mobile = mobile_;
@synthesize userID = userID_;
@synthesize flag = flag_;
@synthesize sendState = sendState_;
@synthesize date = date_;
@synthesize isReaded = isReaded_;
@synthesize msgText = msgText_;
@synthesize contentType = contentType_;
@synthesize locationInfo = locationInfo_;
@synthesize attachResID = attachResID_;
@synthesize msgData = msgData_;
@synthesize filePath = filePath_;
@synthesize mediaTime = mediaTime_;
@synthesize fileSize = fileSize_;
@synthesize thubFilePath = thubFilePath_;
@synthesize videoUrl = videoUrl_;
@synthesize magicMsgID = magicMsgID_;
@synthesize petMsgID = petMsgID_;
@synthesize bodyContent = bodyContent_;
@synthesize uuidAsk = uuidAsk_;
@synthesize isAlarmHidden = isAlarmHidden_;
@synthesize alarmTime = alarmTime_;
@synthesize linkMsgID = linkMsgID_;

-(NSComparisonResult) orderMsgWithDate:(CPUIModelMessage *)userMsg
{
    return [self.date compare:userMsg.date];
}
-(BOOL)isSysFriendReq
{
    return ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_ADD_REQ)>0;
}
-(BOOL)isSysFriendReqAccept
{
    return ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_ADD_REQ)>0&&
    ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_ADD_REQ_ACCEPT)>0;
}
-(BOOL)isSysFriendReqIgnore
{
    return [self.contentType integerValue]==(MSG_CONTENT_TYPE_SYS_ADD_REQ|MSG_CONTENT_TYPE_SYS_ADD_REQ_IGNORE);
}
-(BOOL)isSysDefault
{
    return ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_ADD_RES)>0||
    ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS)>0;
}
-(BOOL)isSysSpecial
{
    return ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_ADD_REQ)>0||
    ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_RECOMMEND)>0;
}
-(BOOL)isSysFriendCommend
{
    return ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_RECOMMEND)>0;
}
-(BOOL)isSysFriendRes
{
    return ([self.contentType integerValue]&MSG_CONTENT_TYPE_SYS_ADD_RES)>0;
}
-(CPUIModelSysMessageReq *)getSysMsgReq
{
    if (!self.bodyContent)
    {
        return nil;
    }
    NSDictionary *jsonDict = [self.bodyContent objectFromJSONString];
    CPUIModelSysMessageReq *sysMsgReq = [[CPUIModelSysMessageReq alloc] init];
    [sysMsgReq setReqID:[jsonDict objectForKey:@"reqid"]];
    [sysMsgReq setApplyType:[jsonDict objectForKey:@"applytype"]];
    [sysMsgReq setContent:[jsonDict objectForKey:@"content"]];
    [sysMsgReq setNickName:[jsonDict objectForKey:@"nickname"]];
    NSString *uname = [jsonDict objectForKey:@"uname"];
    [sysMsgReq setUserName:[ModelConvertUtils getAccountNameWithName:uname]];
    [sysMsgReq setMobileNumber:[jsonDict objectForKey:@"phnum"]];
    [sysMsgReq setMobileRegion:[jsonDict objectForKey:@"pharea"]];
    return sysMsgReq;
}
-(CPUIModelSysMessageFriCommend *)getSysMsgFriCommend
{
    if (!self.bodyContent)
    {
        return nil;
    }
    NSDictionary *jsonDict = [self.bodyContent objectFromJSONString];
    CPUIModelSysMessageFriCommend *sysMsgFriCommend = [[CPUIModelSysMessageFriCommend alloc] init];
    [sysMsgFriCommend setMobileNumber:[jsonDict objectForKey:@"phnum"]];
    [sysMsgFriCommend setMobileRegion:[jsonDict objectForKey:@"pharea"]];
    [sysMsgFriCommend setContent:[jsonDict objectForKey:@"content"]];
    [sysMsgFriCommend setNickName:[jsonDict objectForKey:@"nickname"]];
    NSString *uname = [jsonDict objectForKey:@"uname"];
    [sysMsgFriCommend setUserName:[ModelConvertUtils getAccountNameWithName:uname]];
    return sysMsgFriCommend;
}
-(BOOL)isMatchLoveMsg
{
    if ([@"1" isEqualToString:self.mobile])
    {
        return YES;
    }
    return NO;
}
-(BOOL)isAlarmMsg
{
    if ([self.contentType integerValue]==MSG_CONTENT_TYPE_ALARMED_TEXT
        ||[self.contentType integerValue]==MSG_CONTENT_TYPE_ALARM_TEXT
        ||[self.contentType integerValue]==MSG_CONTENT_TYPE_ALARM_AUDIO
        ||[self.contentType integerValue]==MSG_CONTENT_TYPE_ALARMED_AUDIO)
    {
        return YES;
    }
    return NO;
}
@end

@implementation CPUIModelSysMessageReq
@synthesize reqID = reqID_;
@synthesize applyType = applyType_;
@synthesize nickName = nickName_;
@synthesize content = content_;
@synthesize userName = userName_;
@synthesize mobileNumber = mobileNumber_;
@synthesize mobileRegion = mobileRegion_;
@end

@implementation CPUIModelSysMessageFriCommend
@synthesize mobileNumber = mobileNumber_;
@synthesize mobileRegion = mobileRegion_;
@synthesize nickName = nickName_;
@synthesize content = content_;
@synthesize userName = userName_;
@end

