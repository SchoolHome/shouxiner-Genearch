//
//  BBNotifyModel.h
//  teacher
//
//  Created by xxx on 14-4-3.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBNotifyModel : NSObject

{
    
}

@property(nonatomic,strong) NSNumber *ts;
@property(nonatomic,strong) NSNumber *mid;
@property(nonatomic,strong) NSNumber *sender;
@property(nonatomic,strong) NSString *sender_name;
@property(nonatomic,strong) NSString *sender_avatar;
@property(nonatomic,strong) NSNumber *topicid;
@property(nonatomic,strong) NSString *topic_title;
@property(nonatomic,strong) NSString *type;

+(BBNotifyModel *)fromJson:(NSDictionary *)dict;
@end
