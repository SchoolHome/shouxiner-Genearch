//
//  CPOperationUploadAb.m
//  iCouple
//
//  Created by yong wei on 12-3-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperationUploadAb.h"

#import "CPSystemEngine.h"
#import "CPSystemManager.h"
@implementation CPOperationUploadAb
- (id) init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        [[[CPSystemEngine sharedInstance] sysManager] uploadAddressBook];
    }
}

@end
