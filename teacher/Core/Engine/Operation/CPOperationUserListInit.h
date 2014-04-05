//
//  CPOperationUserListInit.h
//  iCouple
//
//  Created by yong weiy on 12-4-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperation.h"
typedef enum
{
    INIT_USER_LIST_DEFAULT = 0,
    INIT_USER_LIST_COMMEND = 1,
}InitUserListType;
@interface CPOperationUserListInit : CPOperation
{
    NSInteger initType;
    NSArray *ptUserInfoArray;
}
- (id) initWithType:(NSInteger)type withUserArray:(NSArray *)userArray;
@end
