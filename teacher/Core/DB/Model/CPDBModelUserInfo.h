#import <Foundation/Foundation.h>


/**
 * 用户信息表
 */
typedef enum
{
    USER_RELATION_DEFAULT = 0,
    USER_RELATION_COMMON  = 1,
    USER_RELATION_CLOSED  = 2,
    USER_RELATION_LOVER   = 3,
    USER_RELATION_COUPLE  = 4,
    USER_RELATION_MARRIED = 5,
    USER_RELATION_COMMEND = 6,
    USER_RELATION_FANXER = 101,
    USER_RELATION_SYSTEM = 102,
    USER_RELATION_XIAOSHUANG = 103,
}RelationType;
@interface CPDBModelUserInfo : NSObject
{

    NSNumber *userInfoID_;//用户信息表主键,本地数据库
    NSNumber *serverID_;//服务器对应的ID
    NSNumber *updateTime_;//更新的时间,服务器请求对比时用到
    NSNumber *type_;//类型  好友  密友等等 RelationType
    NSString *name_;//用户名
    NSString *nickName_;//昵称
    NSString *mobileNumber_;//手机号
    NSNumber *mobileIsBind_;//是否绑定手机号
    NSString *emailAddr_;//邮件地址
    NSNumber *emailIsBind_;//是否绑定邮件地址
    NSNumber *sex_;//性别
    NSNumber *lifeStatus_;
    NSString *birthday_;//生日
    NSNumber *height_;//身高
    NSNumber *weight_;//体重
    NSString *threeSizes_;//三围
    NSString *citys_;//呆过的城市
    NSString *anniversaryMeet_;//第一次认识纪念日
    NSString *anniversaryMarry_;//结婚纪念日
    NSString *anniversaryDating_;//第一次约会纪念日
    NSString *babyName_;//宝宝姓名

    NSString *domain_;//后缀@192.168.50.0
    
    NSArray *dataList_;
    NSString *coupleAccount_;
    NSString *coupleNickName_;
    NSString *headerPath_;
    NSNumber *singleTime_;//
    NSNumber *hasBaby_;//
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
@property (strong,nonatomic) NSNumber *lifeStatus;
@property (strong,nonatomic) NSString *birthday;
@property (strong,nonatomic) NSNumber *height;
@property (strong,nonatomic) NSNumber *weight;
@property (strong,nonatomic) NSString *threeSizes;
@property (strong,nonatomic) NSString *citys;
@property (strong,nonatomic) NSString *anniversaryMeet;
@property (strong,nonatomic) NSString *anniversaryMarry;
@property (strong,nonatomic) NSString *anniversaryDating;
@property (strong,nonatomic) NSString *babyName;
@property (strong,nonatomic) NSString *domain;
@property (strong,nonatomic) NSArray *dataList;
@property (strong,nonatomic) NSString *coupleAccount;
@property (strong,nonatomic) NSString *coupleNickName;
@property (strong,nonatomic) NSString *headerPath;
@property (strong,nonatomic) NSNumber *singleTime;
@property (strong,nonatomic) NSNumber *hasBaby;
-(BOOL)isSysUser;

@end
