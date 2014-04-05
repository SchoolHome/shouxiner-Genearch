//
//  UserInforModel.h
//  iCouple
//
//  Created by yong wei on 12-4-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUIModelUserInfo.h"

typedef enum {
    // 普通状态，可以发送添加消息
    UserStateNormal,
    // Loading状态
    UserStateLoading,
    // 发送添加消息成功状态
    UserStateSucceed,
    // 发送添加消息成功－密友
    UserStateSucceedForCloseFriend,
    // 发送信息成功并且无文字状态
    UserStateSucceedNoText,
    // 发送添加消息失败状态，可以再次发送添加消息
    UserStateFail
} UIUserInforState;

@interface UserInforModel : NSObject
// 主键
@property (strong,nonatomic) NSNumber *userInfoID;
// 用户名
@property (strong,nonatomic) NSString *userName;
// 昵称
@property (strong,nonatomic) NSString *nickName;
// 全名
@property (strong,nonatomic) NSString *fullName;
// 是否有喜欢
@property (nonatomic) BOOL hasLover;
// 是否有couple
@property (nonatomic) BOOL hasCouple;
// 搜索的文本
@property (strong,nonatomic) NSString *searchText;
// 拆分名字为单字
@property (strong,nonatomic) NSMutableArray *searchTextArray;
// 单字所对应的拼音
@property (strong,nonatomic) NSMutableArray *searchTextPinyinArray;
@property (strong,nonatomic) NSMutableString *searchTextQuanPinWithInt;
@property (strong,nonatomic) NSMutableString *searchTextQuanPinWithChar;
// 手机号
@property (nonatomic,strong) NSString * telPhoneNumber;
// 性别
@property (nonatomic,strong) NSNumber *sex;
// 是否有宝宝
@property (nonatomic,strong) NSNumber *hasBaby;
// 宝宝头像路径
@property (nonatomic,strong) NSString *babyfilePath;

// 显示添加成功或失败的文字，控制timer控件3秒消除文字
// 设置为1时，开始计时
@property (nonatomic) NSUInteger descriptionState;

// 用户信息状态
@property (nonatomic) UIUserInforState userInforState;

// 0 - 好友数据
// 1 - 密友数据
@property (nonatomic) NSUInteger dataType;

// 用户头像路径
@property (strong,nonatomic) NSString * headerPath;
@property (strong,nonatomic) NSString * coupleAccount;
-(id) initUserInfor;
-(void) startTimer;
@end
