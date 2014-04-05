//
//  CPOperationMsgSend.h
//  iCouple
//
//  Created by yong wei on 12-4-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"

 


@class CPUIModelMessage;
@class CPUIModelMessageGroup;
@interface CPOperationMsgSend : CPOperation
{
    CPUIModelMessage *uiMsg;
    CPUIModelMessageGroup *uiMsgGroup;
    
    NSInteger sendMsgType;
    NSNumber *sendMsgGroupID;
}
- (id) initWithMsg:(CPUIModelMessage *) sendMsg andMsgGroup:(CPUIModelMessageGroup *)msgGroup;

- (id) initWithMsg:(CPUIModelMessage *) sendMsg andMsgGroupID:(NSNumber *)msgGroupID;
@end
