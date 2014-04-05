//
//  CPOperationUpdateUserRelation.m
//  iCouple
//
//  Created by yong wei on 12-4-16.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationUpdateUserRelation.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPMsgManager.h"
@implementation CPOperationUpdateUserRelation
- (id) initWithType:(NSInteger)type withUserName:(NSString *)uName relationType:(NSInteger)relationType
{
    self = [super init];
    if (self)
    {
        actionType = type;
        newRelationType = relationType;
        userName = uName;
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        switch (actionType)
        {
            case UPDATE_USER_RELATION_UPDATE:
                [[[CPSystemEngine sharedInstance] dbManagement] updateUserRelationWithUserName:userName
                                                                                  relationType:[NSNumber numberWithInt:newRelationType]];
                break;
            case UPDATE_USER_RELATION_DEL:
                [[[CPSystemEngine sharedInstance] dbManagement] deleteUserWithAccount:userName];
                [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupWithDelUserName:userName];
                break;
            default:
                break;
        }
    }
}
@end
