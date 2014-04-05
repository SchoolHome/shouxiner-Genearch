#import <Foundation/Foundation.h>


/**
 * 宝宝信息数据
 */

@interface CPUIModelBabyInfoData : NSObject
{

    NSNumber *babyInfoDataID_;//本地主键
    NSNumber *userInfoID_;//用户信息表主键
    NSNumber *name_;//姓名
    NSNumber *sex_;//性别
    NSNumber *headerResID_;//头像ID
    NSNumber *birthday_;//生日

}

@property (strong,nonatomic) NSNumber *babyInfoDataID;
@property (strong,nonatomic) NSNumber *userInfoID;
@property (strong,nonatomic) NSNumber *name;
@property (strong,nonatomic) NSNumber *sex;
@property (strong,nonatomic) NSNumber *headerResID;
@property (strong,nonatomic) NSNumber *birthday;

@end
