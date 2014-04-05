#import "CPDBModelMessageGroup.h"

/**
 * 群组
 */

@implementation CPDBModelMessageGroup

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
-(BOOL)isMsgMultiGroup
{
    NSInteger msgType = [self.type integerValue];
    if (msgType==MSG_GROUP_TYPE_MULTI||msgType==MSG_GROUP_TYPE_CONVER||
        msgType==MSG_GROUP_TYPE_MULTI_PRE||msgType==MSG_GROUP_TYPE_CONVER_PRE)
    {
        return YES;
    }
    return NO;
}
-(BOOL)isMsgSingleGroup
{
    NSInteger msgType = [self.type integerValue];
    if (msgType==MSG_GROUP_TYPE_SINGLE||msgType==MSG_GROUP_TYPE_SINGLE_PRE)
    {
        return YES;
    }
    return NO;
}
@end

