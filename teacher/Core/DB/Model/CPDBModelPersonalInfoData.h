#import <Foundation/Foundation.h>


/**
 * 个人信息数据
 */
typedef enum
{
    DATA_CLASSIFY_SELF_HEADER = 1,
    DATA_CLASSIFY_SELF_COUPLE = 2,
    DATA_CLASSIFY_SELF_BABY = 3,
    DATA_CLASSIFY_SELF_BG = 4,
    
    DATA_CLASSIFY_HEADER = 5,

    DATA_CLASSIFY_RECENT = 11,//近况


}InfoDataClassify;

typedef enum
{
    DATA_TYPE_TEXT = 1,
    DATA_TYPE_AUDIO = 2,
    DATA_TYPE_IMG = 3,

}InfoDataType;
@interface CPDBModelPersonalInfoData : NSObject
{

    NSNumber *personalInfoDataID_;//本地主键
    NSNumber *personalInfoID_;//个人信息表主键
    NSNumber *dataClassify_;//数据分类，类似memo、头像、sns帐号等等
    NSNumber *dataType_;//数据类型，图片、音频、视频等等
    NSString *dataContent_;//数据内容
    NSNumber *resourceID_;//本地资源ID
    NSNumber *updateTime_;//数据更新的时间
    
    NSArray *additionList_;
}

@property (strong,nonatomic) NSNumber *personalInfoDataID;
@property (strong,nonatomic) NSNumber *personalInfoID;
@property (strong,nonatomic) NSNumber *dataClassify;
@property (strong,nonatomic) NSNumber *dataType;
@property (strong,nonatomic) NSString *dataContent;
@property (strong,nonatomic) NSNumber *resourceID;
@property (strong,nonatomic) NSNumber *updateTime;

@property (strong,nonatomic) NSArray *additionList;
@end
