//
//  BBOADetailModel.m
//  teacher
//
//  Created by mtf on 14-4-15.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBOADetailModel.h"

@implementation BBOADetailModel


+(BBOADetailModel *)fromJson:(NSDictionary *)dict{
    
    if (dict) {
        
        BBOADetailModel *dt = [[BBOADetailModel alloc] init];
        
        dt.attach_num = dict[@"attach_num"];
        dt.content = dict[@"content"];
        
        if (dict[@"images"]&&[dict[@"images"] isKindOfClass:[NSArray class]]) {
            dt.images = dict[@"images"];
        }
        
        dt.oaid = dict[@"oaid"];
        
        if (dict[@"sender_avatar"]&&![dict[@"sender_avatar"] isKindOfClass:[NSNull class]]) {
            dt.sender_avatar = dict[@"sender_avatar"];
        }
        
        dt.sender_uid = dict[@"sender_uid"];
        dt.sender_username = dict[@"sender_username"];
        dt.title = dict[@"title"];
        dt.ts = dict[@"ts"];
        dt.url = dict[@"url"];
        return dt;
    }
    return nil;
}

@end
