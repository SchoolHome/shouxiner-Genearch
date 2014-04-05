//
//  BBBJQManager.h
//  teacher
//
//  Created by xxx on 14-3-27.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PalmUIManagement.h"

#import "ASIFormDataRequest.h"

@interface BBBJQManager : NSObject

@property(nonatomic,strong) NSArray *groupList;

@property(nonatomic,strong) NSArray *topicList;

+(BBBJQManager *)sharedInstace;

-(NSURL *)urlWithPath:(NSString *) path;

-(void)getGroupList;

-(void)getTopicInfoListWithGroupID:(NSNumber *)groupid
                                ts:(NSString *)ts
                            offset:(NSNumber *)offset
                              size:(NSNumber *)size;

-(void)praiseWithTopicID:(NSNumber *)topicid;

-(void)replyWithTopicID:(NSNumber *)topicid
                comment:(NSString *)comment
                    uid:(NSNumber *)replyto;

-(void)createTopicWithGroupID:(NSNumber *)groupid
                    topictype:(NSNumber *)topictype
                      subject:(NSNumber *)subject
                      content:(NSString *)content
                       attach:(NSArray *)attach;

@end
