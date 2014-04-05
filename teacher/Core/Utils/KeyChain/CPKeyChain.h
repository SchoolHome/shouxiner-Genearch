//
//  CPKeyChain.h
//  iCouple
//
//  Created by yong wei on 12-7-18.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface CPKeyChain : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end
