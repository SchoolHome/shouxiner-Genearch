#import <Foundation/Foundation.h>


/**
 * 用户信息表
 */
/*
1=普通朋友
2=密友
3=喜欢
4=情侣couple
5=夫妇couple
*/
typedef enum
{
    USER_RELATION_TYPE_DEFAULT = 0,
    USER_RELATION_TYPE_COMMON  = 1,
    USER_RELATION_TYPE_CLOSED  = 2,
    USER_RELATION_TYPE_LOVER   = 3,
    USER_RELATION_TYPE_COUPLE  = 4,
    USER_RELATION_TYPE_MARRIED = 5,
    USER_RELATION_TYPE_COMMEND = 6,
    USER_MANAGER_FANXER = 101,
    USER_MANAGER_SYSTEM = 102,
    USER_MANAGER_XIAOSHUANG = 103,
    USER_MANAGER_BUTTON = 104
}UserRelationType;

typedef enum
{
    USER_LIFE_STATUS_DEFAULT = 1,//不告诉你
    USER_LIFE_STATUS_HAS_BABY = 6,//家有宝宝
    USER_LIFE_STATUS_COUPLE_MARRIED = 5,//夫妻
    USER_LIFE_STATUS_COUPLE = 4,//甜蜜情侣
    USER_LIFE_STATUS_CURSE = 3,//默默喜欢
    USER_LIFE_STATUS_SINGLE = 2//单身无敌
}UserLifeStatus;

typedef enum
{
    USER_RECENT_TYPE_TEXT  = 1,
    USER_RECENT_TYPE_AUDIO = 2,
    
}UserRecentType;
typedef enum
{
    USER_INFO_SEX_MALE = 1,
    USER_INFO_SEX_FEMALE = 2
}UserInfoSexType;


@interface CPUIModelUserInfo : NSObject
{

    NSNumber *userInfoID_;//用户信息表主键,本地数据库
    NSNumber *serverID_;//服务器对应的ID
    NSNumber *updateTime_;//更新的时间,服务器请求对比时用到
    NSNumber *type_;//类型  好友  密友等等
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
    NSString *babyName_;//宝宝姓名
    NSNumber *lifeStatus_;
    NSString *domain_;
    NSString *fullName_;//姓名
    
    NSString *coupleAccount_;//couple的帐号
    CPUIModelUserInfo *coupleUserInfo_;//couple对应的model
    
    NSString *headerPath_;
    NSArray *dataList_;
    
    NSArray *searchTextArray_;//字符的数组
    NSArray *searchTextPinyinArray_;//全拼的数组
    NSString *searchTextQuanPinWithChar_;//全拼的字符串
    NSString *searchTextQuanPinWithInt_;//全拼unicode数值的字符串
    
    NSString *selfBgImgPath_;//背景图片路径
    NSString *selfHeaderImgPath_;//头像图片路径
    NSString *selfCoupleHeaderImgPath_;//couple的头像图片路径
    NSString *selfBabyHeaderImgPath_;//baby的头像图片路径

    NSInteger recentType_;//近况类型
    NSString *recentContent_;//近况的内容，如果是audio的话， 则是本地资源的路径
    NSNumber *recentUpdateTime_;//近况更新的时间
    
    NSString *coupleNickName_;
    NSNumber *singleTime_;//
    NSNumber *hasBaby_;//是否隐藏baby，YES说明没有宝宝；
}

@property (strong,nonatomic) NSNumber *userInfoID;
@property (strong,nonatomic) NSNumber *serverID;
@property (strong,nonatomic) NSNumber *updateTime;
@property (strong,nonatomic) NSNumber *type;
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
@property (strong,nonatomic) NSString *babyName;
@property (strong,nonatomic) NSNumber *lifeStatus;
@property (strong,nonatomic) NSString *domain;

@property (strong,nonatomic) NSString *fullName;
@property (strong,nonatomic) NSString *coupleAccount;
@property (strong,nonatomic) CPUIModelUserInfo *coupleUserInfo;
@property (strong,nonatomic) NSString *headerPath;
@property (strong,nonatomic) NSArray *dataList;

@property (strong,nonatomic) NSArray *searchTextArray;
@property (strong,nonatomic) NSArray *searchTextPinyinArray;
@property (strong,nonatomic) NSString *searchTextQuanPinWithChar;
@property (strong,nonatomic) NSString *searchTextQuanPinWithInt;

@property (strong,nonatomic) NSString *selfBgImgPath;
@property (strong,nonatomic) NSString *selfHeaderImgPath;
@property (strong,nonatomic) NSString *selfCoupleHeaderImgPath;
@property (strong,nonatomic) NSString *selfBabyHeaderImgPath;

@property (assign,nonatomic) NSInteger recentType;
@property (strong,nonatomic) NSString *recentContent;
@property (strong,nonatomic) NSNumber *recentUpdateTime;

@property (strong,nonatomic) NSString *coupleNickName;
@property (strong,nonatomic) NSNumber *singleTime;
@property (strong,nonatomic) NSNumber *hasBaby;

-(BOOL)hasCouple;//是否有Couple
-(BOOL)hasLover;//是否有喜欢

-(void)initSearchData;
@end
