//
//  CPOperationResDownload.m
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationResDownload.h"
#import "CPDBModelResource.h"
#import "CPSystemEngine.h"
#import "CPDBManagement.h"

@implementation CPOperationResDownload
- (id) initWithRes:(CPDBModelResource *)dbRes
{
    self = [super init];
    if (self)
    {
        dbResDownload = dbRes;
    }
    return self;
}
-(void)main
{
    @autoreleasepool 
    {
        [[[CPSystemEngine sharedInstance] dbManagement] insertResource:dbResDownload];
        [[[CPSystemEngine sharedInstance] dbManagement] initResources];
    }
}

@end
