#import <Foundation/Foundation.h>


/**
 * 个人信息数据
 */

@interface CPPTModelPersonalInfoData : NSObject
{

    NSNumber *personalInfoDataID_;//本地主键
    NSNumber *personalInfoID_;//个人信息表主键
    NSNumber *dataClassify_;//数据分类，类似memo、头像、sns帐号等等
    NSNumber *dataType_;//数据类型，图片、音频、视频等等
    NSString *dataContent_;//数据内容
    NSNumber *resourceID_;//本地资源ID

    NSArray *additionList_;
}

@property (strong,nonatomic) NSNumber *personalInfoDataID;
@property (strong,nonatomic) NSNumber *personalInfoID;
@property (strong,nonatomic) NSNumber *dataClassify;
@property (strong,nonatomic) NSNumber *dataType;
@property (strong,nonatomic) NSString *dataContent;
@property (strong,nonatomic) NSNumber *resourceID;

@property (strong,nonatomic) NSArray *additionList;
@end
