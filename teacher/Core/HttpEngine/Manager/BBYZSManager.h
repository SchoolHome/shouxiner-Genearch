//
//  BBYZSManager.h
//  teacher
//
//  Created by xxx on 14-3-27.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PalmUIManagement.h"
#import "ASIFormDataRequest.h"

@interface BBYZSManager : NSObject
{

}

+(BBYZSManager *)sharedInstace;
-(NSURL *)urlWithPath:(NSString *) path;

// 列表
-(void)OAListWithTS:(NSString *)ts;
// 转发
-(void)OAForwardWithOAID:(NSString *)oaid
                 groupid:(NSString *)groupid
                 message:(NSString *)message;
@end
