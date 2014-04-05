#import <Foundation/Foundation.h>


/**
 * 资源
 */
typedef enum 
{
    MARK_DEFAULT = 1,
    MARK_DOWNLOAD = 2,
    MARK_UPLOAD = 3,
    MARK_PRE_DOWNLOAD = 4,//待下载
    MARK_PRE_UPLOAD = 5,//待上传
}RESOURCE_MARK_TYPE;
typedef enum
{
    RESOURCE_FILE_CP_TYPE_DEFAULT = 0,
    RESOURCE_FILE_CP_TYPE_SELF_HEADER = 1,
    RESOURCE_FILE_CP_TYPE_SELF_COUPLE = 2,
    RESOURCE_FILE_CP_TYPE_SELF_BABY = 3,
    RESOURCE_FILE_CP_TYPE_SELF_BG = 4,

    RESOURCE_FILE_CP_TYPE_HEADER = 5,
    RESOURCE_FILE_CP_TYPE_MSG = 6,
    RESOURCE_FILE_CP_TYPE_COUPLE = 7,
    
    RESOURCE_FILE_CP_TYPE_SELF_RECENT = 101,

    RESOURCE_FILE_CP_TYPE_GROUPP_MEM_HEADER = 201,
    RESOURCE_FILE_CP_TYPE_TEMP_IMG = 202,
} RESOURCE_FILE_CP_TYPE;//关联的业务类型

typedef enum
{
    RESOURCE_FILE_TYPE_DEFAULT = 0,
    
    RESOURCE_FILE_TYPE_SELF_HEADER = 1,
    RESOURCE_FILE_TYPE_SELF_COUPLE = 2,
    RESOURCE_FILE_TYPE_SELF_BABY = 3,
    RESOURCE_FILE_TYPE_SELF_BG = 4,
    
    RESOURCE_FILE_TYPE_MSG_IMG = 5,
    RESOURCE_FILE_TYPE_MSG_AUDIO = 6,
    RESOURCE_FILE_TYPE_MSG_VIDEO = 7,
    RESOURCE_FILE_TYPE_MSG_OTHER = 8,

    RESOURCE_FILE_GROUP_MSG_IMG = 9,
    RESOURCE_FILE_GROUP_MSG_AUDIO = 10,
    RESOURCE_FILE_GROUP_MSG_VIDEO = 11,
    RESOURCE_FILE_GROUP_MSG_OTHER = 12,

    RESOURCE_FILE_TYPE_IMG = 50,

    RESOURCE_FILE_TYPE_SELF_RECENT = 101,
    
}ResourceType;//资源的类型，用于上传资源时候用到
@interface CPDBModelResource : NSObject
{

    NSNumber *resID_;//主键,本地数据库
    NSString *serverUrl_;//服务器对应的Url
    NSNumber *createTime_;//创建的时间
    NSString *fileName_;//文件名字
    NSString *filePrefix_;//文件前缀
    NSNumber *type_;//资源类型 图片，音频，视频 等等
    NSString *mimeType_;//文件类型的描述
    NSNumber *mark_;//标记
    NSNumber *objID_;//关联的业务ID
    NSNumber *objType_;//关联的业务类型
    NSNumber *mediaTime_;//多媒体时长s
    NSNumber *fileSize_;//文件的大小k
}

@property (strong,nonatomic) NSNumber *resID;
@property (strong,nonatomic) NSString *serverUrl;
@property (strong,nonatomic) NSNumber *createTime;
@property (strong,nonatomic) NSString *fileName;
@property (strong,nonatomic) NSString *filePrefix;
@property (strong,nonatomic) NSNumber *type;
@property (strong,nonatomic) NSString *mimeType;
@property (strong,nonatomic) NSNumber *mark;
@property (strong,nonatomic) NSNumber *objID;
@property (strong,nonatomic) NSNumber *objType;
@property (strong,nonatomic) NSNumber *mediaTime;
@property (strong,nonatomic) NSNumber *fileSize;
-(NSString *)filePrefixPath;
-(BOOL)isVideoMsg;
-(BOOL)isAudioMsg;
-(BOOL)isImgMsg;
-(BOOL)isMarkDefault;
@end
