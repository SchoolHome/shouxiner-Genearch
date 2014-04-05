//
//  BBYZSManager.m
//  teacher
//
//  Created by xxx on 14-3-27.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBYZSManager.h"

#define K_HOST_NAME_OF_BB_SERVER      @"http://115.29.224.151"

@implementation BBYZSManager

+(BBYZSManager *)sharedInstace{
    static BBYZSManager *sharedYZSInstance = nil;
    if (sharedYZSInstance == nil){
        sharedYZSInstance = [[BBYZSManager alloc] init];
    }
    return sharedYZSInstance;
}

-(id)init{
    if (self = [super init]) {
        //
    }
    return self;
}

-(NSMutableArray *)getCookiesArray{
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:[PalmUIManagement sharedInstance].suid];
    [arr addObject:[PalmUIManagement sharedInstance].php];
    
    return arr;
}

-(NSString *)urlWithPath:(NSString *) path{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",K_HOST_NAME_OF_BB_SERVER,path];
    return [NSURL URLWithString:urlString];
}


// 列表
-(void)OAListWithTS:(NSString *)ts{
    

    
}


// 转发
-(void)OAForwardWithOAID:(NSString *)oaid
                 groupid:(NSString *)groupid
                 message:(NSString *)message{


}

@end
