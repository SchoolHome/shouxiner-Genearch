#import <Foundation/Foundation.h>


/**
 * 个人信息表
 */

@interface CPPTModelPersonalInfo : NSObject
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

    NSArray *babyList_;
    NSArray *dataList_;
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

@property (strong,nonatomic) NSArray *babyList;
@property (strong,nonatomic) NSArray *dataList;
@end
