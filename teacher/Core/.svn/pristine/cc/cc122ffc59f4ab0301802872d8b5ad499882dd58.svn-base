#import <Foundation/Foundation.h>


/**
 * 用户信息表
 */

@interface CPPTModelUserInfo : NSObject
{
#if 0
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

    NSArray *dataList_;
#endif
    
    NSString *uName_;
    NSString *nickName_;
    NSString *icon_;
    NSNumber *gender_;
    NSNumber *lifeStatus_;
    NSString *regionNumber_;
    NSString *mobileNumber_;
    
    NSString *coupleAccount_;
    NSNumber *relationType_;
}

#if 0
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

@property (strong,nonatomic) NSArray *dataList;
#endif

@property (strong, nonatomic) NSString *uName;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSNumber *gender;
@property (strong, nonatomic) NSNumber *lifeStatus;
@property (strong, nonatomic) NSString *regionNumber;
@property (strong, nonatomic) NSString *mobileNumber;
@property (strong, nonatomic) NSString *coupleAccount;
@property (strong, nonatomic) NSNumber *relationType;

+ (CPPTModelUserInfo *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@end
