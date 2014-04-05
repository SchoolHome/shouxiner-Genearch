//
//  XMPPMessage+XMPPMessage_EXT.h
//  iCouple
//
//  Created by yl s on 12-4-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPPMessage.h"

@interface XMPPMessage (XMPPMessage_SYS)

- (BOOL)isSystemMessage;
- (BOOL)isSystemMessageWithBody;

@end
