//
//  CPOperationHttpMsgReSend.h
//  iCouple
//
//  Created by liangshuang on 10/13/12.
//
//
#import "CPOperation.h"
@class CPUIModelMessage;
@class CPUIModelMessageGroup;

@interface CPOperationHttpMsgReSend : CPOperation
{
    CPUIModelMessage *reSendMsg;
    CPUIModelMessageGroup *uiMsgGroup;
}
- (id) initWithMsg:(CPUIModelMessage *) uiMsg andMsgGroup:(CPUIModelMessageGroup *)msgGroup;
@end
