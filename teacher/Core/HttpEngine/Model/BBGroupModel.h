//
//  BBGroupModel.h
//  teacher
//
//  Created by xxx on 14-4-1.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 group
 */
@interface BBGroupModel : NSObject
{

}

@property(nonatomic,strong) NSNumber *groupid;
@property(nonatomic,strong) NSNumber *membertype;
@property(nonatomic,strong) NSString *alias;
@property(nonatomic,strong) NSString *cname;
@property(nonatomic,strong) NSString *school;
@property(nonatomic,strong) NSNumber *banji;
@property(nonatomic,strong) NSNumber *nianji;
@property(nonatomic,strong) NSString *avatar;
@property(nonatomic,strong) NSNumber *grouptype;

+(BBGroupModel *)fromJson:(NSDictionary *)dict;

@end
