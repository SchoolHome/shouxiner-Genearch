//
//  CPOperationConverMemberUpdate.h
//  iCouple
//
//  Created by yong wei on 12-4-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"
typedef enum
{
    UPDATE_CONVER_MEM_TYPE_DEFAULT = 0,
    UPDATE_CONVER_MEM_TYPE_ADD = 1,
    UPDATE_CONVER_MEM_TYPE_REMOVE = 2,
    
}UpdateConverMemType;


@interface CPOperationConverMemberUpdate : CPOperation
{
    NSInteger updateType;
    NSString *groupServerID;
    NSArray *updateUserNames;
}

- (id) initWithGroupServerID:(NSString *)groupServerID withType:(NSInteger)type andUsers:(NSArray *)userNames;
@end
