//
//  CPUIModelRegisterInfo.h
//  iCouple
//
//  Created by yong wei on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    REG_INFO_SEX_MALE = 1,
    REG_INFO_SEX_FEMALE = 2
}RegisterInfoSexType;

typedef enum
{
    LIFE_STATUS_DEFAULT = 1,//不告诉你
    LIFE_STATUS_HAS_BABY = 6,//家有宝宝
    LIFE_STATUS_COUPLE_MARRIED = 5,//夫妻
    LIFE_STATUS_COUPLE = 4,//甜蜜情侣
    LIFE_STATUS_CURSE = 3,//默默喜欢
    LIFE_STATUS_SINGLE = 2//单身无敌
}LifeStatus;
@interface CPUIModelRegisterInfo : NSObject
{
    NSString *accountName;//登录帐号
    NSString *password;//密码
    NSInteger sex;//参照上面的RegisterInfoSexType定义
    NSData *selfBgImgData;//自己的背景图片
    NSData *selfImgData;//自己的图片
    NSData *coupleImgData;//couple的图片
    NSData *babyImgData;//宝宝的图片
    
    NSString *mobileNumber;//手机号
    NSString *regionNumber;//区号
    
    NSString *nickName;//昵称
    NSInteger lifeStatus;//生活状态，参照上面的LifeStyle
}

@property (nonatomic,strong) NSString *accountName;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,strong) NSData *selfBgImgData;
@property (nonatomic,strong) NSData *selfImgData;
@property (nonatomic,strong) NSData *coupleImgData;
@property (nonatomic,strong) NSData *babyImgData;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,assign) NSInteger lifeStatus;
@property (nonatomic,strong) NSString *mobileNumber;
@property (nonatomic,strong) NSString *regionNumber;
@end
