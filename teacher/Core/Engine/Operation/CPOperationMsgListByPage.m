//
//  CPOperationMsgListByPage.m
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationMsgListByPage.h"
#import "CPUIModelMessageGroup.h"
#import "CPSystemEngine.h"
#import "CPMsgManager.h"
@implementation CPOperationMsgListByPage
- (id) initWithMsgGroup:(CPUIModelMessageGroup *)msgGroup
{
    self = [super init];
    if (self)
    {
        uiMsgGroup = msgGroup;
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        [[[CPSystemEngine sharedInstance] msgManager] refreshCurrentConverGroupMsgListByHistoryWithGroup:uiMsgGroup];
    }
}
@end
