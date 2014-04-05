//
//  CPOperationConverMemberUpdate.m
//  iCouple
//
//  Created by yong wei on 12-4-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationConverMemberUpdate.h"

#import "CPDBModelMessageGroup.h"
#import "CPDBModelMessageGroupMember.h"
#import "CPUIModelMessageGroup.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "ModelConvertUtils.h"
#import "CPMsgManager.h"
#import "CPUIModelManagement.h"
@implementation CPOperationConverMemberUpdate

- (id) initWithGroupServerID:(NSString *)serverID withType:(NSInteger)type andUsers:(NSArray *)userNames
{
    self = [super init];
    if (self)
    {
        groupServerID = serverID;
        updateType = type;
        updateUserNames = userNames;
    }
    return self;
}
-(void)addGroupMems
{
    CPDBModelMessageGroup *existDbModelMsgGroup = [[[CPSystemEngine sharedInstance] dbManagement] getExistMsgGroupWithGroupServerID:groupServerID];
    if (existDbModelMsgGroup.msgGroupID) 
    {
        NSInteger msgType = [existDbModelMsgGroup.type integerValue];
        if (msgType==MSG_GROUP_UI_TYPE_CONVER_PRE)
        {
            [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupConverTypeWithGroupID:existDbModelMsgGroup.msgGroupID
                                            andNewType:MSG_GROUP_UI_TYPE_CONVER];
        }
        else if (msgType==MSG_GROUP_UI_TYPE_MULTI_PRE)
        {
            [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupConverTypeWithGroupID:existDbModelMsgGroup.msgGroupID
                                            andNewType:MSG_GROUP_UI_TYPE_MULTI];
        }            
        NSMutableString *nickNameString = [[NSMutableString alloc] init];
        for(NSString *userName in updateUserNames)
        {
            CPDBModelUserInfo *uiUserInfo = [[[CPSystemEngine sharedInstance] dbManagement] getUserInfoByCachedWithName:userName];
            if (uiUserInfo)
            {
                CPDBModelMessageGroupMember *dbGroupMem = [[CPDBModelMessageGroupMember alloc] init];
                [dbGroupMem setDomain:uiUserInfo.domain];
                [dbGroupMem setUserName:uiUserInfo.name];
                [dbGroupMem setNickName:uiUserInfo.nickName];
                [dbGroupMem setMsgGroupID:existDbModelMsgGroup.msgGroupID];
                [[[CPSystemEngine sharedInstance] dbManagement] insertMessageGroupMember:dbGroupMem];
                if (uiUserInfo.nickName)
                {
                    if ([nickNameString length]>0)
                    {
                        [nickNameString appendString:@","];
                    }
                    [nickNameString appendString:uiUserInfo.nickName];
                }
            }
        }
        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupMemsWithMsgGroupID:existDbModelMsgGroup.msgGroupID];
        [[CPSystemEngine sharedInstance] updateTagByAddGroupMemWithDic:
         [NSDictionary dictionaryWithObjectsAndKeys:
          @"",group_manage_dic_res_desc,
          [NSNumber numberWithInt:RES_CODE_SUCESS],group_manage_dic_res_code,nil]];
        //auto add msg
        return;
        CPDBModelMessage *newDbMsg = [[CPDBModelMessage alloc] init];
        [newDbMsg setMsgText:[NSString stringWithFormat:@"%@%@%@",
                              NSLocalizedString(@"AutoMsgMultiGroupAddResBegin",nil),
                              nickNameString,
                              NSLocalizedString(@"AutoMsgMultiGroupAddResEnd",nil)]];
        [[[CPSystemEngine sharedInstance] msgManager] sendAutoMsgSysWithMsgGroupID:existDbModelMsgGroup.msgGroupID
                                                                     newMsg:newDbMsg];
    }
}
-(void)removeGroupMems
{
    CPDBModelMessageGroup *existDbModelMsgGroup = [[[CPSystemEngine sharedInstance] dbManagement] getExistMsgGroupWithGroupServerID:groupServerID];
    if (existDbModelMsgGroup.msgGroupID) 
    {
        NSMutableString *nickNameString = [[NSMutableString alloc] init];
        for(CPUIModelMessageGroupMember *groupMem in updateUserNames)
        {
            [[[CPSystemEngine sharedInstance] dbManagement] deleteGroupMemWithMemName:groupMem.userName
                                                                           andGroupID:existDbModelMsgGroup.msgGroupID];
            if (groupMem.nickName)
            {
                if ([nickNameString length]>0)
                {
                    [nickNameString appendString:@","];
                }
                [nickNameString appendString:groupMem.nickName];
            }
        }
        [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupMemsWithMsgGroupID:existDbModelMsgGroup.msgGroupID];
        //auto add msg
        return;
        CPDBModelMessage *newDbMsg = [[CPDBModelMessage alloc] init];
        [newDbMsg setMsgText:[NSString stringWithFormat:@"%@%@%@",
                               NSLocalizedString(@"AutoMsgMultiGroupDelResBegin",nil),
                               nickNameString,
                               NSLocalizedString(@"AutoMsgMultiGroupDelResEnd",nil)]];
        [[[CPSystemEngine sharedInstance] msgManager] sendAutoMsgSysWithMsgGroupID:existDbModelMsgGroup.msgGroupID
                                                                         newMsg:newDbMsg];
    }
}
-(void)main
{
    @autoreleasepool 
    {
        switch (updateType)
        {
            case UPDATE_CONVER_MEM_TYPE_ADD:
                [self addGroupMems];
                break;
            case UPDATE_CONVER_MEM_TYPE_REMOVE:
                [self removeGroupMems];
                break;
        }
    }
}

@end
