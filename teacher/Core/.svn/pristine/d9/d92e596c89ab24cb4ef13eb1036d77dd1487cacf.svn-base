#import "CPUIModelMessageGroup.h"

#import "CPUIModelMessage.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessageGroupMember.h"
#import "CPSystemEngine.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "ChineseToPinyin.h"
/**
 * 群组
 */

@implementation CPUIModelMessageGroup


@synthesize msgGroupID = msgGroupID_;
@synthesize type = type_;
@synthesize relationType = relationType_;
@synthesize groupServerID = groupServerID_;
@synthesize groupName = groupName_;
@synthesize groupHeaderResID = groupHeaderResID_;
@synthesize memoID = memoID_;
@synthesize updateDate = updateDate_;
@synthesize creatorName = creatorName_;
@synthesize unReadedCount = unReadedCount_;
@synthesize memberList = memberList_;
@synthesize msgList = msgList_;

@synthesize searchTextArray = searchTextArray_;
@synthesize searchTextPinyinArray = searchTextPinyinArray_;
@synthesize searchTextQuanPinWithChar = searchTextQuanPinWithChar_;
@synthesize searchTextQuanPinWithInt = searchTextQuanPinWithInt_;


-(NSComparisonResult) orderMsgGroupWithDate:(CPUIModelMessageGroup *)userMsgGroup
{
    /**
    NSNumber *groupUpdate = self.updateDate;
    NSInteger msgsCount = [self.msgList count];
    if (msgsCount>0)
    {
        CPUIModelMessage *uiMsg = [self.msgList objectAtIndex:msgsCount-1];
        groupUpdate = uiMsg.date;
    }
    
    NSNumber *userMsgGroupDate = userMsgGroup.updateDate;
    NSInteger userMsgGroupMsgsCount = [userMsgGroup.msgList count];
    if (userMsgGroupMsgsCount>0) 
    {
        CPUIModelMessage *uiUserMsg = [userMsgGroup.msgList objectAtIndex:userMsgGroupMsgsCount-1];
        userMsgGroupDate = uiUserMsg.date;

    }
    NSComparisonResult compareResult = [groupUpdate compare:userMsgGroupDate];
    if (compareResult==NSOrderedAscending)
    {
        return NSOrderedDescending;
    }
     **/
//    else if(compareResult==NSOrderedDescending)
//    {
//        return NSOrderedAscending;
//    }
//    return [self.updateDate compare:userMsgGroup.updateDate];;
    return [userMsgGroup.updateDate compare:self.updateDate];
}
-(NSInteger)msgGroupMemberRelation
{
    if ([self.type integerValue]==MSG_GROUP_UI_TYPE_SINGLE)
    {
        if ([self.memberList count]==1)
        {
            CPUIModelMessageGroupMember *uiGroupMem = [self.memberList objectAtIndex:0];
            CPUIModelUserInfo *uiUserInfo = uiGroupMem.userInfo;
            return [uiUserInfo.type integerValue];
        }
    }
    return 0;
}
-(NSString *)getMemHeaderWithName:(NSString *)userName
{
    if (userName)
    {
        if ([userName isEqualToString:[[CPSystemEngine sharedInstance] getAccountName]])
        {
            return [[[CPUIModelManagement sharedInstance] uiPersonalInfo] selfHeaderImgPath];
        }
        else 
        {
            for(CPUIModelMessageGroupMember *uiGroupMem in self.memberList)
            {
                if (uiGroupMem.userName&&[uiGroupMem.userName isEqualToString:userName])
                {
                    return uiGroupMem.headerPath;
                }
            }
        }
    }
    return nil;
}
-(CPUIModelMessageGroupMember *)getGroupMemWithName:(NSString *)userName
{
    if (userName)
    {
        if ([userName isEqualToString:[[CPSystemEngine sharedInstance] getAccountName]])
        {
            CPUIModelMessageGroupMember *selfAccount = [[CPUIModelMessageGroupMember alloc] init];
            [selfAccount setUserName:userName];
            return selfAccount;
        }
        else 
        {
            for(CPUIModelMessageGroupMember *uiGroupMem in self.memberList)
            {
                if (uiGroupMem.userName&&[uiGroupMem.userName isEqualToString:userName])
                {
                    return uiGroupMem;
                }
            }
        }
    }
    return nil;
}
-(BOOL)isMsgSingleGroup
{
    NSInteger msgType = [self.type integerValue];
    if (msgType==MSG_GROUP_UI_TYPE_SINGLE||msgType==MSG_GROUP_UI_TYPE_SINGLE_PRE)
    {
        return YES;
    }
    return NO;
}
-(BOOL)isMsgMultiGroup
{
    NSInteger msgType = [self.type integerValue];
    if (msgType==MSG_GROUP_UI_TYPE_MULTI||msgType==MSG_GROUP_UI_TYPE_CONVER||
        msgType==MSG_GROUP_UI_TYPE_MULTI_PRE||msgType==MSG_GROUP_UI_TYPE_CONVER_PRE)
    {
        return YES;
    }
    return NO;
}
-(BOOL)isMsgMultiConver
{
    NSInteger msgType = [self.type integerValue];
    if (msgType==MSG_GROUP_UI_TYPE_MULTI||
        msgType==MSG_GROUP_UI_TYPE_MULTI_PRE)
    {
        return YES;
    }
    return NO;
}
-(BOOL)isMsgConverGroup
{
    NSInteger msgType = [self.type integerValue];
    if (msgType==MSG_GROUP_UI_TYPE_CONVER||msgType==MSG_GROUP_UI_TYPE_CONVER_PRE)
    {
        return YES;
    }
    return NO;
}
-(BOOL)isSysMsgGroup
{
    if (!self.creatorName)
    {
        return NO;
    }
    if ([@"system" isEqualToString:self.creatorName]||
        [@"shuangshuang" isEqualToString:self.creatorName]||
        [@"xiaoshuang" isEqualToString:self.creatorName])
    {
        return YES;
    }
    return NO;
}
-(BOOL)isFriendCommonMsgGroup
{
    NSInteger msgRelationType = [self.relationType integerValue];
    if (msgRelationType==MSG_GROUP_UI_RELATION_TYPE_COMMON&&![self isSysMsgGroup]) 
    {
        NSInteger msgType = [self.type integerValue];
        if (msgType==MSG_GROUP_UI_TYPE_SINGLE||msgType==MSG_GROUP_UI_TYPE_SINGLE_PRE)
        {
            return YES;
        }
    }
    return NO;
}
-(BOOL)isFriendClosedMsgGroup
{
    NSInteger msgRelationType = [self.relationType integerValue];
    if (msgRelationType==MSG_GROUP_UI_RELATION_TYPE_CLOSER) 
    {
        NSInteger msgType = [self.type integerValue];
        if (msgType==MSG_GROUP_UI_TYPE_SINGLE||msgType==MSG_GROUP_UI_TYPE_SINGLE_PRE)
        {
            return YES;
        }
    }
    return NO;
}
-(void)initSearchData
{
    if (self.groupName&&![@"" isEqualToString:self.groupName]) 
    {
        //        NSMutableArray *textArray = [[NSMutableArray alloc] init];
        NSMutableArray *textPinYinArray = [[NSMutableArray alloc] init];
        NSMutableString *textQuanPinStr = [[NSMutableString alloc] init];
        NSMutableString *textQuanPinInt = [[NSMutableString alloc] init];
        NSInteger strLength = [self.groupName length];
        for (int i = 0; i < strLength; i++)
        {
            NSRange range;
            range.length = 1;
            range.location = i;
            NSString *temp = [self.groupName substringWithRange:range];
            int isChinese = [temp characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) 
            {
                NSString *quanpin = [[ChineseToPinyin pinyinFromChiniseString:temp] uppercaseString];
                if (  quanpin && ![quanpin isEqualToString:@""] ) 
                {
                    [textQuanPinStr appendString:quanpin];
                    [textQuanPinInt appendString:[NSString stringWithFormat:@"%d",isChinese]];
                    [textPinYinArray addObject:[quanpin substringWithRange:NSMakeRange(0, 1)]];
                }else 
                {
                    CPLogError(@"没有汉字：%@的拼音",temp);
                }
            }else 
            {
                [textQuanPinStr appendString:[temp uppercaseString]];
                [textQuanPinInt appendString:[temp uppercaseString]];
                if (i == 0 && ![temp isEqualToString:@" "]) 
                {
                    [textPinYinArray addObject:[temp uppercaseString]];
                }else if (i > 0 && ![temp isEqualToString:@" "])
                {
                    NSString *perchar = [self.groupName substringWithRange:NSMakeRange(i-1, 1)];
                    int isChinese2 = [perchar characterAtIndex:0];
                    if ( (isChinese2 > 0x4e00 && isChinese2 <0x9fff) || [perchar isEqualToString:@" "]) 
                    {
                        [textPinYinArray addObject:[temp uppercaseString]];
                    }
                }
            }
        }
        [self setSearchTextPinyinArray:textPinYinArray];
        [self setSearchTextQuanPinWithChar:textQuanPinStr];
        [self setSearchTextQuanPinWithInt:textQuanPinInt];
    }
    
    
}

@end

