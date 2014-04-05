//
//  CPOperation.h
//  icouple
//
//  Created by yong wei on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    SEND_MSG_TYPE_DEFAULT = 0,
    SEND_MSG_TYPE_ALARMED = 1,
    
}SendMsgType;
@interface CPOperation : NSOperation

@end
