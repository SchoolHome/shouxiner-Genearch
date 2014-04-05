#import <Foundation/Foundation.h>


/**
 * 联系人
 */

@interface CPUIModelContact : NSObject
{

    NSNumber *contactID_;//主键,本地数据库
    NSNumber *abPersonID_;//本地通讯录对应的ID
    NSNumber *updateTime_;//更新的时间
    NSString *firstName_;//名字
    NSString *lastName_;//名字
    NSString *fullName_;//名字
    NSNumber *syncTime_;//同步的时间
    NSNumber *syncMark_;//同步的标记
    NSString *headerPhotoPath_;//头像的资源路径

    NSArray *contactWayList_;
}

@property (strong,nonatomic) NSNumber *contactID;
@property (strong,nonatomic) NSNumber *abPersonID;
@property (strong,nonatomic) NSNumber *updateTime;
@property (strong,nonatomic) NSString *firstName;
@property (strong,nonatomic) NSString *lastName;
@property (strong,nonatomic) NSString *fullName;
@property (strong,nonatomic) NSNumber *syncTime;
@property (strong,nonatomic) NSNumber *syncMark;
@property (strong,nonatomic) NSString *headerPhotoPath;

@property (strong,nonatomic) NSArray *contactWayList;
@end
