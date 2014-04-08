//
//  PalmUIManagement.h
//  teacher
//
//  Created by singlew on 14-3-7.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PalmNetWorkService.h"

#define TRANSFERVALUE @"TransferValue"
#define TRANSFERVCFROMCLASS @"TransferFromVCClass"
#define TRANSFERVCTOCLASS @"TransferToVCClass"

@interface PalmUIManagement : NSObject

+(PalmUIManagement *) sharedInstance;
// 客户端页面间传值KVO
@property(nonatomic,strong) NSDictionary *transferDic;
@property(nonatomic,strong) NSDictionary *userProfile;
@property(nonatomic,strong) NSDictionary *userContacts;
@property(nonatomic,strong) NSDictionary *userCredits;
@property(nonatomic,strong) NSDictionary *userGroupList;
@property(nonatomic,strong) NSDictionary *updateUserHeader;
@property(nonatomic,strong) NSDictionary *updateUserHeaderResult;

@property(nonatomic,strong) NSDictionary *checkVersion;
// 有指示
@property(nonatomic,strong) NSDictionary *notiList;
// 班级列表
@property(nonatomic,strong) NSArray *groupList;
// 班级Topic
@property(nonatomic,strong) NSDictionary *groupTopic;
// 点赞
@property(nonatomic,strong) NSDictionary *praiseResult;
// 发表评论
@property(nonatomic,strong) NSDictionary *commentResult;

// 新消息数量
@property(nonatomic,strong) NSDictionary *notifyCount;
// 新消息列表
@property(nonatomic,strong) NSArray *notifyList;

@property(nonatomic,strong) NSArray *groupTopicList;
// 上传图片结果
@property(nonatomic,strong) NSDictionary *updateImageResult;
// 发表Topic结果
@property(nonatomic,strong) NSDictionary *topicResult;

@property(nonatomic,strong) NSHTTPCookie *php;
@property(nonatomic,strong) NSHTTPCookie *suid;
@property(nonatomic,strong) NSString *imServerIP;

// 获取用户信息
-(void) getUserProfile;
// 获取用户通讯录
-(void) getuserContacts;
// 获取教师得分
-(void) getUserCredits;
// 获取班级信息
-(void) getUserGroupList;
// 更新用户头像
-(void) updateUserHeader : (NSData *) imageData;
-(void) updateuserHeaderResult : (NSString *) urlPath;

// 获取有指示
-(void) getNotiData : (int) timeStamp;
// 获取班级列表
-(void) getGroupList;
// 获取班级Topic
-(void) getGroupTopic : (int) groupID withTimeStamp : (int) timeStamp withOffset : (int) offset withLimit : (int) limit;
// 点赞
-(void) postPraise : (long long) topicID;
// 发表评论
-(void) postComment : (NSString *) commentContent withReplyToUid : (int) uid withTopicID : (long long) topicID;

// 获取新消息数量
-(void) getNotiCount;
// 获取新消息列
-(void) getNotiList : (int) offset withLimit : (int) limit;

// 上传图片
-(void) updateUserImageFile : (NSData *) imageData withGroupID : (int) groupID;
// 发表Topic
-(void) postTopic : (int) groupid withTopicType : (int) topicType withSubject : (int) subject withTitle : (NSString *) title
                            withContent : (NSString *) content withAttach : (NSString *) attach;

-(void) postCheckVersion;
@end
