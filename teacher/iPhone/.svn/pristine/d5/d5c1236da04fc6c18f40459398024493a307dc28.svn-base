//
//  MessageCellFactory.h
//  iCouple
//
//  Created by yong wei on 12-5-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatInforCellBase.h"
#import "CellTypeHeader.h"

@interface MessageCellFactory : NSObject

+(MessageCellFactory *) sharedInstance;

// messageCell工厂
-(ChatInforCellBase *) createMessageCellFactory : (MessageCellType) messageType isBelongMe : (BOOL) belongMe isGroupMessage : (BOOL) isGroup withKey : (NSString *) key;

@end
