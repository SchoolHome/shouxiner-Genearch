//
//  BBOADetailModel.h
//  teacher
//
//  Created by mtf on 14-4-15.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBOADetailModel : NSObject
{

}

@property(nonatomic,strong) NSNumber *attach_num;
@property(nonatomic,strong) NSString *content;
@property(nonatomic,strong) NSArray *images;
@property(nonatomic,strong) NSNumber *oaid;
@property(nonatomic,strong) NSString *sender_avatar;
@property(nonatomic,strong) NSNumber *sender_uid;
@property(nonatomic,strong) NSString *sender_username;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSNumber *ts;
@property(nonatomic,strong) NSString *url;

+(BBOADetailModel *)fromJson:(NSDictionary *)dict;

@end
