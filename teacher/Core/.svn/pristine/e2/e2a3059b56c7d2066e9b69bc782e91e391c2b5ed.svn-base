//
//  CPResManager.h
//  icouple
//
//  Created by yong wei on 12-3-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPDBModelResource.h"
#import "CPHttpEngineObserver.h"
//typedef enum ResourceMark
//{
//    RES_MARK_TAG_DEFAULT = 0,
//    RES_MARK_TAG_UPLOAD  = 1,
//    RES_MARK_TAG_DOWNLOAD= 2
//}ResMarkTag;

@interface CPResModel : NSObject
{
@private
    NSInteger resType_;
    NSNumber *resLocalID_;//资源的本地ID
    
}
@property (nonatomic,assign) NSInteger resType_;
@property (strong,nonatomic) NSNumber *resLocalID_;
@end

@class CPDBModelPersonalInfoData;
@interface CPResManager : NSObject<CPHttpEngineObserver>
{
    __strong NSMutableArray *downloadResArray;
    __strong NSMutableArray *uploadResArray;
    
    __strong NSMutableDictionary *downloadDictionary;
    __strong NSMutableDictionary *uploadDictionary;
    
    BOOL isExcuteResourceReq;
    NSString *videoPicName;
}
-(void)removeUploadResWithResID:(NSNumber *)resID;

-(void)uploadResourceOf:(NSNumber *)resID resrouceCategory:(NSNumber *)cate fromFile:(NSString *)filePath mimeType:(NSString *)mimeType;

-(void)clearResCachedData;

-(void)excuteResourceCached;
//用于初始化下载和上传的缓存列表
-(void)reloadDownloadCacheWithArray:(NSArray *)willDownArray;
-(void)reloadUploadCacheWithArray:(NSArray *)willUploadArray;

//其他管理器调用的api，资源管理器处理需要下载/上传的资源
-(void)downloadWithRes:(CPDBModelResource *)dbRes;
-(void)uploadWithRes:(CPDBModelResource *)dbRes up_data:(NSData *)uploadData;

//初始化队列之后，下载/上传资源开始的入口
-(void)downloadRes;
-(void)uploadRes;

//用于http请求之后回调方法的接口
-(void)downloadResWithID:(NSNumber *)localResID andResCode:(NSNumber *)resCode;
-(void)uploadResWithResID:(NSNumber *)localResID url:(NSString *)url;

-(CPDBModelResource *)getResPersonalDataWithCalssify:(NSInteger)classifyType;
-(void)addResourceByPersonalImgWithUrl:(NSString *)url andDataType:(NSNumber *)dataType;
-(NSNumber *)addResourceByRecentWithUrl:(NSString *)url andDataType:(NSNumber *)dataType;
-(NSNumber *)addResourceByRecentWithFilePath:(NSString *)filePath andDataType:(NSNumber *)dataType;
-(NSNumber *)addResourceByGroupMemHeaderWithServerUrl:(NSString *)serverUrl andGroupID:(NSNumber *)groupID;
-(NSNumber *)addResourceByTempHeaderWithServerUrl:(NSString *)serverUrl;
-(NSString *)getResourcePathWithPersonalData:(CPDBModelPersonalInfoData *)dbPersonalData;
-(NSString *)getResourcePathWithResID:(NSNumber *)resID;
-(NSString *)getResourcePathWithRes:(CPDBModelResource *)dbRes;
-(void)addResourceByUserImgWithUrl:(NSString *)url andDataType:(NSNumber *)dataType andUserID:(NSNumber *)userID;
-(NSNumber *)addResourceByUserRecentWithUrl:(NSString *)url andDataType:(NSNumber *)dataType andUserID:(NSNumber *)userID;
@end
