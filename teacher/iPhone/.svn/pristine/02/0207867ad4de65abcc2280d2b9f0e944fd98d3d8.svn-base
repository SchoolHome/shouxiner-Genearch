//
//  ChangeContactRelation.m
//  iCouple
//
//  Created by qing zhang on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChangeContactRelation.h"

@implementation ChangeContactRelation

-(NSArray *)ChangeContactRelationByUserInfo : (CPUIModelUserInfo *)userInfo
{
//    "Friend" = "好友";
//    "CloseFriend" = "密友";
//    "Lover" = "喜欢的人";
//    "Couple" = "另一半";
//    "Married" = "小夫妻";
//    "Delete" = "删除此人";
//    "Cancel" = "取消";
    switch ([userInfo.type integerValue]) {
            CPLogInfo(@"userInfo.type==%d",[userInfo.type integerValue]);
            //陌生人
            case USER_RELATION_TYPE_DEFAULT:
            {
                if ([self hasCoupleOrNot:userInfo]) {
                    return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Cancel", nil), nil];
                }else {
                    return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Lover", nil),NSLocalizedString(@"Couple", nil),NSLocalizedString(@"Cancel", nil), nil];
                }
            }
            break;
            //好友
            case USER_RELATION_TYPE_COMMON:
            {
                if ([self hasCoupleOrNot:userInfo]) {
                    return [NSArray arrayWithObjects:NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil), nil];
                }else {
                    return [NSArray arrayWithObjects:NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Lover", nil),NSLocalizedString(@"Couple", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil), nil];
                }
            }
            break;
            //密友
            case USER_RELATION_TYPE_CLOSED:
            {
                if ([self hasCoupleOrNot:userInfo]) {
                    return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil), nil];
                }else {
                    return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"Lover", nil),NSLocalizedString(@"Couple", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil), nil];
                }
            }
            break;
            //喜欢
            case USER_RELATION_TYPE_LOVER:
            {
                return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Couple", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil), nil];
            }
            break;
            //情侣
            case USER_RELATION_TYPE_COUPLE:
            {
                return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Lover", nil),NSLocalizedString(@"Married", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil), nil];
            }
            break;
            //夫妻
            case USER_RELATION_TYPE_MARRIED:
            {
                return [NSArray arrayWithObjects:NSLocalizedString(@"Friend", nil),NSLocalizedString(@"CloseFriend", nil),NSLocalizedString(@"Lover", nil),NSLocalizedString(@"Delete", nil),NSLocalizedString(@"Cancel", nil),nil];
            }
                break;
        default:
            {
                return nil;
            }
            break;
    }
}
-(BOOL)hasCoupleOrNot : (CPUIModelUserInfo *)userInfo
{
    if (([[CPUIModelManagement sharedInstance] hasLover] || [[CPUIModelManagement sharedInstance] hasCouple]) ) {
        return YES;
    }else {
        return NO;
    }
}
@end
