#import "CPDBModelMessage.h"

/**
 * 消息表
 */

@implementation CPDBModelMessage

@synthesize msgID = msgID_;
@synthesize msgGroupID = msgGroupID_;
@synthesize msgSenderID = msgSenderID_;
@synthesize msgGroupServerID = msgGroupServerID_;
@synthesize mobile = mobile_;
@synthesize userID = userID_;
@synthesize flag = flag_;
@synthesize sendState = sendState_;
@synthesize date = date_;
@synthesize isReaded = isReaded_;
@synthesize msgText = msgText_;
@synthesize contentType = contentType_;
@synthesize locationInfo = locationInfo_;
@synthesize attachResID = attachResID_;
@synthesize magicMsgID = magicMsgID_;
@synthesize petMsgID = petMsgID_;
@synthesize bodyContent = bodyContent_;
@synthesize uuidAsk = uuidAsk_;
@synthesize msgOwnerName = msgOwnerName_;

-(NSComparisonResult) orderMsgWithDate:(CPDBModelMessage *)userMsg
{
    return [self.date compare:userMsg.date];
}

@end

