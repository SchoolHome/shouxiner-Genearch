//
//  CPOperationReceiveYTZMessage.h
//  teacher
//
//  Created by ZhangQing on 14-7-21.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "CPOperation.h"

@interface CPOperationReceiveYTZMessage : CPOperation
{
    NSArray *YTZMsgs;
}

- (id) initWithMsgs:(NSArray *) receiveMsgs;
@end
