#import <Foundation/Foundation.h>


/**
 * 用户信息数据
 */

typedef enum
{
    USER_DATA_CLASSIFY_SELF_HEADER = 1,
    USER_DATA_CLASSIFY_SELF_COUPLE = 2,
    USER_DATA_CLASSIFY_SELF_BABY = 3,
    USER_DATA_CLASSIFY_SELF_BG = 4,
    
    USER_DATA_CLASSIFY_HEADER = 5,
    USER_DATA_CLASSIFY_RECENT = 11,

    
}UserInfoDataClassify;

typedef enum
{
    USER_DATA_TYPE_IMG = 1,
}UserInfoDataType;

@interface CPDBModelUserInfoData : NSObject
{

    NSNumber *userInfoDataID_;//本地主键
    NSNumber *userInfoID_;//用户信息表主键
    NSNumber *dataClassify_;//数据分类，类似memo、头像、sns帐号等等
    NSNumber *dataType_;//数据类型，图片、音频、视频等等
    NSString *dataContent_;//数据内容
    NSNumber *resourceID_;//本地资源ID
    NSNumber *updateTime_;//数据更新的时间

    NSArray *additionList_;
}

@property (strong,nonatomic) NSNumber *userInfoDataID;
@property (strong,nonatomic) NSNumber *userInfoID;
@property (strong,nonatomic) NSNumber *dataClassify;
@property (strong,nonatomic) NSNumber *dataType;
@property (strong,nonatomic) NSString *dataContent;
@property (strong,nonatomic) NSNumber *resourceID;
@property (strong,nonatomic) NSNumber *updateTime;

@property (strong,nonatomic) NSArray *additionList;
@end
