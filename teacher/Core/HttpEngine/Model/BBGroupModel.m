//
//  BBGroupModel.m
//  teacher
//
//  Created by xxx on 14-4-1.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBGroupModel.h"

@implementation BBGroupModel


+(BBGroupModel *)fromJson:(NSDictionary *)dict{

    if (dict) {
        BBGroupModel *gp = [[BBGroupModel alloc] init];
        
        gp.groupid = dict[@"groupid"];
        gp.membertype = dict[@"membertype"];
        gp.alias = dict[@"alias"];
        gp.cname = dict[@"cname"];
        gp.school = dict[@"school"];
        gp.banji = dict[@"banji"];
        gp.nianji = dict[@"nianji"];
        gp.avatar = dict[@"avatar"];
        gp.grouptype = dict[@"grouptype"];
        
        return gp;
    }
    return nil;
}

@end
