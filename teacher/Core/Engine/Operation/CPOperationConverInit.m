//
//  CPOperationConverInit.m
//  iCouple
//
//  Created by yong wei on 12-4-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationConverInit.h"

#import "CPSystemEngine.h"
#import "CPMsgManager.h"
#import "CPDBManagement.h"
#import "CPPTModelGroupInfo.h"
#import "CPPTModelGroupMember.h"
#import "CPMsgManager.h"
#import "CPUIModelManagement.h"
#import "CPUIModelMessageGroup.h"
#import "ModelConvertUtils.h"
#import "CPResManager.h"
@implementation CPOperationConverInit
- (id) initWithUsers:(NSArray *)userArray andMsgGroups:(NSArray *)msgGroupArray andType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        addUserArray = userArray;
        addMsgGroupArray = msgGroupArray;
        createType = type;
        initType = INIT_CONVER_TYPE_DEFAULT;
    }
    return self;
}
-(id) initWithPtGroups:(NSArray *)ptGroups
{
    self = [super init];
    if (self)
    {
        ptGroupArray = ptGroups;
        initType = INIT_CONVER_TYPE_UPDATE;
    }
    return self;
}
-(BOOL)modifyConverGroupWithPtModel:(CPPTModelGroupInfo *)ptModelGroup
{
    CPDBModelMessageGroup *existMsgGroup = [[[CPSystemEngine sharedInstance] dbManagement] findMessageGroupWithServerID:ptModelGroup.jid];
    NSString *creatorName = [ModelConvertUtils getAccountNameWithName:ptModelGroup.ownerJID];
    NSNumber *msgGroupID = nil;
    if (existMsgGroup)
    {
//        [existMsgGroup setType:[NSNumber numberWithInt:MSG_GROUP_TYPE_CONVER]];
        [existMsgGroup setRelationType:[NSNumber numberWithInt:MSG_GROUP_RELATION_TYPE_CLOSER]];
        [existMsgGroup setGroupName:ptModelGroup.name];
        [existMsgGroup setCreatorName:creatorName];
        [[[CPSystemEngine sharedInstance] dbManagement] updateMessageGroupWithID:existMsgGroup.msgGroupID obj:existMsgGroup];
        msgGroupID = existMsgGroup.msgGroupID;
    }
    else 
    {
        CPDBModelMessageGroup *dbMsgGroup = [[CPDBModelMessageGroup alloc] init];
        [dbMsgGroup setType:[NSNumber numberWithInt:MSG_GROUP_TYPE_CONVER_PRE]];
        [dbMsgGroup setRelationType:[NSNumber numberWithInt:MSG_GROUP_RELATION_TYPE_CLOSER]];
        [dbMsgGroup setGroupName:ptModelGroup.name];
        [dbMsgGroup setCreatorName:creatorName];
        [dbMsgGroup setGroupServerID:ptModelGroup.jid];
        msgGroupID = [[[CPSystemEngine sharedInstance] dbManagement] insertMessageGroup:dbMsgGroup];
    }
    if (msgGroupID)
    {
        [[[CPSystemEngine sharedInstance] dbManagement] deleteAllGroupMemsWithGroupID:msgGroupID];
        for(CPPTModelGroupMember *ptGroupMem in ptModelGroup.memberList)
        {
            CPDBModelMessageGroupMember *dbGroupMem = [[CPDBModelMessageGroupMember alloc] init];
            [dbGroupMem setUserName:[ModelConvertUtils getAccountNameWithName:ptGroupMem.jid]];
            [dbGroupMem setDomain:[ModelConvertUtils getDomainWithName:ptGroupMem.jid]];
            [dbGroupMem setNickName:ptGroupMem.nickName];
            [dbGroupMem setHeaderPath:ptGroupMem.icon];
            [dbGroupMem setMsgGroupID:msgGroupID];
            NSNumber *newGroupMemID = [[[CPSystemEngine sharedInstance] dbManagement] insertMessageGroupMember:dbGroupMem];
            [[[CPSystemEngine sharedInstance] resManager] addResourceByGroupMemHeaderWithServerUrl:ptGroupMem.icon
                                                                                        andGroupID:msgGroupID];
        }
        [[[CPSystemEngine sharedInstance] dbManagement] updateMessageWithGroupID:msgGroupID andGroupServerID:ptModelGroup.jid];
//        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupMemsWithMsgGroupID:msgGroupID];
        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgListWithMsgGroupID:msgGroupID isCreated:NO];
        return YES;
    }
    return NO;
}
-(void)updateMsgConverList
{
    NSArray *oldConverGroupArray = [[[CPSystemEngine sharedInstance] dbManagement] findAllMessageConverGroup];
    NSMutableString *newConverGroupJidStr = [[NSMutableString alloc] init];
    for(CPPTModelGroupInfo *ptModelGroupInfo in ptGroupArray)
    {
        if (ptModelGroupInfo.jid)
        {
            [newConverGroupJidStr appendFormat:@",%@,",ptModelGroupInfo.jid];
        }
        [self modifyConverGroupWithPtModel:ptModelGroupInfo];
    }
    NSMutableArray *willDelGroupIDs = [[NSMutableArray alloc] init];
    for(CPDBModelMessageGroup *dbMsgGroup in oldConverGroupArray)
    {
        if (dbMsgGroup.msgGroupID&&dbMsgGroup.groupServerID&&
            [newConverGroupJidStr rangeOfString:[NSString stringWithFormat:@",%@,",dbMsgGroup.groupServerID]].length==0) 
        {
            [[[CPSystemEngine sharedInstance] dbManagement] deleteGroupWithID:dbMsgGroup.msgGroupID];
            [willDelGroupIDs addObject:dbMsgGroup.msgGroupID];
        }
    }
    NSMutableArray *uiMsgGroups = [[NSMutableArray alloc] initWithArray:[[CPUIModelManagement sharedInstance] userMessageGroupList]];
    BOOL hasDel = NO;
    for(NSNumber *delMsgGroupID in willDelGroupIDs)
    {
        for(CPUIModelMessageGroup *uiMsgGroup in uiMsgGroups)
        {
            if (uiMsgGroup.msgGroupID&&[uiMsgGroup.msgGroupID isEqualToNumber:delMsgGroupID])
            {
                hasDel = YES;
                [uiMsgGroups removeObject:uiMsgGroup];   
                break;
            }
        }
    }
    if (hasDel)
    {
        [[CPUIModelManagement sharedInstance] setUserMessageGroupList:uiMsgGroups];
        [[CPSystemEngine sharedInstance] updateTagByMsgGroupList];
    }
    NSString *converTimeStamp = [[CPSystemEngine sharedInstance] cachedMyConverTimeStamp];
    if (converTimeStamp)
    {
        [[CPSystemEngine sharedInstance] backupSystemInfoWithConverTimeStamp:converTimeStamp];
        [[CPSystemEngine sharedInstance] setCachedMyConverTimeStamp:nil];
    }
}
-(void)main
{
    @autoreleasepool 
    {
        switch (initType)
        {
            case INIT_CONVER_TYPE_DEFAULT:
                [[[CPSystemEngine sharedInstance] msgManager] createConversationWithUsers:addUserArray
                                                                             andMsgGroups:addMsgGroupArray
                                                                                  andType:createType];
                break;
            case INIT_CONVER_TYPE_UPDATE:
                [self updateMsgConverList];
                break;
            default:
                break;
        }
    }
}

@end
