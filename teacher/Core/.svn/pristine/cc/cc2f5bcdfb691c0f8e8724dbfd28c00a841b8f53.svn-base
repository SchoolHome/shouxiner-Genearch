#import <Foundation/Foundation.h>


/**
 * 个人信息表
 */
typedef enum
{
    PERSONAL_LIFE_STATUS_DEFAULT = 1,//不告诉你
    PERSONAL_LIFE_STATUS_HAS_BABY = 6,//家有宝宝
    PERSONAL_LIFE_STATUS_COUPLE_MARRIED = 5,//夫妻
    PERSONAL_LIFE_STATUS_COUPLE = 4,//甜蜜情侣
    PERSONAL_LIFE_STATUS_CURSE = 3,//默默喜欢
    PERSONAL_LIFE_STATUS_SINGLE = 2//单身无敌
}PersonalLifeStatus;

typedef enum
{
    PERSONAL_RECENT_TYPE_TEXT  = 1,
    PERSONAL_RECENT_TYPE_AUDIO = 2,

}PersonalRecentType;
typedef enum
{
    PERSONAL_INFO_SEX_MALE = 1,
    PERSONAL_INFO_SEX_FEMALE = 2
}PersonalInfoSexType;
@interface CPUIModelPersonalInfo : NSObject
{

    NSNumber *personalInfoID_;//个人信息表主键,本地数据库
    NSNumber *serverID_;//服务器对应的ID
    NSNumber *updateTime_;//更新的时间,服务器请求对比时用到
    NSString *name_;//用户名
    NSString *nickName_;//昵称
    NSString *mobileNumber_;//手机号
    NSNumber *mobileIsBind_;//是否绑定手机号
    NSString *emailAddr_;//邮件地址
    NSNumber *emailIsBind_;//是否绑定邮件地址
    NSNumber *sex_;//性别
    NSString *birthday_;//生日
    NSNumber *height_;//身高
    NSNumber *weight_;//体重
    NSString *threeSizes_;//三围
    NSString *citys_;//呆过的城市
    NSString *anniversaryMeet_;//第一次认识纪念日
    NSString *anniversaryMarry_;//结婚纪念日
    NSString *anniversaryDating_;//第一次约会纪念日
    NSNumber *lifeStatus_;
    
    NSArray *babyList_;
    NSArray *dataList_;
    
    NSString *selfBgImgPath_;//背景图片路径
    NSString *selfHeaderImgPath_;//头像图片路径
    NSString *selfCoupleHeaderImgPath_;//couple的头像图片路径
    NSString *selfBabyHeaderImgPath_;//baby的头像图片路径

    NSInteger recentType_;//近况类型
    NSString *recentContent_;//近况的内容，如果是audio的话， 则是本地资源的路径
    NSNumber *recentUpdateTime_;//近况更新的时间
    NSNumber *singleTime_;//
    NSNumber *hasBaby_;//
}

@property (strong,nonatomic) NSNumber *personalInfoID;
@property (strong,nonatomic) NSNumber *serverID;
@property (strong,nonatomic) NSNumber *updateTime;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *nickName;
@property (strong,nonatomic) NSString *mobileNumber;
@property (strong,nonatomic) NSNumber *mobileIsBind;
@property (strong,nonatomic) NSString *emailAddr;
@property (strong,nonatomic) NSNumber *emailIsBind;
@property (strong,nonatomic) NSNumber *sex;
@property (strong,nonatomic) NSString *birthday;
@property (strong,nonatomic) NSNumber *height;
@property (strong,nonatomic) NSNumber *weight;
@property (strong,nonatomic) NSString *threeSizes;
@property (strong,nonatomic) NSString *citys;
@property (strong,nonatomic) NSString *anniversaryMeet;
@property (strong,nonatomic) NSString *anniversaryMarry;
@property (strong,nonatomic) NSString *anniversaryDating;
@property (strong,nonatomic) NSNumber *lifeStatus;
@property (strong,nonatomic) NSNumber *singleTime;
@property (strong,nonatomic) NSNumber *hasBaby;

@property (strong,nonatomic) NSArray *babyList;
@property (strong,nonatomic) NSArray *dataList;
@property (strong,nonatomic) NSString *selfBgImgPath;
@property (strong,nonatomic) NSString *selfHeaderImgPath;
@property (strong,nonatomic) NSString *selfCoupleHeaderImgPath;
@property (strong,nonatomic) NSString *selfBabyHeaderImgPath;
@property (assign,nonatomic) NSInteger recentType;
@property (strong,nonatomic) NSString *recentContent;
@property (strong,nonatomic) NSNumber *recentUpdateTime;
@end
