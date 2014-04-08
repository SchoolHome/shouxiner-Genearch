//
//  ClassOperation.h
//  teacher
//
//  Created by singlew on 14-3-16.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmOperation.h"
#import "BBGroupModel.h"
#import "BBTopicModel.h"
#import "BBNotifyModel.h"

typedef enum{
    kClassNotification,
    kGetGroupListData,
    kGetGroupTopic,
    kPostPraise,
    kPostComment,
    kGetNotiCount,
    kGetNotiList,
    kGetNotiWithTopicID,
}ClassData;


@interface ClassOperation : PalmOperation

-(ClassOperation *) initGroupList;
// 有指示
-(ClassOperation *) initNotiList : (int) timeStamp;
-(ClassOperation *) initGroupTopic : (int) groupID withTimeStamp : (int) timeStamp withOffset : (int) offset withLimit : (int) limit;

// 点赞
-(ClassOperation *) initPraise : (long long) topicID;
// 发表评论
-(ClassOperation *) initComment : (NSString *) commentContent withReplyToUid : (int) uid withTopicID : (long long) topicID;

// 获取新消息数量
-(ClassOperation *) initGetNotiCount;
// 获取新消息列
-(ClassOperation *) initGetNotiList : (int) offset withLimit : (int) limit;

// 根据topicID获取
-(ClassOperation *) initGetNotiWithTopicID : (long long) topicID;

@end
