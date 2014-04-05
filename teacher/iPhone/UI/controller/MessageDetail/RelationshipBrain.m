//
//  RelationshipBrain.m
//  iCouple
//
//  Created by shuo wang on 12-6-6.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "RelationshipBrain.h"
#import "CPUIModelUserInfo.h"

@interface RelationshipBrain ()
-(BOOL) isCouple : (CPUIModelUserInfo *) userInfo;
@end

static RelationshipBrain *brain = nil;

@implementation RelationshipBrain

+(RelationshipBrain *) sharedInstance{
    
    if ( nil == brain) {
        brain = [[super alloc] init];
    }
    return brain;
}

-(AddContactAnalysis) getContactAnalysis : (ExMessageModel *)exModel{
    AddContactAnalysis analysis = OpenInvalidate;
//    CPUIModelMessage *message = exModel.messageModel;
    
    if ([exModel.messageModel isSysFriendReq]) {
        CPUIModelSysMessageReq *friendRequest = [exModel.messageModel getSysMsgReq];
        if (nil == friendRequest) {
            CPLogInfo(@"[exModel.messageModel getSysMsgReq] is empty");
            return analysis;
        }

        //        /**1=普通好友
        //         2=密友
        //         3=喜欢
        //         4=恋人couple
        //         5=夫妻couple
        //         **/
        //        typedef enum
        //        {
        //            SYS_MSG_APPLY_TYPE_COMMON = 1,
        //            SYS_MSG_APPLY_TYPE_CLOSER = 2,
        //            SYS_MSG_APPLY_TYPE_LOVE = 3,
        //            SYS_MSG_APPLY_TYPE_COUPLE = 4,
        //            SYS_MSG_APPLY_TYPE_MARRIED = 5,
        //        }SysMsgApplyType;
        
        // 获取是否是好友
        NSString *userName = friendRequest.userName;
        CPUIModelUserInfo *userInfor = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:userName];
        
        switch ([friendRequest.applyType intValue]) {
            case SYS_MSG_APPLY_TYPE_COMMON:{
                    // 如果是添加普通好友的系统消息
                    if (nil == userInfor) {
                        // 是非好友关系、并且忽略
                        if ([exModel.messageModel isSysFriendReqIgnore]) {
                            // 如果该系统消息忽略过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else if([exModel.messageModel isSysFriendReqAccept]){
                            // 如果该系统消息同意过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else {
                            // 未被忽略并未同意，跳转到应答页面
                            analysis = OpenAddContactWithAnswer;
                        }
                    }else {
                        //  根据当前实际关系，跳转到独立个人profile界面
                        if ([self isCouple:userInfor]) {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }else {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }
                    }
                }
                break;
            case SYS_MSG_APPLY_TYPE_CLOSER:{
                    // 如果是添加密友的系统消息
                    if (nil == userInfor) {
                        // 是非好友关系
                        if ([exModel.messageModel isSysFriendReqIgnore]) {
                            // 如果该系统消息忽略过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else if ([exModel.messageModel isSysFriendReqAccept]) {
                            // 如果该系统消息同意过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else {
                            // 未被忽略并未同意，跳转到应答页面
                            analysis = OpenAddContactWithAnswer;
                        }
                    }else {
                        //  根据当前实际关系，跳转到独立个人profile界面
                        if ([self isCouple:userInfor]) {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }else {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }
                    }
                }
                break;
            case SYS_MSG_APPLY_TYPE_LOVE:{
                    // 如果是添加喜欢的系统消息
                    if (nil == userInfor) {
                        // 是非好友关系
                        if ([exModel.messageModel isSysFriendReqIgnore]) {
                            // 如果该系统消息忽略过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        } else if ([exModel.messageModel isSysFriendReqAccept]) {
                            // 如果该系统消息同意过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        } else {
                            // 未被忽略并未同意，跳转到应答页面
                            analysis = OpenAddContactWithAnswer;
                        }
                    }else {
                        //  根据当前实际关系，跳转到独立个人profile界面
                        if ([self isCouple:userInfor]) {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }else {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }
                    }
                }
                break;
            case SYS_MSG_APPLY_TYPE_COUPLE:{
                    // 如果是添加couple -- 恋人
                    if (nil == userInfor) {
                        // 如果是非好友关系
                        if ([exModel.messageModel isSysFriendReqIgnore]) {
                            // 已经被拒绝，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else if ([exModel.messageModel isSysFriendReqAccept]) {
                            // 如果该系统消息同意过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else {
                            // 未被拒绝，跳转到应答页面
                            analysis = OpenAddContactWithAnswer;
                        }
                    }else {
                        if ([userInfor.type intValue] == USER_RELATION_TYPE_COUPLE || [userInfor.type intValue] == USER_RELATION_TYPE_MARRIED) {
                            // 跳转到独立个人profile
                            analysis = OpenSingleIndependentProfile;
                        }else {
                            // 不是couple
                            if ([exModel.messageModel isSysFriendReqIgnore]) {
                                // 如果已拒绝
                                //  根据当前实际关系，跳转到独立个人profile界面
                                if ([self isCouple:userInfor]) {
                                    // 跳转到独立个人profile
                                    analysis = OpenSingleIndependentProfile;
                                }else {
                                    // 跳转到独立个人profile
                                    analysis = OpenSingleIndependentProfile;
                                }
                            }else if([exModel.messageModel isSysFriendReqAccept]){
                                // 如果已同意
                                //  根据当前实际关系，跳转到独立个人profile界面
                                if ([self isCouple:userInfor]) {
                                    // 跳转到独立个人profile
                                    analysis = OpenSingleIndependentProfile;
                                }else {
                                    // 跳转到独立个人profile
                                    analysis = OpenSingleIndependentProfile;
                                }
                            }else {
                                // 未被拒绝，跳转到应答页面
                                analysis = OpenAddContactWithAnswer;
                            }
                        }
                    }
                }
                break;
            case SYS_MSG_APPLY_TYPE_MARRIED:{
                    // 如果是添加couple -- 夫妻
                    if (nil == userInfor) {
                        // 如果是非好友关系
                        if ([exModel.messageModel isSysFriendReqIgnore]) {
                            // 已经被拒绝，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else if ([exModel.messageModel isSysFriendReqAccept]){
                            // 已经同意过，跳转添加陌生人页面
                            analysis = OpenAddContactWithProfile;
                        }else {
                            // 未被拒绝，跳转到应答页面
                            analysis = OpenAddContactWithAnswer;
                        }
                    }else {
                        if ([userInfor.type intValue] == USER_RELATION_TYPE_COUPLE || [userInfor.type intValue] == USER_RELATION_TYPE_MARRIED) {
                            // 本地是couple －－ 情侣或夫妻
                            if ([userInfor.type intValue] == USER_RELATION_TYPE_COUPLE) {
                                // 如果是情侣的关系
                                if ([exModel.messageModel isSysFriendReqIgnore]) {
                                    // 如果拒绝过,跳转到独立个人profile
                                    analysis = OpenSingleIndependentProfile;
                                }else if ([exModel.messageModel isSysFriendReqAccept]) {
                                    // 如果同意过，跳转到独立个人profile
                                    analysis = OpenSingleIndependentProfile;
                                }else {
                                    // 没有拒绝过，跳转到应答页面－－夫妻
                                    analysis = OpenAddContactWithAnswer;
                                }
                            }else {
                                // 夫妻关系 跳转到独立个人profile
                                analysis = OpenSingleIndependentProfile;
                            }
                        }else {
                            // 本地不是couple
                            if ([exModel.messageModel isSysFriendReqIgnore]) {
                                // 如果已经拒绝了
                                //  根据当前实际关系，跳转到独立个人profile
                                if ([self isCouple:userInfor]) {
                                    analysis = OpenSingleIndependentProfile;
                                }else {
                                    analysis = OpenSingleIndependentProfile;
                                }
                            }else if ([exModel.messageModel isSysFriendReqAccept]) {
                                // 如果已经同意过
                                //  根据当前实际关系，跳转到独立个人profile
                                if ([self isCouple:userInfor]) {
                                    analysis = OpenSingleIndependentProfile;
                                }else {
                                    analysis = OpenSingleIndependentProfile;
                                }
                            }else {
                                // 跳转到添加couple 跳转到应答页面－－夫妻
                                analysis = OpenAddContactWithAnswer;
                            }
                        }
                    }
                }
                break;
            default:
                CPLogInfo(@"friendRequest.applyType isn't exist！！！");
                break;
        }
    }else if([exModel.messageModel isSysFriendCommend]){
        CPUIModelSysMessageReq *friendRequest = [exModel.messageModel getSysMsgReq];
        if (nil == friendRequest) {
            CPLogInfo(@"[exModel.messageModel getSysMsgReq] is empty");
            return analysis;
        }
        
        // 获取是否是好友
        NSString *userName = friendRequest.userName;
        CPUIModelUserInfo *userInfor = [[CPUIModelManagement sharedInstance] getUserInfoWithUserName:userName];
        
        /*
         // 跳转到陌生人加关系的页面 -- AddContactWithProfileViewController
         OpenAddContactWithProfile,
         // 跳转到应答页面 -- AddContactAnswerViewController
         OpenAddContactWithAnswer,
         // 跳转到陌生人加关系页面 -- AddContactWithProfileViewController
         OpenAddContactWithCommendProfile,
         // 什么都不做
         OpenInvalidate
         */
        
        //        /**1=普通好友
        //         2=密友
        //         3=喜欢
        //         4=恋人couple
        //         5=夫妻couple
        //         **/
        //        typedef enum
        //        {
        //            SYS_MSG_APPLY_TYPE_COMMON = 1,
        //            SYS_MSG_APPLY_TYPE_CLOSER = 2,
        //            SYS_MSG_APPLY_TYPE_LOVE = 3,
        //            SYS_MSG_APPLY_TYPE_COUPLE = 4,
        //            SYS_MSG_APPLY_TYPE_MARRIED = 5,
        //        }SysMsgApplyType;
        
        if ([userInfor.type intValue] == SYS_MSG_APPLY_TYPE_COMMON || [userInfor.type intValue] == SYS_MSG_APPLY_TYPE_CLOSER) {
            analysis = OpenSingleIndependentProfile;
        }else if ([userInfor.type intValue] == SYS_MSG_APPLY_TYPE_LOVE || [userInfor.type intValue] == SYS_MSG_APPLY_TYPE_COUPLE || [userInfor.type intValue] == SYS_MSG_APPLY_TYPE_MARRIED) {
            analysis = OpenSingleIndependentProfile;
        }else {
            analysis = OpenAddContactWithCommendProfile;
        }
    }
    
    return analysis;
}

-(BOOL) isCouple:(CPUIModelUserInfo *)userInfo{
    BOOL isCouple = NO;
    
    if ([userInfo.type intValue] == USER_RELATION_TYPE_LOVER) {
        isCouple = YES;
    }else if ([userInfo.type intValue] == USER_RELATION_TYPE_COUPLE) {
        isCouple = YES;
    }else if ([userInfo.type intValue] == USER_RELATION_TYPE_MARRIED) {
        isCouple = YES;
    }
    
    return isCouple;
}







@end
