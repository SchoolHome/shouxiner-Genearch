//
//  CPOperationConverInit.h
//  iCouple
//
//  Created by yong wei on 12-4-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"
typedef enum
{
    INIT_CONVER_TYPE_DEFAULT = 0,
    INIT_CONVER_TYPE_UPDATE = 1,
    
}InitConverType;


@interface CPOperationConverInit : CPOperation
{
    NSArray *addUserArray;
    NSArray *addMsgGroupArray;
    NSInteger createType;
    NSInteger initType;
    NSArray *ptGroupArray;
}
- (id) initWithUsers:(NSArray *)userArray andMsgGroups:(NSArray *)msgGroupArray andType:(NSInteger)type;

-(id) initWithPtGroups:(NSArray *)ptGroups;
@end
