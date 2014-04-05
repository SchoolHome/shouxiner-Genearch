//
//  CPOperationUpdateUserRelation.h
//  iCouple
//
//  Created by yong wei on 12-4-16.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "CPOperation.h"
typedef enum
{
    UPDATE_USER_RELATION_DEFAULT = 0,
    UPDATE_USER_RELATION_UPDATE = 1,
    UPDATE_USER_RELATION_DEL = 2,
}UpdateRelationType;

@interface CPOperationUpdateUserRelation : CPOperation
{
    NSInteger actionType;
    NSString *userName;
    NSInteger newRelationType;
}
- (id) initWithType:(NSInteger)type withUserName:(NSString *)uName relationType:(NSInteger)relationType;

@end
