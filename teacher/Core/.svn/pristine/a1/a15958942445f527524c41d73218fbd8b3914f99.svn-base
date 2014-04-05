//
//  CPOperationHttpMsgSend.h
//  iCouple
//
//  Created by liangshuang on 10/12/12.
//
//

#import "CPOperation.h"

@class CPUIModelMessage;
@class CPUIModelMessageGroup;
@interface CPOperationHttpMsgSend : CPOperation
{
    CPUIModelMessage *uiMsg;
    CPUIModelMessageGroup *uiMsgGroup;
    
    NSInteger sendMsgType;
    NSNumber *sendMsgGroupID;
}
- (id) initWithMsg:(CPUIModelMessage *) sendMsg andMsgGroup:(CPUIModelMessageGroup *)msgGroup;

- (id) initWithMsg:(CPUIModelMessage *) sendMsg andMsgGroupID:(NSNumber *)msgGroupID;
@end
