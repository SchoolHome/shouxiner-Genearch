//
//  PalmNetWorkService.h
//  teacher
//
//  Created by singlew on 14-3-7.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#define maxQueueCount 1
#import "PalmHttpEngine.h"
#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
#import "PalmOperation.h"

@interface PalmNetWorkService : PalmHttpEngine
@property(nonatomic,strong) ASINetworkQueue *uiBusinessQueue;

+(PalmNetWorkService *) sharedInstance;

// 封装网络请求的Operation
-(void) networkEngine : (PalmOperation *)operation;
// 开始网络请求的Operation
-(void) startAsynchronous : (NSOperation *) request;
-(void) canelHttpRequestFrom : (id) clazz;
@end
